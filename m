Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F57E77376
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 16:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E886A41FCA;
	Sat, 30 Sep 2023 16:00:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E886A41FCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wWtr0wvu3zbK; Sat, 30 Sep 2023 16:00:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFEDC41EC3;
	Sat, 30 Sep 2023 16:00:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFEDC41EC3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C4201BF5A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 053FE83C0E
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:00:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 053FE83C0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6yzQxuBSnXEy for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 16:00:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2319083C21
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 16:00:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2319083C21
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0DAEE83B7D; Sat, 30 Sep 2023 16:00:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 18:00:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a0f2b229b67673f3787db6f861ec81bb809ae349
X-Git-Newrev: e36240d2ab7b5e01a9bdc05c47b4a0ebf9540984
X-Patchwork-Hint: ignore
Message-Id: <20230930160042.0DAEE83B7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/freescale_imx8mpevk: bump to
 version lf-6.1.22-2.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e36240d2ab7b5e01a9bdc05c47b4a0ebf9540984
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the linux-imx kernel to be aligned with the NXP BSP
LF6.1.22_2.0.0 (same release used in meta-freescale [1]).

Add BR2_TARGET_UBOOT_NEEDS_GNUTLS=y and BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
since they are new dependencies for building mkeficapsule u-boot tool.

The uboot-imx doesn't use the default imx8mp-evk devicetree anymore due
to commit [2]:

"Change to use imx8mp-evk-revb4.dtb and imx8mp-ddr4-evk-revb4.dtb
 as default kernel DTB for iMX8MP re-design EVK board. Old EVK
 board is EOL, to boot old EVK, user can switch to old DTB manually."

Since the freescale_imx8mpevk_defconfig only install imx8mp-evk.dtb in
the final image, the boot stop with:

  Booting from mmc ...
  Failed to load 'imx8mp-evk-revb4.dtb'
  WARN: Cannot load the DT

Add a u-boot defconfig fragment to revert this change [2] and use the
imx8mp-evk.dtb by default.

Runtime tested on i.MX 8M Plus EVK REV B2.

[1] https://github.com/Freescale/meta-freescale/commit/e6b1b6725cd1d44550ba473ff6a80c1b80663965
[2] https://github.com/nxp-imx/uboot-imx/commit/a60e787a6e35b9c14c391e03d41468e4ad63d598

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/freescale/imx8mpevk/uboot-fragment.config |  3 +++
 configs/freescale_imx8mpevk_defconfig           | 12 +++++++-----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/board/freescale/imx8mpevk/uboot-fragment.config b/board/freescale/imx8mpevk/uboot-fragment.config
new file mode 100644
index 0000000000..b4683be9ef
--- /dev/null
+++ b/board/freescale/imx8mpevk/uboot-fragment.config
@@ -0,0 +1,3 @@
+# Use the upstream devicetree name for EVK board
+# Revert https://github.com/nxp-imx/uboot-imx/commit/a60e787a6e35b9c14c391e03d41468e4ad63d598
+CONFIG_DEFAULT_FDT_FILE="imx8mp-evk.dtb"
diff --git a/configs/freescale_imx8mpevk_defconfig b/configs/freescale_imx8mpevk_defconfig
index 913c190d87..82ed68c5a9 100644
--- a/configs/freescale_imx8mpevk_defconfig
+++ b/configs/freescale_imx8mpevk_defconfig
@@ -1,13 +1,12 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
-BR2_GLOBAL_PATCH_DIR="board/freescale/common/patches"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mp-evk.dtb"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-5.10.y-1.0.0)/linux-imx-lf-5.10.y-1.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.1.22-2.0.0)/linux-imx-lf-6.1.22-2.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mp-evk"
@@ -20,15 +19,18 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-5.10.y-1.0.0)/imx-atf-lf-5.10.y-1.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.1.22-2.0.0)/imx-atf-lf-6.1.22-2.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-5.10.y-1.0.0)/uboot-imx-lf-5.10.y-1.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.1.22-2.0.0)/uboot-imx-lf-6.1.22-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mp_evk"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imx8mpevk/uboot-fragment.config"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_SPL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
