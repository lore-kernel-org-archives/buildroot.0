From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 11 Apr 2021 10:33:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/libplatform: fix build with gcc 5
Message-ID: <20210411083317.199404-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build with gcc 5 is broken since latest bump in commit
977f5fd13480699d94e0ba63d9afae94b71906e6

Instead of updating workaround, use a patch that has been submitted
upstream

Fixes:
 - http://autobuild.buildroot.org/results/2b1922f99b1c213b4e28a5b1a11879f4e28c202f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...require-c-11-as-the-minimum-standard.patch | 26 +++++++++++++++++++
 package/libplatform/libplatform.mk            |  4 ---
 2 files changed, 26 insertions(+), 4 deletions(-)
 create mode 100644 package/libplatform/0001-cmake-require-c-11-as-the-minimum-standard.patch

diff --git a/package/libplatform/0001-cmake-require-c-11-as-the-minimum-standard.patch b/package/libplatform/0001-cmake-require-c-11-as-the-minimum-standard.patch
new file mode 100644
index 0000000000..b880a31953
--- /dev/null
+++ b/package/libplatform/0001-cmake-require-c-11-as-the-minimum-standard.patch
@@ -0,0 +1,26 @@
+From ad9fcceb6267e737316b616551b7aac3cf676481 Mon Sep 17 00:00:00 2001
+From: Lukas Rusak <lorusak@gmail.com>
+Date: Fri, 2 Oct 2020 15:31:36 -0700
+Subject: [PATCH] [cmake] require c++11 as the minimum standard
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/Pulse-Eight/platform/pull/46]
+---
+ CMakeLists.txt | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7144b0b..e9112f9 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -3,6 +3,10 @@ project(p8-platform)
+ cmake_minimum_required(VERSION 2.8.9)
+ enable_language(CXX)
+ 
++set(CMAKE_CXX_STANDARD 11)
++set(CMAKE_CXX_STANDARD_REQUIRED YES)
++set(CMAKE_CXX_EXTENSIONS NO)
++
+ set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR})
+ 
+ find_package(Threads REQUIRED)
diff --git a/package/libplatform/libplatform.mk b/package/libplatform/libplatform.mk
index 5d909f784c..90192369fe 100644
--- a/package/libplatform/libplatform.mk
+++ b/package/libplatform/libplatform.mk
@@ -10,8 +10,4 @@ LIBPLATFORM_LICENSE = GPL-2.0+
 LIBPLATFORM_LICENSE_FILES = src/os.h
 LIBPLATFORM_INSTALL_STAGING = YES
 
-ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5),)
-LIBPLATFORM_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -std=c++11"
-endif
-
 $(eval $(cmake-package))
-- 
2.30.2
