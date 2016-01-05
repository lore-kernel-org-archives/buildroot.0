From: Alex Suykov <alex.suykov@gmail.com>
Date: Tue, 5 Jan 2016 19:00:13 +0200
Subject: [Buildroot] [PATCH 2/2 v4] board: add support for Chromebook Snow
Message-ID: <20160105170013.GA18795@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chromebook Snow (Samsung XE303C12) is an Exynos 5 board with
a keyboard, an 11 inch screen and a battery attached.
It is relatively developer-friendly and can run mainline Linux
kernels with little to no effort.

There is barely anything special about this target as far as toolchain
is concerned, but its bootloader only accepts signed kernel images
in a Chromium OS specific format, and is not controllable otherwise.

This config provides a script for building the proper kernel blobs,
and a short manual for booting Buildroot images on this device.

In-tree exynos_defconfig is used for the kernel, with a fragment
to change mwifiex into a module. When built statically, mwifiex
attempts to load its firmware before rootfs is mounted and fails.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
v2: script to make complete SD card image
    explicit kernel version in defconfig
    comments and text updates
v3: host-dtc dependency
    text tweaks
v4: in-tree defconfig + fragment instead of custom kernel config
    scripts updated to use buildroot's *_DIR variables directly
    device tree tpm patch for nv-uboot
    minor text fixes

 board/chromebook/snow/kernel.args             |   1 +
 board/chromebook/snow/kernel.its              |  37 +++++++
 board/chromebook/snow/linux-4.3-dts-tpm.patch |  26 +++++
 board/chromebook/snow/linux-4.3.fragment      |   2 +
 board/chromebook/snow/mksd.sh                 |  69 +++++++++++++
 board/chromebook/snow/readme.txt              | 137 ++++++++++++++++++++++++++
 board/chromebook/snow/sign.sh                 |  41 ++++++++
 configs/chromebook_snow_defconfig             |  25 +++++
 8 files changed, 338 insertions(+)
 create mode 100644 board/chromebook/snow/kernel.args
 create mode 100644 board/chromebook/snow/kernel.its
 create mode 100644 board/chromebook/snow/linux-4.3-dts-tpm.patch
 create mode 100644 board/chromebook/snow/linux-4.3.fragment
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
index 0000000..c8766ef
--- /dev/null
+++ b/board/chromebook/snow/kernel.its
@@ -0,0 +1,37 @@
+/dts-v1/;
+
+/ {
+    description = "Buildroot kernel for Chromebook Snow";
+    images {
+        kernel at 1 {
+            description = "kernel";
+            data = /incbin/("zImage");
+            type = "kernel_noload";
+            arch = "arm";
+            os = "linux";
+            compression = "none";
+            load = <0>;
+            entry = <0>;
+            hash at 1 {
+                algo = "sha1";
+            };
+        };
+        fdt at 1{
+            description = "exynos5250-snow.dtb";
+            data = /incbin/("exynos5250-snow.dtb");
+            type = "flat_dt";
+            arch = "arm";
+            compression = "none";
+            hash at 1 {
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
diff --git a/board/chromebook/snow/linux-4.3-dts-tpm.patch b/board/chromebook/snow/linux-4.3-dts-tpm.patch
new file mode 100644
index 0000000..4a9dd85
--- /dev/null
+++ b/board/chromebook/snow/linux-4.3-dts-tpm.patch
@@ -0,0 +1,26 @@
+Some versions of u-boot for this Chromebook check for tpm node
+in the device tree and fail badly (reboot) if it is not found.
+
+While not exactly correct, it is much easier to patch the mainline
+device tree to match u-boot expectations than to fix u-boot on
+this device.
+
+See https://code.google.com/p/chromium/issues/detail?id=220169
+and https://lkml.org/lkml/2013/3/4/242
+
+Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
+
+--- a/arch/arm/boot/dts/exynos5250-snow.dts
++++ b/arch/arm/boot/dts/exynos5250-snow.dts
+@@ -474,6 +474,11 @@
+ 	status = "okay";
+ 	samsung,i2c-sda-delay = <100>;
+ 	samsung,i2c-max-bus-freq = <66000>;
++
++	tpm {
++		compatible = "infineon,slb9635tt";
++		reg = <0x20>;
++	};
+ };
+ 
+ &i2c_5 {
diff --git a/board/chromebook/snow/linux-4.3.fragment b/board/chromebook/snow/linux-4.3.fragment
new file mode 100644
index 0000000..e2786da
--- /dev/null
+++ b/board/chromebook/snow/linux-4.3.fragment
@@ -0,0 +1,2 @@
+CONFIG_MWIFIEX=m
+CONFIG_MWIFIEX_SDIO=m
diff --git a/board/chromebook/snow/mksd.sh b/board/chromebook/snow/mksd.sh
new file mode 100755
index 0000000..b6302aa
--- /dev/null
+++ b/board/chromebook/snow/mksd.sh
@@ -0,0 +1,69 @@
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
+# cgpt does not create protective MBR, and the kernel refuses to read
+# GPT unless there's some kind of MBR in sector 0. So we need parted
+# to write that single sector before doing anything with the GPT.
+cgpt=$HOST_DIR/usr/bin/cgpt
+parted=$HOST_DIR/usr/sbin/parted
+kernel=$BINARIES_DIR/uImage.kpart
+rootfs=$BINARIES_DIR/rootfs.ext2
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
+kernelsec=$(((kernelsize+8191)>>13))
+rootfssec=$(((rootfssize+8191)>>13))
+headersec=4
+
+# There is also a copy of MBR+GPT at the end of the image.
+# It's going to be useless but both tools assume it's there.
+imagesec=$((2*headersec+kernelsec+rootfssec))
+bootsd="$BINARIES_DIR/bootsd.img"
+run dd bs=$sec count=$imagesec if=/dev/zero of=$bootsd
+
+# cgpt needs offsets and sizes in 512-blocks.
+block=512
+kernelstart=$((headersec<<4))
+kernelblocks=$((kernelsec<<4))
+rootfsblocks=$((rootfssec<<4))
+rootfsstart=$((kernelstart+kernelblocks))
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
index 0000000..eeea603
--- /dev/null
+++ b/board/chromebook/snow/readme.txt
@@ -0,0 +1,137 @@
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
+Switching to developer mode and booting from SD
+-----------------------------------------------
+Power Chromebook down, then power it up while holding Esc+F3.
+BEWARE: switching to developer mode deletes all user data.
+Create backups if you need them.
+
+While in developer mode, Chromebook will boot into a white screen saying
+"OS verification is off".
+
+Press Ctrl-D at this screen to boot Chromium OS from eMMC.
+Press Ctrl-U@this screen to boot from SD (or USB)
+Press Power to power it off.
+Do NOT press Space unless you mean it.
+This will switch it back to normal mode.
+
+The is no way to get rid of the white screen without re-flashing the bootloader.
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
+Partitioning SD card manually
+-----------------------------
+Check mksd.sh for partitioning commands.
+
+Use parted and cgpt on a real device, and calculate the partition
+sizes properly. The kernel partition may be as small as 4MB, but
+you will probably want the rootfs to occupy the whole remaining space.
+
+cgpt may be used to check current layout:
+
+	output/host/usr/bin/cgpt show $SD
+
+All sizes and all offsets are in 512-byte blocks.
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
+Kernel command line
+-------------------
+The command line is taken from board/chromebook/snow/kernel.args and stored
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
+As a side effect, it makes /dev/console unusable, which the init in use must
+be able to handle.
+
+WiFi card
+---------
+Run modprobe mwifiex_sdio to load the driver.
+The name of the device should be mlan0.
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
index 0000000..39005ed
--- /dev/null
+++ b/board/chromebook/snow/sign.sh
@@ -0,0 +1,41 @@
+#!/bin/sh
+
+# This script creates u-boot FIT image containing the kernel and the DT,
+# then signs it using futility from vboot-utils.
+# The resulting file is called uImage.kpart.
+
+BOARD_DIR=$(dirname $0)
+mkimage=$HOST_DIR/usr/bin/mkimage
+futility=$HOST_DIR/usr/bin/futility
+devkeys=$HOST_DIR/usr/share/vboot/devkeys
+
+run() { echo "$@"; "$@"; }
+die() { echo "$@" >&2; exit 1; }
+test -f $BINARIES_DIR/zImage || \
+	die "No kernel image found"
+test -x $mkimage || \
+	die "No mkimage found (host-uboot-tools has not been built?)"
+test -x $futility || \
+	die "No futility found (host-vboot-utils has not been built?)"
+
+# kernel.its references zImage and exynos5250-snow.dtb, and all three
+# files must be in current directory for mkimage.
+run cp $BOARD_DIR/kernel.its $BINARIES_DIR/kernel.its || exit 1
+echo "# entering $BINARIES_DIR for the next command"
+(cd $BINARIES_DIR && run $mkimage -f kernel.its uImage.itb) || exit 1
+
+# futility requires non-empty file to be supplied with --bootloader
+# even if it does not make sense for the target platform.
+echo > $BINARIES_DIR/dummy.txt
+
+run $futility vbutil_kernel \
+	--keyblock $devkeys/kernel.keyblock \
+	--signprivate $devkeys/kernel_data_key.vbprivk \
+	--arch arm \
+	--version 1 \
+	--config $BOARD_DIR/kernel.args \
+	--vmlinuz $BINARIES_DIR/uImage.itb \
+	--bootloader $BINARIES_DIR/dummy.txt \
+	--pack $BINARIES_DIR/uImage.kpart || exit 1
+
+rm -f $BINARIES_DIR/kernel.its $BINARIES_DIR/dummy.txt
diff --git a/configs/chromebook_snow_defconfig b/configs/chromebook_snow_defconfig
new file mode 100644
index 0000000..aa889ac
--- /dev/null
+++ b/configs/chromebook_snow_defconfig
@@ -0,0 +1,25 @@
+BR2_arm=y
+BR2_cortex_a15=y
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="4.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+BR2_TARGET_GENERIC_GETTY_TERM="linux"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/chromebook/snow/sign.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/chromebook/snow/mksd.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_SAME_AS_HEADERS=y
+BR2_LINUX_KERNEL_PATCH="board/chromebook/snow/linux-4.3-dts-tpm.patch"
+BR2_LINUX_KERNEL_DEFCONFIG="exynos"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/chromebook/snow/linux-4.3.fragment"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="exynos5250-snow"
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8797=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_DTC=y
+BR2_PACKAGE_HOST_PARTED=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_VBOOT_UTILS=y
-- 
2.6.4
