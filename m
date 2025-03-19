Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12A5C36000
	for <buildroot@archiver.kernel.org>; Wed, 19 Mar 2025 20:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 848B060E45;
	Wed, 19 Mar 2025 20:21:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aC1S-UkLgsHG; Wed, 19 Mar 2025 20:21:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FC0060E4C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FC0060E4C;
	Wed, 19 Mar 2025 20:21:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 99BB6D8C
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 20:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88E1460E45
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 20:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 96nRcSTehHkX for <buildroot@buildroot.org>;
 Wed, 19 Mar 2025 20:21:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81A18607D9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81A18607D9
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 20:21:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6FE578818D; Wed, 19 Mar 2025 20:21:38 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 Mar 2025 21:16:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 088808ccc74323dc78439c6980e9760b5be1dee2
X-Git-Newrev: 06dc0cc3537b0a1b1f04c63de9caed993ce737dc
X-Patchwork-Hint: ignore
Message-Id: <20250319202138.6FE578818D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot: move package options to a submenu
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=06dc0cc3537b0a1b1f04c63de9caed993ce737dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change all Kconfig entries for packages in the "Bootloaders" menu to
submenus.

Currently many bootloaders and firmwares in this menu use a 'config'
keyword and thus menuconfig presents their sub-options as a flat list in
the same menu. This is not very convenient as some have a lot of
sub-options, and in (more and more common) configurations with multiple
such packages enabled the menuconfig screen becomes very crowded. Moreover
options of 'string' type don't have a visible indentation when their value
exceeds a few characters, thus making it visually hard to grasp which
package the various options belong to.

Non-bootloader packages having suboptions usually use a 'menuconfig'
keywork to have sub-options in a submenu. Do the same for packages in the
"Bootloaders" menu which have more than one sub-option.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/afboot-stm32/Config.in         | 2 +-
 boot/arm-trusted-firmware/Config.in | 2 +-
 boot/at91bootstrap3/Config.in       | 2 +-
 boot/barebox/Config.in              | 2 +-
 boot/boot-wrapper-aarch64/Config.in | 2 +-
 boot/grub2/Config.in                | 2 +-
 boot/mxs-bootlets/Config.in         | 2 +-
 boot/opensbi/Config.in              | 2 +-
 boot/optee-os/Config.in             | 2 +-
 boot/syslinux/Config.in             | 2 +-
 boot/ti-k3-r5-loader/Config.in      | 2 +-
 boot/uboot/Config.in                | 2 +-
 boot/xilinx-embeddedsw/Config.in    | 2 +-
 boot/xilinx-prebuilt/Config.in      | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/boot/afboot-stm32/Config.in b/boot/afboot-stm32/Config.in
index 23372705ad..23d6eda5d4 100644
--- a/boot/afboot-stm32/Config.in
+++ b/boot/afboot-stm32/Config.in
@@ -1,4 +1,4 @@
-config BR2_TARGET_AFBOOT_STM32
+menuconfig BR2_TARGET_AFBOOT_STM32
 	bool "afboot-stm32"
 	depends on BR2_arm
 	help
diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index becc3f69c3..72684e5974 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -1,4 +1,4 @@
-config BR2_TARGET_ARM_TRUSTED_FIRMWARE
+menuconfig BR2_TARGET_ARM_TRUSTED_FIRMWARE
 	bool "ARM Trusted Firmware (ATF)"
 	depends on (BR2_ARM_CPU_ARMV8A || BR2_ARM_CPU_ARMV7A)
 	help
diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index b3e18fce7c..35bdb28162 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -1,4 +1,4 @@
-config BR2_TARGET_AT91BOOTSTRAP3
+menuconfig BR2_TARGET_AT91BOOTSTRAP3
 	bool "AT91 Bootstrap 3+"
 	depends on BR2_arm926t || BR2_cortex_a5 || BR2_cortex_a7
 	help
diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 0bd3386795..c3cb0b3332 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -1,4 +1,4 @@
-config BR2_TARGET_BAREBOX
+menuconfig BR2_TARGET_BAREBOX
 	bool "Barebox"
 	help
 	  The Barebox bootloader, formerly known as U-Boot v2.
