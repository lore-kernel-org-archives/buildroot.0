From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 21:36:17 +0100
Subject: [Buildroot] [PATCH v5 05/15] gpu-viv-bin-mx6q: make fb/x11
 choice explicit
In-Reply-To: <1418132813-32642-6-git-send-email-jezz@sysmic.org>
References: <1418132813-32642-1-git-send-email-jezz@sysmic.org>
 <1418132813-32642-6-git-send-email-jezz@sysmic.org>
Message-ID: <20141227213617.60fc152d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Tue,  9 Dec 2014 14:46:43 +0100, J?r?me Pouiller wrote:
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/freescale-imx/gpu-viv-bin-mx6q/Config.in   | 24 ++++++++++++++++++++--
>  .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           |  2 +-
>  2 files changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
> index 4e83dd3..904b011 100644
> --- a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
> +++ b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
> @@ -7,8 +7,6 @@ config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
>  	select BR2_PACKAGE_HAS_LIBEGL
>  	select BR2_PACKAGE_HAS_LIBGLES
>  	select BR2_PACKAGE_HAS_LIBOPENVG
> -	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
> -	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7

So we used to select libxdamage and libxext...

>  	depends on BR2_arm # Only relevant for i.MX6
>  	# Library binaries are linked against libc.so.6
>  	depends on BR2_TOOLCHAIN_USES_GLIBC
> @@ -25,6 +23,28 @@ config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
>  
>  if BR2_PACKAGE_GPU_VIV_BIN_MX6Q
>  
> +choice
> +	prompt "Output option"
> +	help
> +	  There are two versions of this library: one for
> +	  direct framebuffer access, one for X11 rendering.
> +	  Choose here which version to install.
> +
> +config BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11
> +	depends on BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XLIB_LIBXDAMAGE
> +	select BR2_PACKAGE_XLIB_LIBXEXT
> +	select BR2_PACKAGE_LIBDRM

... and now we're also selecting libdrm. Is this intended? Why isn't
this explained in the commit log?

>  # DirectFB is not supported (wrong version)
> -ifeq ($(BR2_PACKAGE_XORG7),y)
> +ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11),y)
>  GPU_VIV_BIN_MX6Q_DEPENDENCIES = xlib_libXdamage xlib_libXext

And libdrm is not part of the dependencies?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
