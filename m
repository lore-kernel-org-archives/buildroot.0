From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 30 Apr 2015 20:57:16 +0200
Subject: [Buildroot] [v7,
	02/13] gpu-viv-bin-mx6q: fix compiling issues with EGL_API_FB
In-Reply-To: <1430406748-8493-3-git-send-email-jezz@sysmic.org>
References: <1430406748-8493-3-git-send-email-jezz@sysmic.org>
Message-ID: <20150430185716.GA8609@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jerome,

On Thu, Apr 30, 2015 at 05:12:17PM +0200, J?r?me Pouiller wrote:
> To compile with Vivante header and use framebuffer, it is necessary to
> pass option -DEGL_API_FB. This option is declared in pkg-config file of
> Vivante library. But many packages (especialy qt5 components) does not
> consider these flags.
> 
> So instead of patching every packages that use EGL, it is more
> convenient to patch Vivante headers.
> 
> This commit add #define EGL_API_FB on top of eglvivante.h when
> necessary.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  package/freescale-imx/gpu-viv-bin-mx6q/egl.pc              |  2 +-
>  package/freescale-imx/gpu-viv-bin-mx6q/glesv2.pc           |  2 +-
>  package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk | 14 ++++++++++----
>  package/freescale-imx/gpu-viv-bin-mx6q/vg.pc               |  2 +-
>  4 files changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/egl.pc b/package/freescale-imx/gpu-viv-bin-mx6q/egl.pc
> index c984247..d1d09a0 100644
> --- a/package/freescale-imx/gpu-viv-bin-mx6q/egl.pc
> +++ b/package/freescale-imx/gpu-viv-bin-mx6q/egl.pc
> @@ -7,4 +7,4 @@ Name: egl
>  Description: Freescale gpu-viv-bin-mx6q implementation of EGL
>  Version: 1.0
>  Libs: -L${libdir} -lGAL -lEGL
> -Cflags: -I${includedir}/ -DEGL_API_FB=1
> +Cflags: -I${includedir}/
> diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/glesv2.pc b/package/freescale-imx/gpu-viv-bin-mx6q/glesv2.pc
> index 7cfb5e7..74ce792 100644
> --- a/package/freescale-imx/gpu-viv-bin-mx6q/glesv2.pc
> +++ b/package/freescale-imx/gpu-viv-bin-mx6q/glesv2.pc
> @@ -7,4 +7,4 @@ Name: glesv2
>  Description: Freescale gpu-viv-bin-mx6q implementation of OpenGL ESv2
>  Version: 2.0
>  Libs: -L${libdir} -lGAL -lEGL -lGLESv2
> -Cflags: -I${includedir}/ -DEGL_API_FB=1
> +Cflags: -I${includedir}/
> diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> index 79c7a92..0304ba1 100644
> --- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> +++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> @@ -46,16 +46,22 @@ define GPU_VIV_BIN_MX6Q_BUILD_CMDS
>  	ln -sf libGL.so.1.2 $(@D)/usr/lib/libGL.so.1.2.0
>  endef
>  
> +ifeq ($(GPU_VIV_BIN_MX6Q_LIB_TARGET),fb)
> +define GPU_VIV_BIN_MX6Q_FIXUP_FB_HEADERS
> +	$(SED) '/#define EGLAPIENTRY/ a \
> +		#if !defined(EGL_API_X11) && !defined(EGL_API_DFB) && !defined(EGL_API_FB) \n\
> +		#define EGL_API_FB \n\
> +		#endif' $(STAGING_DIR)/usr/include/EGL/eglvivante.h; \

Can you re-send this patch without the backslash at the end of the line
as it breaks the build (missing endif error)?

Regards,
Gary
