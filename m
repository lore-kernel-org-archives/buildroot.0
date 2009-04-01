From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  1 Apr 2009 13:02:08 +0000 (UTC)
Subject: [Buildroot] svn commit: [25918] trunk/buildroot: package/busybox
	target/cpio target/cramf etc...
Message-ID: <20090401130208.49A6B77669@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-01 13:02:07 +0000 (Wed, 01 Apr 2009)
New Revision: 25918

Log:
makedevs: install into HOST_DIR

Modified:
   trunk/buildroot/package/busybox/initramfs.mk
   trunk/buildroot/target/cpio/cpioroot.mk
   trunk/buildroot/target/cramfs/cramfs.mk
   trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
   trunk/buildroot/target/ext2/ext2root.mk
   trunk/buildroot/target/initramfs/initramfs.mk
   trunk/buildroot/target/jffs2/jffs2root.mk
   trunk/buildroot/target/makedevs/makedevs.mk
   trunk/buildroot/target/romfs/romfs.mk
   trunk/buildroot/target/squashfs/squashfsroot.mk
   trunk/buildroot/target/tar/tarroot.mk
   trunk/buildroot/target/ubifs/ubifsroot.mk


Changeset:
Modified: trunk/buildroot/package/busybox/initramfs.mk
===================================================================
--- trunk/buildroot/package/busybox/initramfs.mk	2009-04-01 13:01:54 UTC (rev 25917)
+++ trunk/buildroot/package/busybox/initramfs.mk	2009-04-01 13:02:07 UTC (rev 25918)
@@ -111,7 +111,7 @@
 		$(PROJECT_BUILD_DIR)/initramfs/etc/inittab
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(BB_INITRAMFS_TARGET))
 	(echo "chown -R 0:0 $(PROJECT_BUILD_DIR)/initramfs"; \
-	 echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(PROJECT_BUILD_DIR)/initramfs"; \
+	 echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(PROJECT_BUILD_DIR)/initramfs"; \
 	 echo "$(SHELL) target/initramfs/gen_initramfs_list.sh -u 0 -g 0 $(PROJECT_BUILD_DIR)/initramfs > $(BB_INITRAMFS_TARGET)"; \
 	) > $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(BB_INITRAMFS_TARGET))
 	chmod +x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(BB_INITRAMFS_TARGET))

Modified: trunk/buildroot/target/cpio/cpioroot.mk
===================================================================
--- trunk/buildroot/target/cpio/cpioroot.mk	2009-04-01 13:01:54 UTC (rev 25917)
+++ trunk/buildroot/target/cpio/cpioroot.mk	2009-04-01 13:02:07 UTC (rev 25918)
@@ -55,7 +55,7 @@
 	echo "chown -R 0:0 $(TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
-	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
+	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
 		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
 endif
 	# Use fakeroot so tar believes the previous fakery

Modified: trunk/buildroot/target/cramfs/cramfs.mk
===================================================================
--- trunk/buildroot/target/cramfs/cramfs.mk	2009-04-01 13:01:54 UTC (rev 25917)
+++ trunk/buildroot/target/cramfs/cramfs.mk	2009-04-01 13:02:07 UTC (rev 25918)
@@ -68,7 +68,7 @@
 	echo "chown -R 0:0 $(TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
-	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
+	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
 		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
 endif
 	# Use fakeroot so mkcramfs believes the previous fakery

Modified: trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2009-04-01 13:01:54 UTC (rev 25917)
+++ trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2009-04-01 13:02:07 UTC (rev 25918)
@@ -223,7 +223,7 @@
 	cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(UBOOT_TARGET))
 	echo "chown -R root:root $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(UBOOT_TARGET))
 	# Use fakeroot to pretend to create all needed device nodes
-	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
+	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
 		>> $(STAGING_DIR)/_fakeroot.$(notdir $(UBOOT_TARGET))
 	# Use fakeroot so mkuboot believes the previous fakery
 	echo "$(UBOOT_DIR)/uboot-tools/mkuboot " \

Modified: trunk/buildroot/target/ext2/ext2root.mk
===================================================================
--- trunk/buildroot/target/ext2/ext2root.mk	2009-04-01 13:01:54 UTC (rev 25917)
+++ trunk/buildroot/target/ext2/ext2root.mk	2009-04-01 13:02:07 UTC (rev 25918)
@@ -106,7 +106,7 @@
 	echo "chown -R 0:0 $(TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
-	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
+	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
 		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 endif
 	# Use fakeroot so genext2fs believes the previous fakery

Modified: trunk/buildroot/target/initramfs/initramfs.mk
===================================================================
--- trunk/buildroot/target/initramfs/initramfs.mk	2009-04-01 13:01:54 UTC (rev 25917)
+++ trunk/buildroot/target/initramfs/initramfs.mk	2009-04-01 13:02:07 UTC (rev 25918)
@@ -31,7 +31,7 @@
 	cat $(PROJECT_BUILD_DIR)/.fakeroot* > $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 	echo "chown -R 0:0 $(TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 	# Use fakeroot to pretend to create all needed device nodes
