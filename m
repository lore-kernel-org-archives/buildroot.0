From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 26 Oct 2020 14:05:44 +0100
Subject: [Buildroot] [git commit] package/weston: add patch to fix issue in
 conjunction with imx-gpu-viv
Message-ID: <20201026130726.2DB8380035@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4da7fe5d42943cfc6976bf4de510d623f11bfdb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In file included from host/aarch64-buildroot-linux-gnu/sysroot/usr/include/EGL/egl.h:39,
                 from ../libweston/renderer-gl/gl-renderer.h:36,
                 from ../libweston/backend-drm/drm-gbm.c:42:
host/aarch64-buildroot-linux-gnu/sysroot/usr/include/EGL/eglplatform.h:144:10: fatal error: X11/Xlib.h
 such file or directory
  144 | #include <X11/Xlib.h>

For the discussion upstream see: https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/508

Cc: Gary Bisson <gary.bisson@boundarydevices.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...0002-libweston-backend-drm-might-need-EGL.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/weston/0002-libweston-backend-drm-might-need-EGL.patch b/package/weston/0002-libweston-backend-drm-might-need-EGL.patch
new file mode 100644
index 0000000000..f504e1145b
--- /dev/null
+++ b/package/weston/0002-libweston-backend-drm-might-need-EGL.patch
@@ -0,0 +1,47 @@
+From 4b93b71067949cc5efabb9b3d59278a3f362b11c Mon Sep 17 00:00:00 2001
+From: Heiko Thiery <heiko.thiery@gmail.com>
+Date: Wed, 21 Oct 2020 13:33:25 +0200
+Subject: [PATCH] libweston/backend/drm: might need EGL
+
+gbm-drm.c includes gl-renderer.h. When EGL is enabled, that in turns
+includes egl.h. As such, dependencies for drm should include EGL if
+it is available.
+
+This condition is modelled after a similar one in libweston/meson.build
+
+Reported-by: Gary Bisson <gary.bisson@boundarydevices.com>
+Reported-by: Heiko Thiery <heiko.thiery@gmail.com>
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+Cc: Refik Tuzakli <tuzakli.refik@gmail.com>
+Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+This patch should be a proper fix for the issue discribed in the patch from
+Gary [1].
+
+Since the MR on weston upstream [2] is not merged now I add this patch
+to have working weston with imx in buildroot.
+
+[1] https://patchwork.ozlabs.org/project/buildroot/patch/20200402130842.918696-3-gary.bisson at boundarydevices.com/
+[2] https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/508
+---
+ libweston/backend-drm/meson.build | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/libweston/backend-drm/meson.build b/libweston/backend-drm/meson.build
+index 484c2702..e3e5b976 100644
+--- a/libweston/backend-drm/meson.build
++++ b/libweston/backend-drm/meson.build
+@@ -53,6 +53,9 @@ if get_option('renderer-gl')
+ 		config_h.set('HAVE_GBM_FD_IMPORT', '1')
+ 	endif
+ 	deps_drm += dep_gbm
++	if dep_egl.found()
++		deps_drm += dep_egl
++	endif
+ 	srcs_drm += 'drm-gbm.c'
+ 	config_h.set('BUILD_DRM_GBM', '1')
+ endif
+--
+2.20.1
+
