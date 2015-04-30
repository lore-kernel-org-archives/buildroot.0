From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 30 Apr 2015 10:29:18 +0200
Subject: [Buildroot] [v6,
	03/15] gpu-viv-bin-mx6q: make fb/x11 choice explicit
In-Reply-To: <1421451251-23366-4-git-send-email-jezz@sysmic.org>
References: <1421451251-23366-4-git-send-email-jezz@sysmic.org>
Message-ID: <20150430082918.GC24549@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Sat, Jan 17, 2015 at 12:33:59AM +0100, J?r?me Pouiller wrote:
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/freescale-imx/gpu-viv-bin-mx6q/Config.in   | 23 ++++++++++++++++++++--
>  .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           |  2 +-
>  2 files changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
> index 4e83dd3..0947f17 100644
> --- a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
> +++ b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
> @@ -7,8 +7,6 @@ config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
>  	select BR2_PACKAGE_HAS_LIBEGL
>  	select BR2_PACKAGE_HAS_LIBGLES
>  	select BR2_PACKAGE_HAS_LIBOPENVG
> -	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
> -	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
>  	depends on BR2_arm # Only relevant for i.MX6
>  	# Library binaries are linked against libc.so.6
>  	depends on BR2_TOOLCHAIN_USES_GLIBC
> @@ -25,6 +23,27 @@ config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
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
> +	bool "X11"
> +
> +comment "X11 backend needs Xorg package"
> +	depends on !BR2_PACKAGE_XORG7
> +
> +config BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_FB
> +	bool "Framebuffer"
> +
> +endchoice
> +
>  config BR2_PACKAGE_PROVIDES_LIBEGL
>  	default "gpu-viv-bin-mx6q"
>  
> diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> index eb54b80..7895023 100644
> --- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> +++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> @@ -21,7 +21,7 @@ GPU_VIV_BIN_MX6Q_REDISTRIBUTE = NO
>  GPU_VIV_BIN_MX6Q_PROVIDES = libegl libgles libopenvg
>  
>  # DirectFB is not supported (wrong version)
> -ifeq ($(BR2_PACKAGE_XORG7),y)
> +ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11),y)
>  GPU_VIV_BIN_MX6Q_DEPENDENCIES = xlib_libXdamage xlib_libXext
>  GPU_VIV_BIN_MX6Q_LIB_TARGET = x11
>  else

As explained in my answer to the cover letter, this series of patch has
been successfully tested on a Nitrogen6x board.
http://lists.busybox.net/pipermail/buildroot/2015-April/124739.html

Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>

Also, this change has been discussed earlier as for the reason to be
able to have fb libs in a X-based system and people seemed interested.
Therefore this approach is more flexible than what was present before.

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
