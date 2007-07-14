From: Ulf Samuelsson <ulf@atmel.com>
Date: Sat, 14 Jul 2007 13:50:44 +0200
Subject: [Buildroot] RFC: Building mtd-20061022
Message-ID: <1184413844.4954.37.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current default mtd does not support dataflash properly.
The mtd from 20061022 does a better job but the current mtd.mk
is incompatible with 20061022 since among other things
the directory structure has changed.

This proposed patch will allow the user to select a new build
script by adding the BR2_PACKAGE_MTD_EXPERIMENTAL config option
and if set, then 20061022 will be used, if not set,
then the original mtd build script will be used.

This will allow people to test the mtd before making
it a standard part of buildroot.

Comments?



Index: package/mtd/20061007/mtd_20061007.patch
===================================================================
--- package/mtd/20061007/mtd_20061007.patch	(revision 0)
+++ package/mtd/20061007/mtd_20061007.patch	(revision 0)
@@ -0,0 +1,93 @@
+diff -urN mtd-20061007.orig/Makefile mtd-20061007.orig.patch/Makefile
+--- mtd-20061007.orig/Makefile	2006-10-07 16:33:37.000000000 +0100
++++ mtd-20061007.orig.patch/Makefile	2007-01-09 14:06:22.000000000
+0000
+@@ -9,12 +9,10 @@
+ #CROSS=arm-linux-
+ CC := $(CROSS)gcc
+ CFLAGS := -I./include -O2 -Wall
++BUILDDIR := .
+ 
+-ifeq ($(origin CROSS),undefined)
+-  BUILDDIR := .
+-else
+-# Remove the trailing slash to make the directory name
+-  BUILDDIR := $(CROSS:-=)
++ifeq ($(WITHOUT_XATTR), 1)
++  CFLAGS += -DWITHOUT_XATTR
+ endif
+ 
+ RAWTARGETS = ftl_format flash_erase flash_eraseall nanddump
doc_loadbios \
+diff -urN mtd-20061007.orig/mkfs.jffs2.c
mtd-20061007.orig.patch/mkfs.jffs2.c
+--- mtd-20061007.orig/mkfs.jffs2.c	2006-10-07 16:33:37.000000000 +0100
++++ mtd-20061007.orig.patch/mkfs.jffs2.c	2007-01-09 11:18:33.000000000
+0000
+@@ -64,8 +64,10 @@
+ #include <ctype.h>
+ #include <time.h>
+ #include <getopt.h>
+-#include <sys/xattr.h>
+-#include <sys/acl.h>
++#ifndef WITHOUT_XATTR
++  #include <sys/xattr.h>
++  #include <sys/acl.h>
++#endif
+ #include <byteswap.h>
+ #define crc32 __complete_crap
+ #include <zlib.h>
+@@ -1030,6 +1032,7 @@
+ 	padword();
+ }
+ 
++#ifndef WITHOUT_XATTR
+ typedef struct xattr_entry {
+ 	struct xattr_entry *next;
+ 	uint32_t xid;
+@@ -1258,6 +1261,9 @@
+ 		padword();
+ 	}
+ }
++#else /* WITHOUT_XATTR */
++#define write_xattr_entry(x)
++#endif
+ 
+ static void recursive_populate_directory(struct filesystem_entry *dir)
+ {
+@@ -1416,9 +1422,11 @@
+ 	{"test-compression", 0, NULL, 't'},
+ 	{"compressor-priority", 1, NULL, 'y'},
+ 	{"incremental", 1, NULL, 'i'},
++#ifndef WITHOUT_XATTR
+ 	{"with-xattr", 0, NULL, 1000 },
+ 	{"with-selinux", 0, NULL, 1001 },
+ 	{"with-posix-acl", 0, NULL, 1002 },
++#endif
+ 	{NULL, 0, NULL, 0}
+ };
+ 
+@@ -1451,9 +1459,11 @@
+ 	"  -q, --squash            Squash permissions and owners making all
files be owned by root\n"
+ 	"  -U, --squash-uids       Squash owners making all files be owned by
root\n"
+ 	"  -P, --squash-perms      Squash permissions on all files\n"
++#ifndef WITHOUT_XATTR
+ 	"      --with-xattr        stuff all xattr entries into image\n"
+ 	"      --with-selinux      stuff only SELinux Labels into jffs2 image
\n"
+ 	"      --with-posix-acl    stuff only POSIX ACL entries into jffs2
image\n"
++#endif
+ 	"  -h, --help              Display this help text\n"
+ 	"  -v, --verbose           Verbose operation\n"
+ 	"  -V, --version           Display version information\n"
+@@ -1772,6 +1782,7 @@
+ 					perror_msg_and_die("cannot open (incremental) file");
+ 				}
+ 				break;
++#ifndef WITHOUT_XATTR
+ 			case 1000:	/* --with-xattr  */
+ 				enable_xattr |= (1 << JFFS2_XPREFIX_USER)
+ 						| (1 << JFFS2_XPREFIX_SECURITY)
+@@ -1786,6 +1797,7 @@
+ 				enable_xattr |= (1 << JFFS2_XPREFIX_ACL_ACCESS)
+ 						| (1 << JFFS2_XPREFIX_ACL_DEFAULT);
+ 				break;
++#endif
+ 		}
+ 	}
+ 	if (out_fd == -1) {
Index: package/mtd/20061007/mtd_acl.patch
===================================================================
--- package/mtd/20061007/mtd_acl.patch	(revision 0)
+++ package/mtd/20061007/mtd_acl.patch	(revision 0)
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
Index: package/mtd/20061007/mtd-20061007-mkfs.jffs2.patch
===================================================================
--- package/mtd/20061007/mtd-20061007-mkfs.jffs2.patch	(revision 0)
+++ package/mtd/20061007/mtd-20061007-mkfs.jffs2.patch	(revision 0)
@@ -0,0 +1,19 @@
+diff -urN mtd-20061007.orig-0rig/mkfs.jffs2.c
mtd-20061007.orig/mkfs.jffs2.c
+--- mtd-20061007.orig-0rig/mkfs.jffs2.c	2006-10-07 17:33:37.000000000
+0200
++++ mtd-20061007.orig/mkfs.jffs2.c	2007-04-09 02:16:06.000000000 +0200
+@@ -240,6 +242,15 @@
+ {
+ 	struct filesystem_entry *e = dir;
+ 
++	if((strlen(fullname) == 1) && (fullname[0] == '/')) {
++		/* Looking for "root" */
++		if(e != NULL) {
++			if((strlen(e->fullname) == 1) && (e->fullname[0] == '/')) {
++				return (e);
++			}
++		} 
++	}
++
+ 	if (S_ISDIR(dir->sb.st_mode)) {
+ 		e = dir->files;
+ 	}
Index: package/mtd/20061007/mtd.mk
===================================================================
--- package/mtd/20061007/mtd.mk	(revision 0)
+++ package/mtd/20061007/mtd.mk	(revision 0)
@@ -0,0 +1,114 @@
+#############################################################
+#
+# mtd provides jffs2 utilities
+#
+#############################################################
+MTD_SOURCE=mtd_20061007.orig.tar.gz
+MTD_SITE=http://ftp.debian.org/debian/pool/main/m/mtd
+MTD_HOST_DIR := $(TOOL_BUILD_DIR)/mtd_orig
+MTD_DIR:=$(BUILD_DIR)/mtd_orig
+MTD_CAT:=zcat
+MTD_DATE:=20061007
+
+#############################################################
+#
+# Build mkfs.jffs2 for use on the local host system if
+# needed by target/jffs2root.
+#
+#############################################################
+MKFS_JFFS2 := $(MTD_HOST_DIR)/mkfs.jffs2
+
+$(DL_DIR)/$(MTD_SOURCE):
+	$(WGET) -P $(DL_DIR) $(MTD_SITE)/$(MTD_SOURCE)
+
+$(MTD_HOST_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
+	$(ZCAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOL_BUILD_DIR)
$(TAR_OPTIONS) -
+	mv $(TOOL_BUILD_DIR)/$(shell tar tzf $(DL_DIR)/$(MTD_SOURCE) | head -n
1 \
+		| xargs basename) $(MTD_HOST_DIR)
+	toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
+		package/mtd/$(MTD_DATE) \*.patch
+	touch $@
+
+$(MTD_HOST_DIR)/mkfs.jffs2: $(MTD_HOST_DIR)/.unpacked
+	CC="$(HOSTCC)" CROSS= CFLAGS=-I$(LINUX_HEADERS_DIR)/include \
+		$(MAKE) LINUXDIR=$(LINUX_DIR) -C $(MTD_HOST_DIR) mkfs.jffs2
+
+mtd-host: $(MKFS_JFFS2)
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
+	$(ZCAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	mv $(BUILD_DIR)/$(shell tar tzf $(DL_DIR)/$(MTD_SOURCE) \
+		| head -n 1 | xargs basename) $(MTD_DIR)
+	toolchain/patch-kernel.sh $(MTD_DIR) \
+		package/mtd/$(MTD_DATE) \*.patch
+	touch $@
+
+MTD_TARGETS_n :=
+MTD_TARGETS_y :=
+
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASE)		+= flash_erase
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASEALL)		+= flash_eraseall
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_INFO)		+= flash_info
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_LOCK)		+= flash_lock
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_UNLOCK)		+= flash_unlock
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASHCP)			+= flashcp
+MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS2)		+= mkfs.jffs2
+MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS)			+= mkfs.jffs
+MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS2DUMP)		+= jffs2dump
+#MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS3DUMP)		+= jffs3dump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_SUMTOOL)			+= sumtool
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_CHECK)		+= ftl_check
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_FORMAT)		+= ftl_format
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTLDUMP)			+= nftldump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTL_FORMAT)		+= nftl_format
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDDUMP)			+= nanddump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDWRITE)		+= nandwrite
+MTD_TARGETS_$(BR2_PACKAGE_MTD_MTD_DEBUG)		+= mtd_debug
+MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK)			+= docfdisk
+MTD_TARGETS_$(BR2_PACKAGE_MTD_DOC_LOADBIOS)		+= doc_loadbios
+
+MTD_BUILD_TARGETS := $(addprefix $(MTD_DIR)/, $(MTD_TARGETS_y))
+
+$(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
+	mkdir -p $(TARGET_DIR)/usr/sbin
+	$(MAKE) CFLAGS="-I. -I./include -I$(LINUX_HEADERS_DIR)/include -I
$(STAGING_DIR)/include $(TARGET_CFLAGS)" \
+		CROSS= CC=$(TARGET_CC) LINUXDIR=$(LINUX_DIR) WITHOUT_XATTR=1 -C
$(MTD_DIR)
+
+MTD_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_y))
+
+$(MTD_TARGETS): $(TARGET_DIR)/usr/sbin/% : $(MTD_DIR)/%
+	cp -f $< $@
+	$(STRIP) $@
+
+mtd: zlib $(MTD_TARGETS)
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
Index: package/mtd/mtd.patch
===================================================================
--- package/mtd/mtd.patch	(revision 19085)
+++ package/mtd/mtd.patch	(arbetskopia)
@@ -1,45 +0,0 @@
-diff -ur mtd-20050122.orig/util/flash_eraseall.c
mtd-20050122.orig-patched/util/flash_eraseall.c
---- mtd-20050122.orig/util/flash_eraseall.c	2004-12-09
17:00:52.000000000 -0600
-+++ mtd-20050122.orig-patched/util/flash_eraseall.c	2007-01-13
22:56:51.864233154 -0600
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
- 				fprintf(stderr, "%s: %s: Bad block check not available\n",
exe_name, mtd_device);
- 				bbtest = 0;
- 			} else if (ret < 0) {
-diff -ur mtd-20050122.orig/util/mkfs.jffs2.c
mtd-20050122.orig-patched/util/mkfs.jffs2.c
---- mtd-20050122.orig/util/mkfs.jffs2.c	2004-11-26 17:00:13.000000000
-0600
-+++ mtd-20050122.orig-patched/util/mkfs.jffs2.c	2007-01-13
22:55:53.627687214 -0600
-@@ -101,7 +101,7 @@
- static int squash_uids = 0;
- static int squash_perms = 0;
- static int fake_times = 0;
--static int target_endian = __BYTE_ORDER;
-+int target_endian = __BYTE_ORDER;
- static const char *const app_name = "mkfs.jffs2";
- static const char *const memory_exhausted = "memory exhausted";
- 
-diff -ur mtd-20050122.orig/util/sumtool.c
mtd-20050122.orig-patched/util/sumtool.c
---- mtd-20050122.orig/util/sumtool.c	2005-01-05 17:00:16.000000000
-0600
-+++ mtd-20050122.orig-patched/util/sumtool.c	2007-01-13
22:56:05.528616125 -0600
-@@ -68,7 +68,7 @@
- static int cleanmarker_size = sizeof(cleanmarker);
- static const char *short_options = "o:i:e:hvVblnc:p";
- static int erase_block_size = 65536;
--static int target_endian = __BYTE_ORDER;
-+int target_endian = __BYTE_ORDER;
- static int out_fd = -1;
- static int in_fd = -1;
- 
Index: package/mtd/Makefile.in
===================================================================
--- package/mtd/Makefile.in	(revision 0)
+++ package/mtd/Makefile.in	(revision 0)
@@ -0,0 +1,5 @@
+ifeq ($(strip $(BR2_PACKAGE_MTD_EXPERIMENTAL)),y)
+include package/mtd/20061007/mtd.mk
+else
+include package/mtd/20050122/mtd.mk
+endif
Index: package/mtd/Config.in
===================================================================
--- package/mtd/Config.in	(revision 19085)
+++ package/mtd/Config.in	(arbetskopia)
@@ -5,6 +5,14 @@
 	help
 	  Build mtd/jffs utilities
 
+config BR2_PACKAGE_MTD_EXPERIMENTAL
+	bool "Use experimental MTD (20061007)"
+	depends on BR2_PACKAGE_MTD
+	default n
+	help
+	  Build mtd/jffs utilities with Dataflash support
+
+
 menu "MTD package selection"
 	depends on BR2_PACKAGE_MTD
 
@@ -13,7 +21,6 @@
 	depends on BR2_PACKAGE_MTD
 	default BR2_PACKAGE_MTD_ORIG
 
-
 config BR2_PACKAGE_MTD_ORIG
 	bool "Default source"
 	help
@@ -21,6 +28,7 @@
 
 config BR2_PACKAGE_MTD_SNAPSHOT
 	bool "Daily snapshot"
+	depends on !BR2_PACKAGE_MTD_EXPERIMENTAL
 	help
 	  Use the latest MTD daily snapshot instead of release.
 	  You should probably say NO except for specific purpose.
@@ -30,12 +38,23 @@
 config BR2_PACKAGE_MTD_ORIG_STRING
 	string "MTD package name"
 	depends on BR2_PACKAGE_MTD_ORIG
+	depends on !BR2_PACKAGE_MTD_EXPERIMENTAL
 	default "mtd_20050122.orig.tar.gz"
 	help
 	  You should not modify the file name, unless you want to
 	  use a specific and private MTD package.
 	  Default is mtd_20050122.orig.tar.gz
 
+config BR2_PACKAGE_MTD_ORIG_STRING
+	string "MTD package name"
+	depends on BR2_PACKAGE_MTD_ORIG
+	depends on BR2_PACKAGE_MTD_EXPERIMENTAL
+	default "mtd_200601007.orig.tar.gz"
+	help
+	  You should not modify the file name, unless you want to
+	  use a specific and private MTD package.
+	  Default is mtd_20050122.orig.tar.gz
+
 endmenu
 
 menu "MTD tools selection"
@@ -85,7 +104,14 @@
 	bool "jffs3dump"
 	default y
 	depends on BR2_PACKAGE_MTD
+	depends on !BR2_PACKAGE_MTD_EXPERIMENTAL
 
+config BR2_PACKAGE_MTD_JFFS3DUMP
+	bool "jffs3dump (Don't check this since it is broken)"
+	default n
+	depends on BR2_PACKAGE_MTD
+	depends on !BR2_PACKAGE_MTD_EXPERIMENTAL
+
 config BR2_PACKAGE_MTD_SUMTOOL
 	bool "sumtool"
 	default y
@@ -147,3 +173,4 @@
 	depends on BR2_PACKAGE_MTD
 
 endmenu
+
Index: package/mtd/mtd.mk
===================================================================
--- package/mtd/mtd.mk	(revision 19085)
+++ package/mtd/mtd.mk	(arbetskopia)
@@ -1,162 +0,0 @@
-#############################################################
-#
-# mtd provides jffs2 utilities
-#
-#############################################################
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
-MTD_SITE:=http://ftp.debian.org/debian/pool/main/m/mtd
-MTD_HOST_DIR := $(TOOL_BUILD_DIR)/mtd_orig
-MTD_DIR:=$(BUILD_DIR)/mtd_orig
-MTD_CAT:=$(ZCAT)
-endif
-
-
-
-#############################################################
-#
-# Build mkfs.jffs2 for use on the local host system if
-# needed by target/jffs2root.
-#
-#############################################################
-MKFS_JFFS2 := $(MTD_HOST_DIR)/util/mkfs.jffs2
-
-ifeq ($(strip $(BR2_PACKAGE_MTD_SNAPSHOT)),y)
-$(DL_DIR)/$(MTD_SOURCE):
-	$(WGET) -P $(DL_DIR) $(MTD_SITE)/$(MTD_DL_SOURCE)
-	mv $(DL_DIR)/$(MTD_DL_SOURCE) $(DL_DIR)/$(MTD_SOURCE)
-
-$(MTD_HOST_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE_GENERIC)
-	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOL_BUILD_DIR)
$(TAR_OPTIONS) -
-	mv $(TOOL_BUILD_DIR)/$(shell tar tjf $(DL_DIR)/$(MTD_SOURCE) \
-		| head -n 1 | xargs basename) $(MTD_HOST_DIR)
-	touch $@
-else
-ifneq ($(MTD_SOURCE),)
-$(DL_DIR)/$(MTD_SOURCE):
-	$(WGET) -P $(DL_DIR) $(MTD_SITE)/$(MTD_SOURCE)
-endif
-
-$(MTD_HOST_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
-	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOL_BUILD_DIR)
$(TAR_OPTIONS) -
-	mv $(TOOL_BUILD_DIR)/$(shell tar tzf $(DL_DIR)/$(MTD_SOURCE) | head -n
1 \
-		| xargs basename) $(MTD_HOST_DIR)
-	toolchain/patch-kernel.sh $(MTD_HOST_DIR) package/mtd \*.patch
-	touch $@
-endif
-
-$(MTD_HOST_DIR)/util/mkfs.jffs2: $(MTD_HOST_DIR)/.unpacked
-	CFLAGS=-I$(LINUX_HEADERS_DIR)/include $(MAKE) CC="$(HOSTCC)" CROSS= \
-		LINUXDIR=$(LINUX_DIR) -C $(MTD_HOST_DIR)/util mkfs.jffs2
-
-mtd-host: $(MKFS_JFFS2)
-
-mtd-host-source: $(DL_DIR)/$(MTD_SOURCE)
-
-mtd-host-clean:
-	-$(MAKE) -C $(MTD_HOST_DIR) clean
-
-mtd-host-dirclean:
-	rm -rf $(MTD_HOST_DIR)
-
-#############################################################
-#
-# build mtd for use on the target system
-#
-#############################################################
-$(MTD_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
-	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(BUILD_DIR)
$(TAR_OPTIONS) -
-ifeq ($(strip $(BR2_PACKAGE_MTD_SNAPSHOT)),y)
-	mv $(BUILD_DIR)/$(shell tar tjf $(DL_DIR)/$(MTD_SOURCE) \
-		| head -n 1 | xargs basename) $(MTD_DIR)
-	touch $@
-else
-	mv $(BUILD_DIR)/$(shell tar tzf $(DL_DIR)/$(MTD_SOURCE) \
-		| head -n 1 | xargs basename) $(MTD_DIR)
-	toolchain/patch-kernel.sh $(MTD_DIR) \
-		package/mtd \*.patch
-	touch $@
-endif
-
-MTD_TARGETS_n :=
-MTD_TARGETS_y :=
-
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASE)		+= flash_erase
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASEALL)		+= flash_eraseall
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_INFO)		+= flash_info
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_LOCK)		+= flash_lock
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_UNLOCK)		+= flash_unlock
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASHCP)			+= flashcp
-MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS2)		+= mkfs.jffs2
-MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS)			+= mkfs.jffs
-MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS2DUMP)		+= jffs2dump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS3DUMP)		+= jffs3dump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_SUMTOOL)			+= sumtool
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_CHECK)		+= ftl_check
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_FORMAT)		+= ftl_format
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTLDUMP)			+= nftldump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTL_FORMAT)		+= nftl_format
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDDUMP)			+= nanddump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDWRITE)		+= nandwrite
-MTD_TARGETS_$(BR2_PACKAGE_MTD_MTD_DEBUG)		+= mtd_debug
-MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK)			+= docfdisk
-MTD_TARGETS_$(BR2_PACKAGE_MTD_DOC_LOADBIOS)		+= doc_loadbios
-
-MTD_BUILD_TARGETS := $(addprefix $(MTD_DIR)/util/, $(MTD_TARGETS_y))
-
-$(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
-	$(MAKE)	$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS+="-I$(MTD_DIR)/include" \
-		CFLAGS+="-I$(LINUX_HEADERS_DIR)/include" \
-		LINUXDIR=$(LINUX_DIR) -C $(MTD_DIR)/util
-
-MTD_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_y))
-
-$(MTD_TARGETS): $(TARGET_DIR)/usr/sbin/% : $(MTD_DIR)/util/%
-	mkdir -p $(TARGET_DIR)/usr/sbin
-	cp -f $< $@
-	$(STRIP) $@
-ifneq ($(BR2_PACKAGE_MTD_FLASHCP),)
-	-ln -sf flashcp $(TARGET_DIR)/usr/sbin/fcp
-endif
-ifneq ($(BR2_PACKAGE_MTD_ERASE),)
-	-ln -sf flash_erase $(TARGET_DIR)/usr/sbin/erase
-	-ln -sf flash_eraseall $(TARGET_DIR)/usr/sbin/eraseall
-endif
-
-mtd: zlib $(MTD_TARGETS)
-
-mtd-source: $(DL_DIR)/$(MTD_SOURCE)
-
-mtd-clean:
-	-$(MAKE) -C $(MTD_DIR) clean
-ifneq ($(BR2_PACKAGE_MTD_FLASHCP),)
-	-rm -f $(MTD_TARGETS) $(TARGET_DIR)/usr/sbin/fcp
-endif
-ifneq ($(BR2_PACKAGE_MTD_ERASE),)
-	-rm -f $(MTD_TARGETS) $(TARGET_DIR)/usr/sbin/erase
-	-rm -f $(MTD_TARGETS) $(TARGET_DIR)/usr/sbin/eraseall
-endif
-
-mtd-dirclean:
-	rm -rf $(MTD_DIR)
-
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_MTD)),y)
-TARGETS+=mtd
-endif


Best Regards
Ulf Samuelsson
