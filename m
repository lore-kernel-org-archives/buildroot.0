From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 3 Feb 2010 15:14:43 +0100
Subject: [Buildroot] [git commit master] mtd-utils: bump version,
	get rid of obsolete git version
Message-ID: <20100203151849.52D6E77761@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9277cb760a4cc6e62d0cd23fa938dd953e875a13
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ubimirror is gone, ubiformat/ubinize/ubirename/ubirsvol are new.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mtd/Config.in                              |   42 ++----
 package/mtd/mtd-utils-largefile.patch              |   35 +++++
 .../mtd/mtd-utils.git/mtd-utils-all-targets.patch  |   34 -----
 .../mtd/mtd-utils.git/mtd-utils-target-acl.patch   |   48 ------
 package/mtd/mtd-utils.git/mtd.mk                   |  153 --------------------
 .../mtd/mtd-utils/mtd-utils-1.2.0-all-acl.patch    |   48 ------
 .../mtd-utils-1.2.0-all-disable-ubi.patch          |   24 ---
 .../mtd-utils-1.2.0-all-flashcp-npow2-erase.patch  |   23 ---
 .../mtd-utils/mtd-utils-1.2.0-all-no-errorh.patch  |   22 ---
 .../mtd-utils/mtd-utils-1.2.0-all-targets.patch    |   34 -----
 package/mtd/mtd-utils/mtd.mk                       |  134 -----------------
 package/mtd/mtd.mk                                 |  147 ++++++++++++++++++-
 12 files changed, 192 insertions(+), 552 deletions(-)
 create mode 100644 package/mtd/mtd-utils-largefile.patch
 delete mode 100644 package/mtd/mtd-utils.git/mtd-utils-all-targets.patch
 delete mode 100644 package/mtd/mtd-utils.git/mtd-utils-target-acl.patch
 delete mode 100644 package/mtd/mtd-utils.git/mtd.mk
 delete mode 100644 package/mtd/mtd-utils/mtd-utils-1.2.0-all-acl.patch
 delete mode 100644 package/mtd/mtd-utils/mtd-utils-1.2.0-all-disable-ubi.patch
 delete mode 100644 package/mtd/mtd-utils/mtd-utils-1.2.0-all-flashcp-npow2-erase.patch
 delete mode 100644 package/mtd/mtd-utils/mtd-utils-1.2.0-all-no-errorh.patch
 delete mode 100644 package/mtd/mtd-utils/mtd-utils-1.2.0-all-targets.patch
 delete mode 100644 package/mtd/mtd-utils/mtd.mk

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index b5a2668..af71252 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -5,24 +5,6 @@ menuconfig BR2_PACKAGE_MTD
 	  Build mtd/jffs utilities
 
 if BR2_PACKAGE_MTD
-choice
-	prompt "Source package selection"
-	default BR2_PACKAGE_MTD_UTILS
-
-config BR2_PACKAGE_MTD_UTILS
-	bool "Use MTD-utils release"
-	select BR2_PACKAGE_LZO
-	help
-	  Build mtd/jffs utilities with Dataflash support
-
-config BR2_PACKAGE_MTD_UTILS_GIT
-	bool "Use MTD-utils from GIT"
-	help
-	  Use the latest from GIT or a particular revision.
-	  You should probably say NO except for specific purpose.
-
-endchoice
-
 comment "MTD tools selection"
 
 config BR2_PACKAGE_MTD_DOCFDISK
@@ -118,42 +100,46 @@ config BR2_PACKAGE_MTD_SUMTOOL
 config BR2_PACKAGE_MTD_UBIATTACH
 	bool "ubiattach"
 	default y
-	depends on BR2_PACKAGE_MTD_UTILS_GIT
 
 config BR2_PACKAGE_MTD_UBICRC32
 	bool "ubicrc32"
 	default y
-	depends on BR2_PACKAGE_MTD_UTILS_GIT
 
 config BR2_PACKAGE_MTD_UBIDETACH
 	bool "ubidetach"
 	default y
-	depends on BR2_PACKAGE_MTD_UTILS_GIT
 
-config BR2_PACKAGE_MTD_UBIMIRROR
-	bool "ubimirror"
+config BR2_PACKAGE_MTD_UBIFORMAT
+	bool "ubiformat"
 	default y
-	depends on BR2_PACKAGE_MTD_UTILS_GIT
 
 config BR2_PACKAGE_MTD_UBIMKVOL
 	bool "ubimkvol"
 	default y
