From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jul 2016 22:23:39 +0200
Subject: [Buildroot] [PATCH 2/2 v4] board: add support for Chromebook
	Snow
In-Reply-To: <20160105170013.GA18795@vostro> (Alex Suykov's message of "Tue, 5
 Jan 2016 19:00:13 +0200")
References: <20160105170013.GA18795@vostro>
Message-ID: <87eg7ampx0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alex" == Alex Suykov <alex.suykov@gmail.com> writes:

Hi,

Sorry for the really slow response!

 > Chromebook Snow (Samsung XE303C12) is an Exynos 5 board with
 > a keyboard, an 11 inch screen and a battery attached.
 > It is relatively developer-friendly and can run mainline Linux
 > kernels with little to no effort.

 > There is barely anything special about this target as far as toolchain
 > is concerned, but its bootloader only accepts signed kernel images
 > in a Chromium OS specific format, and is not controllable otherwise.

 > This config provides a script for building the proper kernel blobs,
 > and a short manual for booting Buildroot images on this device.

 > In-tree exynos_defconfig is used for the kernel, with a fragment
 > to change mwifiex into a module. When built statically, mwifiex
 > attempts to load its firmware before rootfs is mounted and fails.

 > Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
 > ---
 > v2: script to make complete SD card image
 >     explicit kernel version in defconfig
 >     comments and text updates
 > v3: host-dtc dependency
 >     text tweaks
 > v4: in-tree defconfig + fragment instead of custom kernel config
 >     scripts updated to use buildroot's *_DIR variables directly
 >     device tree tpm patch for nv-uboot
 >     minor text fixes

> +++ b/configs/chromebook_snow_defconfig
 > @@ -0,0 +1,25 @@
 > +BR2_arm=y
 > +BR2_cortex_a15=y
 > +BR2_KERNEL_HEADERS_VERSION=y
 > +BR2_DEFAULT_KERNEL_VERSION="4.3"
 > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 > +BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 > +BR2_TARGET_GENERIC_GETTY_TERM="linux"
 > +BR2_ROOTFS_POST_BUILD_SCRIPT="board/chromebook/snow/sign.sh"
 > +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/chromebook/snow/mksd.sh"
 > +BR2_LINUX_KERNEL=y
 > +BR2_LINUX_KERNEL_SAME_AS_HEADERS=y

This has been reversed so you now do BR2_KERNEL_HEADERS_AS_KERNEL=y
instead.

 > +BR2_LINUX_KERNEL_PATCH="board/chromebook/snow/linux-4.3-dts-tpm.patch"

You forgot to lock the kernel version to a 4.3 series kernel. I've now
set it to 4.3.6.

 > +BR2_LINUX_KERNEL_DEFCONFIG="exynos"
 > +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/chromebook/snow/linux-4.3.fragment"
 > +BR2_LINUX_KERNEL_ZIMAGE=y
 > +BR2_LINUX_KERNEL_DTS_SUPPORT=y
 > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="exynos5250-snow"
 > +BR2_PACKAGE_LINUX_FIRMWARE=y
 > +BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8797=y
 > +BR2_TARGET_ROOTFS_EXT2=y
 > +BR2_TARGET_ROOTFS_EXT2_4=y
 > +BR2_PACKAGE_HOST_DTC=y
 > +BR2_PACKAGE_HOST_PARTED=y
 > +BR2_PACKAGE_HOST_UBOOT_TOOLS=y

For fit support in mkimage we need to enable:

BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y

Committed with that fixed, thanks.

If you have time, it would be nice to verify that 4.6.3 works correctly
and then send a patch to update the defconfig.

-- 
Bye, Peter Korsgaard
