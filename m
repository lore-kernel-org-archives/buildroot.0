From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 18:16:45 +0100
Subject: [Buildroot] [git commit] libwebsockets : bump version to
	v1.3-chrome37-firefox30
Message-ID: <20141101171659.C50DDB2A50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a1b4effcbbcf1edebe39c34ca497bb34897471d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bumped the version and did some trivial reworking of the patch file :
libwebsockets-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch

[Thomas:
 - Pass LWS_IPV6={ON,OFF} depending on the value of BR2_INET_IPV6,
   otherwise the build failed in a non-IPv6 configuration.
 - The name of the CMake option for OpenSSL support has changed, it's
   now LWS_WITH_SSL={ON,OFF}.
 - Adjust the description of patch 0002.]

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...le-shared-library-build-when-BUILD_SHARED.patch |   35 ++++++++-----------
 package/libwebsockets/libwebsockets.mk             |   11 +++++-
 2 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/package/libwebsockets/libwebsockets-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch b/package/libwebsockets/libwebsockets-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
index 7aa03d4..50e9a4e 100644
--- a/package/libwebsockets/libwebsockets-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
+++ b/package/libwebsockets/libwebsockets-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
@@ -1,19 +1,23 @@
-From 990835b15e3713e6c34d64b4bed8e55dcca6e6e2 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sat, 30 Aug 2014 00:40:03 +0200
+From 045b035bd9ebbd45f40dda36b143ede869eb5f16 Mon Sep 17 00:00:00 2001
+From: Sagaert Johan <sagaert.johan@skynet.be>
+Date: Fri, 31 Oct 2014 12:25:48 +0100
 Subject: [PATCH 2/2] cmake: disable shared library build when
  BUILD_SHARED_LIBS is off
 
+Original patch from Samuel Martin, reworked by Sagaert Johan when
+updating libwebsockets.
+
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
 ---
- CMakeLists.txt | 19 +++++++++++++------
- 1 file changed, 13 insertions(+), 6 deletions(-)
+ CMakeLists.txt | 17 ++++++++++++-----
+ 1 file changed, 12 insertions(+), 5 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 72391b0..8f28680 100644
+index 7978845..89853ce 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -320,14 +320,19 @@ source_group("Sources"          FILES ${SOURCES})
+@@ -372,14 +372,19 @@ source_group("Sources"          FILES ${SOURCES})
  #
  # Create the lib.
  #
@@ -33,7 +37,7 @@ index 72391b0..8f28680 100644
  
  if (WIN32)
  	# On Windows libs have the same file ending (.lib)
-@@ -348,15 +353,17 @@ endif(WIN32)
+@@ -400,15 +405,17 @@ endif(WIN32)
  
  # We want the shared lib to be named "libwebsockets"
  # not "libwebsocket_shared".
@@ -54,7 +58,7 @@ index 72391b0..8f28680 100644
  			PROPERTIES
  			SOVERSION ${SOVERSION})
  	endforeach()
-@@ -408,7 +415,7 @@ if (NOT WITHOUT_EXTENSIONS)
+@@ -460,7 +467,7 @@ if (NOT LWS_WITHOUT_EXTENSIONS)
  	endif()
  
  	# Make sure ZLib is compiled before the libs.
@@ -63,7 +67,7 @@ index 72391b0..8f28680 100644
  		add_dependencies(${lib} ZLIB)
  	endforeach()
  
-@@ -462,7 +469,7 @@ if (UNIX)
+@@ -524,7 +531,7 @@ if (UNIX)
  endif()
  
  # Setup the linking for all libs.
@@ -72,15 +76,6 @@ index 72391b0..8f28680 100644
  	target_link_libraries(${lib} ${LIB_LIST})
  endforeach()
  
-@@ -727,7 +734,7 @@ install(FILES ${HDR_PUBLIC}
- set(CPACK_COMPONENT_HEADERS_DISPLAY_NAME "Header files")
- 
- # Install libs.
--install(TARGETS websockets websockets_shared
-+install(TARGETS ${_libs_websockets}
- 		LIBRARY DESTINATION lib${LIB_SUFFIX}
- 		ARCHIVE DESTINATION lib${LIB_SUFFIX}
- 		COMPONENT libraries)
 -- 
-2.1.0
+2.1.2
 
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 96b51cb..71a520d 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = v1.23-chrome32-firefox24
+LIBWEBSOCKETS_VERSION = v1.3-chrome37-firefox30
 LIBWEBSOCKETS_SOURCE = libwebsockets-$(LIBWEBSOCKETS_VERSION).tar.xz
 LIBWEBSOCKETS_SITE = http://git.libwebsockets.org/cgi-bin/cgit/libwebsockets/snapshot
 LIBWEBSOCKETS_LICENSE = LGPLv2.1 with exceptions
@@ -14,10 +14,17 @@ LIBWEBSOCKETS_INSTALL_STAGING = YES
 
 LIBWEBSOCKETS_CONF_OPTS += -DWITHOUT_TESTAPPS=ON
 
+ifeq ($(BR2_INET_IPV6),y)
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_IPV6=ON
+else
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_IPV6=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBWEBSOCKETS_DEPENDENCIES += openssl
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_SSL=ON
 else
-LIBWEBSOCKETS_CONF_OPTS += -DWITH_SSL=OFF
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_SSL=OFF
 endif
 
 $(eval $(cmake-package))
