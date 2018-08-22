From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 22 Aug 2018 13:29:59 +0200
Subject: [Buildroot] [PATCH v2 2/2] sunxi-mali-mainline-driver: bump
 version and add support for building on arm64(aarch64).
In-Reply-To: <20180822000648.23314-3-giulio.benetti@micronovasrl.com>
References: <20180822000648.23314-1-giulio.benetti@micronovasrl.com>
 <20180822000648.23314-3-giulio.benetti@micronovasrl.com>
Message-ID: <20180822132959.39640475@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Giulio,

On Wed, 22 Aug 2018 02:06:48 +0200, Giulio Benetti wrote:
> Blobs for arm64(aarch64) are available at Bootlin Github and
> sunxi-mali-mainline package has been updated to support them.
> 
> Add support for building on arm64(aarch64):
> - Bump version to latest commit:
> For support H3 and H5 SoCs and r8p1 driver version.
> 
> git shortlog --invert-grep --grep travis --no-merges 52ef1c5e133cc5fd791ca636239dc5e7b19c26d5..
> Maxime Ripard (6):
>       Add r8p1 release
>       sunxi: Move the reset test to a function
>       sunxi: Add H3 support
>       sunxi: Add H5 support
>       sunxi: Remove generic compatible
>       sunxi: Set clock rate in the driver
> 
> - Add ARCH=arm or ARCH=arm64 to SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS
> to build for the right architecture according to BR2_arm or BR2_aarch64.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

So actually your PATCH 1/2 without PATCH 2/2 is broken, because PATCH
1/2 now allows to enable sunxi-mali-mainline on AArch64, but
sunxi-mali-mainline-driver does not support AArch64. It seems like you
have some issue understanding the concept of bisectability :-)

Anyway, now that PATCH 1/2 is applied and pushed, it's too late to back
out.

> @@ -13,6 +13,12 @@ SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS = \
>  	CROSS_COMPILE=$(TARGET_CROSS) \
>  	INSTALL_MOD_PATH=$(TARGET_DIR)
>  
> +ifeq ($(BR2_arm),y)
> +SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS += ARCH=arm
> +else ifeq ($(BR2_aarch64),y)
> +SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS += ARCH=arm64
> +endif

Could you instead change the .mk to do this:

SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS = \
	$(LINUX_MAKE_FLAGS) \
        KDIR=$(LINUX_DIR)

Indeed, LINUX_MAKE_FLAGS already include CROSS_COMPILE,
INSTALL_MOD_PATH and ARCH.

As separate commits, please add hash files for both sunxi-mali-mainline
and sunxi-mainline-driver. Also, it would be good to have patches
adding license information for both of those packages. For the
mali-blobs, there's a PDF containing the EULA. For the kernel driver, I
didn't see a license file, but I didn't look everywhere. If there is
none, could you check with Maxime to make sure a license file gets
added ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
