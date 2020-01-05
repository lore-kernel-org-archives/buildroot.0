From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2020 21:58:57 +0100
Subject: [Buildroot] [git commit] package/libva-intel-driver: bump version
 to 2.4.0
Message-ID: <20200105205312.0E42E8ED77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55de2558babeb9527a4dffb9dbabf6f6da7c63ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0001-Check-the-interface-from-libva-first.patch | 71 ----------------------
 package/libva-intel-driver/libva-intel-driver.hash |  4 +-
 package/libva-intel-driver/libva-intel-driver.mk   |  2 +-
 3 files changed, 3 insertions(+), 74 deletions(-)

diff --git a/package/libva-intel-driver/0001-Check-the-interface-from-libva-first.patch b/package/libva-intel-driver/0001-Check-the-interface-from-libva-first.patch
deleted file mode 100644
index 81591fbbd4..0000000000
--- a/package/libva-intel-driver/0001-Check-the-interface-from-libva-first.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 3db0c4838fe30fcee5beb8b31ca67d5cf7d77fb3 Mon Sep 17 00:00:00 2001
-From: Haihao Xiang <haihao.xiang@intel.com>
-Date: Fri, 7 Dec 2018 13:31:43 +0800
-Subject: [PATCH 1/1] Check the interface from libva first
-
-This fixes https://github.com/intel/intel-vaapi-driver/issues/419
-
-Signed-off-by: Haihao Xiang <haihao.xiang@intel.com>
-[james.hilliard1 at gmail.com: backport from upstream commit
-f139dafa59172d40543f2ec469a035d3de9fdc6a]
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
----
- src/i965_output_wayland.c | 27 ++++++++++++++++-----------
- 1 file changed, 16 insertions(+), 11 deletions(-)
-
-diff --git a/src/i965_output_wayland.c b/src/i965_output_wayland.c
-index 122db95..a637552 100644
---- a/src/i965_output_wayland.c
-+++ b/src/i965_output_wayland.c
-@@ -397,6 +397,7 @@ i965_output_wayland_init(VADriverContextP ctx)
-     struct i965_driver_data * const i965 = i965_driver_data(ctx);
-     struct dso_handle *dso_handle;
-     struct wl_vtable *wl_vtable;
-+    struct VADriverVTableWayland * const vtable = ctx->vtable_wayland;
- 
-     static const struct dso_symbol libegl_symbols[] = {
-         {
-@@ -465,25 +466,29 @@ i965_output_wayland_init(VADriverContextP ctx)
-     if (!i965->wl_output)
-         goto error;
- 
--    i965->wl_output->libegl_handle = dso_open(LIBEGL_NAME);
--    if (!i965->wl_output->libegl_handle) {
--        i965->wl_output->libegl_handle = dso_open(LIBEGL_NAME_FALLBACK);
--        if (!i965->wl_output->libegl_handle)
-+    wl_vtable = &i965->wl_output->vtable;
-+
-+    if (vtable->wl_interface)
-+        wl_vtable->drm_interface = vtable->wl_interface;
-+    else {
-+        i965->wl_output->libegl_handle = dso_open(LIBEGL_NAME);
-+        if (!i965->wl_output->libegl_handle) {
-+            i965->wl_output->libegl_handle = dso_open(LIBEGL_NAME_FALLBACK);
-+            if (!i965->wl_output->libegl_handle)
-+                goto error;
-+        }
-+
-+        dso_handle = i965->wl_output->libegl_handle;
-+        if (!dso_get_symbols(dso_handle, wl_vtable, sizeof(*wl_vtable),
-+                             libegl_symbols))
-             goto error;
-     }
- 
--    dso_handle = i965->wl_output->libegl_handle;
--    wl_vtable  = &i965->wl_output->vtable;
--    if (!dso_get_symbols(dso_handle, wl_vtable, sizeof(*wl_vtable),
--                         libegl_symbols))
--        goto error;
--
-     i965->wl_output->libwl_client_handle = dso_open(LIBWAYLAND_CLIENT_NAME);
-     if (!i965->wl_output->libwl_client_handle)
-         goto error;
- 
-     dso_handle = i965->wl_output->libwl_client_handle;
--    wl_vtable  = &i965->wl_output->vtable;
-     if (!dso_get_symbols(dso_handle, wl_vtable, sizeof(*wl_vtable),
-                          libwl_client_symbols))
-         goto error;
--- 
-2.7.4
-
diff --git a/package/libva-intel-driver/libva-intel-driver.hash b/package/libva-intel-driver/libva-intel-driver.hash
index 8c01271aeb..555aa9473b 100644
--- a/package/libva-intel-driver/libva-intel-driver.hash
+++ b/package/libva-intel-driver/libva-intel-driver.hash
@@ -1,5 +1,5 @@
 # From https://github.com/intel/intel-vaapi-driver/releases
-sha1 89096f99da753ac5858304e6c17f5dd9e7581d5b  intel-vaapi-driver-2.3.0.tar.bz2
+sha1 5f805f6a040f5beab6693d11765618cc92d2076b  intel-vaapi-driver-2.4.0.tar.bz2
 # Locally computed
-sha256 5c2e5deab024a0a6ae81dfe77ef455542a88d824eda7bfd07684337407ecdfe3  intel-vaapi-driver-2.3.0.tar.bz2
+sha256 71e2ddd985af6b221389db1018c4e8ca27a7f939fb51dcdf49d0efcb5ff3d089  intel-vaapi-driver-2.4.0.tar.bz2
 sha256 c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
index 76cdfee382..1cf113c406 100644
--- a/package/libva-intel-driver/libva-intel-driver.mk
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_INTEL_DRIVER_VERSION = 2.3.0
+LIBVA_INTEL_DRIVER_VERSION = 2.4.0
 LIBVA_INTEL_DRIVER_SOURCE = intel-vaapi-driver-$(LIBVA_INTEL_DRIVER_VERSION).tar.bz2
 LIBVA_INTEL_DRIVER_SITE = \
 	https://github.com/intel/intel-vaapi-driver/releases/download/$(LIBVA_INTEL_DRIVER_VERSION)
