From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
Date: Wed, 16 Mar 2016 16:50:20 +0100
Subject: [Buildroot] [PATCH 1/1] syslinux: Allow to build multiple flavors
	simultaneously
Message-ID: <1458143420-23193-1-git-send-email-benoit.allard@greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This becomes handy when building hybrid images that needs to be able to boot
in MBR and GPT mode.

Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
---
 boot/syslinux/Config.in   | 3 ---
 boot/syslinux/syslinux.mk | 4 ++--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index f4b9870..ea0fb16 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -13,8 +13,6 @@ if BR2_TARGET_SYSLINUX
 config BR2_TARGET_SYSLINUX_LEGACY_BIOS
 	bool
 
-choice
-	bool "Image to install"
 
 config BR2_TARGET_SYSLINUX_ISOLINUX
 	bool "isolinux"
@@ -44,7 +42,6 @@ config BR2_TARGET_SYSLINUX_EFI
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
