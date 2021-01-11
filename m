From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 11 Jan 2021 11:08:53 -0800
Subject: [Buildroot] [PATCH 2/2] board/sifive: Update
 hifive_unleashed_defconfig and genimage.cfg
In-Reply-To: <1610355672-3008-3-git-send-email-bmeng.cn@gmail.com>
References: <1610355672-3008-1-git-send-email-bmeng.cn@gmail.com>
 <1610355672-3008-3-git-send-email-bmeng.cn@gmail.com>
Message-ID: <CAKmqyKM8Yqxg=wkx3YhcHhA2-9D5VNY54mLQu=B5Hu51vGt8TA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 11, 2021 at 1:01 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Update to use the official linux kernel instead of an out-of-tree
> kernel, and use the official U-Boot as the bootloader. Provide
> two configuration files of genimage for different boot flows:
>
> - Boot from SD card (default)
> - Boot from SPI flash
>
> A boot script is generated to automatically boot the distro.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  board/sifive/hifive-unleashed/boot.cmd             |  4 ++
>  .../{genimage.cfg => genimage_sdcard.cfg}          | 14 +++--
>  board/sifive/hifive-unleashed/genimage_spi-nor.cfg | 25 ++++++++
>  .../sifive/hifive-unleashed/linux.config.fragment  | 14 ++---
>  board/sifive/hifive-unleashed/post-build.sh        |  2 +
>  board/sifive/hifive-unleashed/readme.txt           | 68 +++++++++++++++++-----
>  configs/hifive_unleashed_defconfig                 | 32 +++++++---
>  7 files changed, 123 insertions(+), 36 deletions(-)
>  create mode 100644 board/sifive/hifive-unleashed/boot.cmd
>  rename board/sifive/hifive-unleashed/{genimage.cfg => genimage_sdcard.cfg} (51%)
>  create mode 100644 board/sifive/hifive-unleashed/genimage_spi-nor.cfg
>  create mode 100755 board/sifive/hifive-unleashed/post-build.sh
>
> diff --git a/board/sifive/hifive-unleashed/boot.cmd b/board/sifive/hifive-unleashed/boot.cmd
> new file mode 100644
> index 0000000..deaedef
> --- /dev/null
> +++ b/board/sifive/hifive-unleashed/boot.cmd
> @@ -0,0 +1,4 @@
> +setenv bootargs earlycon=sbi root=/dev/mmcblk0p3 rootwait
> +load ${devtype} ${devnum}:${distro_bootpart} ${kernel_addr_r} boot/Image
> +load ${devtype} ${devnum}:${distro_bootpart} ${fdt_addr_r} boot/hifive-unleashed-a00.dtb
> +booti ${kernel_addr_r} - ${fdt_addr_r}
> diff --git a/board/sifive/hifive-unleashed/genimage.cfg b/board/sifive/hifive-unleashed/genimage_sdcard.cfg
> similarity index 51%
> rename from board/sifive/hifive-unleashed/genimage.cfg
> rename to board/sifive/hifive-unleashed/genimage_sdcard.cfg
> index 8eebc52..e7f98a4 100644
> --- a/board/sifive/hifive-unleashed/genimage.cfg
> +++ b/board/sifive/hifive-unleashed/genimage_sdcard.cfg
> @@ -3,15 +3,21 @@ image sdcard.img {
>                 gpt = true
>         }
>
> -       partition bootloader {
> -               image = "fw_payload.bin"
> -               offset = 1M
> -               size = 32M
> +       partition u-boot-spl {
> +               image = "u-boot-spl.bin"
> +               offset = 17K
> +               partition-type-uuid = 5B193300-FC78-40CD-8002-E86C45580B47
> +       }
> +
> +       partition u-boot {
> +               image = "u-boot.itb"
> +               offset = 1041K
>                 partition-type-uuid = 2E54B353-1271-4842-806F-E436D6AF6985
>         }
>
>         partition rootfs {
>                 image = "rootfs.ext4"
>                 partition-type-uuid = 0FC63DAF-8483-4772-8E79-3D69D8477DE4
> +               bootable = true
>         }
>  }
> diff --git a/board/sifive/hifive-unleashed/genimage_spi-nor.cfg b/board/sifive/hifive-unleashed/genimage_spi-nor.cfg
> new file mode 100644
> index 0000000..7f90997
> --- /dev/null
> +++ b/board/sifive/hifive-unleashed/genimage_spi-nor.cfg
> @@ -0,0 +1,25 @@
> +image spi-nor.img {
> +       size = 32M
> +
> +       hdimage {
> +               gpt = true
> +       }
> +
> +       partition u-boot-spl {
> +               image = "u-boot-spl.bin"
> +               offset = 20K
> +               partition-type-uuid = 5B193300-FC78-40CD-8002-E86C45580B47
> +       }
> +
> +       partition u-boot {
> +               image = "u-boot.itb"
> +               offset = 1044K
> +               partition-type-uuid = 2E54B353-1271-4842-806F-E436D6AF6985
> +       }
> +
> +       partition rootfs {
> +               image = "rootfs.ext4"
> +               partition-type-uuid = 0FC63DAF-8483-4772-8E79-3D69D8477DE4
> +               bootable = true
> +       }
> +}
> diff --git a/board/sifive/hifive-unleashed/linux.config.fragment b/board/sifive/hifive-unleashed/linux.config.fragment
> index f4f3840..385a961 100644
> --- a/board/sifive/hifive-unleashed/linux.config.fragment
> +++ b/board/sifive/hifive-unleashed/linux.config.fragment
> @@ -1,16 +1,10 @@
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
> +CONFIG_POWER_RESET_GPIO_RESTART=y
> +CONFIG_MTD=y
> +CONFIG_MTD_BLOCK=y
> +CONFIG_MTD_SPI_NOR=y
>  CONFIG_PWM=y
>  CONFIG_PWM_SIFIVE=y
> diff --git a/board/sifive/hifive-unleashed/post-build.sh b/board/sifive/hifive-unleashed/post-build.sh
> new file mode 100755
> index 0000000..b418120
> --- /dev/null
> +++ b/board/sifive/hifive-unleashed/post-build.sh
> @@ -0,0 +1,2 @@
> +#!/bin/sh
> +cp $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr
> diff --git a/board/sifive/hifive-unleashed/readme.txt b/board/sifive/hifive-unleashed/readme.txt
> index 8d3fa63..3263913 100644
> --- a/board/sifive/hifive-unleashed/readme.txt
> +++ b/board/sifive/hifive-unleashed/readme.txt
> @@ -28,30 +28,41 @@ Result of the build
>  Once the build has finished you will have the following files:
>
>      output/images/
> +    +-- boot.scr
> +    +-- fw_dynamic.bin
> +    +-- fw_dynamic.elf
>      +-- fw_jump.bin
>      +-- fw_jump.elf
> -    +-- fw_payload.bin
> -    +-- fw_payload.elf
> +    +-- hifive-unleashed-a00.dtb
>      +-- Image
> +    +-- rootfs.cpio
>      +-- rootfs.ext2
>      +-- rootfs.ext4
>      +-- rootfs.tar
>      +-- sdcard.img
> +    +-- u-boot.bin
> +    +-- u-boot.itb
> +    +-- u-boot-spl.bin
>
>
>  Creating a bootable SD card with genimage
>  =========================================
>
> -Buildroot builds a SD card image for you. All you need to do is dd the
> -image to your SD card, which can be done with the following command:
> +By default Buildroot builds a SD card image for you. All you need to do
> +is dd the image to your SD card, which can be done with the following
> +command on your development host:
>
> -  $ sudo dd if=output/images/sdcard.img of=/dev/mmcblk0 bs=4096
> +  $ sudo dd if=output/images/sdcard.img of=/dev/sdb bs=4096
> +
> +The above example command assumes the SD card is accessed via a USB card
> +reader and shows up as /dev/sdb on the host. Adjust it accordingly per
> +your actual setup.
>
>  Booting the SD card on the board
>  ================================
>
>  Make sure that the all DIP switches are set to the off position for
> -default boot mode (MSEL mode = 1111), insert the SD card and power
> +default boot mode (MSEL mode = 1011), insert the SD card and power
>  up the board.
>
>  Connect the USB cable and open minicom (/dev/ttyUSB1, 115200, 8N1).
> @@ -60,16 +71,45 @@ See the 'SiFive HiFive Unleashed Getting Started Guide' for
>  more details (https://www.sifive.com/documentation).
>
>  You will get a warning reported by fdisk when you examine the SD card.
> -This is because the genimage.cfg file doesn't specify the SD card size
> -(as people will naturally have different sized cards), so the
> +This is because the genimage_sdcard.cfg file doesn't specify the SD card
> +size (as people will naturally have different sized cards), so the
>  secondary GPT header is placed after the rootfs rather than at the end
>  of the disk where it is expected to be.
>
>  You will see something like this at boot time:
>
> -[    2.318722] GPT:Primary header thinks Alt. header is not at the end of the disk.
> -[    2.325390] GPT:190496 != 122142719
> -[    2.328843] GPT:Alternate GPT header not at the end of the disk.
> -[    2.334824] GPT:190496 != 122142719
> -[    2.338302] GPT: Use GNU Parted to correct GPT errors.
> -[    2.343456]  mmcblk0: p1 p2
> +[    0.989458] mmc0: host does not support reading read-only switch, assuming write-enable
> +[    0.996772] mmc0: new SDHC card on SPI
> +[    1.001634] mmcblk0: mmc0:0000 SD8GB 7.28 GiB
> +[    1.038079] GPT:Primary header thinks Alt. header is not at the end of the disk.
> +[    1.044759] GPT:52389 != 15264767
> +[    1.048051] GPT:Alternate GPT header not at the end of the disk.
> +[    1.054015] GPT:52389 != 15264767
> +[    1.057323] GPT: Use GNU Parted to correct GPT errors.
> +[    1.062479]  mmcblk0: p1 p2 p3
> +
> +
> +Creating a bootable SPI flash with genimage
> +===========================================
> +
> +Adjust Buildroot configuration by:
> +
> +  $ make menuconfig
> +
> +Change "System configuration" -> "Extra arguments passed to custom scripts"
> +value to "-c board/sifive/hifive-unleashed/genimage_spi-nor.cfg", save the
> +configuration and build. This creates a output/images/spi-nor.img that can
> +be programmed to the on-board SPI flash.
> +
> +Boot the board from the SD card prepared above, stop the U-Boot auto boot,
> +and type the following commands to program the whole SPI flash:
> +
> +  => tftp 82000000 output/images/spi-nor.img
> +  => sf probe
> +  => sf update 82000000 0 2000000
> +
> +Booting the SPI flash on the board
> +==================================
> +
> +Make sure that the all DIP switches are set to the off position for
> +default boot mode (MSEL mode = 0110) to boot from SPI flash.
> diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
> index 2457657..d93920c 100644
> --- a/configs/hifive_unleashed_defconfig
> +++ b/configs/hifive_unleashed_defconfig
> @@ -12,29 +12,45 @@ BR2_RISCV_ABI_LP64D=y
>  BR2_SYSTEM_DHCP="eth0"
>  BR2_TARGET_GENERIC_GETTY=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttySIF0"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/sifive/hifive-unleashed/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sifive/hifive-unleashed/genimage.cfg"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sifive/hifive-unleashed/genimage_sdcard.cfg"
>
>  # Filesystem
> +BR2_TARGET_ROOTFS_CPIO=y
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="24M"
>
> -# Linux headers same as kernel, a 5.1 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1=y
> +# Linux headers same as kernel, a 5.10 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>
>  # Kernel
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/alistair23/linux.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="hifive-unleashed-5.1"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sifive/hifive-unleashed/linux.config.fragment"
>  BR2_LINUX_KERNEL_IMAGE=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="sifive/hifive-unleashed-a00"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
>
>  # Bootloader
>  BR2_TARGET_OPENSBI=y
> -BR2_TARGET_OPENSBI_PLAT="sifive/fu540"
> -BR2_TARGET_OPENSBI_LINUX_PAYLOAD=y
> +BR2_TARGET_OPENSBI_PLAT="generic"
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sifive_fu540"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
> +BR2_TARGET_UBOOT_FORMAT_ITB=y
> +BR2_TARGET_UBOOT_SPL=y
>
>  # Host tools
>  BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/sifive/hifive-unleashed/boot.cmd"
> --
> 2.7.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
