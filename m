Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE0DC982EB
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 12:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 026D6407D3;
	Sun, 20 Sep 2026 12:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mFTIlD-vFRlK; Sun, 20 Sep 2026 12:30:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3117340BC4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789907421;
	b=RywWs72x7xwg/bmENBKWBYX3P9B6xGVYB8Rl6t4b99JJocnUcAV/3K03EgN0OXi7ERGW
	 QczfWsTy4At+1tluBoqIA6anZ3JMBk4IX3R3JapNRlpHETi33WLIoS3bCoI+Btn2LrsVC
	 0pS25WJjeABXhf1L9A3nOIiqRYvLmkGdIFlG++NoPERaKLxCjXLMxU7jjslYd/GQ1yiSH
	 7tBpUBS4plBKJR7aDPlhPAV+JFDoH85TbkQmsmFo6KgC1JXqceWRhQEIoezmVkY4wDPXh
	 C/wdejGDroxVq9QIX3xOJptej9YTs/eNQQNeceqsiJDwkjpNviDJJif1Wd4+zaUhZlA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789907421;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TCM4axyuEHeOoC5JGjHkRHlmCFpatne9A13dCQQGH/I=;
	b=ltI8IHq2q2QGvRPSRvU/n4HGWAhxtoekzfbxzQwR4asQf8EbwF4JgwtM09pyH6Oy6Vc0
	 7IKjsJjjMisqf0QGlcWoR5kUemagDI1ZLSQ3TSa7rbY/9QFewmVBcZvuxG3Ty8s1GDKwL
	 SH8AlpFahRNzmLJjBo7w+wZyhSENF4VTy54Zh+T2rpsqm+rZiURyTt2Mw0zLg6PhqAe4k
	 Ry/wxEE0C10tOqSQalq/w2EKdqlW1F9lMXN13aUkx16ACK6AshvR3dviO15IQDNBluvdX
	 8OjJtW/M69+Yr7tYeqHu59j4DMiobw0CsiGA42f6570N5CC5Z1xDG+eunDWvsOurRwA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789907421;
	bh=TCM4axyuEHeOoC5JGjHkRHlmCFpatne9A13dCQQGH/I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m/zq/IX5V4gTRfY0OBWredZ95eXFrOXVMmgO79Nw7nJql1hFRCFGccu15LA8tAfTG
	 oiKMbqy2OqW+9Nh7+g6QmwylGrXfEpr066DO/3mtQ0PuDIc3C2pbHYew80cGUs7lp6
	 SszimCvZxS5Bvw5LrRgDx+qGH9bOrm/lbCBDRF6Suh7dn9c/Dl+eMLF/VneGuSo6k2
	 02hCR7AIY/dWhiYPofifLHPREHriutn0Ddi9xWuCqNUGuqvuj9D/JQWeyx58sBhIM1
	 KzqyyYuoy/i+II3Y1/31UpgzWowVXAi9TcSHjdp/WrKfF27aNevEbYqtPOdeF4PyzW
	 yDDL08zyAQ+kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3117340BC4;
	Sun, 20 Sep 2026 12:30:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D68CF371
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4A2F407D4
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BzTpSZ5zgHpy for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 12:30:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DA1AF407D3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789907414;
 b=Ros5lSQylF2zfZ5yJqZVPeEwJnkgcvxvhb2nfqzuO353rQty38D2vwpxo4EdpoWm5goc
 obAkF1MLuw0YtMA7OPIFB16xRE5FDZ4W2MubEU3rgDpPw7JvYI5y+aD6cMkjXg3thu5Cf
 Y/bC+h5UMgEXsWxJuOd7hNtmyC7heyAThr3Jgr43v+rtK9pnTw2+sZ4e/tNOv3tWT+rN/
 8+1F8Jwr6IErXARGUyGKxBqQvOQ/3RijAfFZJ/PsZ2dRG84nubkmBQhP+kPoB4n/3BwuT
 LakQbv8EZzGSD0pRnBaFWjha8Bvat7/XFQFPVoo3UoiENAbZk2TibApulCewFfjWj5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789907414;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=SScXxqyTcZiBFryptdkLUMHRVVw75Nea5Et7LUDOtRg=;
 b=BRsaT4FIyWASX3DJsecUYdQG4t/L/GpXBCtMhWozc+OGzcswX/jHUfZ5eTw2A7S9d1fe
 7lM5Xh+eOpauIuHoz7e56/ZANnyZyKioPL5j/OwtwMQrYdReeKMYYwcXrWvuTGxYRHPGg
 RqQApfZrOvyo0wjRT0S3oCxPlAwv9xDInVBuk6fs2LzHVtgmdyy0Nf9ClzpUPhPGKs8kt
 JbtyEx2kEwJ450pTHHEDjuz5n6Arxu7b9nOezZcNo5qm72fErQbrKRnjZiWaVf0G80h8X
 jQ6c0/7qlQRuCXxAkW5a8wSeuvuzPvgl5ao8jqp3OsRiQlkD4GtXTEkVVkUwAVb+wbg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA1AF407D3
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:30:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A1ED8DB1F; Sun, 20 Sep 2026 12:29:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 14:29:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f919aa74564a62807d6709ae2eeb8825a95ee5ac
X-Git-Newrev: 98aa14a186e1fa29fd059775d218f076fea40584
X-Patchwork-Hint: ignore
Message-Id: <20260920122906.8A1ED8DB1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/visionfive2: bump Linux to 6.18.51,
 U-Boot to 2026.07, and OpenSBI to 1.8.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/98aa14a186e1fa29fd059775d218f076fea40584
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Migrate and clean up removed kernel config options during the upgrade.

