Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35FFC4332F
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 21:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C6C384BF6;
	Sat, 18 Dec 2021 21:12:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EqAC5bxLTtkH; Sat, 18 Dec 2021 21:12:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4FFD84BD2;
	Sat, 18 Dec 2021 21:12:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46ACA1BF2A0
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 21:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 343824012B
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 21:12:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wH2GFgc-BYFq for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 21:12:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 345CF40022
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 21:12:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E07088232C; Sat, 18 Dec 2021 21:07:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Dec 2021 22:12:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15e6a21f30721c7a9ce95d22fa4d76cd36dff971
X-Git-Newrev: b8aebcfd823f83c169d78cfada346684ef538aa8
X-Patchwork-Hint: ignore
Message-Id: <20211218210720.E07088232C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/roseapplypi_defconfig: bump kernel
 to 5.15.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=b8aebcfd823f83c169d78cfada346684ef538aa8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The kernel now has support for dma, ethernet, i2c, mmc, pinctrl, regulator,
so enable drivers for those, change to a ext4 rootfs and enable DHCP on
eth0.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/roseapplepi/genimage.cfg |  6 ++++++
 board/roseapplepi/linux.config | 25 +++++++++++++++++++++++++
 board/roseapplepi/uEnv.txt     |  2 +-
 configs/roseapplepi_defconfig  |  7 ++++---
 4 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/board/roseapplepi/genimage.cfg b/board/roseapplepi/genimage.cfg
index f1bceb0ede..4c5a8de902 100644
--- a/board/roseapplepi/genimage.cfg
+++ b/board/roseapplepi/genimage.cfg
@@ -36,4 +36,10 @@ image sdcard.img {
 		bootable = "true"
 		image = "boot.vfat"
 	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
 }
diff --git a/board/roseapplepi/linux.config b/board/roseapplepi/linux.config
index aea48b7730..89e7c8917f 100644
--- a/board/roseapplepi/linux.config
+++ b/board/roseapplepi/linux.config
@@ -26,19 +26,44 @@ CONFIG_INET=y
 # CONFIG_IPV6 is not set
 # CONFIG_WIRELESS is not set
 # CONFIG_ETHTOOL_NETLINK is not set
+CONFIG_NETDEVICES=y
+CONFIG_OWL_EMAC=y
+CONFIG_REALTEK_PHY=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_ATC260X_ONKEY=y
 # CONFIG_VT is not set
 CONFIG_SERIAL_OWL=y
 # CONFIG_HW_RANDOM is not set
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_OWL=y
+CONFIG_PINCTRL=y
+CONFIG_PINCTRL_OWL=y
+CONFIG_PINCTRL_S500=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_ATC260X=y
+CONFIG_MFD_ATC260X_I2C=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_ATC260X=y
 # CONFIG_HID is not set
 # CONFIG_USB_SUPPORT is not set
+CONFIG_MMC=y
+CONFIG_MMC_OWL=y
+CONFIG_DMADEVICES=y
+CONFIG_OWL_DMA=y
 # CONFIG_VIRTIO_MENU is not set
 # CONFIG_VHOST_MENU is not set
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXT4_FS=y
+CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
 # CONFIG_MISC_FILESYSTEMS is not set
 # CONFIG_NETWORK_FILESYSTEMS is not set
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
 # CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
 # CONFIG_CRYPTO_HW is not set
 # CONFIG_FTRACE is not set
diff --git a/board/roseapplepi/uEnv.txt b/board/roseapplepi/uEnv.txt
index 2b9de727b4..339eb8aa0a 100644
--- a/board/roseapplepi/uEnv.txt
+++ b/board/roseapplepi/uEnv.txt
@@ -1,3 +1,3 @@
 # no ramdisk
 ramdisk_addr_r=-
-bootargs=console=ttyOWL2,115200
+bootargs=console=ttyOWL2,115200 root=/dev/mmcblk0p2 rootwait clk_ignore_unused
diff --git a/configs/roseapplepi_defconfig b/configs/roseapplepi_defconfig
index 2af94d010b..f4efacf80d 100644
--- a/configs/roseapplepi_defconfig
+++ b/configs/roseapplepi_defconfig
@@ -3,15 +3,16 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_GLOBAL_PATCH_DIR="board/roseapplepi/patches"
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 5.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/roseapplepi/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/roseapplepi/genimage.cfg"
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.10"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/roseapplepi/linux.config"
 BR2_LINUX_KERNEL_UIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
