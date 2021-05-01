From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sat, 1 May 2021 10:37:34 -0400
Subject: [Buildroot] [PATCH 4/4] configs/beaglev_defconfig: new defconfig
In-Reply-To: <20210429074636.724046-5-thomas.petazzoni@bootlin.com>
References: <20210429074636.724046-1-thomas.petazzoni@bootlin.com>
 <20210429074636.724046-5-thomas.petazzoni@bootlin.com>
Message-ID: <CA+-urNQ89GnOx_dueywtxa6wbDQ2QCYHWcEDENniEL3sn9+bow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 29, 2021 at 3:48 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> This commit introduces support for the RISC-V based Beagle-V platform,
> which uses a Starfive VIC-7100.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> diff --git a/board/beaglev/post-build.sh b/board/beaglev/post-build.sh
> new file mode 100755
> index 0000000000..0e7337c96d
> --- /dev/null
> +++ b/board/beaglev/post-build.sh
> @@ -0,0 +1,17 @@
> +#!/bin/sh
> +BOARD_DIR=$(dirname $0)
> +
> +# The DTB to use is provided within the U-Boot source tree, so we grab
> +# it from there, and install it to TARGET_DIR/boot/.
> +UBOOT_DIR=$(make --no-print-directory VARS=UBOOT_DIR printvars | cut -f2 -d'=')

I had to set the directory for make since it was being run out of the
Buildroot source directory rather than my output directory:

UBOOT_DIR=$(make -C${O} --no-print-directory VARS=UBOOT_DIR printvars
| cut -f2 -d'=')

After that change, everything seems to work great! Thanks for this.
This patch made getting started with the BeagleV super easy.

Tested-by: Frank Hunleth <fhunleth@troodon-software.com>

-Frank


> +install -D -m0644 ${UBOOT_DIR}/arch/riscv/dts/starfive_vic7100_beagle_v.dtb \
> +       ${TARGET_DIR}/boot/starfive_vic7100_beagle_v.dtb
> +
> +# Bring the extlinux.conf file in.
> +install -D -m 0644 ${BOARD_DIR}/extlinux.conf \
> +       ${TARGET_DIR}/boot/extlinux/extlinux.conf
> +
> +# To be reflashed through Xmodem, the bootloader needs to be prepended
> +# with a 4-byte header that contains the total size of the file.
> +perl -e 'print pack("l", (stat @ARGV[0])[7])' ${BINARIES_DIR}/fw_payload.bin > ${BINARIES_DIR}/fw_payload.bin.flash
> +cat ${BINARIES_DIR}/fw_payload.bin >> ${BINARIES_DIR}/fw_payload.bin.flash
> diff --git a/board/beaglev/readme.txt b/board/beaglev/readme.txt
> new file mode 100644
> index 0000000000..903dd7975e
