From: Alex Suykov <alex.suykov@gmail.com>
Date: Wed, 18 Nov 2015 05:29:26 +0200
Subject: [Buildroot] [PATCH 2/2 v2] board: add support for Chromebook Snow
In-Reply-To: <cover.1447689401.git.alex.suykov@gmail.com>
References: <cover.1447689401.git.alex.suykov@gmail.com>
Message-ID: <0842f95057a44ce2b3386f81c24ea544d809a31f.1447815621.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samsung XE303C12 aka Chromebook Snow is an Exynos5250-based netbook.

There is barely anything special about this target as far as toolchain
is concerned, but its bootloader only accepts signed kernel images
in a Chromium OS specific format, and is not controllable otherwise.

This config provides a script for building the proper kernel blobs,
and a short manual for booting Buildroot images on the device.

The kernel defconfig is also provided. Mainline kernel already
has exynos_defconfig which could have been used here, but it builds
mwifiex statically, and that module tries to load its firmware during
initialization.

Since the board was going to get a custom kernel config anyway,
exynos_defconfig was trimmed to only include the drivers needed
for this particular chip and this particular board.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
v2: script to make complete SD card image
    explicit kernel version in defconfig
    comments and text updates

 board/chromebook/snow/kernel.args      |   1 +
 board/chromebook/snow/kernel.its       |  34 +++++++
 board/chromebook/snow/linux-4.3.config | 161 +++++++++++++++++++++++++++++++++
 board/chromebook/snow/mksd.sh          |  72 +++++++++++++++
 board/chromebook/snow/readme.txt       | 145 +++++++++++++++++++++++++++++
 board/chromebook/snow/sign.sh          |  44 +++++++++
 configs/chromebook_snow_defconfig      |  22 +++++
 7 files changed, 479 insertions(+)
 create mode 100644 board/chromebook/snow/kernel.args
 create mode 100644 board/chromebook/snow/kernel.its
 create mode 100644 board/chromebook/snow/linux-4.3.config
 create mode 100755 board/chromebook/snow/mksd.sh
 create mode 100644 board/chromebook/snow/readme.txt
 create mode 100755 board/chromebook/snow/sign.sh
 create mode 100644 configs/chromebook_snow_defconfig

