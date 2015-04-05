From: Sagaert Johan <sagaert.johan@proximus.be>
Date: Mon,  6 Apr 2015 01:52:55 +0200
Subject: [Buildroot] [PATCH 1/1] libwebsockets : bump version to
	v1.4-chrome43-firefox-36
Message-ID: <1428277975-14983-1-git-send-email-sagaert.johan@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dropped upstream patch 0001
renamed patch 0002 -> 0001
added hash
details : https://github.com/warmcat/libwebsockets/blob/master/changelog

Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
---
 ...le-shared-library-build-when-BUILD_SHARED.patch | 107 +++++++++++++++++++++
 .../0001-cmake-set-the-project-language.patch      |  34 -------
 ...le-shared-library-build-when-BUILD_SHARED.patch | 107 ---------------------
 package/libwebsockets/libwebsockets.hash           |   3 +
 package/libwebsockets/libwebsockets.mk             |   2 +-
 5 files changed, 111 insertions(+), 142 deletions(-)
 create mode 100644 package/libwebsockets/0001-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
 delete mode 100644 package/libwebsockets/0001-cmake-set-the-project-language.patch
 delete mode 100644 package/libwebsockets/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
 create mode 100644 package/libwebsockets/libwebsockets.hash

diff --git a/package/libwebsockets/0001-cmake-disable-shared-library-build-when-BUILD_SHARED.patch b/package/libwebsockets/0001-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
new file mode 100644
index 0000000..95d1ad8
--- /dev/null
+++ b/package/libwebsockets/0001-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
@@ -0,0 +1,107 @@
+From 045b035bd9ebbd45f40dda36b143ede869eb5f16 Mon Sep 17 00:00:00 2001
+From: Sagaert Johan <sagaert.johan@skynet.be>
+Date: Fri, 31 Oct 2014 12:25:48 +0100
+Subject: [PATCH 2/2] cmake: disable shared library build when
+ BUILD_SHARED_LIBS is off
+
+Original patch from Samuel Martin, reworked by Sagaert Johan when
+updating libwebsockets.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
+[yann.morin.1998 at free.fr: further fix after the version bumped]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ CMakeLists.txt | 17 ++++++++++++-----
+ 1 file changed, 12 insertions(+), 5 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7978845..89853ce 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -372,14 +372,19 @@ source_group("Sources"          FILES ${SOURCES})
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
+@@ -400,15 +405,17 @@ endif(WIN32)
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
+@@ -460,7 +467,7 @@ if (NOT LWS_WITHOUT_EXTENSIONS)
+ 	endif()
+ 
+ 	# Make sure ZLib is compiled before the libs.
+-	foreach (lib websockets websockets_shared)
++	foreach (lib ${_libs_websockets})
+ 		add_dependencies(${lib} ZLIB)
+ 	endforeach()
+ 
+@@ -524,7 +531,7 @@ if (UNIX)
+ endif()
+ 
+ # Setup the linking for all libs.
+-foreach (lib websockets websockets_shared)
++foreach (lib ${_libs_websockets})
+ 	target_link_libraries(${lib} ${LIB_LIST})
+ endforeach()
+ 
+@@ -793,7 +800,7 @@
+ set(LWS_INSTALL_CMAKE_DIR ${DEF_INSTALL_CMAKE_DIR} CACHE PATH "Installation directory for CMake files")
+ 
+ # Export targets (This is used for other CMake projects to easily find the libraries and include files).
+-export(TARGETS websockets websockets_shared
++export(TARGETS ${_libs_websockets}
+         FILE "${PROJECT_BINARY_DIR}/LibwebsocketsTargets.cmake")
+ export(PACKAGE libwebsockets)
+ 
+@@ -829,7 +835,7 @@
+                 ${PROJECT_BINARY_DIR}/LibwebsocketsConfigVersion.cmake 
+                 @ONLY)
+ 
+-set_target_properties(websockets websockets_shared 
++set_target_properties(${_libs_websockets}
+ 					PROPERTIES PUBLIC_HEADER "${HDR_PUBLIC}")
+ 
+ #
+@@ -837,7 +843,7 @@
+ #
+ 
+ # Install libs and headers.
+-install(TARGETS websockets websockets_shared
++install(TARGETS ${_libs_websockets}
+ 		EXPORT LibwebsocketsTargets
+ 		LIBRARY DESTINATION "${LWS_INSTALL_LIB_DIR}${LIB_SUFFIX}" COMPONENT libraries
+ 		ARCHIVE DESTINATION "${LWS_INSTALL_LIB_DIR}${LIB_SUFFIX}" COMPONENT libraries
diff --git a/package/libwebsockets/0001-cmake-set-the-project-language.patch b/package/libwebsockets/0001-cmake-set-the-project-language.patch
deleted file mode 100644
index 7b017a7..0000000
--- a/package/libwebsockets/0001-cmake-set-the-project-language.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 6ab441e0509a9fda179fd1febf73d0f9fae321d6 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Fri, 2 May 2014 14:24:58 +0200
-Subject: [PATCH] cmake: set the project language
-
-By default, CMake sets C and C++ as languages used by the project.
-This makes the configuration failed if no C++ compiler is found.
-
-Since libwesockets in written in pure C, no C++, there is no reason to
-disable it when the toolchain has no C++ support.
-
-This patch just make the CMake code reflecting the real status of the
-project with regard to the languages used.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index f1b6ace..72391b0 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,6 +1,6 @@
- cmake_minimum_required(VERSION 2.6)
- 
--project(libwebsockets)
-+project(libwebsockets C)
- 
- set(PACKAGE "libwebsockets")
- set(CPACK_PACKAGE_NAME "${PACKAGE}")
--- 
-1.9.2
-
diff --git a/package/libwebsockets/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch b/package/libwebsockets/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
deleted file mode 100644
index 95d1ad8..0000000
--- a/package/libwebsockets/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-From 045b035bd9ebbd45f40dda36b143ede869eb5f16 Mon Sep 17 00:00:00 2001
-From: Sagaert Johan <sagaert.johan@skynet.be>
-Date: Fri, 31 Oct 2014 12:25:48 +0100
-Subject: [PATCH 2/2] cmake: disable shared library build when
- BUILD_SHARED_LIBS is off
-
-Original patch from Samuel Martin, reworked by Sagaert Johan when
-updating libwebsockets.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
-[yann.morin.1998 at free.fr: further fix after the version bumped]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- CMakeLists.txt | 17 ++++++++++++-----
- 1 file changed, 12 insertions(+), 5 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7978845..89853ce 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -372,14 +372,19 @@ source_group("Sources"          FILES ${SOURCES})
- #
- # Create the lib.
- #
-+set(_libs_websockets websockets)
- add_library(websockets STATIC
- 			${HDR_PRIVATE}
- 			${HDR_PUBLIC}
- 			${SOURCES})
-+
-+if(BUILD_SHARED_LIBS)
-+list(APPEND _libs_websockets websockets_shared)
- add_library(websockets_shared SHARED
- 			${HDR_PRIVATE}
- 			${HDR_PUBLIC}
- 			${SOURCES})
-+endif()
- 
- if (WIN32)
- 	# On Windows libs have the same file ending (.lib)
-@@ -400,15 +405,17 @@ endif(WIN32)
- 
- # We want the shared lib to be named "libwebsockets"
- # not "libwebsocket_shared".
-+if(BUILD_SHARED_LIBS)
- set_target_properties(websockets_shared
--		PROPERTIES 
-+		PROPERTIES
- 		OUTPUT_NAME websockets)
-+endif()
- 
- # Set the so version of the lib.
- # Equivalent to LDFLAGS=-version-info x:x:x
- if(CMAKE_COMPILER_IS_GNUCC OR CMAKE_COMPILER_IS_GNUCXX)
--	foreach(lib websockets websockets_shared)
--		set_target_properties(${lib} 
-+	foreach(lib ${_libs_websockets})
-+		set_target_properties(${lib}
- 			PROPERTIES
- 			SOVERSION ${SOVERSION})
- 	endforeach()
-@@ -460,7 +467,7 @@ if (NOT LWS_WITHOUT_EXTENSIONS)
- 	endif()
- 
- 	# Make sure ZLib is compiled before the libs.
--	foreach (lib websockets websockets_shared)
-+	foreach (lib ${_libs_websockets})
- 		add_dependencies(${lib} ZLIB)
- 	endforeach()
- 
-@@ -524,7 +531,7 @@ if (UNIX)
- endif()
- 
- # Setup the linking for all libs.
--foreach (lib websockets websockets_shared)
-+foreach (lib ${_libs_websockets})
- 	target_link_libraries(${lib} ${LIB_LIST})
- endforeach()
- 
-@@ -793,7 +800,7 @@
- set(LWS_INSTALL_CMAKE_DIR ${DEF_INSTALL_CMAKE_DIR} CACHE PATH "Installation directory for CMake files")
- 
- # Export targets (This is used for other CMake projects to easily find the libraries and include files).
--export(TARGETS websockets websockets_shared
-+export(TARGETS ${_libs_websockets}
-         FILE "${PROJECT_BINARY_DIR}/LibwebsocketsTargets.cmake")
- export(PACKAGE libwebsockets)
- 
-@@ -829,7 +835,7 @@
-                 ${PROJECT_BINARY_DIR}/LibwebsocketsConfigVersion.cmake 
-                 @ONLY)
- 
--set_target_properties(websockets websockets_shared 
-+set_target_properties(${_libs_websockets}
- 					PROPERTIES PUBLIC_HEADER "${HDR_PUBLIC}")
- 
- #
-@@ -837,7 +843,7 @@
- #
- 
- # Install libs and headers.
--install(TARGETS websockets websockets_shared
-+install(TARGETS ${_libs_websockets}
- 		EXPORT LibwebsocketsTargets
- 		LIBRARY DESTINATION "${LWS_INSTALL_LIB_DIR}${LIB_SUFFIX}" COMPONENT libraries
- 		ARCHIVE DESTINATION "${LWS_INSTALL_LIB_DIR}${LIB_SUFFIX}" COMPONENT libraries
diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
new file mode 100644
index 0000000..89c9826
--- /dev/null
+++ b/package/libwebsockets/libwebsockets.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  63e14fbc768a22b01a3ade61a8e6a89ab0eac329b0f9fbb40ce9fb7210fcaa70  libwebsockets-v1.4-chrome43-firefox-36.tar.xz
+
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index e1a1aa3..da1a872 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = v1.3-chrome37-firefox30
+LIBWEBSOCKETS_VERSION = v1.4-chrome43-firefox-36
 LIBWEBSOCKETS_SOURCE = libwebsockets-$(LIBWEBSOCKETS_VERSION).tar.xz
 LIBWEBSOCKETS_SITE = http://git.libwebsockets.org/cgi-bin/cgit/libwebsockets/snapshot
 LIBWEBSOCKETS_LICENSE = LGPLv2.1 with exceptions
-- 
2.3.3
