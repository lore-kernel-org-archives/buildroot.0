From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Jun 2019 00:08:32 +0200
Subject: [Buildroot] [PATCH 1/3] configs/imx7dpico: Bump Linux and U-Boot
In-Reply-To: <20190609145749.28766-1-offougajoris@gmail.com>
References: <20190609145749.28766-1-offougajoris@gmail.com>
Message-ID: <d729f8c4-27f6-70f3-e30e-092aa23013d5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/06/2019 16:57, Joris Offouga wrote:
> This commit bumps Linux & Linux-headers to 5.1 and U-Boot to version 2019.01.
> With U-Boot version 2019.01, imx7dpico boot with distrobootcmd also introduce
> extlinux file also remove patch and change TARGET_UBOOT_BOARNAME for select
> correct defconfig in U-Boot.

 Wow, this commit log is pretty dense... I rewrote it to the following:

configs/imx7dpico: Bump Linux and U-Boot

Bump Linux to 5.1 and U-Boot to version 2019.01.

U-Boot patch is no longer needed, applied upstream.

U-Boot defconfig name for this board has changed to pico-pi-imx7d.

U-Boot now supports distrobootcmd for this board, so add the appropriate
extlinux.conf and use SPL+u-boot.img instead of u-boot.imx. Note that
the common freescale post-image script handles things appropriately
based on the selected options in .config.


 However, I haven't applied yet because there's something I don't understand...

> 
> Signed-off-by: Joris Offouga <offougajoris@gmail.com>
[snip]
> diff --git a/board/technexion/imx7dpico/rootfs_overlay/boot/extlinux/extlinux.conf b/board/technexion/imx7dpico/rootfs_overlay/boot/extlinux/extlinux.conf
> new file mode 100644
> index 0000000000..4824aff079
> --- /dev/null
> +++ b/board/technexion/imx7dpico/rootfs_overlay/boot/extlinux/extlinux.conf

 So this will be placed in the rootfs, in the second partition. How does U-boot
know how to pick it up from there?

 I believe it doesn't, I don't think this file is used at all. It still works,
because the U-Boot config looks for zImage and imx7d-pico-pi.dtb on the first
partition by default.

> @@ -0,0 +1,4 @@
> +Label imx7d-pico-buildroot
> +  kernel /boot/zImage
> +  devicetree /boot/imx7d-pico-pi.dtb
> +  append root=PARTUUID=${uuid} rootwait rw console=${console},${baudrate}
> \ No newline at end of file

 Please add a newline at the end of the file.

 How would uuid get expanded? How does U-Boot know the rootfs's UUID?

 However, I believe this file and the OVERLAY config option can just be removed.

 Regards,
 Arnout

> diff --git a/configs/imx7dpico_defconfig b/configs/imx7dpico_defconfig
> index 93e3fd7414..cd12e282ef 100644
> --- a/configs/imx7dpico_defconfig
> +++ b/configs/imx7dpico_defconfig
> @@ -3,11 +3,8 @@ BR2_arm=y
>  BR2_cortex_a7=y
>  BR2_ARM_FPU_NEON_VFPV4=y
>  
> -# patches
> -BR2_GLOBAL_PATCH_DIR="board/technexion/imx7dpico/patches"
> -
> -# Linux headers same as kernel, a 4.17 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_17=y
> +# Linux headers same as kernel, a 5.1 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1=y
>  
>  # system
>  BR2_TARGET_GENERIC_GETTY_PORT="ttymxc4"
> @@ -15,18 +12,21 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc4"
>  # kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.1.6"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-pico-pi"
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
>  
>  # bootloader
>  BR2_TARGET_UBOOT=y
> -BR2_TARGET_UBOOT_BOARDNAME="pico-imx7d"
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="SPL"
> +BR2_TARGET_UBOOT_BOARDNAME="pico-pi-imx7d"
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
> -BR2_TARGET_UBOOT_FORMAT_IMX=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
> +BR2_TARGET_UBOOT_FORMAT_IMG=y
>  
>  # required tools to create the eMMC image
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
> @@ -34,6 +34,7 @@ BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
>  
>  # filesystem / image
> +BR2_ROOTFS_OVERLAY="board/technexion/imx7dpico/rootfs_overlay"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
> 
