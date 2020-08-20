From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 20 Aug 2020 20:56:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/c-periphery: fix build with kernel
 4.6 and 4.7
Message-ID: <20200820185616.800142-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/c3b868c12baac9438b792ada105c0b0de0106311

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-CMakeLists.txt-fix-gpio-detection.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/c-periphery/0001-CMakeLists.txt-fix-gpio-detection.patch

diff --git a/package/c-periphery/0001-CMakeLists.txt-fix-gpio-detection.patch b/package/c-periphery/0001-CMakeLists.txt-fix-gpio-detection.patch
new file mode 100644
index 0000000000..f6a3099c3e
--- /dev/null
+++ b/package/c-periphery/0001-CMakeLists.txt-fix-gpio-detection.patch
@@ -0,0 +1,41 @@
+From 2d88c5ab57c710a2471a9432a7c390c90959c503 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 20 Aug 2020 20:44:28 +0200
+Subject: [PATCH] CMakeLists.txt: fix gpio detection
+
+Commit 05262e6dc8424c21f0caf033b0473553825dac09 assumed that if
+linux/gpio.h is available then variables such as
+GPIOEVENT_EVENT_RISING_EDGE are also available
+
+This assumption is wrong, gpio.h is available since kernel 4.6 and
+https://github.com/torvalds/linux/commit/3c702e9987e261042a07e43460a8148be254412e
+but GPIOEVENT_REQUEST_RISING_EDGE is available only since kernel 4.8 and
+https://github.com/torvalds/linux/commit/61f922db72216b00386581c851db9c9095961522
+
+Fixes:
+ - http://autobuild.buildroot.org/results/c3b868c12baac9438b792ada105c0b0de0106311
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/vsergeev/c-periphery/pull/30]
+---
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9345e35..d013b32 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -4,8 +4,8 @@ project(periphery C)
+ option(BUILD_TESTS "Build test programs" ON)
+ 
+ # Check for Linux kernel header files for character device GPIO support
+-include(CheckIncludeFiles)
+-CHECK_INCLUDE_FILES(linux/gpio.h HAVE_CDEV_GPIO_HEADERS)
++include(CheckSymbolExists)
++CHECK_SYMBOL_EXISTS(GPIOEVENT_EVENT_RISING_EDGE linux/gpio.h HAVE_CDEV_GPIO_HEADERS)
+ if(NOT HAVE_CDEV_GPIO_HEADERS)
+ message(WARNING "Linux kernel header files not found for character device GPIO support. c-periphery will be built with legacy sysfs GPIO support only.")
+ endif()
+-- 
+2.27.0
+
-- 
2.27.0
