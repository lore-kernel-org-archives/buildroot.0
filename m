Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF31BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:37:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8535360F6C
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8535360F6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E81380F81;
	Mon, 27 Sep 2021 19:37:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xvm6C6alTzkr; Mon, 27 Sep 2021 19:37:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F95281008;
	Mon, 27 Sep 2021 19:37:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE3E21BF379
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D8F981008
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:37:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VPv3QkWKEXgK for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 19:37:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 415AB80F81
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 19:37:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 797E78D3B5; Mon, 27 Sep 2021 19:35:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 21:36:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3efb5e31fc05705ce3c46b1f0ec031978a5cfab6
X-Git-Newrev: b68810e70cbda70ec4e1a267a7d1d3e935c5718b
X-Patchwork-Hint: ignore
Message-Id: <20210927193502.797E78D3B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2: add support to build multiple
 Grub2 configurations in the same build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b68810e70cbda70ec4e1a267a7d1d3e935c5718b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When Grub2 is build it is configured only for one boot set-up, BIOS Legacy,
EFI 32 bit or EFI 64 bit. It can not deal with several boot set-up on the
same image.

This patch allows to build Grub2 for different configurations simultaneously.
To cover Grub2 configuration of legacy BIOS platforms (32-bit), 32-bit EFI
BIOS and 64-bit EFI BIOS in the same build, multi-build system felt much more
reasonable to just extend the grub2 package into 3 packages.

We can no longer use autotools-package as a consequence of this multi-build, and
we have to resort to generic-package and a partial duplication of
the autotools-infra. Grub2 was already using custom option like --prefix or
--exec-prefix so this won't add much more weirdness.

We use a GRUB2_TUPLES list to describe all the configurations selected.
For each boot case described in the GRUB2_TUPLES list, it configures and
builds Grub2 in a separate folder named build-$(tuple).
We use a foreach loop to make actions on each tuple selected.

