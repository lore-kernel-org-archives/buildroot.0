From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 24 Apr 2017 23:31:37 +0200
Subject: [Buildroot] [PATCH v6 02/31] package/libplatform: bump version
In-Reply-To: <20170424213206.26247-1-bernd.kuhls@t-online.de>
References: <20170424213206.26247-1-bernd.kuhls@t-online.de>
Message-ID: <20170424213206.26247-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replaced patch 0001 with an alternate solution.

Updated license info after
https://github.com/Pulse-Eight/platform/commit/a1e5905874d5cdbce110344558d21a2810dead9c

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-p8-platform-config-fix-lookup-paths.patch | 38 ++++++++++++++++++++
 ...nfig.cmake-fix-paths-for-cross-compilatio.patch | 40 ----------------------
 package/libplatform/libplatform.hash               |  2 +-
 package/libplatform/libplatform.mk                 |  6 ++--
 4 files changed, 42 insertions(+), 44 deletions(-)
 create mode 100644 package/libplatform/0001-p8-platform-config-fix-lookup-paths.patch
 delete mode 100644 package/libplatform/0001-platform-config.cmake-fix-paths-for-cross-compilatio.patch

diff --git a/package/libplatform/0001-p8-platform-config-fix-lookup-paths.patch b/package/libplatform/0001-p8-platform-config-fix-lookup-paths.patch
new file mode 100644
index 0000000000..d487fd942e
--- /dev/null
+++ b/package/libplatform/0001-p8-platform-config-fix-lookup-paths.patch
@@ -0,0 +1,38 @@
+From 01b5478638c705af29f09ad4ed70289f70a21dcf Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Mon, 6 Feb 2017 14:04:47 +0100
+Subject: [PATCH] p8-platform-config: fix lookup paths
+
+Use the proper methods to find the headers and the library.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ p8-platform-config.cmake.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/p8-platform-config.cmake.in b/p8-platform-config.cmake.in
+index 47f30f1..f59418d 100644
+--- a/p8-platform-config.cmake.in
++++ b/p8-platform-config.cmake.in
+@@ -10,7 +10,7 @@
+ #
+ # propagate these properties from one build system to the other
+ set (p8-platform_VERSION "@p8-platform_VERSION_MAJOR at .@p8-platform_VERSION_MINOR@")
+-set (p8-platform_INCLUDE_DIRS @p8-platform_INCLUDE_DIRS@ @CMAKE_INSTALL_PREFIX@/include)
++find_path (p8-platform_INCLUDE_DIRS p8-platform/os.h)
+ set (p8-platform_LIBRARY_DIRS "@CMAKE_LIBRARY_OUTPUT_DIRECTORY@")
+ set (p8-platform_LINKER_FLAGS "@p8-platform_LINKER_FLAGS@")
+ set (p8-platform_CONFIG_VARS "@p8-platform_CONFIG_VARS@")
+@@ -19,7 +19,7 @@ set (p8-platform_CONFIG_VARS "@p8-platform_CONFIG_VARS@")
+ if(WIN32)
+   set (p8-platform_LIBRARY "@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@/p8-platform.lib")
+ else(WIN32)
+-  set (p8-platform_LIBRARY "-L at CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@ -lp8-platform")
++  find_library (p8-platform_LIBRARY p8-platform)
+ endif(WIN32)
+ set (p8-platform_LIBRARIES ${p8-platform_LIBRARY} "@p8-platform_LIBRARIES@")
+ mark_as_advanced (p8-platform_LIBRARY)
+-- 
+2.7.4
+
diff --git a/package/libplatform/0001-platform-config.cmake-fix-paths-for-cross-compilatio.patch b/package/libplatform/0001-platform-config.cmake-fix-paths-for-cross-compilatio.patch
deleted file mode 100644
index 89f35bdb3d..0000000000
--- a/package/libplatform/0001-platform-config.cmake-fix-paths-for-cross-compilatio.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 65ba437ed5514dd5762a796d349ed5db49e40fe7 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 29 Jul 2015 21:26:16 +0200
-Subject: [PATCH] platform-config.cmake: fix paths for cross-compilation
-
-Headers and library paths in platform-config.cmake must take into
-account ${CMAKE_FIND_ROOT_PATH} to work in cross-compilation.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- platform-config.cmake.in | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/platform-config.cmake.in b/platform-config.cmake.in
-index 7fe35fe..78b5085 100644
---- a/platform-config.cmake.in
-+++ b/platform-config.cmake.in
-@@ -10,16 +10,16 @@
- #
- # propagate these properties from one build system to the other
- set (platform_VERSION "@platform_VERSION_MAJOR at .@platform_VERSION_MINOR@")
--set (platform_INCLUDE_DIRS @platform_INCLUDE_DIRS@ @CMAKE_INSTALL_PREFIX@/include)
-+set (platform_INCLUDE_DIRS ${CMAKE_FIND_ROOT_PATH}/@platform_INCLUDE_DIRS@ ${CMAKE_FIND_ROOT_PATH}/@CMAKE_INSTALL_PREFIX@/include)
- set (platform_LIBRARY_DIRS "@CMAKE_LIBRARY_OUTPUT_DIRECTORY@")
- set (platform_LINKER_FLAGS "@platform_LINKER_FLAGS@")
- set (platform_CONFIG_VARS "@platform_CONFIG_VARS@")
- 
- # libraries come from the build tree where this file was generated
- if(WIN32)
--  set (platform_LIBRARY "@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@/platform.lib")
-+  set (platform_LIBRARY "${CMAKE_FIND_ROOT_PATH}/@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@/platform.lib")
- else(WIN32)
--  set (platform_LIBRARY "-L at CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@ -lplatform")
-+  set (platform_LIBRARY "-L${CMAKE_FIND_ROOT_PATH}/@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@ -lplatform")
- endif(WIN32)
- set (platform_LIBRARIES ${platform_LIBRARY} "@platform_LIBRARIES@")
- mark_as_advanced (platform_LIBRARY)
--- 
-2.5.0
-
diff --git a/package/libplatform/libplatform.hash b/package/libplatform/libplatform.hash
index 8975dfd8ab..5162b43fad 100644
--- a/package/libplatform/libplatform.hash
+++ b/package/libplatform/libplatform.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  3603ead8b16a48cb35b1e6dea330a693f10552b1a6ea036c5db9ec248cd8baf5  libplatform-feafe68e3e0b02c3261aefb3d711863ef6fadd38.tar.gz
+sha256 dd07bea9cb5676220586e772f09eab51f1093e5ef0faadee80f7c0e99f5f6c1c  libplatform-2d90f98620e25f47702c9e848380c0d93f29462b.tar.gz
diff --git a/package/libplatform/libplatform.mk b/package/libplatform/libplatform.mk
index d0137994de..c805af2e16 100644
--- a/package/libplatform/libplatform.mk
+++ b/package/libplatform/libplatform.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBPLATFORM_VERSION = feafe68e3e0b02c3261aefb3d711863ef6fadd38
+LIBPLATFORM_VERSION = 2d90f98620e25f47702c9e848380c0d93f29462b
 LIBPLATFORM_SITE = $(call github,Pulse-Eight,platform,$(LIBPLATFORM_VERSION))
-LIBPLATFORM_LICENSE = GPL-2.0+, PHP-3.01
-LIBPLATFORM_LICENSE_FILES = src/os.h src/util/fstrcmp.c
+LIBPLATFORM_LICENSE = GPL-2.0+
+LIBPLATFORM_LICENSE_FILES = src/os.h
 LIBPLATFORM_INSTALL_STAGING = YES
 
 $(eval $(cmake-package))
-- 
2.11.0
