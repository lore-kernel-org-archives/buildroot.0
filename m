From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 27 Sep 2007 00:36:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mtd/mtd-utils
Message-ID: <20070927073643.535DFA493C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-27 00:36:42 -0700 (Thu, 27 Sep 2007)
New Revision: 20055

Log:
Fix some issues with mtdutils

Added:
   trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-all-targets.patch
   trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-target-acl.patch
   trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-target-llzo.patch
   trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-target-lzo-header.patch

Modified:
   trunk/buildroot/package/mtd/mtd-utils/mtd.mk


Changeset:
Added: trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-all-targets.patch
===================================================================
--- trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-all-targets.patch	                        (rev 0)
+++ trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-all-targets.patch	2007-09-27 07:36:42 UTC (rev 20055)
@@ -0,0 +1,34 @@
+diff -urN mtd-utils-1.1.0-0rig/Makefile mtd-utils-1.1.0/Makefile
+--- mtd-utils-1.1.0-0rig/Makefile	2007-08-03 15:55:51.000000000 +0200
++++ mtd-utils-1.1.0/Makefile	2007-09-27 08:20:55.000000000 +0200
+@@ -72,6 +72,30 @@
+ $(BUILDDIR)/sumtool: $(BUILDDIR)/sumtool.o $(BUILDDIR)/crc32.o
+ 	$(CC) $(LDFLAGS) -o $@ $^
+ 
++ftl_format:	$(BUILDDIR)/ftl_format
++flash_erase:	$(BUILDDIR)/flash_erase
++flash_eraseall:	$(BUILDDIR)/flash_eraseall
++nanddump:	$(BUILDDIR)/nanddump
++doc_loadbios:	$(BUILDDIR)/doc_loadbios
++mkfs.jffs:	$(BUILDDIR)/mkfs.jffs
++ftl_check:	$(BUILDDIR)/ftl_check
++mkfs.jffs2:	$(BUILDDIR)/mkfs.jffs2
++flash_lock:	$(BUILDDIR)/flash_lock
++flash_unlock:	$(BUILDDIR)/flash_unlock
++flash_info:	$(BUILDDIR)/flash_info
++flash_otp_info:	$(BUILDDIR)/flash_otp_info
++flash_otp_dump:	$(BUILDDIR)/flash_otp_dump
++mtd_debug:	$(BUILDDIR)/mtd_debug
++flashcp:	$(BUILDDIR)/flashcp
++nandwrite:	$(BUILDDIR)/nandwrite
++jffs2dump:	$(BUILDDIR)/jffs2dump
++nftldump:	$(BUILDDIR)/nftldump
++nftl_format:	$(BUILDDIR)/nftl_format
++docfdisk:	$(BUILDDIR)/docfdisk
++rfddump:	$(BUILDDIR)/rfddump
++rfdformat:	$(BUILDDIR)/rfdformat
++sumtool:	$(BUILDDIR)/sumtool
++
+ install: ${TARGETS}
+ 	mkdir -p ${DESTDIR}/${SBINDIR}
+ 	install -m0755 ${TARGETS} ${DESTDIR}/${SBINDIR}/

Added: trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-target-acl.patch
===================================================================
--- trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-target-acl.patch	                        (rev 0)
+++ trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-target-acl.patch	2007-09-27 07:36:42 UTC (rev 20055)
@@ -0,0 +1,48 @@
+Author:	Ulf Samuelsson
+Date:	2007-01-25
+
+Log:
+Patch adding "sys/acl.h" needed to compile mtd.
+
+Modified:
+	package/mtd/mtd_acl.patch
+
+Changeset
+	package/mtd/mtd_acl.patch
+
+diff -urN mtd_orig-0rig/include/sys/acl.h mtd_orig/include/sys/acl.h
+--- mtd_orig-0rig/include/sys/acl.h	1970-01-01 01:00:00.000000000 +0100
++++ mtd_orig/include/sys/acl.h	2007-01-17 20:11:22.000000000 +0100
+@@ -0,0 +1,32 @@
++/*
++  File: linux/posix_acl.h
++
++  (C) 2002 Andreas Gruenbacher, <a.gruenbacher@computer.org>
++*/
++
++
++#ifndef __LINUX_POSIX_ACL_H
++#define __LINUX_POSIX_ACL_H
++
++#define ACL_UNDEFINED_ID	(-1)
++
++/* a_type field in acl_user_posix_entry_t */
++#define ACL_TYPE_ACCESS		(0x8000)
++#define ACL_TYPE_DEFAULT	(0x4000)
++
++/* e_tag entry in struct posix_acl_entry */
++#define ACL_USER_OBJ		(0x01)
++#define ACL_USER		(0x02)
++#define ACL_GROUP_OBJ		(0x04)
++#define ACL_GROUP		(0x08)
++#define ACL_MASK		(0x10)
++#define ACL_OTHER		(0x20)
++
++/* permissions in the e_perm field */
++#define ACL_READ		(0x04)
++#define ACL_WRITE		(0x02)
++#define ACL_EXECUTE		(0x01)
++//#define ACL_ADD		(0x08)
++//#define ACL_DELETE		(0x10)
++
++#endif  /* __LINUX_POSIX_ACL_H */

