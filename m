From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 31 Oct 2016 06:19:34 +0200
Subject: [Buildroot] [PATCH 2/4] board/lego/ev3: Create images using
 genimage
In-Reply-To: <1477870346-4941-3-git-send-email-david@lechnology.com>
References: <1477870346-4941-1-git-send-email-david@lechnology.com>
 <1477870346-4941-3-git-send-email-david@lechnology.com>
Message-ID: <20161031041934.o4fdgk7n6hwaiuba@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi David,

On Sun, Oct 30, 2016 at 06:32:24PM -0500, David Lechner wrote:
> This adds a script to create SD card and flash images for LEGO MINDSTORMS
> EV3 using the genimage tool.
> 
> The default kernel config had to be modifed to add support for squashfs
> and to add a ram disk.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> ---
>  board/lego/ev3/genimage.cfg    |  57 ++++++++
>  board/lego/ev3/linux_defconfig | 291 +++++++++++++++++++++++++++++++++++++++++
>  board/lego/ev3/post-image.sh   |  14 ++
>  board/lego/ev3/readme.txt      |  80 +++--------
>  configs/lego_ev3_defconfig     |   8 +-
>  5 files changed, 386 insertions(+), 64 deletions(-)
>  create mode 100644 board/lego/ev3/genimage.cfg
>  create mode 100644 board/lego/ev3/linux_defconfig
>  create mode 100755 board/lego/ev3/post-image.sh

[...]

> diff --git a/board/lego/ev3/linux_defconfig b/board/lego/ev3/linux_defconfig
> new file mode 100644
> index 0000000..998e6da
> --- /dev/null
> +++ b/board/lego/ev3/linux_defconfig
> @@ -0,0 +1,291 @@
[...]
> +CONFIG_EXT2_FS=m
> +CONFIG_EXT3_FS=m

ext3 was removed in kernel version 4.3, while lego_ev3_defconfig uses kernel 
version 4.4. Under which kernel have you generated this defconfig?

You may try using a config fragment file to add support for additional kernel 
features. See pc_x86_64_bios_defconfig, for example.

> diff --git a/configs/lego_ev3_defconfig b/configs/lego_ev3_defconfig
> index bf425f1..e96a689 100644
> --- a/configs/lego_ev3_defconfig
> +++ b/configs/lego_ev3_defconfig
> @@ -8,7 +8,7 @@ BR2_GLOBAL_PATCH_DIR="board/lego/ev3/patches"
>  # system
>  BR2_TARGET_GENERIC_GETTY=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
> -
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/lego/ev3/post-image.sh"
>  # Linux headers same as kernel, a 4.4 series
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
>  
> @@ -17,15 +17,19 @@ BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/ev3dev/ev3dev-kernel.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v4.4.19-15-ev3dev-ev3_1"
> -BR2_LINUX_KERNEL_DEFCONFIG="ev3dev"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/lego/ev3/linux_defconfig"
>  BR2_LINUX_KERNEL_UIMAGE=y
>  
>  # filesystem
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_3=y
> +BR2_TARGET_ROOTFS_SQUASHFS=y
> +BR2_TARGET_ROOTFS_SQUASHFS4_XZ=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>  
>  # U-Boot
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="legoev3"
> +BR2_PACKAGE_HOST_GENIMAGE=y

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
