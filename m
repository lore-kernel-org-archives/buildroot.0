From: Michael Roth <mroth@nessie.de>
Date: Thu, 26 Mar 2009 22:34:38 +0100
Subject: [Buildroot] [PATCH 4/5] mtd-utils: Version bump of the GIT source
In-Reply-To: <1238103279-8040-1-git-send-email-mroth@nessie.de>
References: <1238103279-8040-1-git-send-email-mroth@nessie.de>
Message-ID: <1238103279-8040-5-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GIT version of mtd-utils bumped to 2009-03-26 and support
for the included mkfs.ubifs added.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/mtd/Config.in                              |    9 +
 package/mtd/git/mtd.mk                             |  178 ++++++++++++++++++++
 package/mtd/git/remove-file-offset-bits.patch      |   11 ++
 .../mtd/mtd-utils.git/mtd-utils-all-targets.patch  |   34 ----
 .../mtd/mtd-utils.git/mtd-utils-target-acl.patch   |   48 ------
 package/mtd/mtd-utils.git/mtd.mk                   |  145 ----------------
 package/mtd/mtd.mk                                 |    2 +-
 7 files changed, 199 insertions(+), 228 deletions(-)
 create mode 100644 package/mtd/git/mtd.mk
 create mode 100644 package/mtd/git/remove-file-offset-bits.patch
 delete mode 100644 package/mtd/mtd-utils.git/mtd-utils-all-targets.patch
 delete mode 100644 package/mtd/mtd-utils.git/mtd-utils-target-acl.patch
 delete mode 100644 package/mtd/mtd-utils.git/mtd.mk

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 6514bb1..fa86f5f 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -43,6 +43,7 @@ config BR2_PACKAGE_MTD_UTILS_1_2_0
 
 config BR2_PACKAGE_MTD_UTILS_GIT
 	bool "mtd-utils (almost) latest GIT"
+	select BR2_PACKAGE_LZO
 	help
 	  Use the latest from GIT or a particular revision.
 	  You should probably say NO except for specific purpose.
@@ -111,6 +112,14 @@ config BR2_PACKAGE_MTD_MKFSJFFS2
 	bool "mkfs.jffs2"
 	default y
 
+config BR2_PACKAGE_MTD_MKFSUBIFS
+	bool "mkfs.ubifs"
+	default n
+	depends on BR2_PACKAGE_MTD_UTILS_GIT && BR2_LARGEFILE && BR2_PACKAGE_E2FSPROGS
+
+comment "mkfs.ubifs requires LARGEFILE support and depends on e2fsprogs"
+        depends on BR2_PACKAGE_MTD_UTILS_GIT && (!BR2_LARGEFILE || !BR2_PACKAGE_E2FSPROGS)
+
 config BR2_PACKAGE_MTD_MTD_DEBUG
 	bool "mtd_debug"
 	default y
