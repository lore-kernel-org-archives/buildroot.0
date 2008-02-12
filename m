From: hamish at uclibc.org <hamish@uclibc.org>
Date: Mon, 11 Feb 2008 21:39:33 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: package/mtd/20050122
	package/mtd/2006100 etc...
Message-ID: <20080212053933.3AE4A12C711@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-02-11 21:39:32 -0800 (Mon, 11 Feb 2008)
New Revision: 20987

Log:
Add support for summarising JFFS2 images. With support in the kernel this improves mount time significantly.


Modified:
   trunk/buildroot/package/mtd/20050122/mtd.mk
   trunk/buildroot/package/mtd/20061007/mtd.mk
   trunk/buildroot/package/mtd/mtd-utils/mtd.mk
   trunk/buildroot/target/jffs2/Config.in
   trunk/buildroot/target/jffs2/jffs2root.mk


Changeset:
Modified: trunk/buildroot/package/mtd/20050122/mtd.mk
===================================================================
--- trunk/buildroot/package/mtd/20050122/mtd.mk	2008-02-12 00:35:03 UTC (rev 20986)
+++ trunk/buildroot/package/mtd/20050122/mtd.mk	2008-02-12 05:39:32 UTC (rev 20987)
@@ -25,11 +25,12 @@
 
 #############################################################
 #
-# Build mkfs.jffs2 for use on the local host system if
+# Build mkfs.jffs2 and sumtool for use on the local host system if
 # needed by target/jffs2root.
 #
 #############################################################
 MKFS_JFFS2 := $(MTD_HOST_DIR)/util/mkfs.jffs2
+SUMTOOL := $(MTD_HOST_DIR)/util/sumtool
 
 ifeq ($(strip $(BR2_PACKAGE_MTD_SNAPSHOT)),y)
 $(DL_DIR)/$(MTD_SOURCE):
@@ -55,12 +56,16 @@
 	touch $@
 endif
 
-$(MTD_HOST_DIR)/util/mkfs.jffs2: $(MTD_HOST_DIR)/.unpacked
+$(MKFS_JFFS2): $(MTD_HOST_DIR)/.unpacked
 	CFLAGS=-I$(LINUX_HEADERS_DIR)/include $(MAKE) CC="$(HOSTCC)" CROSS= \
 		LINUXDIR=$(LINUX_DIR) -C $(MTD_HOST_DIR)/util mkfs.jffs2
 
-mtd-host: $(MKFS_JFFS2)
+$(SUMTOOL): $(MTD_HOST_DIR)/.unpacked
+	CFLAGS=-I$(LINUX_HEADERS_DIR)/include $(MAKE) CC="$(HOSTCC)" CROSS= \
+		LINUXDIR=$(LINUX_DIR) -C $(MTD_HOST_DIR)/util sumtool
 
+mtd-host: $(MKFS_JFFS2) $(SUMTOOL)
+
 mtd-host-source: $(DL_DIR)/$(MTD_SOURCE)
 
 mtd-host-clean:

Modified: trunk/buildroot/package/mtd/20061007/mtd.mk
===================================================================
--- trunk/buildroot/package/mtd/20061007/mtd.mk	2008-02-12 00:35:03 UTC (rev 20986)
+++ trunk/buildroot/package/mtd/20061007/mtd.mk	2008-02-12 05:39:32 UTC (rev 20987)
@@ -12,11 +12,12 @@
 
 #############################################################
 #
-# Build mkfs.jffs2 for use on the local host system if
+# Build mkfs.jffs2 and sumtool for use on the local host system if
 # needed by target/jffs2root.
 #
 #############################################################
 MKFS_JFFS2 := $(MTD_HOST_DIR)/mkfs.jffs2
+SUMTOOL := $(MTD_HOST_DIR)/sumtool
 
 $(DL_DIR)/$(MTD_SOURCE):
 	$(WGET) -P $(DL_DIR) $(MTD_SITE)/$(MTD_SOURCE)
@@ -29,12 +30,16 @@
 		package/mtd/$(MTD_DATE) \*.patch
 	touch $@
 
-$(MTD_HOST_DIR)/mkfs.jffs2: $(MTD_HOST_DIR)/.unpacked
+$(MKFS_JFFS2): $(MTD_HOST_DIR)/.unpacked
 	CC="$(HOSTCC)" CROSS= CFLAGS=-I$(LINUX_HEADERS_DIR)/include \
 		$(MAKE) LINUXDIR=$(LINUX_DIR) -C $(MTD_HOST_DIR) mkfs.jffs2
 
-mtd-host: $(MKFS_JFFS2)
+$(SUMTOOL): $(MTD_HOST_DIR)/.unpacked
+	CC="$(HOSTCC)" CROSS= CFLAGS=-I$(LINUX_HEADERS_DIR)/include \
+		$(MAKE) LINUXDIR=$(LINUX_DIR) -C $(MTD_HOST_DIR) sumtool
 
+mtd-host: $(MKFS_JFFS2) $(SUMTOOL)
+
 mtd-host-source: $(DL_DIR)/$(MTD_SOURCE)
 
 mtd-host-clean:

Modified: trunk/buildroot/package/mtd/mtd-utils/mtd.mk
===================================================================
--- trunk/buildroot/package/mtd/mtd-utils/mtd.mk	2008-02-12 00:35:03 UTC (rev 20986)
+++ trunk/buildroot/package/mtd/mtd-utils/mtd.mk	2008-02-12 05:39:32 UTC (rev 20987)
@@ -13,11 +13,12 @@
 
 #############################################################
 #
