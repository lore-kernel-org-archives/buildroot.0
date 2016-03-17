From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
Date: Thu, 17 Mar 2016 09:09:16 +0100
Subject: [Buildroot] [PATCH 1/1] syslinux: Allow to build multiple flavors
	simultaneously
Message-ID: <1458202156-25097-1-git-send-email-benoit.allard@greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This becomes handy when building hybrid images that needs to be able to boot
in MBR and GPT mode.

Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
---
Changed v1 -> v2
  - Always select at least isolinux (Suggested by Arnoud and Thomas)
  - Update the labels to read "install xxx"
---
 boot/syslinux/Config.in   | 17 +++++++++--------
 boot/syslinux/syslinux.mk |  4 ++--
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index f4b9870..5705d8f 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -2,6 +2,11 @@ config BR2_TARGET_SYSLINUX
 	bool "syslinux"
 	depends on BR2_i386 || BR2_x86_64
 	select BR2_HOSTARCH_NEEDS_IA32_COMPILER
+	# Make sure at least one of the flavor is installed
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
-- 
2.1.4
