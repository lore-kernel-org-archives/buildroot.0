From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 18 Apr 2019 21:24:18 +0530
Subject: [Buildroot] [PATCH] configs/oceanic_5205_5inmfd: Add Oceanic
 5205 5inMFD board support
In-Reply-To: <20190418153811.27299-1-shyam.saini@amarulasolutions.com>
References: <20190418153811.27299-1-shyam.saini@amarulasolutions.com>
Message-ID: <CAMty3ZApPo6132ae+_Asv-obv=EDq_WKTtgKTE04yy+fO1P13A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 18, 2019 at 9:08 PM Shyam Saini
<shyam.saini@amarulasolutions.com> wrote:
>
> From: Jagan Teki <jagan@amarulasolutions.com>
>
> This board is from sunx50i A64 SOC family.
> This initial support has following features:
>     - Mainline U-Boot
>     - Linux 5.0
>     - Default packages from buildroot
>

Please fix the commit head

board: Add Oceanic 5205 5inMFD support

> Tested-by: Tamas Papp <tamas@osukl.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
> ---
>  .gitlab-ci.yml                         |  1 +
>  DEVELOPERS                             |  2 ++
>  board/oceanic/5205-5inmfd/boot.cmd     |  6 ++++
>  board/oceanic/5205-5inmfd/genimage.cfg | 39 ++++++++++++++++++++++++++
>  board/oceanic/5205-5inmfd/readme.txt   | 35 ++++++++++++++++++++++++
>  configs/oceanic_5205_5inmfd_defconfig  | 50 ++++++++++++++++++++++++++++++++++
>  6 files changed, 133 insertions(+)
>  create mode 100644 board/oceanic/5205-5inmfd/boot.cmd
>  create mode 100644 board/oceanic/5205-5inmfd/genimage.cfg
>  create mode 100644 board/oceanic/5205-5inmfd/readme.txt
>  create mode 100644 configs/oceanic_5205_5inmfd_defconfig
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index ef16b73bfb..02d6f6c0cc 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -181,6 +181,7 @@ nitrogen6sx_defconfig: { extends: .defconfig }
>  nitrogen6x_defconfig: { extends: .defconfig }
>  nitrogen7_defconfig: { extends: .defconfig }
>  nitrogen8m_defconfig: { extends: .defconfig }
> +oceanic_5205_5inmfd_defconfig: { extends: .defconfig }
>  odroidc2_defconfig: { extends: .defconfig }
>  odroidxu4_defconfig: { extends: .defconfig }
>  olimex_a10_olinuxino_lime_defconfig: { extends: .defconfig }
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 3e0ac08e11..f23479703b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1000,6 +1000,7 @@ F:        board/bananapi/
>  F:     board/engicam/
>  F:     board/friendlyarm/nanopi-a64/
>  F:     board/friendlyarm/nanopi-neo2/
> +F:     board/oceanic/
>  F:     board/olimex/a64-olinuxino/
>  F:     board/orangepi/orangepi-lite2/
>  F:     board/orangepi/orangepi-one-plus
> @@ -1020,6 +1021,7 @@ F:        configs/engicam_imx6ul_geam_defconfig
>  F:     configs/engicam_imx6ul_isiot_defconfig
>  F:     configs/friendlyarm_nanopi_a64_defconfig
>  F:     configs/friendlyarm_nanopi_neo2_defconfig
> +F:     configs/oceanic_5205_5inmfd_defconfig
>  F:     configs/olimex_a64_olinuxino_defconfig
>  F:     configs/orangepi_lite2_defconfig
>  F:     configs/orangepi_one_plus_defconfig
> diff --git a/board/oceanic/5205-5inmfd/boot.cmd b/board/oceanic/5205-5inmfd/boot.cmd
> new file mode 100644
> index 0000000000..b9c5f0e829
> --- /dev/null
> +++ b/board/oceanic/5205-5inmfd/boot.cmd
> @@ -0,0 +1,6 @@
> +setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
> +
> +fatload mmc 0 $kernel_addr_r Image
> +fatload mmc 0 $fdt_addr_r sun50i-a64-oceanic-5205-5inmfd.dtb
> +
> +booti $kernel_addr_r - $fdt_addr_r
> diff --git a/board/oceanic/5205-5inmfd/genimage.cfg b/board/oceanic/5205-5inmfd/genimage.cfg
> new file mode 100644
> index 0000000000..047fa488a3
> --- /dev/null
> +++ b/board/oceanic/5205-5inmfd/genimage.cfg
> @@ -0,0 +1,39 @@
> +image boot.vfat {
> +       vfat {
> +               files = {
> +                       "Image",
> +                       "sun50i-a64-oceanic-5205-5inmfd.dtb",
> +                       "boot.scr"
> +               }
> +       }
> +       size = 64M
> +}
> +
> +image sdcard.img {
> +       hdimage {
> +       }
> +
> +       partition spl {
> +               in-partition-table = "no"
> +               image = "sunxi-spl.bin"
> +               offset = 8192
> +       }
> +
> +       partition u-boot {
> +               in-partition-table = "no"
> +               image = "u-boot.itb"
> +               offset = 40K
> +               size = 1M # 1MB - 40K
> +       }
> +
> +       partition boot {
> +               partition-type = 0xC
> +               bootable = "true"
> +               image = "boot.vfat"
> +       }
> +
> +       partition rootfs {
> +               partition-type = 0x83
> +               image = "rootfs.ext4"
> +       }
> +}
> diff --git a/board/oceanic/5205-5inmfd/readme.txt b/board/oceanic/5205-5inmfd/readme.txt
> new file mode 100644
> index 0000000000..d9cd08c9d8
> --- /dev/null
> +++ b/board/oceanic/5205-5inmfd/readme.txt
> @@ -0,0 +1,35 @@
> +Intro
> +=====
> +
> +This default configuration will allow you to start experimenting with the
> +buildroot environment for the SoPine. With the current configuration
> +it will bring-up the board, and allow access through the serial console.
> +
> +Wiki link:
> +https://openedev.amarulasolutions.com/display/ODWIKI/SoPine
> +
> +This configuration uses U-Boot mainline and kernel mainline.
> +
> +How to build
> +============
> +
> +    $ make pine64_sopine_defconfig
> +
> +    $ make
> +
> +Note: you will need access to the internet to download the required
> +sources.
> +
> +How to write the SD card
> +========================
> +
> +Once the build process is finished you will have an image called "sdcard.img"
> +in the output/images/ directory.
> +
> +Copy the bootable "sdcard.img" onto an SD card with "dd":
> +
> +  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
> +  $ sudo sync
> +
> +Insert the micro SDcard in your SoPine and power it up. The console
> +is on the serial line, 115200 8N1.

Look like you forgot to replace SoPine with Oceanic.
