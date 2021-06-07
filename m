From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:18:10 -0000
Subject: [Buildroot] [git commit] configs/microchip_sama5d2_icp: new
 defconfigs
Message-ID: <20210607144655.4EBF0814AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f691b698f297290fa23de0ab2befe5e6bda34a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the new SAMA5D2 ICP (Industrial Connectivity Board)
with linux4sam_2020.10 components.
Update README file with new defconfigs.

https://www.linux4sam.org/bin/view/Linux4SAM/Sama5d2IcpMainPage

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/atmel/readme.txt                          |  2 +
 board/microchip/sama5d2_icp/genimage.cfg        | 31 +++++++++++
 configs/microchip_sama5d2_icp_mmc_defconfig     | 31 +++++++++++
 configs/microchip_sama5d2_icp_mmc_dev_defconfig | 74 +++++++++++++++++++++++++
 4 files changed, 138 insertions(+)

diff --git a/board/atmel/readme.txt b/board/atmel/readme.txt
index 1f21dd15e4..a29d027214 100644
--- a/board/atmel/readme.txt
+++ b/board/atmel/readme.txt
@@ -23,6 +23,8 @@ This guide covers the following configurations:
  - microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
  - microchip_sam9x60ek_mmc_defconfig
  - microchip_sam9x60ek_mmc_dev_defconfig
+ - microchip_sama5d2_icp_mmc_defconfig
+ - microchip_sama5d2_icp_mmc_dev_defconfig
 
 These configurations will use AT91Bootstrap, u-boot and a linux kernel from
 the git trees maintained by Atmel.
diff --git a/board/microchip/sama5d2_icp/genimage.cfg b/board/microchip/sama5d2_icp/genimage.cfg
new file mode 100644
index 0000000000..854751713f
--- /dev/null
+++ b/board/microchip/sama5d2_icp/genimage.cfg
@@ -0,0 +1,31 @@
+# Image for SD card boot on Microchip SAMA5D2 ICP (Industrial Connectivity Platform)
+#
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"at91-sama5d2_icp.dtb",
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
diff --git a/configs/microchip_sama5d2_icp_mmc_defconfig b/configs/microchip_sama5d2_icp_mmc_defconfig
new file mode 100644
index 0000000000..2196555311
--- /dev/null
+++ b/configs/microchip_sama5d2_icp_mmc_defconfig
@@ -0,0 +1,31 @@
+BR2_arm=y
+BR2_cortex_a5=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_INSTRUCTIONS_THUMB2=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/microchip/sama5d2_icp/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam-2020.10)/linux-linux4sam-2020.10.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="sama5"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d2_icp"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.0-rc2)/at91bootstrap-v4.0.0-rc2.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d2_icpsd_uboot"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,u-boot-at91,linux4sam-2020.10)/u-boot-at91-linux4sam-2020.10.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d2_icp_mmc"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/microchip_sama5d2_icp_mmc_dev_defconfig b/configs/microchip_sama5d2_icp_mmc_dev_defconfig
new file mode 100644
index 0000000000..1966d4baf1
--- /dev/null
+++ b/configs/microchip_sama5d2_icp_mmc_dev_defconfig
@@ -0,0 +1,74 @@
+BR2_arm=y
+BR2_cortex_a5=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_INSTRUCTIONS_THUMB2=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_PTHREAD_DEBUG=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/microchip/sama5d2_icp/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam-2020.10)/linux-linux4sam-2020.10.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="sama5"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d2_icp"
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
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.0-rc2)/at91bootstrap-v4.0.0-rc2.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d2_icpsd_uboot"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,u-boot-at91,linux4sam-2020.10)/u-boot-at91-linux4sam-2020.10.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d2_icp_mmc"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
