Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC652C433EF
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 15:31:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1881611C4
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 15:31:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1881611C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 902DF60AD2;
	Thu,  4 Nov 2021 15:31:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QiTD-D-egg30; Thu,  4 Nov 2021 15:31:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1316960AF5;
	Thu,  4 Nov 2021 15:31:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 759281BF5A1
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 15:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64A96403FB
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 15:31:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=microchip.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tGkm6EQUKo9V for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 15:30:59 +0000 (UTC)
X-Greylist: delayed 00:07:06 by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D456403E2
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 15:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636039859; x=1667575859;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jrHd7qIKd8jlM01Y+8vVvEolrWj6/G9Ui3noUJypfO0=;
 b=wUyVZTTYHSyLAmcDQ5wdWER3hzj6vh1D7EG7DMh/QxhaaHrMWmyBFm/Z
 xJBUZrJoPVwOUxDk1utwx7WeYX6/LShAZ/3+NNFOEWgz7DFvOfOzXwq9o
 smPCtw/BiX6WvP0Wb6FsXh/cwZ1ybuv8Krcc02FItafTqyb/rlbbXMopa
 m3trD3z4sYKWwajwhHdYraejSMzA0a/1yhma6uyWwiLgCqmFlSRz0dS3V
 915d2CkQ0C4JQgY0tDwyNSJjhpOzxpprVaUP8epiQtx+I4lhyzl2rY3Aj
 RT7Yl1/N3Cl6d8d3bZA60eRpjzhXOMiTZYR28n+3z4rTRiXwxh531b2Ih A==;
IronPort-SDR: fefuSY2G/wfFRDQch8MJdCn8w1aNomOXDwTqFAVhYdd6sUSYv5kiNDRZggT/BormyT5e0bgpx6
 Yg7DZGBDWE7mtnQyXHfOV9Y+5bQNZgjgSgy9jkLkJ/qznu3CIT6h8AQLi0EpFKqZvXJu93cpFR
 3klN7AMzUUdMyi54L+0UG/noDDgOnEur3rrWVs7exEEpz8o6vJ2lzYxfIT2Z3HxhkmxCXXl1XF
 Aw0aQIPPQbZoIPGLt09zimeqKR85VLGo5KePTcBOtf29C/XxYWfrXoBRLkTE3FDsOBiWP91j9e
 I8XvNAzmv/819GVGlemcrcXd
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; d="scan'208";a="75378385"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Nov 2021 08:23:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 4 Nov 2021 08:23:51 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 4 Nov 2021 08:23:49 -0700
To: <buildroot@buildroot.org>
Date: Thu, 4 Nov 2021 17:23:28 +0200
Message-ID: <20211104152329.1560933-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] configs/microchip_sama7g5ek: add new
 defconfigs
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
From: Eugen Hristev via buildroot <buildroot@buildroot.org>
Reply-To: Eugen Hristev <eugen.hristev@microchip.com>
Cc: Eugen Hristev <eugen.hristev@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new defconfigs for sama7g5 evaluation kit.
Update README with new defconfigs.
Board uses linux 5.15 mainline.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 board/atmel/readme.txt                        |  2 +
 board/microchip/sama7g5ek/genimage.cfg        | 31 +++++++++
 configs/microchip_sama7g5ek_mmc_defconfig     | 26 +++++++
 configs/microchip_sama7g5ek_mmc_dev_defconfig | 69 +++++++++++++++++++
 4 files changed, 128 insertions(+)
 create mode 100644 board/microchip/sama7g5ek/genimage.cfg
 create mode 100644 configs/microchip_sama7g5ek_mmc_defconfig
 create mode 100644 configs/microchip_sama7g5ek_mmc_dev_defconfig

diff --git a/board/atmel/readme.txt b/board/atmel/readme.txt
index a29d027214..a9c427e90b 100644
--- a/board/atmel/readme.txt
+++ b/board/atmel/readme.txt
@@ -25,6 +25,8 @@ This guide covers the following configurations:
  - microchip_sam9x60ek_mmc_dev_defconfig
  - microchip_sama5d2_icp_mmc_defconfig
  - microchip_sama5d2_icp_mmc_dev_defconfig