-	depends on BR2_PACKAGE_MTD_UTILS_GIT
 
 config BR2_PACKAGE_MTD_UBINFO
 	bool "ubinfo"
 	default y
-	depends on BR2_PACKAGE_MTD_UTILS_GIT
+
+config BR2_PACKAGE_MTD_UBINIZE
+	bool "ubinize"
+	default y
+
+config BR2_PACKAGE_MTD_UBIRENAME
+	bool "ubirename"
+	default y
 
 config BR2_PACKAGE_MTD_UBIRMVOL
 	bool "ubirmvol"
 	default y
-	depends on BR2_PACKAGE_MTD_UTILS_GIT
+
+config BR2_PACKAGE_MTD_UBIRSVOL
+	bool "ubirsvol"
+	default y
 
 config BR2_PACKAGE_MTD_UBIUPDATEVOL
 	bool "ubiupdatevol"
 	default y
-	depends on BR2_PACKAGE_MTD_UTILS_GIT
 
 endif
 
diff --git a/package/mtd/mtd-utils-largefile.patch b/package/mtd/mtd-utils-largefile.patch
new file mode 100644
index 0000000..91ef7b4
--- /dev/null
+++ b/package/mtd/mtd-utils-largefile.patch
@@ -0,0 +1,35 @@
+From 90be45c82fa8c54ceb202619024142ed3db11c14 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <jacmet@sunsite.dk>
+Date: Wed, 3 Feb 2010 09:23:19 +0100
+Subject: [PATCH] mtd-utils: add option to not force largefile support
+
+Not all systems have largefile support (E.G. uClibc depending on config),
+so unconditionally enforcing largefile breaks the build.
+
+Work around it by adding a WITHOUT_LARGEFILE flag, similar to the existing
+WITHOUT_XATTR.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ common.mk |    5 ++++-
+ 1 files changed, 4 insertions(+), 1 deletions(-)
+
+diff --git a/common.mk b/common.mk
+index 5e92b07..d704b44 100644
+--- a/common.mk
++++ b/common.mk
+@@ -12,7 +12,10 @@ WFLAGS := -Wall \
+ 	$(call cc-option,-Wwrite-strings) \
+ 	$(call cc-option,-Wno-sign-compare)
+ CFLAGS += $(WFLAGS)
+-CPPFLAGS += -D_FILE_OFFSET_BITS=64
++
++ifneq ($(WITHOUT_LARGEFILE), 1)
++  CPPFLAGS += -D_FILE_OFFSET_BITS=64
++endif
+ 
+ DESTDIR ?= /usr/local
+ PREFIX=/usr
+-- 
+1.6.5
+
diff --git a/package/mtd/mtd-utils.git/mtd-utils-all-targets.patch b/package/mtd/mtd-utils.git/mtd-utils-all-targets.patch
deleted file mode 100644
index e887118..0000000
--- a/package/mtd/mtd-utils.git/mtd-utils-all-targets.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-diff -urN mtd-utils-1.1.0-0rig/Makefile mtd-utils-1.1.0/Makefile
---- mtd-utils-1.1.0-0rig/Makefile	2007-08-03 15:55:51.000000000 +0200
-+++ mtd-utils-1.1.0/Makefile	2007-09-27 08:20:55.000000000 +0200
-@@ -72,6 +72,30 @@
- $(BUILDDIR)/sumtool: $(BUILDDIR)/sumtool.o $(BUILDDIR)/crc32.o
- 	$(CC) $(LDFLAGS) -o $@ $^
- 
-+ftl_format:	$(BUILDDIR)/ftl_format
-+flash_erase:	$(BUILDDIR)/flash_erase
-+flash_eraseall:	$(BUILDDIR)/flash_eraseall
-+nanddump:	$(BUILDDIR)/nanddump
-+doc_loadbios:	$(BUILDDIR)/doc_loadbios
-+mkfs.jffs:	$(BUILDDIR)/mkfs.jffs
-+ftl_check:	$(BUILDDIR)/ftl_check
-+mkfs.jffs2:	$(BUILDDIR)/mkfs.jffs2
-+flash_lock:	$(BUILDDIR)/flash_lock
-+flash_unlock:	$(BUILDDIR)/flash_unlock
-+flash_info:	$(BUILDDIR)/flash_info
-+flash_otp_info:	$(BUILDDIR)/flash_otp_info
-+flash_otp_dump:	$(BUILDDIR)/flash_otp_dump
-+mtd_debug:	$(BUILDDIR)/mtd_debug
-+flashcp:	$(BUILDDIR)/flashcp
-+nandwrite:	$(BUILDDIR)/nandwrite
-+jffs2dump:	$(BUILDDIR)/jffs2dump
-+nftldump:	$(BUILDDIR)/nftldump
-+nftl_format:	$(BUILDDIR)/nftl_format
-+docfdisk:	$(BUILDDIR)/docfdisk
-+rfddump:	$(BUILDDIR)/rfddump
-+rfdformat:	$(BUILDDIR)/rfdformat
-+sumtool:	$(BUILDDIR)/sumtool
-+
- install: ${TARGETS}
- 	mkdir -p ${DESTDIR}/${SBINDIR}
- 	install -m0755 ${TARGETS} ${DESTDIR}/${SBINDIR}/
diff --git a/package/mtd/mtd-utils.git/mtd-utils-target-acl.patch b/package/mtd/mtd-utils.git/mtd-utils-target-acl.patch
deleted file mode 100644
index 953786e..0000000
--- a/package/mtd/mtd-utils.git/mtd-utils-target-acl.patch
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
diff --git a/package/mtd/mtd-utils.git/mtd.mk b/package/mtd/mtd-utils.git/mtd.mk
deleted file mode 100644
index f65b171..0000000
--- a/package/mtd/mtd-utils.git/mtd.mk
+++ /dev/null
@@ -1,153 +0,0 @@
-#############################################################
-#
-# mtd provides jffs2 utilities
-#
-#############################################################
-MTD_VERSION:=fcb52ccc99679460640386c297023f852b108f68
-# gitweb >= 1.6.6-rc1 uses first 7 chars of git SHA1 as dir suffix
-MTD_SHORT_VERSION=$(shell echo $(MTD_VERSION)|cut -c -7)
-MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.gz
-MTD_URL:=http://git.infradead.org/mtd-utils.git?a=snapshot;h=$(MTD_VERSION);sf=tgz
-MTD_HOST_DIR:= $(TOOLCHAIN_DIR)/mtd-utils-$(MTD_VERSION)
-MTD_DIR:=$(BUILD_DIR)/mtd-utils-$(MTD_VERSION)
-MTD_CAT:=$(ZCAT)
-MTD_NAME:=mtd-utils-$(MTD_SHORT_VERSION)
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
-	$(WGET) -O $(DL_DIR)/$(MTD_SOURCE) "$(MTD_URL)"
-
-$(MTD_HOST_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
-	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
-	rm -rf $(MTD_HOST_DIR)
-	mv $(TOOLCHAIN_DIR)/$(MTD_NAME) $(MTD_HOST_DIR)
-	toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
-		package/mtd/mtd-utils.git mtd-utils-all\*.patch
-	toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
-		package/mtd/mtd-utils.git mtd-utils-host\*.patch
-	touch $@
-
-
-$(MKFS_JFFS2): $(MTD_HOST_DIR)/.unpacked
-	CC="$(HOSTCC)" CROSS= CFLAGS=-I$(LINUX_HEADERS_DIR)/include \
-		$(MAKE) \
-		BUILDDIR=$(MTD_HOST_DIR) WITHOUT_XATTR=1 \
-		-C $(MTD_HOST_DIR) mkfs.jffs2
-
-$(SUMTOOL): $(MTD_HOST_DIR)/.unpacked
-	CC="$(HOSTCC)" CROSS= CFLAGS=-I$(LINUX_HEADERS_DIR)/include \
-		$(MAKE) \
-		BUILDDIR=$(MTD_HOST_DIR) WITHOUT_XATTR=1 \
-		-C $(MTD_HOST_DIR) sumtool
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
-	rm -rf $(MTD_DIR)
-	mv $(BUILD_DIR)/$(MTD_NAME) $(MTD_DIR)
-	toolchain/patch-kernel.sh $(MTD_DIR) package/mtd/mtd-utils.git mtd-utils-all\*.patch
-	toolchain/patch-kernel.sh $(MTD_DIR) package/mtd/mtd-utils.git mtd-utils-target\*.patch
-	touch $@
-
-MTD_TARGETS_n :=
-MTD_TARGETS_y :=
-
-MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK)		+= docfdisk
-MTD_TARGETS_$(BR2_PACKAGE_MTD_DOC_LOADBIOS)	+= doc_loadbios
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASHCP)		+= flashcp
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASE)	+= flash_erase
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASEALL)	+= flash_eraseall
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_INFO)	+= flash_info
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_LOCK)	+= flash_lock
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_DUMP)	+= flash_otp_dump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_INFO)	+= flash_otp_info
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_UNLOCK)	+= flash_unlock
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_CHECK)	+= ftl_check
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_FORMAT)	+= ftl_format
-MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS2DUMP)	+= jffs2dump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS2)	+= mkfs.jffs2
-MTD_TARGETS_$(BR2_PACKAGE_MTD_MTD_DEBUG)	+= mtd_debug
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDDUMP)		+= nanddump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDTEST)		+= nandtest
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDWRITE)	+= nandwrite
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTLDUMP)		+= nftldump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTL_FORMAT)	+= nftl_format
-MTD_TARGETS_$(BR2_PACKAGE_MTD_RECV_IMAGE)	+= recv_image
-MTD_TARGETS_$(BR2_PACKAGE_MTD_RFDDUMP)		+= rfddump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_RFDFORMAT)	+= rfdformat
-MTD_TARGETS_$(BR2_PACKAGE_MTD_SERVE_IMAGE)	+= serve_image
-MTD_TARGETS_$(BR2_PACKAGE_MTD_SUMTOOL)		+= sumtool
-
-MTD_TARGETS_UBI_n :=
-MTD_TARGETS_UBI_y :=
-
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIATTACH)	+= ubiattach
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBICRC32)	+= ubicrc32
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIDETACH)	+= ubidetach
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIMIRROR)	+= ubimirror
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIMKVOL)	+= ubimkvol
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBINFO)	+= ubinfo
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRMVOL)	+= ubirmvol
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIUPDATEVOL)	+= ubiupdatevol
-
-MTD_BUILD_TARGETS := $(addprefix $(MTD_DIR)/, $(MTD_TARGETS_y)) $(addprefix $(MTD_DIR)/ubi-utils/, $(MTD_TARGETS_UBI_y))
-
-$(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
-	mkdir -p $(TARGET_DIR)/usr/sbin
-	$(MAKE1) OPTFLAGS="-DNEED_BCOPY -Dbcmp=memcmp -I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
-	       BUILDDIR=$(MTD_DIR) \
-	       CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) WITHOUT_XATTR=1 -C $(MTD_DIR)
-
-MTD_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_y))
-MTD_UBI_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_UBI_y))
-
-$(MTD_TARGETS): $(TARGET_DIR)/usr/sbin/% : $(MTD_DIR)/%
-	cp -f $< $@
-	$(STRIPCMD) $@
-
-$(MTD_UBI_TARGETS): $(TARGET_DIR)/usr/sbin/% : $(MTD_DIR)/ubi-utils/%
-	cp -f $< $@
-	$(STRIPCMD) $@
-
-mtd: zlib lzo $(MTD_TARGETS) $(MTD_UBI_TARGETS)
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
diff --git a/package/mtd/mtd-utils/mtd-utils-1.2.0-all-acl.patch b/package/mtd/mtd-utils/mtd-utils-1.2.0-all-acl.patch
deleted file mode 100644
index 953786e..0000000
--- a/package/mtd/mtd-utils/mtd-utils-1.2.0-all-acl.patch
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
diff --git a/package/mtd/mtd-utils/mtd-utils-1.2.0-all-disable-ubi.patch b/package/mtd/mtd-utils/mtd-utils-1.2.0-all-disable-ubi.patch
deleted file mode 100644
index 606cb46..0000000
--- a/package/mtd/mtd-utils/mtd-utils-1.2.0-all-disable-ubi.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-diff -Nura mtd-utils-1.2.0/Makefile mtd-utils-1.2.0-noubi/Makefile
---- mtd-utils-1.2.0/Makefile	2008-06-27 13:21:28.000000000 -0300
-+++ mtd-utils-1.2.0-noubi/Makefile	2009-12-23 10:26:25.000000000 -0300
-@@ -45,7 +45,6 @@
- .SUFFIXES:
- 
- all: $(TARGETS)
--	make -C $(BUILDDIR)/ubi-utils
- 
- IGNORE=${wildcard $(BUILDDIR)/.*.c.dep}
- -include ${IGNORE}
-@@ -53,7 +52,6 @@
- clean:
- 	rm -f $(BUILDDIR)/*.o $(TARGETS) $(BUILDDIR)/.*.c.dep $(SYMLINKS)
- 	if [ "$(BUILDDIR)x" != ".x" ]; then rm -rf $(BUILDDIR); fi
--	make -C $(BUILDDIR)/ubi-utils clean
- 
- $(SYMLINKS):
- 	ln -sf ../fs/jffs2/$@ $@
-@@ -95,4 +93,3 @@
- 	install -m0755 ${TARGETS} ${DESTDIR}/${SBINDIR}/
- 	mkdir -p ${DESTDIR}/${MANDIR}/man1
- 	gzip -9c mkfs.jffs2.1 > ${DESTDIR}/${MANDIR}/man1/mkfs.jffs2.1.gz
--	make -C $(BUILDDIR)/ubi-utils install
diff --git a/package/mtd/mtd-utils/mtd-utils-1.2.0-all-flashcp-npow2-erase.patch b/package/mtd/mtd-utils/mtd-utils-1.2.0-all-flashcp-npow2-erase.patch
deleted file mode 100644
index b9a0a60..0000000
--- a/package/mtd/mtd-utils/mtd-utils-1.2.0-all-flashcp-npow2-erase.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-flashcp: handle non-power-of-2 erase size (E.G. for dataflash)
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- flashcp.c |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-Index: mtd-utils-1.1.0/flashcp.c
-===================================================================
---- mtd-utils-1.1.0.orig/flashcp.c	2007-08-03 15:55:51.000000000 +0200
-+++ mtd-utils-1.1.0/flashcp.c	2009-02-17 14:02:09.000000000 +0100
-@@ -255,8 +255,9 @@
- #warning "Check for smaller erase regions"
- 
- 	erase.start = 0;
--	erase.length = filestat.st_size & ~(mtd.erasesize - 1);
--	if (filestat.st_size % mtd.erasesize) erase.length += mtd.erasesize;
-+	erase.length = (filestat.st_size + mtd.erasesize - 1) / mtd.erasesize;
-+	erase.length *= mtd.erasesize;
-+
- 	if (flags & FLAG_VERBOSE)
- 	{
- 		/* if the user wants verbose output, erase 1 block at a time and show him/her what's going on */
diff --git a/package/mtd/mtd-utils/mtd-utils-1.2.0-all-no-errorh.patch b/package/mtd/mtd-utils/mtd-utils-1.2.0-all-no-errorh.patch
deleted file mode 100644
index 1fde16b..0000000
--- a/package/mtd/mtd-utils/mtd-utils-1.2.0-all-no-errorh.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-diff -Nura mtd-utils-1.2.0/recv_image.c mtd-utils-1.2.0-noerror/recv_image.c
---- mtd-utils-1.2.0/recv_image.c	2008-06-27 13:21:28.000000000 -0300
-+++ mtd-utils-1.2.0-noerror/recv_image.c	2009-12-23 10:19:22.000000000 -0300
-@@ -2,7 +2,6 @@
- #define _XOPEN_SOURCE 500
- 
- #include <errno.h>
--#include <error.h>
- #include <stdio.h>
- #define __USE_GNU
- #include <netdb.h>
-diff -Nura mtd-utils-1.2.0/serve_image.c mtd-utils-1.2.0-noerror/serve_image.c
---- mtd-utils-1.2.0/serve_image.c	2008-06-27 13:21:28.000000000 -0300
-+++ mtd-utils-1.2.0-noerror/serve_image.c	2009-12-23 10:19:33.000000000 -0300
-@@ -3,7 +3,6 @@
- #include <time.h>
- 
- #include <errno.h>  	
--#include <error.h> 	
- #include <netdb.h> 	
- #include <stdio.h> 	
- #include <stdlib.h> 	
diff --git a/package/mtd/mtd-utils/mtd-utils-1.2.0-all-targets.patch b/package/mtd/mtd-utils/mtd-utils-1.2.0-all-targets.patch
deleted file mode 100644
index e887118..0000000
--- a/package/mtd/mtd-utils/mtd-utils-1.2.0-all-targets.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-diff -urN mtd-utils-1.1.0-0rig/Makefile mtd-utils-1.1.0/Makefile
---- mtd-utils-1.1.0-0rig/Makefile	2007-08-03 15:55:51.000000000 +0200
-+++ mtd-utils-1.1.0/Makefile	2007-09-27 08:20:55.000000000 +0200
-@@ -72,6 +72,30 @@
- $(BUILDDIR)/sumtool: $(BUILDDIR)/sumtool.o $(BUILDDIR)/crc32.o
- 	$(CC) $(LDFLAGS) -o $@ $^
- 
-+ftl_format:	$(BUILDDIR)/ftl_format
-+flash_erase:	$(BUILDDIR)/flash_erase
-+flash_eraseall:	$(BUILDDIR)/flash_eraseall
-+nanddump:	$(BUILDDIR)/nanddump
-+doc_loadbios:	$(BUILDDIR)/doc_loadbios
-+mkfs.jffs:	$(BUILDDIR)/mkfs.jffs
-+ftl_check:	$(BUILDDIR)/ftl_check
-+mkfs.jffs2:	$(BUILDDIR)/mkfs.jffs2
-+flash_lock:	$(BUILDDIR)/flash_lock
-+flash_unlock:	$(BUILDDIR)/flash_unlock
-+flash_info:	$(BUILDDIR)/flash_info
-+flash_otp_info:	$(BUILDDIR)/flash_otp_info
-+flash_otp_dump:	$(BUILDDIR)/flash_otp_dump
-+mtd_debug:	$(BUILDDIR)/mtd_debug
-+flashcp:	$(BUILDDIR)/flashcp
-+nandwrite:	$(BUILDDIR)/nandwrite
-+jffs2dump:	$(BUILDDIR)/jffs2dump
-+nftldump:	$(BUILDDIR)/nftldump
-+nftl_format:	$(BUILDDIR)/nftl_format
-+docfdisk:	$(BUILDDIR)/docfdisk
-+rfddump:	$(BUILDDIR)/rfddump
-+rfdformat:	$(BUILDDIR)/rfdformat
-+sumtool:	$(BUILDDIR)/sumtool
-+
- install: ${TARGETS}
- 	mkdir -p ${DESTDIR}/${SBINDIR}
- 	install -m0755 ${TARGETS} ${DESTDIR}/${SBINDIR}/
diff --git a/package/mtd/mtd-utils/mtd.mk b/package/mtd/mtd-utils/mtd.mk
deleted file mode 100644
index 241ba19..0000000
--- a/package/mtd/mtd-utils/mtd.mk
+++ /dev/null
@@ -1,134 +0,0 @@
-#############################################################
-#
-# mtd provides jffs2 utilities
-#
-#############################################################
-MTD_VERSION:=1.2.0
-MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.bz2
-MTD_SITE:=ftp://ftp.infradead.org/pub/mtd-utils
-MTD_HOST_DIR:= $(TOOLCHAIN_DIR)/mtd_orig
-MTD_DIR:=$(BUILD_DIR)/mtd_orig
-MTD_CAT:=$(BZCAT)
-MTD_NAME:=mtd-utils-$(MTD_VERSION)
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
-	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
-	rm -rf $(MTD_HOST_DIR)
-	mv $(TOOLCHAIN_DIR)/$(MTD_NAME) $(MTD_HOST_DIR)
-	toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
-		package/mtd/mtd-utils mtd-utils-$(MTD_VERSION)-all\*.patch
-	toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
-		package/mtd/mtd-utils mtd-utils-$(MTD_VERSION)-host\*.patch
-	touch $@
-
-
-$(MKFS_JFFS2): $(MTD_HOST_DIR)/.unpacked
-	CC="$(HOSTCC)" CROSS= LDFLAGS=-L$(HOST_DIR)/usr/lib \
-		$(MAKE) CFLAGS='-I$(HOST_DIR)/usr/include -I./include' \
-		LINUXDIR=$(LINUX_DIR) BUILDDIR=$(MTD_HOST_DIR) \
-		-C $(MTD_HOST_DIR) mkfs.jffs2
-
-$(SUMTOOL): $(MTD_HOST_DIR)/.unpacked
-	CC="$(HOSTCC)" CROSS= LDFLAGS=-L$(HOST_DIR)/usr/lib \
-		$(MAKE) CFLAGS='-I$(HOST_DIR)/usr/include -I./include' \
-		LINUXDIR=$(LINUX_DIR) BUILDDIR=$(MTD_HOST_DIR) \
-		-C $(MTD_HOST_DIR) sumtool
-
-mtd-host: host-lzo $(MKFS_JFFS2) $(SUMTOOL)
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
-	mv $(BUILD_DIR)/$(MTD_NAME) $(MTD_DIR)
-	toolchain/patch-kernel.sh $(MTD_DIR) package/mtd/mtd-utils mtd-utils-$(MTD_VERSION)-all\*.patch
-	toolchain/patch-kernel.sh $(MTD_DIR) package/mtd/mtd-utils mtd-utils-$(MTD_VERSION)-target\*.patch
-	touch $@
-
-MTD_TARGETS_n :=
-MTD_TARGETS_y :=
-
-MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK)		+= docfdisk
-MTD_TARGETS_$(BR2_PACKAGE_MTD_DOC_LOADBIOS)	+= doc_loadbios
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASHCP)		+= flashcp
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASE)	+= flash_erase
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASEALL)	+= flash_eraseall
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_INFO)	+= flash_info
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_LOCK)	+= flash_lock
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_DUMP)	+= flash_otp_dump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_INFO)	+= flash_otp_info
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_UNLOCK)	+= flash_unlock
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_CHECK)	+= ftl_check
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_FORMAT)	+= ftl_format
-MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS2DUMP)	+= jffs2dump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS2)	+= mkfs.jffs2
-MTD_TARGETS_$(BR2_PACKAGE_MTD_MTD_DEBUG)	+= mtd_debug
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDDUMP)		+= nanddump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDTEST)		+= nandtest
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDWRITE)	+= nandwrite
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTLDUMP)		+= nftldump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTL_FORMAT)	+= nftl_format
-MTD_TARGETS_$(BR2_PACKAGE_MTD_RECV_IMAGE)	+= recv_image
-MTD_TARGETS_$(BR2_PACKAGE_MTD_RFDDUMP)		+= rfddump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_RFDFORMAT)	+= rfdformat
-MTD_TARGETS_$(BR2_PACKAGE_MTD_SERVE_IMAGE)	+= serve_image
-MTD_TARGETS_$(BR2_PACKAGE_MTD_SUMTOOL)		+= sumtool
-
-MTD_BUILD_TARGETS := $(addprefix $(MTD_DIR)/, $(MTD_TARGETS_y))
-
-$(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
-	mkdir -p $(TARGET_DIR)/usr/sbin
-	$(MAKE) CFLAGS="-I. -I./include -I$(LINUX_HEADERS_DIR)/include -I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
-		BUILDDIR=$(MTD_DIR) \
-		CPPFLAGS="-DNEED_BCOPY -Dbcmp=memcmp" \
-		CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) LINUXDIR=$(LINUX26_DIR) WITHOUT_XATTR=1 -C $(MTD_DIR)
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
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index f81ea18..99bdfa7 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -1,6 +1,145 @@
-ifeq ($(BR2_PACKAGE_MTD_UTILS),y)
-include package/mtd/mtd-utils/mtd.mk
+#############################################################
+#
+# mtd provides jffs2 utilities
+#
+#############################################################
+MTD_VERSION:=1.3.1
+MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.bz2
+MTD_SITE:=ftp://ftp.infradead.org/pub/mtd-utils
+MTD_NAME:=mtd-utils-$(MTD_VERSION)
+MTD_HOST_DIR:= $(TOOLCHAIN_DIR)/$(MTD_NAME)
+MTD_DIR:=$(BUILD_DIR)/$(MTD_NAME)
+MTD_CAT:=$(BZCAT)
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
+	$(call DOWNLOAD,$(MTD_SITE),$(MTD_SOURCE))
+
+$(MTD_HOST_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
+	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
+		package/mtd/ mtd-utils-\*.patch
+	touch $@
+
+$(MKFS_JFFS2): $(MTD_HOST_DIR)/.unpacked
+	CC="$(HOSTCC)" CROSS= $(MAKE) BUILDDIR=$(MTD_HOST_DIR) \
+		WITHOUT_XATTR=1 -C $(MTD_HOST_DIR) $(MTD_HOST_DIR)/mkfs.jffs2
+
+$(SUMTOOL): $(MTD_HOST_DIR)/.unpacked
+	CC="$(HOSTCC)" CROSS= $(MAKE) BUILDDIR=$(MTD_HOST_DIR) \
+		WITHOUT_XATTR=1 -C $(MTD_HOST_DIR) $(MTD_HOST_DIR)/sumtool
+
+mtd-host: host-lzo $(MKFS_JFFS2) $(SUMTOOL)
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
+	toolchain/patch-kernel.sh $(MTD_DIR) package/mtd/ mtd-utils-\*.patch
+	touch $@
+
+MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK)		+= docfdisk
+MTD_TARGETS_$(BR2_PACKAGE_MTD_DOC_LOADBIOS)	+= doc_loadbios
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASHCP)		+= flashcp
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASE)	+= flash_erase
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASEALL)	+= flash_eraseall
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_INFO)	+= flash_info
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_LOCK)	+= flash_lock
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_DUMP)	+= flash_otp_dump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_INFO)	+= flash_otp_info
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_UNLOCK)	+= flash_unlock
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_CHECK)	+= ftl_check
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_FORMAT)	+= ftl_format
+MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS2DUMP)	+= jffs2dump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS2)	+= mkfs.jffs2
+MTD_TARGETS_$(BR2_PACKAGE_MTD_MTD_DEBUG)	+= mtd_debug
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDDUMP)		+= nanddump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDTEST)		+= nandtest
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDWRITE)	+= nandwrite
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTLDUMP)		+= nftldump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTL_FORMAT)	+= nftl_format
+MTD_TARGETS_$(BR2_PACKAGE_MTD_RECV_IMAGE)	+= recv_image
+MTD_TARGETS_$(BR2_PACKAGE_MTD_RFDDUMP)		+= rfddump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_RFDFORMAT)	+= rfdformat
+MTD_TARGETS_$(BR2_PACKAGE_MTD_SERVE_IMAGE)	+= serve_image
+MTD_TARGETS_$(BR2_PACKAGE_MTD_SUMTOOL)		+= sumtool
+
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_MTDINFO)	+= mtdinfo
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIATTACH)	+= ubiattach
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBICRC32)	+= ubicrc32
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIDETACH)	+= ubidetach
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIFORMAT)	+= ubiformat
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIMKVOL)	+= ubimkvol
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBINFO)	+= ubinfo
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBINIZE)	+= ubinize
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRENAME)	+= ubirename
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRMVOL)	+= ubirmvol
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRSVOL)	+= ubirsvol
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIUPDATEVOL)	+= ubiupdatevol
+
+MTD_TARGETS := $(addprefix $(MTD_DIR)/, $(MTD_TARGETS_y))
+MTD_UBI_TARGETS := $(addprefix $(MTD_DIR)/ubi-utils/, $(MTD_TARGETS_UBI_y))
+MTD_BUILD_TARGETS := $(MTD_TARGETS) $(MTD_UBI_TARGETS)
+
+$(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
+ifneq ($(MTD_TARGETS),)
+	$(MAKE) LDFLAGS="$(TARGET_LDFLAGS)" \
+		BUILDDIR=$(MTD_DIR) \
+		CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) \
+		WITHOUT_XATTR=1 WITHOUT_LARGEFILE=1 \
+		-C $(MTD_DIR) $(MTD_TARGETS)
 endif
