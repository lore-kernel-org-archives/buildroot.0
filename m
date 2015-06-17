From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 18 Jun 2015 00:52:46 +0200
Subject: [Buildroot] [PATCH 5/5] A20-OLinuXino-Lime: new board (legacy)
In-Reply-To: <1434393964-20355-6-git-send-email-francois.perrad@gadz.org>
References: <1434393964-20355-1-git-send-email-francois.perrad@gadz.org>
 <1434393964-20355-6-git-send-email-francois.perrad@gadz.org>
Message-ID: <5581FA3E.5020005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/15/15 20:46, Francois Perrad wrote:
> config legacy / sunxi like Cubieboard2

 Instead of legacy, I'd call it 3d or accelerated or something, that makes the
difference a little clearer.

> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  board/olimex/a20_olinuxino_lime/boot-legacy.cmd   |  4 ++
>  board/olimex/a20_olinuxino_lime/mksunxicard.sh    |  1 +
>  board/olimex/a20_olinuxino_lime/post-build.sh     | 16 +++---
>  board/olimex/a20_olinuxino_lime/readme-legacy.txt | 60 +++++++++++++++++++++++
>  configs/olimex_a20_olinuxino_legacy_defconfig     | 43 ++++++++++++++++
>  5 files changed, 118 insertions(+), 6 deletions(-)
>  create mode 100644 board/olimex/a20_olinuxino_lime/boot-legacy.cmd
>  create mode 120000 board/olimex/a20_olinuxino_lime/mksunxicard.sh
>  create mode 100644 board/olimex/a20_olinuxino_lime/readme-legacy.txt
>  create mode 100644 configs/olimex_a20_olinuxino_legacy_defconfig
> 
> diff --git a/board/olimex/a20_olinuxino_lime/boot-legacy.cmd b/board/olimex/a20_olinuxino_lime/boot-legacy.cmd
> new file mode 100644
> index 0000000..849ed00
> --- /dev/null
> +++ b/board/olimex/a20_olinuxino_lime/boot-legacy.cmd
> @@ -0,0 +1,4 @@
> +setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p2 rootwait panic=10 ${extra}
> +fatload mmc 0 0x43000000 script.bin
> +fatload mmc 0 0x48000000 uImage
> +bootm 0x48000000
> diff --git a/board/olimex/a20_olinuxino_lime/mksunxicard.sh b/board/olimex/a20_olinuxino_lime/mksunxicard.sh
> new file mode 120000
> index 0000000..8879400
> --- /dev/null
> +++ b/board/olimex/a20_olinuxino_lime/mksunxicard.sh
> @@ -0,0 +1 @@
> +../../cubietech/cubieboard/mksunxicard.sh

 Since this is anyway a symlink, there's no need to rename the script in patch
4/5, you can just link to mkcubiecard.sh.

> \ No newline at end of file
> diff --git a/board/olimex/a20_olinuxino_lime/post-build.sh b/board/olimex/a20_olinuxino_lime/post-build.sh
> index d8d8fa4..8343611 100755
> --- a/board/olimex/a20_olinuxino_lime/post-build.sh
> +++ b/board/olimex/a20_olinuxino_lime/post-build.sh
> @@ -4,9 +4,13 @@ BOARD_DIR="$(dirname $0)"
>  BOOT_DIR=$TARGET_DIR/boot
>  MKIMAGE=$HOST_DIR/usr/bin/mkimage
>  
> -rm -rf $BOOT_DIR
> -mkdir $BOOT_DIR
> -mkdir $BOOT_DIR/dtb
> -cp $BINARIES_DIR/sun7i-a20-olinuxino-lime.dtb $BOOT_DIR/dtb/sun7i-a20-olinuxino-lime.dtb
> -$MKIMAGE -A arm -O linux -T script -C none -d $BOARD_DIR/boot.cmd $BOOT_DIR/boot.scr
> -cp $BINARIES_DIR/zImage $BOOT_DIR/zImage
> +if [ -e $BINARIES_DIR/sun7i-a20-olinuxino-lime.dtb ]; then
> +	rm -rf $BOOT_DIR
> +	mkdir $BOOT_DIR
> +	mkdir $BOOT_DIR/dtb
> +	cp $BINARIES_DIR/sun7i-a20-olinuxino-lime.dtb $BOOT_DIR/dtb/sun7i-a20-olinuxino-lime.dtb
> +	$MKIMAGE -A arm -O linux -T script -C none -d $BOARD_DIR/boot.cmd $BOOT_DIR/boot.scr
> +	cp $BINARIES_DIR/zImage $BOOT_DIR/zImage
> +else
> +	$MKIMAGE -A arm -O linux -T script -C none -d $BOARD_DIR/boot-legacy.cmd $BINARIES_DIR/boot.scr

 If you follow the comments I made in patch 3/5, you can rewrite this to pass
