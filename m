From: jean.sorgemoel at laposte.net <jean.sorgemoel@laposte.net>
Date: Sun,  2 Mar 2014 22:41:54 +0100
Subject: [Buildroot] [PATCH v6 1/2] adding bootloader option for iso9660
	filesystem image
In-Reply-To: <1376644934-4302-1-git-send-email-jean.sorgemoel@laposte.net>
References: <1376644934-4302-1-git-send-email-jean.sorgemoel@laposte.net>
Message-ID: <1393796515-14625-1-git-send-email-jean.sorgemoel@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jerome Sagnole <jean.sorgemoel@laposte.net>

	* Adding multiple new options for ISO9660 filesystems: Joliet,
	   RockRidge, name, input charset

	* Adding the infrastructure to use different bootloaders.


Signed-off-by: Jerome Sagnole <jean.sorgemoel@laposte.net>
---

changes v4 -> v5:
	* addon to include comment Arnout Vandecappelle & Martin Bark
	* modify option to include files and directories in iso image
	   - suppress option BR2_TARGET_ROOTFS_ISOLINUX_EXTRA_FILES
	   - add option BR2_TARGET_ROOTFS_ISO9660_OVERLAY
	   - modify code to include this new option
	* modify comment
	* modify signed-off-by (use real name)
	* keep default option for BR2_TARGET_ROOTFS_ISO9660_ROCK_RIDGE
	    in old code, it defined by default (keep for compatibility)
	* modify default option for BR2_TARGET_ROOTFS_ISO9660_NAME
	* modify default option for BR2_TARGET_ROOTFS_ISO9660_INPUT_CHARSET 
	* modify variable name to add prefix 'ISO9660_'
	* "qstrip" each variable
	    BR2_TARGET_ROOTFS_ISO9660_INPUT_CHARSET
	    BR2_TARGET_ROOTFS_ISO9660_NAME
	* modify command INITRD_SED_CMD
	* modify kernel launch for this iso 
	   - use LINUX_IMAGE_NAME 
	   - add command sed to replace __LINUX_IMAGE_NAME__ in configuration
	* suppress bootmsg.txt in isolinux.cfg is empty (bootloader isolinux)


changes v3 -> v4:
	* addon to include remark Arnout Vandecappelle & Thomas Petazzoni
	* add choise to select bootloader in iso9660 menu
	* modify comment
	* seperate code in two patch
	  1st patch : update iso9660 with grub
	  2nd patch : add new bootloader isolinux


changes v2 -> v3:
	* addon to include remark Thomas Petazzoni & Arnout Vandecappelle
	  - modify comment
	  - default generate iso with grub bootloader
	  - you can select isolinux bootloader
	    - detail : (module fs/iso9660)
	    - option to select bootloader (grub/isolinux)
	    - file(s) bootloader configuration
	    - option to copy file(s) on iso (only for isolinux)
	    - option to create iso with long filenames (Joliet format)
	    - option to create iso with POSIX file system (file mode, uid, gid, ...)
	    - define volume label
	    - define parameter input charset
	    - can use initramfs (if activate), also cpio (like initrd)

changes v1 -> v2:
	* simplify code (suggest by Arnout Vandecappelle)
	  - I suppress redundant comment
	  - Suppress menu and use conditional (replace 'depends on' by 'if/endif')
	  - Modify comment
	  - suppress option (keyboard, ...)
	  - replace 8 x space by tabulation
	  - suppress extension 'BR2_'
	  - use variable 'ISOLINUX_DIR'
	  - suppress keyboard option
	  - I can't use command '$(INSTALL) -D' beacause I don't define filenames (I keep old code)
	  - Hide command genisoimage (with option $@) 

Changes v0 -> v1:
	* new branch to generate iso with bootloader isolinux


 fs/iso9660/Config.in  |   39 ++++++++++++++++++++++++++++++-
 fs/iso9660/iso9660.mk |   62 +++++++++++++++++++++++++++++++++++--------------
 2 files changed, 83 insertions(+), 18 deletions(-)

diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
index 50b4377..e881ca6 100644
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -8,10 +8,47 @@ config BR2_TARGET_ROOTFS_ISO9660
 	help
 	  Build a bootable iso9660 image
 
+if BR2_TARGET_ROOTFS_ISO9660
+
 config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
 	string "Boot menu.lst file"
-	depends on BR2_TARGET_ROOTFS_ISO9660
 	default "fs/iso9660/menu.lst"
+	help
+	  Grub configuration
+	  Define menu, commands and options for grub
+
+config BR2_TARGET_ROOTFS_ISO9660_JOLIET
+	bool "Create iso with Joliet format (long filenames)"
+	default y
+	help
+	  Generate iso image with Joliet directory records.
+	  Use Unicode and each path component can be up 64
+	  Unicode characters long.
+
+config BR2_TARGET_ROOTFS_ISO9660_ROCK_RIDGE
+	bool "Create iso with Rock Ridge extensions (POSIX filesystem)"
+	default y
+	help
+	  Generate iso image with Rock Ridge directory information,
+	  which makes it a POSIX filesystem (file mode, uid, gid, ...)
+
+config BR2_TARGET_ROOTFS_ISO9660_NAME
+	string "Volume label"
+	default ""
+	help
+	  cdrom name
+
+config BR2_TARGET_ROOTFS_ISO9660_INPUT_CHARSET
+	string "Input filename character encoding"
+	default "utf8"
+	help
+	  The character encoding with which the names of the files that
+	  will be copied into the iso9660 filesystem are encoded. For the
+	  RockRidge directory, the same encoding will be used. For the
+	  Joliet directory, it will be converted to UTF-16.
+	  (see program genisoimage : genisoimage -input-charset help)
+
+endif # BR2_TARGET_ROOTFS_ISO9660
 
 comment "iso image needs a Linux kernel to be built"
 	depends on BR2_i386 || BR2_x86_64
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index a6a9c95..7ac84ca 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -9,33 +9,53 @@
 
 ISO9660_TARGET_DIR = $(BUILD_DIR)/iso9660
 ISO9660_BOOT_MENU := $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
