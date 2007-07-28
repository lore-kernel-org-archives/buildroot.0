From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 28 Jul 2007 08:30:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  gadgetfs-test
Message-ID: <20070728153021.B11DFA47AD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-28 08:30:20 -0700 (Sat, 28 Jul 2007)
New Revision: 19289

Log:
Add gadgetfs package

Added:
   trunk/buildroot/package/gadgetfs-test/
   trunk/buildroot/package/gadgetfs-test/Config.in
   trunk/buildroot/package/gadgetfs-test/gadgetfs-test-fix-usb-ch9-include.patch
   trunk/buildroot/package/gadgetfs-test/gadgetfs-test-rename-include-usb_gadgetfs-to-usb-dir.patch
   trunk/buildroot/package/gadgetfs-test/gadgetfs-test.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-07-28 15:23:35 UTC (rev 19288)
+++ trunk/buildroot/package/Config.in	2007-07-28 15:30:20 UTC (rev 19289)
@@ -206,6 +206,7 @@
 source "package/dm/Config.in"
 source "package/dmraid/Config.in"
 source "package/e2fsprogs/Config.in"
+source "package/gadgetfs-test/Config.in"
 source "package/hal/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/hdparm/Config.in"

Added: trunk/buildroot/package/gadgetfs-test/Config.in
===================================================================
--- trunk/buildroot/package/gadgetfs-test/Config.in	                        (rev 0)
+++ trunk/buildroot/package/gadgetfs-test/Config.in	2007-07-28 15:30:20 UTC (rev 19289)
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_GADGETFS_TEST
+	bool "gadgetfs-test"
+	default n
+	help
+	  Test program for gadgetfs from linux-usb.org
+
+config BR2_PACKAGE_GADGETFS_TEST_USE_AIO
+	bool "use asynchronous i/o"
+	default n
+	depends on BR2_PACKAGE_GADGETFS_TEST
+	select BR2_PACKAGE_LIBAIO
+	help
+	  Select this to have gadgetfs-test do asynchronous I/O using
+	  the libaio library.

Added: trunk/buildroot/package/gadgetfs-test/gadgetfs-test-fix-usb-ch9-include.patch
===================================================================
--- trunk/buildroot/package/gadgetfs-test/gadgetfs-test-fix-usb-ch9-include.patch	                        (rev 0)
+++ trunk/buildroot/package/gadgetfs-test/gadgetfs-test-fix-usb-ch9-include.patch	2007-07-28 15:30:20 UTC (rev 19289)
@@ -0,0 +1,40 @@
+From 8cf5909c6f8e0a892155dea14a07adfad445762d Mon Sep 17 00:00:00 2001
+From: Haavard Skinnemoen <hskinnemoen@atmel.com>
+Date: Sat, 23 Jun 2007 18:34:09 +0200
+Subject: [PATCH] Include usb/ch9.h instead of usb_ch9.h
+
+Signed-off-by: Haavard Skinnemoen <hskinnemoen@atmel.com>
+---
+ usb.c       |    2 +-
+ usbstring.c |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/usb.c b/usb.c
+index ea6c7de..b161154 100644
+--- a/usb.c
++++ b/usb.c
+@@ -35,7 +35,7 @@
+ 
+ #include <linux/types.h>
+ #include <linux/usb_gadgetfs.h>
+-#include <linux/usb_ch9.h>
++#include <linux/usb/ch9.h>
+ 
+ #ifdef	AIO
+ /* this aio code works with libaio-0.3.106 */
+diff --git a/usbstring.c b/usbstring.c
+index 4bf2965..993acc2 100644
+--- a/usbstring.c
++++ b/usbstring.c
+@@ -11,7 +11,7 @@
+ #include <string.h>
+ 
+ #include <linux/types.h>
+-#include <linux/usb_ch9.h>
++#include <linux/usb/ch9.h>
+ 
+ #include "usbstring.h"
+ 
+-- 
+1.5.2.2
+

