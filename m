From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Sat, 12 Jan 2019 21:22:15 +0800
Subject: [Buildroot] [PATCH 1/3] package/libva: backport Add pointer to
 struct wl_interface for driver to use
Message-ID: <1547299337-2266-1-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

This is needed by libva-intel-driver when using wayland.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...-to-struct-wl_interface-for-driver-to-use.patch | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 package/libva/0001-Add-pointer-to-struct-wl_interface-for-driver-to-use.patch

diff --git a/package/libva/0001-Add-pointer-to-struct-wl_interface-for-driver-to-use.patch b/package/libva/0001-Add-pointer-to-struct-wl_interface-for-driver-to-use.patch
new file mode 100644
index 0000000..21f419b
--- /dev/null
+++ b/package/libva/0001-Add-pointer-to-struct-wl_interface-for-driver-to-use.patch
@@ -0,0 +1,73 @@
+From 62bad1239d8ea1bb269ca69d3469aa267f57cdec Mon Sep 17 00:00:00 2001
+From: Haihao Xiang <haihao.xiang@intel.com>
+Date: Fri, 7 Dec 2018 13:25:41 +0800
+Subject: [PATCH 1/1] Add pointer to struct wl_interface for driver to use
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
-- 
2.7.4
