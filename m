Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F805C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 14:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5810160AA4;
	Sat,  8 Jan 2022 14:12:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Eg7C9CCLcmOl; Sat,  8 Jan 2022 14:12:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5ABD60B5E;
	Sat,  8 Jan 2022 14:12:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CB2581BF2FA
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 14:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C695060B23
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 14:12:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RO6oa6UfOS-z for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 14:12:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB50360AF7
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 14:12:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6913D819F0; Sat,  8 Jan 2022 14:06:33 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 15:12:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dbdd8971df4c6d57cdf27c89810b3b2c6893e82c
X-Git-Newrev: 34b725c412d9771127405276052398d09f522613
X-Patchwork-Hint: ignore
Message-Id: <20220108140633.6913D819F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] qemu_arm_versatile: switch to in-kernel
 defconfig + fragment
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

commit: https://git.buildroot.net/buildroot/commit/?id=34b725c412d9771127405276052398d09f522613
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This platform has its own kernel defconfig in Buildroot, but we cannot
get quick idea about how much it diverged from the in-kernel defconfig.

Let's use the upstream arch/arm/config/versatile_defconfig as a base,
and maintain the diff as a merge-config fragment. The same .config is
still generated (based on the 5.10.7 kernel).

The diff is quite big, but this is a good start-point for cleanups.
Follow-up works can drop diff lines unless we find a good reason for
divergence.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
[Arnout: rename linux.config to linux.fragment]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/qemu/arm-versatile/linux.config   | 43 ---------------------
 board/qemu/arm-versatile/linux.fragment | 66 +++++++++++++++++++++++++++++++++
 configs/qemu_arm_versatile_defconfig    |  4 +-
 3 files changed, 68 insertions(+), 45 deletions(-)

diff --git a/board/qemu/arm-versatile/linux.config b/board/qemu/arm-versatile/linux.config
deleted file mode 100644
index b1001d84a7..0000000000
--- a/board/qemu/arm-versatile/linux.config
+++ /dev/null
@@ -1,43 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-# CONFIG_ARCH_MULTI_V7 is not set
-CONFIG_ARCH_VERSATILE=y
-CONFIG_PCI=y
-CONFIG_PCI_VERSATILE=y
-CONFIG_AEABI=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_SCSI=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_SCSI_SYM53C8XX_2=y
-CONFIG_NETDEVICES=y
-CONFIG_8139CP=y
-CONFIG_PHYLIB=y
-CONFIG_INPUT_EVDEV=y
-CONFIG_SERIO_AMBAKMI=y
-CONFIG_LEGACY_PTY_COUNT=16
-CONFIG_SERIAL_8250=m
-CONFIG_SERIAL_8250_EXTENDED=y
-CONFIG_SERIAL_8250_MANY_PORTS=y
-CONFIG_SERIAL_8250_SHARE_IRQ=y
-CONFIG_SERIAL_8250_RSA=y
-CONFIG_SERIAL_AMBA_PL011=y
-CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
-CONFIG_I2C=y
-CONFIG_I2C_CHARDEV=m
-CONFIG_FB=y
-CONFIG_FB_ARMCLCD=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_SOUND=y
-CONFIG_SND=m
-CONFIG_SND_MIXER_OSS=m
-CONFIG_SND_PCM_OSS=m
-CONFIG_SND_ARMAACI=m
-CONFIG_EXT4_FS=y
-CONFIG_VFAT_FS=m
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_MAGIC_SYSRQ=y
diff --git a/board/qemu/arm-versatile/linux.fragment b/board/qemu/arm-versatile/linux.fragment
new file mode 100644
index 0000000000..0aed558315
--- /dev/null
+++ b/board/qemu/arm-versatile/linux.fragment
@@ -0,0 +1,66 @@
+# CONFIG_BLK_DEV_INITRD is not set
+# CONFIG_BLK_DEV_RAM is not set
+# CONFIG_CMA is not set
+# CONFIG_CRAMFS is not set
+CONFIG_CMDLINE=""
+CONFIG_CRC16=y
+CONFIG_CRYPTO=y
+# CONFIG_DEBUG_FS is not set
+# CONFIG_DEBUG_KERNEL is not set
+# CONFIG_DEBUG_USER is not set
+CONFIG_DEVTMPFS=y
+# CONFIG_DRM is not set
+# CONFIG_EEPROM_LEGACY is not set
+# CONFIG_EXT2_FS is not set
+CONFIG_EXT4_FS=y
+CONFIG_FB_ARMCLCD=y
+# CONFIG_FONTS is not set
+CONFIG_FONT_8x16=y
+CONFIG_FONT_8x8=y
+# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
+# CONFIG_FTRACE is not set
+# CONFIG_GPIOLIB is not set
+# CONFIG_HIGH_RES_TIMERS is not set
+CONFIG_HWMON=y
+CONFIG_HZ_PERIODIC=y
+# CONFIG_I2C_VERSATILE is not set
+CONFIG_INET_DIAG=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_IPV6=y
+# CONFIG_IP_MULTICAST is not set
+# CONFIG_IP_PNP is not set
+CONFIG_LOCALVERSION_AUTO=y
+# CONFIG_LOGO is not set
+CONFIG_LOG_BUF_SHIFT=17
+CONFIG_MDIO_DEVICE=y
+# CONFIG_MINIX_FS is not set
+# CONFIG_MMC is not set
+# CONFIG_MTD is not set
+# CONFIG_NEW_LEDS is not set
+# CONFIG_NFSD is not set
+# CONFIG_NFS_FS is not set
+# CONFIG_NLS_CODEPAGE_850 is not set
+# CONFIG_NLS_ISO8859_1 is not set
+# CONFIG_NO_HZ_IDLE is not set
+# CONFIG_NVMEM is not set
+# CONFIG_OABI_COMPAT is not set
+# CONFIG_PARTITION_ADVANCED is not set
+CONFIG_PCI=y
+CONFIG_PCI_VERSATILE=y
+CONFIG_PHYLIB=y
+# CONFIG_ROMFS_FS is not set
+# CONFIG_RTC_CLASS is not set
+CONFIG_SCSI=y
+CONFIG_SCSI_SPI_ATTRS=y
+CONFIG_SCSI_SYM53C8XX_2=y
+CONFIG_SERIO_SERPORT=y
+CONFIG_SLUB=y
+# CONFIG_SPI is not set
+# CONFIG_SYNC_FILE is not set
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_TMPFS_XATTR=y
+# CONFIG_VFP is not set
+# CONFIG_XZ_DEC is not set
+CONFIG_8139CP=y
+CONFIG_BLK_DEV_SD=y
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index a039c47729..5e399d17de 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -21,8 +21,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
-BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux.config"
+BR2_LINUX_KERNEL_DEFCONFIG="versatile"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-versatile/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="versatile-pb"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
