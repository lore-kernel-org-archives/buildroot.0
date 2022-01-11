Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AE3C433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 21:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46D3283E6E;
	Tue, 11 Jan 2022 21:15:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2lGU_2J9DLe5; Tue, 11 Jan 2022 21:15:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A71583E6B;
	Tue, 11 Jan 2022 21:15:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B9DFC1BF989
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 21:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A77DA408FE
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 21:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EYLd_UjwksrE for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 21:15:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B88024016A
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 21:15:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E6AEB834E1; Tue, 11 Jan 2022 21:09:02 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 22:15:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ead58eaad3cab6593356a1a254fac1eb15f8ef7c
X-Git-Newrev: 350bddf7efa17f5cc67023d2f4537b7f6d65fb41
X-Patchwork-Hint: ignore
Message-Id: <20220111210902.E6AEB834E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/mx6sx_udoo: bump U-Boot and kernel
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

commit: https://git.buildroot.net/buildroot/commit/?id=350bddf7efa17f5cc67023d2f4537b7f6d65fb41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump U-Boot to 2022.01 and kernel to 5.15.13.

After the conversion to U-Boot device model, the SD card is
device '1', so change the boot script accordingly.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/udoo/common/boot.scr.txt   | 6 +++---
 configs/mx6sx_udoo_neo_defconfig | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/board/udoo/common/boot.scr.txt b/board/udoo/common/boot.scr.txt
index 7acceed0fb..7a7d756c3c 100644
--- a/board/udoo/common/boot.scr.txt
+++ b/board/udoo/common/boot.scr.txt
@@ -1,7 +1,7 @@
-setenv finduuid "part uuid mmc 0:1 uuid"
+setenv finduuid "part uuid mmc 1:1 uuid"
 run finduuid
 run findfdt
 setenv bootargs "console=${console} root=PARTUUID=${uuid} rootwait rootfstype=ext4"
-load mmc 0:1 ${fdt_addr} boot/${fdtfile}
-load mmc 0:1 ${loadaddr} boot/zImage
+load mmc 1:1 ${fdt_addr} boot/${fdtfile}
+load mmc 1:1 ${loadaddr} boot/zImage
 bootz ${loadaddr} - ${fdt_addr}
diff --git a/configs/mx6sx_udoo_neo_defconfig b/configs/mx6sx_udoo_neo_defconfig
index 2bdcade252..3e1dc33bd4 100644
--- a/configs/mx6sx_udoo_neo_defconfig
+++ b/configs/mx6sx_udoo_neo_defconfig
@@ -3,8 +3,8 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-# Linux headers same as kernel, a 5.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
+# Linux headers same as kernel, a 5.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/udoo/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
@@ -12,13 +12,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="udoo_neo"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.13"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-udoo-neo-basic imx6sx-udoo-neo-full imx6sx-udoo-neo-extended"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
