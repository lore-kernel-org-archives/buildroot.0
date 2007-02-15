From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 15 Feb 2007 08:49:40 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target: cpio cramfs ext2
	generic jffs2 squashfs etc...
Message-ID: <20070215164940.712C6485A5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-15 08:49:39 -0800 (Thu, 15 Feb 2007)
New Revision: 17901

Log:
- do not use TARGET_DEVICE_TABLE if is is empty


Modified:
   trunk/buildroot/target/cpio/cpioroot.mk
   trunk/buildroot/target/cramfs/cramfs.mk
   trunk/buildroot/target/ext2/ext2root.mk
   trunk/buildroot/target/generic/Makefile.in
   trunk/buildroot/target/jffs2/jffs2root.mk
   trunk/buildroot/target/squashfs/squashfsroot.mk
   trunk/buildroot/target/tar/tarroot.mk


Changeset:
Modified: trunk/buildroot/target/cpio/cpioroot.mk
===================================================================
--- trunk/buildroot/target/cpio/cpioroot.mk	2007-02-15 15:11:34 UTC (rev 17900)
+++ trunk/buildroot/target/cpio/cpioroot.mk	2007-02-15 16:49:39 UTC (rev 17901)
@@ -20,9 +20,11 @@
 	touch $(STAGING_DIR)/.fakeroot.00000
 	cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
 	echo "chown -R root:root $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
+ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
 		>> $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
+endif
 	# Use fakeroot so tar believes the previous fakery
 	echo "cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $(CPIO_TARGET)" \
 		>> $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))

Modified: trunk/buildroot/target/cramfs/cramfs.mk
===================================================================
--- trunk/buildroot/target/cramfs/cramfs.mk	2007-02-15 15:11:34 UTC (rev 17900)
+++ trunk/buildroot/target/cramfs/cramfs.mk	2007-02-15 16:49:39 UTC (rev 17901)
@@ -72,9 +72,11 @@
 	touch $(STAGING_DIR)/.fakeroot.00000
 	cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
 	echo "chown -R root:root $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
+ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
 		>> $(STAGING_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
+endif
 	# Use fakeroot so mkcramfs believes the previous fakery
 	echo "$(CRAMFS_DIR)/mkcramfs -q $(CRAMFS_ENDIANNESS) " \
 		"$(TARGET_DIR) $(CRAMFS_TARGET)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))

Modified: trunk/buildroot/target/ext2/ext2root.mk
===================================================================
--- trunk/buildroot/target/ext2/ext2root.mk	2007-02-15 15:11:34 UTC (rev 17900)
+++ trunk/buildroot/target/ext2/ext2root.mk	2007-02-15 16:49:39 UTC (rev 17901)
@@ -97,9 +97,11 @@
 	touch $(STAGING_DIR)/.fakeroot.00000
 	cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 	echo "chown -R root:root $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
+ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
 		>> $(STAGING_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
+endif
 	# Use fakeroot so genext2fs believes the previous fakery
 ifeq ($(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)),0)
 	GENEXT2_REALSIZE=`LC_ALL=C du -l -s -c -k $(TARGET_DIR) | grep total | sed -e "s/total//"`; \

Modified: trunk/buildroot/target/generic/Makefile.in
===================================================================
--- trunk/buildroot/target/generic/Makefile.in	2007-02-15 15:11:34 UTC (rev 17900)
+++ trunk/buildroot/target/generic/Makefile.in	2007-02-15 16:49:39 UTC (rev 17901)
@@ -1,3 +1,9 @@
 # Default target skeleton stuff, may be overridden
 TARGET_SKELETON=target/generic/target_skeleton
 TARGET_DEVICE_TABLE=target/generic/device_table.txt
+
+ifeq ($(BR2_PACKAGE_BUSYBOX_SKELETON),y)
+TARGET_SKELETON=target/generic/target_busybox_skeleton
+TARGET_DEVICE_TABLE=
+endif
+

Modified: trunk/buildroot/target/jffs2/jffs2root.mk
===================================================================
--- trunk/buildroot/target/jffs2/jffs2root.mk	2007-02-15 15:11:34 UTC (rev 17900)
+++ trunk/buildroot/target/jffs2/jffs2root.mk	2007-02-15 16:49:39 UTC (rev 17901)
@@ -37,7 +37,7 @@
 #"))
 JFFS2_DEVFILE = $(strip $(subst ",,$(BR2_TARGET_ROOTFS_JFFS2_DEVFILE)))
 #"))
-ifneq ($(JFFS2_DEVFILE),)
+ifneq ($(JFFS2_DEVFILE)$(TARGET_DEVICE_TABLE),)
 JFFS2_OPTS += -D $(TARGET_DEVICE_TABLE)
 endif
 
@@ -59,9 +59,11 @@
 	touch $(STAGING_DIR)/.fakeroot.00000
 	cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 	echo "chown -R root:root $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
+ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
 		>> $(STAGING_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
+endif
 	# Use fakeroot so mkfs.jffs2 believes the previous fakery
 	echo "$(MKFS_JFFS2) $(JFFS2_OPTS) -d $(BUILD_DIR)/root -o $(JFFS2_TARGET)" \
 		>> $(STAGING_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))

Modified: trunk/buildroot/target/squashfs/squashfsroot.mk
===================================================================
--- trunk/buildroot/target/squashfs/squashfsroot.mk	2007-02-15 15:11:34 UTC (rev 17900)
+++ trunk/buildroot/target/squashfs/squashfsroot.mk	2007-02-15 16:49:39 UTC (rev 17901)
@@ -67,9 +67,11 @@
 	touch $(STAGING_DIR)/.fakeroot.00000
 	cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
 	echo "chown -R root:root $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
+ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
 		>> $(STAGING_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
+endif
 	# Use fakeroot so mksquashfs believes the previous fakery
 	echo "$(SQUASHFS_DIR)/squashfs-tools/mksquashfs " \
 		    "$(TARGET_DIR) $(SQUASHFS_TARGET) " \

Modified: trunk/buildroot/target/tar/tarroot.mk
===================================================================
--- trunk/buildroot/target/tar/tarroot.mk	2007-02-15 15:11:34 UTC (rev 17900)
+++ trunk/buildroot/target/tar/tarroot.mk	2007-02-15 16:49:39 UTC (rev 17901)
@@ -32,9 +32,11 @@
 	touch $(STAGING_DIR)/.fakeroot.00000
 	cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 	echo "chown -R root:root $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
 		>> $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+endif
 	# Use fakeroot so tar believes the previous fakery
 	echo "tar -c$(TAR_OPTS)f $(TAR_TARGET) -C $(TARGET_DIR) ." \
 		>> $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