Drop uboot and spl partitions from the SD card genimage configuration,
as U-Boot has deprecated the SD card and eMMC boot modes since
v2025.10 [1]. Update the rootfs block device in the kernel command line
accordingly.

Update readme.txt to reflect the new boot flow and instructions.

[1] https://docs.u-boot.org/en/v2026.07/board/starfive/visionfive2.html#zero-stage-program-loader

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/visionfive2/genimage.cfg                     | 10 --------
 board/visionfive2/linux_defconfig                  |  7 +++---
 .../overlay/boot/extlinux/extlinux.conf            |  2 +-
 board/visionfive2/patches/linux/linux.hash         |  2 +-
 board/visionfive2/patches/opensbi/opensbi.hash     |  2 +-
 board/visionfive2/patches/uboot/uboot.hash         |  2 +-
 board/visionfive2/readme.txt                       | 27 ++++++++++++----------
 configs/visionfive2_defconfig                      |  8 +++----
 8 files changed, 26 insertions(+), 34 deletions(-)

diff --git a/board/visionfive2/genimage.cfg b/board/visionfive2/genimage.cfg
index 8133e740c0..af7bc70d1a 100644
--- a/board/visionfive2/genimage.cfg
+++ b/board/visionfive2/genimage.cfg
@@ -5,16 +5,6 @@ image sdcard.img {
 		partition-table-type = "gpt"
 	}
 
