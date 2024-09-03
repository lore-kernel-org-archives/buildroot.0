Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C01CD37AD
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83B45605AA;
	Tue,  3 Sep 2024 19:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQmPq7hoBXcf; Tue,  3 Sep 2024 19:54:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B04D60680
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B04D60680;
	Tue,  3 Sep 2024 19:54:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D7691BF344
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A8F440198
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lxCbR_4trQxx for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:53:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D53440109
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D53440109
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:53:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 729C886BE4; Tue,  3 Sep 2024 19:53:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 21:53:39 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5e94707ca925accebdd1a7fc8fb4b023e2e8edec
X-Git-Newrev: a584f8355569daa8f5794c70fa6e5eadbbe5a537
X-Patchwork-Hint: ignore
Message-Id: <20240903195357.729C886BE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/imx8mqevk: bump TF-A,
 U-Boot and Linux Kernel version
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a584f8355569daa8f5794c70fa6e5eadbbe5a537
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The imx8mqevk_defconfig is failing to build the arm-trusted-firmware
package, with the error message:

    plat/imx/imx8m/hab.c: In function 'imx_hab_handler':
    plat/imx/imx8m/hab.c:65:57: error: array subscript 0 is outside array bounds of 'uint32_t[0]' {aka 'unsigned int[]'} [-Werror=array-bounds=]
       65 | #define HAB_RVT_CHECK_TARGET_ARM64      ((unsigned long)*(uint32_t *)(HAB_RVT_BASE + 0x18))
          |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This is happening since commit dc0f721 "package/gcc: switch to 13.x
as default".

This commit fixes this build failure by updating the TF-A, U-Boot and
Linux Kernel. Note: this imx8mqevk_defconfig uses the upstream Kernel
(in contrast of the freescale_imx8mqevk_defconfig which is using the NXP
BSP Kernel version).

Also, this new uboot version needs gnutls and openssl, so the
corresponding options are added to the defconfig.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701411

Signed-off-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/imx8mqevk_defconfig | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/configs/imx8mqevk_defconfig b/configs/imx8mqevk_defconfig
index 943a479932..350b863ec9 100644
--- a/configs/imx8mqevk_defconfig
+++ b/configs/imx8mqevk_defconfig
@@ -1,12 +1,12 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mq-evk.dtb"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.48"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mq-evk"
@@ -19,15 +19,17 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,rel_imx_5.4.24_2.1.0)/imx-atf-rel_imx_5.4.24_2.1.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.23-2.0.0)/imx-atf-lf-6.6.23-2.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mq"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,rel_imx_5.4.24_2.1.0)/uboot-imx-rel_imx_5.4.24_2.1.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.23-2.0.0)/uboot-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mq_evk"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_SPL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