Added: trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-target-llzo.patch
===================================================================
--- trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-target-llzo.patch	                        (rev 0)
+++ trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-target-llzo.patch	2007-09-27 07:36:42 UTC (rev 20055)
@@ -0,0 +1,10 @@
+diff -urN mtd-utils-1.1.0-0rig/Makefile mtd-utils-1.1.0/Makefile
+--- mtd-utils-1.1.0-0rig/Makefile	2007-08-03 15:55:51.000000000 +0200
++++ mtd-utils-1.1.0/Makefile	2007-09-27 08:20:55.000000000 +0200
+@@ -58,7 +58,7 @@
+ 			$(BUILDDIR)/compr_zlib.o \
+ 			$(BUILDDIR)/compr_lzo.o \
+ 			$(BUILDDIR)/compr.o
+-	$(CC) $(LDFLAGS) -o $@ $^ -lz -llzo2
++	$(CC) $(LDFLAGS) -o $@ $^ -lz -llzo
+ 

Added: trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-target-lzo-header.patch
===================================================================
--- trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-target-lzo-header.patch	                        (rev 0)
+++ trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-target-lzo-header.patch	2007-09-27 07:36:42 UTC (rev 20055)
@@ -0,0 +1,14 @@
+diff -urN mtd-utils-1.1.0-0rig/compr_lzo.c mtd-utils-1.1.0/compr_lzo.c
+--- mtd-utils-1.1.0-0rig/compr_lzo.c	2007-08-03 15:55:51.000000000 +0200
++++ mtd-utils-1.1.0/compr_lzo.c	2007-09-27 08:18:05.000000000 +0200
+@@ -26,7 +26,7 @@
+ #include <string.h>
+ #include <asm/types.h>
+ #include <linux/jffs2.h>
+-#include <lzo/lzo1x.h>
++#include <lzo1x.h>
+ #include "compr.h"
+ 
+ extern int page_size;
+ $(BUILDDIR)/flash_eraseall: $(BUILDDIR)/crc32.o $(BUILDDIR)/flash_eraseall.o
+ 	$(CC) $(LDFLAGS) -o $@ $^

Modified: trunk/buildroot/package/mtd/mtd-utils/mtd.mk
===================================================================
--- trunk/buildroot/package/mtd/mtd-utils/mtd.mk	2007-09-27 00:48:31 UTC (rev 20054)
+++ trunk/buildroot/package/mtd/mtd-utils/mtd.mk	2007-09-27 07:36:42 UTC (rev 20055)
@@ -27,12 +27,17 @@
 	rm -rf $(MTD_HOST_DIR)
 	mv $(TOOL_BUILD_DIR)/$(MTD_NAME) $(MTD_HOST_DIR)
 	toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
-		package/mtd/mtd-utils \*.patch
+		package/mtd/mtd-utils mtd-utils-$(MTD_VERSION)-all\*.patch
+	toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
+		package/mtd/mtd-utils mtd-utils-$(MTD_VERSION)-host\*.patch
 	touch $@
 
+
 $(MTD_HOST_DIR)/mkfs.jffs2: $(MTD_HOST_DIR)/.unpacked
 	CC="$(HOSTCC)" CROSS= CFLAGS=-I$(LINUX_HEADERS_DIR)/include \
-		$(MAKE) LINUXDIR=$(LINUX_DIR) -C $(MTD_HOST_DIR) mkfs.jffs2
+		$(MAKE) LINUXDIR=$(LINUX_DIR) \
+		BUILDDIR=$(MTD_HOST_DIR) \
+		-C $(MTD_HOST_DIR) mkfs.jffs2
 
 mtd-host: $(MKFS_JFFS2)
 
@@ -52,8 +57,8 @@
 $(MTD_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
 	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	mv $(BUILD_DIR)/$(MTD_NAME) $(MTD_DIR)
-	toolchain/patch-kernel.sh $(MTD_DIR) \
-		package/mtd/mtd-utils \*.patch
+	toolchain/patch-kernel.sh $(MTD_DIR) package/mtd/mtd-utils mtd-utils-$(MTD_VERSION)-all\*.patch
+	toolchain/patch-kernel.sh $(MTD_DIR) package/mtd/mtd-utils mtd-utils-$(MTD_VERSION)-target\*.patch
 	touch $@
 
 MTD_TARGETS_n :=
@@ -85,7 +90,8 @@
 $(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
 	mkdir -p $(TARGET_DIR)/usr/sbin
 	$(MAKE) CFLAGS="-I. -I./include -I$(LINUX_HEADERS_DIR)/include -I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
-		CROSS= CC=$(TARGET_CC) LINUXDIR=$(LINUX26_DIR) WITHOUT_XATTR=1 -C $(MTD_DIR)
+		BUILDDIR=$(MTD_DIR) \
+		CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) LINUXDIR=$(LINUX26_DIR) WITHOUT_XATTR=1 -C $(MTD_DIR)
 
 MTD_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_y))
 
