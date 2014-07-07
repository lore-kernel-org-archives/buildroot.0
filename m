From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Jul 2014 21:11:48 +0200
Subject: [Buildroot] [PATCH] configs: add defconfig for TS-5x00 SBCs
In-Reply-To: <1404758809-21008-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1404758809-21008-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <20140707211148.218c21b7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vivien Didelot,

On Mon,  7 Jul 2014 14:46:49 -0400, Vivien Didelot wrote:

> diff --git a/board/ts/ts5x00/patches/linux/linux-001-add-support-for-ts5400.patch b/board/ts/ts5x00/patches/linux/linux-001-add-support-for-ts5400.patch
> new file mode 100644
> index 0000000..72b5252
> --- /dev/null
> +++ b/board/ts/ts5x00/patches/linux/linux-001-add-support-for-ts5400.patch
> @@ -0,0 +1,98 @@

All patches should have a header with Signed-off-by + description.

> diff --git a/board/ts/ts5x00/readme.txt b/board/ts/ts5x00/readme.txt
> new file mode 100644
> index 0000000..2b056f2
> --- /dev/null
> +++ b/board/ts/ts5x00/readme.txt
> @@ -0,0 +1,54 @@
> +Technologic Systems TS-5x00 SBCs
> +================================
> +
> +This document explains how to set up a basic Buildroot system for the 
> +Technologic Systems TS-5x00 serie of x86-based Single Board Computers.
> +
> +TS-5x00 Single Board Computers are based on the AMD Elan520 processor. For more 
> +information please have a look at http://wiki.embeddedarm.com/wiki/#AMD
> +
> +The kernel configuration works for any AMD Elan520-based SBCs, but the support 
> +is enhanced for the TS-5500 and TS-5400 models (on-board devices registration 
> +and additional sysfs attributes under /sys/devices/platform/).
> +
> +To build the default configuration you only have to:
> +
> +    $ make ts5x00_defconfig
> +    $ make
> +
> +You will need a Compact Flash card of sufficient size and the first or only
> +partition configured as Linux type, with the bootable flag.
> +
> +To transfer the system to the card do:
> +
> +    # dd if=output/images/rootfs.ext4 of=/dev/sdX1
> +
> +You can optionally extend the filesystem size to the whole partition:
> +
> +    # resize2fs /dev/sdX1
> +
> +You can also update the card image without completely rewriting it:

Saying this looks weird as this operation will not remove any file that
is on the Compact Flash but not part of the image.

> +
> +    # mount /dev/sdX1 /mnt
> +    # tar -pxf output/images/rootfs.tar -C /mnt
> +    # umount /mnt
> +
> +To install the bootloader, you will need to copy the MBR:
> +
> +    # cat output/images/syslinux/mbr.bin > /dev/sdX
> +
> +Then install SYSLINUX in the mounted partition:
> +
> +    # mount /dev/sdX1 /mnt
> +    # output/host/sbin/extlinux --install /mnt/boot/syslinux
> +    # umount /mnt
> +
> +IMPORTANT: In order for the board to boot the Compact Flash with a recent 
> +config, the BIOS must use Logical Block Addressing (LBA). You can do it by 
> +choosing "Ide 0: AUTOCONFIG, LBA" under "IDE DRIVE GEOMETRY" in the "Basic CMOS 
> +Configuration" screen. For details about the CMOS setup, please see: 
> +http://wiki.embeddedarm.com/wiki/TS-5500#System_BIOS_Setup_Screens
> +
> +Connect a terminal program to the rs232 connector marked "COM2"
> +with baudrate set to 115200, insert the Compact Flash card into the socket, 
> +power up the board, and enjoy.
> diff --git a/configs/ts5x00_defconfig b/configs/ts5x00_defconfig
> new file mode 100644
> index 0000000..9f0f4dd
> --- /dev/null
> +++ b/configs/ts5x00_defconfig
> @@ -0,0 +1,11 @@

The default architecture selection is correct? The CPU is not better
than an i586 ?

On the toolchain side, you also need to lock-down kernel headers to
version 3.15, otherwise your defconfig will be broken once we update
the default kernel headers package to use Linux 3.16 (since your kernel
is 3.15).

> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
> +BR2_ROOTFS_OVERLAY="board/ts/ts5x00/fs-overlay"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_PATCH="board/ts/ts5x00/patches/linux/"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/ts/ts5x00/linux-3.15.config"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_SYSLINUX=y
> +BR2_TARGET_SYSLINUX_MBR=y

Other than that, looks good!

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
