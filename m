From: Christian Stewart <christian@paral.in>
Date: Sat,  8 Aug 2020 05:39:18 -0700
Subject: [Buildroot] [PATCH v2 6/6] configs/jetsontx2_defconfig: new nvidia
 jetson tx2 defconfig
In-Reply-To: <20200808123918.1880533-1-christian@paral.in>
References: <20200808123918.1880533-1-christian@paral.in>
Message-ID: <20200808123918.1880533-6-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds support for the NVIDIA Jetson TX2.

Tested-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Christian Stewart <christian@paral.in>

v2:

 - cjs: thanks Asaf for the review
 - cjs: added Asaf tested-by

---
 board/jetsontx2             |  1 +
 board/nvidia/readme.txt     | 85 +++++++++++++++++++++++++++++++++++++
 configs/jetsontx2_defconfig | 52 +++++++++++++++++++++++
 3 files changed, 138 insertions(+)
 create mode 120000 board/jetsontx2
 create mode 100644 board/nvidia/readme.txt
 create mode 100644 configs/jetsontx2_defconfig

diff --git a/board/jetsontx2 b/board/jetsontx2
new file mode 120000
index 0000000000..fe9d31deed
--- /dev/null
+++ b/board/jetsontx2
@@ -0,0 +1 @@
+./nvidia
\ No newline at end of file
diff --git a/board/nvidia/readme.txt b/board/nvidia/readme.txt
new file mode 100644
index 0000000000..c3b248d70c
--- /dev/null
+++ b/board/nvidia/readme.txt
@@ -0,0 +1,85 @@
+NVIDIA Jetson TX2
+
+Intro
+=====
+
+This configuration adds support for the Jetson TX2 devkit. It should be
+compatible with the other Jetson-series boards as well, but has not yet been
+tested. (Other boards include the tx2i, nano...)
+
+Building
+========
+
+Configure Buildroot
+-------------------
+
+For Jetson TX2:
+
+  $ make jetsontx2_defconfig
+
+Build the rootfs
+----------------
+
+You may now build your rootfs with:
+
+  $ make
+
+
+Flashing
+========
+
+Once the build process is finished you will have the target binaries in the
+output/images directory, with a symlink to linux4tegra.
+
+Flashing to the internal eMMC is done by booting to the official recovery mode,
+and flashing the system from there. The default factory-flashed TX2 is suitable.
+
+There are a lot of cases where the TX2 will not boot properly unless all of the
+peripherals are fully disconnected, power is disconnected, everything fully
+resets, and then the power is introduced back again.
+
+The recovery mode of the Jetson is used to flash. Entering recovery:
+
+ - Start with the machine powered off + fully unplugged.
+ - Plug in the device to power, and connect a HDMI display.
+ - Connect a micro-USB cable from the host PC to the target board.
+ - Power on the device by holding the start button until the red light is lit.
+ - Hold down the RST button and REC button simultaneously.
+ - Release the RST button while holding down the REC button.
+ - Wait a few seconds, then release the REC button.
+
+To flash over USB:
+
+```
+cd output/images/linux4tegra
+sudo bash ./flash.sh \
+     -I ../rootfs.ext2 \
+     -K ../Image \
+     -L ../u-boot-dtb.bin \
+     -C "ramdisk_size=100000 net.ifnames=0 elevator=deadline" \
+     -d ../tegra186-quill-p3310-1000-c03-00-base.dtb \
+     jetson-tx2-devkit mmcblk0p1
+```
+
+This will run the `flash.sh` script from L4T, and will setup the kernel, u-boot,
+persist + boot-up partition mmcblk0p1. This may overwrite your existing work so
+use it for initial setup only.
+
+## Bootup Process
+
+The TX2 and recent boards boot from the internal eMMC, at mmcblk0p1. The Jetson
+Nano can boot to a SD card.
+
+A "secure boot" process is used, with multiple bootloaders:
+
+ - BootROM -> MB1 (TrustZone)
+ - MB2/BPMP -> (Non-Trustzone)
+ - Cboot (uses Little Kernel)
+ - Uboot
+ - Kernel
+ 
+Uboot is flashed to the mmcblk0p1 emmc partition.
+
+Cboot could be compiled from source, and the source is available from the
+official sources, however, we do not (yet) compile cboot.
+
diff --git a/configs/jetsontx2_defconfig b/configs/jetsontx2_defconfig
new file mode 100644
index 0000000000..55167a7f70
--- /dev/null
+++ b/configs/jetsontx2_defconfig
@@ -0,0 +1,52 @@
+BR2_aarch64=y
+BR2_cortex_a57=y
+
+# enable specific optimizations
+BR2_TARGET_OPTIMIZATION="-march=armv8-a+crypto -mcpu=cortex-a57+crypto"
+
+# Toolchain reference: docs.nvidia.com: "Jetson Linux Driver Package Toolchain"
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_BINUTILS_VERSION_2_32_X=y
+
+BR2_SYSTEM_DHCP="eth0"
+
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,madisongh,linux-tegra-4.9,0be1a57448010ae60505acf4e2153638455cee7c)/linux-tegra-4.9.140-r1.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="tegra"
+
+# Build the DTB from the kernel sources
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="_ddot_/_ddot_/_ddot_/_ddot_/nvidia/platform/t18x/quill/kernel-dts/tegra186-quill-p3310-1000-c03-00-base"
+
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+BR2_PACKAGE_LINUX4TEGRA=y
+BR2_PACKAGE_NVIDIA_CONTAINER_TOOLKIT=y
+
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX=y
+
+# Required tools to create the image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_JQ=y
+BR2_PACKAGE_HOST_PARTED=y
+
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="1024M"
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Uboot
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,paralin,u-boot-tegra,e6da093be3cc593ef4294e1922b3391ede9c94da)/u-boot-tegra-e6da09.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="p2771-0000-500"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_DTB_BIN=y
+
-- 
2.28.0
