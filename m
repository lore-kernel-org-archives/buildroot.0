From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 22:28:43 +0100
Subject: [Buildroot] [PATCH 2/2 v3] board: add support for Chromebook
 Snow
In-Reply-To: <20151227125701.GA8245@vostro>
References: <20151227125701.GA8245@vostro>
Message-ID: <20151228222843.1c12ee82@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

Thanks a lot for this patch. I believe it's almost ready to be applied,
but there's a few minor nits that I'd like to see fixed beforehand.
Overall, it's super nicely documented and explained, so really thanks a
lot for this high quality patch.

On Sun, 27 Dec 2015 14:57:01 +0200, Alex Suykov wrote:

> The kernel defconfig is also provided. Mainline kernel already
> has exynos_defconfig which could have been used here, but it builds
> mwifiex statically, and that module tries to load its firmware during
> initialization.

And so the rootfs is not available by that time and the firmware
loading fails? Does it work on other distros because they use an
initramfs that is readily available with the firmware? It is somewhat
sad that we can't use the exynos_defconfig.

If all you need is to override the mwifiex driver to be built as a
module, then you can use a cool feature: fragment files. Use a
configuration like this:

BR2_LINUX_KERNEL_DEFCONFIG="exynos"
BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/chromebook/snow/linux-4.3.fragment"

The board/chromebook/snow/linux-4.3.fragment file should contain the
line:

CONFIG_MWIFIEX=m

And tada, your kernel configuration will have mwifiex as a module.


> diff --git a/board/chromebook/snow/mksd.sh b/board/chromebook/snow/mksd.sh
> new file mode 100755
> index 0000000..539eed7
> --- /dev/null
> +++ b/board/chromebook/snow/mksd.sh
> @@ -0,0 +1,72 @@
> +#!/bin/sh
> +
> +# This scripts makes a minimal bootable SD card image for the Chromebook.
> +# The resulting file is called bootsd.img. It should be written directly
> +# to the card:
> +#
> +#	SD=/dev/mmcblk1		# check your device name!
> +#	dd if=output/images/bootsd.img of=$SD
> +#
> +# The partitions are created just large enough to hold the kernel and
> +# the rootfs image. Most of the card will be empty, and the secondary
> +# GPT will not be in its proper location.
> +
> +output_images=${BINARIES_DIR:-output/images}
> +output_host=${HOST_DIR:-output/host}

I don't think this ${BINARIES_DIR:-output/images} is needed.
BINARIES_DIR and HOST_DIR are always passed in the environment when the
script is called as a post-build or post-image script.

And if your argument is that the script might be called outside of a
post-build or post-image script, then output/<foo> is not a great
default since people could very well do out of tree build with
Buildroot.

So, I'd prefer if you simply used directly ${HOST_DIR} and
${BINARIES_DIR} throughout the script.

> +# The card is partitioned in sectors of 8KB.
> +# 4 sectors are reserved for MBR+GPT. Their actual size turns out
> +# to be 33 512-blocks which is just over 2 sectors, but we align
> +# it to a nice round number.
> +sec=8192
> +kernelsec=$[(kernelsize+8191)>>13]
> +rootfssec=$[(rootfssize+8191)>>13]

Is this sort of calculation POSIX compliant, or a bash extension? If a
bash extension, then the shebang of the script should be #!/bin/bash


> diff --git a/board/chromebook/snow/readme.txt b/board/chromebook/snow/readme.txt
> new file mode 100644
> index 0000000..4c2d8f5
> --- /dev/null
> +++ b/board/chromebook/snow/readme.txt
> @@ -0,0 +1,145 @@
> +Samsung XE303C12 aka Chromebook Snow
> +====================================
> +
> +This file describes booting the Chromebook from an SD card containing
> +Buildroot kernel and rootfs, using the original bootloader. This is
> +the least invasive way to get Buildroot onto the devices and a good
> +starting point.
> +
> +The bootloader will only boot a kernel from a GPT partition marked
> +bootable with cgpt tool from vboot-utils package.
> +The kernel image must be signed using futility from the same package.
> +The signing part is done by sign.sh script in this directory.
> +
> +It does not really matter where rootfs is as long as the kernel is able
> +to find it, but this particular configuration assumes the kernel is on
> +partition 1 and rootfs is on partition 2 of the SD card.
> +Make sure to check kernel.args if you change this.
> +
> +

