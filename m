From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  4 May 2018 12:23:47 +0300
Subject: [Buildroot] [PATCH] can-utils: bump to version 2018.02.0
Message-ID: <0bf9c9bf22aabf811a28ce68c8025827829fa9fd.1525425827.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable for musl. can-utils now uses the error() glibc extension.

Use Makefile as license file.

Change homepage link to the github repo. The README.md file is much more
informative than the elinux.org wiki page.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/can-utils/Config.in      | 7 ++++---
 package/can-utils/can-utils.hash | 3 ++-
 package/can-utils/can-utils.mk   | 3 ++-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/can-utils/Config.in b/package/can-utils/Config.in
index bfa522d9899e..1800eca042da 100644
--- a/package/can-utils/Config.in
+++ b/package/can-utils/Config.in
@@ -2,13 +2,14 @@ config BR2_PACKAGE_CAN_UTILS
 	bool "can-utils"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
+	depends on !BR2_TOOLCHAIN_USES_MUSL # error()
 	help
 	  SocketCAN is a set of open source CAN drivers and a
 	  networking stack.
 	  This package provides various tools for this stack.
 
-	  http://elinux.org/Can-utils
+	  https://github.com/linux-can/can-utils
 
-comment "can-utils needs a toolchain w/ NPTL"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+comment "can-utils needs a glibc or uClibc toolchain w/ NPTL"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_MMU
diff --git a/package/can-utils/can-utils.hash b/package/can-utils/can-utils.hash
index 64c4cf6692c5..2034c35a874f 100644
--- a/package/can-utils/can-utils.hash
+++ b/package/can-utils/can-utils.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256  c4b6b347c1c165a64c1156bb8816bce557945dd770f61b8bdc8fdb7c0744af27  can-utils-c3305fdd515464153d20199db232b6124bc962c0.tar.gz
+sha256  370ad4b19447c29099f7300548f1a3362d6e123c4a6a827dbbd3110bc2c26839  can-utils-v2018.02.0.tar.gz
+sha256  c258939ebb09c3857f5fc7704a449e5077cc881090c87b38f9a81332b96fa075  Makefile
diff --git a/package/can-utils/can-utils.mk b/package/can-utils/can-utils.mk
index 45d5e29fecee..bff4d21fef0b 100644
--- a/package/can-utils/can-utils.mk
+++ b/package/can-utils/can-utils.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-CAN_UTILS_VERSION = c3305fdd515464153d20199db232b6124bc962c0
+CAN_UTILS_VERSION = v2018.02.0
 CAN_UTILS_SITE = $(call github,linux-can,can-utils,$(CAN_UTILS_VERSION))
 CAN_UTILS_LICENSE = BSD-3-Clause or GPL-2.0, GPL-2.0+
+CAN_UTILS_LICENSE_FILES = Makefile
 CAN_UTILS_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.17.0
