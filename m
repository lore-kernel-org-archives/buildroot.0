From: Oleksandr G Zhadan <oleks@arcturusnetworks.com>
Date: Thu, 1 Mar 2018 14:19:18 -0500
Subject: [Buildroot] [PATCH] configs/arcturus_ucls1012a: new defconfig
In-Reply-To: <20180129230804.24157-1-oleks@arcturusnetworks.com>
References: <20180129230804.24157-1-oleks@arcturusnetworks.com>
Message-ID: <3349d749-230a-60ef-c341-9a7e438bf921@arcturusnetworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

I am addressing these questions to you, because we where working 
together to commit previous Arcturus BSP package to the buildroot.
Your help was very useful and it was done in relatively short period of 
time.

The questions:
I sent our new BSP support patches (see bellow)? month ago and no one 
applied them or replied with any comments.
Is anything changed in patches submitting procedure ?
What is the usual and the longest wait time for patches to be committed ?

Thank you,

Oleks

P.S. If anyone else has an answer to my questions please feel free to do it.


On 01/29/2018 06:08 PM, Oleksandr Zhadan wrote:
> The uCLS1012A-SOM product family (ucls1012a) is an Arcturus Networks Inc.
> 64bit ARM Cortex-A53 class System on Module powered by a NXP QorIQ LS1012A
> Low Power Communication Processor.  This 314 pin MXM3.0/SMARC module card
> contains DDR3, QSPI NOR Flash, eMMC NAND Flash, optional Audio CODEC and is
> available with 1 or 2 Gig-Ethernet PHYs
>
> Signed-off-by: Oleksandr Zhadan <oleks@arcturusnetworks.com>
> Signed-off-by: Michael Durrant <mike.durrant@arcturusnetworks.com>
> ---
>   DEVELOPERS                                         | 10 +++
>   board/arcturus/aarch64-ucls1012a/post-image.sh     |  7 ++
>   board/arcturus/aarch64-ucls1012a/readme.txt        | 74 ++++++++++++++++++++++
>   .../rootfs_overlay/etc/init.d/S09modload           | 14 ++++
>   configs/arcturus_ucls1012a_defconfig               | 37 +++++++++++
>   5 files changed, 142 insertions(+)
>   create mode 100755 board/arcturus/aarch64-ucls1012a/post-image.sh
>   create mode 100644 board/arcturus/aarch64-ucls1012a/readme.txt
>   create mode 100755 board/arcturus/aarch64-ucls1012a/rootfs_overlay/etc/init.d/S09modload
>   create mode 100644 configs/arcturus_ucls1012a_defconfig
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1db550399f..f4282d1c13 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1247,6 +1247,11 @@ F:	package/tinyxml/
>   N:	Maxime Ripard <maxime.ripard@free-electrons.com>
>   F:	package/kmsxx/
>   
> +N:	Michael Durrant <mike.durrant@arcturusnetworks.com>
> +F:	board/arcturus/
> +F:	configs/arcturus_ucp1020_defconfig
> +F:	configs/arcturus_ucls1012a_defconfig
> +
>   N:	Michael Rommel <rommel@layer-7.net>
>   F:	package/knock/
>   F:	package/python-crc16/
> @@ -1305,6 +1310,11 @@ F:	package/tcf-agent/
>   N:	Olaf Rempel <razzor@kopf-tisch.de>
>   F:	package/ctorrent/
>   
> +N:	Oleksandr Zhadan <oleks@arcturusnetworks.com>
> +F:	board/arcturus/
> +F:	configs/arcturus_ucp1020_defconfig
> +F:	configs/arcturus_ucls1012a_defconfig
> +
>   N:	Oli Vogt <oli.vogt.pub01@gmail.com>
>   F:	package/python-django/
>   F:	package/python-flup/
> diff --git a/board/arcturus/aarch64-ucls1012a/post-image.sh b/board/arcturus/aarch64-ucls1012a/post-image.sh
> new file mode 100755
> index 0000000000..45b34e8cf2
> --- /dev/null
> +++ b/board/arcturus/aarch64-ucls1012a/post-image.sh
> @@ -0,0 +1,7 @@
> +#!/bin/sh
> +
> +echo =================== ${BINARIES_DIR} ============================
> +MKIMAGE=${HOST_DIR}/usr/bin/mkimage
> +MKIMAGE_IN=${BINARIES_DIR}/br2-ucls1012a.its
> +MKIMAGE_OUT=${BINARIES_DIR}/part0-000000.itb
> +${MKIMAGE} -f ${MKIMAGE_IN} ${MKIMAGE_OUT}
> diff --git a/board/arcturus/aarch64-ucls1012a/readme.txt b/board/arcturus/aarch64-ucls1012a/readme.txt
> new file mode 100644
> index 0000000000..61fe3c55a8
> --- /dev/null
> +++ b/board/arcturus/aarch64-ucls1012a/readme.txt
> @@ -0,0 +1,74 @@
> +Arcturus uCLS1012A SoM
> +======================
> +
> +This tutorial describes how to use the predefined Buildroot
> +configuration for the Arcturus uCLS101A SoM platform.
> +
> +Additional information about the uCLS1012A System on Module can be found at
> +https://www.arcturusnetworks.com/products/ucls1012a
> +and product support for registered users at
> +https://www.arcturusnetworks.com/support
> +
> +Building
> +--------
> +
> +Return to the top directory <buildrootdir> and execute the following commands.
> +
> +  make arcturus_ucls1012a_defconfig
> +  make
> +
> +Result of the build
> +-------------------
> +
> +After building, you should obtain this tree:
> +
> +    output/images/
> +    +-- arc-ucls1012a.dtb
> +    +-- Image
> +    +-- part0-000000.itb
> +    +-- rootfs.cpio
> +    +-- rootfs.cpio.gz
> +    +-- rootfs.tar
> +    +-- u-boot.bin
> +    +-- ucls1012a.its
> +
> +Flashing
> +--------
> +
> +You'll need to program the image created by buildroot into the SPI NOR flash.
> +
> +1. Reboot your module and via the serial console press <escape> to enter the B$
> +u-boot shell.
> +   From the shell you will need to update four environment variables replacing the
> +   IPv4 IP Address with ones that will work with your network and tftp server.
> +
> +   B$ setenv ipaddr 192.168.1.81
> +   B$ setenv serverip 192.168.1.80
> +   B$ setenv gatewayip 192.168.1.1
> +   B$ setenv netmask 255.255.255.0
> +   B$ saveenv
> +
> +2. Enable tftp server to serve the <buildrootdir>/output/images/ folder.
> +
> +3. Program the new U-Boot binary (optional)
> +    If you don't feel confident upgrading your bootloader then don't do it,
> +    it's unnecessary most of the time.
> +
> +    B$ tftp u-boot.bin
> +    B$ run program_uboot
> +
> +4. Program the ITB image (includes Kernel, DTB and Ramdisk)
> +
> +    B$ tftp part0-000000.itb
> +    B$ run program0
> +
> +5. Booting your new system
> +
> +    Reboot your system by reset command
> +    B$ reset
> +
> +        or
> +
> +    B$ run bootcmd
> +
> +Good Luck !
> diff --git a/board/arcturus/aarch64-ucls1012a/rootfs_overlay/etc/init.d/S09modload b/board/arcturus/aarch64-ucls1012a/rootfs_overlay/etc/init.d/S09modload
> new file mode 100755
> index 0000000000..c87ffda14f
> --- /dev/null
> +++ b/board/arcturus/aarch64-ucls1012a/rootfs_overlay/etc/init.d/S09modload
> @@ -0,0 +1,14 @@
> +#!/bin/sh
> +#
> +case "$1" in
> +       start)
> +                modprobe pfe
> +                ;;
> +        stop)
> +                ;;
> +        restart|reload)
> +                ;;
> +        *)
> +                echo "Usage: $0 {start|stop|restart}"
> +                exit 1
> +esac
> diff --git a/configs/arcturus_ucls1012a_defconfig b/configs/arcturus_ucls1012a_defconfig
> new file mode 100644
> index 0000000000..7cc502f13c
> --- /dev/null
> +++ b/configs/arcturus_ucls1012a_defconfig
> @@ -0,0 +1,37 @@
> +# Architecture
> +BR2_aarch64=y
> +
> +# Linux headers same as kernel, a 4.1 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
> +
> +# System settings
> +BR2_TARGET_GENERIC_HOSTNAME="ucls1012a"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to uCLS1012A-SOM"
> +BR2_SYSTEM_DHCP="eth0"
> +BR2_ROOTFS_OVERLAY="board/arcturus/aarch64-ucls1012a/rootfs_overlay"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/arcturus/aarch64-ucls1012a/post-image.sh"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_HG=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://arcturusnetworks at bitbucket.org/arcturusnetworks/ucls1012a-kernel"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="1b49e5e89f5b"
> +BR2_LINUX_KERNEL_DEFCONFIG="ucls1012a"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="arcturus/arc-ucls1012a"
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_CPIO=y
> +BR2_TARGET_ROOTFS_CPIO_GZIP=y
> +
> +# U-boot
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_HG=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://arcturusnetworks at bitbucket.org/arcturusnetworks/ucls1012a-uboot"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="8caf347b2e66"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="UCLS1012A_QSPI128"
> +
> +# Tools
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y


-- 
Oleksandr Zhadan
Arcturus Networks
T 416 621-0125 x235
F 416 621-0190