-ifeq ($(BR2_PACKAGE_MTD_UTILS_GIT),y)
-include package/mtd/mtd-utils.git/mtd.mk
+ifneq ($(MTD_UBI_TARGETS),)
+	$(MAKE) LDFLAGS="$(TARGET_LDFLAGS)" \
+		BUILDDIR=$(MTD_DIR)/ubi-utils \
+		CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) \
+		WITHOUT_XATTR=1 WITHOUT_LARGEFILE=1 \
+		-C $(MTD_DIR)/ubi-utils $(MTD_UBI_TARGETS)
+endif
+
+MTD_TARGET_BINS := $(addprefix $(TARGET_DIR)/usr/sbin/,\
+		 $(MTD_TARGETS_y) $(MTD_TARGETS_UBI_y))
+
+$(MTD_TARGET_BINS): $(MTD_BUILD_TARGETS)
+	mkdir -p $(TARGET_DIR)/usr/sbin
+	$(INSTALL) -m 0755 $^ $(TARGET_DIR)/usr/sbin
+
+mtd: zlib lzo $(MTD_TARGET_BINS)
+
+mtd-source: $(DL_DIR)/$(MTD_SOURCE)
+
+mtd-clean:
+	-$(MAKE) -C $(MTD_DIR) clean
+	rm -f $(MTD_TARGET_BINS)
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
+ifeq ($(BR2_PACKAGE_MTD),y)
+TARGETS+=mtd
 endif
-- 
1.6.3.3
