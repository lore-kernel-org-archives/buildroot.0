From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Apr 2014 18:49:17 +0200
Subject: [Buildroot] [PATCH 9/9] boot/syslinux: add an option to install an
	MBR blob
In-Reply-To: <cover.1398789775.git.yann.morin.1998@free.fr>
References: <cover.1398789775.git.yann.morin.1998@free.fr>
Message-ID: <8643aef1dfbf257e6cd7a0721d4cfd9f9e3a6dea.1398789775.git.yann.morin.1998@free.fr>
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
Changes v1 -> v2:
  - slightly expand the help entry
---
 boot/syslinux/Config.in   | 8 ++++++++
 boot/syslinux/syslinux.mk | 1 +
 2 files changed, 9 insertions(+)

diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index 5f0fe97..b6e8673 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -30,6 +30,14 @@ config BR2_TARGET_SYSLINUX_PXELINUX
 	  Install the legacy-BIOS 'pxelinux' image, to boot off
 	  the network using PXE.
 
+config BR2_TARGET_SYSLINUX_MBR
+	bool "mbr"
+	select BR2_TARGET_SYSLINUX_LEGACY_BIOS
+	help
+	  Install the legacy BIOS 'mbr' image, to boot off a
+	  local MBR-partition (e.g. prepared with 'extlinux'
+	  or 'syslinux').
+
 config BR2_TARGET_SYSLINUX_EFI
 	bool "efi"
 	select BR2_PACKAGE_GNU_EFI
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
