From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 21:06:45 +0100
Subject: [Buildroot] [git commit] package/libva: backport Add pointer to
 struct wl_interface for driver to use
Message-ID: <20190116200933.1AC478D714@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=153788ba05a48bbdb4baa43235ce438604f4ad11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is needed by libva-intel-driver when using wayland.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-to-struct-wl_interface-for-driver-to-use.patch | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/package/libva/0001-Add-pointer-to-struct-wl_interface-for-driver-to-use.patch b/package/libva/0001-Add-pointer-to-struct-wl_interface-for-driver-to-use.patch
new file mode 100644
index 0000000000..d6701d1a25
--- /dev/null
+++ b/package/libva/0001-Add-pointer-to-struct-wl_interface-for-driver-to-use.patch
@@ -0,0 +1,73 @@
+From 62bad1239d8ea1bb269ca69d3469aa267f57cdec Mon Sep 17 00:00:00 2001
+From: Haihao Xiang <haihao.xiang@intel.com>
+Date: Fri, 7 Dec 2018 13:25:41 +0800
+Subject: [PATCH] Add pointer to struct wl_interface for driver to use
+
+See https://github.com/intel/intel-vaapi-driver/issues/419 for the
+information
+
+Note: don't export the interface symbol in case others may reuse it.
+
+Signed-off-by: Haihao Xiang <haihao.xiang@intel.com>
+[james.hilliard1 at gmail.com: backport from upstream commit
+62bad1239d8ea1bb269ca69d3469aa267f57cdec]
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ va/wayland/va_backend_wayland.h | 10 +++++++++-
+ va/wayland/va_wayland_drm.c     |  4 ++++
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/va/wayland/va_backend_wayland.h b/va/wayland/va_backend_wayland.h
+index 9e5740a..906d4bf 100644
+--- a/va/wayland/va_backend_wayland.h
++++ b/va/wayland/va_backend_wayland.h
+@@ -64,8 +64,16 @@ struct VADriverVTableWayland {
+     /** \brief Indicate whether buffer sharing with prime fd is supported. */
+     unsigned int has_prime_sharing;
+ 
++    /**
++     * Pointer to an implementation of struct wl_interface
++     *
++     * It is set by libva-wayland when a context is created, then the backend
++     * driver may reuse it.
++     */
++    const void *wl_interface;
++
+     /** \brief Reserved bytes for future use, must be zero */
+-    unsigned long reserved[8];
++    unsigned long reserved[7];
+ };
+ 
+ #endif /* VA_BACKEND_WAYLAND_H */
+diff --git a/va/wayland/va_wayland_drm.c b/va/wayland/va_wayland_drm.c
+index 8e22695..4cd3f6c 100644
+--- a/va/wayland/va_wayland_drm.c
++++ b/va/wayland/va_wayland_drm.c
+@@ -136,6 +136,7 @@ va_wayland_drm_destroy(VADisplayContextP pDisplayContext)
+     struct VADriverVTableWayland *vtable = ctx->vtable_wayland;
+ 
+     vtable->has_prime_sharing = 0;
++    vtable->wl_interface = NULL;
+ 
+     wl_drm_ctx->is_authenticated = 0;
+ 
+@@ -222,6 +223,8 @@ va_wayland_drm_create(VADisplayContextP pDisplayContext)
+     struct VADriverVTableWayland *vtable = ctx->vtable_wayland;
+     struct wl_display *wrapped_display = NULL;
+ 
++    vtable->wl_interface = NULL;
++
+     wl_drm_ctx = malloc(sizeof(*wl_drm_ctx));
+     if (!wl_drm_ctx) {
+         va_wayland_error("could not allocate wl_drm_ctx");
+@@ -300,6 +303,7 @@ va_wayland_drm_create(VADisplayContextP pDisplayContext)
+         goto end;
+     }
+ 
++    vtable->wl_interface = &wl_drm_interface;
+     result = true;
+ 
+ end:
+-- 
+2.7.4
+