Added: trunk/buildroot/package/gadgetfs-test/gadgetfs-test-rename-include-usb_gadgetfs-to-usb-dir.patch
===================================================================
--- trunk/buildroot/package/gadgetfs-test/gadgetfs-test-rename-include-usb_gadgetfs-to-usb-dir.patch	                        (rev 0)
+++ trunk/buildroot/package/gadgetfs-test/gadgetfs-test-rename-include-usb_gadgetfs-to-usb-dir.patch	2007-07-28 15:30:20 UTC (rev 19289)
@@ -0,0 +1,12 @@
+diff -upr gadgetfs-test-orig/usb.c gadgetfs-test/usb.c
+--- gadgetfs-test-orig/usb.c	2007-07-18 14:38:38.000000000 +0200
++++ gadgetfs-test/usb.c	2007-07-18 15:33:04.000000000 +0200
+@@ -34,7 +34,7 @@
+ #include <asm/byteorder.h>
+ 
+ #include <linux/types.h>
+-#include <linux/usb_gadgetfs.h>
++#include <linux/usb/gadgetfs.h>
+ #include <linux/usb/ch9.h>
+ 
+ #ifdef	AIO

Added: trunk/buildroot/package/gadgetfs-test/gadgetfs-test.mk
===================================================================
--- trunk/buildroot/package/gadgetfs-test/gadgetfs-test.mk	                        (rev 0)
+++ trunk/buildroot/package/gadgetfs-test/gadgetfs-test.mk	2007-07-28 15:30:20 UTC (rev 19289)
@@ -0,0 +1,51 @@
+#############################################################
+#
+# gadgetfs-test
+#
+#############################################################
+GADGETFS_TEST_SOURCE=gadgetfs-test.tar.bz2
+GADGETFS_TEST_SITE=http://avr32linux.org/twiki/pub/Main/GadgetFsTest/
+GADGETFS_TEST_DIR=$(BUILD_DIR)/gadgetfs-test
+
+GADGETFS_TEST_MAKEOPTS:=CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)"
+
+ifeq ($(BR2_PACKAGE_GADGETFS_TEST_USE_AIO),y)
+GADGETFS_TEST_MAKEOPTS+=USE_AIO=y
+endif
+
+$(DL_DIR)/$(GADGETFS_TEST_SOURCE):
+	$(WGET) -P $(DL_DIR) $(GADGETFS_TEST_SITE)/$(GADGETFS_TEST_SOURCE)
+
+$(GADGETFS_TEST_DIR)/.unpacked: $(DL_DIR)/$(GADGETFS_TEST_SOURCE)
+	$(BZCAT) $(DL_DIR)/$(GADGETFS_TEST_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(GADGETFS_TEST_DIR) package/gadgetfs-test gadgetfs-test\*.patch
+	touch $@
+
+$(GADGETFS_TEST_DIR)/gadgetfs-test: $(GADGETFS_TEST_DIR)/.unpacked
+	$(MAKE) -C $(GADGETFS_TEST_DIR) $(GADGETFS_TEST_MAKEOPTS)
+
+$(TARGET_DIR)/usr/bin/gadgetfs-test: $(GADGETFS_TEST_DIR)/gadgetfs-test
+	$(MAKE) -C $(GADGETFS_TEST_DIR) DESTDIR=$(TARGET_DIR) prefix=/usr install
+
+ifeq ($(BR2_PACKAGE_GADGETFS_TEST_USE_AIO),y)
+gadgetfs-test: uclibc libaio $(TARGET_DIR)/usr/bin/gadgetfs-test
+else
+gadgetfs-test: uclibc $(TARGET_DIR)/usr/bin/gadgetfs-test
+endif
+
+gadgetfs-test-source: $(DL_DIR)/$(GADGETFS_TEST_SOURCE)
+
+gadgetfs-test-clean:
+	-$(MAKE) -C $(GADGETFS_TEST_DIR) $(GADGETFS_TEST_MAKEOPTS) clean
+
+gadgetfs-test-dirclean:
+	rm -rf $(GADGETFS_TEST_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_GADGETFS_TEST)),y)
+TARGETS+=gadgetfs-test
+endif
