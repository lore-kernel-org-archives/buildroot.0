From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 23:41:37 +0200
Subject: [Buildroot] [git commit] syslinux: Allow to build multiple flavors
	simultaneously
Message-ID: <20160418214751.013AD80741@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3177e74c8fb62c73717cece440902c1cb0b1243f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This becomes handy when building hybrid images that needs to be able
to boot in MBR and GPT mode.

Signed-off-by: Beno??t Allard <benoit.allard@greenbone.net>
Tested-by: Matt Weber <matt@thewebers.ws>
Reviewed-by: Matt Weber <matt@thewebers.ws>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/syslinux/Config.in   | 17 +++++++++--------
 boot/syslinux/syslinux.mk |  4 ++--
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index f4b9870..6067e9c 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -2,6 +2,11 @@ config BR2_TARGET_SYSLINUX
 	bool "syslinux"
 	depends on BR2_i386 || BR2_x86_64
 	select BR2_HOSTARCH_NEEDS_IA32_COMPILER
+	# Make sure at least one of the flavors is installed
+	select BR2_TARGET_SYSLINUX_ISOLINUX \
+		if !BR2_TARGET_SYSLINUX_PXELINUX && \
+		   !BR2_TARGET_SYSLINUX_MBR && \
+		   !BR2_TARGET_SYSLINUX_EFI
 	help
 	  The syslinux bootloader for x86 systems.
 	  This includes: syslinux, pxelinux, extlinux.
@@ -13,25 +18,22 @@ if BR2_TARGET_SYSLINUX
 config BR2_TARGET_SYSLINUX_LEGACY_BIOS
 	bool
 
-choice
-	bool "Image to install"
-
 config BR2_TARGET_SYSLINUX_ISOLINUX
-	bool "isolinux"
+	bool "install isolinux"
 	select BR2_TARGET_SYSLINUX_LEGACY_BIOS
 	help
 	  Install the legacy-BIOS 'isolinux' image, to boot off
 	  optical media (CDROM, DVD.)
 
 config BR2_TARGET_SYSLINUX_PXELINUX
-	bool "pxelinux"
+	bool "install pxelinux"
 	select BR2_TARGET_SYSLINUX_LEGACY_BIOS
 	help
 	  Install the legacy-BIOS 'pxelinux' image, to boot off
 	  the network using PXE.
 
 config BR2_TARGET_SYSLINUX_MBR
-	bool "mbr"
+	bool "install mbr"
 	select BR2_TARGET_SYSLINUX_LEGACY_BIOS
 	help
 	  Install the legacy-BIOS 'mbr' image, to boot off a
@@ -39,12 +41,11 @@ config BR2_TARGET_SYSLINUX_MBR
 	  or 'syslinux').
 
 config BR2_TARGET_SYSLINUX_EFI
-	bool "efi"
+	bool "install efi"
 	select BR2_PACKAGE_GNU_EFI
 	help
 	  Install the 'efi' image, to boot from an EFI environment.
 
-endchoice
 
 if BR2_TARGET_SYSLINUX_LEGACY_BIOS
 
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 0868896..82890c5 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -16,7 +16,7 @@ SYSLINUX_INSTALL_IMAGES = YES
 SYSLINUX_DEPENDENCIES = host-nasm host-util-linux host-upx
 
 ifeq ($(BR2_TARGET_SYSLINUX_LEGACY_BIOS),y)
-SYSLINUX_TARGET = bios
+SYSLINUX_TARGET += bios
 endif
 
 # The syslinux build system must be forced to use Buildroot's gnu-efi
@@ -30,7 +30,7 @@ else
 SYSLINUX_EFI_BITS = efi32
 endif # 64-bit
 SYSLINUX_DEPENDENCIES += gnu-efi
-SYSLINUX_TARGET = $(SYSLINUX_EFI_BITS)
+SYSLINUX_TARGET += $(SYSLINUX_EFI_BITS)
 SYSLINUX_EFI_ARGS = \
 	EFIINC=$(STAGING_DIR)/usr/include/efi \
 	LIBDIR=$(STAGING_DIR)/usr/lib \
