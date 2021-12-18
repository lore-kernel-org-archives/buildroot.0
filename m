Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF32C433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 16:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B9AC4011D;
	Sat, 18 Dec 2021 16:37:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZMTeodBUjlV3; Sat, 18 Dec 2021 16:37:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EF0440386;
	Sat, 18 Dec 2021 16:37:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D1E41BF2BE
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 16:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8820183EE9
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 16:37:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rIYKfwM-XTFK for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 16:37:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3CE7183E22
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 16:37:48 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 6035E200005;
 Sat, 18 Dec 2021 16:37:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1myciO-0003TL-9W; Sat, 18 Dec 2021 17:37:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 18 Dec 2021 17:37:41 +0100
Message-Id: <20211218163742.13297-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/roseapplypi_defconfig: bump kernel to
 5.15.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The kernel now has support for dma, ethernet, i2c, mmc, pinctrl, regulator,
so enable drivers for those, change to a ext4 rootfs and enable DHCP on
eth0.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
