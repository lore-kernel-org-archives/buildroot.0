From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 16 Feb 2007 10:32:20 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mtd
Message-ID: <20070216183220.27D9E485AB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-16 10:32:20 -0800 (Fri, 16 Feb 2007)
New Revision: 17912

Log:
- fix build for the host


Modified:
   trunk/buildroot/package/mtd/mtd.mk


Changeset:
Modified: trunk/buildroot/package/mtd/mtd.mk
===================================================================
--- trunk/buildroot/package/mtd/mtd.mk	2007-02-16 18:11:48 UTC (rev 17911)
+++ trunk/buildroot/package/mtd/mtd.mk	2007-02-16 18:32:20 UTC (rev 17912)
@@ -40,7 +40,7 @@
 	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	mv $(TOOL_BUILD_DIR)/$(shell tar tjf $(DL_DIR)/$(MTD_SOURCE) \
 		| head -n 1 | xargs basename) $(MTD_HOST_DIR)
-	touch $(MTD_HOST_DIR)/.unpacked
+	touch $@
 else
 ifneq ($(MTD_SOURCE),)
 $(DL_DIR)/$(MTD_SOURCE):
@@ -51,14 +51,13 @@
 	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	mv $(TOOL_BUILD_DIR)/$(shell tar tzf $(DL_DIR)/$(MTD_SOURCE) | head -n 1 \
 		| xargs basename) $(MTD_HOST_DIR)
-	toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
-		package/mtd \*.patch
-	touch $(MTD_HOST_DIR)/.unpacked
+	toolchain/patch-kernel.sh $(MTD_HOST_DIR) package/mtd \*.patch
+	touch $@
 endif
 
 $(MTD_HOST_DIR)/util/mkfs.jffs2: $(MTD_HOST_DIR)/.unpacked
-	CC="$(HOSTCC)" CROSS= CFLAGS=-I$(LINUX_HEADERS_DIR)/include \
-		$(MAKE) LINUXDIR=$(LINUX_DIR) -C $(MTD_HOST_DIR)/util mkfs.jffs2
+	CFLAGS=-I$(LINUX_HEADERS_DIR)/include $(MAKE) CC="$(HOSTCC)" CROSS= \
+		LINUXDIR=$(LINUX_DIR) -C $(MTD_HOST_DIR)/util mkfs.jffs2
 
 mtd-host: $(MKFS_JFFS2)
 
@@ -80,13 +79,13 @@
 ifeq ($(strip $(BR2_PACKAGE_MTD_SNAPSHOT)),y)
 	mv $(BUILD_DIR)/$(shell tar tjf $(DL_DIR)/$(MTD_SOURCE) \
 		| head -n 1 | xargs basename) $(MTD_DIR)
-	touch $(MTD_DIR)/.unpacked
+	touch $@
 else
 	mv $(BUILD_DIR)/$(shell tar tzf $(DL_DIR)/$(MTD_SOURCE) \
 		| head -n 1 | xargs basename) $(MTD_DIR)
 	toolchain/patch-kernel.sh $(MTD_DIR) \
 		package/mtd \*.patch
-	touch $(MTD_DIR)/.unpacked
+	touch $@
 endif
 
 MTD_TARGETS_n :=
