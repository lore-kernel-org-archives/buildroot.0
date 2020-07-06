From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 16:45:43 -0700
Subject: [Buildroot] [PATCH 2/2] sifive/hifive-unleashed: Support
 Mainline U-Boot, Linux
In-Reply-To: <20200506100845.4356-2-jagan@amarulasolutions.com>
References: <20200506100845.4356-1-jagan@amarulasolutions.com>
 <20200506100845.4356-2-jagan@amarulasolutions.com>
Message-ID: <CAKmqyKMeM3sviF_Zc2HGJBv=Ys0yNkV32fhKMXA9acZCEP+hXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 6, 2020 at 3:09 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Add Mainline U-Boot, Linux kernel version for
> SiFive HiFive unleashed A00 board.
>
> Now, board would
> - Boot from MMC with U-Boot SPL
> - Linux version v5.6
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  board/sifive/hifive-unleashed/extlinux.conf   |  4 +++
>  board/sifive/hifive-unleashed/genimage.cfg    | 15 ++++++---
>  .../hifive-unleashed/linux.config.fragment    | 13 ++------
>  board/sifive/hifive-unleashed/post-build.sh   |  5 +++
>  board/sifive/hifive-unleashed/readme.txt      | 33 ++++++++++---------
>  configs/hifive_unleashed_defconfig            | 33 ++++++++++++++-----
>  6 files changed, 66 insertions(+), 37 deletions(-)
>  create mode 100644 board/sifive/hifive-unleashed/extlinux.conf
>  create mode 100755 board/sifive/hifive-unleashed/post-build.sh
>
> diff --git a/board/sifive/hifive-unleashed/extlinux.conf b/board/sifive/hifive-unleashed/extlinux.conf
> new file mode 100644
> index 0000000000..496e771d61
> --- /dev/null
> +++ b/board/sifive/hifive-unleashed/extlinux.conf
> @@ -0,0 +1,4 @@
> +label HiFive-Unleashed linux
> +  kernel /boot/Image
> +  devicetree /boot/hifive-unleashed-a00.dtb
> +  append console=ttySIF0 root=/dev/mmcblk0p3 rootwait rw
> diff --git a/board/sifive/hifive-unleashed/genimage.cfg b/board/sifive/hifive-unleashed/genimage.cfg
> index 8eebc52355..21ae2fcb36 100644
> --- a/board/sifive/hifive-unleashed/genimage.cfg
> +++ b/board/sifive/hifive-unleashed/genimage.cfg
> @@ -3,15 +3,22 @@ image sdcard.img {
>                 gpt = true
>         }
>
> -       partition bootloader {
> -               image = "fw_payload.bin"
> -               offset = 1M
> -               size = 32M
> +       partition loader1 {
> +               image = "u-boot-spl.bin"
> +               offset = 17K
> +               size = 1M
> +               partition-type-uuid = 5B193300-FC78-40CD-8002-E86C45580B47
> +       }
> +
> +       partition loader2 {
> +               image = "u-boot.itb"
> +               size = 4M
>                 partition-type-uuid = 2E54B353-1271-4842-806F-E436D6AF6985
>         }
>
>         partition rootfs {
>                 image = "rootfs.ext4"
> +               bootable = true
>                 partition-type-uuid = 0FC63DAF-8483-4772-8E79-3D69D8477DE4
>         }
>  }
> diff --git a/board/sifive/hifive-unleashed/linux.config.fragment b/board/sifive/hifive-unleashed/linux.config.fragment
> index f4f384088a..729746778d 100644
> --- a/board/sifive/hifive-unleashed/linux.config.fragment
> +++ b/board/sifive/hifive-unleashed/linux.config.fragment
> @@ -1,16 +1,9 @@
>  CONFIG_HZ_100=y
> -CONFIG_CMDLINE="earlycon=sbi root=/dev/mmcblk0p2 rootwait"
> -CONFIG_DEVTMPFS_MOUNT=y
> -CONFIG_SERIAL_SIFIVE=y
> -CONFIG_SERIAL_SIFIVE_CONSOLE=y
> -CONFIG_SPI=y
> -CONFIG_SPI_SIFIVE=y
>  CONFIG_GPIOLIB=y
>  CONFIG_GPIO_SYSFS=y
>  CONFIG_GPIO_SIFIVE=y
> -CONFIG_MMC=y
> -CONFIG_MMC_SPI=y
> -CONFIG_CLK_U54_PRCI=y
> -CONFIG_CLK_GEMGXL_MGMT=y
> +CONFIG_MTD=y
> +CONFIG_MTD_SPI_NOR=y
> +CONFIG_MTD_BLOCK=y
>  CONFIG_PWM=y
>  CONFIG_PWM_SIFIVE=y

