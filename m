Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F61C4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 21:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F4B2400D2;
	Tue, 30 Apr 2024 21:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S4rXaaunLVM9; Tue, 30 Apr 2024 21:37:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4BAD40179
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4BAD40179;
	Tue, 30 Apr 2024 21:37:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3534F1BF2CF
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 21:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 218CF60B29
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 21:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oEACOV-bsVbi for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 21:37:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3637060B04
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3637060B04
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 21:37:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2019C8634A; Tue, 30 Apr 2024 21:37:06 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 30 Apr 2024 23:33:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd244feb37fff29620a09ee96b4006cf7d558380
X-Git-Newrev: bbd579315aa17b11caf0ea69693403b90f928324
X-Patchwork-Hint: ignore
Message-Id: <20240430213706.2019C8634A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/armadeus_apf27: bump Linux version
 to 5.10.215
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

commit: https://git.buildroot.net/buildroot/commit/?id=bbd579315aa17b11caf0ea69693403b90f928324
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the switch to binutils 2.41 as default version [1], the arm Linux
kernel build is broken with:

  arch/arm/mm/proc-v7.S: Assembler messages:
  arch/arm/mm/proc-v7.S:640: Error: junk at end of line, first unrecognized character is `#'

A similar issue has already be fixed for qemu m68k [2].

Bump to the latest kernel 5.10 that already include the backport
of 790756c7e022 ("ARM: 8933/1: replace Sun/Solaris style flag on section directive")

Select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y to fix the following
build error:

  scripts/extract-cert.c:21:25: fatal error: openssl/bio.h: No such file or directory
  #include <openssl/bio.h>

[1] e88225ed8820881970ec33de7a15a1e0d50443da
[2] a1ce9474e40f731f327035d8c0962abb16f00ff7

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119384

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
[Romain:
  - improve commit log
  - Select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL
]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../apf27/{linux-4.12.config => linux-5.10.config} | 45 ++++++++++++++--------
 configs/armadeus_apf27_defconfig                   |  9 +++--
 2 files changed, 33 insertions(+), 21 deletions(-)

diff --git a/board/armadeus/apf27/linux-4.12.config b/board/armadeus/apf27/linux-5.10.config
similarity index 89%
rename from board/armadeus/apf27/linux-4.12.config
rename to board/armadeus/apf27/linux-5.10.config
index d0fb5d35dd..5f5776f8a6 100644
--- a/board/armadeus/apf27/linux-4.12.config
+++ b/board/armadeus/apf27/linux-5.10.config
@@ -3,26 +3,26 @@ CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_PREEMPT=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_CGROUPS=y
 CONFIG_EMBEDDED=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_SLAB=y
 CONFIG_PROFILING=y
+# CONFIG_ARCH_MULTI_V7 is not set
+CONFIG_ARCH_MXC=y
+CONFIG_AEABI=y
+CONFIG_PM_DEBUG=y
 CONFIG_OPROFILE=m
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 # CONFIG_IOSCHED_DEADLINE is not set
 # CONFIG_IOSCHED_CFQ is not set
-# CONFIG_ARCH_MULTI_V7 is not set
-CONFIG_ARCH_MXC=y
 CONFIG_MACH_IMX27_DT=y
-CONFIG_PREEMPT=y
-CONFIG_AEABI=y
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
-CONFIG_PM_DEBUG=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -30,10 +30,8 @@ CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_INET_DIAG is not set
+CONFIG_IPV6=y
 CONFIG_CAN=m
 CONFIG_CAN_VCAN=m
 CONFIG_CAN_MCP251X=m
@@ -68,6 +66,11 @@ CONFIG_EEPROM_AT24=y
 CONFIG_EEPROM_AT25=y
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
+CONFIG_BLK_DEV_SR=y
+CONFIG_CHR_DEV_SG=y
+CONFIG_CHR_DEV_SCH=y
+CONFIG_SCSI_LOGGING=y
+CONFIG_SCSI_SCAN_ASYNC=y
 CONFIG_NETDEVICES=y
 # CONFIG_NET_VENDOR_BROADCOM is not set
 # CONFIG_NET_VENDOR_CIRRUS is not set
@@ -98,6 +101,7 @@ CONFIG_KEYBOARD_IMX=m
 # CONFIG_INPUT_MOUSE is not set
 CONFIG_INPUT_JOYSTICK=y
 CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_TSC2102=y
 # CONFIG_LEGACY_PTYS is not set
 CONFIG_SERIAL_IMX=y
 CONFIG_SERIAL_IMX_CONSOLE=y
@@ -123,16 +127,20 @@ CONFIG_USB_VIDEO_CLASS=m
 CONFIG_USB_PWC=m
 CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_SOC_CAMERA=m
+CONFIG_VIDEO_MX2=m
+CONFIG_V4L_MEM2MEM_DRIVERS=y
+CONFIG_VIDEO_CODA=m
+CONFIG_VIDEO_MX2_EMMAPRP=m
 # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
+CONFIG_SOC_CAMERA_MT9M111=m
+# CONFIG_DVB_AU8522_V4L is not set
+# CONFIG_DVB_TUNER_DIB0070 is not set
+# CONFIG_DVB_TUNER_DIB0090 is not set
 CONFIG_FB=y
-# CONFIG_FB_MX3 is not set
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
-# CONFIG_LCD_CLASS_DEVICE is not set
-CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_FB_IMX=y
+CONFIG_LCD_L4F00242T03=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
-# CONFIG_LOGO_LINUX_MONO is not set
-# CONFIG_LOGO_LINUX_VGA16 is not set
 CONFIG_SOUND=m
 CONFIG_SND=m
 CONFIG_SND_MIXER_OSS=m
@@ -150,12 +158,16 @@ CONFIG_USB_ACM=y
 CONFIG_USB_PRINTER=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_CHIPIDEA=y
+CONFIG_USB_CHIPIDEA_UDC=y
 CONFIG_USB_CHIPIDEA_HOST=y
+CONFIG_USB_CHIPIDEA_DEBUG=y
 CONFIG_USB_SERIAL=y
 CONFIG_USB_SERIAL_FTDI_SIO=y
 CONFIG_USB_SERIAL_PL2303=y
+CONFIG_NOP_USB_XCEIV=y
 CONFIG_USB_ULPI=y
 CONFIG_USB_GADGET=y
+CONFIG_USB_FSL_USB2=y
 CONFIG_USB_ETH=m
 CONFIG_USB_GADGETFS=m
 CONFIG_USB_MASS_STORAGE=m
@@ -183,7 +195,6 @@ CONFIG_IMX_SDMA=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_IIO=y
 CONFIG_MAX1027=y
-CONFIG_MAX5821=y
 CONFIG_PWM=y
 CONFIG_PWM_IMX=y
 CONFIG_EXT2_FS=y
@@ -204,6 +215,8 @@ CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_CODEPAGE_850=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_ISO8859_15=m
+CONFIG_FONTS=y
+CONFIG_FONT_8x8=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_INFO=y
 CONFIG_DEBUG_FS=y
@@ -212,5 +225,3 @@ CONFIG_DEBUG_FS=y
 # CONFIG_FTRACE is not set
 CONFIG_DEBUG_LL=y
 CONFIG_EARLY_PRINTK=y
-CONFIG_FONTS=y
-CONFIG_FONT_8x8=y
diff --git a/configs/armadeus_apf27_defconfig b/configs/armadeus_apf27_defconfig
index 457a14b02d..a87d319729 100644
--- a/configs/armadeus_apf27_defconfig
+++ b/configs/armadeus_apf27_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_arm926t=y
 
-# Linux headers same as kernel, a 4.12 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf27"
@@ -18,13 +18,14 @@ BR2_TARGET_ROOTFS_UBI=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.12.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.215"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf27/linux-4.12.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf27/linux-5.10.config"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0xA0008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx27-apf27dev"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # U-boot
 BR2_TARGET_UBOOT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
