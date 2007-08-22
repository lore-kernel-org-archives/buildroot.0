From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Aug 2007 03:06:25 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/mtd/20061007
	target/device/AMD/D etc...
Message-ID: <20070822100625.02507A4600@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-22 03:06:25 -0700 (Wed, 22 Aug 2007)
New Revision: 19640

Log:
- use the BZCAT/ZCAT as configured by the user


Modified:
   trunk/buildroot/package/mtd/20061007/mtd.mk
   trunk/buildroot/target/device/AMD/DBAu1500/linux26.mk


Changeset:
Modified: trunk/buildroot/package/mtd/20061007/mtd.mk
===================================================================
--- trunk/buildroot/package/mtd/20061007/mtd.mk	2007-08-22 09:56:41 UTC (rev 19639)
+++ trunk/buildroot/package/mtd/20061007/mtd.mk	2007-08-22 10:06:25 UTC (rev 19640)
@@ -7,7 +7,7 @@
 MTD_SITE=http://ftp.debian.org/debian/pool/main/m/mtd
 MTD_HOST_DIR := $(TOOL_BUILD_DIR)/mtd_orig
 MTD_DIR:=$(BUILD_DIR)/mtd_orig
-MTD_CAT:=zcat
+MTD_CAT:=$(ZCAT)
 MTD_DATE:=20061007
 
 #############################################################
@@ -22,7 +22,7 @@
 	$(WGET) -P $(DL_DIR) $(MTD_SITE)/$(MTD_SOURCE)
 
 $(MTD_HOST_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	mv $(TOOL_BUILD_DIR)/$(shell tar tzf $(DL_DIR)/$(MTD_SOURCE) | head -n 1 \
 		| xargs basename) $(MTD_HOST_DIR)
 	toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
@@ -49,7 +49,7 @@
 #
 #############################################################
 $(MTD_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	mv $(BUILD_DIR)/$(shell tar tzf $(DL_DIR)/$(MTD_SOURCE) \
 		| head -n 1 | xargs basename) $(MTD_DIR)
 	toolchain/patch-kernel.sh $(MTD_DIR) \

Modified: trunk/buildroot/target/device/AMD/DBAu1500/linux26.mk
===================================================================
--- trunk/buildroot/target/device/AMD/DBAu1500/linux26.mk	2007-08-22 09:56:41 UTC (rev 19639)
+++ trunk/buildroot/target/device/AMD/DBAu1500/linux26.mk	2007-08-22 10:06:25 UTC (rev 19640)
@@ -43,7 +43,7 @@
 
 $(LINUX26_DIR)/.unpacked: $(DL_DIR)/$(LINUX26_SOURCE)
 	rm -rf $(LINUX26_DIR)
-	bzcat $(DL_DIR)/$(LINUX26_SOURCE) | tar -C $(BUILD_DIR) -xvf -
+	$(BZCAT) $(DL_DIR)/$(LINUX26_SOURCE) | tar -C $(BUILD_DIR) -xvf -
 ifneq ($(DOWNLOAD_LINUX26_VERSION),$(LINUX26_VERSION))
 	# Rename the dir from the downloaded version to the AFTER patch version
 	mv -f $(BUILD_DIR)/linux-$(DOWNLOAD_LINUX26_VERSION) $(BUILD_DIR)/linux-$(LINUX26_VERSION)
