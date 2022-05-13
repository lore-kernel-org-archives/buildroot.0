Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9C0C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 17:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B74D83F0D;
	Fri, 13 May 2022 17:01:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M76VHeEWqmO1; Fri, 13 May 2022 17:01:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56FB183F04;
	Fri, 13 May 2022 17:01:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C6F001BF86B
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 17:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B53564088D
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 17:00:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GS1gFLZIt6yU for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 17:00:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D396940887
 for <buildroot@buildroot.org>; Fri, 13 May 2022 17:00:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1BEA385DF8; Fri, 13 May 2022 16:49:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 18:59:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52818d732b9bb4e4a80a9a453a53ebdec6cf6c7c
X-Git-Newrev: b51ad28b62c81bb2d9884d5628de0b3b2b1237ec
X-Patchwork-Hint: ignore
Message-Id: <20220513164955.1BEA385DF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/kontron_pitx_imx8m: switch to
 upstream U-Boot
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

commit: https://git.buildroot.net/buildroot/commit/?id=b51ad28b62c81bb2d9884d5628de0b3b2b1237ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch U-Boot from vendor downstream version to upstream. Since the
upstream U-Boot uses binman to build the bootable binary (flash.bin) the
need for the iMX specifc prepare script is no longer required.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/kontron/pitx-imx8m/genimage.cfg  |  2 +-
 board/kontron/pitx-imx8m/post-image.sh |  3 ---
 configs/kontron_pitx_imx8m_defconfig   | 20 +++++++++++++-------
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/board/kontron/pitx-imx8m/genimage.cfg b/board/kontron/pitx-imx8m/genimage.cfg
index 4a0aa117fb..bc100b171d 100644
--- a/board/kontron/pitx-imx8m/genimage.cfg
+++ b/board/kontron/pitx-imx8m/genimage.cfg
@@ -5,7 +5,7 @@ image sdcard.img {
 
 	partition imx-boot {
 		in-partition-table = "no"
-		image = "imx8-boot-sd.bin"
+		image = "flash.bin"
 		offset = 33K
 	}
 
diff --git a/board/kontron/pitx-imx8m/post-image.sh b/board/kontron/pitx-imx8m/post-image.sh
deleted file mode 100755
index 3452fd4501..0000000000
--- a/board/kontron/pitx-imx8m/post-image.sh
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-support/scripts/genimage.sh -c ${BINARIES_DIR}/genimage.cfg
diff --git a/configs/kontron_pitx_imx8m_defconfig b/configs/kontron_pitx_imx8m_defconfig
index 286858aa72..81eed66ee1 100644
--- a/configs/kontron_pitx_imx8m_defconfig
+++ b/configs/kontron_pitx_imx8m_defconfig
@@ -3,9 +3,9 @@ BR2_aarch64=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc2"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/kontron/pitx-imx8m/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/kontron/pitx-imx8m/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/pitx-imx8mq.dtb"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/kontron/pitx-imx8m/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 
 # Kernel
 BR2_LINUX_KERNEL=y
@@ -37,12 +37,18 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mq"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://gitlab.kontron.com/imx/u-boot-imx/-/archive/PITX-IMX8M-R12/u-boot-imx-PITX-IMX8M-R12.tar.gz"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pitx-imx8m"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron_pitx_imx8m"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_BIN=y
+BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
 BR2_TARGET_UBOOT_SPL=y
 
 # Required host tools to create the SD/eMMC image
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
