From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Feb 2018 22:41:58 +0100
Subject: [Buildroot] [PATCH 1/1] Odroid XU4: Hardkernel new board support
In-Reply-To: <1517655722-20132-1-git-send-email-pct@crookies.net>
References: <1517655722-20132-1-git-send-email-pct@crookies.net>
Message-ID: <20180214224158.7943d151@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Pierre,

On Sat,  3 Feb 2018 12:02:02 +0100, Pierre CROKAERT wrote:
> This patch provides support for the board Odroid XU4
> This version is using the latest 4.9 kernel released by Hardkernel,
> and the current u-boot 2017.05 also from Hardkernel.
> The support was implemented based on comments about Andi's patch (https://patchwork.ozlabs.org/patch/640695/).
> 
> Signed-off-by: Pierre CROKAERT <pct@crookies.net>

Thanks for working on this topic. However, there are still a few things
that I don't understand and/or that don't feel correct.

> diff --git a/board/hardkernel/odroidxu4/boot.cmd b/board/hardkernel/odroidxu4/boot.cmd
> new file mode 100644
> index 0000000..2fb4c16
> --- /dev/null
> +++ b/board/hardkernel/odroidxu4/boot.cmd
> @@ -0,0 +1,10 @@
> +setenv kernelname zImage;
> +setenv boot_kernel "setenv bootargs \"${console} root=/dev/mmcblk${mmcrootdev}p${mmcrootpart} rootfstype=${rootfstype} rootwait ${opts}\";
> +load mmc ${mmcbootdev}:${mmcbootpart} 0x40007FC0 '${kernelname}';
> +if load mmc ${mmcbootdev}:${mmcbootpart} 40800000 ${fdtfile}; then
> +	bootz 0x40007FC0 - 40800000;
> +else
> +	echo Warning! Booting without DTB: '${fdtfile}'!;
> +	bootz 0x40007FC0 -;
> +fi;"

Is this condition really needed? Aren't you always going to boot with a
DTB ?

> +run boot_kernel;
> \ No newline at end of file

Nit: please add a new line here.

> diff --git a/board/hardkernel/odroidxu4/genimage_bootloader_fragment.cfg b/board/hardkernel/odroidxu4/genimage_bootloader_fragment.cfg
> new file mode 100644
> index 0000000..a8e8379
> --- /dev/null
> +++ b/board/hardkernel/odroidxu4/genimage_bootloader_fragment.cfg

I don't see this file being used anywhere. Why isn't this done in
genimage.cfg itself ?

> diff --git a/board/hardkernel/odroidxu4/post-image.sh b/board/hardkernel/odroidxu4/post-image.sh
> new file mode 100755
> index 0000000..1722c4b
> --- /dev/null
> +++ b/board/hardkernel/odroidxu4/post-image.sh
> @@ -0,0 +1,50 @@
> +#!/bin/sh
> +
> +BOARD_DIR="$(dirname $0)"
> +GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
> +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> +
> +cp ${BOARD_DIR}/boot.ini ${BINARIES_DIR}/
> +
> +rm -rf "${GENIMAGE_TMP}"
> +
> +genimage                           \
> +	--rootpath "${TARGET_DIR}"     \
> +	--tmppath "${GENIMAGE_TMP}"    \
> +	--inputpath "${BINARIES_DIR}"  \
> +	--outputpath "${BINARIES_DIR}" \
> +	--config "${GENIMAGE_CFG}"
> +
> +#dd if=${BINARIES_DIR}/u-boot.bin of=${BINARIES_DIR}/sdcard.img bs=1 count=442 conv=sync,notrunc
> +#dd if=${BINARIES_DIR}/u-boot.bin of=${BINARIES_DIR}/sdcard.img bs=512 skip=1 seek=1 conv=fsync,notrunc

Those lines are commented, they should be removed.

> +
> +signed_bl1_position=0
> +bl2_position=30
> +uboot_position=62
> +tzsw_position=1502
> +device="${BINARIES_DIR}/sdcard.img"
> +uboot="${BINARIES_DIR}/u-boot-dtb.bin"
> +
> +env_position=2015
> +
> +#<BL1 fusing>
> +echo "BL1 fusing"
> +dd if=${BINARIES_DIR}/bl1.bin.hardkernel of=$device seek=$signed_bl1_position conv=fsync,notrunc
> +
> +#<BL2 fusing>
> +echo "BL2 fusing"
> +dd if=${BINARIES_DIR}/bl2.bin.hardkernel.720k_uboot of=$device seek=$bl2_position conv=fsync,notrunc
> +
> +#<u-boot fusing>
> +echo "u-boot fusing"
> +dd if=$uboot of=$device seek=$uboot_position conv=fsync,notrunc
> +
> +#<TrustZone S/W fusing>
> +echo "TrustZone S/W fusing"
> +dd if=${BINARIES_DIR}/tzsw.bin.hardkernel of=$device seek=$tzsw_position conv=fsync,notrunc
> +
> +#<u-boot env erase>
> +echo "u-boot env erase..."
> +dd if=/dev/zero of=$device seek=$env_position bs=512 count=32 conv=fsync,notrunc

Why are you doing all those dd invocations here instead of using a
genimage configuration file that will put all those images at the right
offset in the SD card image ?

> diff --git a/board/hardkernel/odroidxu4/readme.txt b/board/hardkernel/odroidxu4/readme.txt
> new file mode 100644
> index 0000000..24a0184
> --- /dev/null
> +++ b/board/hardkernel/odroidxu4/readme.txt
> @@ -0,0 +1,76 @@
> +Odroid XU-4 board with Samsung Exynos 5422 SoC
> +
> +Introduction
> +------------
> +
> +The Odroid XU 4 board is developed and shipped by Hrdkernel (hardkernel.com). It
> +uses the Samsung Exynos 5422 Soc.
> +
> +Odroid boot process
> +-------------------
> +
> +The odroid boot process requires three stages of boot plus trust zone:
> +
> +    boot level 1
> +
> +        |
> +        V
> +
> +    boot level 2
> +
> +        |
> +        V
> +
> +     u-boot
> +
> +and they need to be raw copied to the SD card in the following order:
> +
> +    +----------------+----------------+
> +    | boot level 1   | 1 block        |
> +    +----------------+----------------+
> +    | boot level 2   | 31 block       |
> +    +----------------+----------------+
> +    | u-boot         | 63 block       |
> +    +----------------+----------------+
> +    | trust zone     | 2111 block     |
> +    +----------------+----------------+
> +    | boot partition | 4096 block     |
> +    +----------------+----------------+

Are those "1 block", "31 block", etc. information the offset or the
size of each part ?

Do we really need this explained in the readme.txt, if the genimage.cfg
file already documents that ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
