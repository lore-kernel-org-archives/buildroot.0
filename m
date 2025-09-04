Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F968CA101C
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16FA340451;
	Thu,  4 Sep 2025 16:34:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I1XuVS7p8gz5; Thu,  4 Sep 2025 16:34:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C3604056A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C3604056A;
	Thu,  4 Sep 2025 16:34:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3474E106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27E444008C
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYQjad_eMaJe for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:33:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B44164005E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B44164005E
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B276487EEF; Thu,  4 Sep 2025 16:33:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 14:11:29 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 6feab5ce60ec2424a35b67ad7553a255cbfd95f2
X-Git-Newrev: 09b89e98369cc28ee65a2c16d47c3b87196d3584
X-Patchwork-Hint: ignore
Message-Id: <20250904163335.B276487EEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x]
 configs/sipeed_licheepi_zero: update Linux, U-Boot to fix build
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=09b89e98369cc28ee65a2c16d47c3b87196d3584
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Since Buildroot commit [1] dc0f7215c6 "package/gcc: switch to 13.x as
default", sipeed_licheepi_zero_defconfig fails when building the Linux
kernel with the error message:

    drivers/ata/libahci.c: In function 'ahci_led_store':
    ./include/linux/compiler.h:350:45: error: call to '__compiletime_assert_1138' declared with attribute error: BUILD_BUG_ON failed: sizeof(_s) > sizeof(long)
      350 |         _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)

This issue is fixed by upstream Kernel commit [2].

This commit fixes this issue by updating the Linux Kernel from v5.3.5
(which is not a LTS series) to v6.12.43 (which is a LTS series
including the fixes). With this update,
BR2_LINUX_KERNEL_INTREE_DTS_NAME is updated accordingly to follow the
new DTS organization.

This commit also updates U-Boot from 2022.01 to 2025.07. This new
version now requires BR2_TARGET_UBOOT_NEEDS_GNUTLS=y.

While at it, this commit also switches to a stable glibc Bootlin
external toolchain, to follow the new guidelines from [3].

Finally, this commit adds BR2_DOWNLOAD_FORCE_CHECK_HASHES=y and the
corresponding hash files. The .checkpackageignore is also updated to
reflect that change.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771001

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/dc0f7215c604e845009e03784a221332867bf35a
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=f07788079f515ca4a681c5f595bdad19cfbd7b1d
[3] https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Cc: Michel Stempin <michel.stempin@wanadoo.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit db951a4c712930c2fde893d2d56ee5e3f9318911)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .checkpackageignore                                 |  1 -
 board/sipeed/licheepi_zero/patches/linux/linux.hash |  2 ++
 board/sipeed/licheepi_zero/patches/uboot/uboot.hash |  2 ++
 configs/sipeed_licheepi_zero_defconfig              | 13 +++++++++----
 4 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index d450af5312..bb1a305b30 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -176,7 +176,6 @@ configs/s6lx9_microboard_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_lichee_rv_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_lichee_rv_dock_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_licheepi_nano_defconfig lib_defconfig.ForceCheckHash
-configs/sipeed_licheepi_zero_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_maix_bit_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_maix_bit_sdcard_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_maix_dock_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/sipeed/licheepi_zero/patches/linux/linux.hash b/board/sipeed/licheepi_zero/patches/linux/linux.hash
new file mode 100644
index 0000000000..216d9b9d39
--- /dev/null
+++ b/board/sipeed/licheepi_zero/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  0fcbbbbcd456e87bbbfc8bf37af541fda62ccfcce76903503424fd101ef7bdee  linux-6.12.43.tar.xz
diff --git a/board/sipeed/licheepi_zero/patches/uboot/uboot.hash b/board/sipeed/licheepi_zero/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..440526977b
--- /dev/null
+++ b/board/sipeed/licheepi_zero/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
diff --git a/configs/sipeed_licheepi_zero_defconfig b/configs/sipeed_licheepi_zero_defconfig
index e92c1d854e..0c60a5c763 100644
--- a/configs/sipeed_licheepi_zero_defconfig
+++ b/configs/sipeed_licheepi_zero_defconfig
@@ -1,7 +1,11 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/sipeed/licheepi_zero/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="licheepi-zero"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the LicheePi Zero"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -10,10 +14,10 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sipeed/licheepi_zero/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.43"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-v3s-licheepi-zero sun8i-v3s-licheepi-zero-dock"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-v3s-licheepi-zero allwinner/sun8i-v3s-licheepi-zero-dock"
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX=y
 BR2_PACKAGE_WPA_SUPPLICANT=y
@@ -23,11 +27,12 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="LicheePi_Zero"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