-	partition spl {
-		partition-type-uuid = 2E54B353-1271-4842-806F-E436D6AF6985
-		image = "u-boot-spl.bin.normal.out"
-	}
-
-	partition uboot {
-		partition-type-uuid = BC13C2FF-59E6-4262-A352-B275FD6F7172
-		image = "u-boot.itb"
-	}
-
 	partition rootfs {
 		partition-type-uuid = 0FC63DAF-8483-4772-8E79-3D69D8477DE4
 		bootable = true
diff --git a/board/visionfive2/linux_defconfig b/board/visionfive2/linux_defconfig
index 509cd0f475..1ca11f4097 100644
--- a/board/visionfive2/linux_defconfig
+++ b/board/visionfive2/linux_defconfig
@@ -3,7 +3,6 @@ CONFIG_COMPILE_TEST=y
 CONFIG_DEFAULT_HOSTNAME="StarFive"
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
-CONFIG_USELIB=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_BPF_SYSCALL=y
@@ -59,6 +58,7 @@ CONFIG_NF_CONNTRACK=y
 CONFIG_NF_TABLES=y
 CONFIG_NFT_CT=y
 CONFIG_NFT_COMPAT=y
+CONFIG_NETFILTER_XTABLES_LEGACY=y
 CONFIG_NETFILTER_XT_MATCH_CONNTRACK=y
 CONFIG_NETFILTER_XT_MATCH_IPCOMP=y
 CONFIG_NETFILTER_XT_MATCH_IPRANGE=y
@@ -69,6 +69,7 @@ CONFIG_NETFILTER_XT_MATCH_SOCKET=y
 CONFIG_NETFILTER_XT_MATCH_STATE=y
 CONFIG_NETFILTER_XT_MATCH_STRING=y
 CONFIG_NETFILTER_XT_MATCH_U32=y
+CONFIG_IP_NF_IPTABLES_LEGACY=y
 CONFIG_NF_TABLES_IPV4=y
 CONFIG_NFT_DUP_IPV4=y
 CONFIG_NFT_FIB_IPV4=y
@@ -197,7 +198,6 @@ CONFIG_THERMAL=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
 CONFIG_THERMAL_EMULATION=y
-# CONFIG_HISI_THERMAL is not set
 CONFIG_WATCHDOG=y
 CONFIG_WATCHDOG_SYSFS=y
 CONFIG_MFD_AXP20X_I2C=y
@@ -370,7 +370,6 @@ CONFIG_SND_USB_AUDIO=y
 CONFIG_SND_SOC=y
 CONFIG_SND_DESIGNWARE_I2S=y
 CONFIG_SND_SOC_RZ=m
-CONFIG_SND_SOC_STARFIVE=y
 CONFIG_SND_SOC_JH7110_PWMDAC=y
 CONFIG_SND_SOC_JH7110_TDM=y
 CONFIG_SND_SOC_WM8960=y
@@ -522,7 +521,7 @@ CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_INIT_STACK_NONE=y
 CONFIG_CRYPTO_USER=y
-CONFIG_CRYPTO_TEST=m
+CONFIG_CRYPTO_BENCHMARK=m
 CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_USER_API_SKCIPHER=y
 CONFIG_CRYPTO_USER_API_RNG=y
diff --git a/board/visionfive2/overlay/boot/extlinux/extlinux.conf b/board/visionfive2/overlay/boot/extlinux/extlinux.conf
index 48d267f725..7934d70e15 100644
--- a/board/visionfive2/overlay/boot/extlinux/extlinux.conf
+++ b/board/visionfive2/overlay/boot/extlinux/extlinux.conf
@@ -1,4 +1,4 @@
 label linux
   kernel /boot/Image
   devicetree /boot/jh7110-starfive-visionfive-2-v1.3b.dtb
-  append console=ttyS0,115200 root=/dev/mmcblk1p3 rootwait
+  append console=ttyS0,115200 root=/dev/mmcblk1p1 rootwait
diff --git a/board/visionfive2/patches/linux/linux.hash b/board/visionfive2/patches/linux/linux.hash
index 1213da86b1..b2cfc9b7e7 100644
--- a/board/visionfive2/patches/linux/linux.hash
+++ b/board/visionfive2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  643142c1b5991560dd12f950825cc19e4497b95b82641918ecff1177f4130c1d  linux-6.12.24.tar.xz
+sha256  ba2f60f858bf4d1f929101faa356c93dc8b925b17aaa9f95eabd4627758df613  linux-6.18.51.tar.xz
diff --git a/board/visionfive2/patches/opensbi/opensbi.hash b/board/visionfive2/patches/opensbi/opensbi.hash
index d7893a1dee..5e2e695bc1 100644
--- a/board/visionfive2/patches/opensbi/opensbi.hash
+++ b/board/visionfive2/patches/opensbi/opensbi.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  d11702103f177a2914e94eec57ce5ed820296d874f6b6525c4482e55d71a3667  opensbi-1.6.tar.gz
+sha256  fb1ae61a85e966322101acb1c982f84d9eaafc4de7dd474a7d7546d9bb321c6f  opensbi-1.8.1.tar.gz
diff --git a/board/visionfive2/patches/uboot/uboot.hash b/board/visionfive2/patches/uboot/uboot.hash
index 80ea21b7cb..ff6e4ed2e2 100644
--- a/board/visionfive2/patches/uboot/uboot.hash
+++ b/board/visionfive2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
+sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
diff --git a/board/visionfive2/readme.txt b/board/visionfive2/readme.txt
index cc4fece6e9..718494e33e 100644
--- a/board/visionfive2/readme.txt
+++ b/board/visionfive2/readme.txt
@@ -1,8 +1,8 @@
-Starfive VisionFive2
+StarFive VisionFive2
 ====================
 
 The VisionFive2 is a low-cost RISC-V 64-bit based platform, powered by a
-Starfive JH7110 processor.
+StarFive JH7110 processor.
 
 https://doc-en.rvspace.org/Doc_Center/visionfive_2.html
 
@@ -24,33 +24,36 @@ If you have a booting device use u-boot and tftp:
 
   # tftpboot 0x82000000 spi-nor.img
   # sf probe
-  # sf update 0x82000000 0x0 {filesize}
+  # sf update 0x82000000 0x0 ${filesize}
 
-Otherwise, follow the recovery instruction:
+Otherwise, follow the recovery instructions:
 
 https://doc-en.rvspace.org/VisionFive2/Quick_Start_Guide/VisionFive2_SDK_QSG/recovering_bootloader%20-%20vf2.html
 
 How to write the SD card
 ========================
 
-Copy the bootable "sdcard.img" onto an SD card with "dd":
+Write "sdcard.img" onto an SD card with "dd":
 
-  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX bs=1M conv=fsync
 
 Preparing the board
 ===================
 
 Connect a TTL UART cable to pin 6 (GND), 8 (TX) and 10 (RX).
 
-Use the correct mode for booting:
-- SD card RGPIO_0=1, GRPIO_1=0
-- SPI NOR flash RGPIO_0=1, GRPIO_1=1
-
-Note that Buildroot puts the bootloader both in SPI NOR and on the SD card,
-so after flashing as instructed above, either boot mode should work.
+Select SPI NOR flash boot mode:
+- RGPIO_0=0, RGPIO_1=0
 
 https://doc-en.rvspace.org/VisionFive2/Quick_Start_Guide/VisionFive2_SDK_QSG/boot_mode_settings.html
 
 Insert your SD card.
 
 Power-up the board using an USB-C cable.
+
+Note that starting with U-Boot v2025.10, booting U-Boot directly from an
+SD card is no longer supported on this board. In this configuration, the
+bootloader is loaded from SPI NOR flash, while the SD card contains the
+Linux kernel, device trees and root filesystem.
+
+https://docs.u-boot.org/en/v2026.07/board/starfive/visionfive2.html#zero-stage-program-loader
diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
index 8223e6faa1..3e30c0649c 100644
--- a/configs/visionfive2_defconfig
+++ b/configs/visionfive2_defconfig
@@ -1,5 +1,5 @@
 BR2_riscv=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_GLOBAL_PATCH_DIR="board/visionfive2/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
@@ -7,7 +7,7 @@ BR2_ROOTFS_OVERLAY="board/visionfive2/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/visionfive2/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.24"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.51"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/visionfive2/linux_defconfig"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -19,14 +19,14 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.6"
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.8.1"
 BR2_TARGET_OPENSBI_PLAT="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_OPENSBI_ADDITIONAL_VARIABLES="FW_TEXT_START=0x40000000 FW_OPTIONS=0"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="starfive_visionfive2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
