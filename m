From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 07 Mar 2021 21:46:35 +0000
Subject: [Buildroot] [Bug 13586] New: grub failure with BR2_OPTIMIZE_3
Message-ID: <bug-13586-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13586

            Bug ID: 13586
           Summary: grub failure with BR2_OPTIMIZE_3
           Product: buildroot
           Version: 2021.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ps.report at gmx.net
                CC: buildroot at uclibc.org
  Target Milestone: ---

Following defconfig works (real hardware and qemu):

BR2_x86_64=y
BR2_KERNEL_HEADERS_5_10=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pc/genimage-bios.cfg"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.20"
BR2_LINUX_KERNEL_DEFCONFIG="x86_64"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
# BR2_TARGET_ROOTFS_TAR is not set
BR2_TARGET_GRUB2=y
BR2_PACKAGE_HOST_GENIMAGE=y

Started with:

$ qemu-system-x86_64 -m 4096 --drive format=raw,file=images/disk.img

Shows BIOS, Grub and Startup until buildroot login...


Changing from BR2_OPTIMIZE_S to BR2_OPTIMIZE_3:

BR2_x86_64=y
BR2_OPTIMIZE_3=y
BR2_KERNEL_HEADERS_5_10=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pc/genimage-bios.cfg"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.20"
BR2_LINUX_KERNEL_DEFCONFIG="x86_64"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
# BR2_TARGET_ROOTFS_TAR is not set
BR2_TARGET_GRUB2=y
BR2_PACKAGE_HOST_GENIMAGE=y

Resulting image fails to start on real hardware, started with

$ emu-system-x86_64 -m 4096 --drive format=raw,file=images/disk.img

shows BIOS message 'Booting from Hard Disk...', 'GRUB loading...' and
loops endless re-booting...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
