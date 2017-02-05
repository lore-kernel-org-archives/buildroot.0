From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Feb 2017 23:38:52 +0100
Subject: [Buildroot] [PATCHv2] package/libplatform: bump version to 2.1.0
Message-ID: <1486334332-6520-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <bernd.kuhls@t-online.de>

Replaced patch with better one.

Updated license info after
https://github.com/Pulse-Eight/platform/commit/a1e5905874d5cdbce110344558d21a2810dead9c

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Samuel, Yann: fix the 0001 patch]
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - use the proper methods to find headers and libs (thanks Samuel!)
---
 .../libplatform/0001-fix-p8-platform-config.patch  | 29 ++++++++++++++++
 ...nfig.cmake-fix-paths-for-cross-compilatio.patch | 40 ----------------------
 package/libplatform/libplatform.hash               |  2 +-
 package/libplatform/libplatform.mk                 |  8 ++---
 4 files changed, 34 insertions(+), 45 deletions(-)
 create mode 100644 package/libplatform/0001-fix-p8-platform-config.patch
 delete mode 100644 package/libplatform/0001-platform-config.cmake-fix-paths-for-cross-compilatio.patch

diff --git a/package/libplatform/0001-fix-p8-platform-config.patch b/package/libplatform/0001-fix-p8-platform-config.patch
new file mode 100644
index 0000000..ae616fb
--- /dev/null
+++ b/package/libplatform/0001-fix-p8-platform-config.patch
@@ -0,0 +1,29 @@
+p8-platform-config: fix lookup paths
+
+Use the proper methods to find the headers and the library.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+
+diff -durN libplatform-2.1.0.orig/p8-platform-config.cmake.in libplatform-2.1.0/p8-platform-config.cmake.in
+--- libplatform-2.1.0.orig/p8-platform-config.cmake.in	2016-10-24 11:56:25.000000000 +0200
++++ libplatform-2.1.0/p8-platform-config.cmake.in	2017-02-05 23:28:36.472697979 +0100
+@@ -10,7 +10,7 @@
+ #
+ # propagate these properties from one build system to the other
+ set (p8-platform_VERSION "@p8-platform_VERSION_MAJOR at .@p8-platform_VERSION_MINOR@")
+-set (p8-platform_INCLUDE_DIRS @p8-platform_INCLUDE_DIRS@ @CMAKE_INSTALL_PREFIX@/include)
++find_path (p8-platform_INCLUDE_DIRS p8-platform/os.h)
+ set (p8-platform_LIBRARY_DIRS "@CMAKE_LIBRARY_OUTPUT_DIRECTORY@")
+ set (p8-platform_LINKER_FLAGS "@p8-platform_LINKER_FLAGS@")
+ set (p8-platform_CONFIG_VARS "@p8-platform_CONFIG_VARS@")
+@@ -19,7 +19,7 @@
+ if(WIN32)
+   set (p8-platform_LIBRARY "@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@/p8-platform.lib")
+ else(WIN32)
+-  set (p8-platform_LIBRARY "-L at CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@ -lp8-platform")
++  find_library (p8-platform_LIBRARY p8-platform)
+ endif(WIN32)
+ set (p8-platform_LIBRARIES ${p8-platform_LIBRARY} "@p8-platform_LIBRARIES@")
+ mark_as_advanced (p8-platform_LIBRARY)
diff --git a/package/libplatform/0001-platform-config.cmake-fix-paths-for-cross-compilatio.patch b/package/libplatform/0001-platform-config.cmake-fix-paths-for-cross-compilatio.patch
deleted file mode 100644
index 89f35bd..0000000
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
index 8975dfd..e3d5ed5 100644
--- a/package/libplatform/libplatform.hash
+++ b/package/libplatform/libplatform.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  3603ead8b16a48cb35b1e6dea330a693f10552b1a6ea036c5db9ec248cd8baf5  libplatform-feafe68e3e0b02c3261aefb3d711863ef6fadd38.tar.gz
+sha256 88711f1b949285867538a0b2e4189532778e1515325dfa1851eae9d18b6affd9  libplatform-2.1.0.tar.gz
diff --git a/package/libplatform/libplatform.mk b/package/libplatform/libplatform.mk
index 6d54915..d9cd582 100644
--- a/package/libplatform/libplatform.mk
+++ b/package/libplatform/libplatform.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBPLATFORM_VERSION = feafe68e3e0b02c3261aefb3d711863ef6fadd38
-LIBPLATFORM_SITE = $(call github,Pulse-Eight,platform,$(LIBPLATFORM_VERSION))
-LIBPLATFORM_LICENSE = GPLv2+, PHP license v3.01
-LIBPLATFORM_LICENSE_FILES = src/os.h src/util/fstrcmp.c
+LIBPLATFORM_VERSION = 2.1.0
+LIBPLATFORM_SITE = $(call github,Pulse-Eight,platform,p8-platform-$(LIBPLATFORM_VERSION))
+LIBPLATFORM_LICENSE = GPLv2+
+LIBPLATFORM_LICENSE_FILES = src/os.h
 LIBPLATFORM_INSTALL_STAGING = YES
 
 $(eval $(cmake-package))
-- 
2.7.4
