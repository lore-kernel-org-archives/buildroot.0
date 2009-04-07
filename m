From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  7 Apr 2009 19:22:38 +0000 (UTC)
Subject: [Buildroot] svn commit: [26013] trunk/buildroot/target: jffs2 ubifs
Message-ID: <20090407192238.4DC46768C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-07 19:22:37 +0000 (Tue, 07 Apr 2009)
New Revision: 26013

Log:
target: remove BR2_TARGET_ROOTFS_*_SQUASH options

Everything besides ubifs does an unconditional chown -R 0:0 anyway.

Modified:
   trunk/buildroot/target/jffs2/Config.in
   trunk/buildroot/target/jffs2/jffs2root.mk
   trunk/buildroot/target/ubifs/Config.in
   trunk/buildroot/target/ubifs/ubifsroot.mk


Changeset:
Modified: trunk/buildroot/target/jffs2/Config.in
===================================================================
--- trunk/buildroot/target/jffs2/Config.in	2009-04-07 13:29:27 UTC (rev 26012)
+++ trunk/buildroot/target/jffs2/Config.in	2009-04-07 19:22:37 UTC (rev 26013)
@@ -113,10 +113,6 @@
 
 endchoice
 
-config BR2_TARGET_ROOTFS_JFFS2_SQUASH
-	bool "Make all files be owned by root"
-	depends on BR2_TARGET_ROOTFS_JFFS2
-
 config BR2_TARGET_ROOTFS_JFFS2_SUMMARY
 	bool "Produce a summarized JFFS2 image"
 	depends on BR2_TARGET_ROOTFS_JFFS2

Modified: trunk/buildroot/target/jffs2/jffs2root.mk
===================================================================
--- trunk/buildroot/target/jffs2/jffs2root.mk	2009-04-07 13:29:27 UTC (rev 26012)
+++ trunk/buildroot/target/jffs2/jffs2root.mk	2009-04-07 19:22:37 UTC (rev 26013)
@@ -16,10 +16,6 @@
 SUMTOOL_OPTS += -p
 endif
 
-ifeq ($(BR2_TARGET_ROOTFS_JFFS2_SQUASH),y)
-JFFS2_OPTS += -q
-endif
-
 ifeq ($(BR2_TARGET_ROOTFS_JFFS2_LE),y)
 JFFS2_OPTS += -l
 SUMTOOL_OPTS += -l

Modified: trunk/buildroot/target/ubifs/Config.in
===================================================================
--- trunk/buildroot/target/ubifs/Config.in	2009-04-07 13:29:27 UTC (rev 26012)
+++ trunk/buildroot/target/ubifs/Config.in	2009-04-07 19:22:37 UTC (rev 26013)
@@ -23,11 +23,6 @@
 	help
 	  Some comment required here
 
-config BR2_TARGET_ROOTFS_UBIFS_SQUASH
-	bool "Make all files be owned by root"
-	depends on  BR2_TARGET_ROOTFS_UBIFS
-	default y
-
 config BR2_TARGET_ROOTFS_UBIFS_OUTPUT
 	string "Output File"
 	depends on BR2_TARGET_ROOTFS_UBIFS

Modified: trunk/buildroot/target/ubifs/ubifsroot.mk
===================================================================
--- trunk/buildroot/target/ubifs/ubifsroot.mk	2009-04-07 13:29:27 UTC (rev 26012)
+++ trunk/buildroot/target/ubifs/ubifsroot.mk	2009-04-07 19:22:37 UTC (rev 26013)
@@ -93,9 +93,7 @@
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
 	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000
 	cat $(PROJECT_BUILD_DIR)/.fakeroot* > $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
-ifneq ($(BR2_TARGET_ROOTFS_UBIFS_SQUASH),)
 	echo "chown -R 0:0 $(TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
-endif
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
