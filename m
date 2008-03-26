From: hamish at uclibc.org <hamish@uclibc.org>
Date: Tue, 25 Mar 2008 23:35:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mtd: 20050122
	mtd-utils.git
Message-ID: <20080326063532.E888A3C2FE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-03-25 23:35:31 -0700 (Tue, 25 Mar 2008)
New Revision: 21495

Log:
Remove old mtd snapshot option, as the source tarball is no longer available
Add option to fetch a snapshot from the mtd-utils git (via gitweb)
Snapshot version provides UBI tools also



Added:
   trunk/buildroot/package/mtd/mtd-utils.git/
   trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-all-argp.patch
   trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-all-targets.patch
   trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-target-acl.patch
   trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-target-llzo.patch
   trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-target-lzo-header.patch
   trunk/buildroot/package/mtd/mtd-utils.git/mtd.mk

Removed:
   trunk/buildroot/package/mtd/mtd.patch

Modified:
   trunk/buildroot/package/mtd/20050122/mtd.mk
   trunk/buildroot/package/mtd/Config.in
   trunk/buildroot/package/mtd/mtd.mk


Changeset:
Modified: trunk/buildroot/package/mtd/20050122/mtd.mk
===================================================================
--- trunk/buildroot/package/mtd/20050122/mtd.mk	2008-03-26 03:28:09 UTC (rev 21494)
+++ trunk/buildroot/package/mtd/20050122/mtd.mk	2008-03-26 06:35:31 UTC (rev 21495)
@@ -3,23 +3,11 @@
 # mtd provides jffs2 utilities
 #
 #############################################################
