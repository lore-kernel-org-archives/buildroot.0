From: heiko at zuerker.org <heiko@zuerker.org>
Date: Sun,  5 Dec 2010 09:23:03 -0600
Subject: [Buildroot] [PATCH] support for mini initramfs and added iso9660
	improvements
Message-ID: <c3e09387f2f59a61e096cd974d8921fb6fa9ea43.1291562435.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>

Additionally, a small initramfs is now supported in order to initialize
the system (like initrd).
iso9660 images has now many additional options, like the isolinux boot loader,
use of the mini-initramfs for initialization and zisofs support.

Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 fs/initramfs/Config.in    |   25 ++++++++++++++++++++-----
 fs/initramfs/initramfs.mk |   41 ++++++++++++++++++++++++++++++++---------
 fs/iso9660/Config.in      |   16 ++++++++++++++++
 fs/iso9660/iso9660.mk     |   37 ++++++++++++++++++++++++++++++++++---
 4 files changed, 102 insertions(+), 17 deletions(-)

diff --git a/fs/initramfs/Config.in b/fs/initramfs/Config.in
index 52f98f7..f8462f5 100644
--- a/fs/initramfs/Config.in
+++ b/fs/initramfs/Config.in
@@ -2,6 +2,9 @@ config BR2_TARGET_DO_INITRAMFS
 	bool "initramfs for initial ramdisk of linux kernel"
 	depends on BR2_LINUX_KERNEL
 
+menu "initramfs options"
+depends on BR2_TARGET_DO_INITRAMFS
+
 choice
 	prompt "initramfs type"
 	default BR2_TARGET_ROOTFS_INITRAMFS
@@ -26,7 +29,7 @@ config BR2_TARGET_ROOTFS_INITRAMFS
 	  identical root filesystems, one embedded inside the kernel
 	  image, and one separatly.
 
-config BR2_TARGET_MINIMAL_INITRAMFS
+config BR2_TARGET_ROOTFS_MINI_INITRAMFS
 	bool "minimal"
 	help
 	  Only create a minimal initramfs to prepare system for boot.
@@ -34,10 +37,10 @@ config BR2_TARGET_MINIMAL_INITRAMFS
 
 endchoice
 
-config BR2_TARGET_MINIMAL_INITRAMFS_COPYLIST
+config BR2_TARGET_ROOTFS_MINI_INITRAMFS_COPYLIST
 	string "List with files to be copied"
 	depends on BR2_TARGET_DO_INITRAMFS
-	depends on BR2_TARGET_MINIMAL_INITRAMFS
+	depends on BR2_TARGET_ROOTFS_MINI_INITRAMFS
 	default ""
 	help
 	  The contents of this file list the files and directories
@@ -45,10 +48,10 @@ config BR2_TARGET_MINIMAL_INITRAMFS_COPYLIST
 	  All path names are relativ to the output/target directory.
 	  This is an optional parameter.
 
-config BR2_TARGET_MINIMAL_INITRAMFS_SKELETON
+config BR2_TARGET_ROOTFS_MINI_INITRAMFS_SKELETON
 	string "initramfs skeleton"
 	depends on BR2_TARGET_DO_INITRAMFS
-	depends on BR2_TARGET_MINIMAL_INITRAMFS
+	depends on BR2_TARGET_ROOTFS_MINI_INITRAMFS
 	default ""
 	help
 	  A skeleton directory which is copied before any files
@@ -56,5 +59,17 @@ config BR2_TARGET_MINIMAL_INITRAMFS_SKELETON
 	  directory structure.
 	  This is an optional parameter.
 
+config BR2_TARGET_ROOTFS_MINI_INITRAMFS_INSTALL_BUSYBOX
+	bool "copy and install busybox"
+	depends on BR2_TARGET_DO_INITRAMFS
+	depends on BR2_TARGET_ROOTFS_MINI_INITRAMFS
+	help
+	  Copy the busybox binary into the initramfs and create all
+	  symlinks.
+	  Busybox should be statically compiled for this.
+
+endmenu
+	  
 comment "initramfs requires a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL
+
diff --git a/fs/initramfs/initramfs.mk b/fs/initramfs/initramfs.mk
index 55dc037..fca7a67 100644
--- a/fs/initramfs/initramfs.mk
+++ b/fs/initramfs/initramfs.mk
@@ -6,6 +6,7 @@
 #
 #############################################################
 
+### use initramfs for the full target file system
 ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
 define ROOTFS_INITRAMFS_INIT_SYMLINK
 	if [ ! -e $(TARGET_DIR)/init ]; then \