Looks good.

> diff --git a/board/sifive/hifive-unleashed/post-build.sh b/board/sifive/hifive-unleashed/post-build.sh
> new file mode 100755
> index 0000000000..1f5ff6a611
> --- /dev/null
> +++ b/board/sifive/hifive-unleashed/post-build.sh
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +
> +BOARD_DIR="$(dirname $0)"
> +
> +install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
> diff --git a/board/sifive/hifive-unleashed/readme.txt b/board/sifive/hifive-unleashed/readme.txt
> index 8d3fa6357f..9e337e17bc 100644
> --- a/board/sifive/hifive-unleashed/readme.txt
> +++ b/board/sifive/hifive-unleashed/readme.txt
> @@ -30,35 +30,29 @@ Once the build has finished you will have the following files:
>      output/images/
>      +-- fw_jump.bin
>      +-- fw_jump.elf
> -    +-- fw_payload.bin
> -    +-- fw_payload.elf
> +    +-- fw_dynamic.bin
> +    +-- fw_dynamic.elf
> +    +-- u-boot-spl.bin
> +    +-- u-boot.itb
>      +-- Image
>      +-- rootfs.ext2
>      +-- rootfs.ext4
>      +-- rootfs.tar
>      +-- sdcard.img
>
> -
> -Creating a bootable SD card with genimage
> -=========================================
> +Booting from MMC on the board
> +=============================
>
>  Buildroot builds a SD card image for you. All you need to do is dd the
>  image to your SD card, which can be done with the following command:
>
> -  $ sudo dd if=output/images/sdcard.img of=/dev/mmcblk0 bs=4096
> -
> -Booting the SD card on the board
> -================================
> +  $ sudo dd if=output/images/sdcard.img of=/dev/mmcblk0
>
> -Make sure that the all DIP switches are set to the off position for
> -default boot mode (MSEL mode = 1111), insert the SD card and power
> -up the board.
> +Make sure that the DIP switches MSEL[3:0] are set to 1011 for booting
> +from MMC. Insert the SD card and power up the board.
>
>  Connect the USB cable and open minicom (/dev/ttyUSB1, 115200, 8N1).
>
> -See the 'SiFive HiFive Unleashed Getting Started Guide' for
> -more details (https://www.sifive.com/documentation).
> -
>  You will get a warning reported by fdisk when you examine the SD card.
>  This is because the genimage.cfg file doesn't specify the SD card size
>  (as people will naturally have different sized cards), so the
> @@ -73,3 +67,12 @@ You will see something like this at boot time:
>  [    2.334824] GPT:190496 != 122142719
>  [    2.338302] GPT: Use GNU Parted to correct GPT errors.
>  [    2.343456]  mmcblk0: p1 p2
> +

Looks good.

> +Documentation
> +=============
> +See the 'SiFive HiFive Unleashed Getting Started Guide' for
> +more details (https://www.sifive.com/documentation).
> +
> +See the Amarula Solutions BSP sifive wiki for information of
> +usage and indetail steps.
> +https://wiki.amarulasolutions.com/bsp/riscv/sifive/hifive-unleashed.html

I don't think we want to include this.

> diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
> index 24576570da..0fa40f225e 100644
> --- a/configs/hifive_unleashed_defconfig
> +++ b/configs/hifive_unleashed_defconfig
> @@ -14,27 +14,44 @@ BR2_TARGET_GENERIC_GETTY=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttySIF0"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sifive/hifive-unleashed/genimage.cfg"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/sifive/hifive-unleashed/post-build.sh"
>
>  # Filesystem
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
>
> -# Linux headers same as kernel, a 5.1 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1=y
> +# Linux headers same as kernel, a 5.6 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
>
>  # Kernel
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/alistair23/linux.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="hifive-unleashed-5.1"

Woo, good job getting rid of a fork.

> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sifive/hifive-unleashed/linux.config.fragment"
> -BR2_LINUX_KERNEL_IMAGE=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="sifive/hifive-unleashed-a00"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>
> -# Bootloader
> +# opensbi
>  BR2_TARGET_OPENSBI=y
>  BR2_TARGET_OPENSBI_PLAT="sifive/fu540"
> -BR2_TARGET_OPENSBI_LINUX_PAYLOAD=y
> +BR2_TARGET_OPENSBI_FW_DYNAMIC=y
> +
> +# Bootloader
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,amarula,u-boot-amarula)v3.0-hifive-unleashed.tar.gz"

We should just be able to use mainline u-boot.

Alistair

> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sifive_fu540"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSBI_FW_DYNAMIC=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin"
>
>  # Host tools
>  BR2_PACKAGE_HOST_GENIMAGE=y
> --
> 2.17.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
