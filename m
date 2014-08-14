From: =?UTF-8?B?VmluY2VudCBTdGVobMOp?= <vincent.stehle@freescale.com>
Date: Thu, 14 Aug 2014 12:03:46 +0200
Subject: [Buildroot] [PATCH 2/2] freescale/imx6-sabresd: document how to
 create a bootable SD
In-Reply-To: <1408005320-6100-2-git-send-email-luca@lucaceresoli.net>
References: <1408005320-6100-1-git-send-email-luca@lucaceresoli.net>
 <1408005320-6100-2-git-send-email-luca@lucaceresoli.net>
Message-ID: <53EC8982.1000809@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/14/2014 10:35 AM, Luca Ceresoli wrote:
> Document how to create a bootable SD card for the two supported SABRESD cards:
> i.MX6Q and i.MX6DL.

Hi Luca,

Thanks for the script and documentation!

A few comments below:

> 
> The SD card creation relies on an ad-hoc script.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Gilles Talis <gilles.talis@gmail.com>
> Cc: Gary Bisson <bisson.gary@gmail.com>
> Cc: Vincent Stehl? <vincent.stehle@freescale.com>
> ---
>  board/freescale/imx6sabresd/create-boot-sd.sh | 85 +++++++++++++++++++++++++++
>  board/freescale/imx6sabresd/readme.txt        | 66 +++++++++++++++++++++
>  2 files changed, 151 insertions(+)
>  create mode 100755 board/freescale/imx6sabresd/create-boot-sd.sh
>  create mode 100644 board/freescale/imx6sabresd/readme.txt
> 
> diff --git a/board/freescale/imx6sabresd/create-boot-sd.sh b/board/freescale/imx6sabresd/create-boot-sd.sh
> new file mode 100755
> index 0000000..ebe3002
> --- /dev/null
> +++ b/board/freescale/imx6sabresd/create-boot-sd.sh
> @@ -0,0 +1,85 @@
> +#!/bin/sh
> +
> +set -u
> +set -e
> +
> +PROGNAME=$(basename $0)
> +
> +usage()
> +{
> +    echo "Create an SD card that boots on an i.MX6DL SABRESD board."
> +    echo "It is supposed to work also for the i.MX6Q SABRESD board, but"
> +    echo "it this is not tested."

It is now, and the resulting SD card boots fine :)

I needed to do just one change, though: the partitions names (see below).