+ - microchip_sama7g5ek_mmc_defconfig
+ - microchip_sama7g5ek_mmc_dev_defconfig
 
 These configurations will use AT91Bootstrap, u-boot and a linux kernel from
 the git trees maintained by Atmel.
diff --git a/board/microchip/sama7g5ek/genimage.cfg b/board/microchip/sama7g5ek/genimage.cfg
new file mode 100644
index 0000000000..ade29e4b5d
--- /dev/null
+++ b/board/microchip/sama7g5ek/genimage.cfg
@@ -0,0 +1,31 @@
+# Image for SD card boot on Microchip SAMA7G5EK (sama7g5 evaluation kit)
+#
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"at91-sama7g5ek.dtb",
+			"boot.bin",
+			"u-boot.bin"
+		}
+	}
+	size = 16M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+		offset = 1M
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
diff --git a/configs/microchip_sama7g5ek_mmc_defconfig b/configs/microchip_sama7g5ek_mmc_defconfig
new file mode 100644
index 0000000000..406a49dd94
--- /dev/null
+++ b/configs/microchip_sama7g5ek_mmc_defconfig
@@ -0,0 +1,26 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
+BR2_OPTIMIZE_FAST=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/microchip/sama7g5ek/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="sama7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama7g5ek"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.0)/at91bootstrap-v4.0.0.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama7g5eksd_uboot"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,u-boot-at91,linux4sam-2021.04)/u-boot-at91-linux4sam-2021.04.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama7g5ek_mmc1"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/microchip_sama7g5ek_mmc_dev_defconfig b/configs/microchip_sama7g5ek_mmc_dev_defconfig
new file mode 100644
index 0000000000..df72722221
--- /dev/null
+++ b/configs/microchip_sama7g5ek_mmc_dev_defconfig
@@ -0,0 +1,69 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
+BR2_OPTIMIZE_FAST=y
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_PTHREAD_DEBUG=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/microchip/sama7g5ek/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="sama7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama7g5ek"
+BR2_PACKAGE_LINUX_TOOLS_IIO=y
+BR2_PACKAGE_BZIP2=y
+BR2_PACKAGE_XZ=y
+BR2_PACKAGE_ZIP=y
+BR2_PACKAGE_GDB=y
+BR2_PACKAGE_LMBENCH=y
+BR2_PACKAGE_STRACE=y
+BR2_PACKAGE_TREE=y
+BR2_PACKAGE_DOSFSTOOLS=y
+BR2_PACKAGE_DOSFSTOOLS_FATLABEL=y
+BR2_PACKAGE_DOSFSTOOLS_FSCK_FAT=y
+BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
+BR2_PACKAGE_MMC_UTILS=y
+BR2_PACKAGE_MTD=y
+BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_EVTEST=y
+BR2_PACKAGE_SETSERIAL=y
+BR2_PACKAGE_SPI_TOOLS=y
+BR2_PACKAGE_USBUTILS=y
+BR2_PACKAGE_LIBSYSFS=y
+BR2_PACKAGE_LIBDRM=y
+BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
+BR2_PACKAGE_DTC=y
+BR2_PACKAGE_DTC_PROGRAMS=y
+BR2_PACKAGE_ARGP_STANDALONE=y
+BR2_PACKAGE_BLUEZ5_UTILS=y
+BR2_PACKAGE_BRIDGE_UTILS=y
+BR2_PACKAGE_CAN_UTILS=y
+BR2_PACKAGE_ETHTOOL=y
+BR2_PACKAGE_IPERF=y
+BR2_PACKAGE_IPROUTE2=y
+BR2_PACKAGE_IPTABLES=y
+BR2_PACKAGE_IW=y
+BR2_PACKAGE_LRZSZ=y
+BR2_PACKAGE_MII_DIAG=y
+BR2_PACKAGE_OPENSSH=y
+BR2_PACKAGE_WIRELESS_TOOLS=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_HTOP=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.0)/at91bootstrap-v4.0.0.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama7g5eksd_uboot"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,u-boot-at91,linux4sam-2021.04)/u-boot-at91-linux4sam-2021.04.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama7g5ek_mmc1"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