-# Build mkfs.jffs2 for use on the local host system if
+# Build mkfs.jffs2 and sumtool for use on the local host system if
 # needed by target/jffs2root.
 #
 #############################################################
 MKFS_JFFS2 := $(MTD_HOST_DIR)/mkfs.jffs2
+SUMTOOL := $(MTD_HOST_DIR)/sumtool
 
 $(DL_DIR)/$(MTD_SOURCE):
 	$(WGET) -P $(DL_DIR) $(MTD_SITE)/$(MTD_SOURCE)
@@ -33,14 +34,20 @@
 	touch $@
 
 
-$(MTD_HOST_DIR)/mkfs.jffs2: $(MTD_HOST_DIR)/.unpacked
+$(MKFS_JFFS2): $(MTD_HOST_DIR)/.unpacked
 	CC="$(HOSTCC)" CROSS= CFLAGS=-I$(LINUX_HEADERS_DIR)/include \
 		$(MAKE) LINUXDIR=$(LINUX_DIR) \
 		BUILDDIR=$(MTD_HOST_DIR) \
 		-C $(MTD_HOST_DIR) mkfs.jffs2
 
-mtd-host: $(MKFS_JFFS2)
+$(SUMTOOL): $(MTD_HOST_DIR)/.unpacked
+	CC="$(HOSTCC)" CROSS= CFLAGS=-I$(LINUX_HEADERS_DIR)/include \
+		$(MAKE) LINUXDIR=$(LINUX_DIR) \
+		BUILDDIR=$(MTD_HOST_DIR) \
+		-C $(MTD_HOST_DIR) sumtool
 
+mtd-host: $(MKFS_JFFS2) $(SUMTOOL)
+
 mtd-host-source: $(DL_DIR)/$(MTD_SOURCE)
 
 mtd-host-clean:

Modified: trunk/buildroot/target/jffs2/Config.in
===================================================================
--- trunk/buildroot/target/jffs2/Config.in	2008-02-12 00:35:03 UTC (rev 20986)
+++ trunk/buildroot/target/jffs2/Config.in	2008-02-12 05:39:32 UTC (rev 20987)
@@ -114,6 +114,13 @@
 	bool "Make all files be owned by root"
 	depends on BR2_TARGET_ROOTFS_JFFS2
 
+config BR2_TARGET_ROOTFS_JFFS2_SUMMARY
+	bool "Produce a summarized JFFS2 image"
+	depends on BR2_TARGET_ROOTFS_JFFS2
+    help
+      A summarised image can be mounted faster if support is
+      enabled in the kernel (CONFIG_JFFS2_SUMMARY)
+
 config BR2_TARGET_ROOTFS_JFFS2_OUTPUT
 	string "Output File"
 	depends on BR2_TARGET_ROOTFS_JFFS2

Modified: trunk/buildroot/target/jffs2/jffs2root.mk
===================================================================
--- trunk/buildroot/target/jffs2/jffs2root.mk	2008-02-12 00:35:03 UTC (rev 20986)
+++ trunk/buildroot/target/jffs2/jffs2root.mk	2008-02-12 05:39:32 UTC (rev 20987)
@@ -5,6 +5,7 @@
 #############################################################
 
 JFFS2_OPTS := -e $(strip $(BR2_TARGET_ROOTFS_JFFS2_EBSIZE))
+SUMTOOL_OPTS := $(JFFS2_OPTS)
 
 ifeq ($(strip $(BR2_TARGET_ROOTFS_JFFS2_PAD)),y)
 ifneq ($(strip $(BR2_TARGET_ROOTFS_JFFS2_PADSIZE)),0x0)
@@ -12,6 +13,7 @@
 else
 JFFS2_OPTS += -p
 endif
+SUMTOOLS_OPTS += -p
 endif
 
 ifeq ($(BR2_TARGET_ROOTFS_JFFS2_SQUASH),y)
@@ -20,16 +22,19 @@
 
 ifeq ($(BR2_TARGET_ROOTFS_JFFS2_LE),y)
 JFFS2_OPTS += -l
+SUMTOOLS_OPTS += -l
 endif
 
 ifeq ($(BR2_TARGET_ROOTFS_JFFS2_BE),y)
 JFFS2_OPTS += -b
+SUMTOOL_OPTS += -b
 endif
 
 ifneq ($(BR2_TARGET_ROOTFS_JFFS2_DEFAULT_PAGESIZE),y)
 JFFS2_OPTS += -s $(BR2_TARGET_ROOTFS_JFFS2_PAGESIZE)
 ifeq ($(BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER),y)
 JFFS2_OPTS += -n
+SUMTOOL_OPTS += -n
 endif
 endif
 
@@ -70,8 +75,15 @@
 		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 endif
 	# Use fakeroot so mkfs.jffs2 believes the previous fakery
+ifneq ($(BR2_TARGET_ROOTFS_JFFS2_SUMMARY),)
+	echo "$(MKFS_JFFS2) $(JFFS2_OPTS) -d $(TARGET_DIR) -o $(JFFS2_TARGET).nosummary && " \
+		"$(SUMTOOL) $(SUMTOOL_OPTS) -i $(JFFS2_TARGET).nosummary -o $(JFFS2_TARGET) && " \
+		"rm $(JFFS2_TARGET).nosummary" \
+		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
+else
 	echo "$(MKFS_JFFS2) $(JFFS2_OPTS) -d $(TARGET_DIR) -o $(JFFS2_TARGET)" \
 		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
+endif
 	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 	$(STAGING_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 	- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
