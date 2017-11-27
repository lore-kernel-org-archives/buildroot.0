From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 27 Nov 2017 15:28:50 +0100
Subject: [Buildroot] [PATCH 1/2] sunxi-mali-driver-mainline: new package
In-Reply-To: <1511648569-18855-1-git-send-email-giulio.benetti@micronovasrl.com>
References: <1511648569-18855-1-git-send-email-giulio.benetti@micronovasrl.com>
Message-ID: <20171127142850.brtfcvts6syjukdb@flea.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sat, Nov 25, 2017 at 11:22:48PM +0100, Giulio Benetti wrote:
> Added kernel allwinner mali driver package.
> Used combined with userspace Allwinner openGL libraries,
> it gives possibility to use 3D openGL SoC acceleration.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  DEVELOPERS                                         |  3 ++
>  package/Config.in                                  |  1 +
>  package/sunxi-mali-driver-mainline/Config.in       | 38 ++++++++++++++++++++++
>  .../sunxi-mali-driver-mainline.mk                  | 30 +++++++++++++++++
>  4 files changed, 72 insertions(+)
>  create mode 100644 package/sunxi-mali-driver-mainline/Config.in
>  create mode 100644 package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 7621f96..60a934e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -698,6 +698,9 @@ F:	package/ocrad/
>  F:	package/tesseract-ocr/
>  F:	package/webp/
>  
> +N:	Giulio Benetti <giulio.benetti@micronovasrl.com>
> +F:	package/sunxi-mali-driver-mainline/
> +
>  N:	Gregory Dymarek <gregd72002@gmail.com>
>  F:	package/ding-libs/
>  F:	package/gengetopt/
> diff --git a/package/Config.in b/package/Config.in
> index fe5ccc4..e619992 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -497,6 +497,7 @@ endmenu
>  	source "package/stm32flash/Config.in"
>  	source "package/sunxi-cedarx/Config.in"
>  	source "package/sunxi-mali/Config.in"
> +	source "package/sunxi-mali-driver-mainline/Config.in"
>  	source "package/sysstat/Config.in"
>  	source "package/targetcli-fb/Config.in"
>  	source "package/ti-gfx/Config.in"
> diff --git a/package/sunxi-mali-driver-mainline/Config.in b/package/sunxi-mali-driver-mainline/Config.in
> new file mode 100644
> index 0000000..1f9ef59
> --- /dev/null
> +++ b/package/sunxi-mali-driver-mainline/Config.in
> @@ -0,0 +1,38 @@
> +comment "sunxi-mali-driver-mainline needs a Linux kernel to be built"
> +	depends on !BR2_LINUX_KERNEL
> +
> +config BR2_PACKAGE_SUNXI_MALI_DRIVER_MAINLINE
> +	bool "sunxi-mali-driver-mainline"
> +	depends on BR2_LINUX_KERNEL
> +	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
> +	help
> +	  This package builds and installs the Linux kernel driver for
> +	  the Mali GPU on Allwinner platforms, compatible with recent
> +	  Linux kernels (>= 4.4). Note that it should be installed
> +	  together with the corresponding userspace OpenGL libraries,
> +	  which are provided as binaries only at:
> +	  https://github.com/free-electrons/mali-blobs
> +
> +	  sunxi-mali-driver-mainline requires a Linux kernel >= 4.4 with the
> +	  following options enabled:
> +
> +	  - CONFIG_CMA
> +	  - CONFIG_DMA_CMA
> +	  - CONFIG_DRM_FBDEV_OVERALLOC >= 200 for double buffer or more

Sorry for missing that out earlier, but that one is not true. You can
achieve the same result using the drm_fbdev_overalloc kernel paremeter.

The rest looks good.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171127/fdcc9508/attachment.asc>
