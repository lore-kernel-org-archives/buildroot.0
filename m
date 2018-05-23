From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 23 May 2018 14:44:42 +0000
Subject: [Buildroot] [Bug 11036] New: C compiler cannot create executables
Message-ID: <bug-11036-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11036

            Bug ID: 11036
           Summary: C compiler cannot create executables
           Product: buildroot
           Version: 2018.02.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: outtierbert at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7596
  --> https://bugs.busybox.net/attachment.cgi?id=7596&action=edit
file located in
output/build/host-gcc-initial-6.4.0/build/arm-buildroot-linux-uclibcgnueabihf/libgcc/config.log

Hi all,

I am trying to build my buildroot project, but I keep on getting a strange
error.

In the build step of host-gcc-initial, I get an error when it builds libgcc: 

Checking multilib configuration for libgcc...
mkdir -p -- arm-buildroot-linux-uclibcgnueabihf/libgcc
Configuring in arm-buildroot-linux-uclibcgnueabihf/libgcc
configure: creating cache ./config.cache
checking build system type... x86_64-pc-linux-gnu
checking host system type... arm-buildroot-linux-uclibcgnueabihf
checking for --enable-version-specific-runtime-libs... no
checking for a BSD-compatible install... /usr/bin/install -c
checking for gawk... gawk
checking for arm-buildroot-linux-uclibcgnueabihf-ar...
/home/bertou/development/bernardo-buildroot/buildroot/output/host/arm-buildroot-linux-uclibcgnueabihf/bin/ar
checking for arm-buildroot-linux-uclibcgnueabihf-lipo...
arm-buildroot-linux-uclibcgnueabihf-lipo
checking for arm-buildroot-linux-uclibcgnueabihf-nm...
/home/bertou/development/bernardo-buildroot/buildroot/output/build/host-gcc-initial-6.4.0/build/./gcc/nm
checking for arm-buildroot-linux-uclibcgnueabihf-ranlib...
/home/bertou/development/bernardo-buildroot/buildroot/output/host/arm-buildroot-linux-uclibcgnueabihf/bin/ranlib
checking for arm-buildroot-linux-uclibcgnueabihf-strip...
/home/bertou/development/bernardo-buildroot/buildroot/output/host/arm-buildroot-linux-uclibcgnueabihf/bin/strip
checking whether ln -s works... yes
checking for arm-buildroot-linux-uclibcgnueabihf-gcc... 
/home/bertou/development/bernardo-buildroot/buildroot/output/build/host-gcc-initial-6.4.0/build/./gcc/xgcc
-B/home/bertou/development/bernardo-buildroot/buildroot/output/build/host-gcc-initial-6.4.0/build/./gcc/
-B/home/bertou/development/bernardo-buildroot/buildroot/output/host/arm-buildroot-linux-uclibcgnueabihf/bin/
-B/home/bertou/development/bernardo-buildroot/buildroot/output/host/arm-buildroot-linux-uclibcgnueabihf/lib/
-isystem
/home/bertou/development/bernardo-buildroot/buildroot/output/host/arm-buildroot-linux-uclibcgnueabihf/include
-isystem
/home/bertou/development/bernardo-buildroot/buildroot/output/host/arm-buildroot-linux-uclibcgnueabihf/sys-include 
checking for C compiler default output file name... 
configure: error: in
`/home/bertou/development/bernardo-buildroot/buildroot/output/build/host-gcc-initial-6.4.0/build/arm-buildroot-linux-uclibcgnueabihf/libgcc':
configure: error: C compiler cannot create executables
See `config.log' for more details.
Makefile:10976: recipe for target 'configure-target-libgcc' failed
make[2]: *** [configure-target-libgcc] Error 1
package/pkg-generic.mk:223: recipe for target
'/home/bertou/development/bernardo-buildroot/buildroot/output/build/host-gcc-initial-6.4.0/.stamp_built'
failed
make[1]: ***
[/home/bertou/development/bernardo-buildroot/buildroot/output/build/host-gcc-initial-6.4.0/.stamp_built]
Error 2
Makefile:79: recipe for target '_all' failed
make: *** [_all] Error 2

My system is a Ubuntu 16.04, gcc version 5.4.0

The full config.log is in attachment. I can build other buildroot projects just
fine, so it does not seem to be a environment issue.

This is the buildroot defconfig that I am trying to build:

BR2_arm=y
BR2_cortex_a8=y
BR2_GLOBAL_PATCH_DIR="$(BR2_EXTERNAL_BERNARDO_PATH)/board/bernardo/patches"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
BR2_ROOTFS_OVERLAY="$(BR2_EXTERNAL_BERNARDO_PATH)/board/bernardo/rootfs_overlay"
BR2_ROOTFS_POST_BUILD_SCRIPT="$(BR2_EXTERNAL_BERNARDO_PATH)/board/bernardo/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="$(BR2_EXTERNAL_BERNARDO_PATH)/board/bernardo/post-image.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/RobertCNelson/linux-stable-rcn-ee"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="4.9.36-ti-r46"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(BR2_EXTERNAL_BERNARDO_PATH)/board/bernardo/kernel.config"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="$(BR2_EXTERNAL_BERNARDO_PATH)/board/bernardo/bernardo.dts"
BR2_PACKAGE_BUSYBOX_CONFIG="$(BR2_EXTERNAL_BERNARDO_PATH)/board/bernardo/busybox.config"
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
BR2_TARGET_UBOOT_CUSTOM_GIT=y
BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/u-boot/u-boot"
BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2018.01"
BR2_TARGET_UBOOT_PATCH="$(BR2_EXTERNAL_BERNARDO_PATH)/board/bernardo/u-boot"
BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_boneblack"
BR2_TARGET_UBOOT_NEEDS_DTC=y
# BR2_TARGET_UBOOT_FORMAT_BIN is not set
BR2_TARGET_UBOOT_FORMAT_IMG=y
BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="spl/u-boot-spl.bin"
BR2_TARGET_UBOOT_SPL=y
BR2_TARGET_UBOOT_SPL_NAME="MLO"
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y

When I try to build the beaglebone_defconfig config (which is not that
different), I do not have any issue. 

Can you guys help me?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