We have to separate the BR2_TARGET_GRUB2_BUILTIN_MODULES and the
BR2_TARGET_GRUB2_BUILTIN_CONFIG for each BIOS or EFI boot cases.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[yann.morin.1998@free.fr:
  - keep sub-options properly indented
  - fix check-package
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                         |  24 +++++
 boot/grub2/Config.in                     |  51 +++++++--
 boot/grub2/grub2.mk                      | 175 ++++++++++++++++++-------------
 support/testing/tests/fs/test_iso9660.py |   6 +-
 4 files changed, 168 insertions(+), 88 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 35a11f4dc6..7eebe85298 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -168,6 +168,30 @@ config BR2_KERNEL_HEADERS_5_12
 
 comment "Legacy options removed in 2021.08"
 
+config BR2_TARGET_GRUB2_BUILTIN_MODULES
+	string "the grub2 builtin modules has been renamed"
+	help
+	  This option has been split to separate the builtin modules
+	  between BR2_TARGET_GRUB2_BUILTIN_MODULES_PC and
+	  BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI.
+
+config BR2_TARGET_GRUB2_BUILTIN_MODULES_WRAP
+	bool
+	default y if BR2_TARGET_GRUB2_BUILTIN_MODULES != ""
+	select BR2_LEGACY
+
+config BR2_TARGET_GRUB2_BUILTIN_CONFIG
+	string "the grub2 builtin configuration has been renamed"
+	help
+	  This option has been split to separate the builtin
+	  configuration between BR2_TARGET_GRUB2_BUILTIN_CONFIG_PC and
+	  BR2_TARGET_GRUB2_BUILTIN_CONFIG_EFI.
+
+config BR2_TARGET_GRUB2_BUILTIN_CONFIG_WRAP
+	bool
+	default y if BR2_TARGET_GRUB2_BUILTIN_CONFIG != ""
+	select BR2_LEGACY
+
 config BR2_PACKAGE_LIBMCRYPT
 	bool "libmcrypt package was removed"
 	select BR2_LEGACY
diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index e45133999e..7bbe697932 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -10,6 +10,13 @@ config BR2_TARGET_GRUB2
 	bool "grub2"
 	depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS
 	depends on BR2_USE_WCHAR
+	select BR2_TARGET_GRUB2_I386_PC if \
+		!BR2_TARGET_GRUB2_HAS_PTF && \
+		(BR2_i386 || BR2_x86_64)
+	select BR2_TARGET_GRUB2_ARM_UBOOT if \
+		!BR2_TARGET_GRUB2_HAS_PTF && \
+		BR2_arm
+	select BR2_TARGET_GRUB2_ARM64_EFI if BR2_aarch64
 	help
 	  GNU GRUB is a Multiboot boot loader. It was derived from
 	  GRUB, the GRand Unified Bootloader, which was originally
@@ -27,8 +34,8 @@ config BR2_TARGET_GRUB2
 
 if BR2_TARGET_GRUB2
 
-choice
-	prompt "Platform"
+config BR2_TARGET_GRUB2_HAS_PTF
+	bool
 
 config BR2_TARGET_GRUB2_I386_PC
 	bool "i386-pc"
@@ -40,6 +47,7 @@ config BR2_TARGET_GRUB2_I386_PC
 config BR2_TARGET_GRUB2_I386_EFI
 	bool "i386-efi"
 	depends on BR2_i386 || BR2_x86_64
+	select BR2_TARGET_GRUB2_HAS_PTF
 	help
 	  Select this option if the platform you're targetting has a
 	  32 bits EFI BIOS. Note that some x86-64 platforms use a 32
@@ -48,6 +56,7 @@ config BR2_TARGET_GRUB2_I386_EFI
 config BR2_TARGET_GRUB2_X86_64_EFI
 	bool "x86-64-efi"
 	depends on BR2_x86_64
+	select BR2_TARGET_GRUB2_HAS_PTF
 	help
 	  Select this option if the platform you're targetting has a
 	  64 bits EFI BIOS.
@@ -63,6 +72,7 @@ config BR2_TARGET_GRUB2_ARM_UBOOT
 config BR2_TARGET_GRUB2_ARM_EFI
 	bool "arm-efi"
 	depends on BR2_arm
+	select BR2_TARGET_GRUB2_HAS_PTF
 	help
 	  Select this option if the platform you're targetting is an
 	  ARM platform and you want to boot Grub 2 as an EFI
@@ -76,10 +86,10 @@ config BR2_TARGET_GRUB2_ARM64_EFI
 	  Aarch64 platform and you want to boot Grub 2 as an EFI
 	  application.
 
-endchoice
-
 if BR2_TARGET_GRUB2_I386_PC || BR2_TARGET_GRUB2_ARM_UBOOT
 
+comment "Options for the x86 legacy BIOS or ARM U-Boot support"
+
 config BR2_TARGET_GRUB2_BOOT_PARTITION
 	string "boot partition"
 	default "hd0,msdos1"
@@ -89,24 +99,43 @@ config BR2_TARGET_GRUB2_BOOT_PARTITION
 	  first disk if using a legacy partition table, or 'hd0,gpt1'
 	  if using GPT partition table.
 
-endif # BR2_TARGET_GRUB2_I386_PC || BR2_TARGET_GRUB2_ARM_UBOOT
-
-config BR2_TARGET_GRUB2_BUILTIN_MODULES
+config BR2_TARGET_GRUB2_BUILTIN_MODULES_PC
 	string "builtin modules"
+	default BR2_TARGET_GRUB2_BUILTIN_MODULES if BR2_TARGET_GRUB2_BUILTIN_MODULES != "" # legacy
 	default "boot linux ext2 fat squash4 part_msdos part_gpt normal biosdisk" if BR2_TARGET_GRUB2_I386_PC
-	default "boot linux ext2 fat squash4 part_msdos part_gpt normal efi_gop" \
-		if BR2_TARGET_GRUB2_I386_EFI || BR2_TARGET_GRUB2_X86_64_EFI || \
-		   BR2_TARGET_GRUB2_ARM_EFI  || BR2_TARGET_GRUB2_ARM64_EFI
 	default "linux ext2 fat part_msdos normal" if BR2_TARGET_GRUB2_ARM_UBOOT
 
-config BR2_TARGET_GRUB2_BUILTIN_CONFIG
+config BR2_TARGET_GRUB2_BUILTIN_CONFIG_PC
+	string "builtin config"
+	default BR2_TARGET_GRUB2_BUILTIN_CONFIG if BR2_TARGET_GRUB2_BUILTIN_CONFIG != "" # legacy
+	help
+	  Path to a Grub 2 configuration file that will be embedded
+	  into the Grub image itself. This allows to set the root
+	  device and other configuration parameters, but however menu
+	  entries cannot be described in this embedded configuration.
+
+endif # BR2_TARGET_GRUB2_I386_PC || BR2_TARGET_GRUB2_ARM_UBOOT
+
+if BR2_TARGET_GRUB2_I386_EFI || BR2_TARGET_GRUB2_X86_64_EFI || \
+	BR2_TARGET_GRUB2_ARM_EFI  || BR2_TARGET_GRUB2_ARM64_EFI
+
+comment "Options for the EFI BIOS or ARM EFI support"
+
+config BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI
+	string "builtin modules"
+	default BR2_TARGET_GRUB2_BUILTIN_MODULES if BR2_TARGET_GRUB2_BUILTIN_MODULES != "" # legacy
+	default "boot linux ext2 fat squash4 part_msdos part_gpt normal efi_gop"
+
+config BR2_TARGET_GRUB2_BUILTIN_CONFIG_EFI
 	string "builtin config"
+	default BR2_TARGET_GRUB2_BUILTIN_CONFIG if BR2_TARGET_GRUB2_BUILTIN_CONFIG != "" # legacy
 	help
 	  Path to a Grub 2 configuration file that will be embedded
 	  into the Grub image itself. This allows to set the root
 	  device and other configuration parameters, but however menu
 	  entries cannot be described in this embedded configuration.
 
+endif
 config BR2_TARGET_GRUB2_INSTALL_TOOLS
 	bool "install tools"
 	help
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index ad2edf17aa..e01ebb2edb 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -57,53 +57,65 @@ GRUB2_INSTALL_TARGET = NO
 endif
 GRUB2_CPE_ID_VENDOR = gnu
 
-GRUB2_BUILTIN_MODULES = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES))
-GRUB2_BUILTIN_CONFIG = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_CONFIG))
+GRUB2_BUILTIN_MODULES_PC = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_PC))
+GRUB2_BUILTIN_MODULES_EFI = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI))
+GRUB2_BUILTIN_CONFIG_PC = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_CONFIG_PC))
+GRUB2_BUILTIN_CONFIG_EFI = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_CONFIG_EFI))
 GRUB2_BOOT_PARTITION = $(call qstrip,$(BR2_TARGET_GRUB2_BOOT_PARTITION))
 
