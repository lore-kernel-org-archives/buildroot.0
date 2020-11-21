From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 21 Nov 2020 11:06:18 +0100
Subject: [Buildroot] [PATCH v4 4/5] board: add nvidia jetson tx2 support
In-Reply-To: <bcfb1b77-8962-674f-1c08-fa7e60ec208e@smile.fr>
References: <20201119075328.8599-1-christian@paral.in>
 <20201119075328.8599-4-christian@paral.in>
 <bcfb1b77-8962-674f-1c08-fa7e60ec208e@smile.fr>
Message-ID: <f48b6a5d-9d98-7d5e-cb17-66e846b7508f@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

Le 19/11/2020 ? 14:40, Romain Naour a ?crit?:
> Hello Christian,
> 
> Le 19/11/2020 ? 08:53, Christian Stewart a ?crit?:
>> Tested-by: Asaf Kahlon <asafka7@gmail.com>
>> Signed-off-by: Christian Stewart <christian@paral.in>
>>
>> ---
>>
>> v3 -> v4:
>>
>>  - thanks Romain for the review
>>  - cjs: added gcc + binutils version specifiers
>>  - tested against devkit hardware
>>
>> Signed-off-by: Christian Stewart <christian@paral.in>
>> ---
>>  board/jetson/tx2/readme.txt | 83 +++++++++++++++++++++++++++++++++++++
>>  board/jetsontx2             |  1 +
>>  configs/jetsontx2_defconfig | 64 ++++++++++++++++++++++++++++
>>  3 files changed, 148 insertions(+)
>>  create mode 100644 board/jetson/tx2/readme.txt
>>  create mode 120000 board/jetsontx2
>>  create mode 100644 configs/jetsontx2_defconfig
>>

[...]

>> +++ b/configs/jetsontx2_defconfig
>> @@ -0,0 +1,64 @@
>> +BR2_aarch64=y
>> +BR2_cortex_a57=y
>> +BR2_ARM_FPU_FP_ARMV8=y
>> +
>> +# enable specific optimizations
>> +BR2_TARGET_OPTIMIZATION="-march=armv8-a+crypto -mcpu=cortex-a57+crypto"
>> +
>> +# Toolchain reference: docs.nvidia.com: "Jetson Linux Driver Package Toolchain"
>> +BR2_TOOLCHAIN_BUILDROOT=y
>> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
>> +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
>> +BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
>> +BR2_TOOLCHAIN_BUILDROOT_LOCALE=y

Glibc toolchains already select locale and whar support.

>> +BR2_BINUTILS_VERSION_2_32_X=y

I'm not sure why you need this version.

>> +BR2_GCC_VERSION_7_X=y
> 
> This means that you are not working on Buildroot master because gcc 7 has been
> removed already.
> 
> This is anoying... either the latest NVIDIA SDK (jetpack 4.4.1) is already out
> of date because it require an old gcc version or gcc is moving too fast for such
> sdk.
> 
> Your work on this series must be discussed with other maintainers.
> Wait some time before sending v5.

Actually I would suggest to use the Linaro aarch64 2018.05
(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64) because it's the toolchain recommended
and used by Nvidia.

See: https://developer.nvidia.com/gcc-linaro-731-201805-sources

> 
>> +BR2_GCC_ENABLE_LTO=n
> 
> Should be:
> # BR2_GCC_ENABLE_LTO is not set
> 
> Best regards,
> Romain
> 
> 
>> +BR2_USE_MMU=y
>> +
>> +BR2_SYSTEM_DHCP="eth0"
>> +
>> +# Linux headers same as kernel, a 4.9 series
>> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
>> +BR2_KERNEL_HEADERS_AS_KERNEL=y

We don't need this if we use the Linaro toolchain.

>> +
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>> +# patches-l4t-r32.4
>> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,madisongh,linux-tegra-4.9,0be1a57448010ae60505acf4e2153638455cee7c)/linux-tegra-4.9.140-r1.tar.gz"
>> +BR2_LINUX_KERNEL_DEFCONFIG="tegra"
>> +
>> +# Build the DTB from the kernel sources
>> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
>> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="_ddot_/_ddot_/_ddot_/_ddot_/nvidia/platform/t18x/quill/kernel-dts/tegra186-quill-p3310-1000-c03-00-base"
>> +
>> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>> +
>> +BR2_PACKAGE_LINUX4TEGRA=y
>> +BR2_PACKAGE_LINUX4TEGRA_PLATFORM_T186REF=y
>> +
>> +# TODO: NVIDIA_CONTAINER_TOOLKIT requires a go-module integration.
>> +# BR2_PACKAGE_NVIDIA_CONTAINER_TOOLKIT=y
>> +
>> +BR2_PACKAGE_LINUX_FIRMWARE=y
>> +BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX=y
>> +
>> +# Required tools to create the image
>> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
>> +BR2_PACKAGE_HOST_JQ=y
>> +BR2_PACKAGE_HOST_PARTED=y
>> +
>> +# Filesystem / image
>> +BR2_TARGET_ROOTFS_EXT2=y
>> +BR2_TARGET_ROOTFS_EXT2_4=y
>> +BR2_TARGET_ROOTFS_EXT2_SIZE="2000M"

This is huge, here target directory is only 215Mo after building this defconfig.

[target]$ du -hs .
215M

Best regards,
Romain

>> +# BR2_TARGET_ROOTFS_TAR is not set
>> +
>> +# Uboot
>> +BR2_TARGET_UBOOT=y
>> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="p2771-0000-500"
>> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>> +BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
>> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,paralin,u-boot-tegra,e6da093be3cc593ef4294e1922b3391ede9c94da)/u-boot-tegra-l4t-r32.4-v2016.7.tar.gz"
>> +BR2_TARGET_UBOOT_FORMAT_DTB_BIN=y
>> +BR2_TARGET_UBOOT_NEEDS_DTC=y
>>
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