diff --git a/board/chromebook/snow/kernel.args b/board/chromebook/snow/kernel.args
new file mode 100644
index 0000000..1220bf8
--- /dev/null
+++ b/board/chromebook/snow/kernel.args
@@ -0,0 +1 @@
+console=tty1 clk_ignore_unused root=/dev/mmcblk1p2 rootfstype=ext4 ro
diff --git a/board/chromebook/snow/kernel.its b/board/chromebook/snow/kernel.its
new file mode 100644
index 0000000..33f2c00
--- /dev/null
+++ b/board/chromebook/snow/kernel.its
@@ -0,0 +1,34 @@
+/dts-v1/;
+
+/ {
+    description = "Buildroot kernel for Chromebook Snow";
+    images {
+        kernel at 1{
+            description = "kernel";
+            data = /incbin/("zImage");
+            type = "kernel";
+            arch = "arm";
+            os = "linux";
+            compression = "none";
+            load = <0x40008000>;
+            entry = <0x40008000>;
+        };
+        fdt at 1{
+            description = "exynos5250-snow.dtb";
+            data = /incbin/("exynos5250-snow.dtb");
+            type = "flat_dt";
+            arch = "arm";
+            compression = "none";
+            hash at 1{
+                algo = "sha1";
+            };
+        };
+    };
+    configurations {
+        default = "conf at 1";
+        conf at 1{
+            kernel = "kernel at 1";
+            fdt = "fdt at 1";
+        };
+    };
+};
diff --git a/board/chromebook/snow/linux-4.3.config b/board/chromebook/snow/linux-4.3.config
new file mode 100644
index 0000000..8c7be6d
--- /dev/null
+++ b/board/chromebook/snow/linux-4.3.config
@@ -0,0 +1,161 @@
+CONFIG_NO_HZ_IDLE=y
+# CONFIG_COMPAT_BRK is not set
+CONFIG_MODULES=y
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_ARCH_EXYNOS=y
+# CONFIG_ARCH_EXYNOS4 is not set
+# CONFIG_SOC_EXYNOS5260 is not set
+# CONFIG_SOC_EXYNOS5410 is not set
+# CONFIG_SOC_EXYNOS5420 is not set
+# CONFIG_SOC_EXYNOS5440 is not set
+CONFIG_SMP=y
+CONFIG_HAVE_ARM_ARCH_TIMER=y
+CONFIG_BIG_LITTLE=y
+CONFIG_BL_SWITCHER=y
+CONFIG_NR_CPUS=8
+CONFIG_PREEMPT=y
+CONFIG_AEABI=y
+CONFIG_HIGHMEM=y
+CONFIG_CMA=y
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CPU_FREQ=y
+CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
+CONFIG_CPUFREQ_DT=y
+CONFIG_CPU_IDLE=y
+CONFIG_ARM_EXYNOS_CPUIDLE=y
+CONFIG_VFP=y
+CONFIG_NEON=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_NET_KEY=y
+CONFIG_INET=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_IP_PNP_RARP=y
+CONFIG_CFG80211=y
+CONFIG_RFKILL_REGULATOR=y
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_DMA_CMA=y
+CONFIG_CMA_SIZE_MBYTES=64
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_CRYPTOLOOP=y
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_CHR_DEV_SG=y
+CONFIG_MD=y
+CONFIG_BLK_DEV_DM=m
+CONFIG_DM_CRYPT=m
+CONFIG_NETDEVICES=y
+# CONFIG_ETHERNET is not set
+CONFIG_PHYLIB=y
+CONFIG_USB_NET_DRIVERS=m
+CONFIG_USB_USBNET=m
+CONFIG_USB_NET_SMSC75XX=m
+CONFIG_USB_NET_SMSC95XX=m
+CONFIG_MWIFIEX=m
+CONFIG_MWIFIEX_SDIO=m
+# CONFIG_INPUT_MOUSEDEV is not set
+CONFIG_INPUT_EVDEV=y
+# CONFIG_KEYBOARD_ATKBD is not set
+CONFIG_KEYBOARD_GPIO=y
+CONFIG_KEYBOARD_CROS_EC=y
+# CONFIG_MOUSE_PS2 is not set
+CONFIG_MOUSE_CYAPA=y
+# CONFIG_SERIO is not set
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_SAMSUNG=y
+CONFIG_SERIAL_SAMSUNG_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_HW_RANDOM=y
+CONFIG_TCG_TPM=y
+CONFIG_TCG_TIS_I2C_INFINEON=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_MUX=y
+CONFIG_I2C_ARB_GPIO_CHALLENGE=y
+CONFIG_I2C_GPIO=y
+CONFIG_I2C_CROS_EC_TUNNEL=y
+CONFIG_SPI=y
+CONFIG_SPI_S3C64XX=y
+CONFIG_POWER_SUPPLY=y
+CONFIG_BATTERY_SBS=y
+CONFIG_CHARGER_TPS65090=y
+CONFIG_CPU_THERMAL=y
+CONFIG_WATCHDOG=y
+CONFIG_S3C2410_WATCHDOG=y
+CONFIG_MFD_CROS_EC=y
+CONFIG_MFD_CROS_EC_I2C=y
+CONFIG_MFD_CROS_EC_SPI=y
+CONFIG_MFD_MAX77686=y
+CONFIG_MFD_SEC_CORE=y
+CONFIG_MFD_TPS65090=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_GPIO=y
+CONFIG_REGULATOR_MAX77686=y
+CONFIG_REGULATOR_TPS65090=y
+CONFIG_DRM=y
+CONFIG_DRM_EXYNOS=y
+CONFIG_DRM_EXYNOS_FIMD=y
+CONFIG_DRM_EXYNOS_DSI=y
+CONFIG_DRM_EXYNOS_HDMI=y
+CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=y
+CONFIG_DRM_NXP_PTN3460=y
+CONFIG_DRM_PARADE_PS8622=y
+CONFIG_FB_SIMPLE=y
+CONFIG_EXYNOS_VIDEO=y
+CONFIG_EXYNOS_MIPI_DSI=y
+CONFIG_LCD_CLASS_DEVICE=y
+CONFIG_LCD_PLATFORM=y
+CONFIG_BACKLIGHT_PWM=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_SOC=y
+CONFIG_SND_SOC_SAMSUNG=y
+CONFIG_SND_SOC_SNOW=y
+CONFIG_HID_GENERIC=m
+CONFIG_USB_HID=m
+CONFIG_USB=y
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_EXYNOS=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_OHCI_EXYNOS=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_DWC3=y
+CONFIG_USB_HSIC_USB3503=y
+CONFIG_USB_GADGET=y
+CONFIG_MMC=y
+CONFIG_MMC_BLOCK_MINORS=16
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_S3C=y
+CONFIG_MMC_SDHCI_S3C_DMA=y
+CONFIG_MMC_DW=y
+CONFIG_MMC_DW_IDMAC=y
+CONFIG_MMC_DW_EXYNOS=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_MAX77686=y
+CONFIG_RTC_DRV_S3C=y
+CONFIG_DMADEVICES=y
+CONFIG_PL330_DMA=y
+CONFIG_CROS_EC_CHARDEV=y
+CONFIG_COMMON_CLK_MAX77686=y
+CONFIG_COMMON_CLK_MAX77802=y
+CONFIG_COMMON_CLK_S2MPS11=y
+CONFIG_EXYNOS_IOMMU=y
+CONFIG_EXTCON=y
+CONFIG_IIO=y
+CONFIG_EXYNOS_ADC=y
+CONFIG_PWM=y
+CONFIG_PWM_SAMSUNG=y
+CONFIG_PHY_EXYNOS5250_SATA=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
+# CONFIG_ARM_UNWIND is not set
diff --git a/board/chromebook/snow/mksd.sh b/board/chromebook/snow/mksd.sh
new file mode 100755
index 0000000..539eed7
--- /dev/null
+++ b/board/chromebook/snow/mksd.sh
@@ -0,0 +1,72 @@
+#!/bin/sh
+
+# This scripts makes a minimal bootable SD card image for the Chromebook.
+# The resulting file is called bootsd.img. It should be written directly
+# to the card:
+#
+#	SD=/dev/mmcblk1		# check your device name!
+#	dd if=output/images/bootsd.img of=$SD
+#
+# The partitions are created just large enough to hold the kernel and
+# the rootfs image. Most of the card will be empty, and the secondary
+# GPT will not be in its proper location.
+
+output_images=${BINARIES_DIR:-output/images}
+output_host=${HOST_DIR:-output/host}
+
+# cgpt does not create protective MBR, and the kernel refuses to read
+# GPT unless there's some kind of MBR in sector 0. So we need parted
+# to write that single sector before doing anything with the GPT.
+cgpt=$output_host/usr/bin/cgpt
+parted=$output_host/usr/sbin/parted
+kernel=$output_images/uImage.kpart
+rootfs=$output_images/rootfs.ext2
+
+run() { echo "$@"; "$@"; }
+die() { echo "$@" >&2; exit 1; }
+test -f $kernel || die "No kernel image found"
+test -f $rootfs || die "No rootfs image found"
+test -x $cgpt || die "cgpt not found (host-vboot-utils have not been built?)"
+
+# True file sizes in bytes
+kernelsize=`stat -t $kernel | cut -d\  -f2`
+rootfssize=`stat -t $rootfs | cut -d\  -f2`
+
+# The card is partitioned in sectors of 8KB.
+# 4 sectors are reserved for MBR+GPT. Their actual size turns out
+# to be 33 512-blocks which is just over 2 sectors, but we align
+# it to a nice round number.
+sec=8192
+kernelsec=$[(kernelsize+8191)>>13]
+rootfssec=$[(rootfssize+8191)>>13]
+headersec=4
+
+# There is also a copy of MBR+GPT at the end of the image.
+# It's going to be useless but both tools assume it's there.
+imagesec=$[2*headersec+kernelsec+rootfssec]
+bootsd="$output_images/bootsd.img"
+run dd bs=$sec count=$imagesec if=/dev/zero of=$bootsd
+
+# cgpt needs offsets and sizes in 512-blocks.
+block=512
+kernelstart=$[headersec<<4]
+kernelblocks=$[kernelsec<<4]
+rootfsblocks=$[rootfssec<<4]
+rootfsstart=$[kernelstart+kernelblocks]
+
+# This command initializes both GPT and MBR
+run $parted -s $bootsd mklabel gpt
+
+# The kernel partition must be marked as bootable, that's why -S -T -P
+run $cgpt add -i 1 -b $kernelstart -s $kernelblocks \
+	-t kernel -l kernel \
+	-S 1 -T 1 -P 10 $bootsd
+
+# It does not really matter where the rootfs partition is located as long
+# as the kernel can find it.
+# However, if anything is changed here, kernel.args must be updated as well.
+run $cgpt add -i 2 -b $rootfsstart -s $rootfsblocks \
+	-t data -l rootfs $bootsd
+
+run dd bs=$block if=$kernel of=$bootsd seek=$kernelstart
+run dd bs=$block if=$rootfs of=$bootsd seek=$rootfsstart
diff --git a/board/chromebook/snow/readme.txt b/board/chromebook/snow/readme.txt
new file mode 100644
index 0000000..4c2d8f5
--- /dev/null
+++ b/board/chromebook/snow/readme.txt
@@ -0,0 +1,145 @@
+Samsung XE303C12 aka Chromebook Snow
+====================================
+
+This file describes booting the Chromebook from an SD card containing
+Buildroot kernel and rootfs, using the original bootloader. This is
+the least invasive way to get Buildroot onto the devices and a good
+starting point.
+
+The bootloader will only boot a kernel from a GPT partition marked
+bootable with cgpt tool from vboot-utils package.
+The kernel image must be signed using futility from the same package.
+The signing part is done by sign.sh script in this directory.
+
+It does not really matter where rootfs is as long as the kernel is able
+to find it, but this particular configuration assumes the kernel is on
+partition 1 and rootfs is on partition 2 of the SD card.
+Make sure to check kernel.args if you change this.
+
+
+Making the boot media
+---------------------
+Start by configuring and building the images.
+
+	make chromebook_snow_defconfig
+	make menuconfig # if necessary
+	make
+
+The important files are:
+
+	uImage.kpart (kernel and device tree, signed)
+	rootfs.tar
+	bootsd.img (SD card image containing both kernel and rootfs)
+
+Write the image directly to some SD card.
+WARNING: make sure there is nothing important on that card,
+and double-check the device name!
+
+	SD=/dev/mmcblk1		# may be /dev/sdX on some hosts
+	dd if=output/images/bootsd.img of=$SD
+
+
+Switching to developer mode and booting from SD
+-----------------------------------------------
+Power Chromebook down, then power it up while holding Esc+F3.
+BEWARE: switching to developer mode deletes all user data.
+Create backups if you need them.
+
+While in developer mode, Chromebook will boot into a white screen saying
+"OS verification is off".
+
+Press Ctrl-D at this screen to boot ChromeOS from eMMC.
+Press Ctrl-U@this screen to boot from SD (or USB)
+Press Power to power it off.
+Do NOT press Space unless you mean it.
+This will switch it back to normal mode.
+
+The is no way to get rid of the white screen without re-flashing the bootloader.
+
+
+Troubleshooting
+---------------
+Loud *BEEP* after pressing Ctrl-U means there's no valid partition to boot from.
+Which in turn means either bad GPT or improperly signed kernel.
+
+Return to the OS verification screen without any sounds means the code managed
+to reboot the board. May indicate properly signed but invalid image.
+
+Blank screen means the image is valid and properly signed but cannot boot
+for some reason, like missing or incorrect DT.
+
+In case the board becomes unresponsive:
+
+* Press Esc+F3+Power. The board should reboot instantly.
+  Remove SD card to prevent it from attempting a system recovery.
+
+* Hold Power button for around 10s. The board should shut down into
+  its soft-off mode. Press Power button again or open the lid to turn in on.
+
+* If that does not work, disconnect the charger and push a hidden
+  button on the underside with a pin of some sort. The board should shut
+  down completely. Opening the lid and pressing Power button will not work.
+  To turn it back on, connect the charger.
+
+
+Partitioning SD card manually
+----------------------------
+Check mksd.sh for partitioning commands.
+
+Use parted and cgpt on a real device, and calculate the partition
+sizes properly. The kernel partition may be as small as 4MB, but
+you will probably want the rootfs to occupy the whole remaining space.
+
+cgpt may be used to check current layout:
+
+	output/hosst/usr/bin/cgpt show $SD
+
+All sizes and all offsets are in 512-byte blocks.
+
+
+Writing kernel and rootfs to a partitioned SD card
+--------------------------------------------------
+Write .kpart directly to the bootable partition:
+
+	dd if=output/images/uImage.kpart of=${SD}1
+
+Make a new filesystem on the rootfs partition, and unpack rootfs.tar there:
+
+	mkfs.ext4 ${SD}2
+	mount ${SD2} /mnt/<ROOTFS-PARTITION>
+	tar -xvf output/images/rootfs.tar -C /mnt/<ROOTFS-PARTITION>
+	umount /mnt/<ROOTFS-PARTITION>
+
+This will require root permissions even if you can write to $SD.
+
+
+Kernel command line
+-------------------
+The command line is taken from board/chromebook/kernel.args and stored
+in the vboot header (which also holds the signature).
+
+The original bootloader prepends "cros_secure console= " to the supplied
+command line. The only way to suppress this is to enable CMDLINE_FORCE
+in the kernel config, disabling external command line completely.
+
+That's not necessary however. The mainline kernel ignores cros_secure,
+and supplying console=tty1 in kernel.args undoes the effect of console=
+
+Booting with console= suppresses all kernel output.
+As a side effect, it makes /dev/console unusable, which init in use must
+be able to handle.
+
+
+WiFi card
+---------
+Run modprobe mwifiex_sdio to load the driver.
+Network device name should be mlan0.
+
+
+Further reading
+---------------
+https://www.chromium.org/chromium-os/developer-information-for-chrome-os-devices/samsung-arm-chromebook
+http://linux-exynos.org/wiki/Samsung_Chromebook_XE303C12/Installing_Linux
+http://archlinuxarm.org/platforms/armv7/samsung/samsung-chromebook
+http://www.de7ec7ed.com/2013/05/application-processor-ap-uart-samsung.html
+http://www.de7ec7ed.com/2013/05/embedded-controller-ec-uart-samsung.html
diff --git a/board/chromebook/snow/sign.sh b/board/chromebook/snow/sign.sh
new file mode 100755
index 0000000..cdd9781
--- /dev/null
+++ b/board/chromebook/snow/sign.sh
@@ -0,0 +1,44 @@
+#!/bin/sh
+
+# This script creates u-boot FIT image containing the kernel and the DT,
+# then signs it using futility from vboot-utils.
+# The resulting file is called uImage.kpart.
+
+output_images=${BINARIES_DIR:-$PWD/output/images}
+output_host=${HOST_DIR:-$PWD/output/host}
+
+board=$PWD/board/chromebook/snow
+mkimage=$output_host/usr/bin/mkimage
+futility=$output_host/usr/bin/futility
+devkeys=$output_host/usr/share/vboot/devkeys
+
+run() { echo "$@"; "$@"; }
+die() { echo "$@" >&2; exit 1; }
+test -f $output_images/zImage || \
+	die "No kernel image found"
+test -x $mkimage || \
+	die "No mkimage found (host-uboot-tools has not been built?)"
+test -x $futility || \
+	die "No futility found (host-vboot-utils has not been built?)"
+
+# kernel.its references zImage and exynos5250-snow.dtb, and all three
+# files must be in current directory for mkimage.
+run cd $output_images || exit 1
+cp $board/kernel.its ./kernel.its || exit 1
+run $mkimage -f kernel.its uImage.itb
+
+# futility requires non-empty file to be supplied with --bootloader
+# even if it does not make sense for the target platform.
+echo > dummy.txt
+
+run $futility vbutil_kernel \
+	--keyblock $devkeys/kernel.keyblock \
+	--signprivate $devkeys/kernel_data_key.vbprivk \
+	--arch arm \
+	--version 1 \
+	--config $board/kernel.args \
+	--vmlinuz uImage.itb \
+	--bootloader dummy.txt \
+	--pack uImage.kpart
+
+rm -f kernel.its dummy.txt
diff --git a/configs/chromebook_snow_defconfig b/configs/chromebook_snow_defconfig
new file mode 100644
index 0000000..5df3141
--- /dev/null
+++ b/configs/chromebook_snow_defconfig
@@ -0,0 +1,23 @@
+BR2_arm=y
+BR2_cortex_a15=y
+BR2_KERNEL_HEADERS_4_3=y
+BR2_BINUTILS_VERSION_2_25_X=y
+BR2_GCC_VERSION_5_X=y
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+BR2_TARGET_GENERIC_GETTY_TERM="linux"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/chromebook/snow/sign.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/chromebook/snow/mksd.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_SAME_AS_HEADERS=y
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/chromebook/snow/linux-4.3.config"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="exynos5250-snow"
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8797=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_PARTED=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_VBOOT_UTILS=y
-- 
2.0.3
