From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Jun 2019 14:23:29 -0700
Subject: [Buildroot] [PATCH 2/2] board/sifive: Add the HiFive Unleased
In-Reply-To: <20190618230250.12539-2-alistair.francis@wdc.com>
References: <20190618230250.12539-1-alistair.francis@wdc.com>
 <20190618230250.12539-2-alistair.francis@wdc.com>
Message-ID: <CAKmqyKPTk4ji=i0Ov2MUsTJrOmg8DxXvorsd2LeyzeHj3NZJvQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 18, 2019 at 4:05 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> This patch adds support for the HiFive Unleashed board. This includes
> building the firmware, kernel and rootFS for the HiFive Unleased.
>
> This patch includes a post-image.sh script and genimage.cfg file
> used to generate a sdcard image that can be dd-ed to an SD card.
> Unfortunately this seems to create a corrupted GPT partition, so manual
> steps with sgdisk are also included which work.
>
> The manual steps are useful even when genimage works as
> users won't always need to flash the entire SD card. For example a
> kernel update will only require one partition being updated manually via
> dd instead of a full reflash.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Ping?

Alistair

> ---
>  DEVELOPERS                                    |  2 +
>  board/sifive/hifive_unleased/genimage.cfg     | 17 ++++
>  .../hifive_unleased/linux.config.fragment     | 16 ++++
>  board/sifive/hifive_unleased/post-image.sh    |  9 ++
>  board/sifive/hifive_unleased/readme.txt       | 93 +++++++++++++++++++
>  configs/hifive_unleashed_defconfig            | 40 ++++++++
>  6 files changed, 177 insertions(+)
>  create mode 100644 board/sifive/hifive_unleased/genimage.cfg
>  create mode 100644 board/sifive/hifive_unleased/linux.config.fragment
>  create mode 100755 board/sifive/hifive_unleased/post-image.sh
>  create mode 100644 board/sifive/hifive_unleased/readme.txt
>  create mode 100644 configs/hifive_unleashed_defconfig
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 62aacc1fd0..47b23d1d60 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -123,7 +123,9 @@ F:  package/kvazaar/
>  F:     package/v4l2loopback/
>
>  N:     Alistair Francis <alistair@alistair23.me>
> +F:     board/sifive/
>  F:     boot/opensbi/
> +F:     configs/hifive_unleashed_defconfig
>  F:     package/xen/
>
>  N:     Alvaro G. M <alvaro.gamez@hazent.com>
> diff --git a/board/sifive/hifive_unleased/genimage.cfg b/board/sifive/hifive_unleased/genimage.cfg
> new file mode 100644
> index 0000000000..ed5323927e
> --- /dev/null
> +++ b/board/sifive/hifive_unleased/genimage.cfg
> @@ -0,0 +1,17 @@
> +image sdcard.img {
> +       hdimage {
> +               gpt = true
> +       }
> +
> +       partition bootloader {
> +               image = "fw_payload.bin"
> +               offset = 2048
> +               size = 33554432 # 32MB
> +               partition-uuid = 2E54B353-1271-4842-806F-E436D6AF6985
> +       }
> +
> +       partition rootfs {
> +               image = "rootfs.ext4"
> +               partition-uuid = 0FC63DAF-8483-4772-8E79-3D69D8477DE4
> +       }
> +}
> diff --git a/board/sifive/hifive_unleased/linux.config.fragment b/board/sifive/hifive_unleased/linux.config.fragment
> new file mode 100644
> index 0000000000..f4f384088a
> --- /dev/null
> +++ b/board/sifive/hifive_unleased/linux.config.fragment
> @@ -0,0 +1,16 @@
> +CONFIG_HZ_100=y
> +CONFIG_CMDLINE="earlycon=sbi root=/dev/mmcblk0p2 rootwait"
> +CONFIG_DEVTMPFS_MOUNT=y
> +CONFIG_SERIAL_SIFIVE=y
> +CONFIG_SERIAL_SIFIVE_CONSOLE=y
> +CONFIG_SPI=y
> +CONFIG_SPI_SIFIVE=y
> +CONFIG_GPIOLIB=y
> +CONFIG_GPIO_SYSFS=y
> +CONFIG_GPIO_SIFIVE=y
> +CONFIG_MMC=y
> +CONFIG_MMC_SPI=y
> +CONFIG_CLK_U54_PRCI=y
> +CONFIG_CLK_GEMGXL_MGMT=y
> +CONFIG_PWM=y
> +CONFIG_PWM_SIFIVE=y
> diff --git a/board/sifive/hifive_unleased/post-image.sh b/board/sifive/hifive_unleased/post-image.sh
> new file mode 100755
> index 0000000000..2051ee49cb
> --- /dev/null
> +++ b/board/sifive/hifive_unleased/post-image.sh
> @@ -0,0 +1,9 @@
> +#!/bin/sh
> +
> +# Script to generate a SD card image for the HiFive Unleashed.
> +
> +# We need to make sure that this is updated
> +make opensbi-rebuild
> +
> +support/scripts/genimage.sh -c board/sifive/hifive_unleased/genimage.cfg
> +
> diff --git a/board/sifive/hifive_unleased/readme.txt b/board/sifive/hifive_unleased/readme.txt
> new file mode 100644
> index 0000000000..a126fa92c4
> --- /dev/null
> +++ b/board/sifive/hifive_unleased/readme.txt
> @@ -0,0 +1,93 @@
> +SiFive HiFive Unleashed
> +=======================
> +
> +This file describes how to use the pre-defined Buildroot
> +configuration for the SiFive HiFive Unleashed board.
> +
> +Further information about the HiFive Unleashed board can be found
> +at https://www.sifive.com/boards/hifive-unleashed
> +
> +Building
> +========
> +
> +Configure Buildroot using the default board configuration:
> +
> +  $ make hifive_unleashed_defconfig
> +
> +Customise the build as necessary:
> +
> +  $ make menuconfig
> +
> +Start the build:
> +
> +  $ make
> +
> +Result of the build
> +===================
> +
> +Once the build has finished you will have the following files:
> +
> +    output/images/
> +    +-- fw_jump.bin
> +    +-- fw_jump.elf
> +    +-- fw_payload.bin
> +    +-- fw_payload.elf
> +    +-- Image
> +    +-- rootfs.ext2
> +    +-- rootfs.ext4
> +    +-- rootfs.tar
> +    +-- sdcard.img
> +
> +
> +Creating a bootable SD card with genimage
> +=========================================
> +
> +At the current time the genimage utility used by Buildroot produces
> +corrupt GPT partition images. This is documented here for future use,
> +but at the time of writing does not work.
> +
> +Buildroot builds a SD card image for you. All you need to do is dd the
> +image to your SD card, which can be done with the following command:
> +
> +  $ sudo dd if=output/images/sdcard.img of=/dev/mmcblk0 bs=4096
> +
> +Creating a bootable SD card with sgdisk
> +=======================================
> +
> +Below are manual instructions to setup the SD card. These should be
> +removed when genimage can be used instead.
> +
> +Create the partitions on the SD card:
> +
> +  $ sudo sgdisk -g --clear \
> +        --new=1:2048:67583  \
> +        --change-name=1:bootloader \
> +        --typecode=1:2E54B353-1271-4842-806F-E436D6AF6985 \
> +        --new=2:264192: \
> +        --change-name=2:root \
> +        --typecode=2:0FC63DAF-8483-4772-8E79-3D69D8477DE4 \
> +        /dev/mmcblk0
> +
> +The first partition will contain the bootloader and kernel
> +(fw_payload.bin). The second partition contains the Linux
> +filesystem.
> +
> +Copy the bootloader and kernel to the SD card:
> +
> +  $ sudo dd if=output/images/fw_payload.bin of=/dev/mmcblk0p1 bs=4096
> +
> +Copy the rootFS to the SD card:
> +
> +  $ sudo dd if=output/images/rootfs.ext4 of=/dev/mmcblk0p2 bs=4096
> +
> +Booting the SD card on the board
> +================================
> +
> +Make sure that the all DIP switches are set to the off position for
> +default boot mode (MSEL mode = 1111), insert the SD card and power
> +up the board.
> +
> +Connect the USB cable and open minicom (/dev/ttyUSB1, 115200, 8N1).
> +
> +See the 'SiFive HiFive Unleashed Getting Started Guide' for
> +more details (https://www.sifive.com/documentation).
> diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
> new file mode 100644
> index 0000000000..8a2a9303d9
> --- /dev/null
> +++ b/configs/hifive_unleashed_defconfig
> @@ -0,0 +1,40 @@
> +# Architecture
> +BR2_riscv=y
> +BR2_riscv_custom=y
> +BR2_RISCV_ISA_CUSTOM_RVM=y
> +BR2_RISCV_ISA_CUSTOM_RVF=y
> +BR2_RISCV_ISA_CUSTOM_RVD=y
> +BR2_RISCV_ISA_CUSTOM_RVC=y
> +BR2_RISCV_64=y
> +BR2_RISCV_ABI_LP64D=y
> +
> +# System
> +BR2_SYSTEM_DHCP="eth0"
> +BR2_TARGET_GENERIC_GETTY=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttySIF0"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/sifive/hifive_unleased/post-image.sh"
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +
> +# Linux headers same as kernel, a 5.1 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1=y
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/alistair23/linux.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="hifive-unleashed-5.1"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sifive/hifive_unleased/linux.config.fragment"
> +BR2_LINUX_KERNEL_IMAGE=y
> +
> +# Bootloader
> +BR2_TARGET_OPENSBI=y
> +BR2_TARGET_OPENSBI_USE_PLAT=y
> +BR2_TARGET_OPENSBI_PLAT="sifive/fu540"
> +BR2_TARGET_OPENSBI_LINUX_PAYLOAD=y
> +
> +# Host tools
> +BR2_PACKAGE_HOST_GENIMAGE=y
> --
> 2.22.0
>
