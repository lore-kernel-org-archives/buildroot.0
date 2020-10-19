From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 19 Oct 2020 14:36:26 +0200
Subject: [Buildroot] [PATCH 2/2] package/freescale-imx/imx-gpu-viv: fix
 build issue with Wayland backend
In-Reply-To: <20200402130842.918696-3-gary.bisson@boundarydevices.com>
References: <20200402130842.918696-1-gary.bisson@boundarydevices.com>
 <20200402130842.918696-3-gary.bisson@boundarydevices.com>
Message-ID: <CAEyMn7Z0150LH6Ce7u4+7F6n2YFby-PHwAuiS0fQaxd6FC13EA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

Am Do., 2. Apr. 2020 um 15:09 Uhr schrieb Gary Bisson
<gary.bisson@boundarydevices.com>:
>
> Just like Jerome had to do with EGL_API_FB back in the days, in order to
> compile with Vivante header it is necessary to have some defines setup
> as the default behavior of eglplatform.h is to include Xlib.h.
>
> So this patch sets WL_EGL_PLATFORM when the Wayland backend is used.
> This option is actually declared in egl.pc but not all packages use
> pkg-config properly.
>
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

Tested-by: Heiko Thiery <heiko.thiery@gmail.com>

> ---
> Fixes the following build issue (building weston):
> In file included from host/aarch64-buildroot-linux-gnu/sysroot/usr/include/EGL/egl.h:39,
>                  from ../libweston/renderer-gl/gl-renderer.h:36,
>                  from ../libweston/backend-drm/drm-gbm.c:42:
> host/aarch64-buildroot-linux-gnu/sysroot/usr/include/EGL/eglplatform.h:144:10: fatal error: X11/Xlib.h: No such file or directory
>   144 | #include <X11/Xlib.h>
> ---
>  package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
> index 646d4e3673..cd9a9339b4 100644
> --- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
> +++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
> @@ -59,9 +59,9 @@ define IMX_GPU_VIV_BUILD_CMDS
>  endef
>
>  ifeq ($(IMX_GPU_VIV_LIB_TARGET),fb)
> -define IMX_GPU_VIV_FIXUP_FB_HEADERS
> +define IMX_GPU_VIV_FIXUP_HEADERS
>         $(SED) '39i\
> -               #if !defined(EGL_API_X11) && !defined(EGL_API_DFB) && !defined(EGL_API_FB) \n\
> +               #if !defined(EGL_API_X11) && !defined(EGL_API_DFB) && !defined(EGL_API_FB) && !defined(WL_EGL_PLATFORM) \n\
>                 #define EGL_API_FB \n\
>                 #endif' $(STAGING_DIR)/usr/include/EGL/eglplatform.h
>  endef
> @@ -77,6 +77,12 @@ ifeq ($(IMX_GPU_VIV_LIB_TARGET),wl)
>  define IMX_GPU_VIV_FIXUP_PKGCONFIG
>         ln -sf egl_wayland.pc $(@D)/gpu-core/usr/lib/pkgconfig/egl.pc
>  endef
> +define IMX_GPU_VIV_FIXUP_HEADERS
> +       $(SED) '39i\
> +               #if !defined(EGL_API_X11) && !defined(EGL_API_DFB) && !defined(EGL_API_FB) && !defined(WL_EGL_PLATFORM) \n\
> +               #define WL_EGL_PLATFORM\n\
> +               #endif' $(STAGING_DIR)/usr/include/EGL/eglplatform.h
> +endef
>  endif
>
>  ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
> @@ -89,7 +95,7 @@ endif
>
>  define IMX_GPU_VIV_INSTALL_STAGING_CMDS
>         cp -r $(@D)/gpu-core/usr/* $(STAGING_DIR)/usr
> -       $(IMX_GPU_VIV_FIXUP_FB_HEADERS)
> +       $(IMX_GPU_VIV_FIXUP_HEADERS)
>         $(IMX_GPU_VIV_FIXUP_PKGCONFIG)
>         for lib in egl gbm glesv1_cm glesv2 vg; do \
>                 $(INSTALL) -m 0644 -D \
> --
> 2.25.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
