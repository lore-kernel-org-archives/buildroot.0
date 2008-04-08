From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Tue,  8 Apr 2008 06:09:30 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  bootutils
Message-ID: <20080408130930.75F073C306@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-04-08 06:09:29 -0700 (Tue, 08 Apr 2008)
New Revision: 21671

Log:
* Added bootutils


Added:
   trunk/buildroot/package/bootutils/
   trunk/buildroot/package/bootutils/Config.in
   trunk/buildroot/package/bootutils/bootutils-0.0.7_header-fix.patch
   trunk/buildroot/package/bootutils/bootutils.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-04-08 13:06:07 UTC (rev 21670)
+++ trunk/buildroot/package/Config.in	2008-04-08 13:09:29 UTC (rev 21671)
@@ -60,6 +60,9 @@
 source "package/at/Config.in"
 source "package/berkeleydb/Config.in"
 source "package/bsdiff/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+source "package/bootutils/Config.in"
+endif
 source "package/cups/Config.in"
 source "package/customize/Config.in"
 source "package/dash/Config.in"

Added: trunk/buildroot/package/bootutils/Config.in
===================================================================
--- trunk/buildroot/package/bootutils/Config.in	                        (rev 0)
+++ trunk/buildroot/package/bootutils/Config.in	2008-04-08 13:09:29 UTC (rev 21671)
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_BOOTUTILS
+	bool "bootutils"
+	default n
+	help
+	  BootUtils is a collection of utilities to facilitate booting of 
+	  Linux 2.6-based systems. The process of finding the root volume 
+	  either by label or explicit label= on the kernel command line, 
+	  mounting it, and 'switchroot'ing is automated.
+
+	  http://www.freshmeat.net/projects/bootutils
+

Added: trunk/buildroot/package/bootutils/bootutils-0.0.7_header-fix.patch
===================================================================
--- trunk/buildroot/package/bootutils/bootutils-0.0.7_header-fix.patch	                        (rev 0)
+++ trunk/buildroot/package/bootutils/bootutils-0.0.7_header-fix.patch	2008-04-08 13:09:29 UTC (rev 21671)
@@ -0,0 +1,12 @@
+diff -ru bootutils-0.0.7_vanilla/libblkid/blkid.h bootutils-0.0.7_header-fix/libblkid/blkid.h
+--- bootutils-0.0.7_vanilla/libblkid/blkid.h	2007-07-16 18:30:48.000000000 +0000
++++ bootutils-0.0.7_header-fix/libblkid/blkid.h	2008-03-29 15:34:54.000000000 +0000
+@@ -14,7 +14,7 @@
+ #define _BLKID_BLKID_H
+ 
+ #include <sys/types.h>
+-#include <blkid/blkid_types.h>
++#include "blkid_types.h"
+ 
+ #ifdef __cplusplus
+ extern "C" {

Added: trunk/buildroot/package/bootutils/bootutils.mk
===================================================================
--- trunk/buildroot/package/bootutils/bootutils.mk	                        (rev 0)
+++ trunk/buildroot/package/bootutils/bootutils.mk	2008-04-08 13:09:29 UTC (rev 21671)
@@ -0,0 +1,66 @@
+#############################################################
+#
+# bootutils
+#
+#############################################################
+BOOTUTILS_VERSION:=0.0.7
+BOOTUTILS_SOURCE:=bootutils-$(BOOTUTILS_VERSION).tar.gz
+BOOTUTILS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/bootutils
+BOOTUTILS_CAT:=$(ZCAT)
+BOOTUTILS_DIR:=$(BUILD_DIR)/bootutils-$(BOOTUTILS_VERSION)
+BOOTUTILS_BINARIES:=switchroot raidscan
+
+$(DL_DIR)/$(BOOTUTILS_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(BOOTUTILS_SITE)/$(BOOTUTILS_SOURCE)
+
+$(BOOTUTILS_DIR)/.unpacked: $(DL_DIR)/$(BOOTUTILS_SOURCE)
+	$(BOOTUTILS_CAT) $(DL_DIR)/$(BOOTUTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(BOOTUTILS_DIR) package/bootutils \*.patch
+	touch $@
+
+$(BOOTUTILS_DIR)/.configured: $(BOOTUTILS_DIR)/.unpacked
+	(cd $(BOOTUTILS_DIR); rm -rf config.cache ; \
+	$(TARGET_CONFIGURE_OPTS) \
+	CFLAGS="$(TARGET_CFLAGS)" \
+		ac_cv_func_malloc_0_nonnull=yes \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/ \
+	);
+	touch $@
+
+BOOTUTILS_BUILD_TARGETS:=$(addprefix $(BOOTUTILS_DIR)/,$(BOOTUTILS_BINARIES))
+BOOTUTILS_PROGS:=$(addprefix $(TARGET_DIR)/sbin/,$(BOOTUTILS_BINARIES))
+
+$(BOOTUTILS_BUILD_TARGETS): $(BOOTUTILS_DIR)/.configured
+	$(MAKE) -C $(BOOTUTILS_DIR)
+
+$(BOOTUTILS_PROGS): $(BOOTUTILS_BUILD_TARGETS)
+	$(MAKE) -C $(BOOTUTILS_DIR) DESTDIR=$(TARGET_DIR) install
+
+#####################################################################
+.PHONY: bootutils-source bootutils bootutils-clean bootutils-dirclean
+
+bootutils: uclibc $(BOOTUTILS_PROGS)
+
+bootutils-source: $(DL_DIR)/$(BOOTUTILS_SOURCE)
+
+bootutils-clean: $(BOOTUTILS_CLEAN_DEPS)
+	-$(MAKE) -C $(BOOTUTILS_DIR) DESTDIR=$(TARGET_DIR) uninstall clean
+
+
+bootutils-dirclean: $(BOOTUTILS_DIRCLEAN_DEPS)
+	rm -rf $(BOOTUTILS_DIR)
+
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_BOOTUTILS)),y)
+TARGETS+=bootutils
+endif
+
