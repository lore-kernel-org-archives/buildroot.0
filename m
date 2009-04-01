From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  1 Apr 2009 14:15:19 +0000 (UTC)
Subject: [Buildroot] svn commit: [25920] trunk/buildroot: package/busybox
	package/fakeroot target/ etc...
Message-ID: <20090401141519.6786577669@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-01 14:15:19 +0000 (Wed, 01 Apr 2009)
New Revision: 25920

Log:
fakeroot: install into HOST_DIR

Modified:
   trunk/buildroot/package/busybox/initramfs.mk
   trunk/buildroot/package/fakeroot/fakeroot.mk
   trunk/buildroot/target/cpio/cpioroot.mk
   trunk/buildroot/target/cramfs/cramfs.mk
   trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
   trunk/buildroot/target/ext2/ext2root.mk
   trunk/buildroot/target/initramfs/initramfs.mk
   trunk/buildroot/target/iso9660/iso9660.mk
   trunk/buildroot/target/jffs2/jffs2root.mk
   trunk/buildroot/target/romfs/romfs.mk
   trunk/buildroot/target/squashfs/squashfsroot.mk
   trunk/buildroot/target/tar/tarroot.mk
   trunk/buildroot/target/ubifs/ubifsroot.mk


Changeset:
Modified: trunk/buildroot/package/busybox/initramfs.mk
===================================================================
--- trunk/buildroot/package/busybox/initramfs.mk	2009-04-01 14:15:04 UTC (rev 25919)
+++ trunk/buildroot/package/busybox/initramfs.mk	2009-04-01 14:15:19 UTC (rev 25920)
@@ -115,7 +115,7 @@
 	 echo "$(SHELL) target/initramfs/gen_initramfs_list.sh -u 0 -g 0 $(PROJECT_BUILD_DIR)/initramfs > $(BB_INITRAMFS_TARGET)"; \
 	) > $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(BB_INITRAMFS_TARGET))
 	chmod +x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(BB_INITRAMFS_TARGET))
-	$(STAGING_DIR)/usr/bin/fakeroot -- \
+	$(HOST_DIR)/usr/bin/fakeroot -- \
 		$(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(BB_INITRAMFS_TARGET))
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(BB_INITRAMFS_TARGET))
 	touch -c $@

Modified: trunk/buildroot/package/fakeroot/fakeroot.mk
===================================================================
--- trunk/buildroot/package/fakeroot/fakeroot.mk	2009-04-01 14:15:04 UTC (rev 25919)
+++ trunk/buildroot/package/fakeroot/fakeroot.mk	2009-04-01 14:15:19 UTC (rev 25920)
@@ -36,8 +36,7 @@
 	(cd $(FAKEROOT_DIR1); rm -rf config.cache; \
 		CC="$(HOSTCC)" \
 		$(FAKEROOT_SOURCE_DIR)/configure \
-		--prefix=/usr \
-		$(DISABLE_NLS) \
+		--prefix=$(HOST_DIR)/usr \
 	)
 	touch $@
 
@@ -45,16 +44,11 @@
 	$(MAKE) -C $(FAKEROOT_DIR1)
 	touch -c $@
 
-$(STAGING_DIR)/usr/bin/fakeroot: $(FAKEROOT_DIR1)/faked
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(FAKEROOT_DIR1) install
-	$(SED) 's,^PREFIX=.*,PREFIX=$(STAGING_DIR)/usr,g' $(STAGING_DIR)/usr/bin/fakeroot
-	$(SED) 's,^BINDIR=.*,BINDIR=$(STAGING_DIR)/usr/bin,g' $(STAGING_DIR)/usr/bin/fakeroot
-	$(SED) 's,^PATHS=.*,PATHS=$(FAKEROOT_DIR1)/.libs:/lib:/usr/lib,g' $(STAGING_DIR)/usr/bin/fakeroot
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
-		$(STAGING_DIR)/usr/lib/libfakeroot.la
+$(HOST_DIR)/usr/bin/fakeroot: $(FAKEROOT_DIR1)/faked
+	$(MAKE) -C $(FAKEROOT_DIR1) install
 	touch -c $@
 
