From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Nov 2019 23:19:27 +0100
Subject: [Buildroot] [PATCH 1/1] board: Add support for nautilus
 chromebook
In-Reply-To: <20191119213121.165863-1-swboyd@chromium.org>
References: <20191119213121.165863-1-swboyd@chromium.org>
Message-ID: <20191120231927.788e22af@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stephen,

Nice to see you here ! :-)

On Tue, 19 Nov 2019 13:31:21 -0800
Stephen Boyd <swboyd@chromium.org> wrote:

> This adds support for the "Nautilus" chromebook, similar to how "Snow"
> is supported. We drop the cgpt requirement in favor of using 'sgdisk'
> and support a genimage config file instead of a custom partitioning
> script. I also included a kernel configuration file based on a minimized
> version pulled from a chromeos kernel running on the device.
> 
> Cc: Alex Suykov <alex.suykov@gmail.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Thanks for this submission. Overall it looks pretty good, there are
just a few minor details, see below.

First, the commit title should be:

	configs/chromebook_nautilus: new defconfig

>  board/chromebook/nautilus/config            | 635 ++++++++++++++++++++
>  board/chromebook/nautilus/genimage.cfg      |  17 +
>  board/chromebook/nautilus/kernel.args       |   1 +
>  board/chromebook/nautilus/mark_boot_once.sh |  16 +
>  board/chromebook/nautilus/readme.txt        |  83 +++
>  board/chromebook/nautilus/sign.sh           |  31 +
>  configs/chromebook_nautilus_defconfig       |  15 +
>  7 files changed, 798 insertions(+)

Could you add an entry in the DEVELOPERS file to associate your
name/email to the files being added (i.e both the defconfig and the
board/ directory).

> diff --git a/board/chromebook/nautilus/config b/board/chromebook/nautilus/config

Can we name this linux.config instead ?

This defconfig also seems pretty long, with lots of drivers enabled,
many as modules. Do we need all of them? Looking at the list of
modules, it seems unlikely all of these are needed/useful. So could you
do a pass of cleanup ?

> diff --git a/board/chromebook/nautilus/genimage.cfg b/board/chromebook/nautilus/genimage.cfg
> new file mode 100644
> index 000000000000..c4873e8b3670
> --- /dev/null
> +++ b/board/chromebook/nautilus/genimage.cfg
> @@ -0,0 +1,17 @@
> +image sdcard.img {
> +	exec-post = "board/chromebook/nautilus/mark_boot_once.sh"

Learned about this feature :) Could have been a post-image script, but
OK, this exec-post mechanism also works.

> +	hdimage {
> +		gpt = "true"
> +	}
> +
> +	partition kernel {
> +		image = "Image.kpart"
> +		bootable = "true"
> +		partition-type-uuid = FE3A2A5D-4F32-41A7-B725-ACCC3285A309

Just curious, the UUID needs to be exactly that one for the
bootloader/firmware to pick up the kernel image from there ?


> diff --git a/board/chromebook/nautilus/mark_boot_once.sh b/board/chromebook/nautilus/mark_boot_once.sh
> new file mode 100755
> index 000000000000..ea06a5b7cc73
> --- /dev/null
> +++ b/board/chromebook/nautilus/mark_boot_once.sh
> @@ -0,0 +1,16 @@
> +#!/bin/sh
> +
> +# This script marks the kernel partition as 'boot once'
> +# so that depthcharge will pick it.
> +
> +img=$BINARIES_DIR/sdcard.img
> +sgdisk=$HOST_DIR/sbin/sgdisk
> +
> +run() { echo "$@"; "$@"; }
> +die() { echo "$@" >&2; exit 1; }
> +
> +test -x $sgdisk || die "sgdisk not found (host-gptfdisk has not been built?)"

We generally don't do such checks, we assume that the configuration is
correct, and therefore the necessary tools will be available.

> +# Set succesful, priority, tries flags on kernel partition
> +# cgpt args are '-S 0 -T 1 -P 15'
> +run $sgdisk -A 1:=:0xe1f000000000004 $img

While I understand the idea of your "run" wrapper, we don't have this
anywhere in our other scripts, so I'd rather avoid it.

> +The signing part is done by sign.sh script in this directory.
> +

by *the* sign.sh

> +It does not really matter where rootfs is as long as the kernel is able

where *the* rootfs is

> +to find it, but this particular configuration assumes the kernel is on
> +partition n and rootfs is on partition n+1.
> +Make sure to check kernel.args if you change this.
> +
> +Making the boot media
> +---------------------
> +Start by configuring and building the images.
> +
> +	make chromebook_nautilus_defconfig
> +	make menuconfig # if necessary
> +	make
> +
> +The important files are:
> +
> +	Image.kpart (kernel partition, signed)
> +	rootfs.tar
> +	sdcard.img (SD card/USB image containing both kernel and rootfs)
> +
> +Write the image directly to some SD card or USB stick.
> +WARNING: make sure there is nothing important on that device,
> +and double-check the device name!
> +
> +	SD=/dev/mmcblk1		# may be /dev/sdX on some hosts
> +	dd if=output/images/sdcard.img of=$SD

Drop the SD variable here.


> diff --git a/board/chromebook/nautilus/sign.sh b/board/chromebook/nautilus/sign.sh
> new file mode 100755
> index 000000000000..3b8c9c577b20
> --- /dev/null
> +++ b/board/chromebook/nautilus/sign.sh
> @@ -0,0 +1,31 @@
> +#!/bin/sh
> +
> +# This script creates a kernel partition containing the kernel bzImage
> +# then signs it using futility from vboot-utils.
> +# The resulting file is called Image.kpart.
> +
> +BOARD_DIR=$(dirname $0)
> +futility=$HOST_DIR/bin/futility
> +devkeys=$HOST_DIR/share/vboot/devkeys
> +vmlinuz=$BINARIES_DIR/bzImage
> +
> +run() { echo "$@"; "$@"; }
> +die() { echo "$@" >&2; exit 1; }
> +test -f $vmlinuz || \
> +	die "No kernel image found"
> +test -x $futility || \
> +	die "No futility found (host-vboot-utils has not been built?)"

As said above, we probably don't need those checks. Just assume things
have been built as they should be.


> diff --git a/configs/chromebook_nautilus_defconfig b/configs/chromebook_nautilus_defconfig
> new file mode 100644
> index 000000000000..536e1fc96ad1
> --- /dev/null
> +++ b/configs/chromebook_nautilus_defconfig
> @@ -0,0 +1,15 @@
> +BR2_x86_64=y
> +BR2_x86_core2=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_TARGET_GENERIC_GETTY_TERM="linux"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/chromebook/nautilus/sign.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/chromebook/nautilus/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/chromebook/nautilus/config"

We want to use a specific kernel version that is know to have been
tested, and not just "the latest kernel".

Besides those small details, it really looks good. Could you send a v2
with those details fixed?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
