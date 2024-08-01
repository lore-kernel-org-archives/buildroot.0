Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4912C3DA64
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 21:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B13738203C;
	Thu,  1 Aug 2024 21:23:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nvilU3yBtRg3; Thu,  1 Aug 2024 21:23:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A094182052
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A094182052;
	Thu,  1 Aug 2024 21:23:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 858EA1BF3F0
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72AE140277
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:23:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cvdSypgWPuIc for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 21:23:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1483140153
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1483140153
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 21:23:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2FA383947; Thu,  1 Aug 2024 21:23:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Aug 2024 23:20:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 450240ca3f933b710910a6ff0620fae5bd74f07b
X-Git-Newrev: 0d4e3c4498395fd4d19a1f67228ec28015d2f023
X-Patchwork-Hint: ignore
Message-Id: <20240801212351.F2FA383947@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/freescale_imx8mpevk: bump BSP
 components to lf-6.6.23-2.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0d4e3c4498395fd4d19a1f67228ec28015d2f023
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump ATF, U-Boot and Linux kernel to the NXP BSP lf-6.6.23-2.0.0
versions.

Also, since commit dc0f721 "package/gcc: switch to 13.x as default",
this freescale_imx8mpevk_defconfig is failing to build the Kernel
with output:

    drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_os.c:5675:1: error: conflicting types for '_QuerySignal' due to enum/integer mismatch; have 'gceSTATUS(struct _gckOS *, void *)' {aka 'enum _gceSTATUS(struct _gckOS *, void *)'} [-Werror=enum-int-mismatch]
     5675 | _QuerySignal(IN gckOS Os, IN gctSIGNAL Signal)
          | ^~~~~~~~~~~~

This commit fixes the issue by updating the Kernel.

This commit also adds the custom version package hashes. Therefore,
BR2_DOWNLOAD_FORCE_CHECK_HASHES=y is added in the defconfig, a
BR2_GLOBAL_PATCH_DIR is also added in the board specific directory and
the hash files are added.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089468

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                            |  1 -
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash     |  2 ++
 .../imx8mpevk/patches/linux-headers/linux-headers.hash         |  1 +
 board/freescale/imx8mpevk/patches/linux/linux.hash             |  2 ++
 board/freescale/imx8mpevk/patches/uboot/uboot.hash             |  2 ++
 configs/freescale_imx8mpevk_defconfig                          | 10 ++++++----
 6 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index fe5d2618c6..cb08ed1e5a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -155,7 +155,6 @@ configs/freescale_imx6ullevk_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx8dxlevk_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx8mmevk_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx8mnevk_defconfig lib_defconfig.ForceCheckHash
-configs/freescale_imx8mpevk_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx8mqevk_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx8qmmek_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx8qxpmek_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/freescale/imx8mpevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx8mpevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..0266b45d6a
--- /dev/null
+++ b/board/freescale/imx8mpevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  37f0dee8b3b52d6c7f8a46c3bdd4138b528f9cc607015400e7cad0c206df41d7  imx-atf-lf-6.6.23-2.0.0.tar.gz
diff --git a/board/freescale/imx8mpevk/patches/linux-headers/linux-headers.hash b/board/freescale/imx8mpevk/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/freescale/imx8mpevk/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/imx8mpevk/patches/linux/linux.hash b/board/freescale/imx8mpevk/patches/linux/linux.hash
new file mode 100644
index 0000000000..3c4223976b
--- /dev/null
+++ b/board/freescale/imx8mpevk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c70adedadce88f8685cb26d9703b930292c1349138e2c55ed9b4cd6e277de3bd  linux-imx-lf-6.6.23-2.0.0.tar.gz
diff --git a/board/freescale/imx8mpevk/patches/uboot/uboot.hash b/board/freescale/imx8mpevk/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..4e0d729ca0
--- /dev/null
+++ b/board/freescale/imx8mpevk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  179b6531ef1d4ce681d139741ac7b4144220c90b7223297df28b61e98e8d37fc  uboot-imx-lf-6.6.23-2.0.0.tar.gz
diff --git a/configs/freescale_imx8mpevk_defconfig b/configs/freescale_imx8mpevk_defconfig
index 2aed048482..0ced252cd0 100644
--- a/configs/freescale_imx8mpevk_defconfig
+++ b/configs/freescale_imx8mpevk_defconfig
@@ -1,12 +1,14 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx8mpevk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mp-evk.dtb"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.1.22-2.0.0)/linux-imx-lf-6.1.22-2.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.23-2.0.0)/linux-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mp-evk"
@@ -19,13 +21,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.1.22-2.0.0)/imx-atf-lf-6.1.22-2.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.23-2.0.0)/imx-atf-lf-6.6.23-2.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.1.22-2.0.0)/uboot-imx-lf-6.1.22-2.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.23-2.0.0)/uboot-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mp_evk"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imx8mpevk/uboot-fragment.config"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