-ifeq ($(BR2_TARGET_GRUB2_I386_PC),y)
-GRUB2_IMAGE = $(BINARIES_DIR)/grub.img
-GRUB2_CFG = $(TARGET_DIR)/boot/grub/grub.cfg
-GRUB2_PREFIX = ($(GRUB2_BOOT_PARTITION))/boot/grub
-GRUB2_TUPLE = i386-pc
-GRUB2_TARGET = i386
-GRUB2_PLATFORM = pc
-else ifeq ($(BR2_TARGET_GRUB2_I386_EFI),y)
-GRUB2_IMAGE = $(BINARIES_DIR)/efi-part/EFI/BOOT/bootia32.efi
-GRUB2_CFG = $(BINARIES_DIR)/efi-part/EFI/BOOT/grub.cfg
-GRUB2_PREFIX = /EFI/BOOT
-GRUB2_TUPLE = i386-efi
-GRUB2_TARGET = i386
-GRUB2_PLATFORM = efi
-else ifeq ($(BR2_TARGET_GRUB2_X86_64_EFI),y)
-GRUB2_IMAGE = $(BINARIES_DIR)/efi-part/EFI/BOOT/bootx64.efi
-GRUB2_CFG = $(BINARIES_DIR)/efi-part/EFI/BOOT/grub.cfg
-GRUB2_PREFIX = /EFI/BOOT
-GRUB2_TUPLE = x86_64-efi
-GRUB2_TARGET = x86_64
-GRUB2_PLATFORM = efi
-else ifeq ($(BR2_TARGET_GRUB2_ARM_UBOOT),y)
-GRUB2_IMAGE = $(BINARIES_DIR)/boot-part/grub/grub.img
-GRUB2_CFG = $(BINARIES_DIR)/boot-part/grub/grub.cfg
-GRUB2_PREFIX = ($(GRUB2_BOOT_PARTITION))/boot/grub
-GRUB2_TUPLE = arm-uboot
-GRUB2_TARGET = arm
-GRUB2_PLATFORM = uboot
-else ifeq ($(BR2_TARGET_GRUB2_ARM_EFI),y)
-GRUB2_IMAGE = $(BINARIES_DIR)/efi-part/EFI/BOOT/bootarm.efi
-GRUB2_CFG = $(BINARIES_DIR)/efi-part/EFI/BOOT/grub.cfg
-GRUB2_PREFIX = /EFI/BOOT
-GRUB2_TUPLE = arm-efi
-GRUB2_TARGET = arm
-GRUB2_PLATFORM = efi
-else ifeq ($(BR2_TARGET_GRUB2_ARM64_EFI),y)
-GRUB2_IMAGE = $(BINARIES_DIR)/efi-part/EFI/BOOT/bootaa64.efi
-GRUB2_CFG = $(BINARIES_DIR)/efi-part/EFI/BOOT/grub.cfg
-GRUB2_PREFIX = /EFI/BOOT
-GRUB2_TUPLE = arm64-efi
-GRUB2_TARGET = aarch64
-GRUB2_PLATFORM = efi
-endif
+GRUB2_IMAGE_i386-pc = $(BINARIES_DIR)/grub.img
+GRUB2_CFG_i386-pc = $(TARGET_DIR)/boot/grub/grub.cfg
+GRUB2_PREFIX_i386-pc = ($(GRUB2_BOOT_PARTITION))/boot/grub
+GRUB2_TARGET_i386-pc = i386
+GRUB2_PLATFORM_i386-pc = pc
+GRUB2_BUILTIN_CONFIG_i386-pc = $(GRUB2_BUILTIN_CONFIG_PC)
+GRUB2_BUILTIN_MODULES_i386-pc = $(GRUB2_BUILTIN_MODULES_PC)
+GRUB2_TUPLES-$(BR2_TARGET_GRUB2_I386_PC) += i386-pc
+
+GRUB2_IMAGE_i386-efi = $(BINARIES_DIR)/efi-part/EFI/BOOT/bootia32.efi
+GRUB2_CFG_i386-efi = $(BINARIES_DIR)/efi-part/EFI/BOOT/grub.cfg
+GRUB2_PREFIX_i386-efi = /EFI/BOOT
+GRUB2_TARGET_i386-efi = i386
+GRUB2_PLATFORM_i386-efi = efi
+GRUB2_BUILTIN_CONFIG_i386-efi = $(GRUB2_BUILTIN_CONFIG_EFI)
+GRUB2_BUILTIN_MODULES_i386-efi = $(GRUB2_BUILTIN_MODULES_EFI)
+GRUB2_TUPLES-$(BR2_TARGET_GRUB2_I386_EFI) += i386-efi
+
+GRUB2_IMAGE_x86_64-efi = $(BINARIES_DIR)/efi-part/EFI/BOOT/bootx64.efi
+GRUB2_CFG_x86_64-efi = $(BINARIES_DIR)/efi-part/EFI/BOOT/grub.cfg
+GRUB2_PREFIX_x86_64-efi = /EFI/BOOT
+GRUB2_TARGET_x86_64-efi = x86_64
+GRUB2_PLATFORM_x86_64-efi = efi
+GRUB2_BUILTIN_CONFIG_x86_64-efi = $(GRUB2_BUILTIN_CONFIG_EFI)
+GRUB2_BUILTIN_MODULES_x86_64-efi = $(GRUB2_BUILTIN_MODULES_EFI)
+GRUB2_TUPLES-$(BR2_TARGET_GRUB2_X86_64_EFI) += x86_64-efi
+
+GRUB2_IMAGE_arm-uboot = $(BINARIES_DIR)/boot-part/grub/grub.img
+GRUB2_CFG_arm-uboot = $(BINARIES_DIR)/boot-part/grub/grub.cfg
+GRUB2_PREFIX_arm-uboot = ($(GRUB2_BOOT_PARTITION))/boot/grub
+GRUB2_TARGET_arm-uboot = arm
+GRUB2_PLATFORM_arm-uboot = uboot
+GRUB2_BUILTIN_CONFIG_arm-uboot = $(GRUB2_BUILTIN_CONFIG_PC)
+GRUB2_BUILTIN_MODULES_arm-uboot = $(GRUB2_BUILTIN_MODULES_PC)
+GRUB2_TUPLES-$(BR2_TARGET_GRUB2_ARM_UBOOT) += arm-uboot
+
+GRUB2_IMAGE_arm-efi = $(BINARIES_DIR)/efi-part/EFI/BOOT/bootarm.efi
+GRUB2_CFG_arm-efi = $(BINARIES_DIR)/efi-part/EFI/BOOT/grub.cfg
+GRUB2_PREFIX_arm-efi = /EFI/BOOT
+GRUB2_TARGET_arm-efi = arm
+GRUB2_PLATFORM_arm-efi = efi
+GRUB2_BUILTIN_CONFIG_arm-efi = $(GRUB2_BUILTIN_CONFIG_EFI)
+GRUB2_BUILTIN_MODULES_arm-efi = $(GRUB2_BUILTIN_MODULES_EFI)
+GRUB2_TUPLES-$(BR2_TARGET_GRUB2_ARM_EFI) += arm-efi
+
+GRUB2_IMAGE_arm64-efi = $(BINARIES_DIR)/efi-part/EFI/BOOT/bootaa64.efi
+GRUB2_CFG_arm64-efi = $(BINARIES_DIR)/efi-part/EFI/BOOT/grub.cfg
+GRUB2_PREFIX_arm64-efi = /EFI/BOOT
+GRUB2_TARGET_arm64-efi = aarch64
+GRUB2_PLATFORM_arm64-efi = efi
+GRUB2_BUILTIN_CONFIG_arm64-efi = $(GRUB2_BUILTIN_CONFIG_EFI)
+GRUB2_BUILTIN_MODULES_arm64-efi = $(GRUB2_BUILTIN_MODULES_EFI)
+GRUB2_TUPLES-$(BR2_TARGET_GRUB2_ARM64_EFI) += arm64-efi
 
 # Grub2 is kind of special: it considers CC, LD and so on to be the
 # tools to build the host programs and uses TARGET_CC, TARGET_CFLAGS,
