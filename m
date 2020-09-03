From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 20:53:15 +0200
Subject: [Buildroot] [PATCH 3/4] board/odroidc2: add board
In-Reply-To: <20200717164643.4702-3-daggs@gmx.com>
References: <20200717164643.4702-1-daggs@gmx.com>
 <20200717164643.4702-3-daggs@gmx.com>
Message-ID: <20200903205315.1ed8cb72@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Dagg,

On Fri, 17 Jul 2020 19:46:42 +0300
Dagg Stompler <daggs@gmx.com> wrote:

> re add the odroidc2 board to buildroot.
>  - uses latest uboot.
>  - uses kernel 5.6

This patch and the next one should have been one single patch. And in
fact you're using Linux 5.7, not 5.6.

> diff --git a/board/hardkernel/odroidc2/genimage.cfg b/board/hardkernel/odroidc2/genimage.cfg
> new file mode 100644
> index 0000000000..a36b924b08
> --- /dev/null
> +++ b/board/hardkernel/odroidc2/genimage.cfg
> @@ -0,0 +1,33 @@
> +image boot.vfat {
> +	vfat {
> +		files = {
> +			"Image",
> +			"meson-gxbb-odroidc2.dtb",
> +			"boot.scr"
> +		}
> +	}
> +	size = 64M
> +}
> +
> +image sdcard.img {
> +	hdimage {
> +	}

I've added here an entry to flash the bl1.bin.hardkernel into the
sdcard.img file instead of doing it manually in the post-image script.

> +
> +	partition u-boot {
> +		in-partition-table = "no"
> +		image = "uboot-odc2.img"
> +		offset = 49664
> +	}
> +
> +	partition boot {
> +		partition-type = 0xC
> +		bootable = "true"
> +		image = "boot.vfat"
> +	}
> +
> +	partition rootfs {
> +		partition-type = 0x83
> +		image = "rootfs.ext4"
> +		size = 512M
> +	}
> +}
> diff --git a/board/hardkernel/odroidc2/post-build.sh b/board/hardkernel/odroidc2/post-build.sh
> new file mode 100755
> index 0000000000..745fb2a724
> --- /dev/null
> +++ b/board/hardkernel/odroidc2/post-build.sh
> @@ -0,0 +1,8 @@
> +#!/bin/sh
> +# post-build.sh for Odroid C2 taken from CubieBoard's post-build.sh
> +# 2013, Carlo Caione <carlo.caione@gmail.com>
> +
> +BOARD_DIR="$(dirname $0)"
> +MKIMAGE=$HOST_DIR/bin/mkimage
> +
> +${MKIMAGE} -A arm64 -O linux -T script -C none -n "Boot script" -d "${BOARD_DIR}/boot.cmd" ${BINARIES_DIR}/boot.scr

This was not useful, as this is already done by:

BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/hardkernel/odroidc2/boot.cmd"

so I've dropped the post-build script entirely.

> diff --git a/board/hardkernel/odroidc2/post-image.sh b/board/hardkernel/odroidc2/post-image.sh
> new file mode 100755
> index 0000000000..3783a65a1c
> --- /dev/null
> +++ b/board/hardkernel/odroidc2/post-image.sh
> @@ -0,0 +1,29 @@
> +#!/bin/sh
> +
> +BOARD_DIR="$(dirname $0)"
> +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> +GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
> +SIGNED_UBOOT_IMG="${BINARIES_DIR}/uboot-odc2.img"
> +ODRODIDC2_ATF_FOLDER="${HOST_DIR}/usr/share/odroidc2_atf"
> +IM_FILE="${ODRODIDC2_ATF_FOLDER}/bl1.bin.hardkernel"
> +
> +${HOST_DIR}/bin/fip_create --bl30 ${ODRODIDC2_ATF_FOLDER}/bl30.bin --bl301 ${ODRODIDC2_ATF_FOLDER}/bl301.bin --bl31 ${ODRODIDC2_ATF_FOLDER}/bl31.bin --bl33 ${BINARIES_DIR}/u-boot.bin ${BINARIES_DIR}/fip.bin
> +${HOST_DIR}/bin/fip_create --dump ${BINARIES_DIR}/fip.bin
> +cat ${ODRODIDC2_ATF_FOLDER}/bl2.package ${BINARIES_DIR}/fip.bin > ${BINARIES_DIR}/boot_new.bin
> +${HOST_DIR}/bin/amlbootsig ${BINARIES_DIR}/boot_new.bin ${BINARIES_DIR}/u-boot.img
> +
> +dd if=${BINARIES_DIR}/u-boot.img of=${SIGNED_UBOOT_IMG} bs=512 skip=96
> +
> +rm -rf "${GENIMAGE_TMP}"
> +
> +genimage                           \
> +	--rootpath "${TARGET_DIR}"     \
> +	--tmppath "${GENIMAGE_TMP}"    \
> +	--inputpath "${BINARIES_DIR}"  \
> +	--outputpath "${BINARIES_DIR}" \
> +	--config "${GENIMAGE_CFG}"

I've simplified this by using support/scripts/genimage.sh.

> +dd if=${IM_FILE} of=${BINARIES_DIR}/sdcard.img bs=1 count=442 conv=sync,notrunc
> +dd if=${IM_FILE} of=${BINARIES_DIR}/sdcard.img bs=512 skip=1 seek=1 conv=fsync,notrunc

This was no longer needed as bl1.bin.hardkernel is now taken care of by
genimage directly.

> +rm -rf ${BINARIES_DIR}/fip.bin ${BINARIES_DIR}/boot_new.bin ${BINARIES_DIR}/u-boot.img

It's not necessary to clean things up this way.

Overall, this allowed to simplify the post-image script quite a bit.

See the final commit at:

  https://git.buildroot.org/buildroot/commit/?id=c8ee85ecd91c0b36be8694224b80846a276a849e

Could you check if it works for you, on the hardware platform ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
