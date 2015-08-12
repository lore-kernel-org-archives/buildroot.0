From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 12 Aug 2015 20:40:41 +0200
Subject: [Buildroot] [PATCH v1] olimex_a20_olinuxino_lime2: new board
In-Reply-To: <1439391491-4383-1-git-send-email-viktorin@rehivetech.com>
References: <1439391491-4383-1-git-send-email-viktorin@rehivetech.com>
Message-ID: <CAB0FRsvu_5be0gdt5LxQ1xidUzY6uf1sCiQkeCZahzBk1jdTJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-08-12 16:58 GMT+02:00 Jan Viktorin <viktorin@rehivetech.com>:
> Based on olimex_a20_olinuxino_lime and olimex_a20_olinuxino_lime_mali
> configurations. It is based on the mainline kernel 4.1.4. It boots
> and the Ethernet is working at speed 1 Gbps.
>
> Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
> ---
>  board/olimex/a20_olinuxino/boot-lime2.cmd    |  6 ++++++
>  board/olimex/a20_olinuxino/readme.txt        |  3 +++
>  configs/olimex_a20_olinuxino_lime2_defconfig | 31 ++++++++++++++++++++++++++++
>  3 files changed, 40 insertions(+)
>  create mode 100644 board/olimex/a20_olinuxino/boot-lime2.cmd
>  create mode 100644 configs/olimex_a20_olinuxino_lime2_defconfig
>
> diff --git a/board/olimex/a20_olinuxino/boot-lime2.cmd b/board/olimex/a20_olinuxino/boot-lime2.cmd
> new file mode 100644
> index 0000000..a987715
> --- /dev/null
> +++ b/board/olimex/a20_olinuxino/boot-lime2.cmd
> @@ -0,0 +1,6 @@
> +setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
> +setenv fdtfile sun7i-a20-olinuxino-lime2.dtb

With the board Lime (and Micro), U-Boot 2015.07 (or 2015.04) set the
variable 'fdtfile' with the expected value.
So, the file board/olimex/a20_olinuxino/boot.cmd could be common for
all A20-Olinuxino boards.

Fran?ois.

> +ext4load mmc 0 0x49000000 /boot/${fdtfile}
> +ext4load mmc 0 0x46000000 /boot/zImage
> +env set fdt_high ffffffff
> +bootz 0x46000000 - 0x49000000
> diff --git a/board/olimex/a20_olinuxino/readme.txt b/board/olimex/a20_olinuxino/readme.txt
> index 7e9af84..7998aa1 100644
> --- a/board/olimex/a20_olinuxino/readme.txt
> +++ b/board/olimex/a20_olinuxino/readme.txt
> @@ -17,6 +17,8 @@ The following defconfigs are available:
>     for the A20-OLinuXino-LIME board using mainline kernel
>   - olimex_a20_olinuxino_lime_mali_defconfig
>     for the A20-OLinuXino-LIME board using legacy linux-sunxi kernel
> + - olimex_a20_olinuxino_lime2_defconfig
> +   for the A20-OLinuXino-LIME2 board using mainline kernel
>
>  The legacy linux-sunxi kernels are based on the vendor code drops.
>  They are only useful when accelerated 3D graphics and multimedia support
> @@ -50,6 +52,7 @@ After building, you should get a tree like this:
>      +-- rootfs.ext4 -> rootfs.ext2
>      +-- script.bin (lime_mali)
>      +-- sun7i-a20-olinuxino-lime.dtb (lime, mainline)
> +    +-- sun7i-a20-olinuxino-lime2.dtb (lime2, mainline)
>      +-- sun7i-a20-olinuxino-micro.dtb (micro, mainline)
>      +-- u-boot.bin
>      +-- u-boot-sunxi-with-spl.bin
> diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
> new file mode 100644
> index 0000000..b1f9df1
> --- /dev/null
> +++ b/configs/olimex_a20_olinuxino_lime2_defconfig
> @@ -0,0 +1,31 @@
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_ARM_EABIHF=y
> +BR2_CCACHE=y
> +BR2_OPTIMIZE_2=y
> +BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino/post-build.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="board/olimex/a20_olinuxino/boot-lime2.cmd $(TARGET_DIR)/boot"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.4"
> +BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
> +BR2_LINUX_KERNEL_ZIMAGE=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-olinuxino-lime2"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_PACKAGE_SUNXI_TOOLS=y
> +BR2_PACKAGE_SUNXI_BOARDS=y
> +BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a20/a20-olinuxino_lime.fex"
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="A20-OLinuXino-Lime2"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.01"
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> --
> 2.5.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