@@ -127,18 +139,6 @@ GRUB2_CONF_ENV = \
 	TARGET_OBJCOPY="$(TARGET_OBJCOPY)" \
 	TARGET_STRIP="$(TARGET_CROSS)strip"
 
-GRUB2_CONF_OPTS = \
-	--target=$(GRUB2_TARGET) \
-	--with-platform=$(GRUB2_PLATFORM) \
-	--prefix=/ \
-	--exec-prefix=/ \
-	--disable-grub-mkfont \
-	--enable-efiemu=no \
-	ac_cv_lib_lzma_lzma_code=no \
-	--enable-device-mapper=no \
-	--enable-libzfs=no \
-	--disable-werror
-
 HOST_GRUB2_CONF_OPTS = \
 	--disable-grub-mkfont \
 	--enable-efiemu=no \
@@ -147,26 +147,53 @@ HOST_GRUB2_CONF_OPTS = \
 	--enable-libzfs=no \
 	--disable-werror
 
-ifeq ($(BR2_TARGET_GRUB2_I386_PC),y)
-define GRUB2_IMAGE_INSTALL_ELTORITO
-	cat $(HOST_DIR)/lib/grub/$(GRUB2_TUPLE)/cdboot.img $(GRUB2_IMAGE) > \
-		$(BINARIES_DIR)/grub-eltorito.img
+define GRUB2_CONFIGURE_CMDS
+	$(foreach tuple, $(GRUB2_TUPLES-y), \
+		mkdir -p $(@D)/build-$(tuple) ; \
+		cd $(@D)/build-$(tuple) ; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		$(GRUB2_CONF_ENV) \
+		../configure \
+			--target=$(GRUB2_TARGET_$(tuple)) \
+			--with-platform=$(GRUB2_PLATFORM_$(tuple)) \
+			--host=$(GNU_TARGET_NAME) \
+			--build=$(GNU_HOST_NAME) \
+			--prefix=/ \
+			--exec-prefix=/ \
+			--disable-grub-mkfont \
+			--enable-efiemu=no \
+			ac_cv_lib_lzma_lzma_code=no \
+			--enable-device-mapper=no \
+			--enable-libzfs=no \
+			--disable-werror
+	)
+endef
+
+define GRUB2_BUILD_CMDS
+	$(foreach tuple, $(GRUB2_TUPLES-y), \
+		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/build-$(tuple)
+	)
 endef
