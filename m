From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  9 Jun 2015 00:21:43 +0200
Subject: [Buildroot] [PATCHv2 10/15] fs/iso9660: introduce bootloader choice
In-Reply-To: <1433802108-14351-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433802108-14351-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1433802108-14351-11-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In preparation to the introduction for the support of other
bootloaders than Grub, this commit adds a "choice ... endchoice" block
with just the Grub option, and adds some conditionals in the
iso9660.mk code for the Grub specific parts.

Of course, for now those conditionals are a bit useless with just this
commit, but they become useful with the followup commits.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/iso9660/Config.in  | 14 +++++++++++---
 fs/iso9660/iso9660.mk | 20 +++++++++++++++-----
 2 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
index e300fdb..f5e5f32 100644
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -4,8 +4,6 @@ config BR2_TARGET_ROOTFS_ISO9660
 	depends on BR2_LINUX_KERNEL
 	select BR2_LINUX_KERNEL_INSTALL_TARGET \
 	       if (!BR2_TARGET_ROOTFS_ISO9660_INITRD && !BR2_TARGET_ROOTFS_INITRAMFS)
-	select BR2_TARGET_GRUB
-	select BR2_TARGET_GRUB_FS_ISO9660
 	help
 	  Build a bootable ISO9660 image. By default, the root
 	  filesystem is directly packed as the ISO9660 filesystem,
@@ -22,9 +20,19 @@ config BR2_TARGET_ROOTFS_ISO9660
 
 if BR2_TARGET_ROOTFS_ISO9660
 
+choice
+	prompt "Bootloader"
+
+config BR2_TARGET_ROOTFS_ISO9660_GRUB
+	bool "grub"
+	select BR2_TARGET_GRUB
+	select BR2_TARGET_GRUB_FS_ISO9660
+
+endchoice
+
 config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
 	string "Boot menu.lst file"
-	default "fs/iso9660/menu.lst"
+	default "fs/iso9660/menu.lst" if BR2_TARGET_ROOTFS_ISO9660_GRUB
 	help
 	  Use this option to provide a custom Grub menu.lst file. Note
 	  that the strings __KERNEL_PATH__ and __INITRD_PATH__ will
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 2e695b0..6a1b214 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -24,7 +24,7 @@
 
 ROOTFS_ISO9660_BOOT_MENU = $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
 
-ROOTFS_ISO9660_DEPENDENCIES = grub host-cdrkit host-fakeroot linux
+ROOTFS_ISO9660_DEPENDENCIES = host-cdrkit host-fakeroot linux
 
 ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
 ROOTFS_ISO9660_USE_INITRD = YES
@@ -44,28 +44,36 @@ else
 ROOTFS_ISO9660_TARGET_DIR = $(TARGET_DIR)
 endif
 
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB),y)
+ROOTFS_ISO9660_DEPENDENCIES += grub
 ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH = \
 	$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
 ROOTFS_ISO9660_BOOT_IMAGE = boot/grub/stage2_eltorito
-
-define ROOTFS_ISO9660_PREPARATION
+define ROOTFS_ISO9660_INSTALL_BOOTLOADER
 	$(INSTALL) -D -m 0644 $(GRUB_DIR)/stage2/stage2_eltorito \
 		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/stage2_eltorito
+endef
+endif
+
+define ROOTFS_ISO9660_PREPARATION
 	$(INSTALL) -D -m 0644 $(ROOTFS_ISO9660_BOOT_MENU) \
 		$(ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH)
 	$(SED) "s%__KERNEL_PATH__%/boot/$(LINUX_IMAGE_NAME)%" \
 		$(ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH)
+	$(ROOTFS_ISO9660_INSTALL_BOOTLOADER)
 endef
 
 ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_PREPARATION
 
-# Splash screen disabling
+# Grub splash screen disabling
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB),y)
 ifeq ($(BR2_TARGET_GRUB_SPLASH),)
 define ROOTFS_ISO9660_DISABLE_SPLASHSCREEN
 	$(SED) '/^splashimage/d' $(ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH)
 endef
 ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_DISABLE_SPLASHSCREEN
 endif
+endif
 
 define ROOTFS_ISO9660_DISABLE_EXTERNAL_INITRD
 	$(SED) '/__INITRD_PATH__/d'  $(ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH)
@@ -73,7 +81,8 @@ endef
 
 ifeq ($(ROOTFS_ISO9660_USE_INITRD),YES)
 
-# Copy splashscreen to temporary filesystem
+# Copy Grub splashscreen to temporary filesystem
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB),y)
 ifeq ($(BR2_TARGET_GRUB_SPLASH),y)
 define ROOTFS_ISO9660_INSTALL_SPLASHSCREEN
 	$(INSTALL) -D -m 0644 $(TARGET_DIR)/boot/grub/splash.xpm.gz \
@@ -81,6 +90,7 @@ define ROOTFS_ISO9660_INSTALL_SPLASHSCREEN
 endef
 ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_INSTALL_SPLASHSCREEN
 endif
+endif
 
 # Copy the kernel to temporary filesystem
 define ROOTFS_ISO9660_COPY_KERNEL
-- 
2.1.0