-ifeq ($(strip $(BR2_PACKAGE_MTD_SNAPSHOT)),y)
-# Be aware that this changes daily....
-
-MTD_DL_SOURCE:=mtd-snapshot-$(DATE).tar.bz2
-MTD_CAT:=$(BZCAT)
-MTD_SOURCE:=mtd-snapshot.tar.bz2
-MTD_SITE:=ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/cvs
-MTD_HOST_DIR := $(TOOL_BUILD_DIR)/mtd_snapshot
-MTD_DIR:=$(BUILD_DIR)/mtd_snapshot
-else
-MTD_SOURCE:=$(strip $(subst ",, $(BR2_PACKAGE_MTD_ORIG_STRING)))
-#"))
+MTD_SOURCE:=mtd_20050122.orig.tar.gz
 MTD_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/m/mtd
 MTD_HOST_DIR := $(TOOL_BUILD_DIR)/mtd_orig
 MTD_DIR:=$(BUILD_DIR)/mtd_orig
 MTD_CAT:=$(ZCAT)
-endif
 
 
 
@@ -32,17 +20,6 @@
 MKFS_JFFS2 := $(MTD_HOST_DIR)/util/mkfs.jffs2
 SUMTOOL := $(MTD_HOST_DIR)/util/sumtool
 
-ifeq ($(strip $(BR2_PACKAGE_MTD_SNAPSHOT)),y)
-$(DL_DIR)/$(MTD_SOURCE):
-	$(WGET) -P $(DL_DIR) $(MTD_SITE)/$(MTD_DL_SOURCE)
-	mv $(DL_DIR)/$(MTD_DL_SOURCE) $(DL_DIR)/$(MTD_SOURCE)
-
-$(MTD_HOST_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE_GENERIC)
-	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
-	mv $(TOOL_BUILD_DIR)/$(shell tar tjf $(DL_DIR)/$(MTD_SOURCE) \
-		| head -n 1 | xargs basename) $(MTD_HOST_DIR)
-	touch $@
-else
 ifneq ($(MTD_SOURCE),)
 $(DL_DIR)/$(MTD_SOURCE):
 	$(WGET) -P $(DL_DIR) $(MTD_SITE)/$(MTD_SOURCE)
@@ -54,7 +31,6 @@
 		| xargs basename) $(MTD_HOST_DIR)
 	toolchain/patch-kernel.sh $(MTD_HOST_DIR) package/mtd/20050122 \*.patch
 	touch $@
-endif
 
 $(MKFS_JFFS2): $(MTD_HOST_DIR)/.unpacked
 	CFLAGS=-I$(LINUX_HEADERS_DIR)/include $(MAKE) CC="$(HOSTCC)" CROSS= \
@@ -81,17 +57,11 @@
 #############################################################
 $(MTD_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
 	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-ifeq ($(strip $(BR2_PACKAGE_MTD_SNAPSHOT)),y)
-	mv $(BUILD_DIR)/$(shell tar tjf $(DL_DIR)/$(MTD_SOURCE) \
-		| head -n 1 | xargs basename) $(MTD_DIR)
-	touch $@
-else
 	mv $(BUILD_DIR)/$(shell tar tzf $(DL_DIR)/$(MTD_SOURCE) \
 		| head -n 1 | xargs basename) $(MTD_DIR)
 	toolchain/patch-kernel.sh $(MTD_DIR) \
-		package/mtd \*.patch
+		package/mtd/20050122 \*.patch
 	touch $@
-endif
 
 MTD_TARGETS_n :=
 MTD_TARGETS_y :=

Modified: trunk/buildroot/package/mtd/Config.in
===================================================================
--- trunk/buildroot/package/mtd/Config.in	2008-03-26 03:28:09 UTC (rev 21494)
+++ trunk/buildroot/package/mtd/Config.in	2008-03-26 06:35:31 UTC (rev 21495)
@@ -12,49 +12,66 @@
 	default BR2_PACKAGE_MTD20061007
 
 config BR2_PACKAGE_MTD_UTILS
-	bool "Use MTD-utils"
+	bool "Use MTD-utils release"
 	depends on BR2_PACKAGE_MTD
 	select BR2_PACKAGE_LZO
 	help
 	  Build mtd/jffs utilities with Dataflash support
 
 config BR2_PACKAGE_MTD_20061007
-	bool "Use MTD from (20061007)"
+	bool "Use MTD snapshot from 20061007"
 	depends on BR2_PACKAGE_MTD
 	help
 	  Build mtd/jffs utilities with Dataflash support
 
 config BR2_PACKAGE_MTD_20050122
-	bool "Use MTD from (20050122)"
+	bool "Use MTD snapshot from 20050122"
 	help
 	  Use the stable release.
 
-config BR2_PACKAGE_MTD_SNAPSHOT
-	bool "Daily snapshot"
+config BR2_PACKAGE_MTD_UTILS_GIT
+	bool "Use MTD-utils from GIT"
 	help
-	  Use the latest MTD daily snapshot instead of release.
+	  Use the latest from GIT or a particular revision.
 	  You should probably say NO except for specific purpose.
 
 endchoice
 
-config BR2_PACKAGE_MTD_SNAPSHOT_STRING
-	string	"mtd_YYYYMMDD.orig.tar.gz"
-	depends on BR2_PACKAGE_MTD_SNAPSHOT
+config BR2_PACKAGE_MTD_UTILS_GIT_COMMIT_ID
+	string	"Commit ID to use"
+	default "e6088d987c545d60a86e1f44836ab8ba072fffd9"
+	depends on BR2_PACKAGE_MTD_UTILS_GIT
 	help
-	  You should not modify the file name, unless you want to
-	  use a specific and private MTD package.
+	  If you wish to use the mtd-utils.git tree as of a specific
+	  commit, you can enter the commit ID here (for example,
+	  e6088d987c545d60a86e1f44836ab8ba072fffd9). 
 
-config BR2_PACKAGE_MTD_ORIG_STRING
-	string
-	depends on BR2_PACKAGE_MTD
-	default "mtd-utils-1.1.0.tar.bz2" if BR2_PACKAGE_MTD_UTILS
-	default "mtd_20061007.orig.tar.gz" if BR2_PACKAGE_MTD_20061007
-	default "mtd_20050122.orig.tar.gz" if BR2_PACKAGE_MTD_20050122
-	default $(BR2_PACKAGE_MTD_SNAPSHOT_STRING) if BR2_PACKAGE_MTD_SNAPSHOT
+	  Alternatively you can specify HEAD. Note that the current
+	  HEAD will be downloaded but won't be tracked when it changes.
 
-menu "MTD tools selection"
+comment "MTD tools selection"
 	depends BR2_PACKAGE_MTD
 
+config BR2_PACKAGE_MTD_DOCFDISK
+	bool "docfdisk"
+	default y
+	depends on BR2_PACKAGE_MTD
+
+config BR2_PACKAGE_MTD_DOC_LOADBIOS
+	bool "doc_loadbios"
+	default y
+	depends on BR2_PACKAGE_MTD
+
+config BR2_PACKAGE_MTD_ERASE
+	bool "erase"
+	default y
+	depends on BR2_PACKAGE_MTD_20050122
+
+config BR2_PACKAGE_MTD_FLASHCP
+	bool "flashcp"
+	default y
+	depends on BR2_PACKAGE_MTD
+
 config BR2_PACKAGE_MTD_FLASH_ERASE
 	bool "flash_erase"
 	default y
@@ -80,13 +97,13 @@
 	default y
 	depends on BR2_PACKAGE_MTD
 
-config BR2_PACKAGE_MTD_FLASHCP
-	bool "flashcp"
+config BR2_PACKAGE_MTD_FTL_CHECK
+	bool "ftl_check"
 	default y
 	depends on BR2_PACKAGE_MTD
 
-config BR2_PACKAGE_MTD_ERASE
-	bool "erase"
+config BR2_PACKAGE_MTD_FTL_FORMAT
+	bool "ftl_format"
 	default y
 	depends on BR2_PACKAGE_MTD
 
@@ -98,22 +115,36 @@
 config BR2_PACKAGE_MTD_JFFS3DUMP
 	bool "jffs3dump"
 	default y
+	depends on BR2_PACKAGE_MTD_20050122
+
+config BR2_PACKAGE_MTD_MKFSJFFS2
+	bool "mkfs.jffs2"
+	default y
 	depends on BR2_PACKAGE_MTD
-	depends on !BR2_PACKAGE_MTD_20061007
 
-config BR2_PACKAGE_MTD_SUMTOOL
-	bool "sumtool"
+config BR2_PACKAGE_MTD_MKFSJFFS
+	bool "mkfs.jffs"
 	default y
+	depends on BR2_PACKAGE_MTD_20050122 || BR2_PACKAGE_MTD_20061007 || BR2_PACKAGE_MTD_UTILS
+
+config BR2_PACKAGE_MTD_MTD_DEBUG
+	bool "mtd_debug"
+	default y
 	depends on BR2_PACKAGE_MTD
 
-config BR2_PACKAGE_MTD_FTL_CHECK
-	bool "ftl_check"
+config BR2_PACKAGE_MTD_NANDDUMP
+	bool "nanddump"
 	default y
 	depends on BR2_PACKAGE_MTD
 
-config BR2_PACKAGE_MTD_FTL_FORMAT
-	bool "ftl_format"
+config BR2_PACKAGE_MTD_NANDTEST
+	bool "nandtest"
 	default y
+	depends on BR2_PACKAGE_MTD_UTILS_GIT
+
+config BR2_PACKAGE_MTD_NANDWRITE
+	bool "nandwrite"
+	default y
 	depends on BR2_PACKAGE_MTD
 
 config BR2_PACKAGE_MTD_NFTL_FORMAT
@@ -126,41 +157,50 @@
 	default y
 	depends on BR2_PACKAGE_MTD
 
-config BR2_PACKAGE_MTD_MKFSJFFS2
-	bool "mkfs.jffs2"
+config BR2_PACKAGE_MTD_SUMTOOL
+	bool "sumtool"
 	default y
 	depends on BR2_PACKAGE_MTD
 
-config BR2_PACKAGE_MTD_MKFSJFFS
-	bool "mkfs.jffs"
+config BR2_PACKAGE_MTD_UBIATTACH
+	bool "ubiattach"
 	default y
-	depends on BR2_PACKAGE_MTD
+	depends on BR2_PACKAGE_MTD_UTILS_GIT
 
-config BR2_PACKAGE_MTD_NANDDUMP
-	bool "nanddump"
+config BR2_PACKAGE_MTD_UBICRC32
+	bool "ubicrc32"
 	default y
-	depends on BR2_PACKAGE_MTD
+	depends on BR2_PACKAGE_MTD_UTILS_GIT
 
-config BR2_PACKAGE_MTD_NANDWRITE
-	bool "nandwrite"
+config BR2_PACKAGE_MTD_UBIDETACH
+	bool "ubidetach"
 	default y
-	depends on BR2_PACKAGE_MTD
+	depends on BR2_PACKAGE_MTD_UTILS_GIT
 
-config BR2_PACKAGE_MTD_MTD_DEBUG
-	bool "mtd_debug"
+config BR2_PACKAGE_MTD_UBIMIRROR
+	bool "ubimirror"
 	default y
-	depends on BR2_PACKAGE_MTD
+	depends on BR2_PACKAGE_MTD_UTILS_GIT
 
-config BR2_PACKAGE_MTD_DOCFDISK
-	bool "docfdisk"
+config BR2_PACKAGE_MTD_UBIMKVOL
+	bool "ubimkvol"
 	default y
-	depends on BR2_PACKAGE_MTD
+	depends on BR2_PACKAGE_MTD_UTILS_GIT
 
-config BR2_PACKAGE_MTD_DOC_LOADBIOS
-	bool "doc_loadbios"
+config BR2_PACKAGE_MTD_UBINFO
+	bool "ubinfo"
 	default y
-	depends on BR2_PACKAGE_MTD
-endmenu
+	depends on BR2_PACKAGE_MTD_UTILS_GIT
 
+config BR2_PACKAGE_MTD_UBIRMVOL
+	bool "ubirmvol"
+	default y
+	depends on BR2_PACKAGE_MTD_UTILS_GIT
+
+config BR2_PACKAGE_MTD_UBIUPDATEVOL
+	bool "ubiupdatevol"
+	default y
+	depends on BR2_PACKAGE_MTD_UTILS_GIT
+
 endif
 

Added: trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-all-argp.patch
===================================================================
--- trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-all-argp.patch	                        (rev 0)
+++ trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-all-argp.patch	2008-03-26 06:35:31 UTC (rev 21495)
@@ -0,0 +1,10 @@
+--- mtd-utils-e6088d987c545d60a86e1f44836ab8ba072fffd9/ubi-utils/new-utils/src/ubicrc32.c.orig	2008-03-26 16:08:13.000000000 +1100
++++ mtd-utils-e6088d987c545d60a86e1f44836ab8ba072fffd9/ubi-utils/new-utils/src/ubicrc32.c	2008-03-26 16:08:20.000000000 +1100
+@@ -26,7 +26,6 @@
+ #include <stdint.h>
+ #include <stdlib.h>
+ #include <getopt.h>
+-#include <argp.h>
+ #include <unistd.h>
+ #include <mtd/ubi-header.h>
+ 

Added: trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-all-targets.patch
===================================================================
--- trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-all-targets.patch	                        (rev 0)
+++ trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-all-targets.patch	2008-03-26 06:35:31 UTC (rev 21495)
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

Added: trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-target-acl.patch
===================================================================
--- trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-target-acl.patch	                        (rev 0)
+++ trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-target-acl.patch	2008-03-26 06:35:31 UTC (rev 21495)
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

Added: trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-target-llzo.patch
===================================================================
--- trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-target-llzo.patch	                        (rev 0)
+++ trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-target-llzo.patch	2008-03-26 06:35:31 UTC (rev 21495)
@@ -0,0 +1,10 @@
+diff -urN mtd-utils-1.1.0-0rig/Makefile mtd-utils-1.1.0/Makefile
+--- mtd-utils-1.1.0-0rig/Makefile	2007-08-03 15:55:51.000000000 +0200
++++ mtd-utils-1.1.0/Makefile	2007-09-27 08:20:55.000000000 +0200
+@@ -63,7 +63,7 @@
+ 			$(BUILDDIR)/compr_lzo.o \
+			$(BUILDDIR)/compr.o \
+			$(BUILDDIR)/rbtree.o
+-	$(CC) $(LDFLAGS) -o $@ $^ -lz -llzo2
++	$(CC) $(LDFLAGS) -o $@ $^ -lz -llzo
+ 

Added: trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-target-lzo-header.patch
===================================================================
--- trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-target-lzo-header.patch	                        (rev 0)
+++ trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-target-lzo-header.patch	2008-03-26 06:35:31 UTC (rev 21495)
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

Added: trunk/buildroot/package/mtd/mtd-utils.git/mtd.mk
===================================================================
--- trunk/buildroot/package/mtd/mtd-utils.git/mtd.mk	                        (rev 0)
+++ trunk/buildroot/package/mtd/mtd-utils.git/mtd.mk	2008-03-26 06:35:31 UTC (rev 21495)
@@ -0,0 +1,144 @@
+#############################################################
+#
+# mtd provides jffs2 utilities
+#
+#############################################################
+MTD_VERSION:=$(strip $(subst ",, $(BR2_PACKAGE_MTD_UTILS_GIT_COMMIT_ID)))
+#"))
+MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.gz
+MTD_URL:=http://git.infradead.org/mtd-utils.git?a=snapshot;h=$(MTD_VERSION);sf=tgz
+MTD_HOST_DIR:= $(TOOL_BUILD_DIR)/mtd-utils-$(MTD_VERSION)
+MTD_DIR:=$(BUILD_DIR)/mtd-utils-$(MTD_VERSION)
+MTD_CAT:=$(ZCAT)
+MTD_NAME:=mtd-utils
+
+#############################################################
+#
+# Build mkfs.jffs2 and sumtool for use on the local host system if
+# needed by target/jffs2root.
+#
+#############################################################
+MKFS_JFFS2 := $(MTD_HOST_DIR)/mkfs.jffs2
+SUMTOOL := $(MTD_HOST_DIR)/sumtool
+
+$(DL_DIR)/$(MTD_SOURCE):
+	$(WGET) -O $(DL_DIR)/$(MTD_SOURCE) $(MTD_URL)
+
+$(MTD_HOST_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
+	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	rm -rf $(MTD_HOST_DIR)
+	mv $(TOOL_BUILD_DIR)/$(MTD_NAME) $(MTD_HOST_DIR)
+	toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
+		package/mtd/mtd-utils.git mtd-utils-all\*.patch
+	toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
+		package/mtd/mtd-utils.git mtd-utils-host\*.patch
+	touch $@
+
+
+$(MKFS_JFFS2): $(MTD_HOST_DIR)/.unpacked
+	CC="$(HOSTCC)" CROSS= CFLAGS=-I$(LINUX_HEADERS_DIR)/include \
+		$(MAKE) \
+		BUILDDIR=$(MTD_HOST_DIR) WITHOUT_XATTR=1 \
+		-C $(MTD_HOST_DIR) mkfs.jffs2
+
+$(SUMTOOL): $(MTD_HOST_DIR)/.unpacked
+	CC="$(HOSTCC)" CROSS= CFLAGS=-I$(LINUX_HEADERS_DIR)/include \
+		$(MAKE) \
+		BUILDDIR=$(MTD_HOST_DIR) WITHOUT_XATTR=1 \
+		-C $(MTD_HOST_DIR) sumtool
+
+mtd-host: $(MKFS_JFFS2) $(SUMTOOL)
+
+mtd-host-source: $(DL_DIR)/$(MTD_SOURCE)
+
+mtd-host-clean:
+	-$(MAKE) -C $(MTD_HOST_DIR) clean
+
+mtd-host-dirclean:
+	rm -rf $(MTD_HOST_DIR)
+
+#############################################################
+#
+# build mtd for use on the target system
+#
+#############################################################
+$(MTD_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
+	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	mv $(BUILD_DIR)/$(MTD_NAME) $(MTD_DIR)
+	toolchain/patch-kernel.sh $(MTD_DIR) package/mtd/mtd-utils.git mtd-utils-all\*.patch
+	toolchain/patch-kernel.sh $(MTD_DIR) package/mtd/mtd-utils.git mtd-utils-target\*.patch
+	touch $@
+
+MTD_TARGETS_n :=
+MTD_TARGETS_y :=
+
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASE) += flash_erase
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASEALL) += flash_eraseall
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_INFO) += flash_info
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_LOCK) += flash_lock
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_UNLOCK) += flash_unlock
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASHCP) += flashcp
+MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS2) += mkfs.jffs2
+MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS2DUMP) += jffs2dump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_SUMTOOL) += sumtool
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_CHECK) += ftl_check
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_FORMAT) += ftl_format
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTLDUMP) += nftldump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTL_FORMAT) += nftl_format
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDDUMP) += nanddump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDTEST) += nandtest
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDWRITE) += nandwrite
+MTD_TARGETS_$(BR2_PACKAGE_MTD_MTD_DEBUG) += mtd_debug
+MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK) += docfdisk
+MTD_TARGETS_$(BR2_PACKAGE_MTD_DOC_LOADBIOS) += doc_loadbios
+
+MTD_TARGETS_UBI_n :=
+MTD_TARGETS_UBI_y :=
+
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIATTACH) += ubiattach
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBICRC32) += ubicrc32
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIDETACH) += ubidetach
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIMIRROR) += ubimirror
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIMKVOL) += ubimkvol
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBINFO) += ubinfo
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRMVOL) += ubirmvol
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIUPDATEVOL) += ubiupdatevol
+
+MTD_BUILD_TARGETS := $(addprefix $(MTD_DIR)/, $(MTD_TARGETS_y)) $(addprefix $(MTD_DIR)/ubi-utils/, $(MTD_TARGETS_UBI_y))
+
+$(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
+	mkdir -p $(TARGET_DIR)/usr/sbin
+	$(MAKE) OPTFLAGS="-DNEED_BCOPY -Dbcmp=memcmp -I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
+	       BUILDDIR=$(MTD_DIR) \
+	       CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) WITHOUT_XATTR=1 -C $(MTD_DIR)
+
+MTD_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_y))
+MTD_UBI_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_UBI_y))
+
+$(MTD_TARGETS): $(TARGET_DIR)/usr/sbin/% : $(MTD_DIR)/%
+	cp -f $< $@
+	$(STRIPCMD) $@
+
+$(MTD_UBI_TARGETS): $(TARGET_DIR)/usr/sbin/% : $(MTD_DIR)/ubi-utils/%
+	cp -f $< $@
+	$(STRIPCMD) $@
+
+mtd: zlib lzo $(MTD_TARGETS) $(MTD_UBI_TARGETS)
+
+mtd-source: $(DL_DIR)/$(MTD_SOURCE)
+
+mtd-clean:
+	-$(MAKE) -C $(MTD_DIR) clean
+
+mtd-dirclean:
+	rm -rf $(MTD_DIR)
+
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_MTD)),y)
+TARGETS+=mtd
+endif

