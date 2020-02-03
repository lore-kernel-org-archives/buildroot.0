From: Mark Corbin <mark@dibsco.co.uk>
Date: Mon,  3 Feb 2020 14:40:57 +0000
Subject: [Buildroot] [PATCH 1/1] package/gadgetfs-test: remove package
Message-ID: <20200203144057.12469-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove gadgetfs-test as gadgetfs has been deprecated in favour of
functionfs.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 Config.in.legacy                              |  8 ++++
 package/Config.in                             |  1 -
 .../0001-fix-usb-ch9-include.patch            | 40 -------------------
 ...name-include-usb_gadgetfs-to-usb-dir.patch | 12 ------
 package/gadgetfs-test/Config.in               | 19 ---------
 package/gadgetfs-test/gadgetfs-test.hash      |  2 -
 package/gadgetfs-test/gadgetfs-test.mk        | 25 ------------
 7 files changed, 8 insertions(+), 99 deletions(-)
 delete mode 100644 package/gadgetfs-test/0001-fix-usb-ch9-include.patch
 delete mode 100644 package/gadgetfs-test/0002-rename-include-usb_gadgetfs-to-usb-dir.patch
 delete mode 100644 package/gadgetfs-test/Config.in
 delete mode 100644 package/gadgetfs-test/gadgetfs-test.hash
 delete mode 100644 package/gadgetfs-test/gadgetfs-test.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 5fd086b499..061d0f7871 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,14 @@ endif
 
 ###############################################################################
 
+config BR2_PACKAGE_GADGETFS_TEST
+	bool "gadgetfs-test was removed"
+	select BR2_LEGACY
+	help
+	  The gadgetfs-test package was removed. Gadgetfs has been
+	  deprecated in favour of functionfs. Consider using
+	  gadget-tool (gt) instead.
+
 config BR2_PACKAGE_FIS
 	bool "fis was removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 492bb352a6..e7cf60c533 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -452,7 +452,6 @@ endmenu
 	source "package/fmtools/Config.in"
 	source "package/freescale-imx/Config.in"
 	source "package/fxload/Config.in"
-	source "package/gadgetfs-test/Config.in"
 	source "package/gcnano-binaries/Config.in"
 	source "package/gpm/Config.in"
 	source "package/gpsd/Config.in"
diff --git a/package/gadgetfs-test/0001-fix-usb-ch9-include.patch b/package/gadgetfs-test/0001-fix-usb-ch9-include.patch
deleted file mode 100644
index 3d7ce82b4f..0000000000
--- a/package/gadgetfs-test/0001-fix-usb-ch9-include.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 8cf5909c6f8e0a892155dea14a07adfad445762d Mon Sep 17 00:00:00 2001
-From: Haavard Skinnemoen <hskinnemoen@atmel.com>
-Date: Sat, 23 Jun 2007 18:34:09 +0200
-Subject: [PATCH] Include usb/ch9.h instead of usb_ch9.h
-
-Signed-off-by: Haavard Skinnemoen <hskinnemoen@atmel.com>
----
- usb.c       |    2 +-
- usbstring.c |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/usb.c b/usb.c
-index ea6c7de..b161154 100644
---- a/usb.c
-+++ b/usb.c
-@@ -35,7 +35,7 @@
- 
- #include <linux/types.h>
- #include <linux/usb_gadgetfs.h>
--#include <linux/usb_ch9.h>
-+#include <linux/usb/ch9.h>
- 
- #ifdef	AIO
- /* this aio code works with libaio-0.3.106 */
-diff --git a/usbstring.c b/usbstring.c
-index 4bf2965..993acc2 100644
---- a/usbstring.c
-+++ b/usbstring.c
-@@ -11,7 +11,7 @@
- #include <string.h>
- 
- #include <linux/types.h>
--#include <linux/usb_ch9.h>
-+#include <linux/usb/ch9.h>
- 
- #include "usbstring.h"
- 
--- 
-1.5.2.2
-
diff --git a/package/gadgetfs-test/0002-rename-include-usb_gadgetfs-to-usb-dir.patch b/package/gadgetfs-test/0002-rename-include-usb_gadgetfs-to-usb-dir.patch
deleted file mode 100644
index ffc2da377d..0000000000
--- a/package/gadgetfs-test/0002-rename-include-usb_gadgetfs-to-usb-dir.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -upr gadgetfs-test-orig/usb.c gadgetfs-test/usb.c
---- gadgetfs-test-orig/usb.c	2007-07-18 14:38:38.000000000 +0200
-+++ gadgetfs-test/usb.c	2007-07-18 15:33:04.000000000 +0200
-@@ -34,7 +34,7 @@
- #include <asm/byteorder.h>
- 
- #include <linux/types.h>
--#include <linux/usb_gadgetfs.h>
-+#include <linux/usb/gadgetfs.h>
- #include <linux/usb/ch9.h>
- 
- #ifdef	AIO
diff --git a/package/gadgetfs-test/Config.in b/package/gadgetfs-test/Config.in
deleted file mode 100644
index ca14c91b41..0000000000
--- a/package/gadgetfs-test/Config.in
+++ /dev/null
@@ -1,19 +0,0 @@
-config BR2_PACKAGE_GADGETFS_TEST
-	bool "gadgetfs-test"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	help
-	  Test program for gadgetfs from linux-usb.org
-
-if BR2_PACKAGE_GADGETFS_TEST
-
-config BR2_PACKAGE_GADGETFS_TEST_USE_AIO
-	bool "use asynchronous i/o"
-	select BR2_PACKAGE_LIBAIO
-	help
-	  Select this to have gadgetfs-test do asynchronous I/O using
-	  the libaio library.
-
-endif
-
-comment "gadgetfs-test needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gadgetfs-test/gadgetfs-test.hash b/package/gadgetfs-test/gadgetfs-test.hash
deleted file mode 100644
index b96190a574..0000000000
--- a/package/gadgetfs-test/gadgetfs-test.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256 bd8ebcf7ce86f4b022a4e7ba6b1cc16ffc4022bb58c1910fe4ac96c88217e7ec gadgetfs-test.tar.bz2
diff --git a/package/gadgetfs-test/gadgetfs-test.mk b/package/gadgetfs-test/gadgetfs-test.mk
deleted file mode 100644
index ca47738f5c..0000000000
--- a/package/gadgetfs-test/gadgetfs-test.mk
+++ /dev/null
@@ -1,25 +0,0 @@
-################################################################################
-#
-# gadgetfs-test
-#
-################################################################################
-
-GADGETFS_TEST_SOURCE = gadgetfs-test.tar.bz2
-GADGETFS_TEST_SITE = http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/GadgetFsTest
-
-GADGETFS_TEST_MAKEOPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)"
-
-ifeq ($(BR2_PACKAGE_GADGETFS_TEST_USE_AIO),y)
-GADGETFS_TEST_DEPENDENCIES = libaio
-GADGETFS_TEST_MAKEOPTS += USE_AIO=y
-endif
-
-define GADGETFS_TEST_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(GADGETFS_TEST_MAKEOPTS)
-endef
-
-define GADGETFS_TEST_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) prefix=/usr install
-endef
-
-$(eval $(generic-package))
-- 
2.20.1
