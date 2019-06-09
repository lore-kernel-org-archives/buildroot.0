From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sun, 9 Jun 2019 18:44:03 +0200
Subject: [Buildroot] [PATCH 1/3] configs/imx7dpico: Bump Linux and U-Boot
In-Reply-To: <20190609145749.28766-1-offougajoris@gmail.com>
References: <20190609145749.28766-1-offougajoris@gmail.com>
Message-ID: <9fc6121a-9403-b44b-a80d-b4853fa27a99@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Joris,

Le 09/06/2019 ? 16:57, Joris Offouga a ?crit?:
> This commit bumps Linux & Linux-headers to 5.1 and U-Boot to version 2019.01.
> With U-Boot version 2019.01, imx7dpico boot with distrobootcmd also introduce
> extlinux file also remove patch and change TARGET_UBOOT_BOARNAME for select
> correct defconfig in U-Boot.
> 
> Signed-off-by: Joris Offouga <offougajoris@gmail.com>
> ---
>   .../patches/uboot/0001-picomx7dname.patch     | 31 -------------------
>   board/technexion/imx7dpico/readme.txt         |  3 +-
>   .../boot/extlinux/extlinux.conf               |  4 +++
>   configs/imx7dpico_defconfig                   | 19 ++++++------
>   4 files changed, 16 insertions(+), 41 deletions(-)
>   delete mode 100644 board/technexion/imx7dpico/patches/uboot/0001-picomx7dname.patch
>   create mode 100644 board/technexion/imx7dpico/rootfs_overlay/boot/extlinux/extlinux.conf
> 
> diff --git a/board/technexion/imx7dpico/patches/uboot/0001-picomx7dname.patch b/board/technexion/imx7dpico/patches/uboot/0001-picomx7dname.patch
> deleted file mode 100644
> index 59408bcd7a..0000000000
> --- a/board/technexion/imx7dpico/patches/uboot/0001-picomx7dname.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 6d298b0fcacfc555f93864fa45fb612140902388 Mon Sep 17 00:00:00 2001
> -From: Fabio Estevam <festevam@gmail.com>
> -Date: Tue, 5 Jun 2018 22:12:48 -0300
> -Subject: [PATCH] pico-imx7d: Adjust the dtb name
> -
> -Since kernel commit 41bbeadceb03 ("ARM: dts: imx7d-pico-pi: Separate
> -into cpu and baseboard dts") the dtb name has changed.
> -
> -Fix it accordingly.
> -
> -Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ----
> - include/configs/pico-imx7d.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/include/configs/pico-imx7d.h b/include/configs/pico-imx7d.h
> -index b208d7f..d2ffa70 100644
> ---- a/include/configs/pico-imx7d.h
> -+++ b/include/configs/pico-imx7d.h
> -@@ -41,7 +41,7 @@
> - 	"console=ttymxc4\0" \
> - 	"fdt_high=0xffffffff\0" \
> - 	"initrd_high=0xffffffff\0" \
> --	"fdt_file=imx7d-pico.dtb\0" \
> -+	"fdt_file=imx7d-pico-pi.dtb\0" \
> - 	"fdt_addr=0x83000000\0" \
> - 	"ip_dyn=yes\0" \
> - 	"mmcdev="__stringify(CONFIG_SYS_MMC_ENV_DEV)"\0" \
> ---
> -2.7.4
> -
> diff --git a/board/technexion/imx7dpico/readme.txt b/board/technexion/imx7dpico/readme.txt
> index cda3f285eb..07e089c38e 100644
> --- a/board/technexion/imx7dpico/readme.txt
> +++ b/board/technexion/imx7dpico/readme.txt
> @@ -20,7 +20,8 @@ You will find in output/images/ the following files:
>     - rootfs.ext4
>     - rootfs.tar
>     - sdcard.img
> -  - u-boot.imx
> +  - u-boot.img
> +  - SPL
>     - zImage
>   
>   Flash the eMMC
> diff --git a/board/technexion/imx7dpico/rootfs_overlay/boot/extlinux/extlinux.conf b/board/technexion/imx7dpico/rootfs_overlay/boot/extlinux/extlinux.conf
> new file mode 100644
> index 0000000000..4824aff079
> --- /dev/null
> +++ b/board/technexion/imx7dpico/rootfs_overlay/boot/extlinux/extlinux.conf
> @@ -0,0 +1,4 @@
> +Label imx7d-pico-buildroot
> +  kernel /boot/zImage
> +  devicetree /boot/imx7d-pico-pi.dtb
> +  append root=PARTUUID=${uuid} rootwait rw console=${console},${baudrate}
> \ No newline at end of file
> diff --git a/configs/imx7dpico_defconfig b/configs/imx7dpico_defconfig
> index 93e3fd7414..cd12e282ef 100644
> --- a/configs/imx7dpico_defconfig
> +++ b/configs/imx7dpico_defconfig
> @@ -3,11 +3,8 @@ BR2_arm=y
>   BR2_cortex_a7=y
>   BR2_ARM_FPU_NEON_VFPV4=y
>   
> -# patches
> -BR2_GLOBAL_PATCH_DIR="board/technexion/imx7dpico/patches"
> -
> -# Linux headers same as kernel, a 4.17 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_17=y
> +# Linux headers same as kernel, a 5.1 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1=y
>   
>   # system
>   BR2_TARGET_GENERIC_GETTY_PORT="ttymxc4"
> @@ -15,18 +12,21 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc4"
>   # kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.1.6"
>   BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-pico-pi"
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
>   
>   # bootloader
>   BR2_TARGET_UBOOT=y
> -BR2_TARGET_UBOOT_BOARDNAME="pico-imx7d"
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="SPL"
> +BR2_TARGET_UBOOT_BOARDNAME="pico-pi-imx7d"
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
> -BR2_TARGET_UBOOT_FORMAT_IMX=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
> +BR2_TARGET_UBOOT_FORMAT_IMG=y
>   
>   # required tools to create the eMMC image
>   BR2_PACKAGE_HOST_DOSFSTOOLS=y
> @@ -34,6 +34,7 @@ BR2_PACKAGE_HOST_GENIMAGE=y
>   BR2_PACKAGE_HOST_MTOOLS=y
>   
>   # filesystem / image
> +BR2_ROOTFS_OVERLAY="board/technexion/imx7dpico/rootfs_overlay"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
> 

Works fine on my side:

Net:   FEC0
Hit any key to stop autoboot:  0
Saving Environment to MMC... Writing to MMC(0)... OK
switch to partitions #0, OK
mmc0(part 0) is current device
Scanning mmc 0:1...
Found /boot/extlinux/extlinux.conf
Retrieving file: /boot/extlinux/extlinux.conf
159 bytes read in 87 ms (1000 Bytes/s)
1:	imx7d-pico-buildroot
Retrieving file: /boot/zImage
8197792 bytes read in 266 ms (29.4 MiB/s)
append: root=PARTUUID=00000000-01 rootwait rw console=ttymxc4,115200
Retrieving file: /boot/imx7d-pico-pi.dtb
33018 bytes read in 70 ms (460 KiB/s)
## Flattened Device Tree blob at 83000000
    Booting using the fdt blob at 0x83000000
    Using Device Tree in place at 83000000, end 8300b0f9

Starting kernel ...

So,

Tested-by: Pierre-Jean Texier <pjtexier@koncepto.io>

-- 
Best regards,
Pierre-Jean Texier
