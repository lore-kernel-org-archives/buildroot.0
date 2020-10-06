From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Tue,  6 Oct 2020 18:03:52 -0500
Subject: [Buildroot] [PATCH 1/2] package/c-periphery: bump to v2.2.4
Message-ID: <20201006230353.173982-1-ryanbarnett3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
---
 ...01-CMakeLists.txt-fix-gpio-detection.patch | 41 -------------------
 package/c-periphery/c-periphery.hash          |  2 +-
 package/c-periphery/c-periphery.mk            |  2 +-
 3 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 package/c-periphery/0001-CMakeLists.txt-fix-gpio-detection.patch

diff --git a/package/c-periphery/0001-CMakeLists.txt-fix-gpio-detection.patch b/package/c-periphery/0001-CMakeLists.txt-fix-gpio-detection.patch
deleted file mode 100644
index f6a3099c3e..0000000000
--- a/package/c-periphery/0001-CMakeLists.txt-fix-gpio-detection.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 2d88c5ab57c710a2471a9432a7c390c90959c503 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 20 Aug 2020 20:44:28 +0200
-Subject: [PATCH] CMakeLists.txt: fix gpio detection
-
-Commit 05262e6dc8424c21f0caf033b0473553825dac09 assumed that if
-linux/gpio.h is available then variables such as
-GPIOEVENT_EVENT_RISING_EDGE are also available
-
-This assumption is wrong, gpio.h is available since kernel 4.6 and
-https://github.com/torvalds/linux/commit/3c702e9987e261042a07e43460a8148be254412e
-but GPIOEVENT_REQUEST_RISING_EDGE is available only since kernel 4.8 and
-https://github.com/torvalds/linux/commit/61f922db72216b00386581c851db9c9095961522
-
-Fixes:
- - http://autobuild.buildroot.org/results/c3b868c12baac9438b792ada105c0b0de0106311
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/vsergeev/c-periphery/pull/30]
----
- CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 9345e35..d013b32 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -4,8 +4,8 @@ project(periphery C)
- option(BUILD_TESTS "Build test programs" ON)
- 
- # Check for Linux kernel header files for character device GPIO support
--include(CheckIncludeFiles)
--CHECK_INCLUDE_FILES(linux/gpio.h HAVE_CDEV_GPIO_HEADERS)
-+include(CheckSymbolExists)
-+CHECK_SYMBOL_EXISTS(GPIOEVENT_EVENT_RISING_EDGE linux/gpio.h HAVE_CDEV_GPIO_HEADERS)
- if(NOT HAVE_CDEV_GPIO_HEADERS)
- message(WARNING "Linux kernel header files not found for character device GPIO support. c-periphery will be built with legacy sysfs GPIO support only.")
- endif()
--- 
-2.27.0
-
diff --git a/package/c-periphery/c-periphery.hash b/package/c-periphery/c-periphery.hash
index 26f9a73f81..daebb0435f 100644
--- a/package/c-periphery/c-periphery.hash
+++ b/package/c-periphery/c-periphery.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e1ad855dfe8595d0aff306a23eee1d4c4a140212d3cbdc7a6bef5e4d39dc70cc  c-periphery-2.2.2.tar.gz
+sha256  d31fb19c2645b9658ad5ca9313c7f0488c16a52e5adf8b2845e1955ad94546ae  c-periphery-2.2.4.tar.gz
 sha256  7121a0a2ba36ed9388be2f1a916f0e3584d8e49cc7888fbcfcf83bab2a8bebef  LICENSE
diff --git a/package/c-periphery/c-periphery.mk b/package/c-periphery/c-periphery.mk
index e602e76a94..ce0e03f1e9 100644
--- a/package/c-periphery/c-periphery.mk
+++ b/package/c-periphery/c-periphery.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_PERIPHERY_VERSION = 2.2.2
+C_PERIPHERY_VERSION = 2.2.4
 C_PERIPHERY_SITE = $(call github,vsergeev,c-periphery,v$(C_PERIPHERY_VERSION))
 C_PERIPHERY_INSTALL_STAGING = YES
 C_PERIPHERY_LICENSE = MIT
-- 
2.25.1
