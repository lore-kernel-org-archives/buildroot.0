From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Aug 2014 23:34:50 +0200
Subject: [Buildroot] [git commit] package/libwebsockets: fix static link
Message-ID: <20140830214252.7477B9D59A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ddffb0e1a368fbac9c85005202dcc014635d2b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- disable shared object build when BR2_PREFER_STATIC_LIB is set

Fixes:
  http://autobuild.buildroot.net/results/0a9/0a9f0c3c101550e73f7100f2b88a88c1f2bbad95/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...le-shared-library-build-when-BUILD_SHARED.patch |   86 ++++++++++++++++++++
 1 files changed, 86 insertions(+), 0 deletions(-)

diff --git a/package/libwebsockets/libwebsockets-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch b/package/libwebsockets/libwebsockets-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
new file mode 100644
index 0000000..7aa03d4
--- /dev/null
+++ b/package/libwebsockets/libwebsockets-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
@@ -0,0 +1,86 @@
+From 990835b15e3713e6c34d64b4bed8e55dcca6e6e2 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sat, 30 Aug 2014 00:40:03 +0200
+Subject: [PATCH 2/2] cmake: disable shared library build when
+ BUILD_SHARED_LIBS is off
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ CMakeLists.txt | 19 +++++++++++++------
+ 1 file changed, 13 insertions(+), 6 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 72391b0..8f28680 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -320,14 +320,19 @@ source_group("Sources"          FILES ${SOURCES})
+ #
+ # Create the lib.
+ #
++set(_libs_websockets websockets)
+ add_library(websockets STATIC
+ 			${HDR_PRIVATE}
+ 			${HDR_PUBLIC}
+ 			${SOURCES})
++
++if(BUILD_SHARED_LIBS)
++list(APPEND _libs_websockets websockets_shared)
+ add_library(websockets_shared SHARED
+ 			${HDR_PRIVATE}
+ 			${HDR_PUBLIC}
+ 			${SOURCES})
++endif()
+ 
+ if (WIN32)
+ 	# On Windows libs have the same file ending (.lib)
+@@ -348,15 +353,17 @@ endif(WIN32)
+ 
+ # We want the shared lib to be named "libwebsockets"
+ # not "libwebsocket_shared".
++if(BUILD_SHARED_LIBS)
+ set_target_properties(websockets_shared
+-		PROPERTIES 
++		PROPERTIES
+ 		OUTPUT_NAME websockets)
++endif()
+ 
+ # Set the so version of the lib.
+ # Equivalent to LDFLAGS=-version-info x:x:x
+ if(CMAKE_COMPILER_IS_GNUCC OR CMAKE_COMPILER_IS_GNUCXX)
+-	foreach(lib websockets websockets_shared)
+-		set_target_properties(${lib} 
++	foreach(lib ${_libs_websockets})
++		set_target_properties(${lib}
+ 			PROPERTIES
+ 			SOVERSION ${SOVERSION})
+ 	endforeach()
+@@ -408,7 +415,7 @@ if (NOT WITHOUT_EXTENSIONS)
+ 	endif()
+ 
+ 	# Make sure ZLib is compiled before the libs.
+-	foreach (lib websockets websockets_shared)
++	foreach (lib ${_libs_websockets})
+ 		add_dependencies(${lib} ZLIB)
+ 	endforeach()
+ 
+@@ -462,7 +469,7 @@ if (UNIX)
+ endif()
+ 
+ # Setup the linking for all libs.
+-foreach (lib websockets websockets_shared)
++foreach (lib ${_libs_websockets})
+ 	target_link_libraries(${lib} ${LIB_LIST})
+ endforeach()
+ 
+@@ -727,7 +734,7 @@ install(FILES ${HDR_PUBLIC}
+ set(CPACK_COMPONENT_HEADERS_DISPLAY_NAME "Header files")
+ 
+ # Install libs.
+-install(TARGETS websockets websockets_shared
++install(TARGETS ${_libs_websockets}
+ 		LIBRARY DESTINATION lib${LIB_SUFFIX}
+ 		ARCHIVE DESTINATION lib${LIB_SUFFIX}
+ 		COMPONENT libraries)
+-- 
+2.1.0
+