-	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
+	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
 		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 	# Use fakeroot so gen_initramfs_list.sh believes the previous fakery
 	echo "$(SHELL) target/initramfs/gen_initramfs_list.sh -u 0 -g 0 $(TARGET_DIR) > $(INITRAMFS_TARGET)" \

Modified: trunk/buildroot/target/jffs2/jffs2root.mk
===================================================================
--- trunk/buildroot/target/jffs2/jffs2root.mk	2009-04-01 13:01:54 UTC (rev 25917)
+++ trunk/buildroot/target/jffs2/jffs2root.mk	2009-04-01 13:02:07 UTC (rev 25918)
@@ -67,7 +67,7 @@
 	echo "chown -R 0:0 $(TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
-	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
+	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
 		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 endif
 	# Use fakeroot so mkfs.jffs2 believes the previous fakery

Modified: trunk/buildroot/target/makedevs/makedevs.mk
===================================================================
--- trunk/buildroot/target/makedevs/makedevs.mk	2009-04-01 13:01:54 UTC (rev 25917)
+++ trunk/buildroot/target/makedevs/makedevs.mk	2009-04-01 13:02:07 UTC (rev 25918)
@@ -5,7 +5,7 @@
 # with fakeroot.
 #
 #############################################################
-MAKEDEVS_DIR=$(BUILD_DIR)/makedevs
+MAKEDEVS_DIR=$(BUILD_DIR)/makedevs-host
 
 $(MAKEDEVS_DIR)/makedevs.c: target/makedevs/makedevs.c
 	rm -rf $(MAKEDEVS_DIR)
@@ -13,19 +13,17 @@
 	cp target/makedevs/makedevs.c $(MAKEDEVS_DIR)
 
 $(MAKEDEVS_DIR)/makedevs: $(MAKEDEVS_DIR)/makedevs.c
-	$(HOSTCC) -Wall -Werror -O2 $(MAKEDEVS_DIR)/makedevs.c -o $(MAKEDEVS_DIR)/makedevs
-	touch -c $(MAKEDEVS_DIR)/makedevs
+	$(HOSTCC) -Wall -Werror -O2 $(MAKEDEVS_DIR)/makedevs.c -o $@
 
-$(STAGING_DIR)/bin/makedevs: $(MAKEDEVS_DIR)/makedevs
-	$(INSTALL) -m 755 $(MAKEDEVS_DIR)/makedevs $(STAGING_DIR)/bin/makedevs
-	touch -c $(STAGING_DIR)/bin/makedevs
+$(HOST_DIR)/usr/bin/makedevs: $(MAKEDEVS_DIR)/makedevs
+	$(INSTALL) -m 755 $^ $@
 
-makedevs: $(STAGING_DIR)/bin/makedevs
+makedevs: $(HOST_DIR)/usr/bin/makedevs
 
 makedevs-source:
 
 makedevs-clean:
-	-rm -rf $(MAKEDEVS_DIR)
+	rm -rf $(MAKEDEVS_DIR)/makedevs
 
 makedevs-dirclean:
 	rm -rf $(MAKEDEVS_DIR)

Modified: trunk/buildroot/target/romfs/romfs.mk
===================================================================
--- trunk/buildroot/target/romfs/romfs.mk	2009-04-01 13:01:54 UTC (rev 25917)
+++ trunk/buildroot/target/romfs/romfs.mk	2009-04-01 13:02:07 UTC (rev 25918)
@@ -52,7 +52,7 @@
 	echo "chown -R 0:0 $(TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
-	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
+	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
 		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
 endif
 	# Use fakeroot so genromfs believes the previous fakery

Modified: trunk/buildroot/target/squashfs/squashfsroot.mk
===================================================================
--- trunk/buildroot/target/squashfs/squashfsroot.mk	2009-04-01 13:01:54 UTC (rev 25917)
+++ trunk/buildroot/target/squashfs/squashfsroot.mk	2009-04-01 13:02:07 UTC (rev 25918)
@@ -59,7 +59,7 @@
 	echo "chown -R 0:0 $(TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
-	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
+	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
 		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
 endif
 	# Use fakeroot so mksquashfs believes the previous fakery

Modified: trunk/buildroot/target/tar/tarroot.mk
===================================================================
--- trunk/buildroot/target/tar/tarroot.mk	2009-04-01 13:01:54 UTC (rev 25917)
+++ trunk/buildroot/target/tar/tarroot.mk	2009-04-01 13:02:07 UTC (rev 25918)
@@ -40,7 +40,7 @@
 	echo "chown -R 0:0 $(TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
-	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
+	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
 		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 endif
 	# Use fakeroot so tar believes the previous fakery

Modified: trunk/buildroot/target/ubifs/ubifsroot.mk
===================================================================
--- trunk/buildroot/target/ubifs/ubifsroot.mk	2009-04-01 13:01:54 UTC (rev 25917)
+++ trunk/buildroot/target/ubifs/ubifsroot.mk	2009-04-01 13:02:07 UTC (rev 25918)
@@ -98,7 +98,7 @@
 endif
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
-	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
+	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
 		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
 endif
 	# Use fakeroot so mkfs.ubifs believes the previous fakery
