From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Oct 2015 13:45:19 +0200
Subject: [Buildroot] [PATCH 2/4] board/raspberrypi: prepare the image
 files for the target
In-Reply-To: <1440273688-92868-2-git-send-email-benoit@wsystem.com>
References: <20150820143005.GA6441@ketchup.mtl.sfl>
 <1440273688-92868-2-git-send-email-benoit@wsystem.com>
Message-ID: <20151017114519.GA3717@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Beno?t, All,

On 2015-08-22 22:01 +0200, Beno?t Th?baudeau spake thusly:
> Automate the preparation of the generated image files for the Raspberry
> Pi firmware:
>  - mark the kernel image as supporting Device Tree,
>  - place the marked kernel image and the DTBs into the rpi-firmware
>    folder.
> 
> The instructions in readme.txt are updated accordingly.
> 
> Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
> ---
>  board/raspberrypi/post-image.sh | 17 ++++++++
>  board/raspberrypi/readme.txt    | 90 ++++++++++++++++++-----------------------
>  configs/raspberrypi2_defconfig  |  2 +
>  configs/raspberrypi_defconfig   |  2 +
>  4 files changed, 60 insertions(+), 51 deletions(-)
>  create mode 100755 board/raspberrypi/post-image.sh
> 
> diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
> new file mode 100755
> index 0000000..db9c53c
> --- /dev/null
> +++ b/board/raspberrypi/post-image.sh
> @@ -0,0 +1,17 @@
> +#!/bin/bash -e
> +
> +RPI_FW_BIN_DIR="${BINARIES_DIR}/rpi-firmware"
> +KERNEL_IMG="${BINARIES_DIR}/zImage"
> +KERNEL_RPI_FW_IMG="${RPI_FW_BIN_DIR}/zImage"
> +
> +# A special marker must be appended to the kernel image so that the firmware of
> +# the Raspberry Pi knows that it supports Device Tree. Without this marker, the
> +# firmware passes the ATAGS boot data instead of the appropriate DTB to the
> +# kernel.
> +# The final kernel image must be in the rpi-firmware folder.
> +mkknlimg "${KERNEL_IMG}" "${KERNEL_RPI_FW_IMG}"
> +
> +# Move the DTBs where the firmware expects them to be, i.e. to the rpi-firmware
> +# folder.
> +find "${BINARIES_DIR}/" -maxdepth 1 -type f -name '*.dtb' -print0 | \
> +	xargs -0r mv -ft "${RPI_FW_BIN_DIR}/"

Why not simply:
    cp -l "${BINARIES_DIR}/"*.dtb "${RPI_FW_BIN_DIR}"

I'd prefer we keep the DTB files where they were installed, so the user
does not get confused.

> diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
> index cf95879..168fab5 100644
> --- a/board/raspberrypi/readme.txt
> +++ b/board/raspberrypi/readme.txt
[--SNIP--]
> @@ -61,77 +61,65 @@ Result of the build
>  After building, you should obtain this tree:
>  
>      output/images/
> -    +-- rootfs.tar                  [0]
> +    +-- rootfs.cpio                 [0]
> +    +-- rootfs.tar                  [1]
>      +-- rpi-firmware/
> +    |   +-- bcm2708-rpi-b.dtb       [2]
> +    |   +-- bcm2708-rpi-b-plus.dtb  [3]
> +    |   +-- bcm2709-rpi-2-b.dtb     [4]
>      |   +-- bootcode.bin
> +    |   +-- cmdline.txt             [5]
>      |   +-- config.txt
>      |   +-- fixup.dat
> -    |   `-- start.elf
> -    +-- bcm2708-rpi-b.dtb           [1]
> -    +-- bcm2708-rpi-b-plus.dtb      [1]
> -    +-- bcm2709-rpi-2-b.dtb         [1]

As I said above, I'd prefer the DTB files be left in their original
location, with the ones in rpi-firmware/ being only copies of, or
hard-links to, the originals.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
