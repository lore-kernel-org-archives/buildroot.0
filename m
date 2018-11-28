From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Nov 2018 15:06:35 +0100
Subject: [Buildroot] [PATCH 3/3] configs/andes_nds32_ae3xx: new defconfig
In-Reply-To: <20181128101542.9561-4-nylon7@andestech.com>
References: <20181128101542.9561-1-nylon7@andestech.com>
 <20181128101542.9561-4-nylon7@andestech.com>
Message-ID: <20181128150635.5e0bb8c7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Note: I just realized that none of your patches made it to the
Buildroot mailing list. Please make sure to subscribe to the mailing
list before sending patches.

Please see some comments below about this specific patch.

On Wed, 28 Nov 2018 18:15:42 +0800, Nylon Chen wrote:


> diff --git a/configs/andes_ae3xx_defconfig b/configs/andes_ae3xx_defconfig
> new file mode 100644
> index 0000000000..c93041246e
> --- /dev/null
> +++ b/configs/andes_ae3xx_defconfig

This file should be the output of "make savedefconfig". It clearly
isn't the case here, with some fairly random options listed.

> +BR2_READELF_ARCH_NAME="Andes Technology compact code size embedded RISC processor family"

This clearly has no reason to be here, it's a blind Config.in option.

> +BR2_nds32=y
> +BR2_TOOLCHAIN=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_ANDES_NDS32=y
> +BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> +BR2_TOOLCHAIN_EXTERNAL_URL="https://github.com/vincentzwc/prebuilt-nds32-toolchain/releases/download/20180521/nds32le-linux-glibc-v3-upstream.tar.gz"
> +BR2_TOOLCHAIN_EXTERNAL_PREFIX="nds32le-linux"
> +BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL="toolchain-external-andes-nds32"
> +BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
> +BR2_TOOLCHAIN_GCC_AT_LEAST_8=y
> +BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
> +BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y

All of this will change once you had a proper package for your external
toolchain.

> +#Kernel
> +BR2_LINUX_KERNEL_PATCH="board/andes/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch"

Please instead use:

BR2_GLOBAL_PATCH_DIR="board/andes/patches/"

> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/andes/ae3xx.fragment"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="ca9eb48fe01fa7fa60ff9f2196b1bd0d84dc81af"

Any reason to use this specific commit instead of a proper tag ?

> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_VMLINUX=y
> +
> +#Target packages
> +
> +BR2_PACKAGE_BUSYBOX=y
> +BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox.config"

not needed, this is already the default.

> +# Filesystem
> +BR2_TARGET_ROOTFS_INITRAMFS=y

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
