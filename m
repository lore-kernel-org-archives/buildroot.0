From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 21 Jul 2009 09:25:30 +0200
Subject: [Buildroot] [git commit] mtd: get rid of ancient deprecated versions
Message-ID: <20090722055743.CB7767781D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2fee20c837e1efc0f67c7b24851e6a4d13717bf0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mtd/20050122/mtd.mk                        |  138 --------------------
 package/mtd/20050122/mtd.patch                     |   45 -------
 package/mtd/20061007/mtd-20061007-mkfs.jffs2.patch |   19 ---
 package/mtd/20061007/mtd.mk                        |  120 -----------------
 package/mtd/20061007/mtd_20061007.patch            |   93 -------------
 package/mtd/20061007/mtd_acl.patch                 |   48 -------
 package/mtd/Config.in                              |   12 --
 package/mtd/mtd.mk                                 |    6 -
 8 files changed, 0 insertions(+), 481 deletions(-)
 delete mode 100644 package/mtd/20050122/mtd.mk
 delete mode 100644 package/mtd/20050122/mtd.patch
 delete mode 100644 package/mtd/20061007/mtd-20061007-mkfs.jffs2.patch
 delete mode 100644 package/mtd/20061007/mtd.mk
 delete mode 100644 package/mtd/20061007/mtd_20061007.patch
 delete mode 100644 package/mtd/20061007/mtd_acl.patch

