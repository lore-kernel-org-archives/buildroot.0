From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 21:52:58 +0100
Subject: [Buildroot] [git commit] fs/iso9660: doesn't support (grub2) EFI
Message-ID: <20170301205304.A45457FC0F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e57fa370cb8e4d5f80c6abb34671f0c0467e506
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The iso9660 generation for grub2 assumes that grub-eltorito.img is
available. However, this image is only available for the i386-pc target
(i.e. legacy BIOS). An EFI-bootable iso9660 requires a different layout.

Since we currently can't generate the EFI-bootable iso9660 layout,
require the i386-pc target to be selected in grub.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reported-by: arnaud.miche at orange.com
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/iso9660/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
index 2482e44..d162586 100644
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -3,7 +3,7 @@ config BR2_TARGET_ROOTFS_ISO9660
 	depends on (BR2_i386 || BR2_x86_64)
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_TARGET_GRUB || \
-		BR2_TARGET_GRUB2 || \
+		BR2_TARGET_GRUB2_I386_PC || \
 		BR2_TARGET_SYSLINUX_ISOLINUX
 	select BR2_LINUX_KERNEL_INSTALL_TARGET \
 	       if (!BR2_TARGET_ROOTFS_ISO9660_INITRD && !BR2_TARGET_ROOTFS_INITRAMFS)
@@ -33,7 +33,7 @@ config BR2_TARGET_ROOTFS_ISO9660_GRUB
 
 config BR2_TARGET_ROOTFS_ISO9660_GRUB2
 	bool "grub2"
-	depends on BR2_TARGET_GRUB2
+	depends on BR2_TARGET_GRUB2_I386_PC
 	help
 	  Use Grub 2 as the bootloader for the ISO9660 image. Make
 	  sure to enable the 'iso9660' module in
@@ -82,7 +82,7 @@ config BR2_TARGET_ROOTFS_ISO9660_HYBRID
 
 endif
 
-comment "iso image needs a Linux kernel and one of grub, grub2 or isolinux to be built"
+comment "iso image needs a Linux kernel and one of grub, grub2 i386-pc or isolinux to be built"
 	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_LINUX_KERNEL || \
-		!(BR2_TARGET_GRUB || BR2_TARGET_GRUB2 || BR2_TARGET_SYSLINUX_ISOLINUX)
+		!(BR2_TARGET_GRUB || BR2_TARGET_GRUB2_I386_PC || BR2_TARGET_SYSLINUX_ISOLINUX)