Nit: one empty new line is sufficient here.

> +Making the boot media
> +---------------------

Nit: one empty line would be good here (and ditto in the rest of the
file).

> +Start by configuring and building the images.
> +
> +	make chromebook_snow_defconfig
> +	make menuconfig # if necessary
> +	make
> +
> +The important files are:
> +
> +	uImage.kpart (kernel and device tree, signed)
> +	rootfs.tar
> +	bootsd.img (SD card image containing both kernel and rootfs)
> +
> +Write the image directly to some SD card.
> +WARNING: make sure there is nothing important on that card,
> +and double-check the device name!
> +
> +	SD=/dev/mmcblk1		# may be /dev/sdX on some hosts
> +	dd if=output/images/bootsd.img of=$SD
> +
> +
> +Switching to developer mode and booting from SD
> +-----------------------------------------------
> +Power Chromebook down, then power it up while holding Esc+F3.
> +BEWARE: switching to developer mode deletes all user data.
> +Create backups if you need them.
> +
> +While in developer mode, Chromebook will boot into a white screen saying
> +"OS verification is off".
> +
> +Press Ctrl-D at this screen to boot ChromeOS from eMMC.
> +Press Ctrl-U at this screen to boot from SD (or USB)
> +Press Power to power it off.
> +Do NOT press Space unless you mean it.
> +This will switch it back to normal mode.
> +
> +The is no way to get rid of the white screen without re-flashing the bootloader.
> +
> +
> +Troubleshooting
> +---------------
> +Loud *BEEP* after pressing Ctrl-U means there's no valid partition to boot from.
> +Which in turn means either bad GPT or improperly signed kernel.
> +
> +Return to the OS verification screen without any sounds means the code managed
> +to reboot the board. May indicate properly signed but invalid image.
> +
> +Blank screen means the image is valid and properly signed but cannot boot
> +for some reason, like missing or incorrect DT.
> +
> +In case the board becomes unresponsive:
> +
> +* Press Esc+F3+Power. The board should reboot instantly.
> +  Remove SD card to prevent it from attempting a system recovery.
> +
> +* Hold Power button for around 10s. The board should shut down into
> +  its soft-off mode. Press Power button again or open the lid to turn in on.
> +
> +* If that does not work, disconnect the charger and push a hidden
> +  button on the underside with a pin of some sort. The board should shut
> +  down completely. Opening the lid and pressing Power button will not work.
> +  To turn it back on, connect the charger.
> +
> +
> +Partitioning SD card manually
> +----------------------------
> +Check mksd.sh for partitioning commands.
> +
> +Use parted and cgpt on a real device, and calculate the partition
> +sizes properly. The kernel partition may be as small as 4MB, but
> +you will probably want the rootfs to occupy the whole remaining space.
> +
> +cgpt may be used to check current layout:
> +
> +	output/hosst/usr/bin/cgpt show $SD

typo: hosst -> host.

> +
> +All sizes and all offsets are in 512-byte blocks.
> +
> +
> +Writing kernel and rootfs to a partitioned SD card
> +--------------------------------------------------
> +Write .kpart directly to the bootable partition:
> +
> +	dd if=output/images/uImage.kpart of=${SD}1
> +
> +Make a new filesystem on the rootfs partition, and unpack rootfs.tar there:
> +
> +	mkfs.ext4 ${SD}2
> +	mount ${SD2} /mnt/<ROOTFS-PARTITION>
> +	tar -xvf output/images/rootfs.tar -C /mnt/<ROOTFS-PARTITION>
> +	umount /mnt/<ROOTFS-PARTITION>
> +
> +This will require root permissions even if you can write to $SD.
> +
> +
> +Kernel command line
> +-------------------
> +The command line is taken from board/chromebook/kernel.args and stored

