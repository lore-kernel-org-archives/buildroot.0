From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 20:21:14 +0200
Subject: [Buildroot] [PATCH v3] Adding support for Ariag25 and Terra
 board from Acmesystems
In-Reply-To: <1403301175-3403-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1403301175-3403-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20140715202114.054f9329@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

Thanks for this patch. See my comments below.

The title of the patch should rather be something like:

  board: add support for Acmesystems Ariag25 and Terra boards

On Fri, 20 Jun 2014 23:52:55 +0200, Angelo Compagnucci wrote:

> diff --git a/board/acmesystems/README.md b/board/acmesystems/README.md
> new file mode 100644
> index 0000000..b09941a
> --- /dev/null
> +++ b/board/acmesystems/README.md
> @@ -0,0 +1,32 @@
> +# AriaG25 / Terra board support
> +
> +Aria G25 is a cost-effective System-on-Module (SoM) thought of to drastically reduce the development time needed to design a low-power and low-EMI Linux Embedded device.
> +
> +Terra board is a complete hardware solution conceived to:
> +
> +* Evaluate the Aria G25 Linux embedded module for your own hardware design (schematic, bom, etc are available here)
> +
> +* Create concept prototypes using the Daisy add-on boards system for in-field applications
> +
> +* Build end-user products
> +
> +
> +## AriaG25 Getting started
> +
> +To build a new minimal AriaG25 rootfs simply load corresponding ariag25_defconfig file. The config is fairly basic with only the kernel and busybox selected.
> +
> +To make the board bootable please follow the instruction on the producer website:
> +
> +[http://acmesystems.it/binary_repository](http://acmesystems.it/binary_repository)
> +
> +You will only need the correct boot.bin file for your board type, everithing else like kernel, dtb and roots are built by buildroot inside images directory.
> +
> +## Terra getting started
> +
> +To build a new minimal AriaG25 rootfs simply open the corresponding ariag25_demo_terra_defconfig file. This configuration is a bit more complete than the other and provides python, networking support and ssh access. It's meant to be usable as a reference for running example code you can find on the producer website:
> +
> +[http://acmesystems.it/tutorials](http://acmesystems.it/tutorials)
> +
> +Networking is configured for DHCP on the eth0.
> +
> +Please note that this configuration needs the correct boot.bin file, please refer to the AriaG25 getting started to know how to obtain it.
> \ No newline at end of file

Lines should be wrapped at a reasonable length, and the markdown wiki
syntax should not be used. The file should be named readme.txt. See all
the other similar text files in Buildroot for examples:

$ find board/ -name 'readme.txt'
board/boundarydevices/nitrogen6x/readme.txt
board/lego/ev3/readme.txt
board/cubietech/cubieboard/readme.txt
board/arm/foundation-v8/readme.txt
board/telit/evk-pro3/readme.txt
board/raspberrypi/readme.txt
board/minnowboard/readme.txt
board/qemu/arm-nuri/readme.txt
board/qemu/powerpc-virtex-ml507/readme.txt
board/qemu/mips64el-malta/readme.txt
board/qemu/powerpc-mpc8544ds/readme.txt
board/qemu/microblazeel-mmu/readme.txt
board/qemu/microblazebe-mmu/readme.txt
board/qemu/x86/readme.txt
board/qemu/mipsel-malta/readme.txt
board/qemu/powerpc-g3beige/readme.txt
board/qemu/sparc-ss10/readme.txt
board/qemu/mips-malta/readme.txt
board/qemu/arm-vexpress/readme.txt
board/qemu/mips64-malta/readme.txt
board/qemu/arm-versatile/readme.txt
board/qemu/x86_64/readme.txt
board/qemu/sh4-r2d/readme.txt
board/altera/sockit/readme.txt
board/avnet/zedboard/readme.txt
board/avnet/s6lx9_microboard/readme.txt
board/atmel/xplained/readme.txt
board/congatec/qmx6/readme.txt
board/freescale/p1010rdb/readme.txt
board/freescale/mpc8315erdb/readme.txt
board/olimex/imx233_olinuxino/readme.txt
board/wandboard/readme.txt
board/ts/ts5x00/readme.txt

> diff --git a/board/acmesystems/ariag25/at91-ariag25.config b/board/acmesystems/ariag25/at91-ariag25.config
> new file mode 100644
> index 0000000..07a0eca
> --- /dev/null
> +++ b/board/acmesystems/ariag25/at91-ariag25.config

This file should be named linux-<version>.config so that we know it's
the kernel configuration.

What are the differences compared to the at91_dt_defconfig available in
the kernel tree? We generally prefer to use the built-in defconfig
files from the kernel, when they are appropriate.


> diff --git a/board/acmesystems/ariag25/at91-ariag25.dts b/board/acmesystems/ariag25/at91-ariag25.dts
> new file mode 100644
> index 0000000..8bb5612
> --- /dev/null
> +++ b/board/acmesystems/ariag25/at91-ariag25.dts

This Device Tree file is already part of the mainline kernel, why do we
need to add it in Buildroot ?

> diff --git a/board/acmesystems/ariag25_terra/fs-overlay/etc/network/interfaces b/board/acmesystems/ariag25_terra/fs-overlay/etc/network/interfaces
> new file mode 100644
> index 0000000..104c1a1
> --- /dev/null
> +++ b/board/acmesystems/ariag25_terra/fs-overlay/etc/network/interfaces
> @@ -0,0 +1,5 @@
> +auto lo
> +iface lo inet loopback
> +
> +auto eth0
> +iface eth0 inet dhcp
> diff --git a/configs/ariag25_defconfig b/configs/ariag25_defconfig
> new file mode 100644
> index 0000000..a572be5
> --- /dev/null
> +++ b/configs/ariag25_defconfig
> @@ -0,0 +1,11 @@
> +BR2_arm=y

Add:

BR2_arm926t=y

to make sure we use the correct CPU architecture.

> +BR2_DEFCONFIG="$(CONFIG_DIR)/defconfig"

Not needed.

> +BR2_TARGET_GENERIC_HOSTNAME="ariag25"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to AriaG25 by www.acmesystems.it!"
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y

Please lock down the kernel headers versions, like is done in all other
defconfig files:

# Lock to 3.12 headers to avoid breaking with newer kernels
BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="3.12.2"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y

> +BR2_LINUX_KERNEL=y

Please lock the kernel version, like is done in all other defconfig
files:

BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.2"

> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/acmesystems/ariag25/at91-ariag25.config"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
> +BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/ariag25/at91-ariag25.dts"

This will have to be modified to use the Device Tree file built into
the mainline kernel.

> diff --git a/configs/ariag25_demo_terra_defconfig b/configs/ariag25_demo_terra_defconfig
> new file mode 100644
> index 0000000..6ceea7f
> --- /dev/null
> +++ b/configs/ariag25_demo_terra_defconfig
> @@ -0,0 +1,17 @@
> +BR2_arm=y
> +BR2_DEFCONFIG="$(CONFIG_DIR)/defconfig"
> +BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
> +BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> +BR2_TARGET_GENERIC_HOSTNAME="ariag25"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to AriaG25 by www.acmesystems.it!"
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> +BR2_ROOTFS_OVERLAY="board/acmesystems/ariag25_terra/fs-overlay"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/acmesystems/ariag25/at91-ariag25.config"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
> +BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/ariag25/at91-ariag25.dts"
> +BR2_PACKAGE_PYTHON=y
> +BR2_PACKAGE_PYTHON_SERIAL=y
> +BR2_PACKAGE_DROPBEAR=y

I honestly don't think it's really worth having a demo whose purpose is
just to enable Python and Dropbear. Could you submit a patch without
this demo configuration, it will have a higher chance of being merged.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