diff --git a/package/mtd/git/mtd.mk b/package/mtd/git/mtd.mk
new file mode 100644
index 0000000..fffc84a
--- /dev/null
+++ b/package/mtd/git/mtd.mk
@@ -0,0 +1,178 @@
+#############################################################
+#
+# mtd provides flash, jffs2 and ubifs utilities
+#
+#############################################################
+MTD_VERSION:=0e9ed134f2092cef975f05aea2c1e415137e0c10
+MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.gz
+MTD_URL:=http://git.infradead.org/mtd-utils.git?a=snapshot;h=$(MTD_VERSION);sf=tgz
+MTD_HOST_DIR:= $(TOOL_BUILD_DIR)/mtd-utils-$(MTD_VERSION)
+MTD_DIR:=$(BUILD_DIR)/mtd-utils-$(MTD_VERSION)
+MTD_CAT:=$(ZCAT)
+MTD_NAME:=mtd-utils
+
+#############################################################
+#
+# Build mkfs.jffs2, sumtool and mkfs.ubifs for use on the local
+# host system if needed by target/jffs2 and target/ubifs.
+#
+#############################################################
+MKFS_JFFS2 := $(MTD_HOST_DIR)/mkfs.jffs2
+SUMTOOL := $(MTD_HOST_DIR)/sumtool
+MKFS_UBIFS := $(MTD_HOST_DIR)/mkfs.ubifs/mkfs.ubifs
+
+$(DL_DIR)/$(MTD_SOURCE):
+	$(WGET) -O $(DL_DIR)/$(MTD_SOURCE) "$(MTD_URL)"
+
+$(MTD_HOST_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
+	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	rm -rf $(MTD_HOST_DIR)
+	mv $(TOOL_BUILD_DIR)/$(MTD_NAME) $(MTD_HOST_DIR)
+	touch $@
+
+$(MKFS_JFFS2) $(SUMTOOL): $(MTD_HOST_DIR)/.unpacked
+	$(MAKE) CFLAGS= LDFLAGS= \
+		BUILDDIR=$(MTD_HOST_DIR) \
+		CC="$(HOSTCC)" CROSS= WITHOUT_XATTR=1 -C $(MTD_HOST_DIR) \
+		$(MKFS_JFFS2) $(SUMTOOL)
+
+$(MKFS_UBIFS): $(MTD_HOST_DIR)/.unpacked
+	$(MAKE) CFLAGS= LDFLAGS= \
+		BUILDDIR=$(MTD_HOST_DIR)/mkfs.ubifs \
+		CC="$(HOSTCC)" CROSS= WITHOUT_XATTR=1 -C $(MTD_HOST_DIR)/mkfs.ubifs \
+		$(MKFS_UBIFS)
+
+mtd-host-jffs2: $(MKFS_JFFS2) $(SUMTOOL)
+
+mtd-host-jffs2-clean:
+	-$(MAKE) -C $(MTD_HOST_DIR) clean
+
+mtd-host-ubifs: $(MKFS_UBIFS)
+
+mtd-host-ubifs-clean:
+	-$(MAKE) -C $(MTD_HOST_DIR)/mkfs.ubifs clean
+
+mtd-host: mtd-host-jffs2 mtd-host-ubifs
+
+mtd-host-source: $(DL_DIR)/$(MTD_SOURCE)
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
+	rm -rf $(MTD_DIR)
+	mv $(BUILD_DIR)/$(MTD_NAME) $(MTD_DIR)
+ifneq ($(BR2_LARGEFILE),y)
+	toolchain/patch-kernel.sh $(MTD_DIR) package/mtd/git remove-file-offset-bits.patch
+endif
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
+MTD_TARGETS_$(BR2_PACKAGE_MTD_SERVE_IMAGE) += serve_image
+MTD_TARGETS_$(BR2_PACKAGE_MTD_RECV_IMAGE) += recv_image
+
+MTD_TARGETS_UBI_n :=
+MTD_TARGETS_UBI_y :=
+
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIATTACH) += ubiattach
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBICRC32) += ubicrc32
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIDETACH) += ubidetach
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIFORMAT) += ubiformat
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIMKVOL) += ubimkvol
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBINFO) += ubinfo
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBINIZE) += ubinize
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRMVOL) += ubirmvol
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIUPDATEVOL) += ubiupdatevol
+
+MTD_TARGETS_MKFSUBIFS_n :=
+MTD_TARGETS_MKFSUBIFS_y :=
+
+MTD_TARGETS_MKFSUBIFS_$(BR2_PACKAGE_MTD_MKFSUBIFS) += mkfs.ubifs
+
+MTD_BUILD_TARGETS := $(addprefix $(MTD_DIR)/, $(MTD_TARGETS_y))
+MTD_BUILD_UBI_TARGETS := $(addprefix $(MTD_DIR)/ubi-utils/, $(MTD_TARGETS_UBI_y))
+MTD_BUILD_MKFSUBIFS_TARGETS := $(addprefix $(MTD_DIR)/mkfs.ubifs/, $(MTD_TARGETS_MKFSUBIFS_y))
+
+$(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
+	$(MAKE) CFLAGS="-I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		BUILDDIR=$(MTD_DIR) \
+		CROSS=$(TARGET_CROSS) WITHOUT_XATTR=1 -C $(MTD_DIR) \
+		$(MTD_BUILD_TARGETS)
+
+$(MTD_BUILD_UBI_TARGETS): $(MTD_DIR)/.unpacked
+	$(MAKE) CFLAGS="-I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		BUILDDIR=$(MTD_DIR)/ubi-utils \
+		CROSS=$(TARGET_CROSS) -C $(MTD_DIR)/ubi-utils \
+		$(MTD_BUILD_UBI_TARGETS)
+
+$(MTD_BUILD_MKFSUBIFS_TARGETS): $(MTD_HOST_DIR)/.unpacked
+	$(MAKE) CFLAGS="-I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		BUILDDIR=$(MTD_DIR)/mkfs.ubifs \
+		CROSS=$(TARGET_CROSS) -C $(MTD_DIR)/mkfs.ubifs \
+		$(MTD_BUILD_MKFSUBIFS_TARGETS)
+
+MTD_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_y))
+MTD_UBI_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_UBI_y))
+MTD_MKFSUBIFS_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_MKFSUBIFS_y))
+
+$(MTD_TARGETS): $(TARGET_DIR)/usr/sbin/% : $(MTD_DIR)/%
+	cp -f $< $@
+	$(STRIPCMD) $@
+
+$(MTD_UBI_TARGETS): $(TARGET_DIR)/usr/sbin/% : $(MTD_DIR)/ubi-utils/%
+	cp -f $< $@
+	$(STRIPCMD) $@
+
+$(MTD_MKFSUBIFS_TARGETS): $(TARGET_DIR)/usr/sbin/% : $(MTD_DIR)/mkfs.ubifs/%
+	cp -f $< $@
+	$(STRIPCMD) $@
+
+mtd: zlib lzo $(MTD_TARGETS) $(MTD_UBI_TARGETS) $(MTD_MKFSUBIFS_TARGETS)
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
+ifeq ($(BR2_PACKAGE_MTD),y)
+TARGETS+=mtd
+endif
diff --git a/package/mtd/git/remove-file-offset-bits.patch b/package/mtd/git/remove-file-offset-bits.patch
new file mode 100644
index 0000000..1905a8a
--- /dev/null
+++ b/package/mtd/git/remove-file-offset-bits.patch
@@ -0,0 +1,11 @@
+diff -ur mtd-utils.git/common.mk mtd-utils.work/common.mk
+--- mtd-utils.git/common.mk	2009-03-25 22:58:54.000000000 +0100
++++ mtd-utils.work/common.mk	2009-03-26 01:22:24.000000000 +0100
+@@ -12,7 +12,6 @@
+ 	$(call cc-option,-Wwrite-strings) \
+ 	$(call cc-option,-Wno-sign-compare)
+ CFLAGS += $(WFLAGS)
+-CPPFLAGS += -D_FILE_OFFSET_BITS=64
+ 
+ DESTDIR ?= /usr/local
+ PREFIX=/usr
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
index ca25ee5..0000000
--- a/package/mtd/mtd-utils.git/mtd.mk
+++ /dev/null
@@ -1,145 +0,0 @@
-#############################################################
-#
-# mtd provides jffs2 utilities
-#
-#############################################################
-MTD_VERSION:=fcb52ccc99679460640386c297023f852b108f68
-MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.gz
-MTD_URL:=http://git.infradead.org/mtd-utils.git?a=snapshot;h=$(MTD_VERSION);sf=tgz
-MTD_HOST_DIR:= $(TOOL_BUILD_DIR)/mtd-utils-$(MTD_VERSION)
-MTD_DIR:=$(BUILD_DIR)/mtd-utils-$(MTD_VERSION)
-MTD_CAT:=$(ZCAT)
-MTD_NAME:=mtd-utils
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
-	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
-	rm -rf $(MTD_HOST_DIR)
-	mv $(TOOL_BUILD_DIR)/$(MTD_NAME) $(MTD_HOST_DIR)
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
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASE) += flash_erase
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASEALL) += flash_eraseall
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_INFO) += flash_info
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_LOCK) += flash_lock
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_UNLOCK) += flash_unlock
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASHCP) += flashcp
-MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS2) += mkfs.jffs2
-MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS2DUMP) += jffs2dump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_SUMTOOL) += sumtool
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_CHECK) += ftl_check
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_FORMAT) += ftl_format
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTLDUMP) += nftldump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTL_FORMAT) += nftl_format
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDDUMP) += nanddump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDTEST) += nandtest
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDWRITE) += nandwrite
-MTD_TARGETS_$(BR2_PACKAGE_MTD_MTD_DEBUG) += mtd_debug
-MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK) += docfdisk
-MTD_TARGETS_$(BR2_PACKAGE_MTD_DOC_LOADBIOS) += doc_loadbios
-
-MTD_TARGETS_UBI_n :=
-MTD_TARGETS_UBI_y :=
-
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIATTACH) += ubiattach
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBICRC32) += ubicrc32
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIDETACH) += ubidetach
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIMIRROR) += ubimirror
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIMKVOL) += ubimkvol
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBINFO) += ubinfo
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRMVOL) += ubirmvol
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIUPDATEVOL) += ubiupdatevol
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
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 7a2c70e..f7222b3 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -11,5 +11,5 @@ ifeq ($(BR2_PACKAGE_MTD_UTILS_20050122),y)
 include package/mtd/20050122/mtd.mk
 endif
 ifeq ($(BR2_PACKAGE_MTD_UTILS_GIT),y)
-include package/mtd/mtd-utils.git/mtd.mk
+include package/mtd/git/mtd.mk
 endif
-- 
1.6.0.6