Modified: trunk/buildroot/package/mtd/mtd.mk
===================================================================
--- trunk/buildroot/package/mtd/mtd.mk	2008-03-26 03:28:09 UTC (rev 21494)
+++ trunk/buildroot/package/mtd/mtd.mk	2008-03-26 06:35:31 UTC (rev 21495)
@@ -7,6 +7,6 @@
 ifeq ($(strip $(BR2_PACKAGE_MTD_20050122)),y)
 include package/mtd/20050122/mtd.mk
 endif
-ifeq ($(strip $(BR2_PACKAGE_MTD_SNAPSHOT)),y)
-include package/mtd/20050122/mtd.mk
+ifeq ($(strip $(BR2_PACKAGE_MTD_UTILS_GIT)),y)
+include package/mtd/mtd-utils.git/mtd.mk
 endif

Deleted: trunk/buildroot/package/mtd/mtd.patch
===================================================================
--- trunk/buildroot/package/mtd/mtd.patch	2008-03-26 03:28:09 UTC (rev 21494)
+++ trunk/buildroot/package/mtd/mtd.patch	2008-03-26 06:35:31 UTC (rev 21495)
@@ -1,45 +0,0 @@
-diff -ur mtd-20050122.orig/util/flash_eraseall.c mtd-20050122.orig-patched/util/flash_eraseall.c
---- mtd-20050122.orig/util/flash_eraseall.c	2004-12-09 17:00:52.000000000 -0600
-+++ mtd-20050122.orig-patched/util/flash_eraseall.c	2007-01-13 22:56:51.864233154 -0600
-@@ -54,7 +54,7 @@
- static void display_help (void);
- static void display_version (void);
- static struct jffs2_unknown_node cleanmarker;
--static int target_endian = __BYTE_ORDER;
-+int target_endian = __BYTE_ORDER;
- 
- int main (int argc, char *argv[])
- {
-@@ -134,7 +134,7 @@
- 				if (!quiet)
- 					printf ("\nSkipping bad block@0x%08x\n", erase.start);
- 				continue;
--			} else if (ret == -EOPNOTSUPP) {
-+			} else if (errno == EOPNOTSUPP) {
- 				fprintf(stderr, "%s: %s: Bad block check not available\n", exe_name, mtd_device);
- 				bbtest = 0;
- 			} else if (ret < 0) {
-diff -ur mtd-20050122.orig/util/mkfs.jffs2.c mtd-20050122.orig-patched/util/mkfs.jffs2.c
---- mtd-20050122.orig/util/mkfs.jffs2.c	2004-11-26 17:00:13.000000000 -0600
-+++ mtd-20050122.orig-patched/util/mkfs.jffs2.c	2007-01-13 22:55:53.627687214 -0600
-@@ -101,7 +101,7 @@
- static int squash_uids = 0;
- static int squash_perms = 0;
- static int fake_times = 0;
--static int target_endian = __BYTE_ORDER;
-+int target_endian = __BYTE_ORDER;
- static const char *const app_name = "mkfs.jffs2";
- static const char *const memory_exhausted = "memory exhausted";
- 
-diff -ur mtd-20050122.orig/util/sumtool.c mtd-20050122.orig-patched/util/sumtool.c
---- mtd-20050122.orig/util/sumtool.c	2005-01-05 17:00:16.000000000 -0600
-+++ mtd-20050122.orig-patched/util/sumtool.c	2007-01-13 22:56:05.528616125 -0600
-@@ -68,7 +68,7 @@
- static int cleanmarker_size = sizeof(cleanmarker);
- static const char *short_options = "o:i:e:hvVblnc:p";
- static int erase_block_size = 65536;
--static int target_endian = __BYTE_ORDER;
-+int target_endian = __BYTE_ORDER;
- static int out_fd = -1;
- static int in_fd = -1;
- 
