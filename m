From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 May 2014 22:00:00 +0200
Subject: [Buildroot] [git commit] boot/syslinux: add an option to install a
	MBR blob
Message-ID: <20140503200856.2DDC69CACC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6cdb0c4935cebb2d544013f33aa92df430144657
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This MBR blob will look for an active partition, and boot the bootcode
present in that partition. This can be used to boot an extlinux-prepared
partition.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Lundquist <lists@zelow.no>
Cc: Frank Hunleth <fhunleth@troodon-software.com>
Tested-by: Frank Hunleth <fhunleth@troodon-software.com>
Tested-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/syslinux/Config.in   |    8 ++++++++
 boot/syslinux/syslinux.mk |    1 +
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index 5f0fe97..28c5329 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -30,6 +30,14 @@ config BR2_TARGET_SYSLINUX_PXELINUX
 	  Install the legacy-BIOS 'pxelinux' image, to boot off
 	  the network using PXE.
 
+config BR2_TARGET_SYSLINUX_MBR
+	bool "mbr"
+	select BR2_TARGET_SYSLINUX_LEGACY_BIOS
+	help
+	  Install the legacy-BIOS 'mbr' image, to boot off a
+	  local MBR-partition (e.g. prepared with 'extlinux'
+	  or 'syslinux').
+
 config BR2_TARGET_SYSLINUX_EFI
 	bool "efi"
 	select BR2_PACKAGE_GNU_EFI
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 95ece52..5432d0a 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -60,6 +60,7 @@ endef
 
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_ISOLINUX) += bios/core/isolinux.bin
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_PXELINUX) += bios/core/pxelinux.bin
+SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_MBR) += bios/mbr/mbr.bin
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_EFI) += $(SYSLINUX_EFI_BITS)/efi/syslinux.efi
 
 define SYSLINUX_INSTALL_IMAGES_CMDS