diff --git a/package/mtd/20050122/mtd.mk b/package/mtd/20050122/mtd.mk
deleted file mode 100644
index b5a9d5c..0000000
--- a/package/mtd/20050122/mtd.mk
+++ /dev/null
@@ -1,138 +0,0 @@
-#############################################################
-#
-# mtd provides jffs2 utilities
-#
-#############################################################
-MTD_SOURCE:=mtd_20050122.orig.tar.gz
-MTD_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/m/mtd
-MTD_HOST_DIR := $(TOOL_BUILD_DIR)/mtd_orig
-MTD_DIR:=$(BUILD_DIR)/mtd_orig
-MTD_CAT:=$(ZCAT)
-
-
-
-#############################################################
-#
-# Build mkfs.jffs2 and sumtool for use on the local host system if
-# needed by target/jffs2root.
-#
-#############################################################
-MKFS_JFFS2 := $(MTD_HOST_DIR)/util/mkfs.jffs2
-SUMTOOL := $(MTD_HOST_DIR)/util/sumtool
-
-ifneq ($(MTD_SOURCE),)
-$(DL_DIR)/$(MTD_SOURCE):
-	$(call DOWNLOAD,$(MTD_SITE),$(MTD_SOURCE))
-endif
-
-$(MTD_HOST_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
-	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
-	mv $(TOOL_BUILD_DIR)/$(shell tar tzf $(DL_DIR)/$(MTD_SOURCE) | head -n 1 \
-		| xargs basename) $(MTD_HOST_DIR)
-	toolchain/patch-kernel.sh $(MTD_HOST_DIR) package/mtd/20050122 \*.patch
-	touch $@
-
-$(MKFS_JFFS2): $(MTD_HOST_DIR)/.unpacked
-	CFLAGS=-I$(LINUX_HEADERS_DIR)/include $(MAKE) CC="$(HOSTCC)" CROSS= \
-		LINUXDIR=$(LINUX_DIR) -C $(MTD_HOST_DIR)/util mkfs.jffs2
-
-$(SUMTOOL): $(MTD_HOST_DIR)/.unpacked
-	CFLAGS=-I$(LINUX_HEADERS_DIR)/include $(MAKE) CC="$(HOSTCC)" CROSS= \
-		LINUXDIR=$(LINUX_DIR) -C $(MTD_HOST_DIR)/util sumtool
-
-mtd-host: $(MKFS_JFFS2) $(SUMTOOL)
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
-	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	mv $(BUILD_DIR)/$(shell tar tzf $(DL_DIR)/$(MTD_SOURCE) \
-		| head -n 1 | xargs basename) $(MTD_DIR)
-	toolchain/patch-kernel.sh $(MTD_DIR) \
-		package/mtd/20050122 \*.patch
-	touch $@
-
-MTD_TARGETS_n :=
-MTD_TARGETS_y :=
-
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASE) += flash_erase
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASEALL) += flash_eraseall
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_INFO) += flash_info
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_LOCK) += flash_lock
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_UNLOCK) += flash_unlock
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASHCP) += flashcp
-MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS2) += mkfs.jffs2
-MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS) += mkfs.jffs
-MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS2DUMP) += jffs2dump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS3DUMP) += jffs3dump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_SUMTOOL) += sumtool
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_CHECK) += ftl_check
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_FORMAT) += ftl_format
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTLDUMP) += nftldump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTL_FORMAT) += nftl_format
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDDUMP) += nanddump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDWRITE) += nandwrite
-MTD_TARGETS_$(BR2_PACKAGE_MTD_MTD_DEBUG) += mtd_debug
-MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK) += docfdisk
-MTD_TARGETS_$(BR2_PACKAGE_MTD_DOC_LOADBIOS) += doc_loadbios
-
-MTD_BUILD_TARGETS := $(addprefix $(MTD_DIR)/util/, $(MTD_TARGETS_y))
-
-$(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		CFLAGS+="-I$(MTD_DIR)/include" \
-		CFLAGS+="-I$(LINUX_HEADERS_DIR)/include" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
-		LINUXDIR=$(LINUX_DIR) -C $(MTD_DIR)/util
-
-MTD_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_y))
-
-$(MTD_TARGETS): $(TARGET_DIR)/usr/sbin/% : $(MTD_DIR)/util/%
-	mkdir -p $(TARGET_DIR)/usr/sbin
-	cp -f $< $@
-	$(STRIPCMD) $@
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
-ifeq ($(BR2_PACKAGE_MTD),y)
-TARGETS+=mtd
-endif
diff --git a/package/mtd/20050122/mtd.patch b/package/mtd/20050122/mtd.patch
deleted file mode 100644
index 40d6865..0000000
--- a/package/mtd/20050122/mtd.patch
+++ /dev/null
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
diff --git a/package/mtd/20061007/mtd-20061007-mkfs.jffs2.patch b/package/mtd/20061007/mtd-20061007-mkfs.jffs2.patch
deleted file mode 100644
index 3c4d6ba..0000000
--- a/package/mtd/20061007/mtd-20061007-mkfs.jffs2.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-diff -urN mtd-20061007.orig-0rig/mkfs.jffs2.c mtd-20061007.orig/mkfs.jffs2.c
---- mtd-20061007.orig-0rig/mkfs.jffs2.c	2006-10-07 17:33:37.000000000 +0200
-+++ mtd-20061007.orig/mkfs.jffs2.c	2007-04-09 02:16:06.000000000 +0200
-@@ -240,6 +242,15 @@
- {
- 	struct filesystem_entry *e = dir;
- 
-+	if((strlen(fullname) == 1) && (fullname[0] == '/')) {
-+		/* Looking for "root" */
-+		if(e != NULL) {
-+			if((strlen(e->fullname) == 1) && (e->fullname[0] == '/')) {
-+				return (e);
-+			}
-+		} 
-+	}
-+
- 	if (S_ISDIR(dir->sb.st_mode)) {
- 		e = dir->files;
- 	}
diff --git a/package/mtd/20061007/mtd.mk b/package/mtd/20061007/mtd.mk
deleted file mode 100644
index dfd3485..0000000
--- a/package/mtd/20061007/mtd.mk
+++ /dev/null
@@ -1,120 +0,0 @@
-#############################################################
-#
-# mtd provides jffs2 utilities
-#
-#############################################################
-MTD_SOURCE=mtd_20061007.orig.tar.gz
-MTD_SITE=$(BR2_DEBIAN_MIRROR)/debian/pool/main/m/mtd
-MTD_HOST_DIR := $(TOOL_BUILD_DIR)/mtd_orig
-MTD_DIR:=$(BUILD_DIR)/mtd_orig
-MTD_CAT:=$(ZCAT)
-MTD_DATE:=20061007
-
-#############################################################
-#
-# Build mkfs.jffs2 and sumtool for use on the local host system if
-# needed by target/jffs2root.
-#
-#############################################################
-MKFS_JFFS2 := $(MTD_HOST_DIR)/mkfs.jffs2
-SUMTOOL := $(MTD_HOST_DIR)/sumtool
-
-$(DL_DIR)/$(MTD_SOURCE):
-	$(call DOWNLOAD,$(MTD_SITE),$(MTD_SOURCE))
-
-$(MTD_HOST_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
-	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
-	mv $(TOOL_BUILD_DIR)/$(shell tar tzf $(DL_DIR)/$(MTD_SOURCE) | head -n 1 \
-		| xargs basename) $(MTD_HOST_DIR)
-	toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
-		package/mtd/$(MTD_DATE) \*.patch
-	touch $@
-
-$(MKFS_JFFS2): $(MTD_HOST_DIR)/.unpacked
-	CC="$(HOSTCC)" CROSS= CFLAGS=-I$(LINUX_HEADERS_DIR)/include \
-		$(MAKE) LINUXDIR=$(LINUX_DIR) -C $(MTD_HOST_DIR) mkfs.jffs2
-
-$(SUMTOOL): $(MTD_HOST_DIR)/.unpacked
-	CC="$(HOSTCC)" CROSS= CFLAGS=-I$(LINUX_HEADERS_DIR)/include \
-		$(MAKE) LINUXDIR=$(LINUX_DIR) -C $(MTD_HOST_DIR) sumtool
-
-mtd-host: $(MKFS_JFFS2) $(SUMTOOL)
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
-	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	mv $(BUILD_DIR)/$(shell tar tzf $(DL_DIR)/$(MTD_SOURCE) \
-		| head -n 1 | xargs basename) $(MTD_DIR)
-	toolchain/patch-kernel.sh $(MTD_DIR) \
-		package/mtd/$(MTD_DATE) \*.patch
-	touch $@
-
-MTD_TARGETS_n :=
-MTD_TARGETS_y :=
-
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASE) += flash_erase
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASEALL) += flash_eraseall
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_INFO) += flash_info
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_LOCK) += flash_lock
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_UNLOCK) += flash_unlock
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASHCP) += flashcp
-MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS2) += mkfs.jffs2
-MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS) += mkfs.jffs
-MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS2DUMP) += jffs2dump
-#MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS3DUMP) += jffs3dump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_SUMTOOL) += sumtool
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_CHECK) += ftl_check
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_FORMAT) += ftl_format
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTLDUMP) += nftldump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTL_FORMAT) += nftl_format
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDDUMP) += nanddump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDWRITE) += nandwrite
-MTD_TARGETS_$(BR2_PACKAGE_MTD_MTD_DEBUG) += mtd_debug
-MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK) += docfdisk
-MTD_TARGETS_$(BR2_PACKAGE_MTD_DOC_LOADBIOS) += doc_loadbios
-
-MTD_BUILD_TARGETS := $(addprefix $(MTD_DIR)/, $(MTD_TARGETS_y))
-
-$(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
-	mkdir -p $(TARGET_DIR)/usr/sbin
-	$(MAKE) CFLAGS="-I. -I./include -I$(LINUX_HEADERS_DIR)/include -I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
-		CROSS= CC=$(TARGET_CC) LINUXDIR=$(LINUX26_DIR) WITHOUT_XATTR=1 -C $(MTD_DIR)
-
-MTD_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_y))
-
-$(MTD_TARGETS): $(TARGET_DIR)/usr/sbin/% : $(MTD_DIR)/%
-	cp -f $< $@
-	$(STRIPCMD) $@
-
-mtd: zlib $(MTD_TARGETS)
-
-mtd-source: $(DL_DIR)/$(MTD_SOURCE)
-
-mtd-clean:
-	-$(MAKE) -C $(MTD_DIR) clean
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
-ifeq ($(BR2_PACKAGE_MTD),y)
-TARGETS+=mtd
-endif
diff --git a/package/mtd/20061007/mtd_20061007.patch b/package/mtd/20061007/mtd_20061007.patch
deleted file mode 100644
index 23654fe..0000000
--- a/package/mtd/20061007/mtd_20061007.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-diff -urN mtd-20061007.orig/Makefile mtd-20061007.orig.patch/Makefile
---- mtd-20061007.orig/Makefile	2006-10-07 16:33:37.000000000 +0100
-+++ mtd-20061007.orig.patch/Makefile	2007-01-09 14:06:22.000000000 +0000
-@@ -9,12 +9,10 @@
- #CROSS=arm-linux-
- CC := $(CROSS)gcc
- CFLAGS := -I./include -O2 -Wall
-+BUILDDIR := .
- 
--ifeq ($(origin CROSS),undefined)
--  BUILDDIR := .
--else
--# Remove the trailing slash to make the directory name
--  BUILDDIR := $(CROSS:-=)
-+ifeq ($(WITHOUT_XATTR), 1)
-+  CFLAGS += -DWITHOUT_XATTR
- endif
- 
- RAWTARGETS = ftl_format flash_erase flash_eraseall nanddump doc_loadbios \
-diff -urN mtd-20061007.orig/mkfs.jffs2.c mtd-20061007.orig.patch/mkfs.jffs2.c
---- mtd-20061007.orig/mkfs.jffs2.c	2006-10-07 16:33:37.000000000 +0100
-+++ mtd-20061007.orig.patch/mkfs.jffs2.c	2007-01-09 11:18:33.000000000 +0000
-@@ -64,8 +64,10 @@
- #include <ctype.h>
- #include <time.h>
- #include <getopt.h>
--#include <sys/xattr.h>
--#include <sys/acl.h>
-+#ifndef WITHOUT_XATTR
-+  #include <sys/xattr.h>
-+  #include <sys/acl.h>
-+#endif
- #include <byteswap.h>
- #define crc32 __complete_crap
- #include <zlib.h>
-@@ -1030,6 +1032,7 @@
- 	padword();
- }
- 
-+#ifndef WITHOUT_XATTR
- typedef struct xattr_entry {
- 	struct xattr_entry *next;
- 	uint32_t xid;
-@@ -1258,6 +1261,9 @@
- 		padword();
- 	}
- }
-+#else /* WITHOUT_XATTR */
-+#define write_xattr_entry(x)
-+#endif
- 
- static void recursive_populate_directory(struct filesystem_entry *dir)
- {
-@@ -1416,9 +1422,11 @@
- 	{"test-compression", 0, NULL, 't'},
- 	{"compressor-priority", 1, NULL, 'y'},
- 	{"incremental", 1, NULL, 'i'},
-+#ifndef WITHOUT_XATTR
- 	{"with-xattr", 0, NULL, 1000 },
- 	{"with-selinux", 0, NULL, 1001 },
- 	{"with-posix-acl", 0, NULL, 1002 },
-+#endif
- 	{NULL, 0, NULL, 0}
- };
- 
-@@ -1451,9 +1459,11 @@
- 	"  -q, --squash            Squash permissions and owners making all files be owned by root\n"
- 	"  -U, --squash-uids       Squash owners making all files be owned by root\n"
- 	"  -P, --squash-perms      Squash permissions on all files\n"
-+#ifndef WITHOUT_XATTR
- 	"      --with-xattr        stuff all xattr entries into image\n"
- 	"      --with-selinux      stuff only SELinux Labels into jffs2 image\n"
- 	"      --with-posix-acl    stuff only POSIX ACL entries into jffs2 image\n"
-+#endif
- 	"  -h, --help              Display this help text\n"
- 	"  -v, --verbose           Verbose operation\n"
- 	"  -V, --version           Display version information\n"
-@@ -1772,6 +1782,7 @@
- 					perror_msg_and_die("cannot open (incremental) file");
- 				}
- 				break;
-+#ifndef WITHOUT_XATTR
- 			case 1000:	/* --with-xattr  */
- 				enable_xattr |= (1 << JFFS2_XPREFIX_USER)
- 						| (1 << JFFS2_XPREFIX_SECURITY)
-@@ -1786,6 +1797,7 @@
- 				enable_xattr |= (1 << JFFS2_XPREFIX_ACL_ACCESS)
- 						| (1 << JFFS2_XPREFIX_ACL_DEFAULT);
- 				break;
-+#endif
- 		}
- 	}
- 	if (out_fd == -1) {
diff --git a/package/mtd/20061007/mtd_acl.patch b/package/mtd/20061007/mtd_acl.patch
deleted file mode 100644
index 953786e..0000000
--- a/package/mtd/20061007/mtd_acl.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Author:	Ulf Samuelsson
-Date:	2007-01-25
-
-Log:
-Patch adding "sys/acl.h" needed to compile mtd.
-
-Modified:
-	package/mtd/mtd_acl.patch
-
-Changeset
-	package/mtd/mtd_acl.patch
-
-diff -urN mtd_orig-0rig/include/sys/acl.h mtd_orig/include/sys/acl.h
---- mtd_orig-0rig/include/sys/acl.h	1970-01-01 01:00:00.000000000 +0100
-+++ mtd_orig/include/sys/acl.h	2007-01-17 20:11:22.000000000 +0100
-@@ -0,0 +1,32 @@
-+/*
-+  File: linux/posix_acl.h
-+
-+  (C) 2002 Andreas Gruenbacher, <a.gruenbacher@computer.org>
-+*/
-+
-+
-+#ifndef __LINUX_POSIX_ACL_H
-+#define __LINUX_POSIX_ACL_H
-+
-+#define ACL_UNDEFINED_ID	(-1)
-+
-+/* a_type field in acl_user_posix_entry_t */
-+#define ACL_TYPE_ACCESS		(0x8000)
-+#define ACL_TYPE_DEFAULT	(0x4000)
-+
-+/* e_tag entry in struct posix_acl_entry */
-+#define ACL_USER_OBJ		(0x01)
-+#define ACL_USER		(0x02)
-+#define ACL_GROUP_OBJ		(0x04)
-+#define ACL_GROUP		(0x08)
-+#define ACL_MASK		(0x10)
-+#define ACL_OTHER		(0x20)
-+
-+/* permissions in the e_perm field */
-+#define ACL_READ		(0x04)
-+#define ACL_WRITE		(0x02)
-+#define ACL_EXECUTE		(0x01)
-+//#define ACL_ADD		(0x08)
-+//#define ACL_DELETE		(0x10)
-+
-+#endif  /* __LINUX_POSIX_ACL_H */
diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 2dd41be..125175f 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -15,18 +15,6 @@ config BR2_PACKAGE_MTD_UTILS
 	help
 	  Build mtd/jffs utilities with Dataflash support
 
-config BR2_PACKAGE_MTD_20061007
-	bool "Use MTD snapshot from 20061007"
-	depends on BR2_DEPRECATED || BR2_RECENT
-	help
-	  Build mtd/jffs utilities with Dataflash support
-
-config BR2_PACKAGE_MTD_20050122
-	bool "Use MTD snapshot from 20050122"
-	depends on BR2_DEPRECATED
-	help
-	  Use the stable release.
-
 config BR2_PACKAGE_MTD_UTILS_GIT
 	bool "Use MTD-utils from GIT"
 	help
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index c7774fd..f81ea18 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -1,12 +1,6 @@
 ifeq ($(BR2_PACKAGE_MTD_UTILS),y)
 include package/mtd/mtd-utils/mtd.mk
 endif
-ifeq ($(BR2_PACKAGE_MTD_20061007),y)
-include package/mtd/20061007/mtd.mk
-endif
-ifeq ($(BR2_PACKAGE_MTD_20050122),y)
-include package/mtd/20050122/mtd.mk
-endif
 ifeq ($(BR2_PACKAGE_MTD_UTILS_GIT),y)
 include package/mtd/mtd-utils.git/mtd.mk
 endif
-- 
1.6.3.3
