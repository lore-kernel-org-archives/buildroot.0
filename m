From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 22:35:50 +0100
Subject: [Buildroot] [PATCH v3 4/4] solidrun/macchiatobin: add new board
In-Reply-To: <20171203181818.10087-5-geomatsi@gmail.com>
References: <20171203181818.10087-1-geomatsi@gmail.com>
 <20171203181818.10087-5-geomatsi@gmail.com>
Message-ID: <20171203223550.41324dd9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sergey,

On Sun,  3 Dec 2017 21:18:18 +0300, Sergey Matyukevich wrote:

> diff --git a/board/solidrun/macchiatobin/patches/linux/0001-arm64-dts-marvell-extend-cp110-syscon-regs.patch b/board/solidrun/macchiatobin/patches/linux/0001-arm64-dts-marvell-extend-cp110-syscon-regs.patch
> new file mode 100644
> index 0000000000..87a4a93ff4
> --- /dev/null
> +++ b/board/solidrun/macchiatobin/patches/linux/0001-arm64-dts-marvell-extend-cp110-syscon-regs.patch
> @@ -0,0 +1,38 @@
> +commit 0f0dfbec373eef37dcb424b5b24ce899f05249cd
> +Author: Antoine Tenart <antoine.tenart@free-electrons.com>
> +Date:   Mon Sep 18 09:58:08 2017 +0200
> +
> +    arm64: dts: marvell: extend the cp110 syscon register area length
> +    
> +    This patch extends on both cp110 the system register area length to
> +    include some of the comphy registers as well.
> +    
> +    Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> +    Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Please use "git format-patch -N" to format the patches, and add your
Signed-off-by after the existing Signed-off-by.

> +Insert the micro SDcard in MacchiatoBin board and power it up.
> +Serial console is accessible at the micro-USB Type-B connector
> +marked CON9. The serial line setings are 115200 8N1.
> +
> +By default U-Boot will use environment from SPI flash. On first boot
> +SPI flash may be empty or it may keep legacy environment incompatible
> +with up-to-date mainline U-Boot and kernel. Then the following
> +commands can be used to boot the board:
> +
> +=> ext4load mmc 1:1 0x01700000 /boot/uEnv-example.txt
> +=> env import -t 0x01700000 $filesize
> +=> boot  

So the default bootcmd is not running some U-Boot script by default ?

> diff --git a/configs/solidrun_macchiatobin_mainline_defconfig b/configs/solidrun_macchiatobin_mainline_defconfig
> new file mode 100644
> index 0000000000..aca798ab05
> --- /dev/null
> +++ b/configs/solidrun_macchiatobin_mainline_defconfig
> @@ -0,0 +1,45 @@
> +BR2_aarch64=y
> +
> +#

This comment is not very useful :)

> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-8040-mcbin"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/solidrun/macchiatobin/linux-extras.config"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +
> +# rootfs
> +BR2_TARGET_ROOTFS_TAR=y

Is the tarball really useful ?

> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y

You don't have a FAT filesystem, so dosfstools and mtools are not
needed.

(Same comment apply to the vendor defconfig, of course).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
