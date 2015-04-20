From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Apr 2015 23:00:13 +0200
Subject: [Buildroot] [PATCH v2] live555: fix library installation
In-Reply-To: <1429519351-8391-1-git-send-email-luca@lucaceresoli.net>
References: <1429519351-8391-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20150420230013.318f77f5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Mon, 20 Apr 2015 10:42:31 +0200, Luca Ceresoli wrote:
> The manual target installation commands optionally copy 3 executables
> that demonstrate the library usage, but do not the library itself.
> 
> This results in the following errors at runtime:
> 
>   # openRTSP
>   openRTSP: can't load library 'libliveMedia.so.38'
>   # live555MediaServer
>   live555MediaServer: can't load library 'libliveMedia.so.38'
>   # MPEG2TransportStreamIndexer
>   MPEG2TransportStreamIndexer: can't load library 'libliveMedia.so.38'
>   #
> 
> Tested with the following defconfig, which is basically
> qemu_arm_versatile_defconfig plus C++ and live555:
> 
> BR2_arm=y
> BR2_KERNEL_HEADERS_VERSION=y
> BR2_DEFAULT_KERNEL_VERSION="4.0"
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.0"
> BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.0.config"
> BR2_LINUX_KERNEL_ZIMAGE=y
> BR2_PACKAGE_LIVE555=y
> BR2_TARGET_ROOTFS_EXT2=y
> 
> Fix the whole installation step by using the 'make install' step provided
> by the upstream package, similar to what was done in commit
> 44d15563c706dce48f84 for the staging installation.
> 
> Note: this change has the effect of installing unconditionally all the
> test and demo executables produced by the live555 compilation process,
> and that were previously not (or optionally) copied. This increases the
> uncompressed target filesystem size by roughly 300 kB (tested for a
> 32-bit ARM target). Undesired files can be deleted in a post-build script.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Baruch Siach <baruch@tkos.co.il>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> ---

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
