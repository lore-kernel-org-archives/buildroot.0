From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:29:23 +0200
Subject: [Buildroot] [git commit] package/libplatform: new package
Message-ID: <20150730132257.CD191807AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f2f242c4ba6d6647c4135ef000da033d33c96983
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed by libcec 3.x

[Thomas:
  - adjust licensing information: license is not GPLv3+, but GPLv2+
    plus one source file in PHP license v3.01.
  - add proper license files.
  - remove the -DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi since
    it doesn't seem to be necessary
  - add patch to fix invalid header and library paths in
    platform-config.cmake.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 ...nfig.cmake-fix-paths-for-cross-compilatio.patch |   40 ++++++++++++++++++++
 package/libplatform/Config.in                      |    6 +++
 package/libplatform/libplatform.mk                 |   13 ++++++
 4 files changed, 60 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index eba74a0..2528238 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1072,6 +1072,7 @@ menu "Other"
 	source "package/liblinear/Config.in"
 	source "package/libnspr/Config.in"
 	source "package/libpfm4/Config.in"
+	source "package/libplatform/Config.in"
 	source "package/libplist/Config.in"
 	source "package/libpthread-stubs/Config.in"
 	source "package/libpthsem/Config.in"
diff --git a/package/libplatform/0001-platform-config.cmake-fix-paths-for-cross-compilatio.patch b/package/libplatform/0001-platform-config.cmake-fix-paths-for-cross-compilatio.patch
new file mode 100644
index 0000000..89f35bd
--- /dev/null
+++ b/package/libplatform/0001-platform-config.cmake-fix-paths-for-cross-compilatio.patch
@@ -0,0 +1,40 @@
+From 65ba437ed5514dd5762a796d349ed5db49e40fe7 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 29 Jul 2015 21:26:16 +0200
+Subject: [PATCH] platform-config.cmake: fix paths for cross-compilation
+
+Headers and library paths in platform-config.cmake must take into
+account ${CMAKE_FIND_ROOT_PATH} to work in cross-compilation.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ platform-config.cmake.in | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/platform-config.cmake.in b/platform-config.cmake.in
+index 7fe35fe..78b5085 100644
+--- a/platform-config.cmake.in
++++ b/platform-config.cmake.in
+@@ -10,16 +10,16 @@
+ #
+ # propagate these properties from one build system to the other
+ set (platform_VERSION "@platform_VERSION_MAJOR at .@platform_VERSION_MINOR@")
+-set (platform_INCLUDE_DIRS @platform_INCLUDE_DIRS@ @CMAKE_INSTALL_PREFIX@/include)
++set (platform_INCLUDE_DIRS ${CMAKE_FIND_ROOT_PATH}/@platform_INCLUDE_DIRS@ ${CMAKE_FIND_ROOT_PATH}/@CMAKE_INSTALL_PREFIX@/include)
+ set (platform_LIBRARY_DIRS "@CMAKE_LIBRARY_OUTPUT_DIRECTORY@")
+ set (platform_LINKER_FLAGS "@platform_LINKER_FLAGS@")
+ set (platform_CONFIG_VARS "@platform_CONFIG_VARS@")
+ 
+ # libraries come from the build tree where this file was generated
+ if(WIN32)
+-  set (platform_LIBRARY "@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@/platform.lib")
++  set (platform_LIBRARY "${CMAKE_FIND_ROOT_PATH}/@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@/platform.lib")
+ else(WIN32)
+-  set (platform_LIBRARY "-L at CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@ -lplatform")
++  set (platform_LIBRARY "-L${CMAKE_FIND_ROOT_PATH}/@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@ -lplatform")
+ endif(WIN32)
+ set (platform_LIBRARIES ${platform_LIBRARY} "@platform_LIBRARIES@")
+ mark_as_advanced (platform_LIBRARY)
+-- 
+2.5.0
+
diff --git a/package/libplatform/Config.in b/package/libplatform/Config.in
new file mode 100644
index 0000000..7d275b1
--- /dev/null
+++ b/package/libplatform/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBPLATFORM
+	bool
+	help
+	  Platform support library used by libCEC and binary add-ons for Kodi
+
+	  https://github.com/Pulse-Eight/platform
diff --git a/package/libplatform/libplatform.mk b/package/libplatform/libplatform.mk
new file mode 100644
index 0000000..4eb934f
--- /dev/null
+++ b/package/libplatform/libplatform.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libplatform
+#
+################################################################################
+
+LIBPLATFORM_VERSION = 1.0.10
+LIBPLATFORM_SITE = $(call github,Pulse-Eight,platform,$(LIBPLATFORM_VERSION))
+LIBPLATFORM_LICENSE = GPLv2+, PHP license v3.01
+LIBPLATFORM_LICENSE_FILES = src/os.h src/util/fstrcmp.c
+LIBPLATFORM_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
