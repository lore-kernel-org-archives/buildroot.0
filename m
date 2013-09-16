From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Mon, 16 Sep 2013 11:34:39 -0500
Subject: [Buildroot] [PATCHv2 1/4] core: introduce the BR2_EXTERNAL
	variable
In-Reply-To: <1379185433-8770-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1379185433-8770-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <OF0FD99CA0.0DD1D9C1-ON86257BE8.005A4297-86257BE8.005B1032@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Per our chat on IRC, putting BR2_EXTERNAL into the generated makefile
isn't quite working out like I expected. I'm losing the BR2_EXTERNAL
variable definition.

Here are the steps I'm taking after applying your v2 of this patch to
a git clone of the mainline of buildroot. The buildroot clone is not
in the directory of ~/tmp but elsewhere.

make O=~/tmp/build_xm BR2_EXTERNAL=~/tmp/buildroot 
rc_beagle_xm_min_defconfig
cd ~/tmp/build_xm
make

Here is the output from the make:

make -C /home/rjbarnet/projects/buildroot/buildroot-git 
O=/home/rjbarnet/projects/muos/build_xm/. 
BR2_EXTERNAL=/home/rjbarnet/projects/muos/muos-svn/buildroot
/usr/bin/make -j8 O=/home/rjbarnet/projects/muos/build_xm/. 
HOSTCC="/usr/bin/gcc" HOSTCXX="/usr/bin/g++" silentoldconfig
  GEN     /home/rjbarnet/projects/muos/build_xm/./Makefile
BR2_DEFCONFIG='' 
KCONFIG_AUTOCONFIG=/home/rjbarnet/projects/muos/build_xm/build/buildroot-config/auto.conf 
KCONFIG_AUTOHEADER=/home/rjbarnet/projects/muos/build_xm/build/buildroot-config/autoconf.h 
KCONFIG_TRISTATE=/home/rjbarnet/projects/muos/build_xm/build/buildroot-config/tristate.config 
BUILDROOT_CONFIG=/home/rjbarnet/projects/muos/build_xm/./.config 
BR2_EXTERNAL=/home/rjbarnet/projects/buildroot/buildroot-git/support/dummy-external/ 
/home/rjbarnet/projects/muos/build_xm/build/buildroot-config/conf 
--silentoldconfig Config.in
mkdir -p /home/rjbarnet/projects/muos/build_xm/target
rsync -a \
                --exclude .empty --exclude .svn --exclude .git \
                --exclude .hg --exclude=CVS --exclude '*~' \
 /home/rjbarnet/projects/buildroot/buildroot-git/system/skeleton/ 
/home/rjbarnet/projects/muos/build_xm/target/
cp support/misc/target-dir-warning.txt 
/home/rjbarnet/projects/muos/build_xm/target/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
touch /home/rjbarnet/projects/muos/build_xm/build/.root
--2013-09-16 10:50:52-- 
<Stuff saying unable to downloading toolchain...>
--2013-09-16 10:50:55--  
http://sources.buildroot.net//gcc-linaro-arm-linux-gnueabihf-4.8-2013.08_linux.tar.xz
<Stuff saying can't download toolcahin....>
make[1]: *** 
[/home/apps/opt/buildroot-2011.05/dl/gcc-linaro-arm-linux-gnueabihf-4.8-2013.08_linux.tar.xz] 
Error 1
make: *** [all] Error 2

Note: I know the toolchain can't be downloaded, but the point is that 
I'm losing BR2_EXTERNAL path.

Here is the config that I'm using:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_EABIHF=y
BR2_DL_DIR="/home/apps/opt/buildroot-2011.05/dl"
BR2_JLEVEL=8
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_04=y
BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
BR2_TARGET_GENERIC_GETTY_PORT="ttyO2"
BR2_ROOTFS_OVERLAY="$(BR2_EXTERNAL)/board/common-omap/local-skeleton"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.13"
BR2_LINUX_KERNEL_PATCH="$(BR2_EXTERNAL)/board/common-omap/kernel-patches-3.8.13"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(BR2_EXTERNAL)/board/common-omap/linux-3.8.13.config"
BR2_LINUX_KERNEL_ZIMAGE=y
BR2_TARGET_ROOTFS_TAR_BZIP2=y
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BOARDNAME="omap3_beagle"
BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR="$(BR2_EXTERNAL)/board/common-omap/uboot-patches-2013.07"
BR2_TARGET_UBOOT_FORMAT_IMG=y
BR2_TARGET_UBOOT_SPL=y
BR2_TARGET_UBOOT_SPL_NAME="MLO"
BR2_PACKAGE_HOST_E2FSPROGS=y
BR2_PACKAGE_HOST_GENEXT2FS=y

Thanks,
-Ryan

-----------------------------------------------------------------
Ryan J Barnett / Software Engineer / Platform SW
MS 137-157, 855 35th St NE, Cedar Rapids, IA, 52498-3161, US
Phone: 319-263-3880 / VPN: 263-3880 
rjbarnet at rockwellcollins.com
www.rockwellcollins.com 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130916/398d2c22/attachment.html>
