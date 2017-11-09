From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Nov 2017 20:26:01 +0100
Subject: [Buildroot] [PATCH v3 1/1] add sunxi-mali mainline kernel
In-Reply-To: <1510255108-39722-1-git-send-email-giulio.benetti@micronovasrl.com>
References: <1510255108-39722-1-git-send-email-giulio.benetti@micronovasrl.com>
Message-ID: <20171109202601.0a6a90fe@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for working on this, it's great to see this OpenGL support for
Allwinner platforms improved in Buildroot.

However, you are respinning your patches too fast. Please leave a
little bit of time between each iteration, to allow other people to
comment.

The title of your commit should be:

	sunxi-mali-driver-mainline: new package

On Thu,  9 Nov 2017 20:18:28 +0100, Giulio Benetti wrote:
> As it's not present in buildroot,
> add support for sunxi-mali mainline kernel driver.

This paragrah is not very useful.

> Get https://github.com/mripard/sunxi-mali repository,
> build with provided ./build.sh -b
> install with provided ./build.sh -i

This either.

>  package/sunxi-mali-driver-mainline/Config.in       | 17 ++++++++++++++
>  .../sunxi-mali-driver-mainline.mk                  | 26 ++++++++++++++++++++++
>  2 files changed, 43 insertions(+)
>  create mode 100644 package/sunxi-mali-driver-mainline/Config.in
>  create mode 100644 package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk
> 
> diff --git a/package/sunxi-mali-driver-mainline/Config.in b/package/sunxi-mali-driver-mainline/Config.in
> new file mode 100644
> index 0000000..43c7cb1
> --- /dev/null
> +++ b/package/sunxi-mali-driver-mainline/Config.in
> @@ -0,0 +1,17 @@
> +comment "sunxi-mali-driver-mainline needs a Linux kernel to be built"
> +	depends on !BR2_LINUX_KERNEL
> +
> +config BR2_PACKAGE_SUNXI_MALI_DRIVER_MAINLINE
> +	bool "sunxi-mali-driver-mainline"
> +	depends on BR2_LINUX_KERNEL
> +	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
> +	help
> +	  Install Sunxi Mali Kernel space driver into userspace,

Installing a kernel driver to userspace? That really doesn't make much
sense.

What about:

	  This package builds and installs the Linux kernel driver for
	  the Mali GPU on Allwinner platforms, compatible with recent
	  Linux kernels (>= 4.4). Note that it should be installed
	  together with the corresponding userspace binary blobs to
	  provide complete OpenGL functionality.

> +	  sunxi-mali-driver-mainline requires a Linux kernel >= 4.4 with the
> +	  following options enabled:
> +
> +	  - CONFIG_CMA
> +	  - CONFIG_DMA_CMA
> +	  - CONFIG_DRM_FBDEV_OVERALLOC >= 200 for double buffer or more
> +
> +	  https://github.com/mripard/sunxi-mali/blob/master/README.md
> \ No newline at end of file

Please add a newline after the URL.

> diff --git a/package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk b/package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk
> new file mode 100644
> index 0000000..b6125d4
> --- /dev/null
> +++ b/package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# sunxi-mali-driver-mainline
> +#
> +################################################################################
> +
> +SUNXI_MALI_DRIVER_MAINLINE_VERSION = 5b7b3c0b6e1736676c90928816d271debbb09d95
> +SUNXI_MALI_DRIVER_MAINLINE_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_DRIVER_MAINLINE_VERSION))
> +SUNXI_MALI_DRIVER_MAINLINE_DEPENDENCIES = linux
> +
> +SUNXI_MALI_DRIVER_MAINLINE_MAKE_OPTS = \
> +	KDIR=$(LINUX_DIR) \
> +	CROSS_COMPILE=$(TARGET_CROSS) \
> +	INSTALL_MOD_PATH=$(TARGET_DIR)
> +
> +define SUNXI_MALI_DRIVER_MAINLINE_BUILD_CMDS
> +	cd $(@D) &&	$(SUNXI_MALI_DRIVER_MAINLINE_MAKE_OPTS) \
> +		bash ./build.sh -r r6p2 -b

Remove tab after &&, and use $(SHELL) instead of bash.

> +endef
> +
> +define SUNXI_MALI_DRIVER_MAINLINE_INSTALL_TARGET_CMDS
> +	cd $(@D) &&	$(SUNXI_MALI_DRIVER_MAINLINE_MAKE_OPTS) \
> +		bash ./build.sh -r r6p2 -i
> +endef

Ditto.

Also, please add an entry to the DEVELOPERS file for this package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