the input .cmd and output directory as a parameter to the script. So

$MKIMAGE -A arm -O linux -T script -C none -d $2 $3/boot.scr

BR2_ROOTFS_POST_SCRIPT_ARGS="board/.../boot-legacy.cmd $(BINARIES_DIR)"

and for the mainline one:

BR2_ROOTFS_POST_SCRIPT_ARGS="board/.../boot.cmd $(TARGET_DIR)/boot"

> +fi
> diff --git a/board/olimex/a20_olinuxino_lime/readme-legacy.txt b/board/olimex/a20_olinuxino_lime/readme-legacy.txt
> new file mode 100644
> index 0000000..7a0b452
> --- /dev/null
> +++ b/board/olimex/a20_olinuxino_lime/readme-legacy.txt

 I would combine both versions in a single readme.txt.


> @@ -0,0 +1,60 @@
> +A20-OLinuXino-LIME
> +
> +Intro
> +=====
> +
> +This is a open hardware board,
> +see https://www.olimex.com/Products/OLinuXino/open-source-hardware
> +
> +See https://linux-sunxi.org/Linux_Kernel, for choosing between
> +the legacy linux-sunxi kernel and the device tree / mainline kernel.

 I think you should copy the TL;DR in this file:

The legacy linux-sunxi kernels are based on the vendor code drops. It is only
useful when accelerated 3D graphics and multimedia support is strictly necessary.

The Mainline Kernel is already a much better choice for a headless server. And
also the mainline kernel works fine even for a basic Linux desktop system
running on top of a simple framebuffer, which may be good enough for the users
who do not need fancy 3D graphics or video playback acceleration.



> +
> +
> +How to build it
> +===============
> +
> +    $ make olimex_a20_olinuxino_legacy_defconfig
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

 Of course, you could just as well use the same approach for the mainline
version, i.e. put the boot stuff in a fatfs and only the real rootfs in the ext2.

> +
> +
> +Finish
> +======
> +
> +Eject the SD card, insert it in the A20-OLinuXino-LIME board, and pwer it up.

pwer -> power

> +
> diff --git a/configs/olimex_a20_olinuxino_legacy_defconfig b/configs/olimex_a20_olinuxino_legacy_defconfig
> new file mode 100644
> index 0000000..d5987d4
> --- /dev/null
> +++ b/configs/olimex_a20_olinuxino_legacy_defconfig
> @@ -0,0 +1,43 @@
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
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_VERSION="sunxi-3.4"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux-sunxi/linux-sunxi.git"

 You can use a wget URL instead:
$(call github,linux-sunxi,linux-sunxi,9a1cd034181af628d4145202289e1993c1687db6)

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

 Same here.


 Regards,
 Arnout

> +# based on U-Boot 2014.04
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="ea1ac32bf76eb60baef474c2516fc431b381d952"
> +BR2_TARGET_UBOOT_FORMAT_BIN=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> +
> +# Additional tools
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
