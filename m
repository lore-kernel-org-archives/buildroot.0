From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 19 Jun 2015 22:08:59 +0200
Subject: [Buildroot] [V2 4/4] A20-OLinuXino-Lime: new board (mali)
In-Reply-To: <1434741204-3988-5-git-send-email-francois.perrad@gadz.org>
References: <1434741204-3988-1-git-send-email-francois.perrad@gadz.org>
 <1434741204-3988-5-git-send-email-francois.perrad@gadz.org>
Message-ID: <20150619200859.GH11732@lukather>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 19, 2015 at 09:13:24PM +0200, Francois Perrad wrote:
> config mali / sunxi like Cubieboard2
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  board/olimex/a20_olinuxino_lime/boot-mali.cmd   |  4 ++
>  board/olimex/a20_olinuxino_lime/mksunxicard.sh  |  1 +
>  board/olimex/a20_olinuxino_lime/readme-mali.txt | 65 +++++++++++++++++++++++++
>  configs/olimex_a20_olinuxino_mali_defconfig     | 44 +++++++++++++++++
>  4 files changed, 114 insertions(+)
>  create mode 100644 board/olimex/a20_olinuxino_lime/boot-mali.cmd
>  create mode 120000 board/olimex/a20_olinuxino_lime/mksunxicard.sh
>  create mode 100644 board/olimex/a20_olinuxino_lime/readme-mali.txt
>  create mode 100644 configs/olimex_a20_olinuxino_mali_defconfig
> 
> diff --git a/board/olimex/a20_olinuxino_lime/boot-mali.cmd b/board/olimex/a20_olinuxino_lime/boot-mali.cmd
> new file mode 100644
> index 0000000..849ed00
> --- /dev/null
> +++ b/board/olimex/a20_olinuxino_lime/boot-mali.cmd
> @@ -0,0 +1,4 @@
> +setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p2 rootwait panic=10 ${extra}
> +fatload mmc 0 0x43000000 script.bin
> +fatload mmc 0 0x48000000 uImage
> +bootm 0x48000000
> diff --git a/board/olimex/a20_olinuxino_lime/mksunxicard.sh b/board/olimex/a20_olinuxino_lime/mksunxicard.sh
> new file mode 120000
> index 0000000..f0fcd02
> --- /dev/null
> +++ b/board/olimex/a20_olinuxino_lime/mksunxicard.sh
> @@ -0,0 +1 @@
> +../../cubietech/cubieboard/mkcubiecard.sh
> \ No newline at end of file
> diff --git a/board/olimex/a20_olinuxino_lime/readme-mali.txt b/board/olimex/a20_olinuxino_lime/readme-mali.txt
> new file mode 100644
> index 0000000..51e8a1c
> --- /dev/null
> +++ b/board/olimex/a20_olinuxino_lime/readme-mali.txt
> @@ -0,0 +1,65 @@
> +A20-OLinuXino-LIME
> +
> +Intro
> +=====
> +
> +This is a open hardware board,
> +see https://www.olimex.com/Products/OLinuXino/open-source-hardware
> +
> +The legacy linux-sunxi kernels are based on the vendor code drops.
> +It is only useful when accelerated 3D graphics and multimedia support
> +is strictly necessary.
> +
> +The Mainline Kernel is already a much better choice for a headless server.
> +And also the mainline kernel works fine even for a basic Linux desktop
> +system running on top of a simple framebuffer, which may be good enough for
> +the users who do not need fancy 3D graphics or video playback acceleration.
> +
> +How to build it
> +===============
> +
> +    $ make olimex_a20_olinuxino_mali_defconfig
> +
> +Compile all and build rootfs image:
> +
> +    $ make
> +
> +Result of the build
> +-------------------
> +
> +After building, you should get a tree like this:
> +
> +    output/images/
> +    +-- boot.scr
> +    +-- rootfs.tar
> +    +-- script.bin
> +    +-- u-boot-sunxi-with-spl.bin
> +    +-- u-boot.bin
> +    `-- uImage
> +
> +
> +How setting up the SD card
> +==========================
> +
> +Depending on the rootfs size, you might want to use a 2GB or larger SD-card.
> +The script `mksunxicard.sh` will take care of partitioning and formatting
> +the SD-card.
> +
> +BEWARE! This process will erase your SD card.
> +
> +Use `dmesg` to find out where the SD card is attached in the /dev tree
> +(<device>) and then:
> +
> +    # ./mksunxicard.sh <images_dir> <device>
> +
> +where:
> +    - <images_dir> is the directory containing the generated files (usually
> +    output/images)
> +    - <device> is the device file of the SD card (usually /dev/sdX)
> +
> +
> +Finish
> +======
> +
> +Eject the SD card, insert it in the A20-OLinuXino-LIME board, and power it up.
> +
> diff --git a/configs/olimex_a20_olinuxino_mali_defconfig b/configs/olimex_a20_olinuxino_mali_defconfig
> new file mode 100644
> index 0000000..2af885d
> --- /dev/null
> +++ b/configs/olimex_a20_olinuxino_mali_defconfig
> @@ -0,0 +1,44 @@
> +# Architecture
> +BR2_arm=y
> +BR2_cortex_a7=y
> +
> +# Kernel headers
> +BR2_KERNEL_HEADERS_3_4=y
> +
> +# System configuration
> +BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to use OLinuXino!"
> +BR2_TARGET_GENERIC_GETTY=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino_lime/post-build.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="board/olimex/a20_olinuxino_lime/boot-mali.cmd $(BINARIES_DIR)"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_VERSION="sunxi-3.4"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux-sunxi/linux-sunxi.git"
> +# based on Linux version 3.4.103
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="9a1cd034181af628d4145202289e1993c1687db6"
> +BR2_LINUX_KERNEL_USE_DEFCONFIG=y
> +BR2_LINUX_KERNEL_DEFCONFIG="sun7i"
> +
> +# sunxi packages
> +BR2_PACKAGE_SUNXI_TOOLS=y
> +BR2_PACKAGE_SUNXI_BOARDS=y
> +BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a20/a20-olinuxino_lime.fex"
> +
> +# Bootloaders
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="A20-OLinuXino-Lime"
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_VERSION="sunxi"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux-sunxi/u-boot-sunxi.git"
> +# based on U-Boot 2014.04
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="ea1ac32bf76eb60baef474c2516fc431b381d952"
> +BR2_TARGET_UBOOT_FORMAT_BIN=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"

U-boot sunxi is unmaintained and deprecated, you probably don't wnat
to use that.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150619/757e6c70/attachment.asc>
