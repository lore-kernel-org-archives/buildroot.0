From: Nabeel Syed <nibzy26@gmail.com>
Date: Tue, 7 Aug 2018 09:13:48 +0500
Subject: [Buildroot] stuck at welcome to buildroot login prompt
Message-ID: <CANL8dc9qPRpKifA8DX_YvYxLg_jZSzWWYyrkf3JpRj7vBRwTng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi ,

I need some help as I am stuck at build root login prompt.the keyboard just
doesnt work.I am using minicom 115200 8n1 settings on ubuntu 14.04.

1. I am aware of this is not your root file system thing.I am using
genimage to make a sdcard image and after the build i end up with
rootfs.tar , rootfs.ext2,rootfs.ext4 and sdcard image and ofcourse kernel
image and dtb files.I dont use tar -C command to get the rootfs to my
sdcard instead I use dd command to write sdcard.img to sd card .

Here is my genimage.cfg file
------------------------------------------------------------------
image boot.vfat {
    vfat {
        files = {
            "Image",
            "cl-som-imx8.dtb",
            "cl-som-imx8-4k.dtb",
            "cl-som-imx8-dual.dtb",
            "cl-som-imx8-lvds-dcss.dtb",
                        "cl-som-imx8-lvds-lcdif.dtb",
        }
    }
    size = 32M
}

image sdcard.img {
    hdimage {
    }

    partition my-boot {
        partition-type = 0xC
        image = "boot.vfat"


    }

    partition rootfs {
        partition-type = 0x83
        image = "rootfs.ext2"
        size = 700M

    }
}

-------------------------------------------------------------
The post-image.sh script
-----------------------------------------------------------
#!/bin/sh
# post-image.sh for Cl-SOM-IMX8 from compulab

BOARD_DIR="$(dirname $0)"

GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"


GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

rm -rf "${GENIMAGE_TMP}"

genimage \
    --rootpath "${TARGET_DIR}" \
    --tmppath "${GENIMAGE_TMP}" \
    --inputpath "${BINARIES_DIR}" \
    --outputpath "${BINARIES_DIR}" \
    --config "${GENIMAGE_CFG}"

-------------------------------------------------------

Here is my imx8-defconfig file

---------------------------------------------------


BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_PATH="/home/nabeel/linaro"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-linux-gnu"
BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_ROOTFS_MERGED_USR=y
BR2_TARGET_GENERIC_GETTY_PORT="ttymxc2"
BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
BR2_TARGET_TZ_INFO=y
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/compulab/imx8/post-image.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="file://$(TOPDIR)/imx8-kernel.tar.gz"
BR2_LINUX_KERNEL_PATCH="/home/nabeel/Desktop/cl-som-imx8-patches"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="/home/nabeel/Desktop/defconfig-bysupport"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="/home/nabeel/Desktop/imx8compulab-dts/cl-som-imx8.dts
/home/nabeel/Desktop/imx8compulab-dts/cl-som-imx8-4k.dts
/home/nabeel/Desktop/imx8compulab-dts/cl-som-imx8-dual.dts
/home/nabeel/Desktop/imx8compulab-dts/cl-som-imx8-lvds-dcss.dts
/home/nabeel/Desktop/imx8compulab-dts/cl-som-imx8-lvds-lcdif.dts  "
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_DBUS=y
BR2_PACKAGE_LIBCAP=y
BR2_PACKAGE_KMOD=y
BR2_PACKAGE_KMOD_TOOLS=y
BR2_PACKAGE_UTIL_LINUX=y
BR2_PACKAGE_UTIL_LINUX_BINARIES=y
BR2_PACKAGE_UTIL_LINUX_FSCK=y
BR2_PACKAGE_UTIL_LINUX_MOUNT=y
BR2_PACKAGE_UTIL_LINUX_NOLOGIN=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_LABEL="myroot"
BR2_TARGET_ROOTFS_EXT2_SIZE="600M"


=============================================================================================

Here is my inittab which i put in my rootfs-overlay folder

# /etc/inittab
#
# Copyright (C) 2001 Erik Andersen <andersen@codepoet.org>
#
# Note: BusyBox init doesn't support runlevels.  The runlevels field is
# completely ignored by BusyBox init. If you want runlevels, use
# sysvinit.
#
# Format for each entry: <id>:<runlevels>:<action>:<process>
#
# id        == tty to run on, or empty for /dev/console
# runlevels == ignored
# action    == one of sysinit, respawn, askfirst, wait, and once
# process   == program to run

# Startup the system
::sysinit:/bin/mount -t proc proc /proc
::sysinit:/bin/mount -o remount,rw /
::sysinit:/bin/mkdir -p /dev/pts
::sysinit:/bin/mkdir -p /dev/shm
::sysinit:/bin/mount -a
::sysinit:/bin/hostname -F /etc/hostname
# now run any rc scripts
::sysinit:/etc/init.d/rcS

# Put a getty on the serial port
ttymxc2::respawn:/sbin/getty -L  ttymxc2 115200 vt100 # GENERIC_SERIAL


ttymxc2::askfirst:/bin/sh
# Stuff to do for the 3-finger salute
#::ctrlaltdel:/sbin/reboot

# Stuff to do before rebooting
::shutdown:/etc/init.d/rcK
::shutdown:/sbin/swapoff -a
::shutdown:/bin/umount -a -r

---------------------------------------------
Here is my rcS script which i also put in rootfs-overlay  etc/init.d/rcS

#!/bin/sh


echo " **** STARTING rcS script ***** "

echo " **** STARTING rcS script ***** "
echo " "

# Start all init scripts in /etc/init.d
# executing them in numerical order.
#
for i in /etc/init.d/S??* ;do

     # Ignore dangling symlinks (if any).
     [ ! -f "$i" ] && continue

     case "$i" in
    *.sh)
        # Source shell script for speed.
        (
        trap - INT QUIT TSTP
        set start
        . $i
        )
        ;;
    *)
        # No sh extension, so fork subprocess.
        $i start
        ;;
    esac
done

echo " EEEEEEEEND of rcS ***** "

rm -f /dev/console

ln -s ttymxc2 /dev/console           // someone suggested this fix on google
echo " EEEEEEEEND of rcS ***** "
echo " "

---------------------------------------------------------------------------

I think it is related to console settings .
kernel console value in u-boot is set to

mmcargs=setenv bootargs console=ttymxc2,115200 root=/dev/mmcblk${mmcdev}p2
rootwait rw

and

u-boot=> printenv
console

console=ttymxc2,115200 earlycon=ec_imx6q,0x30880000,115200

---------------------------------------------------------------------


Kindly advise what could be wrong with console settings...

is it related to mounting dev at startup or mknod command ??????

Thanks a lot

Nabeel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180807/fddcc552/attachment.html>
