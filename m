From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri,  3 May 2013 10:22:05 +0200
Subject: [Buildroot] [PATCH 3/3] configs: add defconfig for Atmel
	AT91SAM9260-EK Nand Flash Boot
In-Reply-To: <1367569325-30867-1-git-send-email-fabio.porcedda@gmail.com>
References: <1367569325-30867-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1367569325-30867-4-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a configuration that provides a basic setup for generating
bootable nandflash images:
- at91bootstrap
- barebox
- kernel
- rootfs

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 .../linux-ARM-at91-enable-nand-ubifs-boot.patch    | 44 ++++++++++++++++++++++
 configs/at91sam9260eknf_defconfig                  | 14 +++++++
 2 files changed, 58 insertions(+)
 create mode 100644 board/atmel/at91sam9260ek/linux-ARM-at91-enable-nand-ubifs-boot.patch
 create mode 100644 configs/at91sam9260eknf_defconfig

diff --git a/board/atmel/at91sam9260ek/linux-ARM-at91-enable-nand-ubifs-boot.patch b/board/atmel/at91sam9260ek/linux-ARM-at91-enable-nand-ubifs-boot.patch
new file mode 100644
index 0000000..e71a487
--- /dev/null
+++ b/board/atmel/at91sam9260ek/linux-ARM-at91-enable-nand-ubifs-boot.patch
@@ -0,0 +1,44 @@
+From 17f439282c3fc92587e60935ff9efd13ea78e353 Mon Sep 17 00:00:00 2001
+From: Fabio Porcedda <fabio.porcedda@gmail.com>
+Date: Tue, 15 Jan 2013 11:17:42 +0100
+Subject: [PATCH] ARM: at91: enable nand ubifs boot
+
+Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
+---
+ arch/arm/configs/at91sam9260_defconfig | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/arch/arm/configs/at91sam9260_defconfig b/arch/arm/configs/at91sam9260_defconfig
+index 505b376..a438192 100644
+--- a/arch/arm/configs/at91sam9260_defconfig
++++ b/arch/arm/configs/at91sam9260_defconfig
+@@ -1,5 +1,6 @@
+ CONFIG_EXPERIMENTAL=y
+ # CONFIG_LOCALVERSION_AUTO is not set
++CONFIG_KERNEL_LZO=y
+ # CONFIG_SWAP is not set
+ CONFIG_SYSVIPC=y
+ CONFIG_LOG_BUF_SHIFT=14
+@@ -43,6 +44,11 @@ CONFIG_IP_PNP_BOOTP=y
+ # CONFIG_INET_LRO is not set
+ # CONFIG_IPV6 is not set
+ CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
++CONFIG_MTD=y
++CONFIG_MTD_CMDLINE_PARTS=y
++CONFIG_MTD_NAND=y
++CONFIG_MTD_NAND_ATMEL=y
++CONFIG_MTD_UBI=y
+ CONFIG_BLK_DEV_RAM=y
+ CONFIG_BLK_DEV_RAM_SIZE=8192
+ CONFIG_SCSI=y
+@@ -82,6 +88,7 @@ CONFIG_RTC_DRV_AT91SAM9=y
+ CONFIG_EXT2_FS=y
+ CONFIG_VFAT_FS=y
+ CONFIG_TMPFS=y
++CONFIG_UBIFS_FS=y
+ CONFIG_CRAMFS=y
+ CONFIG_NLS_CODEPAGE_437=y
+ CONFIG_NLS_CODEPAGE_850=y
+-- 
+1.8.0.3
+
diff --git a/configs/at91sam9260eknf_defconfig b/configs/at91sam9260eknf_defconfig
new file mode 100644
index 0000000..633451f
--- /dev/null
+++ b/configs/at91sam9260eknf_defconfig
@@ -0,0 +1,14 @@
+BR2_arm=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
+BR2_PACKAGE_HOST_SAM_BA=y
+BR2_TARGET_ROOTFS_UBIFS=y
+BR2_TARGET_ROOTFS_UBI=y
+BR2_TARGET_AT91BOOTSTRAP=y
+BR2_TARGET_AT91BOOTSTRAP_BOARD="at91sam9260ek"
+BR2_TARGET_AT91BOOTSTRAP_NANDFLASH=y
+BR2_TARGET_BAREBOX=y
+BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="at91sam9260ek"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_PATCH="board/atmel/at91sam9260ek"
+BR2_LINUX_KERNEL_DEFCONFIG="at91sam9260"
+BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.8.1.4
