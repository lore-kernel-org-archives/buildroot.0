From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Mon, 11 Nov 2019 17:12:13 +0000
Subject: [Buildroot] [PATCH] package/x11r7/xserver_xorg-server: Fix ARM
 build
In-Reply-To: <c7a19ef5-03ee-64c5-bf1b-e84d220561ef@codethink.co.uk>
References: <20191111124807.1151582-1-thomas.preston@codethink.co.uk>
 <20191111153657.1a56760e@windsurf.home>
 <c7a19ef5-03ee-64c5-bf1b-e84d220561ef@codethink.co.uk>
Message-ID: <08d749aa-743d-d05c-7aae-b98e70862617@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/11/2019 15:06, Thomas Preston wrote:
> Hey,
> Thanks for reviewing.
> 
> On 11/11/2019 14:36, Thomas Petazzoni wrote:
>> Hello Thomas,
>>
>> On Mon, 11 Nov 2019 12:48:07 +0000
>> Thomas Preston <thomas.preston@codethink.co.uk> wrote:
>>
>>> The ARM sys/io.h has been removed from upstream glibc, which is in
>>> buildroot. This causes the xorg-server build to fail on ARM when using
>>> the glibc toolchain.
>>>
>>> The following patches from upstream xserver fix this, but have not yet
>>> been released.
>>>
>>> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
>>
>> Do we have any autobuilder failures for this? From a quick look, I
>> don't see any. So the question is: why?
>>
> 
> I will reproduce and get back to you.
> 

I can reproduce with some changes to raspberrypi3_defconfig. The
changes can be summarised as:
- Switch glibc toolchain instead of uclibc
- Enable xorg-server

I don't think there are any defconfigs (except with my changes) which
meet these conditions:

	$ git grep -l BR2_arm=y configs | xargs grep -l GLIBC | xargs grep XORG_SERVER
	configs/raspberrypi3_defconfig:BR2_PACKAGE_XSERVER_XORG_SERVER=y

So this condition is never reproduced in the autobuilder.

Here is the error:

	>>> xserver_xorg-server 1.20.5 Building
	[snip]
	In file included from lnx_init.c:33:
	../../../../hw/xfree86/common/compiler.h:767:10: fatal error: sys/io.h: No such file or directory
	 #include <sys/io.h>
          ^~~~~~~~~~
	compilation terminated.

And here are my changes to raspberrypi3_defconfig:

diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 744b16dca9..0781a124d7 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -1,37 +1,27 @@
 BR2_arm=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_NEON_VFPV4=y
-
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
-
 BR2_SYSTEM_DHCP="eth0"
-
-# Linux headers same as kernel, a 4.19 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
-
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190819-1)/linux-raspberrypi-kernel_1.20190819-1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
-
-# Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b bcm2710-rpi-3-b-plus bcm2710-rpi-cm3"
-
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-
+BR2_PACKAGE_XORG7=y
+BR2_PACKAGE_XSERVER_XORG_SERVER=y
 BR2_PACKAGE_RPI_FIRMWARE=y
-
-# Required tools to create the SD image
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-
-# Filesystem / image
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
