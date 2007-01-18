From: Daniel Laird <danieljlaird@hotmail.com>
Date: Thu, 18 Jan 2007 00:41:11 -0800 (PST)
Subject: [Buildroot] Mtd broken in buildroot
Message-ID: <8426819.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I myslef ran in to this yesterday:

I have updated the makefile and added a patch to allow for XATTR not being
used.  This patch is available on the internet and is actually in mainline
mtd I believe however not in a release yet.  Hope this helps you.

Daniel Laird

--- a/mtd/mtd.mk	2007-01-16 08:15:07.000000000 +0000
+++ b/mtd/mtd.mk	2007-01-09 14:04:31.000000000 +0000
@@ -3,25 +3,11 @@
 # mtd provides jffs2 utilities
 #
 #############################################################
-ifeq ($(strip $(BR2_PACKAGE_MTD_SNAPSHOT)),y)
-# Be aware that this changes daily....
-TODAY:=$(shell date -u +%Y%m%d)
-MTD_DL_SOURCE:=mtd-snapshot-$(TODAY).tar.bz2
-MTD_CAT:=$(BZCAT)
-MTD_SOURCE:=mtd-snapshot.tar.bz2
-MTD_SITE:=ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/cvs
-MTD_HOST_DIR := $(TOOL_BUILD_DIR)/mtd_snapshot
-MTD_DIR:=$(BUILD_DIR)/mtd_snapshot
-else
-MTD_SOURCE:=$(strip $(subst ",, $(BR2_PACKAGE_MTD_ORIG_STRING)))
-#"))
-MTD_SITE:=http://ftp.debian.org/debian/pool/main/m/mtd
+MTD_SOURCE=mtd_20061007.orig.tar.gz
+MTD_SITE=http://ftp.debian.org/debian/pool/main/m/mtd
 MTD_HOST_DIR := $(TOOL_BUILD_DIR)/mtd_orig
 MTD_DIR:=$(BUILD_DIR)/mtd_orig
-MTD_CAT:=$(ZCAT)
-endif
-
-
+MTD_CAT:=zcat
 
 #############################################################
 #
@@ -31,30 +17,16 @@
 #############################################################
 MKFS_JFFS2 := $(MTD_HOST_DIR)/util/mkfs.jffs2
 
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
-	touch $(MTD_HOST_DIR)/.unpacked
-else
-ifneq ($(MTD_SOURCE),)
 $(DL_DIR)/$(MTD_SOURCE):
 	$(WGET) -P $(DL_DIR) $(MTD_SITE)/$(MTD_SOURCE)
-endif
 
 $(MTD_HOST_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
-	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOL_BUILD_DIR)
$(TAR_OPTIONS) -
+	zcat $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	mv $(TOOL_BUILD_DIR)/$(shell tar tzf $(DL_DIR)/$(MTD_SOURCE) | head -n 1 \
 		| xargs basename) $(MTD_HOST_DIR)
 	toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
 		package/mtd \*.patch
 	touch $(MTD_HOST_DIR)/.unpacked
-endif
 
 $(MTD_HOST_DIR)/util/mkfs.jffs2: $(MTD_HOST_DIR)/.unpacked
 	CC="$(HOSTCC)" CROSS= CFLAGS=-I$(LINUX_HEADERS_DIR)/include \
@@ -76,24 +48,18 @@
 #
 #############################################################
 $(MTD_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
-	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-ifeq ($(strip $(BR2_PACKAGE_MTD_SNAPSHOT)),y)
-	mv $(BUILD_DIR)/$(shell tar tjf $(DL_DIR)/$(MTD_SOURCE) \
-		| head -n 1 | xargs basename) $(MTD_DIR)
-	touch $(MTD_DIR)/.unpacked
-else
+	zcat $(DL_DIR)/$(MTD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	mv $(BUILD_DIR)/$(shell tar tzf $(DL_DIR)/$(MTD_SOURCE) \
 		| head -n 1 | xargs basename) $(MTD_DIR)
 	toolchain/patch-kernel.sh $(MTD_DIR) \
 		package/mtd \*.patch
 	touch $(MTD_DIR)/.unpacked
-endif
 
 MTD_TARGETS_n :=
 MTD_TARGETS_y :=
 
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASE)		+= flash_erase
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASEALL)		+= flash_eraseall
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASEALL)	+= flash_eraseall
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_INFO)		+= flash_info
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_LOCK)		+= flash_lock
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_UNLOCK)		+= flash_unlock
@@ -113,24 +79,17 @@
 MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK)			+= docfdisk
 MTD_TARGETS_$(BR2_PACKAGE_MTD_DOC_LOADBIOS)		+= doc_loadbios
 
-MTD_BUILD_TARGETS := $(addprefix $(MTD_DIR)/util/, $(MTD_TARGETS_y))
+MTD_BUILD_TARGETS := $(addprefix $(MTD_DIR)/, $(MTD_TARGETS_y))
 
 $(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
-	$(MAKE)	CC=$(TARGET_CC) CFLAGS="-I$(LINUX_HEADERS_DIR)/include
-I$(MTD_DIR)/include $(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)"
LINUXDIR=$(LINUX_DIR) -C $(MTD_DIR)/util
+	CFLAGS="-I$(LINUX_HEADERS_DIR)/include -I$(STAGING_DIR)/include
$(TARGET_CFLAGS)" \
+	$(MAKE)	CROSS= CC=$(TARGET_CC) LINUXDIR=$(LINUX_DIR) WITHOUT_XATTR=1 -C
$(MTD_DIR)
 
 MTD_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_y))
 