@@ -23,19 +24,41 @@ ROOTFS_INITRAMFS_POST_TARGETS += linux26-rebuild-with-initramfs
 
 $(eval $(call ROOTFS_TARGET,initramfs))
 endif
+### end full target on initramfs
 
-$(BINARIES_DIR)/initramfs.gz:
-	echo | cpio -H newc -o -O $(BINARIES_DIR)/initramfs
-ifneq ($(BR2_TARGET_MINIMAL_INITRAMFS_SKELETON),)
-		pushd $(BR2_TARGET_MINIMAL_INITRAMFS_SKELETON); find . | cpio -H newc -o -O $(BINARIES_DIR)/initramfs --append ; popd
+### create a minimal initramfs
+extradeps=
+INITRAMFSTMPDIR=$(BUILD_DIR)/initramfs.tmp
+
+ifeq ($(BR2_TARGET_ROOTFS_MINI_INITRAMFS_INSTALL_BUSYBOX),y)
+	extradeps += busybox
+endif
+
+$(BINARIES_DIR)/initramfs.gz: $(extradeps)
+	@$(call MESSAGE,"Generating root filesystem image initramfs.gz")
+	-rm -rf $(INITRAMFSTMPDIR)
+	mkdir -p $(INITRAMFSTMPDIR)
+ifneq ($(BR2_TARGET_ROOTFS_MINI_INITRAMFS_SKELETON),"")
+	cp -dpfR $(BR2_TARGET_ROOTFS_MINI_INITRAMFS_SKELETON)/* $(INITRAMFSTMPDIR)/
 endif
-ifneq ($(BR2_TARGET_MINIMAL_INITRAMFS_COPYLIST),)
-		pushd $(TARGET_DIR); cat $(BR2_TARGET_MINIMAL_INITRAMFS_COPYLIST) | cpio -H newc -o -O $(BINARIES_DIR)/initramfs --append ; popd
+ifneq ($(BR2_TARGET_ROOTFS_MINI_INITRAMFS_COPYLIST),"")
+	for FILE in `cat $(BR2_TARGET_ROOTFS_MINI_INITRAMFS_COPYLIST)` ; do cp -dpfR $(TARGET_DIR)/$${FILE} $(INITRAMFSTMPDIR)/ ; done
 endif
+ifeq ($(BR2_TARGET_ROOTFS_MINI_INITRAMFS_INSTALL_BUSYBOX),y)
+	cp $(TARGET_DIR)/bin/busybox $(INITRAMFSTMPDIR)/bin/
+	# if neccessary, create missing busybox.links
+	test -e $(BUSYBOX_DIR)/busybox.links || make -C $(BUSYBOX_DIR) busybox.links
+	for LINK in `cat $(BUSYBOX_DIR)/busybox.links | grep -v linuxrc` ; do ln -sf ../bin/busybox $(INITRAMFSTMPDIR)$${LINK}; done
+endif
+	pushd $(INITRAMFSTMPDIR); find . | cpio -H newc -o -O $(BINARIES_DIR)/initramfs; popd
+	-rm -rf $(INITRAMFSTMPDIR)
 	gzip -f -9 $(BINARIES_DIR)/initramfs
 
 mini-initramfs: $(BINARIES_DIR)/initramfs.gz
 
-ifeq ($(BR2_TARGET_MINIMAL_INITRAMFS),y)
-TARGETS+=mini-initramfs
-endif
\ No newline at end of file
+ifeq ($(BR2_TARGET_ROOTFS_MINI_INITRAMFS),y)
+#TARGETS+=mini-initramfs
+$(eval $(call ROOTFS_TARGET,mini-initramfs))
+endif
+
+### end minimal initramfs
diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
index f8118ce..2e4c375 100644
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -5,6 +5,9 @@ config BR2_TARGET_ROOTFS_ISO9660
 	help
 	  Build a bootable iso9660 image
 
+menu "iso image options"
+depends on BR2_TARGET_ROOTFS_ISO9660
+
 choice
 	prompt "Bootloader"
 	default BR2_TARGET_ROOTFS_ISO9660_BOOTLOADER_ISOLINUX
@@ -34,7 +37,20 @@ config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
 
 config BR2_TARGET_ROOTFS_ISO9660_COPY_INITRAMFS
 	bool "copy initramfs into /boot"
+	select BR2_TARGET_DO_INITRAMFS
+	select BR2_PACKAGE_BUSYBOX
+	depends on BR2_TARGET_ROOTFS_ISO9660_BOOTLOADER_ISOLINUX
+
+config BR2_TARGET_ROOTFS_ISO9660_COMPRESS
+	bool "compress ISO image contents"
+	depends on BR2_TARGET_DO_INITRAMFS
 	depends on BR2_TARGET_ROOTFS_ISO9660_BOOTLOADER_ISOLINUX
+	help
+		Compresses the contents of the ISO image via mkzftree, creating
+		a ZISOFS.
+		You'll need a kernel with the CONFIG_ZISOFS option enabled.
 
+endmenu
+	
 comment "iso image requires a Linux kernel to be built"
 	depends on (BR2_i386 || BR2_x86_64) && !BR2_LINUX_KERNEL
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 83b4cef..2a92497 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -15,6 +15,7 @@ ifeq ($(BR2_TARGET_ROOTFS_ISO9660_SQUASH),y)
 ISO9660_OPTS+=-U
 endif
 
+### using grub as a boot loader and using the ext2 image
 ifeq ($(BR2_TARGET_ROOTFS_ISO9660_BOOTLOADER_GRUB),y)
 $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux26 rootfs-ext2 grub
 	@$(call MESSAGE,"Generating root filesystem image rootfs.iso9660")
@@ -39,9 +40,25 @@ $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux26 rootfs-ext2 gr
 	- at rm -rf $(ISO9660_TARGET_DIR)
 endif
 
+### using isolinux and the files directly on the CD
 ifeq ($(BR2_TARGET_ROOTFS_ISO9660_BOOTLOADER_ISOLINUX),y)
-$(BINARIES_DIR)/rootfs.iso9660: host-cdrkit linux26 syslinux
+
+extradeps=
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_COPY_INITRAMFS),y)
+	extradeps += mini-initramfs
+endif
+
+ISO9660_SOURCE_DIR = $(TARGET_DIR)
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_COMPRESS),y)
+	extradeps += host-zisofs-tools
+	ISO9660_SOURCE_DIR = $(BUILD_DIR)/iso9660.tmp
+endif
+
+$(BINARIES_DIR)/rootfs.iso9660: host-cdrkit linux26 syslinux $(extradeps)
 	@$(call MESSAGE,"Generating root filesystem image rootfs.iso9660")
+	genisoimage_extraoptions=
+	# Get the boot loader and kernel ready
 	mkdir -p $(TARGET_DIR)/boot/isolinux
 	cp $(BINARIES_DIR)/isolinux.bin $(TARGET_DIR)/boot/isolinux/
 	cp $(ISO9660_BOOT_MENU) $(TARGET_DIR)/boot/isolinux/isolinux.cfg
@@ -49,11 +66,25 @@ $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit linux26 syslinux
 ifeq ($(BR2_TARGET_ROOTFS_ISO9660_COPY_INITRAMFS),y)
 	cp $(BINARIES_DIR)/initramfs.gz $(TARGET_DIR)/boot/
 endif
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_COMPRESS),y)	
+	# create the ZISOFS
+	genisoimage_extraoptions=-z
+	-rm -rf $(ISO9660_SOURCE_DIR)
+	@$(call MESSAGE,"Compressing iso filesystem...")
+	$(HOST_DIR)/usr/bin/mkzftree -z 9 -p $(BR2_JLEVEL) $(TARGET_DIR) $(ISO9660_SOURCE_DIR)
+	# now we need to restore the files which shouldn't be compressed
+	rm -rf $(ISO9660_SOURCE_DIR)/boot
+	cp -fdpR $(TARGET_DIR)/boot $(ISO9660_SOURCE_DIR)/
+endif
+	# Let's create the ISO image
 	$(HOST_DIR)/usr/bin/genisoimage -R -b boot/isolinux/isolinux.bin -c boot/boot.cat -no-emul-boot \
 		-boot-load-size 4 -boot-info-table -o $@ \
-		-J -l -R -iso-level 2 \
+		-J -l -R -iso-level 2 $(genisoimage_extraoptions) \
 		-allow-leading-dots -allow-lowercase -allow-multidot \
-		$(TARGET_DIR)
+		$(ISO9660_SOURCE_DIR)
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_COMPRESS),y)
+	rm -rf $(ISO9660_SOURCE_DIR)
+endif
 endif
 	
 rootfs-iso9660: $(BINARIES_DIR)/rootfs.iso9660
-- 
1.7.3.2
