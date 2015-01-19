From: =?UTF-8?q?No=C3=A9=20Rubinstein?= <nrubinstein@aldebaran.com>
Date: Mon, 19 Jan 2015 20:52:55 +0100
Subject: [Buildroot] [PATCH 1/3] fs/iso9660: allow building a hybrid ISO
	image
Message-ID: <1421697177-12995-1-git-send-email-nrubinstein@aldebaran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds an option to build an ISO image using ISOLINUX as a
bootloader, as ISOLINUX provides "isohybrid", an utility that enables
using an ISO image as a bootable disk image.

Signed-off-by: No? Rubinstein <nrubinstein@aldebaran.com>
---
 fs/iso9660/Config.in    | 41 ++++++++++++++++++++++++++++++++++++-----
 fs/iso9660/iso9660.mk   | 48 ++++++++++++++++++++++++++++++++++++++++--------
 fs/iso9660/isolinux.cfg |  4 ++++
 3 files changed, 80 insertions(+), 13 deletions(-)
 create mode 100644 fs/iso9660/isolinux.cfg

diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
index 50b4377..900dc43 100644
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -3,15 +3,46 @@ config BR2_TARGET_ROOTFS_ISO9660
 	depends on (BR2_i386 || BR2_x86_64)
 	depends on BR2_LINUX_KERNEL
 	select BR2_TARGET_ROOTFS_CPIO
-	select BR2_TARGET_GRUB
-	select BR2_TARGET_GRUB_FS_ISO9660
 	help
 	  Build a bootable iso9660 image
 
-config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
-	string "Boot menu.lst file"
+choice
+	prompt "bootloader"
+	default BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
+	depends on BR2_TARGET_ROOTFS_ISO9660
+	help
+	  Select the bootloader used on the ISO image
+
+config BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
+	bool "isolinux"
+	select BR2_TARGET_SYSLINUX
+	select BR2_TARGET_SYSLINUX_ISOLINUX
+	help
+	  Select this if you want a hybrid ISO, flashable from either an optical
+	  disk or a flash drive.
+
+config BR2_TARGET_ROOTFS_ISO9660_GRUB
+	bool "grub"
+	select BR2_TARGET_GRUB
+	select BR2_TARGET_GRUB_FS_ISO9660
+
+endchoice
+
+config BR2_TARGET_ROOTFS_ISO9660_CUSTOM_BOOT_CONFIG
+	bool "Use a custom boot config file"
+	depends on BR2_TARGET_ROOTFS_ISO9660
+
+config BR2_TARGET_ROOTFS_ISO9660_CUSTOM_BOOT_CONFIG_PATH
+	string "Path to custom boot config file"
+	depends on BR2_TARGET_ROOTFS_ISO9660_CUSTOM_BOOT_CONFIG
+
+config BR2_TARGET_ROOTFS_ISO9660_BOOT_CONFIG
+	string
 	depends on BR2_TARGET_ROOTFS_ISO9660
-	default "fs/iso9660/menu.lst"
+	default $(BR2_TARGET_ROOTFS_ISO9660_CUSTOM_BOOT_CONFIG_PATH) \
+		if BR2_TARGET_ROOTFS_ISO9660_CUSTOM_BOOT_CONFIG
+	default "fs/iso9660/isolinux.cfg" if BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
+	default "fs/iso9660/menu.lst" if BR2_TARGET_ROOTFS_ISO9660_GRUB
 
 comment "iso image needs a Linux kernel to be built"
 	depends on BR2_i386 || BR2_x86_64
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 5b44ba4..0c6e526 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -8,41 +8,73 @@
 ################################################################################
 
 ISO9660_TARGET_DIR = $(BUILD_DIR)/iso9660
-ISO9660_BOOT_MENU := $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
+ROOTFS_ISO9660_DEPENDENCIES = host-cdrkit host-fakeroot linux rootfs-cpio
+$(info BR2_TARGET_ROOTFS_ISO9660_BOOT_CONFIG: $(BR2_TARGET_ROOTFS_ISO9660_BOOT_CONFIG))
+ISO9660_BOOT_CONFIG := $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_CONFIG))
 
-ROOTFS_ISO9660_DEPENDENCIES = grub host-cdrkit host-fakeroot linux rootfs-cpio
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB),y)
+ISO9660_BOOT_CONFIG_TARGET := $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
+ISO9660_BOOT_BINARY = boot/grub/stage2_eltorito
+ROOTFS_ISO9660_DEPENDENCIES += grub
+else
+ISO9660_BOOT_CONFIG_TARGET := $(ISO9660_TARGET_DIR)/isolinux/isolinux.cfg
+ISO9660_BOOT_BINARY = isolinux/isolinux.bin
+ISO9660_PROGRAM_OPTS = -c isolinux/boot.cat
+ROOTFS_ISO9660_DEPENDENCIES += syslinux
+endif
 
 $(BINARIES_DIR)/rootfs.iso9660: $(ROOTFS_ISO9660_DEPENDENCIES)
 	@$(call MESSAGE,"Generating root filesystem image rootfs.iso9660")
+
+	$(INSTALL) -D -m 0644 $(ISO9660_BOOT_CONFIG) $(ISO9660_BOOT_CONFIG_TARGET)
+	$(INSTALL) -D -m 0644 $(LINUX_IMAGE_PATH) $(ISO9660_TARGET_DIR)/kernel
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB),y)
+	# Install Grub
 	$(INSTALL) -D -m 0644 $(GRUB_DIR)/stage2/stage2_eltorito \
 		$(ISO9660_TARGET_DIR)/boot/grub/stage2_eltorito
