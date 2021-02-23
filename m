From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 23 Feb 2021 19:29:05 +0000
Subject: [Buildroot] [Bug 13551] 2021.02.rc2: Unicode not work on qt 5.15.2
In-Reply-To: <bug-13551-163@https.bugs.busybox.net/>
References: <bug-13551-163@https.bugs.busybox.net/>
Message-ID: <bug-13551-163-B1i8kpS9kZ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13551

--- Comment #4 from Peter Seiderer <ps.report@gmx.net> ---
On RPi3:

  $ ./test 2>&1 | hexdump -C
  00000000  3f 0a                                             |?.|
  00000002

  $ LANG=en_US.utf8 ./test 2>&1 | hexdump -C
00000000  e2 97 80 0a                                       |....|
00000004

With the following defconfig:

  BR2_arm=y
  BR2_cortex_a53=y
  BR2_ARM_FPU_NEON_VFPV4=y
  BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
  BR2_PACKAGE_GLIBC_UTILS=y
  BR2_BINUTILS_VERSION_2_36_X=y
  BR2_GCC_VERSION_10_X=y
  BR2_TOOLCHAIN_BUILDROOT_CXX=y
  BR2_PACKAGE_HOST_GDB=y
  BR2_GDB_VERSION_10=y
  BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
  BR2_SYSTEM_DHCP="eth0"
  BR2_GENERATE_LOCALE="en_US"
  BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
  BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay"
  BR2_LINUX_KERNEL=y
  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
  BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call
github,raspberrypi,linux,967d45b29ca2902f031b867809d72e3b3d623e7a)/linux-967d45b29ca2902f031b867809d72e3b3d623e7a.tar.gz"
  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
  BR2_LINUX_KERNEL_DTS_SUPPORT=y
  BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b bcm2710-rpi-3-b-plus
bcm2710-rpi-cm3"
  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
  BR2_PACKAGE_STRACE=y
  BR2_PACKAGE_QT5=y
  BR2_PACKAGE_QT5BASE_EXAMPLES=y
  BR2_PACKAGE_RPI_FIRMWARE=y
  BR2_PACKAGE_OPENSSH=y
  BR2_TARGET_ROOTFS_EXT2=y
  BR2_TARGET_ROOTFS_EXT2_4=y
  BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
  # BR2_TARGET_ROOTFS_TAR is not set
  BR2_PACKAGE_HOST_DOSFSTOOLS=y
  BR2_PACKAGE_HOST_GENIMAGE=y
  BR2_PACKAGE_HOST_MTOOLS=y

-- 
You are receiving this mail because:
You are on the CC list for the bug.
