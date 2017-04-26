From: Erico Nunes <nunes.erico@gmail.com>
Date: Wed, 26 Apr 2017 23:39:49 +0200
Subject: [Buildroot] [PATCH v2 4/8] grub2: enable support for arm and
	aarch64 targets
In-Reply-To: <20170426213953.14904-1-nunes.erico@gmail.com>
References: <20170426213953.14904-1-nunes.erico@gmail.com>
Message-ID: <20170426213953.14904-5-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit enables the arm-uboot, arm-efi and aarch64-efi Grub 2
platforms in Buildroot.

As a uboot platform, Grub 2 image gets built as a u-boot image (i.e.
u-boot mkimage) and is loaded from u-boot through a regular "bootm". The
only requirement from u-boot side in order to allow this is that u-boot
is built with CONFIG_API enabled. CONFIG_API seems to not be enabled by
default in most in-tree configurations, however, it seems to be
available for quite some time now. So it might be possible to use this
even on older u-boot versions. This is available only for arm (32-bit).

As an efi platform, Grub 2 gets built as an EFI executable. This allows
EFI firmware to find and load it similarly as it can be done for x86_64.
Also, since u-boot v2016.05, u-boot is able to load and boot an EFI
executable, so the Grub 2 efi platform can also be used from u-boot in
recent versions. This has been enabled (mostly) by default for ARM
u-boot.
efi platform is available for both arm and aarch64.

These targets have been tested in the following environments:

arm-uboot: qemu arm vexpress and BeagleBone
arm-efi: BeagleBone
aarch64-efi: qemu aarch64 virt and Odroid-C2

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
Changes v1 -> v2:
  - Moved a small fix from this patch to the previous one (pointed out
    by Arnout Vandecappelle)
---
 boot/grub2/Config.in | 40 +++++++++++++++++++++++++++++++++++-----
 boot/grub2/grub2.mk  | 21 +++++++++++++++++++++
 2 files changed, 56 insertions(+), 5 deletions(-)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index eede814..498d5cd 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -1,6 +1,6 @@
 config BR2_TARGET_GRUB2
 	bool "grub2"
-	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_aarch64
 	depends on BR2_USE_WCHAR
 	help
 	  GNU GRUB is a Multiboot boot loader. It was derived from
@@ -120,12 +120,14 @@ choice
 
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
@@ -133,14 +135,38 @@ config BR2_TARGET_GRUB2_I386_EFI
 
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
@@ -151,13 +177,17 @@ config BR2_TARGET_GRUB2_BOOT_PARTITION
 	  first disk if using a legacy partition table, or 'hd0,gpt1'
 	  if using GPT partition table.
 
-endif # BR2_TARGET_GRUB2_I386_PC
+endif # BR2_TARGET_GRUB2_I386_PC || BR2_TARGET_GRUB2_ARM_UBOOT
 
 config BR2_TARGET_GRUB2_BUILTIN_MODULES
 	string "builtin modules"
 	default "boot linux ext2 fat squash4 part_msdos part_gpt normal biosdisk" if BR2_TARGET_GRUB2_I386_PC
 	default "boot linux ext2 fat squash4 part_msdos part_gpt normal efi_gop" \
-		if BR2_TARGET_GRUB2_I386_EFI || BR2_TARGET_GRUB2_X86_64_EFI
+		if BR2_TARGET_GRUB2_I386_EFI || \
+		BR2_TARGET_GRUB2_X86_64_EFI || \
+		BR2_TARGET_GRUB2_ARM_EFI || \\
+		BR2_TARGET_GRUB2_ARM64_EFI
+	default "linux ext2 fat part_msdos normal" if BR2_TARGET_GRUB2_ARM_UBOOT
 
 config BR2_TARGET_GRUB2_BUILTIN_CONFIG
 	string "builtin config"
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index f0bd2ee..7bbdb40 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -38,6 +38,27 @@ GRUB2_PREFIX = /EFI/BOOT
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
-- 
2.9.3
