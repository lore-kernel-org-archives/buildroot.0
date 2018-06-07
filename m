From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 7 Jun 2018 12:26:11 +0530
Subject: [Buildroot] [PATCH 1/1] buildroot Added Banana Pi M2 Ultra
 platform
In-Reply-To: <BN6PR11MB13157AA031A4773651C514E492650@BN6PR11MB1315.namprd11.prod.outlook.com>
References: <BN6PR11MB13157AA031A4773651C514E492650@BN6PR11MB1315.namprd11.prod.outlook.com>
Message-ID: <CAMty3ZDyag0HisyvET+NawX4+cwjCX0_x8ZiFVr05PGc+6UJVw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 6, 2018 at 1:30 PM, Marc Sandusky <marc_sandusky@outlook.com> wrote:
> Added a default configuration file and supporting board support files
> for the Banana Pi M2 Ultra platform. The port is based on the port for
> the Banana Pi M2 Plus platform, and provides for a duplicate feature
> set. In addition to the default configuration file this port includes a
> boot script, an SD card definition file and a readme file explaining its
> usage.
>
> Signed-off-by: Marc Sandusky <marc_sandusky@outlook.com>
> ---
>  board/bananapi/bananapi-m2u/boot.cmd     |  7 +++++
>  board/bananapi/bananapi-m2u/genimage.cfg | 33 +++++++++++++++++++++++
>  board/bananapi/bananapi-m2u/readme.txt   | 34 ++++++++++++++++++++++++
>  configs/bananapi_m2_ultra_defconfig      | 28 +++++++++++++++++++
>  4 files changed, 102 insertions(+)
>  create mode 100644 board/bananapi/bananapi-m2u/boot.cmd
>  create mode 100644 board/bananapi/bananapi-m2u/genimage.cfg
>  create mode 100644 board/bananapi/bananapi-m2u/readme.txt
>  create mode 100644 configs/bananapi_m2_ultra_defconfig
>
> diff --git a/board/bananapi/bananapi-m2u/boot.cmd b/board/bananapi/bananapi-m2u/boot.cmd
> new file mode 100644
> index 0000000000..9c24eabff6
> --- /dev/null
> +++ b/board/bananapi/bananapi-m2u/boot.cmd
> @@ -0,0 +1,7 @@
> +setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
> +
> +mmc dev 0
> +fatload mmc 0 $kernel_addr_r zImage
> +fatload mmc 0 $fdt_addr_r sun8i-r40-bananapi-m2-ultra.dtb
> +
> +bootz $kernel_addr_r - $fdt_addr_r
> diff --git a/board/bananapi/bananapi-m2u/genimage.cfg b/board/bananapi/bananapi-m2u/genimage.cfg
> new file mode 100644
> index 0000000000..675253af23
> --- /dev/null
> +++ b/board/bananapi/bananapi-m2u/genimage.cfg
> @@ -0,0 +1,33 @@
> +image boot.vfat {
> +       vfat {
> +               files = {
> +                       "zImage",
> +                       "sun8i-r40-bananapi-m2-ultra.dtb",
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
> +       partition u-boot {
> +               in-partition-table = "no"
> +               image = "u-boot-sunxi-with-spl.bin"
> +               offset = 8192
> +               size = 1040384 # 1MB - 8192
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
> diff --git a/board/bananapi/bananapi-m2u/readme.txt b/board/bananapi/bananapi-m2u/readme.txt
> new file mode 100644
> index 0000000000..d48fb4b9ba
> --- /dev/null
> +++ b/board/bananapi/bananapi-m2u/readme.txt
> @@ -0,0 +1,34 @@
> +Intro
> +=====
> +
> +This default configuration will allow you to start experimenting with the
> +buildroot environment for the Bananapi M2U. With the current configuration
> +it will bring-up the board, and allow access through the serial console.
> +
> +Bananapi M2U link:
> +http://www.banana-pi.org/m2u.html
> +
> +This configuration uses U-Boot mainline and kernel mainline.
> +
> +How to build
> +============
> +
> +    $ make bananapi_m2_ultra_defconfig
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
> +Insert the micro SDcard in your Bananapi M2U and power it up. The console
> +is on the serial line, 115200 8N1.
> diff --git a/configs/bananapi_m2_ultra_defconfig b/configs/bananapi_m2_ultra_defconfig
> new file mode 100644
> index 0000000000..ec8a110145
> --- /dev/null
> +++ b/configs/bananapi_m2_ultra_defconfig
> @@ -0,0 +1,28 @@
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M2 Ultra"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m2u/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.15"
> +BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-r40-bananapi-m2-ultra"
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.03"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Bananapi_M2_Ultra"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"

Can it be BR2_TARGET_UBOOT_SPL_NAME ?

and also better to move configs like m1_defconfig for better readability.

Jagan.

-- 
Jagan Teki
Senior Linux Kernel Engineer | Amarula Solutions
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