-	$(INSTALL) -D -m 0644 $(ISO9660_BOOT_MENU) \
-		$(ISO9660_TARGET_DIR)/boot/grub/menu.lst
+
 ifeq ($(BR2_TARGET_GRUB_SPLASH),)
 	$(SED) '/^splashimage/d' $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
 else
 	$(INSTALL) -D -m 0644 boot/grub/splash.xpm.gz \
 		$(ISO9660_TARGET_DIR)/splash.xpm.gz
 endif
-	$(INSTALL) -D -m 0644 $(LINUX_IMAGE_PATH) $(ISO9660_TARGET_DIR)/kernel
+else
+	# Install ISOLINUX
+	mkdir -p $(ISO9660_TARGET_DIR)/isolinux/
+	$(INSTALL) -D -m 0644 $(SYSLINUX_DIR)/bios/core/isolinux.bin \
+		$(ISO9660_TARGET_DIR)/isolinux/
+	$(INSTALL) -D -m 0644 $(SYSLINUX_DIR)/bios/com32/elflink/ldlinux/ldlinux.c32 \
+		$(ISO9660_TARGET_DIR)/isolinux/
+	$(INSTALL) -D -m 0644 $(ISO9660_BOOT_CONFIG) \
+		$(ISO9660_TARGET_DIR)/isolinux/isolinux.cfg
+endif
+
 ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
-	$(SED) '/initrd/d'  $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
+	$(SED) '/initrd/d'  $(ISO9660_BOOT_CONFIG_TARGET)
 else
 	$(INSTALL) -D -m 0644 $(BINARIES_DIR)/rootfs.cpio$(ROOTFS_CPIO_COMPRESS_EXT) \
 		$(ISO9660_TARGET_DIR)/initrd
 endif
+
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(FAKEROOT_SCRIPT)
 	echo "chown -h -R 0:0 $(ISO9660_TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
 	# Use fakeroot so mkisofs believes the previous fakery
-	echo "$(HOST_DIR)/usr/bin/genisoimage -R -b boot/grub/stage2_eltorito -no-emul-boot " \
-		"-boot-load-size 4 -boot-info-table -o $@ $(ISO9660_TARGET_DIR)" \
+	echo "$(HOST_DIR)/usr/bin/genisoimage -R -b $(ISO9660_BOOT_BINARY) -no-emul-boot " \
+		"-boot-load-size 4 -boot-info-table $(ISO9660_PROGRAM_OPTS) " \
+		"-o $@ $(ISO9660_TARGET_DIR)" \
 		>> $(FAKEROOT_SCRIPT)
 	chmod a+x $(FAKEROOT_SCRIPT)
 	$(HOST_DIR)/usr/bin/fakeroot -- $(FAKEROOT_SCRIPT)
 	- at rm -f $(FAKEROOT_SCRIPT)
 	- at rm -rf $(ISO9660_TARGET_DIR)
 
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_ISOLINUX),y)
+	$(HOST_DIR)/usr/bin/isohybrid $@
+endif
+
 rootfs-iso9660: $(BINARIES_DIR)/rootfs.iso9660
 
 rootfs-iso9660-show-depends:
diff --git a/fs/iso9660/isolinux.cfg b/fs/iso9660/isolinux.cfg
new file mode 100644
index 0000000..8874467
--- /dev/null
+++ b/fs/iso9660/isolinux.cfg
@@ -0,0 +1,4 @@
+default 1
+label 1
+	kernel /kernel
+	append initrd=/initrd
-- 
2.1.4

Please ignore the below footer, which is of course irrelevant to this patch.

-- 




*This email and any attachment thereto are confidential and intended solely 
for the use of the individual or entity to whom they are addressed.If you 
are not the intended recipient, please be advised that disclosing, copying, 
distributing or taking any action in reliance on the contents of this email 
is strictly prohibited. In such case, please immediately advise the sender, 
and delete all copies and attachment from your system.This email shall not 
be construed and is not tantamount to an offer, an acceptance of offer, or 
an agreement by Aldebaran Robotics on any discussion or contractual 
document whatsoever. No employee or agent is authorized to represent or 
bind Aldebaran Robotics to third parties by email, or act on behalf of 
Aldebaran Robotics by email, without express written confirmation by 
Aldebaran Robotics? duly authorized representatives.*
------------------------------

*Ce message ?lectronique et ?ventuelles pi?ces jointes sont confidentiels, 
et exclusivement destin?s ? la personne ou l'entit? ? qui ils sont 
adress?s.*

*Si vous n'?tes pas le destinataire vis?, vous ?tes pri? de ne pas 
divulguer, copier, distribuer ou prendre toute d?cision sur la foi de ce 
message ?lectronique. Merci d'en aviser imm?diatement l'exp?diteur et de 
supprimer toutes les copies et ?ventuelles pi?ces jointes de votre syst?me.*

*Ce message ?lectronique n'?quivaut pas ? une offre, ? une acceptation 
d?offre, ou ? un accord d'Aldebaran Robotics sur toute discussion ou 
document contractuel quel qu?il soit, et ne peut ?tre interpr?t? comme tel. 
Aucun employ? ou agent d?Aldebaran Robotics n'est autoris? ? repr?senter ou 
? engager la soci?t? par email, ou ? agir au nom et pour le compte de la 
soci?t? par email, sans qu?une confirmation ?crite soit donn?e par le 
repr?sentant l?gal d?Aldebaran Robotics ou par toute autre personne ayant 
re?u d?l?gation de pouvoir appropri?e.*
