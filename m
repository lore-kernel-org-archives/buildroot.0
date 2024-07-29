Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE949C3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 18:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2128F6089E;
	Mon, 29 Jul 2024 18:20:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jeovHneq6Xne; Mon, 29 Jul 2024 18:20:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB3C66089F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB3C66089F;
	Mon, 29 Jul 2024 18:20:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 636F81BF42C
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 18:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 510F6403A8
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 18:20:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j78KIX6dFe5L for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 18:20:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9D9040391
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9D9040391
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 18:20:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE01982CFA; Mon, 29 Jul 2024 18:20:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Jul 2024 20:19:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cefa611c8fcedf9b35d3a8161d5bcef775d46c32
X-Git-Newrev: 956c5224ab85f6bc5086a2d1270181be7743113c
X-Patchwork-Hint: ignore
Message-Id: <20240729182039.DE01982CFA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/freescale_imx7dsabresd: bump BSP
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

commit: https://git.buildroot.net/buildroot/commit/?id=956c5224ab85f6bc5086a2d1270181be7743113c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps U-Boot and Linux kernel to the NXP BSP
lf-6.6.23-2.0.0 versions.

While bumping those BSP components, this commit also adds the custom
hashes by enabling BR2_DOWNLOAD_FORCE_CHECK_HASHES=y in this
defconfig. A _PATCH_DIR is added for that purpose and hash files are
added in it. The ".checkpackageignore" entry for this defconfig is
also removed.

Also, since commit dc0f721 "package/gcc: switch to 13.x as default",
this freescale_imx7dsabresd_defconfig is failing to build the Kernel
with output:

    drivers/ata/libahci.c: In function 'ahci_led_store':
    ././include/linux/compiler_types.h:315:45: error: call to '__compiletime_assert_340' declared with attribute error: BUILD_BUG_ON failed: sizeof(_s) > sizeof(long)
      315 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
          |                                             ^

This commit fixes the issue by bumping components which includes the
needed gcc-13 fixes.

The Kernel DTS name is also updated by adding the new "nxp/imx/"
prefix, to follow the upstream reorganization in [1], first included
in v6.5.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/7423016459

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=724ba6751532055db75992fc6ae21c3e322e94a7

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                        |  1 -
 .../imx7dsdb/patches/linux-headers/linux-headers.hash      |  1 +
 board/freescale/imx7dsdb/patches/linux/linux.hash          |  2 ++
 board/freescale/imx7dsdb/patches/uboot/uboot.hash          |  2 ++
 configs/freescale_imx7dsabresd_defconfig                   | 14 +++++++++-----
 5 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 8e2a4c0324..a6cded787b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -153,7 +153,6 @@ configs/engicam_imx6ul_geam_defconfig lib_defconfig.ForceCheckHash
 configs/engicam_imx6ul_isiot_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx28evk_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx6ullevk_defconfig lib_defconfig.ForceCheckHash
-configs/freescale_imx7dsabresd_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx8dxlevk_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx8mmevk_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx8mnevk_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/freescale/imx7dsdb/patches/linux-headers/linux-headers.hash b/board/freescale/imx7dsdb/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/freescale/imx7dsdb/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/imx7dsdb/patches/linux/linux.hash b/board/freescale/imx7dsdb/patches/linux/linux.hash
new file mode 100644
index 0000000000..3c4223976b
--- /dev/null
+++ b/board/freescale/imx7dsdb/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c70adedadce88f8685cb26d9703b930292c1349138e2c55ed9b4cd6e277de3bd  linux-imx-lf-6.6.23-2.0.0.tar.gz
diff --git a/board/freescale/imx7dsdb/patches/uboot/uboot.hash b/board/freescale/imx7dsdb/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..4e0d729ca0
--- /dev/null
+++ b/board/freescale/imx7dsdb/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  179b6531ef1d4ce681d139741ac7b4144220c90b7223297df28b61e98e8d37fc  uboot-imx-lf-6.6.23-2.0.0.tar.gz
diff --git a/configs/freescale_imx7dsabresd_defconfig b/configs/freescale_imx7dsabresd_defconfig
index d337865831..f00144239e 100644
--- a/configs/freescale_imx7dsabresd_defconfig
+++ b/configs/freescale_imx7dsabresd_defconfig
@@ -2,8 +2,12 @@
 BR2_arm=y
 BR2_cortex_a7=y
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# patches
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx7dsdb/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -11,10 +15,10 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-5.10.y-1.0.0)/linux-imx-lf-5.10.y-1.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.23-2.0.0)/linux-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-sdb"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx7d-sdb"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # filesystem
@@ -25,7 +29,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx7dsabresd"
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-5.10.y-1.0.0)/uboot-imx-lf-5.10.y-1.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.23-2.0.0)/uboot-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
