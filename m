From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Apr 2014 00:30:04 +0200
Subject: [Buildroot] [PATCH 9/9] boot/syslinux: add an option to install an
	MBR blob
In-Reply-To: <cover.1398378217.git.yann.morin.1998@free.fr>
References: <cover.1398378217.git.yann.morin.1998@free.fr>
Message-ID: <ccf1ac950371fe7411ff812bb17958a8824be30d.1398378217.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

This MBR blob will look for an active partition, and boot the bootcode
present in that partition. This can be used to boot an extlinux-prepared
partition.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Lundquist <lists@zelow.no>
Cc: Frank Hunleth <fhunleth@troodon-software.com>
---
 boot/syslinux/Config.in   | 13 ++++++++++++-
 boot/syslinux/syslinux.mk |  1 +
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index d556c55..7d4dd08 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -15,7 +15,7 @@ choice
 
 config BR2_TARGET_SYSLINUX_LEGACY_BIOS
 	bool "bios (legacy)"
-	select BR2_TARGET_SYSLINUX_ISOLINUX if !BR2_TARGET_SYSLINUX_PXELINUX
+	select BR2_TARGET_SYSLINUX_ISOLINUX if !BR2_TARGET_SYSLINUX_HAS_BIOS_IMG
 	help
 	  Install one or more of the the legacy BIOS images:
 	    - isolinux
@@ -31,6 +31,9 @@ endchoice
 
 if BR2_TARGET_SYSLINUX_LEGACY_BIOS
 
+config BR2_TARGET_SYSLINUX_HAS_BIOS_IMG
+	bool
+
 config BR2_TARGET_SYSLINUX_ISOLINUX
 	bool "isolinux"
 	default y
@@ -40,10 +43,18 @@ config BR2_TARGET_SYSLINUX_ISOLINUX
 
 config BR2_TARGET_SYSLINUX_PXELINUX
 	bool "pxelinux"
+	select BR2_TARGET_SYSLINUX_HAS_BIOS_IMG
 	help
 	  Install the legacy BIOS 'pxelinux' image, to boot off
 	  the network using PXE.
 
+config BR2_TARGET_SYSLINUX_MBR
+	bool "mbr"
+	select BR2_TARGET_SYSLINUX_HAS_BIOS_IMG
+	help
+	  Install the legacy BIOS 'mbr' image, to boot off a
+	  local MBR-partition.
+
 endif # BR2_TARGET_SYSLINUX_LEGACY_BIOS
 
 endif # BR2_TARGET_SYSLINUX
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index bf0bae5..c614b1d 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -60,6 +60,7 @@ endef
 
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_ISOLINUX) += bios/core/isolinux.bin
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_PXELINUX) += bios/core/pxelinux.bin
+SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_MBR) += bios/mbr/mbr.bin
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_EFI) += $(SYSLINUX_EFI_BITS)/efi/syslinux.efi
 
 define SYSLINUX_INSTALL_IMAGES_CMDS
-- 
1.8.3.2
