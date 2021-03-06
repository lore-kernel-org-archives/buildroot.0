From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 22:56:51 +0100
Subject: [Buildroot] [git commit] package/kodi-platform: remove package
Message-ID: <20210308072139.BFBE48896D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f470066ed679788e0852f23e28fad7e68abf23d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is not used by kodi addons anymore.
No legacy handling needed because this package was never selectable.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...rm-config.cmake-fix-for-cross-compilation.patch | 56 ----------------------
 package/kodi-platform/Config.in                    |  7 ---
 package/kodi-platform/kodi-platform.hash           |  3 --
 package/kodi-platform/kodi-platform.mk             | 14 ------
 package/kodi/Config.in                             |  2 -
 5 files changed, 82 deletions(-)

diff --git a/package/kodi-platform/0001-kodiplatform-config.cmake-fix-for-cross-compilation.patch b/package/kodi-platform/0001-kodiplatform-config.cmake-fix-for-cross-compilation.patch
deleted file mode 100644
index cc514b002b..0000000000
--- a/package/kodi-platform/0001-kodiplatform-config.cmake-fix-for-cross-compilation.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From a6e25dba4b5c1d911a4644a0ca116abc642cd72a Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Thu, 30 Jul 2015 09:28:24 +0200
-Subject: [PATCH] kodiplatform-config.cmake: fix for cross-compilation
-
-Use CMAKE_FIND_ROOT_PATH in kodiplatform-config.cmake in order to make
-it cross-compilation friendly.
-
-Patch sent upstream: https://github.com/xbmc/kodi-platform/pull/30
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- CMakeLists.txt               | 2 +-
- kodiplatform-config.cmake.in | 6 +++---
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 25d8004..db23dc9 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -22,7 +22,7 @@ if(NOT WIN32)
-   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")
- endif()
- 
--set(kodiplatform_INCLUDE_DIRS ${TINYXML_INCLUDE_DIR} "${CMAKE_INSTALL_PREFIX}/include/kodi")
-+set(kodiplatform_INCLUDE_DIRS "${CMAKE_INSTALL_PREFIX}/include/kodi")
- IF(WIN32)
-   LIST(APPEND kodiplatform_INCLUDE_DIRS "${CMAKE_INSTALL_PREFIX}/include/kodi/windows")
- ENDIF(WIN32)
-diff --git a/kodiplatform-config.cmake.in b/kodiplatform-config.cmake.in
-index 3fc5273..1bc437a 100644
---- a/kodiplatform-config.cmake.in
-+++ b/kodiplatform-config.cmake.in
-@@ -10,16 +10,16 @@
- #
- # propagate these properties from one build system to the other
- set (kodiplatform_VERSION "@kodiplatform_VERSION_MAJOR at .@kodiplatform_VERSION_MINOR@")
--set (kodiplatform_INCLUDE_DIRS @kodiplatform_INCLUDE_DIRS@ @CMAKE_INSTALL_PREFIX@/include)
-+set (kodiplatform_INCLUDE_DIRS @TINYXML_INCLUDE_DIR@ ${CMAKE_FIND_ROOT_PATH}@kodiplatform_INCLUDE_DIRS@ ${CMAKE_FIND_ROOT_PATH}@CMAKE_INSTALL_PREFIX@/include)
- set (kodiplatform_LIBRARY_DIRS "@CMAKE_LIBRARY_OUTPUT_DIRECTORY@")
- set (kodiplatform_LINKER_FLAGS "@kodiplatform_LINKER_FLAGS@")
- set (kodiplatform_CONFIG_VARS "@kodiplatform_CONFIG_VARS@")
- 
- # libraries come from the build tree where this file was generated
- if(WIN32)
--  set (kodiplatform_LIBRARY "@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@/kodiplatform.lib")
-+  set (kodiplatform_LIBRARY "${CMAKE_FIND_ROOT_PATH}@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@/kodiplatform.lib")
- else(WIN32)
--  set (kodiplatform_LIBRARY "-L at CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@ -lkodiplatform")
-+  set (kodiplatform_LIBRARY "-L${CMAKE_FIND_ROOT_PATH}@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@ -lkodiplatform")
- endif(WIN32)
- set (kodiplatform_LIBRARIES ${kodiplatform_LIBRARY} "@kodiplatform_LIBRARIES@")
- mark_as_advanced (kodiplatform_LIBRARY)
--- 
-2.5.0
-
diff --git a/package/kodi-platform/Config.in b/package/kodi-platform/Config.in
deleted file mode 100644
index cde1925c07..0000000000
--- a/package/kodi-platform/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_KODI_PLATFORM
-	bool
-	select BR2_PACKAGE_LIBPLATFORM
-	help
-	  Kodi add-on platform support library
-
-	  https://github.com/xbmc/kodi-platform
diff --git a/package/kodi-platform/kodi-platform.hash b/package/kodi-platform/kodi-platform.hash
deleted file mode 100644
index 29a43cf021..0000000000
--- a/package/kodi-platform/kodi-platform.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  159165ae641da5eb273885ce53b8a4b84e62a595c4974f9d12c1b5d1428ef25c  kodi-platform-809c5e9d711e378561440a896fcb7dbcd009eb3d.tar.gz
-sha256  2f4bc4c1244b679121749378ff1a2b4b4e318897dac3d346a236432948ebeea7  debian/copyright
diff --git a/package/kodi-platform/kodi-platform.mk b/package/kodi-platform/kodi-platform.mk
deleted file mode 100644
index f1b97e3259..0000000000
--- a/package/kodi-platform/kodi-platform.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# kodi-platform
-#
-################################################################################
-
-KODI_PLATFORM_VERSION = 809c5e9d711e378561440a896fcb7dbcd009eb3d
-KODI_PLATFORM_SITE = $(call github,xbmc,kodi-platform,$(KODI_PLATFORM_VERSION))
-KODI_PLATFORM_LICENSE = GPL-2.0+
-KODI_PLATFORM_LICENSE_FILES = debian/copyright
-KODI_PLATFORM_INSTALL_STAGING = YES
-KODI_PLATFORM_DEPENDENCIES = libplatform kodi
-
-$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 01d068da44..782cca3c18 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -109,8 +109,6 @@ menuconfig BR2_PACKAGE_KODI
 
 if BR2_PACKAGE_KODI
 
-source "package/kodi-platform/Config.in"
-
 config BR2_PACKAGE_KODI_ALSA_LIB
 	bool "alsa"
 	select BR2_PACKAGE_ALSA_LIB