-host-fakeroot: uclibc $(STAGING_DIR)/usr/bin/fakeroot
+host-fakeroot: uclibc $(HOST_DIR)/usr/bin/fakeroot
 
 host-fakeroot-clean:
 	-$(MAKE) -C $(FAKEROOT_DIR1) clean

Modified: trunk/buildroot/target/cpio/cpioroot.mk
===================================================================
--- trunk/buildroot/target/cpio/cpioroot.mk	2009-04-01 14:15:04 UTC (rev 25919)
+++ trunk/buildroot/target/cpio/cpioroot.mk	2009-04-01 14:15:19 UTC (rev 25920)
@@ -62,7 +62,7 @@
 	echo "cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $(CPIO_BASE)" \
 		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
 	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
-	$(STAGING_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
+	$(HOST_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
 	#- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
 ifeq ($(CPIO_ROOTFS_COMPRESSOR),)
 ifneq ($(ROOTFS_CPIO_COPYTO),)

Modified: trunk/buildroot/target/cramfs/cramfs.mk
===================================================================
--- trunk/buildroot/target/cramfs/cramfs.mk	2009-04-01 14:15:04 UTC (rev 25919)
+++ trunk/buildroot/target/cramfs/cramfs.mk	2009-04-01 14:15:19 UTC (rev 25920)
@@ -75,7 +75,7 @@
 	echo "$(CRAMFS_DIR)/mkcramfs -q $(CRAMFS_OPTS) " \
 		"$(TARGET_DIR) $(CRAMFS_TARGET)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
 	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
-	$(STAGING_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
+	$(HOST_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
 	- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
 
 cramfsroot-source: cramfs-source

Modified: trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2009-04-01 14:15:04 UTC (rev 25919)
+++ trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2009-04-01 14:15:19 UTC (rev 25920)
@@ -231,7 +231,7 @@
 		    "-noappend $(UBOOT_ENDIANNESS)" \
 		>> $(STAGING_DIR)/_fakeroot.$(notdir $(UBOOT_TARGET))
 	chmod a+x $(STAGING_DIR)/_fakeroot.$(notdir $(UBOOT_TARGET))
-	$(STAGING_DIR)/usr/bin/fakeroot -- $(STAGING_DIR)/_fakeroot.$(notdir $(UBOOT_TARGET))
+	$(HOST_DIR)/usr/bin/fakeroot -- $(STAGING_DIR)/_fakeroot.$(notdir $(UBOOT_TARGET))
 	- at rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(UBOOT_TARGET))
 
 ubootroot-source: uboot-source

Modified: trunk/buildroot/target/ext2/ext2root.mk
===================================================================
--- trunk/buildroot/target/ext2/ext2root.mk	2009-04-01 14:15:04 UTC (rev 25919)
+++ trunk/buildroot/target/ext2/ext2root.mk	2009-04-01 14:15:19 UTC (rev 25920)
@@ -125,7 +125,7 @@
 		"$(EXT2_OPTS) $(EXT2_BASE)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 endif
 	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
-	$(STAGING_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
+	$(HOST_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 	- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 
 ifneq ($(EXT2_ROOTFS_COMPRESSOR),)

Modified: trunk/buildroot/target/initramfs/initramfs.mk
===================================================================
--- trunk/buildroot/target/initramfs/initramfs.mk	2009-04-01 14:15:04 UTC (rev 25919)
+++ trunk/buildroot/target/initramfs/initramfs.mk	2009-04-01 14:15:19 UTC (rev 25920)
@@ -37,7 +37,7 @@
 	echo "$(SHELL) target/initramfs/gen_initramfs_list.sh -u 0 -g 0 $(TARGET_DIR) > $(INITRAMFS_TARGET)" \
 		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	$(STAGING_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	$(HOST_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 	-rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 
 initramfs-source:

Modified: trunk/buildroot/target/iso9660/iso9660.mk
===================================================================
--- trunk/buildroot/target/iso9660/iso9660.mk	2009-04-01 14:15:04 UTC (rev 25919)
+++ trunk/buildroot/target/iso9660/iso9660.mk	2009-04-01 14:15:19 UTC (rev 25920)
@@ -71,7 +71,7 @@
 		"-boot-load-size 4 -boot-info-table -o $(ISO9660_TARGET) $(ISO9660_TARGET_DIR)" \
 		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
 	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
-	$(STAGING_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
+	$(HOST_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
 	- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
 
 iso9660root: $(ISO9660_TARGET)

Modified: trunk/buildroot/target/jffs2/jffs2root.mk
===================================================================
--- trunk/buildroot/target/jffs2/jffs2root.mk	2009-04-01 14:15:04 UTC (rev 25919)
+++ trunk/buildroot/target/jffs2/jffs2root.mk	2009-04-01 14:15:19 UTC (rev 25920)
@@ -81,7 +81,7 @@
 		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 endif
 	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
-	$(STAGING_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
+	$(HOST_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 	- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 	@ls -l $(JFFS2_TARGET)
 ifeq ($(BR2_JFFS2_TARGET_SREC),y)

Modified: trunk/buildroot/target/romfs/romfs.mk
===================================================================
--- trunk/buildroot/target/romfs/romfs.mk	2009-04-01 14:15:04 UTC (rev 25919)
+++ trunk/buildroot/target/romfs/romfs.mk	2009-04-01 14:15:19 UTC (rev 25920)
@@ -58,7 +58,7 @@
 	# Use fakeroot so genromfs believes the previous fakery
 	echo "$(ROMFS_DIR)/genromfs -d $(TARGET_DIR) -f $(ROMFS_TARGET)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
 	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
-	$(STAGING_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
+	$(HOST_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
 	- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
 
 romfsroot-source: romfs-source

Modified: trunk/buildroot/target/squashfs/squashfsroot.mk
===================================================================
--- trunk/buildroot/target/squashfs/squashfsroot.mk	2009-04-01 14:15:04 UTC (rev 25919)
+++ trunk/buildroot/target/squashfs/squashfsroot.mk	2009-04-01 14:15:19 UTC (rev 25920)
@@ -68,7 +68,7 @@
 		    "-noappend $(SQUASHFS_ENDIANNESS)" \
 		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
 	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
-	$(STAGING_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
+	$(HOST_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
 	chmod 0644 $(SQUASHFS_TARGET)
 	- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
 

Modified: trunk/buildroot/target/tar/tarroot.mk
===================================================================
--- trunk/buildroot/target/tar/tarroot.mk	2009-04-01 14:15:04 UTC (rev 25919)
+++ trunk/buildroot/target/tar/tarroot.mk	2009-04-01 14:15:19 UTC (rev 25920)
@@ -47,7 +47,7 @@
 	echo "tar -c$(TAR_OPTS)f $(TAR_TARGET) -C $(TARGET_DIR) ." \
 		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	$(STAGING_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	$(HOST_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 ifneq ($(TAR_COMPRESSOR),)
 	-rm -f $(TAR_TARGET).$()
 	PATH="$(STAGING_DIR)/sbin:$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/sbin:$(STAGING_DIR)/usr/bin:$(PATH)" $(TAR_COMPRESSOR) $(TAR_TARGET) > $(TAR_TARGET).$(TAR_COMPRESSOR_EXT)

Modified: trunk/buildroot/target/ubifs/ubifsroot.mk
===================================================================
--- trunk/buildroot/target/ubifs/ubifsroot.mk	2009-04-01 14:15:04 UTC (rev 25919)
+++ trunk/buildroot/target/ubifs/ubifsroot.mk	2009-04-01 14:15:19 UTC (rev 25920)
@@ -105,7 +105,7 @@
 	echo "$(MKFS_UBIFS_DIR)/mkfs.ubifs -d $(TARGET_DIR) " \
 		"$(UBIFS_OPTS) -o $(UBIFS_BASE)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
 	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
-	$(STAGING_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
+	$(HOST_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
 	- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
 
 ifneq ($(UBIFS_ROOTFS_COMPRESSOR),)
