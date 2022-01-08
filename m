Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87BCC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 14:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C4AF4054A;
	Sat,  8 Jan 2022 14:13:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X65yrdA-BDqZ; Sat,  8 Jan 2022 14:13:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7AD34063C;
	Sat,  8 Jan 2022 14:12:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C77A1BF2FA
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 14:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED61140106
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 14:12:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IbhyhLYlWMJS for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 14:12:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D32D3400D3
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 14:12:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7190282D32; Sat,  8 Jan 2022 14:06:33 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 15:12:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34b725c412d9771127405276052398d09f522613
X-Git-Newrev: 53d82096b67ac23185e7cbece9a93aff00f0986c
X-Patchwork-Hint: ignore
Message-Id: <20220108140633.7190282D32@busybox.osuosl.org>
Subject: [Buildroot] [git commit] qemu_arm_versatile_nommu: switch to
 in-kernel defconfig + fragment
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

commit: https://git.buildroot.net/buildroot/commit/?id=53d82096b67ac23185e7cbece9a93aff00f0986c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This platform has its own kernel defconfig in Buildroot, but we cannot
get quick idea about how much it diverged from the in-kernel defconfig.

Let's use the upstream arch/arm/config/versatile_defconfig as a base,
and maintain the diff as a merge-config fragment. The same .config is
still generated based on the 5.10.7 kernel.

The diff is quite big, but this is a good start-point for cleanups.
Follow-up works can drop diff lines unless we find a good reason for
divergence.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
[Arnout: rename linux-nommu.config to linux-nommu.fragment]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/qemu/arm-versatile/linux-nommu.config   | 47 ---------------------
 board/qemu/arm-versatile/linux-nommu.fragment | 59 +++++++++++++++++++++++++++
 configs/qemu_arm_versatile_nommu_defconfig    |  4 +-
 3 files changed, 61 insertions(+), 49 deletions(-)

diff --git a/board/qemu/arm-versatile/linux-nommu.config b/board/qemu/arm-versatile/linux-nommu.config
deleted file mode 100644
index 1d91d51a14..0000000000
--- a/board/qemu/arm-versatile/linux-nommu.config
+++ /dev/null
@@ -1,47 +0,0 @@
-# CONFIG_MMU is not set
-CONFIG_ARCH_VERSATILE=y
-CONFIG_ARM_SINGLE_ARCH_VERSATILE=y
-CONFIG_SET_MEM_PARAM=y
-CONFIG_DRAM_BASE=0x00000000
-CONFIG_DRAM_SIZE=0x08000000
-CONFIG_ARCH_VERSATILE_PB=y
-CONFIG_MACH_VERSATILE_AB=y
-CONFIG_MACH_VERSATILE_DT=y
-CONFIG_BINFMT_FLAT=y
-CONFIG_SYSVIPC=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-# CONFIG_ARCH_MULTI_V7 is not set
-CONFIG_AEABI=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_NETDEVICES=y
-CONFIG_SMC91X=y
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
diff --git a/board/qemu/arm-versatile/linux-nommu.fragment b/board/qemu/arm-versatile/linux-nommu.fragment
new file mode 100644
index 0000000000..6f1cc3f26d
--- /dev/null
+++ b/board/qemu/arm-versatile/linux-nommu.fragment
@@ -0,0 +1,59 @@
+# CONFIG_ARM_SINGLE_ARMV7M is not set
+CONFIG_ARM_SINGLE_ARCH_VERSATILE=y
+CONFIG_BINFMT_ELF_FDPIC=y
+CONFIG_BINFMT_FLAT=y
+# CONFIG_BLK_DEV_RAM is not set
+# CONFIG_CRAMFS is not set
+CONFIG_CMDLINE=""
+# CONFIG_DEBUG_FS is not set
+# CONFIG_DEBUG_KERNEL is not set
+# CONFIG_DEBUG_USER is not set
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
+# CONFIG_GPIO_PL061 is not set
+# CONFIG_HIGH_RES_TIMERS is not set
+CONFIG_HWMON=y
+# CONFIG_I2C_VERSATILE is not set
+CONFIG_INET_DIAG=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_IPV6=y
+# CONFIG_IP_MULTICAST is not set
+# CONFIG_IP_PNP is not set
+# CONFIG_MMU is not set
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
+CONFIG_DRAM_BASE=0x00000000
+CONFIG_DRAM_SIZE=0x08000000
+CONFIG_INITRAMFS_SOURCE="${BR_BINARIES_DIR}/rootfs.cpio"
+# CONFIG_PARTITION_ADVANCED is not set
+# CONFIG_OABI_COMPAT is not set
+CONFIG_PHYLIB=y
+# CONFIG_ROMFS_FS is not set
+# CONFIG_RTC_CLASS is not set
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIO_SERPORT=y
+CONFIG_SET_MEM_PARAM=y
+CONFIG_SLUB=y
+# CONFIG_SPI is not set
+# CONFIG_SYNC_FILE is not set
+# CONFIG_VFP is not set
diff --git a/configs/qemu_arm_versatile_nommu_defconfig b/configs/qemu_arm_versatile_nommu_defconfig
index 59a6efd04f..1357742703 100644
--- a/configs/qemu_arm_versatile_nommu_defconfig
+++ b/configs/qemu_arm_versatile_nommu_defconfig
@@ -32,8 +32,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
-BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-nommu.config"
+BR2_LINUX_KERNEL_DEFCONFIG="versatile"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-versatile/linux-nommu.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="versatile-pb"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
