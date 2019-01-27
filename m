From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Jan 2019 10:42:57 +0100
Subject: [Buildroot] [git commit] package/libva: bump version to 2.4.0
Message-ID: <20190127095108.6136C83BE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0cb5237a89f554dd8fc7e30adaf07f18be6f2ceb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch applied upstream:
https://github.com/intel/libva/commit/62bad1239d8ea1bb269ca69d3469aa267f57cdec

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-to-struct-wl_interface-for-driver-to-use.patch | 73 ----------------------
 package/libva/libva.hash                           |  6 +-
 package/libva/libva.mk                             |  2 +-
 3 files changed, 4 insertions(+), 77 deletions(-)

diff --git a/package/libva/0001-Add-pointer-to-struct-wl_interface-for-driver-to-use.patch b/package/libva/0001-Add-pointer-to-struct-wl_interface-for-driver-to-use.patch
deleted file mode 100644
index d6701d1a25..0000000000
--- a/package/libva/0001-Add-pointer-to-struct-wl_interface-for-driver-to-use.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 62bad1239d8ea1bb269ca69d3469aa267f57cdec Mon Sep 17 00:00:00 2001
-From: Haihao Xiang <haihao.xiang@intel.com>
-Date: Fri, 7 Dec 2018 13:25:41 +0800
-Subject: [PATCH] Add pointer to struct wl_interface for driver to use
-
-See https://github.com/intel/intel-vaapi-driver/issues/419 for the
-information
-
-Note: don't export the interface symbol in case others may reuse it.
-
-Signed-off-by: Haihao Xiang <haihao.xiang@intel.com>
-[james.hilliard1 at gmail.com: backport from upstream commit
-62bad1239d8ea1bb269ca69d3469aa267f57cdec]
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
----
- va/wayland/va_backend_wayland.h | 10 +++++++++-
- va/wayland/va_wayland_drm.c     |  4 ++++
- 2 files changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/va/wayland/va_backend_wayland.h b/va/wayland/va_backend_wayland.h
-index 9e5740a..906d4bf 100644
---- a/va/wayland/va_backend_wayland.h
-+++ b/va/wayland/va_backend_wayland.h
-@@ -64,8 +64,16 @@ struct VADriverVTableWayland {
-     /** \brief Indicate whether buffer sharing with prime fd is supported. */
-     unsigned int has_prime_sharing;
- 
-+    /**
-+     * Pointer to an implementation of struct wl_interface
-+     *
-+     * It is set by libva-wayland when a context is created, then the backend
-+     * driver may reuse it.
-+     */
-+    const void *wl_interface;
-+
-     /** \brief Reserved bytes for future use, must be zero */
--    unsigned long reserved[8];
-+    unsigned long reserved[7];
- };
- 
- #endif /* VA_BACKEND_WAYLAND_H */
-diff --git a/va/wayland/va_wayland_drm.c b/va/wayland/va_wayland_drm.c
-index 8e22695..4cd3f6c 100644
---- a/va/wayland/va_wayland_drm.c
-+++ b/va/wayland/va_wayland_drm.c
-@@ -136,6 +136,7 @@ va_wayland_drm_destroy(VADisplayContextP pDisplayContext)
-     struct VADriverVTableWayland *vtable = ctx->vtable_wayland;
- 
-     vtable->has_prime_sharing = 0;
-+    vtable->wl_interface = NULL;
- 
-     wl_drm_ctx->is_authenticated = 0;
- 
-@@ -222,6 +223,8 @@ va_wayland_drm_create(VADisplayContextP pDisplayContext)
-     struct VADriverVTableWayland *vtable = ctx->vtable_wayland;
-     struct wl_display *wrapped_display = NULL;
- 
-+    vtable->wl_interface = NULL;
-+
-     wl_drm_ctx = malloc(sizeof(*wl_drm_ctx));
-     if (!wl_drm_ctx) {
-         va_wayland_error("could not allocate wl_drm_ctx");
-@@ -300,6 +303,7 @@ va_wayland_drm_create(VADisplayContextP pDisplayContext)
-         goto end;
-     }
- 
-+    vtable->wl_interface = &wl_drm_interface;
-     result = true;
- 
- end:
--- 
-2.7.4
-
diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 333bb1d786..06b7de5762 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,5 +1,5 @@
-# From https://github.com/intel/libva/releases
-sha1 e1138529355cce78fa2edc7c5b1c5aeb40dd0ce5  libva-2.3.0.tar.bz2
+# From https://github.com/intel/libva/releases/download/2.4.0/libva-2.4.0.tar.bz2.sha1sum
+sha1 2e7b69ebb615d039b9253d4708eeec889b812dbf  libva-2.4.0.tar.bz2
 # Locally computed
-sha256 60840e50da6932ee2111e15fc8911180ff8a0d6f18bb9cc6ba8c1030098fdce4  libva-2.3.0.tar.bz2
+sha256 99263056c21593a26f2ece812aee6fe60142b49e6cd46cb33c8dddf18fc19391  libva-2.4.0.tar.bz2
 sha256 c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index b897d35849..8a21c11b6c 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 2.3.0
+LIBVA_VERSION = 2.4.0
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = https://github.com/intel/libva/releases/download/$(LIBVA_VERSION)
 LIBVA_LICENSE = MIT
