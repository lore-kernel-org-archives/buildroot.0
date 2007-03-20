From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 20 Mar 2007 09:52:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target: cpio cramfs ext2
	iso9660 jffs2 squashfs etc...
Message-ID: <20070320165244.3DAE948092@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-20 09:52:44 -0700 (Tue, 20 Mar 2007)
New Revision: 18181

Log:
- use numeric values for the superuser to be more portable.
  Closes #1250


Modified:
   trunk/buildroot/target/cpio/cpioroot.mk
   trunk/buildroot/target/cramfs/cramfs.mk
   trunk/buildroot/target/ext2/Config.in
   trunk/buildroot/target/ext2/ext2root.mk
   trunk/buildroot/target/iso9660/iso9660.mk
   trunk/buildroot/target/jffs2/jffs2root.mk
   trunk/buildroot/target/squashfs/squashfsroot.mk
   trunk/buildroot/target/tar/tarroot.mk


Changeset:
Modified: trunk/buildroot/target/cpio/cpioroot.mk
===================================================================
--- trunk/buildroot/target/cpio/cpioroot.mk	2007-03-20 16:42:51 UTC (rev 18180)
+++ trunk/buildroot/target/cpio/cpioroot.mk	2007-03-20 16:52:44 UTC (rev 18181)
@@ -19,7 +19,7 @@
 	rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 	touch $(STAGING_DIR)/.fakeroot.00000
 	cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
-	echo "chown -R root:root $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
+	echo "chown -R 0:0 $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \

Modified: trunk/buildroot/target/cramfs/cramfs.mk
===================================================================
--- trunk/buildroot/target/cramfs/cramfs.mk	2007-03-20 16:42:51 UTC (rev 18180)
+++ trunk/buildroot/target/cramfs/cramfs.mk	2007-03-20 16:52:44 UTC (rev 18181)
@@ -71,7 +71,7 @@
 	rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
 	touch $(STAGING_DIR)/.fakeroot.00000
 	cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
-	echo "chown -R root:root $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
+	echo "chown -R 0:0 $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \

Modified: trunk/buildroot/target/ext2/Config.in
===================================================================
--- trunk/buildroot/target/ext2/Config.in	2007-03-20 16:42:51 UTC (rev 18180)
+++ trunk/buildroot/target/ext2/Config.in	2007-03-20 16:52:44 UTC (rev 18181)
@@ -15,7 +15,7 @@
 	default	0
 
 config BR2_TARGET_ROOTFS_EXT2_RESBLKS
-	int "reserved blocks"
+	int "reserved blocks percentage"
 	depends on BR2_TARGET_ROOTFS_EXT2
 	default 0
 

Modified: trunk/buildroot/target/ext2/ext2root.mk
===================================================================
--- trunk/buildroot/target/ext2/ext2root.mk	2007-03-20 16:42:51 UTC (rev 18180)
+++ trunk/buildroot/target/ext2/ext2root.mk	2007-03-20 16:52:44 UTC (rev 18181)
@@ -96,7 +96,7 @@
 	rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 	touch $(STAGING_DIR)/.fakeroot.00000
 	cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
-	echo "chown -R root:root $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
+	echo "chown -R 0:0 $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \

Modified: trunk/buildroot/target/iso9660/iso9660.mk
===================================================================
--- trunk/buildroot/target/iso9660/iso9660.mk	2007-03-20 16:42:51 UTC (rev 18180)
+++ trunk/buildroot/target/iso9660/iso9660.mk	2007-03-20 16:52:44 UTC (rev 18181)
@@ -65,7 +65,7 @@
 	rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
 	touch $(STAGING_DIR)/.fakeroot.00000
 	cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
-	echo "chown -R root:root $(ISO9660_TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
+	echo "chown -R 0:0 $(ISO9660_TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
 	# Use fakeroot so mkisofs believes the previous fakery
 	echo "$(MKISOFS_TARGET) -R -b boot/grub/stage2_eltorito -no-emul-boot " \
 		"-boot-load-size 4 -boot-info-table -o $(ISO9660_TARGET) $(ISO9660_TARGET_DIR)" \

Modified: trunk/buildroot/target/jffs2/jffs2root.mk
===================================================================
--- trunk/buildroot/target/jffs2/jffs2root.mk	2007-03-20 16:42:51 UTC (rev 18180)
+++ trunk/buildroot/target/jffs2/jffs2root.mk	2007-03-20 16:52:44 UTC (rev 18181)
@@ -58,7 +58,7 @@
 	rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 	touch $(STAGING_DIR)/.fakeroot.00000
 	cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
-	echo "chown -R root:root $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
+	echo "chown -R 0:0 $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \

Modified: trunk/buildroot/target/squashfs/squashfsroot.mk
===================================================================
--- trunk/buildroot/target/squashfs/squashfsroot.mk	2007-03-20 16:42:51 UTC (rev 18180)
+++ trunk/buildroot/target/squashfs/squashfsroot.mk	2007-03-20 16:52:44 UTC (rev 18181)
@@ -66,7 +66,7 @@
 	rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
 	touch $(STAGING_DIR)/.fakeroot.00000
 	cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
-	echo "chown -R root:root $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
+	echo "chown -R 0:0 $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \

Modified: trunk/buildroot/target/tar/tarroot.mk
===================================================================
--- trunk/buildroot/target/tar/tarroot.mk	2007-03-20 16:42:51 UTC (rev 18180)
+++ trunk/buildroot/target/tar/tarroot.mk	2007-03-20 16:52:44 UTC (rev 18181)
@@ -31,7 +31,7 @@
 	rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 	touch $(STAGING_DIR)/.fakeroot.00000
 	cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	echo "chown -R root:root $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	echo "chown -R 0:0 $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
