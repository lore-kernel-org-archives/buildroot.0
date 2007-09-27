From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 26 Sep 2007 17:48:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mtd:  mtd-utils
Message-ID: <20070927004832.82AF6A60A7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-26 17:48:31 -0700 (Wed, 26 Sep 2007)
New Revision: 20054

Log:
Add mtd-utils-1.1.0 as mtd alternative

Added:
   trunk/buildroot/package/mtd/mtd-utils/
   trunk/buildroot/package/mtd/mtd-utils/mtd.mk

Modified:
   trunk/buildroot/package/mtd/Config.in
   trunk/buildroot/package/mtd/mtd.mk


Changeset:
Modified: trunk/buildroot/package/mtd/Config.in
===================================================================
--- trunk/buildroot/package/mtd/Config.in	2007-09-27 00:19:42 UTC (rev 20053)
+++ trunk/buildroot/package/mtd/Config.in	2007-09-27 00:48:31 UTC (rev 20054)
@@ -1,28 +1,32 @@
-config BR2_PACKAGE_MTD
+menuconfig BR2_PACKAGE_MTD
 	bool "mtd/jffs2 utilities"
 	default n
 	select BR2_PACKAGE_ZLIB
 	help
 	  Build mtd/jffs utilities
 
-config BR2_PACKAGE_MTD_EXPERIMENTAL
-	bool "Use experimental MTD (20061007)"
+if BR2_PACKAGE_MTD
+choice
+	prompt "Source package selection"
 	depends on BR2_PACKAGE_MTD
+	default BR2_PACKAGE_MTD20061007
+
+config BR2_PACKAGE_MTD_UTILS
+	bool "Use MTD-utils"
+	depends on BR2_PACKAGE_MTD
 	default n
 	help
 	  Build mtd/jffs utilities with Dataflash support
 
-
-menu "MTD package selection"
+config BR2_PACKAGE_MTD_20061007
+	bool "Use MTD from (20061007)"
 	depends on BR2_PACKAGE_MTD
-	depends on !BR2_PACKAGE_MTD_EXPERIMENTAL
-choice
-	prompt "Source package selection"
-	depends on BR2_PACKAGE_MTD
-	default BR2_PACKAGE_MTD_ORIG
+	default n
+	help
+	  Build mtd/jffs utilities with Dataflash support
 
-config BR2_PACKAGE_MTD_ORIG
-	bool "Default source"
+config BR2_PACKAGE_MTD_20050122
+	bool "Use MTD from (20050122)"
 	help
 	  Use the stable release.
 
@@ -34,23 +38,20 @@
 
 endchoice
 
-config BR2_PACKAGE_MTD_ORIG_STRING
-	string "MTD package"
-	depends on BR2_PACKAGE_MTD_ORIG
-	default "mtd_20050122.orig.tar.gz"
+config BR2_PACKAGE_MTD_SNAPSHOT_STRING
+	string	"mtd_YYYYMMDD.orig.tar.gz"
+	depends on BR2_PACKAGE_MTD_SNAPSHOT
 	help
 	  You should not modify the file name, unless you want to
 	  use a specific and private MTD package.
-	  Default is mtd_20050122.orig.tar.gz
 
-endmenu
-
 config BR2_PACKAGE_MTD_ORIG_STRING
 	string
-	depends on BR2_PACKAGE_MTD_EXPERIMENTAL
-	default "mtd_20061007.orig.tar.gz"
-	help
-	  Default is mtd_20061007.orig.tar.gz
+	depends on BR2_PACKAGE_MTD_ORIG
+	default "mtd-utils-1.1.0.tar.bz2" if BR2_PACKAGE_MTD_UTILS
+	default "mtd_20061007.orig.tar.gz" if BR2_PACKAGE_MTD_20050122
+	default "mtd_20050122.orig.tar.gz" if BR2_PACKAGE_MTD_20050122
+	default $(BR2_PACKAGE_MTD_SNAPSHOT_STRING) if BR2_PACKAGE_MTD_SNAPSHOT
 
 menu "MTD tools selection"
 	depends BR2_PACKAGE_MTD
@@ -99,14 +100,8 @@
 	bool "jffs3dump"
 	default y
 	depends on BR2_PACKAGE_MTD
