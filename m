From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sat, 13 Jan 2007 17:01:07 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mtd
Message-ID: <20070114010107.B754348599@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-01-13 17:01:07 -0800 (Sat, 13 Jan 2007)
New Revision: 17272

Log:
Correct spelling error and config option to create symlinks for old naming of MTD utilities. Also add in LDFLAGS and such to building with external toolchains.


Modified:
   trunk/buildroot/package/mtd/Config.in
   trunk/buildroot/package/mtd/mtd.mk


Changeset:
Modified: trunk/buildroot/package/mtd/Config.in
===================================================================
--- trunk/buildroot/package/mtd/Config.in	2007-01-14 00:59:10 UTC (rev 17271)
+++ trunk/buildroot/package/mtd/Config.in	2007-01-14 01:01:07 UTC (rev 17272)
@@ -57,7 +57,7 @@
 	depends on BR2_PACKAGE_MTD
 
 config BR2_PACKAGE_MTD_FLASH_LOCK
-	bool "flash_loco"
+	bool "flash_lock"
 	default y
 	depends on BR2_PACKAGE_MTD
 
@@ -71,6 +71,11 @@
 	default y
 	depends on BR2_PACKAGE_MTD
 
+config BR2_PACKAGE_MTD_ERASE
+	bool "erase"
+	default y
+	depends on BR2_PACKAGE_MTD
+
 config BR2_PACKAGE_MTD_JFFS2DUMP
 	bool "jffs2dump"
 	default y

Modified: trunk/buildroot/package/mtd/mtd.mk
===================================================================
--- trunk/buildroot/package/mtd/mtd.mk	2007-01-14 00:59:10 UTC (rev 17271)
+++ trunk/buildroot/package/mtd/mtd.mk	2007-01-14 01:01:07 UTC (rev 17272)
@@ -116,14 +116,21 @@
 MTD_BUILD_TARGETS := $(addprefix $(MTD_DIR)/util/, $(MTD_TARGETS_y))
 
 $(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
-	CFLAGS="-I$(LINUX_HEADERS_DIR)/include $(TARGET_CFLAGS)" \
-	$(MAKE)	CC=$(TARGET_CC) LINUXDIR=$(LINUX_DIR) -C $(MTD_DIR)/util
+	$(MAKE)	CC=$(TARGET_CC) CFLAGS="-I$(LINUX_HEADERS_DIR)/include -I$(MTD_DIR)/include $(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" LINUXDIR=$(LINUX_DIR) -C $(MTD_DIR)/util
 
 MTD_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_y))
 
 $(MTD_TARGETS): $(TARGET_DIR)/usr/sbin/% : $(MTD_DIR)/util/%
+	mkdir -p $(TARGET_DIR)/usr/sbin
 	cp -f $< $@
 	$(STRIP) $@
+ifneq ($(BR2_PACKAGE_MTD_FLASHCP),)
+	-ln -sf flashcp $(TARGET_DIR)/usr/sbin/fcp
+endif
+ifneq ($(BR2_PACKAGE_MTD_ERASE),)
+	-ln -sf flash_erase $(TARGET_DIR)/usr/sbin/erase
+	-ln -sf flash_eraseall $(TARGET_DIR)/usr/sbin/eraseall
+endif
 
 mtd: zlib $(MTD_TARGETS)
 
@@ -131,6 +138,13 @@
 
 mtd-clean:
 	-$(MAKE) -C $(MTD_DIR) clean
+ifneq ($(BR2_PACKAGE_MTD_FLASHCP),)
+	-rm -f $(MTD_TARGETS) $(TARGET_DIR)/usr/sbin/fcp
+endif
+ifneq ($(BR2_PACKAGE_MTD_ERASE),)
+	-rm -f $(MTD_TARGETS) $(TARGET_DIR)/usr/sbin/erase
+	-rm -f $(MTD_TARGETS) $(TARGET_DIR)/usr/sbin/eraseall
+endif
 
 mtd-dirclean:
 	rm -rf $(MTD_DIR)
