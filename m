From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Thu, 25 Aug 2016 15:00:22 -0400
Subject: [Buildroot] [PATCH] board: add support for ZII VF610 Development
	Board
Message-ID: <20160825190022.8461-1-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for the Rev. B of a Zodiac Inflight Innovations development
board, mainly intended for DSA and ARINC 429 development work.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 board/zii/vf610dev/genimage.cfg    | 38 ++++++++++++++++++++++
 board/zii/vf610dev/linux_defconfig | 65 ++++++++++++++++++++++++++++++++++++++
 board/zii/vf610dev/post-image.sh   | 20 ++++++++++++
 board/zii/vf610dev/u-boot-env.txt  |  3 ++
 configs/zii_vf610dev_defconfig     | 24 ++++++++++++++
 5 files changed, 150 insertions(+)
 create mode 100644 board/zii/vf610dev/genimage.cfg
 create mode 100644 board/zii/vf610dev/linux_defconfig
 create mode 100755 board/zii/vf610dev/post-image.sh
 create mode 100644 board/zii/vf610dev/u-boot-env.txt
 create mode 100644 configs/zii_vf610dev_defconfig

diff --git a/board/zii/vf610dev/genimage.cfg b/board/zii/vf610dev/genimage.cfg
new file mode 100644
index 0000000..7cd9504
--- /dev/null
+++ b/board/zii/vf610dev/genimage.cfg
@@ -0,0 +1,38 @@
+image kernel.vfat {
+  vfat {
+    files = {
+      "uImage",
+      "vf610-zii-dev-rev-b.dtb",
+    }
+  }
+  size = 32M
+}
+
+image sdcard.img {
+  hdimage {
+  }
+
+  partition u-boot {
+    in-partition-table = "no"
+    image = "u-boot.imx"
+    offset = 1024
+  }
+
+  partition u-boot-env {
+    in-partition-table = "no"
+    image = "uboot-env.bin"
+    offset = 786432
+    size = 8192
+  }
+
+  partition kernel {
+    partition-type = 0xc
+    image = "kernel.vfat"
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext4"
+    size = 512M
+  }
+}
diff --git a/board/zii/vf610dev/linux_defconfig b/board/zii/vf610dev/linux_defconfig
new file mode 100644
index 0000000..ab9268e
--- /dev/null
+++ b/board/zii/vf610dev/linux_defconfig
@@ -0,0 +1,65 @@
+CONFIG_NAMESPACES=y
+CONFIG_KALLSYMS_ALL=y
+CONFIG_EMBEDDED=y
+CONFIG_ARCH_MXC=y
+CONFIG_SOC_VF610=y
+CONFIG_AEABI=y
+CONFIG_NET=y
+CONFIG_INET=y
+CONFIG_NETFILTER=y
+CONFIG_NETFILTER_DEBUG=y
+CONFIG_BRIDGE_NETFILTER=y
+CONFIG_BRIDGE=y
+CONFIG_BRIDGE_VLAN_FILTERING=y
+CONFIG_NET_DSA=y
+CONFIG_VLAN_8021Q=y
+CONFIG_NET_SWITCHDEV=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_MTD=y
+CONFIG_MTD_M25P80=y
+CONFIG_MTD_SPI_NOR=y
+CONFIG_DS1682=y
+CONFIG_EEPROM_AT24=y
+CONFIG_EEPROM_93XX46=y
+CONFIG_NETDEVICES=y
+CONFIG_NET_DSA_MV88E6XXX=y
+CONFIG_FIXED_PHY=y
+CONFIG_MDIO_BUS_MUX_GPIO=y
+CONFIG_SERIAL_FSL_LPUART=y
+CONFIG_SERIAL_FSL_LPUART_CONSOLE=y
+CONFIG_I2C=y
+CONFIG_I2C_MUX=y
+CONFIG_I2C_MUX_PCA954x=y
+#CONFIG_I2C_IMX=y
+CONFIG_SPI=y
+CONFIG_SPI_FSL_DSPI=y
+CONFIG_GPIO_PCA953X=y
+CONFIG_GPIO_PCA953X_IRQ=y
+CONFIG_SENSORS_ADT7411=y
+CONFIG_SENSORS_LM75=y
+CONFIG_WATCHDOG=y
+CONFIG_IMX2_WDT=y
+CONFIG_MFD_SYSCON=y
+# CONFIG_HID is not set
+CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_ESDHC_IMX=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_DMADEVICES=y
+CONFIG_FSL_EDMA=y
+CONFIG_IIO=y
+CONFIG_VF610_ADC=y
+CONFIG_PWM=y
+CONFIG_PWM_FSL_FTM=y
+CONFIG_EXT4_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_DYNAMIC_DEBUG=y
+CONFIG_DEBUG_FS=y
+# CONFIG_FTRACE is not set
+CONFIG_DEBUG_LL=y
+CONFIG_DEBUG_VF_UART_PORT=0
diff --git a/board/zii/vf610dev/post-image.sh b/board/zii/vf610dev/post-image.sh
new file mode 100755
index 0000000..36802c0
--- /dev/null
+++ b/board/zii/vf610dev/post-image.sh
@@ -0,0 +1,20 @@
+#!/usr/bin/env bash
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage \
+  --rootpath "${TARGET_DIR}" \
+  --tmppath "${GENIMAGE_TMP}" \
+  --inputpath "${BINARIES_DIR}" \
+  --outputpath "${BINARIES_DIR}" \
+  --config "${GENIMAGE_CFG}"
+
+RET=${?}
+
+rm -f "${BINARIES_DIR}/kernel.vfat"
+
+exit ${RET}
diff --git a/board/zii/vf610dev/u-boot-env.txt b/board/zii/vf610dev/u-boot-env.txt
new file mode 100644
index 0000000..f0adb4b
--- /dev/null
+++ b/board/zii/vf610dev/u-boot-env.txt
@@ -0,0 +1,3 @@
+ethaddr=fe:ed:de:ad:be:ef
+bootargs=console=ttyLP0,115200n8 root=/dev/mmcblk0p2 rootfstype=ext4 rw rootwait
+bootcmd=fatload mmc 0:1 0x81000000 uImage; fatload mmc 0:1 0x82000000 vf610-zii-dev-rev-b.dtb; bootm 0x81000000 - 0x82000000
diff --git a/configs/zii_vf610dev_defconfig b/configs/zii_vf610dev_defconfig
new file mode 100644
index 0000000..3d320fd
--- /dev/null
+++ b/configs/zii_vf610dev_defconfig
@@ -0,0 +1,24 @@
+BR2_arm=y
+BR2_cortex_a5=y
+BR2_TARGET_GENERIC_HOSTNAME="vf610dev"
+BR2_TARGET_GENERIC_ISSUE="Welcome to ZII VF610 Development Board"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zii/vf610dev/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/zii/vf610dev/linux_defconfig"
+BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x80008000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="vf610-zii-dev-rev-b"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="zii-vf610-dev-rev-b"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://bitbucket.org/pid1solutions/zodiac-vybrid-uboot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="ctt-fec"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_ENVIMAGE=y
+BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/zii/vf610dev/u-boot-env.txt"
+BR2_TARGET_UBOOT_ENVIMAGE_SIZE="0x2000"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.9.3
