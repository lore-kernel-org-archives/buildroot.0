From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Mar 2013 15:10:05 +0100
Subject: [Buildroot] [PATCH 1/2] cubieboard: defconfig
In-Reply-To: <1362829004-16217-1-git-send-email-carlo.caione@gmail.com>
References: <1362829004-16217-1-git-send-email-carlo.caione@gmail.com>
Message-ID: <20130310151005.3a886cab@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carlo Caione,

On Sat,  9 Mar 2013 12:36:43 +0100, Carlo Caione wrote:
> This adds support for Cubieboard (http://cubieboard.org/).
> This depends on host package HOST_SUNXI_TOOLS submitted by
> Floris Bos.

This message "This depends on host package ..." should not be part of
the commit log. As I suggested earlier, just include Floris Bos patch
in your patch set, it will be easier.

Some more comments below.

> +# System configuration
> +BR2_TARGET_GENERIC_HOSTNAME="sun4i"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to use sun4i"

Since it's a cubieboard defconfig, what about using cubieboard here?

> +BR2_TARGET_GENERIC_GETTY=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubieboard/post-build.sh"

This script is added in your second patch, so taken alone, your first
patch doesn't work. I think you should merge both of your patches,
since they really do one thing: add support for the Cubieboard.

> +# Additional tools
> +BR2_PACKAGE_HOST_SUNXI_TOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="https://github.com/linux-sunxi/linux-sunxi.git"
> +BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="66025966cbe563e356b5e1dda0a572e738e13c42"
> +BR2_LINUX_KERNEL_VERSION="sunxi-3.4"
> +BR2_LINUX_KERNEL_DEFCONFIG="sun4i"
> +
> +# Bootloaders
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="cubieboard"
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_VERSION="sunxi"
> +BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="https://github.com/linux-sunxi/u-boot-sunxi.git"
> +BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="7aa9f04f571247a6bb999c168b49e09f05b86465"
> +BR2_TARGET_UBOOT_FORMAT_BIN=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"

Ok. We also generally want to lock down a certain kernel headers
version. So you should add:

# Lock down headers to avoid breaking with new defaults
BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="3.8.1"

below your architecture definition. See armadeus_apf28_defconfig for
example.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
