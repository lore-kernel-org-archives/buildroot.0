From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Nov 2018 21:08:13 +0100
Subject: [Buildroot] [git commit] boot/grub2: enable support for arm and
 aarch64 targets
Message-ID: <20181202071559.BE4B7803E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=273a27804a18c5e232907d5ef6bd01957cf090d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit enables the arm-uboot, arm-efi and aarch64-efi grub2
platforms in Buildroot.

With the uboot platform, the grub2 image gets built as a u-boot image
and is loaded from u-boot through a regular "bootm". The only
requirement from the u-boot side in order to allow this is that u-boot
is built with CONFIG_API enabled. CONFIG_API seems to not be enabled
by default in most in-tree configurations, however, it seems to be
available for quite some time now. So it might be possible to use this
even on older u-boot versions. This is available only for arm
(32-bit).

With the efi platform, grub2 gets built as an EFI executable. This
allows EFI firmware to find and load it similarly as it can be done
for x86_64. Also, since u-boot v2016.05, u-boot is able to load and
boot an EFI executable, so the uboot efi platform can also be used
from u-boot in recent versions. This has been enabled (mostly) by
default for ARM u-boot. efi platform is available for both arm and
aarch64.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
[Thomas: move the BR2_USE_MMU dependency in
BR2_TARGET_GRUB2_ARCH_SUPPORTS]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/grub2/Config.in | 39 +++++++++++++++++++++++++++++++++++----
 boot/grub2/grub2.mk  | 21 +++++++++++++++++++++
 2 files changed, 56 insertions(+), 4 deletions(-)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index e33d24f62f..e45133999e 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -2,6 +2,9 @@ config BR2_TARGET_GRUB2_ARCH_SUPPORTS
 	bool
 	default y if BR2_i386
 	default y if BR2_x86_64
+	default y if BR2_arm
+	default y if BR2_aarch64
+	depends on BR2_USE_MMU
 
 config BR2_TARGET_GRUB2
 	bool "grub2"
@@ -29,12 +32,14 @@ choice
 
 config BR2_TARGET_GRUB2_I386_PC
 	bool "i386-pc"
+	depends on BR2_i386 || BR2_x86_64
 	help
 	  Select this option if the platform you're targetting is a
 	  x86 or x86-64 legacy BIOS based platform.
 
 config BR2_TARGET_GRUB2_I386_EFI
 	bool "i386-efi"
+	depends on BR2_i386 || BR2_x86_64
 	help
 	  Select this option if the platform you're targetting has a
 	  32 bits EFI BIOS. Note that some x86-64 platforms use a 32
@@ -42,14 +47,38 @@ config BR2_TARGET_GRUB2_I386_EFI
 
 config BR2_TARGET_GRUB2_X86_64_EFI
 	bool "x86-64-efi"
-	depends on BR2_ARCH_IS_64
+	depends on BR2_x86_64
 	help
 	  Select this option if the platform you're targetting has a
 	  64 bits EFI BIOS.
 
+config BR2_TARGET_GRUB2_ARM_UBOOT
+	bool "arm-uboot"
+	depends on BR2_arm
+	help
+	  Select this option if the platform you're targetting is an
+	  ARM u-boot platform, and you want to boot Grub 2 as an u-boot
+	  compatible image.
+
+config BR2_TARGET_GRUB2_ARM_EFI
+	bool "arm-efi"
+	depends on BR2_arm
+	help
+	  Select this option if the platform you're targetting is an
+	  ARM platform and you want to boot Grub 2 as an EFI
+	  application.
+
+config BR2_TARGET_GRUB2_ARM64_EFI
+	bool "arm64-efi"
+	depends on BR2_aarch64
+	help
+	  Select this option if the platform you're targetting is an
+	  Aarch64 platform and you want to boot Grub 2 as an EFI
+	  application.
+
 endchoice
 
-if BR2_TARGET_GRUB2_I386_PC
+if BR2_TARGET_GRUB2_I386_PC || BR2_TARGET_GRUB2_ARM_UBOOT
 
 config BR2_TARGET_GRUB2_BOOT_PARTITION
 	string "boot partition"
@@ -60,13 +89,15 @@ config BR2_TARGET_GRUB2_BOOT_PARTITION
 	  first disk if using a legacy partition table, or 'hd0,gpt1'
 	  if using GPT partition table.
 
-endif # BR2_TARGET_GRUB2_I386_PC
+endif # BR2_TARGET_GRUB2_I386_PC || BR2_TARGET_GRUB2_ARM_UBOOT
 
 config BR2_TARGET_GRUB2_BUILTIN_MODULES
 	string "builtin modules"
 	default "boot linux ext2 fat squash4 part_msdos part_gpt normal biosdisk" if BR2_TARGET_GRUB2_I386_PC
 	default "boot linux ext2 fat squash4 part_msdos part_gpt normal efi_gop" \
-		if BR2_TARGET_GRUB2_I386_EFI || BR2_TARGET_GRUB2_X86_64_EFI
+		if BR2_TARGET_GRUB2_I386_EFI || BR2_TARGET_GRUB2_X86_64_EFI || \
+		   BR2_TARGET_GRUB2_ARM_EFI  || BR2_TARGET_GRUB2_ARM64_EFI
+	default "linux ext2 fat part_msdos normal" if BR2_TARGET_GRUB2_ARM_UBOOT
 
 config BR2_TARGET_GRUB2_BUILTIN_CONFIG
 	string "builtin config"
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index bb678ef5de..65371f0170 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -44,6 +44,27 @@ GRUB2_PREFIX = /EFI/BOOT
 GRUB2_TUPLE = x86_64-efi
 GRUB2_TARGET = x86_64
 GRUB2_PLATFORM = efi
+else ifeq ($(BR2_TARGET_GRUB2_ARM_UBOOT),y)
+GRUB2_IMAGE = $(BINARIES_DIR)/boot-part/grub/grub.img
+GRUB2_CFG = $(BINARIES_DIR)/boot-part/grub/grub.cfg
+GRUB2_PREFIX = ($(GRUB2_BOOT_PARTITION))/boot/grub
+GRUB2_TUPLE = arm-uboot
+GRUB2_TARGET = arm
+GRUB2_PLATFORM = uboot
+else ifeq ($(BR2_TARGET_GRUB2_ARM_EFI),y)
+GRUB2_IMAGE = $(BINARIES_DIR)/efi-part/EFI/BOOT/bootarm.efi
+GRUB2_CFG = $(BINARIES_DIR)/efi-part/EFI/BOOT/grub.cfg
+GRUB2_PREFIX = /EFI/BOOT
+GRUB2_TUPLE = arm-efi
+GRUB2_TARGET = arm
+GRUB2_PLATFORM = efi
+else ifeq ($(BR2_TARGET_GRUB2_ARM64_EFI),y)
+GRUB2_IMAGE = $(BINARIES_DIR)/efi-part/EFI/BOOT/bootaa64.efi
+GRUB2_CFG = $(BINARIES_DIR)/efi-part/EFI/BOOT/grub.cfg
+GRUB2_PREFIX = /EFI/BOOT
+GRUB2_TUPLE = arm64-efi
+GRUB2_TARGET = aarch64
+GRUB2_PLATFORM = efi
 endif
 
 # Grub2 is kind of special: it considers CC, LD and so on to be the
