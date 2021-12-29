Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0FDC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 22:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E719960B55;
	Wed, 29 Dec 2021 22:53:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 49JcJivt4MDD; Wed, 29 Dec 2021 22:53:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50CC7606EB;
	Wed, 29 Dec 2021 22:53:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D9071BF30B
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 22:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55B3060B54
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 22:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xyU9THzYjjwQ for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 22:53:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8114C6061B
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 22:53:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id F19C082B99; Wed, 29 Dec 2021 22:47:40 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 29 Dec 2021 23:53:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e9fb26cbb8dafd28f50a912bcaddb1056769ec17
X-Git-Newrev: 8af91d6c0cdbbe3038abeb8e93993186de2308f6
X-Patchwork-Hint: ignore
Message-Id: <20211229224740.F19C082B99@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imx6ulpico: bump U-Boot and kernel,
 switch to extlinux.conf
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

commit: https://git.buildroot.net/buildroot/commit/?id=8af91d6c0cdbbe3038abeb8e93993186de2308f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Current U-Boot is an old version and fails to build:

/usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here

Bump U-Boot to fix the problem.

Latest U-Boot has switched to distro boot and SPL, so make the necessary
changes to support it. Other advantage of bumping U-Boot is that
it also supports the other imx6ul-pico variants.

While at it, also bump U-Boot to the 5.15 LTS.

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006192

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../rootfs_overlay/boot/extlinux/extlinux.conf           |  4 ++++
 configs/imx6ulpico_defconfig                             | 16 ++++++++++------
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/board/technexion/imx6ulpico/rootfs_overlay/boot/extlinux/extlinux.conf b/board/technexion/imx6ulpico/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..24ed485c3c
--- /dev/null
+++ b/board/technexion/imx6ulpico/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+Label imx6ul-pico-buildroot
+	kernel ../zImage
+	fdtdir ../
+	append root=PARTUUID=${uuid} rootwait rw console=${console},${baudrate}
diff --git a/configs/imx6ulpico_defconfig b/configs/imx6ulpico_defconfig
index 56ae588752..e406d9938b 100644
--- a/configs/imx6ulpico_defconfig
+++ b/configs/imx6ulpico_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 4.17 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_17=y
+# Linux headers same as kernel, a 5.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc5"
@@ -15,11 +15,12 @@ BR2_ROOTFS_OVERLAY="board/technexion/imx6ulpico/rootfs_overlay"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.11"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-pico-hobbit"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-pico-pi imx6ul-pico-hobbit imx6ul-pico-dwarf"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # wifi firmware for brcm4339
 BR2_PACKAGE_LINUX_FIRMWARE=y
@@ -35,10 +36,13 @@ BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_TARGET_UBOOT_BOARDNAME="pico-imx6ul"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
-BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 
 # required tools to create the eMMC image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