diff --git a/boot/boot-wrapper-aarch64/Config.in b/boot/boot-wrapper-aarch64/Config.in
index cf7389282f..dfefb7a9fd 100644
--- a/boot/boot-wrapper-aarch64/Config.in
+++ b/boot/boot-wrapper-aarch64/Config.in
@@ -2,7 +2,7 @@ comment "boot-wrapper-aarch64 needs a Linux kernel to be built"
 	depends on BR2_aarch64
 	depends on !BR2_LINUX_KERNEL
 
-config BR2_TARGET_BOOT_WRAPPER_AARCH64
+menuconfig BR2_TARGET_BOOT_WRAPPER_AARCH64
 	bool "boot-wrapper-aarch64"
 	depends on BR2_aarch64
 	depends on BR2_LINUX_KERNEL
diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index e1f2fc105e..ecee9ef74c 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -7,7 +7,7 @@ config BR2_TARGET_GRUB2_ARCH_SUPPORTS
 	default y if BR2_RISCV_64
 	depends on BR2_USE_MMU
 
-config BR2_TARGET_GRUB2
+menuconfig BR2_TARGET_GRUB2
 	bool "grub2"
 	depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS
 	depends on BR2_USE_WCHAR
diff --git a/boot/mxs-bootlets/Config.in b/boot/mxs-bootlets/Config.in
index 8f9334b610..00819c5ad6 100644
--- a/boot/mxs-bootlets/Config.in
+++ b/boot/mxs-bootlets/Config.in
@@ -1,4 +1,4 @@
-config BR2_TARGET_MXS_BOOTLETS
+menuconfig BR2_TARGET_MXS_BOOTLETS
 	bool "mxs-bootlets"
 	depends on BR2_arm
 	depends on BR2_TARGET_BAREBOX || BR2_LINUX_KERNEL || \
diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index 98d6103ed6..37f06cd99d 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -1,4 +1,4 @@
-config BR2_TARGET_OPENSBI
+menuconfig BR2_TARGET_OPENSBI
 	bool "opensbi"
 	depends on BR2_riscv
 	help
diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 6c4afccc7a..563f192b18 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -1,4 +1,4 @@
-config BR2_TARGET_OPTEE_OS
+menuconfig BR2_TARGET_OPTEE_OS
 	bool "optee_os"
 	depends on BR2_ARM_CPU_ARMV8A || BR2_ARM_CPU_ARMV7A || BR2_RISCV_64
 	help
diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index c95dac1804..2891eae013 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -1,4 +1,4 @@
-config BR2_TARGET_SYSLINUX
+menuconfig BR2_TARGET_SYSLINUX
 	bool "syslinux"
 	depends on BR2_i386 || BR2_x86_64
 	# Make sure at least one of the flavors is installed
diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index fe429bb8b4..b4fb46e55b 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -1,4 +1,4 @@
-config BR2_TARGET_TI_K3_R5_LOADER
+menuconfig BR2_TARGET_TI_K3_R5_LOADER
 	bool "ti-k3-r5-loader"
 	depends on BR2_aarch64
 	depends on BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_SUPPORTS
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 10098ed227..6739d53cb8 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -1,4 +1,4 @@
-config BR2_TARGET_UBOOT
+menuconfig BR2_TARGET_UBOOT
 	bool "U-Boot"
 	help
 	  Build "Das U-Boot" Boot Monitor
diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index 007b24e668..a27253d594 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -1,7 +1,7 @@
 comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"
 
-config BR2_TARGET_XILINX_EMBEDDEDSW
+menuconfig BR2_TARGET_XILINX_EMBEDDEDSW
 	bool "xilinx-embeddedsw"
 	depends on BR2_aarch64
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index 4e0850f3ce..b95df5cbf4 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -1,4 +1,4 @@
-config BR2_TARGET_XILINX_PREBUILT
+menuconfig BR2_TARGET_XILINX_PREBUILT
 	bool "xilinx-prebuilt"
 	depends on BR2_aarch64
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