-endif
 
 define GRUB2_INSTALL_IMAGES_CMDS
-	mkdir -p $(dir $(GRUB2_IMAGE))
-	$(HOST_DIR)/usr/bin/grub-mkimage \
-		-d $(@D)/grub-core/ \
-		-O $(GRUB2_TUPLE) \
-		-o $(GRUB2_IMAGE) \
-		-p "$(GRUB2_PREFIX)" \
-		$(if $(GRUB2_BUILTIN_CONFIG),-c $(GRUB2_BUILTIN_CONFIG)) \
-		$(GRUB2_BUILTIN_MODULES)
-	mkdir -p $(dir $(GRUB2_CFG))
-	$(INSTALL) -D -m 0644 boot/grub2/grub.cfg $(GRUB2_CFG)
-	$(GRUB2_IMAGE_INSTALL_ELTORITO)
+	$(foreach tuple, $(GRUB2_TUPLES-y), \
+		mkdir -p $(dir $(GRUB2_IMAGE_$(tuple))) ; \
+		$(HOST_DIR)/usr/bin/grub-mkimage \
+			-d $(@D)/build-$(tuple)/grub-core/ \
+			-O $(tuple) \
+			-o $(GRUB2_IMAGE_$(tuple)) \
+			-p "$(GRUB2_PREFIX_$(tuple))" \
+			$(if $(GRUB2_BUILTIN_CONFIG_$(tuple)), \
+				-c $(GRUB2_BUILTIN_CONFIG_$(tuple))) \
+			$(GRUB2_BUILTIN_MODULES_$(tuple)) ; \
+		$(INSTALL) -D -m 0644 boot/grub2/grub.cfg $(GRUB2_CFG_$(tuple)) ; \
+		$(if $(findstring $(GRUB2_PLATFORM_$(tuple)), pc), \
+			cat $(HOST_DIR)/lib/grub/$(tuple)/cdboot.img $(GRUB2_IMAGE_$(tuple)) > \
+				$(BINARIES_DIR)/grub-eltorito.img ; \
+		) \
+	)
 endef
 