+ISO9660_CHARSET = $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_INPUT_CHARSET))
+ISO9660_NAME = $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_NAME))
+ISO9660_KERNEL_DST = $(ISO9660_TARGET_DIR)/kernel
+
+ISO9660_BOOTLOADER_BIN = $(GRUB_DIR)/stage2/stage2_eltorito
+ISO9660_BOOTLOADER_DIR = $(ISO9660_TARGET_DIR)/boot/grub/
+ISO9660_BOOTLOADER_DST_CFG = $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
+ISO9660_ELTORITO_BOOT = boot/grub/stage2_eltorito
 
 $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux rootfs-cpio grub
 	@$(call MESSAGE,"Generating root filesystem image rootfs.iso9660")
-	mkdir -p $(ISO9660_TARGET_DIR)
-	mkdir -p $(ISO9660_TARGET_DIR)/boot/grub
-	cp $(GRUB_DIR)/stage2/stage2_eltorito $(ISO9660_TARGET_DIR)/boot/grub/
-	cp $(ISO9660_BOOT_MENU) $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
+	@mkdir -p $(ISO9660_TARGET_DIR)
+	@mkdir -p $(ISO9660_BOOTLOADER_DIR)
+
+	@cp $(ISO9660_BOOTLOADER_BIN) $(ISO9660_BOOTLOADER_DIR)
+	@cp $(ISO9660_BOOT_MENU) $(ISO9660_BOOTLOADER_DST_CFG)
+	@cp $(LINUX_IMAGE_PATH) $(ISO9660_KERNEL_DST)
+
 ifeq ($(BR2_TARGET_GRUB_SPLASH),)
-	$(SED) '/^splashimage/d' $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
+	@$(SED) '/^splashimage/d' $(ISO9660_BOOTLOADER_DST_CFG)
 else
-	cp boot/grub/splash.xpm.gz $(ISO9660_TARGET_DIR)/
-endif
-	cp $(LINUX_IMAGE_PATH) $(ISO9660_TARGET_DIR)/kernel
+	@cp boot/grub/splash.xpm.gz $(ISO9660_TARGET_DIR)/
+endif # BR2_TARGET_GRUB_SPLASH
+
 ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
-	$(SED) '/initrd/d'  $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
+	@$(SED) '/initrd/d'  $(ISO9660_BOOTLOADER_DST_CFG)
 else
-	cp $(BINARIES_DIR)/rootfs.cpio$(ROOTFS_CPIO_COMPRESS_EXT) $(ISO9660_TARGET_DIR)/initrd
-endif
+	@cp $(BINARIES_DIR)/rootfs.cpio$(ROOTFS_CPIO_COMPRESS_EXT) \
+		$(ISO9660_TARGET_DIR)/initrd
+endif # BR2_TARGET_ROOTFS_INITRAMFS
+
 	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(FAKEROOT_SCRIPT)
-	echo "chown -R 0:0 $(ISO9660_TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
+	@rm -f $(FAKEROOT_SCRIPT)
+	@echo "chown -R 0:0 $(ISO9660_TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
 	# Use fakeroot so mkisofs believes the previous fakery
-	echo "$(HOST_DIR)/usr/bin/genisoimage -R -b boot/grub/stage2_eltorito -no-emul-boot " \
-		"-boot-load-size 4 -boot-info-table -o $@ $(ISO9660_TARGET_DIR)" \
+	@echo "$(HOST_DIR)/usr/bin/genisoimage " \
+		"$(GENISOIMAGE_OPTS) " \
+		"-b $(ISO9660_ELTORITO_BOOT) " \
+		"-no-emul-boot " \
+		"-boot-load-size 4 " \
+		"-boot-info-table " \
+		"-input-charset '$(ISO9660_CHARSET)' " \
+		"-V '$(ISO9660_NAME)' " \
+		"-o $@ $(ISO9660_TARGET_DIR)" \
 		>> $(FAKEROOT_SCRIPT)
-	chmod a+x $(FAKEROOT_SCRIPT)
-	$(HOST_DIR)/usr/bin/fakeroot -- $(FAKEROOT_SCRIPT)
+	@chmod a+x $(FAKEROOT_SCRIPT)
+	@$(HOST_DIR)/usr/bin/fakeroot -- $(FAKEROOT_SCRIPT)
 	- at rm -f $(FAKEROOT_SCRIPT)
 	- at rm -rf $(ISO9660_TARGET_DIR)
 
@@ -49,3 +69,11 @@ rootfs-iso9660: $(BINARIES_DIR)/rootfs.iso9660
 ifeq ($(BR2_TARGET_ROOTFS_ISO9660),y)
 TARGETS += rootfs-iso9660
 endif
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_JOLIET),y)
+GENISOIMAGE_OPTS += -J
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_ROCK_RIDGE),y)
+GENISOIMAGE_OPTS += -R
+endif
-- 
1.7.10.4
