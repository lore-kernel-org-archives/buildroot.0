From: Alex Suykov <alex.suykov@gmail.com>
Date: Mon, 16 Nov 2015 19:54:41 +0200
Subject: [Buildroot] [PATCH 2/2] board: add support for Chromebook Snow
In-Reply-To: <cover.1447689401.git.alex.suykov@gmail.com>
References: <cover.1447689401.git.alex.suykov@gmail.com>
Message-ID: <8ac071d88d311f605b895f6b8df18fc4bdd07d55.1447689401.git.alex.suykov@gmail.com>
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
 board/chromebook/snow/kernel.args      |   1 +
 board/chromebook/snow/kernel.its       |  34 ++++++
 board/chromebook/snow/linux-4.3.config | 170 +++++++++++++++++++++++++++++
 board/chromebook/snow/readme.txt       | 191 +++++++++++++++++++++++++++++++++
 board/chromebook/snow/sign.sh          |  32 ++++++
 configs/chromebook_snow_defconfig      |  24 +++++
 6 files changed, 452 insertions(+)
 create mode 100644 board/chromebook/snow/kernel.args
 create mode 100644 board/chromebook/snow/kernel.its
 create mode 100644 board/chromebook/snow/linux-4.3.config
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
diff --git a/board/chromebook/snow/readme.txt b/board/chromebook/snow/readme.txt
new file mode 100644
index 0000000..add8c7a
--- /dev/null
+++ b/board/chromebook/snow/readme.txt
@@ -0,0 +1,191 @@
+Samsung XE303c12 aka Chromebook Snow
+====================================
+
+This file describes booting the Chromebook from an SD card containing
+Buildroot kernel and rootfs, using the original bootloader. This is
+the least invasive way to get Buildroot onto the devices and a good
+starting point.
+
+The bootloader will only boot a kernel from a GPT partition with specific
+attributes set, and the kernel image must be "signed" with a chromeos-specific
+utility. The "signing" part is done by sign.sh script in this directory.
+
+It does not really matter where rootfs is as long as the kernel is able
+to find it, but this particular configuration assumes the kernel is on
+partition 1 and rootfs is on partition 2 of the SD card.
+
+Start by configuring and building the images.
+
+	make chromebook_snow_defconfig
+	make menuconfig # if necessary
+	make
+
+The important files are uImage.kpart (kernel and device tree, signed)
+and rootfs.tar, located in output/images/.
+
+
+Partitioning the SD card
+------------------------
+Figure out the device name for the card on the host system. Typically
+it is either /dev/sdX or /dev/mmcblkX.
+
+	SD=/dev/sdb
+
+DOUBLE CHECK THE DEVICE NAME! The commands below will destroy and partially
+overwrite partitions on that device. Also make sure you have appropriate
+write permissions.
+
+You will need cgpt utility from vboot-utils package:
+
+	CGPT=output/host/usr/bin/cgpt
+
+First, erase and create a new GPT:
+
+	$CGPT create -z $SD
+	$CGPT create $SD	# ignore complaints about invalid GPT
+
+Take a look at the table:
+
+	$CGPT show $SD
+	       start        size    part  contents
+	           0           1          PMBR
+	           1           1          Pri GPT header
+	           2          32          Pri GPT table
+	    15564767          32          Sec GPT table
+	    15564799           1          Sec GPT header
+
+All offsets and sizes are in 512-blocks, and this table is from a 8GB SD card.
+Decide partition sizes. The kernel and the rootfs partition must fit between
+Pri and Sec GPT tables. It is also a good idea to have everything aligned
+at 8KB (16 blocks) boundary.
+
+	start=$[(2+32+15)&~15]
+	kernelsize=$[8*1024*2]			# 8MB in 512 blocks
+	rootfssize=$[(15564767-kernelsize-start)&~15]
+
+Create the partitions, marking the kernel partition as bootable.
+
+	$CGPT add -i 1 -b $start -s $kernelsize \
+		-t kernel -l kernel\
+		-S 1 -T 1 -P 10 $SD
+	$CGPT add -i 2 -b $[start+kernelsize] -s $rootfssize \
+		-t data -l rootfs $SD
+
+Check the resulting GPT:
+
+	$CGPT show $SD
+	       start        size    part  contents
+	           0           1          PMBR
+	           1           1          Pri GPT header
+	           2          32          Pri GPT table
+	          48       16384       1  Label: "kernel"
+	                                  Type: ChromeOS kernel
+	                                  UUID: ...
+	                                  Attr: priority=10 tries=1 successful=1
+	       16432    15548320       2  Label: "rootfs"
+	                                  Type: Linux data
+	                                  UUID: ...
+	    15564767          32          Sec GPT table
+	    15564799           1          Sec GPT header
+
+Natually this only needs to be done once per card.
+
+
+Writing kernel and rootfs to the SD card
+----------------------------------------
+Write .kpart directly to the bootable partition:
+
+	dd if=output/images/uImage.kpart of=${SD}1
+
+Make a new filesystem on the rootfs parition, and unpack fs image there:
+
+	mkfs.ext4 ${SD}2
+	mount ${SD2} /mnt/<ROOTFS-PARTITION>
+	tar -xvf output/images/rootfs.tar -C /mnt/<ROOTFS-PARTITION>
+	umount /mnt/<ROOTFS-PARTITION>
+
+This will require root permissions even if you can write to $SD.
+
+Alternatively, just write the fs image directly to the partition:
+
+	dd if=output/images/rootfs.ext2 of=${SD}2
+
+Select ext* fs image in menuconfig before doing this, and consider specifying
+extra fs size to have some empty space available there.
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
+Press Ctrl-U at this screen to boot from SD (or USB)
+Press Power to power it off.
+Do NOT press Space unless you mean it.
+This will switch it back to normal mode.
+
+The is no way to get rid of the white screen without re-flashing the bootloader.
+
+
+Troubleshooting
+---------------
+Ctrl-U on the white screen followed by a loud *BEEP* and a return to the white
+screen means there's no valid partition to boot from.
+Which in turn means either bad GPT or improperly signed kernel.
+
+Return to the white screen without any sounds means the code managed to reboot
+the board. May indicate properly signed but invalid image. Blank screen means
+the image is valid and properly signed but cannot boot for some reason, like
+missing or incorrect DT.
+
+In case the board becomes unresponsible:
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
+Kernel command line
+-------------------
+The command line is taken from board/chromebook/kernel.args and stored
+in the vboot header (which also holds the signature).
+To change it, edit the file, run make to rebuild the signed image (there is
+no need to rebuild the plain zImage) and write it to the kernel partition on SD.
+
+The original bootloader prepends "cros_secure console= " to the supplied
+command line. The only way to suppress this is to enable CMDLINE_FORCE in the
+kernel config, disabling external command line completely.
+
+However, this is not necessary. The mainline kernel ignores cros_secure,
+and supplying console=tty1 in kernel.args undoes the effect of console=
+
+Booting with effective console= suppresses all kernel output.
+As a side effect, it makes /dev/console unusable, which init in use must
+be able to handle.
+
+
+WiFi card
+---------
+Run modprobe mwifiex_sdio to load the driver.
+Network device name is typically mlan0.
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
index 0000000..9a621b2
--- /dev/null
+++ b/board/chromebook/snow/sign.sh
@@ -0,0 +1,32 @@
+#!/bin/sh
+
+run() { echo "$@"; "$@"; }
+
+if [ -z "$BINARIES_DIR" -o -z "$HOST_DIR" ]; then
+	echo "BINARIES_DIR and HOST_DIR must be set" >&2
+	exit 1
+fi
+
+board=$PWD/board/chromebook/snow
+mkimage=$HOST_DIR/usr/bin/mkimage
+futility=$HOST_DIR/usr/bin/futility
+devkeys=$HOST_DIR/usr/share/vboot/devkeys
+
+cd "$BINARIES_DIR" || exit 1
+
+cp $board/kernel.its kernel.its || exit 1
+run $mkimage -f kernel.its uImage.itb
+
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
index 0000000..631ed73
--- /dev/null
+++ b/configs/chromebook_snow_defconfig
@@ -0,0 +1,17 @@
+BR2_arm=y
+BR2_cortex_a15=y
+BR2_BINUTILS_VERSION_2_25_X=y
+BR2_GCC_VERSION_5_X=y
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+BR2_TARGET_GENERIC_GETTY_TERM="linux"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/chromebook/snow/sign.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/chromebook/snow/linux-4.3.config"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="exynos5250-snow"
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8797=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_VBOOT_UTILS=y
-- 
2.0.3