-	depends on !BR2_PACKAGE_MTD_EXPERIMENTAL
+	depends on !BR2_PACKAGE_MTD_20061007
 
-config BR2_PACKAGE_MTD_JFFS3DUMP
-	bool "jffs3dump (Don't check this since it is broken)"
-	default n
-	depends on BR2_PACKAGE_MTD
-	depends on !BR2_PACKAGE_MTD_EXPERIMENTAL
-
 config BR2_PACKAGE_MTD_SUMTOOL
 	bool "sumtool"
 	default y
@@ -166,6 +161,7 @@
 	bool "doc_loadbios"
 	default y
 	depends on BR2_PACKAGE_MTD
-
 endmenu
 
+endif
+

Added: trunk/buildroot/package/mtd/mtd-utils/mtd.mk
===================================================================
--- trunk/buildroot/package/mtd/mtd-utils/mtd.mk	                        (rev 0)
+++ trunk/buildroot/package/mtd/mtd-utils/mtd.mk	2007-09-27 00:48:31 UTC (rev 20054)
@@ -0,0 +1,114 @@
+#############################################################
+#
+# mtd provides jffs2 utilities
+#
+#############################################################
+MTD_VERSION:=1.1.0
+MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.bz2
+MTD_SITE:=ftp://ftp.infradead.org/pub/mtd-utils
+MTD_HOST_DIR:= $(TOOL_BUILD_DIR)/mtd_orig
+MTD_DIR:=$(BUILD_DIR)/mtd_orig
+MTD_CAT:=$(BZCAT)
+MTD_NAME:=mtd-utils-$(MTD_VERSION)
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
+	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	rm -rf $(MTD_HOST_DIR)
+	mv $(TOOL_BUILD_DIR)/$(MTD_NAME) $(MTD_HOST_DIR)
+	toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
+		package/mtd/mtd-utils \*.patch
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
+	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	mv $(BUILD_DIR)/$(MTD_NAME) $(MTD_DIR)
+	toolchain/patch-kernel.sh $(MTD_DIR) \
+		package/mtd/mtd-utils \*.patch
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
+MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS) += mkfs.jffs
+MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS2DUMP) += jffs2dump
+#MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS3DUMP) += jffs3dump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_SUMTOOL) += sumtool
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_CHECK) += ftl_check
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_FORMAT) += ftl_format
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTLDUMP) += nftldump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTL_FORMAT) += nftl_format
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDDUMP) += nanddump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDWRITE) += nandwrite
+MTD_TARGETS_$(BR2_PACKAGE_MTD_MTD_DEBUG) += mtd_debug
+MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK) += docfdisk
+MTD_TARGETS_$(BR2_PACKAGE_MTD_DOC_LOADBIOS) += doc_loadbios
+
+MTD_BUILD_TARGETS := $(addprefix $(MTD_DIR)/, $(MTD_TARGETS_y))
+
+$(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
+	mkdir -p $(TARGET_DIR)/usr/sbin
+	$(MAKE) CFLAGS="-I. -I./include -I$(LINUX_HEADERS_DIR)/include -I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
+		CROSS= CC=$(TARGET_CC) LINUXDIR=$(LINUX26_DIR) WITHOUT_XATTR=1 -C $(MTD_DIR)
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

Modified: trunk/buildroot/package/mtd/mtd.mk
===================================================================
--- trunk/buildroot/package/mtd/mtd.mk	2007-09-27 00:19:42 UTC (rev 20053)
+++ trunk/buildroot/package/mtd/mtd.mk	2007-09-27 00:48:31 UTC (rev 20054)
@@ -1,5 +1,12 @@
-ifeq ($(strip $(BR2_PACKAGE_MTD_EXPERIMENTAL)),y)
+ifeq ($(strip $(BR2_PACKAGE_MTD_UTILS)),y)
+include package/mtd/mtd-utils/mtd.mk
+endif
+ifeq ($(strip $(BR2_PACKAGE_MTD_20061007)),y)
 include package/mtd/20061007/mtd.mk
-else
+endif
+ifeq ($(strip $(BR2_PACKAGE_MTD_20050122)),y)
 include package/mtd/20050122/mtd.mk
 endif
+ifeq ($(strip $(BR2_PACKAGE_MTD_SNAPSHOT)),y)
+include package/mtd/20050122/mtd.mk
+endif
