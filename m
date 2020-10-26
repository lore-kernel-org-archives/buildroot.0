From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 26 Oct 2020 10:55:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/meson: add patch to fix issue
 in conjunction with imx-gpu-viv
In-Reply-To: <20201026081101.7488-1-heiko.thiery@gmail.com>
References: <20201026081101.7488-1-heiko.thiery@gmail.com>
Message-ID: <CAEyMn7ZD+B3UD=iVo9GZLEjPbNySwFokYzDXBaPn8gFLy646gw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Am Mo., 26. Okt. 2020 um 09:11 Uhr schrieb Heiko Thiery
<heiko.thiery@gmail.com>:
>
> In file included from host/aarch64-buildroot-linux-gnu/sysroot/usr/include/EGL/egl.h:39,
>                  from ../libweston/renderer-gl/gl-renderer.h:36,
>                  from ../libweston/backend-drm/drm-gbm.c:42:
> host/aarch64-buildroot-linux-gnu/sysroot/usr/include/EGL/eglplatform.h:144:10: fatal error: X11/Xlib.h: No such file or directory
>   144 | #include <X11/Xlib.h>
>
> For discussion upstream see: https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/508
>
> Cc: Gary Bisson <gary.bisson@boundarydevices.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Refik Tuzakli <tuzakli.refik@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  ...libweston-backend-drm-might-need-EGL.patch | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/meson/0003-libweston-backend-drm-might-need-EGL.patch
>
> diff --git a/package/meson/0003-libweston-backend-drm-might-need-EGL.patch b/package/meson/0003-libweston-backend-drm-might-need-EGL.patch
> new file mode 100644
> index 0000000000..ecc179840a
> --- /dev/null
> +++ b/package/meson/0003-libweston-backend-drm-might-need-EGL.patch
> @@ -0,0 +1,45 @@
> +From 4b93b71067949cc5efabb9b3d59278a3f362b11c Mon Sep 17 00:00:00 2001
> +From: Heiko Thiery <heiko.thiery@gmail.com>
> +Date: Wed, 21 Oct 2020 13:33:25 +0200
> +Subject: [PATCH] libweston/backend/drm: might need EGL
> +
> +gbm-drm.c includes gl-renderer.h. When EGL is enabled, that in turns
> +includes egl.h. As such, dependencies for drm should include EGL if
> +it is available.
> +
> +This condition is modelled after a similar one in libweston/meson.build
> +
> +Reported-by: Gary Bisson <gary.bisson@boundarydevices.com>
> +Reported-by: Heiko Thiery <heiko.thiery@gmail.com>
> +Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> +Cc: Refik Tuzakli <tuzakli.refik@gmail.com>
> +Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> +---
> +This patch should be a proper fix for the issue discribed in the patch from
> +Gary. Since the MR on meson upstream [2] is not merged now I add this patch
> +to have working meson with imx in buildroot.
> +
> +[1] https://patchwork.ozlabs.org/project/buildroot/patch/20200402130842.918696-3-gary.bisson at boundarydevices.com/
> +[2] https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/508
> +---
> + libweston/backend-drm/meson.build | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/libweston/backend-drm/meson.build b/libweston/backend-drm/meson.build
> +index 484c2702..e3e5b976 100644
> +--- a/libweston/backend-drm/meson.build
> ++++ b/libweston/backend-drm/meson.build
> +@@ -53,6 +53,9 @@ if get_option('renderer-gl')
> +               config_h.set('HAVE_GBM_FD_IMPORT', '1')
> +       endif
> +       deps_drm += dep_gbm
> ++      if dep_egl.found()
> ++              deps_drm += dep_egl
> ++      endif
> +       srcs_drm += 'drm-gbm.c'
> +       config_h.set('BUILD_DRM_GBM', '1')
> + endif


I blindly created this patch without testing it .. the patch was
copied to the wrong package meson but it has to reside in the weston
package. I will set this patch to a rejected state in patchwork and
create a new one for the right package.

Sorry for the noise.

-- 
Heiko
