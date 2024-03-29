<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Shape Utils Demo</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
		<style>
			* {
				padding: 0;
			}
		</style>
	</head>
	<body>
		<script type="module">
			import * as THREE from './libs/three.module.js';
            import { OrbitControls } from './libs/controls/OrbitControls.js'


			let container;
			let camera, scene, renderer;
            let controls


			init();
			animate();
            initHelper()


			function init() {
                // 容器
				container = document.createElement( 'div' );
				document.body.appendChild( container );

				// 创建相机
				camera = new THREE.PerspectiveCamera( 70, window.innerWidth / window.innerHeight, 1, 10000 );
                camera.position.set( 0, 20, 100 )

				// 创建场景
				scene = new THREE.Scene();
				scene.background = new THREE.Color( 0xf0f0f0 );

				// 创建光
				const light = new THREE.DirectionalLight( 0xff0000, 1 );
				light.position.set( 1, 1, 1 ).normalize();
				scene.add( light );

				// 创建几何
				function createCube() {
					const geometry = new THREE.BoxGeometry( 200, 200, 200 );
					const material = new THREE.MeshLambertMaterial( { color:  0xff00ff } )
					const object = new THREE.Mesh( geometry,  material );
					return object
				}

				const cube1 = createCube()
				scene.add(cube1)

                // 使用 shapeUtils 创建物体

                


				renderer = new THREE.WebGLRenderer();
				renderer.setPixelRatio( window.devicePixelRatio );
				renderer.setSize( window.innerWidth, window.innerHeight );
				container.appendChild( renderer.domElement );
                controls = new OrbitControls( camera, renderer.domElement );

			}


			function animate() {
				requestAnimationFrame( animate );
				render();
			}

			function render() {
				camera.lookAt( scene.position );
				camera.updateMatrixWorld();
                controls.update();
				renderer.render( scene, camera );
			}

            function initHelper () {
                const size = 10;
                const divisions = 10;
                const gridHelper = new THREE.GridHelper( size, divisions );
                scene.add( gridHelper );
            }

		</script>

	</body>
</html>