-$(MTD_TARGETS): $(TARGET_DIR)/usr/sbin/% : $(MTD_DIR)/util/%
-	mkdir -p $(TARGET_DIR)/usr/sbin
+$(MTD_TARGETS): $(TARGET_DIR)/usr/sbin/% : $(MTD_DIR)/%
 	cp -f $< $@
 	$(STRIP) $@
-ifneq ($(BR2_PACKAGE_MTD_FLASHCP),)
-	-ln -sf flashcp $(TARGET_DIR)/usr/sbin/fcp
-endif
-ifneq ($(BR2_PACKAGE_MTD_ERASE),)
-	-ln -sf flash_erase $(TARGET_DIR)/usr/sbin/erase
-	-ln -sf flash_eraseall $(TARGET_DIR)/usr/sbin/eraseall
-endif
 
 mtd: zlib $(MTD_TARGETS)
 
@@ -138,13 +97,6 @@
 
 mtd-clean:
 	-$(MAKE) -C $(MTD_DIR) clean
-ifneq ($(BR2_PACKAGE_MTD_FLASHCP),)
-	-rm -f $(MTD_TARGETS) $(TARGET_DIR)/usr/sbin/fcp
-endif
-ifneq ($(BR2_PACKAGE_MTD_ERASE),)
-	-rm -f $(MTD_TARGETS) $(TARGET_DIR)/usr/sbin/erase
-	-rm -f $(MTD_TARGETS) $(TARGET_DIR)/usr/sbin/eraseall
-endif
 
 mtd-dirclean:
 	rm -rf $(MTD_DIR)

And a new mtd.patch file:

-diff -ur mtd-20050122.orig/util/flash_eraseall.c
mtd-20050122.orig-patched/util/flash_eraseall.c
---- mtd-20050122.orig/util/flash_eraseall.c	2004-12-09 17:00:52.000000000
-0600
-+++ mtd-20050122.orig-patched/util/flash_eraseall.c	2007-01-13
22:56:51.864233154 -0600
-@@ -54,7 +54,7 @@
- static void display_help (void);
- static void display_version (void);
- static struct jffs2_unknown_node cleanmarker;
--static int target_endian = __BYTE_ORDER;
-+int target_endian = __BYTE_ORDER;
+diff -urN mtd-20061007.orig/Makefile mtd-20061007.orig.patch/Makefile
+--- mtd-20061007.orig/Makefile	2006-10-07 16:33:37.000000000 +0100
++++ mtd-20061007.orig.patch/Makefile	2007-01-09 14:06:22.000000000 +0000
+@@ -9,12 +9,10 @@
+ #CROSS=arm-linux-
+ CC := $(CROSS)gcc
+ CFLAGS := -I./include -O2 -Wall
++BUILDDIR := .
  
- int main (int argc, char *argv[])
- {
-@@ -134,7 +134,7 @@
- 				if (!quiet)
- 					printf ("\nSkipping bad block@0x%08x\n", erase.start);
- 				continue;
--			} else if (ret == -EOPNOTSUPP) {
-+			} else if (errno == -EOPNOTSUPP) {
- 				fprintf(stderr, "%s: %s: Bad block check not available\n", exe_name,
mtd_device);
- 				bbtest = 0;
- 			} else if (ret < 0) {
-diff -ur mtd-20050122.orig/util/mkfs.jffs2.c
mtd-20050122.orig-patched/util/mkfs.jffs2.c
---- mtd-20050122.orig/util/mkfs.jffs2.c	2004-11-26 17:00:13.000000000 -0600
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
+-ifeq ($(origin CROSS),undefined)
+-  BUILDDIR := .
+-else
+-# Remove the trailing slash to make the directory name
+-  BUILDDIR := $(CROSS:-=)
++ifeq ($(WITHOUT_XATTR), 1)
++  CFLAGS += -DWITHOUT_XATTR
+ endif
+ 
+ RAWTARGETS = ftl_format flash_erase flash_eraseall nanddump doc_loadbios \
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
  
-diff -ur mtd-20050122.orig/util/sumtool.c
mtd-20050122.orig-patched/util/sumtool.c
---- mtd-20050122.orig/util/sumtool.c	2005-01-05 17:00:16.000000000 -0600
-+++ mtd-20050122.orig-patched/util/sumtool.c	2007-01-13 22:56:05.528616125
-0600
-@@ -68,7 +68,7 @@
- static int cleanmarker_size = sizeof(cleanmarker);
- static const char *short_options = "o:i:e:hvVblnc:p";
- static int erase_block_size = 65536;
--static int target_endian = __BYTE_ORDER;
-+int target_endian = __BYTE_ORDER;
- static int out_fd = -1;
- static int in_fd = -1;
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
  
+@@ -1451,9 +1459,11 @@
+ 	"  -q, --squash            Squash permissions and owners making all files
be owned by root\n"
+ 	"  -U, --squash-uids       Squash owners making all files be owned by
root\n"
+ 	"  -P, --squash-perms      Squash permissions on all files\n"
++#ifndef WITHOUT_XATTR
+ 	"      --with-xattr        stuff all xattr entries into image\n"
+ 	"      --with-selinux      stuff only SELinux Labels into jffs2 image\n"
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


-- 
View this message in context: http://www.nabble.com/Re%3A-Mtd-broken-in-buildroot-tf3032911.html#a8426819
Sent from the BuildRoot mailing list archive@Nabble.com.
