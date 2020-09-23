From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 21:08:37 +0200
Subject: [Buildroot] [PATCH 3/3] boards: chromebook: Add support of
 Chromebook Elm
In-Reply-To: <20200921181246.88781-4-bilalwasim676@gmail.com>
References: <20200921181246.88781-1-bilalwasim676@gmail.com>
 <20200921181246.88781-4-bilalwasim676@gmail.com>
Message-ID: <20200923210837.04464206@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Sep 2020 23:12:46 +0500
Bilal Wasim <bilalwasim676@gmail.com> wrote:

>  board/chromebook/elm/kernel.args              |   1 +
>  board/chromebook/elm/kernel.its               |  38 ++
>  board/chromebook/elm/linux-5.9-elm-hdmi.patch | 404 ++++++++++++++++
>  board/chromebook/elm/linux.config             | 453 ++++++++++++++++++
>  board/chromebook/elm/readme.txt               |  56 +++
>  board/chromebook/elm/sign.sh                  |  41 ++
>  6 files changed, 993 insertions(+)

You should add an entry in the DEVELOPERS file to reference the
defconfig and board/chromebook/elm/ directory.


> diff --git a/board/chromebook/elm/linux-5.9-elm-hdmi.patch b/board/chromebook/elm/linux-5.9-elm-hdmi.patch
> new file mode 100644
> index 0000000000..7f549dcc6d
> --- /dev/null
> +++ b/board/chromebook/elm/linux-5.9-elm-hdmi.patch

Please use one file for each patch, instead of concatenating all
patches into one file. The patches should be generated with "git
format-patch".


> diff --git a/board/chromebook/elm/readme.txt b/board/chromebook/elm/readme.txt
> new file mode 100644
> index 0000000000..b63e7e8bcf
> --- /dev/null
> +++ b/board/chromebook/elm/readme.txt
> @@ -0,0 +1,56 @@
> +Mediatek MT8173 aka Chromebook Elm
> +==================================
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
> +Making the boot media
> +---------------------
> +Start by configuring and building the images.
> +
> +	make chromebook_elm_defconfig
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
> +Switching to developer mode and booting from SD
> +-----------------------------------------------
> +Power Chromebook down, then power it up while holding Esc+F3.
> +BEWARE: switching to developer mode deletes all user data.
> +Create backups if you need them.
> +
> +While in developer mode, Chromebook will boot into a white screen saying
> +"OS verification is off".
> +
> +Press Ctrl-D at this screen to boot Chromium OS from eMMC.
> +Press Ctrl-U at this screen to boot from SD (or USB)
> +Press Power to power it off.
> +Do NOT press Space unless you mean it.
> +This will switch it back to normal mode.
> +
> +The is no way to get rid of the white screen without re-flashing the bootloader.
> +
> diff --git a/board/chromebook/elm/sign.sh b/board/chromebook/elm/sign.sh
> new file mode 100644
> index 0000000000..b1c1ffee40
> --- /dev/null
> +++ b/board/chromebook/elm/sign.sh
> @@ -0,0 +1,41 @@
> +#!/bin/sh
> +
> +# This script creates u-boot FIT image containing the kernel and the DT,
> +# then signs it using futility from vboot-utils.
> +# The resulting file is called uImage.kpart.
> +
> +BOARD_DIR=$(dirname $0)/${BOARD_NAME}
> +mkimage=$HOST_DIR/bin/mkimage
> +futility=$HOST_DIR/bin/futility
> +devkeys=$HOST_DIR/share/vboot/devkeys
> +
> +run() { echo "$@"; "$@"; }
> +die() { echo "$@" >&2; exit 1; }
> +test -f $BINARIES_DIR/Image  || \
> +	die "No kernel image found"
> +test -x $mkimage || \
> +	die "No mkimage found (host-uboot-tools has not been built?)"
> +test -x $futility || \
> +	die "No futility found (host-vboot-utils has not been built?)"
> +
> +# kernel.its references zImage and exynos5250-snow.dtb, and all three

Bad copy paste here :-)

> +# files must be in current directory for mkimage.
> +run cp $BOARD_DIR/kernel.its $BINARIES_DIR/kernel.its || exit 1
> +echo "# entering $BINARIES_DIR for the next command"
> +(cd $BINARIES_DIR && run $mkimage -f kernel.its uImage.itb) || exit 1
> +
> +# futility requires non-empty file to be supplied with --bootloader
> +# even if it does not make sense for the target platform.
> +echo > $BINARIES_DIR/dummy.txt
> +
> +run $futility vbutil_kernel \
> +	--keyblock $devkeys/kernel.keyblock \
> +	--signprivate $devkeys/kernel_data_key.vbprivk \
> +	--arch aarch64 \
> +	--version 1 \
> +	--config $BOARD_DIR/kernel.args \
> +	--vmlinuz $BINARIES_DIR/uImage.itb \
> +	--bootloader $BINARIES_DIR/dummy.txt \
> +	--pack $BINARIES_DIR/uImage.kpart || exit 1
> +
> +rm -f $BINARIES_DIR/kernel.its $BINARIES_DIR/dummy.txt

This script looks very very similar to the one for the snow Chromebook.
The only difference that I could spot is the --arch argument, which is
--arch arm in snow, and --arch aarch64 here.

So, I guess you could easily do a:

if test grep -q ^BR2_arm=y ${BR2_CONFIG}; then
	arch="arm"
else
	arch="aarch64"
fi

or something along those lines.

Other than that, the rest looks good.

Could you take into account those comments, and submit an updated
version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
