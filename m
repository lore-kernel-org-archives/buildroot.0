From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 16 Mar 2021 23:38:21 +0900
Subject: [Buildroot] [PATCH 1/2] qemu_arm_versatile: switch to in-kernel
 defconfig + fragment
Message-ID: <20210316143822.3421019-1-masahiroy@kernel.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This platform has its own kernel defconfig in Buildroot, but we cannot
get quick idea about how much it diverged from the in-kernel defconfig.

Let's use the upstream arch/arm/config/versatile_defconfig as a base,
and maintain the diff as a merge-config fragment. The same .config is
still generated based on the 5.10.7 kernel.

The diff is quite big, but this is a good start-point for cleanups.
Follow-up works can drop diff lines unless we find a good reason for
divergence.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 board/qemu/arm-versatile/linux.config         | 43 ------------
 .../qemu/arm-versatile/linux.config.fragment  | 66 +++++++++++++++++++
 configs/qemu_arm_versatile_defconfig          |  4 +-
 3 files changed, 68 insertions(+), 45 deletions(-)
 delete mode 100644 board/qemu/arm-versatile/linux.config
 create mode 100644 board/qemu/arm-versatile/linux.config.fragment

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
diff --git a/board/qemu/arm-versatile/linux.config.fragment b/board/qemu/arm-versatile/linux.config.fragment
new file mode 100644
index 0000000000..0aed558315
--- /dev/null
+++ b/board/qemu/arm-versatile/linux.config.fragment
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
index 10dd9e52b4..f4950ca2d8 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -21,8 +21,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
-BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux.config"
+BR2_LINUX_KERNEL_DEFCONFIG="versatile"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-versatile/linux.config.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="versatile-pb"
 
-- 
2.27.0