The path is board/chromebook/snow/kernel.args.


> diff --git a/board/chromebook/snow/sign.sh b/board/chromebook/snow/sign.sh
> new file mode 100755
> index 0000000..396f7fa
> --- /dev/null
> +++ b/board/chromebook/snow/sign.sh
> @@ -0,0 +1,44 @@
> +#!/bin/sh
> +
> +# This script creates u-boot FIT image containing the kernel and the DT,
> +# then signs it using futility from vboot-utils.
> +# The resulting file is called uImage.kpart.
> +
> +output_images=${BINARIES_DIR:-$PWD/output/images}
> +output_host=${HOST_DIR:-$PWD/output/host}

Ditto previous script.

> +board=$PWD/board/chromebook/snow

you could also do:

BOARD_DIR=$(dirname $0)

> +mkimage=$output_host/usr/bin/mkimage
> +futility=$output_host/usr/bin/futility
> +devkeys=$output_host/usr/share/vboot/devkeys
> +
> +run() { echo "$@"; "$@"; }
> +die() { echo "$@" >&2; exit 1; }
> +test -f $output_images/zImage || \
> +	die "No kernel image found"
> +test -x $mkimage || \
> +	die "No mkimage found (host-uboot-tools has not been built?)"
> +test -x $futility || \
> +	die "No futility found (host-vboot-utils has not been built?)"
> +
> +# kernel.its references zImage and exynos5250-snow.dtb, and all three
> +# files must be in current directory for mkimage.
> +run cd $output_images || exit 1
> +cp $board/kernel.its ./kernel.its || exit 1
> +run $mkimage -f kernel.its uImage.itb
> +
> +# futility requires non-empty file to be supplied with --bootloader
> +# even if it does not make sense for the target platform.
> +echo > dummy.txt
> +
> +run $futility vbutil_kernel \
> +	--keyblock $devkeys/kernel.keyblock \
> +	--signprivate $devkeys/kernel_data_key.vbprivk \
> +	--arch arm \
> +	--version 1 \
> +	--config $board/kernel.args \
> +	--vmlinuz uImage.itb \
> +	--bootloader dummy.txt \
> +	--pack uImage.kpart
> +
> +rm -f kernel.its dummy.txt
> diff --git a/configs/chromebook_snow_defconfig b/configs/chromebook_snow_defconfig
> new file mode 100644
> index 0000000..d73aceb
> --- /dev/null
> +++ b/configs/chromebook_snow_defconfig
> @@ -0,0 +1,24 @@
> +BR2_arm=y
> +BR2_cortex_a15=y
> +BR2_KERNEL_HEADERS_4_3=y

Please use:

BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="4.3"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y

So that we stay at 4.3 even if the option BR2_KERNEL_HEADERS_4_3
disappears (which it will, since 4.3 is not a long term version).

> +BR2_BINUTILS_VERSION_2_25_X=y
> +BR2_GCC_VERSION_5_X=y

Can you tried without overriding those values? We prefer to use the
default version for the toolchain components, unless there's a strong
reason to do otherwise.

> +BR2_TARGET_GENERIC_GETTY_PORT="tty1"
> +BR2_TARGET_GENERIC_GETTY_TERM="linux"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/chromebook/snow/sign.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/chromebook/snow/mksd.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_SAME_AS_HEADERS=y
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/chromebook/snow/linux-4.3.config"
> +BR2_LINUX_KERNEL_ZIMAGE=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="exynos5250-snow"
> +BR2_PACKAGE_LINUX_FIRMWARE=y
> +BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8797=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_PACKAGE_HOST_DTC=y
> +BR2_PACKAGE_HOST_PARTED=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_PACKAGE_HOST_VBOOT_UTILS=y

The rest looks good, thanks! Can you rework to take into account the
various comments I made?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
