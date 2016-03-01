From: Sagaert Johan <sagaert.johan@proximus.be>
Date: Tue,  1 Mar 2016 23:30:25 +0100
Subject: [Buildroot] [PATCH 1/1] libwebsockets : bump to v1.7.2
Message-ID: <1456871425-26152-1-git-send-email-sagaert.johan@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

drop patch to fix the library name
enable optional support for libev and libuv
add updated hash

Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
---
 ...le-shared-library-build-when-BUILD_SHARED.patch | 107 ---------------------
 package/libwebsockets/libwebsockets.hash           |   2 +-
 package/libwebsockets/libwebsockets.mk             |  16 ++-
 3 files changed, 16 insertions(+), 109 deletions(-)
 delete mode 100644 package/libwebsockets/0001-cmake-disable-shared-library-build-when-BUILD_SHARED.patch

diff --git a/package/libwebsockets/0001-cmake-disable-shared-library-build-when-BUILD_SHARED.patch b/package/libwebsockets/0001-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
deleted file mode 100644
index 95d1ad8..0000000
--- a/package/libwebsockets/0001-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
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
index eadff73..ff62669 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  63e14fbc768a22b01a3ade61a8e6a89ab0eac329b0f9fbb40ce9fb7210fcaa70  libwebsockets-v1.4-chrome43-firefox-36.tar.xz
+sha256  c7485cada05a7b00975260fe9d09de78cc5b78f28ae51ee4111c680c7a296835  libwebsockets-v1.7.2.tar.xz
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 2f83748..1006ab8 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = v1.4-chrome43-firefox-36
+LIBWEBSOCKETS_VERSION = v1.7.2
 LIBWEBSOCKETS_SOURCE = libwebsockets-$(LIBWEBSOCKETS_VERSION).tar.xz
 LIBWEBSOCKETS_SITE = http://git.libwebsockets.org/cgi-bin/cgit/libwebsockets/snapshot
 LIBWEBSOCKETS_LICENSE = LGPLv2.1 with exceptions
@@ -20,4 +20,18 @@ else
 LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_SSL=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEV),y)
+LIBWEBSOCKETS_DEPENDENCIES += libev
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_LIBEV=ON
+else
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_LIBEV=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBUV),y)
+LIBWEBSOCKETS_DEPENDENCIES += libuv
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_LIBUV=ON
+else
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_LIBUV=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.3.3
