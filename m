From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 21 Apr 2016 09:04:23 +0000
Subject: [Buildroot] [Bug 8866] New: Making an USB flash bootable with
 extlinux build with buildroot does not work.
Message-ID: <bug-8866-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8866

            Bug ID: 8866
           Summary: Making an USB flash bootable with extlinux build with
                    buildroot does not work.
           Product: buildroot
           Version: unspecified
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: buschman at tech.net.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

My environment:
- Fedora release 22 (Twenty Two)
- x86_64
- with a "dnf update" on 10. March 2016
- buildroot cloned on 9. March 2016

The target is i386, narrowed down to corei7.


Steps to duplicate the problem:
--> git clone https://git.buildroot.net/buildroot
--> cd buildroot
--> mkdir /var/tmp/try-r210b
--> env BR2_DL_DIR=/data/buildroot/downloads HOSTCXX=/bin/g++ HOSTCC=/bin/gcc \
    make O=/var/tmp/try-r210b menuconfig
--> env BR2_DL_DIR=/data/buildroot/downloads HOSTCXX=/bin/g++ HOSTCC=/bin/gcc \
    make O=/var/tmp/try-r210b linux-menuconfig
--> env BR2_DL_DIR=/data/buildroot/downloads HOSTCXX=/bin/g++ HOSTCC=/bin/gcc \
    make O=/var/tmp/try-r210b savedefconfig
--> cat /var/tmp/try-r210b/defconfig
BR2_x86_corei7=y
BR2_KERNEL_HEADERS_4_4=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TARGET_GENERIC_HOSTNAME="r210node"
BR2_TARGET_GENERIC_ROOT_PASSWD="XXX"
BR2_TARGET_TZ_INFO=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/dell/r210/linux-4.4.config"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_PACKAGE_ETHTOOL=y
BR2_PACKAGE_IPROUTE2=y
BR2_PACKAGE_IPUTILS=y
BR2_PACKAGE_OPENSSH=y
BR2_PACKAGE_SCREEN=y
BR2_PACKAGE_ED=y
BR2_TARGET_ROOTFS_CPIO=y
BR2_TARGET_ROOTFS_CPIO_BZIP2=y
BR2_TARGET_SYSLINUX=y
BR2_TARGET_SYSLINUX_MBR=y
BR2_PACKAGE_HOST_GENIMAGE=y
--> env BR2_DL_DIR=/data/buildroot/downloads HOSTCXX=/bin/g++ HOSTCC=/bin/gcc \
    make O=/var/tmp/try-r210b

This all works as expected.

The problem is when generating a bootable USB stick with the extlinux
tools from buildroot, the generated USB flash doesn't boot.

--> cat /var/tmp/try-r210b/images/syslinux/mbr.bin >/dev/sdd
partition and format the USB stick and copy the filesystem and the linux
kernel onto it.
--> /var/tmp/try-r210b/host/sbin/extlinux --zip --stupid --install /mnt/boot
--> cat /mnt/boot/extlinux.conf
SERIAL 1 115200
DEFAULT linux
LABEL linux
SAY Now booting the kernel from SYSLINUX...
KERNEL /bzImage
APPEND rw root=/dev/sdc2 rootdelay=10 console=ttyS1,115200n8

The target system (a Dell R210) boots until:
SYSLINUX 6.03 EDD  Copyright (C) 1994-2014 H.Peter Anvin et al
Boot error

Note that I copied the error message manually, so the spacing might be
different.



If I use the installed Fedora tools from the Fedora 22 distribution, the
USB stick is suddenly bootable:

--> cat /usr/share/syslinux/mbr.bin >/dev/sdd
--> mount -t f2fs /dev/sdd2 /mnt
--> mkfs.ext2 -L boot -m 0 -M /boot /dev/sdd1
--> mount -t ext2 /dev/sdd1 /mnt/boot
--> Add /mnt/boot/extlinux.conf as above.
--> /sbin/extlinux --stupid --zip --install /mnt/boot
--> cp -p /var/tmp/try-r210b/images/bzImage /mnt/boot

-- 
You are receiving this mail because:
You are on the CC list for the bug.
