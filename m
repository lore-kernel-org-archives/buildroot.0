From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 18 Nov 2020 15:58:45 +0100
Subject: [Buildroot] [PATCH v3 4/5] board: add nvidia jetson tx2 support
In-Reply-To: <20201118025252.3806860-4-christian@paral.in>
References: <20201118025252.3806860-1-christian@paral.in>
 <20201118025252.3806860-4-christian@paral.in>
Message-ID: <61b867a9-96d4-1ab2-813b-c1529c3fed1b@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

Le 18/11/2020 ? 03:52, Christian Stewart a ?crit?:
> Tested-by: Asaf Kahlon <asafka7@gmail.com>
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  board/jetson/tx2/readme.txt | 83 +++++++++++++++++++++++++++++++++++++
>  board/jetsontx2             |  1 +
>  configs/jetsontx2_defconfig | 55 ++++++++++++++++++++++++
>  3 files changed, 139 insertions(+)
>  create mode 100644 board/jetson/tx2/readme.txt
>  create mode 120000 board/jetsontx2
>  create mode 100644 configs/jetsontx2_defconfig
> 

[...]

> diff --git a/configs/jetsontx2_defconfig b/configs/jetsontx2_defconfig
> new file mode 100644
> index 0000000000..c0eab3e50e
> --- /dev/null
> +++ b/configs/jetsontx2_defconfig
> @@ -0,0 +1,55 @@
> +BR2_aarch64=y
> +BR2_cortex_a57=y
> +
> +# enable specific optimizations
> +BR2_TARGET_OPTIMIZATION="-march=armv8-a+crypto -mcpu=cortex-a57+crypto"
> +
> +# Toolchain reference: docs.nvidia.com: "Jetson Linux Driver Package Toolchain"
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> +BR2_BINUTILS_VERSION_2_32_X=y

AFAIK, the nvidia sdk requires a specific gcc version too. I'm not sure it can
build with GCC 9 or 10. Cuda libraries seems requires GCC 8.

> +
> +BR2_SYSTEM_DHCP="eth0"
> +
> +# Linux headers same as kernel, a 4.9 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
> +BR2_KERNEL_HEADERS_AS_KERNEL=y
> +
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,madisongh,linux-tegra-4.9,0be1a57448010ae60505acf4e2153638455cee7c)/linux-tegra-4.9.140-r1.tar.gz"
> +BR2_LINUX_KERNEL_DEFCONFIG="tegra"

The vanilla linux kernel doesn't even build with gcc 8, Matt Madison (the OE4T
maintainer) backported a lot of patches on the kernel 4.9.140 released by Nvidia
to fixes those issues.

Also this kernel include nvidia kernel stack, there is a hard dependency on the
linux4tegra version (32.4.3).

Best regards,
Romain

> +
> +# Build the DTB from the kernel sources
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="_ddot_/_ddot_/_ddot_/_ddot_/nvidia/platform/t18x/quill/kernel-dts/tegra186-quill-p3310-1000-c03-00-base"
> +
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +
> +BR2_PACKAGE_LINUX4TEGRA=y
> +BR2_PACKAGE_LINUX4TEGRA_PLATFORM_T186REF=y
> +
> +# TODO: NVIDIA_CONTAINER_TOOLKIT requires a go-module integration.
> +# BR2_PACKAGE_NVIDIA_CONTAINER_TOOLKIT=y
> +
> +BR2_PACKAGE_LINUX_FIRMWARE=y
> +BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX=y
> +
> +# Required tools to create the image
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_JQ=y
> +BR2_PACKAGE_HOST_PARTED=y
> +
> +# Filesystem / image
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="1024M"
> +# BR2_TARGET_ROOTFS_TAR is not set
> +
> +# Uboot
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="p2771-0000-500"
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,paralin,u-boot-tegra,e6da093be3cc593ef4294e1922b3391ede9c94da)/u-boot-tegra-l4t-r32.4-v2016.7.tar.gz"
> +BR2_TARGET_UBOOT_FORMAT_DTB_BIN=y
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> 