-$(eval $(autotools-package))
+$(eval $(generic-package))
 $(eval $(host-autotools-package))
diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
index 412430318b..b294d0ba0c 100644
--- a/support/testing/tests/fs/test_iso9660.py
+++ b/support/testing/tests/fs/test_iso9660.py
@@ -54,7 +54,7 @@ class TestIso9660Grub2External(infra.basetest.BRTest):
         # BR2_TARGET_ROOTFS_ISO9660_INITRD is not set
         BR2_TARGET_GRUB2=y
         BR2_TARGET_GRUB2_BOOT_PARTITION="cd"
-        BR2_TARGET_GRUB2_BUILTIN_MODULES="boot linux ext2 fat part_msdos part_gpt normal biosdisk iso9660"
+        BR2_TARGET_GRUB2_BUILTIN_MODULES_PC="boot linux ext2 fat part_msdos part_gpt normal biosdisk iso9660"
         BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
         """.format(infra.filepath("conf/grub2.cfg"))
 
@@ -75,7 +75,7 @@ class TestIso9660Grub2ExternalCompress(infra.basetest.BRTest):
         BR2_TARGET_ROOTFS_ISO9660_TRANSPARENT_COMPRESSION=y
         BR2_TARGET_GRUB2=y
         BR2_TARGET_GRUB2_BOOT_PARTITION="cd"
-        BR2_TARGET_GRUB2_BUILTIN_MODULES="boot linux ext2 fat part_msdos part_gpt normal biosdisk iso9660"
+        BR2_TARGET_GRUB2_BUILTIN_MODULES_PC="boot linux ext2 fat part_msdos part_gpt normal biosdisk iso9660"
         BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
         """.format(infra.filepath("conf/grub2.cfg"))
 
@@ -95,7 +95,7 @@ class TestIso9660Grub2Internal(infra.basetest.BRTest):
         BR2_TARGET_ROOTFS_ISO9660_INITRD=y
         BR2_TARGET_GRUB2=y
         BR2_TARGET_GRUB2_BOOT_PARTITION="cd"
-        BR2_TARGET_GRUB2_BUILTIN_MODULES="boot linux ext2 fat part_msdos part_gpt normal biosdisk iso9660"
+        BR2_TARGET_GRUB2_BUILTIN_MODULES_PC="boot linux ext2 fat part_msdos part_gpt normal biosdisk iso9660"
         BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
         """.format(infra.filepath("conf/grub2.cfg"))
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
