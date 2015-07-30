From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:37:44 +0200
Subject: [Buildroot] [git commit branch/next] package/kodi-platform: new
	package
Message-ID: <20150808105650.B579581904@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b045afa44e4453a5aabe872a9daf2909b36815a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This package is used by the PVR addon packages and has no use by itself,
therefore is does not show up in menuconfig.

[Thomas:
 - fix license information, as noticed by Yann E. Morin: the license
   is GPLv2+, not GPLv3+, and there is no COPYING file, so a short
   source file with the license header was used instead.
 - remove -DCMAKE_MODULE_PATH, no longer needed now that
   kodi-config.cmake is fixed.
 - add patch to fix kodi-platform-config.cmake for cross-compilation.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...rm-config.cmake-fix-for-cross-compilation.patch |   54 ++++++++++++++++++++
 package/kodi-platform/Config.in                    |    7 +++
 package/kodi-platform/kodi-platform.mk             |   14 +++++
 package/kodi/Config.in                             |    2 +
 4 files changed, 77 insertions(+), 0 deletions(-)

diff --git a/package/kodi-platform/0001-kodiplatform-config.cmake-fix-for-cross-compilation.patch b/package/kodi-platform/0001-kodiplatform-config.cmake-fix-for-cross-compilation.patch
new file mode 100644
index 0000000..18a74e7
--- /dev/null
+++ b/package/kodi-platform/0001-kodiplatform-config.cmake-fix-for-cross-compilation.patch
@@ -0,0 +1,54 @@
+From a6e25dba4b5c1d911a4644a0ca116abc642cd72a Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 30 Jul 2015 09:28:24 +0200
+Subject: [PATCH] kodiplatform-config.cmake: fix for cross-compilation
+
+Use CMAKE_FIND_ROOT_PATH in kodiplatform-config.cmake in order to make
+it cross-compilation friendly.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ CMakeLists.txt               | 2 +-
+ kodiplatform-config.cmake.in | 6 +++---
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 25d8004..db23dc9 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -22,7 +22,7 @@ if(NOT WIN32)
+   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")
+ endif()
+ 
+-set(kodiplatform_INCLUDE_DIRS ${TINYXML_INCLUDE_DIR} "${CMAKE_INSTALL_PREFIX}/include/kodi")
++set(kodiplatform_INCLUDE_DIRS "${CMAKE_INSTALL_PREFIX}/include/kodi")
+ IF(WIN32)
+   LIST(APPEND kodiplatform_INCLUDE_DIRS "${CMAKE_INSTALL_PREFIX}/include/kodi/windows")
+ ENDIF(WIN32)
+diff --git a/kodiplatform-config.cmake.in b/kodiplatform-config.cmake.in
+index 3fc5273..1bc437a 100644
+--- a/kodiplatform-config.cmake.in
++++ b/kodiplatform-config.cmake.in
+@@ -10,16 +10,16 @@
+ #
+ # propagate these properties from one build system to the other
+ set (kodiplatform_VERSION "@kodiplatform_VERSION_MAJOR at .@kodiplatform_VERSION_MINOR@")
+-set (kodiplatform_INCLUDE_DIRS @kodiplatform_INCLUDE_DIRS@ @CMAKE_INSTALL_PREFIX@/include)
++set (kodiplatform_INCLUDE_DIRS @TINYXML_INCLUDE_DIR@ ${CMAKE_FIND_ROOT_PATH}@kodiplatform_INCLUDE_DIRS@ ${CMAKE_FIND_ROOT_PATH}@CMAKE_INSTALL_PREFIX@/include)
+ set (kodiplatform_LIBRARY_DIRS "@CMAKE_LIBRARY_OUTPUT_DIRECTORY@")
+ set (kodiplatform_LINKER_FLAGS "@kodiplatform_LINKER_FLAGS@")
+ set (kodiplatform_CONFIG_VARS "@kodiplatform_CONFIG_VARS@")
+ 
+ # libraries come from the build tree where this file was generated
+ if(WIN32)
+-  set (kodiplatform_LIBRARY "@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@/kodiplatform.lib")
++  set (kodiplatform_LIBRARY "${CMAKE_FIND_ROOT_PATH}@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@/kodiplatform.lib")
+ else(WIN32)
+-  set (kodiplatform_LIBRARY "-L at CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@ -lkodiplatform")
++  set (kodiplatform_LIBRARY "-L${CMAKE_FIND_ROOT_PATH}@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@ -lkodiplatform")
+ endif(WIN32)
+ set (kodiplatform_LIBRARIES ${kodiplatform_LIBRARY} "@kodiplatform_LIBRARIES@")
+ mark_as_advanced (kodiplatform_LIBRARY)
+-- 
+2.5.0
+
diff --git a/package/kodi-platform/Config.in b/package/kodi-platform/Config.in
new file mode 100644
index 0000000..cde1925
--- /dev/null
+++ b/package/kodi-platform/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PLATFORM
+	bool
+	select BR2_PACKAGE_LIBPLATFORM
+	help
+	  Kodi add-on platform support library
+
+	  https://github.com/xbmc/kodi-platform
diff --git a/package/kodi-platform/kodi-platform.mk b/package/kodi-platform/kodi-platform.mk
new file mode 100644
index 0000000..0a7cc2e
--- /dev/null
+++ b/package/kodi-platform/kodi-platform.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# kodi-platform
+#
+################################################################################
+
+KODI_PLATFORM_VERSION = 33b6390b5d2abe5b674f9eb04bdee19228543054
+KODI_PLATFORM_SITE = $(call github,xbmc,kodi-platform,$(KODI_PLATFORM_VERSION))
+KODI_PLATFORM_LICENSE = GPLv2+
+KODI_PLATFORM_LICENSE_FILES = src/util/XMLUtils.h
+KODI_PLATFORM_INSTALL_STAGING = YES
+KODI_PLATFORM_DEPENDENCIES = libplatform kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 52ae04e..e8a7608 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -102,6 +102,8 @@ menuconfig BR2_PACKAGE_KODI
 
 if BR2_PACKAGE_KODI
 
+source "package/kodi-platform/Config.in"
+
 config BR2_PACKAGE_KODI_ALSA_LIB
 	bool "alsa"
 	select BR2_PACKAGE_ALSA_LIB
