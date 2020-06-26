From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 26 Jun 2020 18:51:57 +0200
Subject: [Buildroot] Cannot build glibc for ARM with GCC10
Message-ID: <CAGm1_kti3EuVpDUMKcuHfLfpKoRhBwKbzxte9NncjNgmpn7qyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I just wanted to test GCC10 with glibc and encountered the following error:

In file included from ../sysdeps/arm/libc-tls.c:19:
../csu/libc-tls.c: In function '__libc_setup_tls':
../csu/libc-tls.c:209:30: error: array subscript 1 is outside the
bounds of an interior zero-length array 'struct dtv_slotinfo[0]'
[-Werror=zero-length-bounds]
  209 |   static_slotinfo.si.slotinfo[1].map = main_map;
      |   ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
In file included from ../sysdeps/arm/ldsodefs.h:38,
                 from ../sysdeps/gnu/ldsodefs.h:46,
                 from ../sysdeps/unix/sysv/linux/ldsodefs.h:25,
                 from ../sysdeps/unix/sysv/linux/arm/ldsodefs.h:22,
                 from ../csu/libc-tls.c:21,
                 from ../sysdeps/arm/libc-tls.c:19:
../sysdeps/generic/ldsodefs.h:406:7: note: while referencing 'slotinfo'
  406 |     } slotinfo[0];
      |       ^~~~~~~~

My defconfig for BBB:

BR2_arm=y
BR2_cortex_a8=y
BR2_GLOBAL_PATCH_DIR="board/beaglebone/patches"
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
BR2_GCC_VERSION_10_X=y
BR2_ROOTFS_POST_BUILD_SCRIPT="board/beaglebone/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beaglebone/genimage.cfg"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call
github,beagleboard,linux,4.19.79-ti-r30)/linux-4.19.79-ti-r30.tar.gz"
BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone
am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
BR2_TARGET_UBOOT_CUSTOM_VERSION=y
BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.04"
BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
BR2_TARGET_UBOOT_NEEDS_DTC=y
# BR2_TARGET_UBOOT_FORMAT_BIN is not set
BR2_TARGET_UBOOT_FORMAT_IMG=y
BR2_TARGET_UBOOT_SPL=y
BR2_TARGET_UBOOT_SPL_NAME="MLO"
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y
BR2_PACKAGE_HOST_UBOOT_TOOLS=y
BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y

Regards,
Yegor