> +    echo
> +    echo "Note: all data on the the card will be completely deleted!"
> +    echo "Use with care!"
> +    echo "Superuser permissions may be required to write to the device."
> +    echo
> +    echo "Usage: ${PROGNAME} <sd_block_device>"
> +    echo "Arguments:"
> +    echo "  <sd_block_device>     The device to be written to"
> +    echo
> +    echo "Example: ${PROGNAME} /dev/mmcblk0"
> +    echo
> +}
> +
> +if [ $# -ne 1 ]; then
> +    usage
> +    exit 1
> +fi
> +
> +if [ $(id -u) -ne 0 ]; then
> +    echo "${PROGNAME} must be run as root"
> +    exit 1
> +fi
> +
> +DEV=${1}
> +PART1=${DEV}p1
> +PART2=${DEV}p2

This naming is not fully true: with my USB SD card reader for example I
have /dev/sde1, /dev/sde2.

That makes the mkfs step (and the script) fail for me. If I change just
this naming, it works fine.

> +
> +# Unmount the partitions if mounted
> +umount ${PART1} || true
> +umount ${PART2} || true
> +
> +# First, clear the card
> +dd if=/dev/zero of=${DEV} bs=1M count=2
> +
> +sync
> +
> +# Partition the card.
> +# SD layout for i.MX6 boot:
> +# - Bootloader at offset 1024
> +# - FAT partition starting at 1MB offset, containing uImage and *.dtb
> +# - ext2/3 partition formatted as ext2 or ext3, containing the root filesystem.
> +sfdisk ${DEV} <<EOF
> +32,480,b
> +512,,L
> +EOF
> +
> +sync
> +
> +# Copy the bootloader at offset 1024
> +dd if=output/images/u-boot.imx of=${DEV} obs=512 seek=2
> +
> +# Prepare a temp dir for mounting partitions
> +TMPDIR=$(mktemp -d)
> +
> +# FAT partition: kernel and DTBs
> +mkfs.vfat ${PART1}

First step to fails if part name is bad (see above).

> +mount ${PART1} ${TMPDIR}
> +cp output/images/uImage ${TMPDIR}/
> +cp output/images/*.dtb  ${TMPDIR}/
> +sync
> +umount ${TMPDIR}
> +
> +# ext2 partition: root filesystem
> +mkfs.ext2 ${PART2}
> +mount ${PART2} ${TMPDIR}
> +tar -C ${TMPDIR}/ -xf output/images/rootfs.tar
> +sync
> +umount ${TMPDIR}

Maybe you want to mention somewhere that your script uses the rootfs.tar
and not the rootfs.ext2 as of now?

And if one day you support both the rootfs.ext2 and the rootfs.tar, I
suggest you use the rootfs.ext2 in priority when both are generated (and
maybe a resize2fs step). This way, you will benefit from the tune2fs
done by buildroot.

> +
> +# Cleanup
> +rmdir ${TMPDIR}
> +sync
> +echo Done
> diff --git a/board/freescale/imx6sabresd/readme.txt b/board/freescale/imx6sabresd/readme.txt
> new file mode 100644
> index 0000000..c93347f
> --- /dev/null
> +++ b/board/freescale/imx6sabresd/readme.txt
> @@ -0,0 +1,66 @@
> +*******************************************************
> +Freescale i.MX6Q and i.MX6DL SABRESD development boards
> +*******************************************************
> +
> +This file documents the Buildroot support for the Freescale SABRE Board for
> +Smart Devices Based on the i.MX 6 Series (SABRESD).
> +
> +Read the SABRESD Quick Start Guide for an introduction to the board:
> +http://cache.freescale.com/files/32bit/doc/quick_start_guide/SABRESDB_IMX6_QSG.pdf
> +
> +Build
> +=====
> +
> +First, configure Buildroot for your SABRESD board.
> +For i.MX6Q:
> +
> +  make freescale_imx6sabresd_defconfig
> +
> +For i.MX6DL:
> +
> +  make freescale_imx6dlsabresd_defconfig
> +
> +Build all components:
> +
> +  make
> +
> +You will find in ./output/images/ the following files:
> +  - imx6dl-sabresd.dtb or imx6q-sabresd.dtb
> +  - rootfs.ext2
> +  - rootfs.tar
> +  - u-boot.imx
> +  - uImage
> +
> +Create a bootable SD card
> +=========================
> +
> +To determine the device associated to the SD card have a look in the
> +/proc/partitions file:
> +
> +  cat /proc/partitions
> +
> +Run the following script as root on your SD card. This will partition the card
> +and copy the bootloader, kernel, DTBs and root filesystem as needed.
> +
> +*** WARNING! The script will destroy all the card content. Use with care! ***
> +
> +  ./board/freescale/imx6sabresd/create-boot-sd.sh <your-sd-device>
> +
> +Boot the SABRESD board
> +======================
> +
> +To boot your newly created system (refer to the SABRESD Quick Start Guide for
> +guidance):
> +- insert the SD card in the SD3 slot of the board;
> +- locate the BOOT dip switches (SW6), set dips 2 and 7 to ON, all others to OFF;
> +- connect a Micro USB cable to Debug Port and connect using a terminal emulator;

You might want to mention 115200n8.

> +- power on the board.
> +
> +Enjoy!
> +
> +References
> +==========
> +
> +https://community.freescale.com/docs/DOC-95015
> +https://community.freescale.com/docs/DOC-95017
> +https://community.freescale.com/docs/DOC-99218

I am honored :)

Best regards,

V.
