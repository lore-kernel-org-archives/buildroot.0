From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 17 Oct 2017 23:59:07 +0530
Subject: [Buildroot] [git commit] Added support for Sinovoip BananaPi M2
 Plus board.
In-Reply-To: <20170922210443.49832810B8@busybox.osuosl.org>
References: <20170922210443.49832810B8@busybox.osuosl.org>
Message-ID: <CAMty3ZBWyhdE_8T3dsdyg+tUK9yXOHPgDHwNzKtHiCUH+0WviA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've a patch with this in ML, under bananapi. All bananapi boards are
now part of BPI

On Sat, Sep 23, 2017 at 2:41 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=cef57c964284f9b545a2347dd6eb1654e03dfd6e
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> [Peter: board is from Sinovoip, not Lemaker, move board files,
>         Use kernel headers from kernel, explicitly use 4.13.3,
>         drop eth0 dhcp config, cleanup post-build args,
>         disable tar output format, use u-boot custom format,
>         add host-dosfstools/mtools for genimage, drop unused
>         host-uboot-tools/genext2fs]
> Signed-off-by: Mike Harmony <mike.harmony@snapav.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  DEVELOPERS                          |  4 ++++
>  board/sinovoip/m2-plus/boot.cmd     |  7 +++++++
>  board/sinovoip/m2-plus/genimage.cfg | 33 +++++++++++++++++++++++++++++++++
>  configs/bananapi_m2_plus_defconfig  | 28 ++++++++++++++++++++++++++++
>  4 files changed, 72 insertions(+)
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index ed5fa3d..536ec56 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1262,6 +1262,10 @@ N:       Murat Demirten <mdemirten@yh.com.tr>
>  F:     package/jpeg-turbo/
>  F:     package/libgeotiff/
>
> +N:     Mike Harmony <mike.harmony@snapav.com>
> +F:     board/sinovoip/m2-plus/
> +F:     configs/bananapi_m2_plus_defconfig
> +
>  N:     Nathan Lynch <ntl@pobox.com>
>  F:     package/chrony/
>
> diff --git a/board/sinovoip/m2-plus/boot.cmd b/board/sinovoip/m2-plus/boot.cmd
> new file mode 100644
> index 0000000..d22464a
> --- /dev/null
> +++ b/board/sinovoip/m2-plus/boot.cmd
> @@ -0,0 +1,7 @@
> +setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
> +
> +mmc dev 0
> +fatload mmc 0 $kernel_addr_r zImage
> +fatload mmc 0 $fdt_addr_r sun8i-h3-bananapi-m2-plus.dtb
> +
> +bootz $kernel_addr_r - $fdt_addr_r
> diff --git a/board/sinovoip/m2-plus/genimage.cfg b/board/sinovoip/m2-plus/genimage.cfg
> new file mode 100644
> index 0000000..cde0669
> --- /dev/null
> +++ b/board/sinovoip/m2-plus/genimage.cfg
> @@ -0,0 +1,33 @@
> +image boot.vfat {
> +       vfat {
> +               files = {
> +                       "zImage",
> +                       "sun8i-h3-bananapi-m2-plus.dtb",
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
> diff --git a/configs/bananapi_m2_plus_defconfig b/configs/bananapi_m2_plus_defconfig
> new file mode 100644
> index 0000000..ebaea2d
> --- /dev/null
> +++ b/configs/bananapi_m2_plus_defconfig
> @@ -0,0 +1,28 @@
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M2 Plus"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sinovoip/m2-plus/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.3"
> +BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-bananapi-m2-plus"
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Sinovoip_BPI_M2_Plus"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
> +BR2_TARGET_UBOOT_BOOT_SCRIPT=y
> +BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/sinovoip/m2-plus/boot.cmd"
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Jagan Teki
Senior Linux Kernel Engineer | Amarula Solutions
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
