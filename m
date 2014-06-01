From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Jun 2014 23:03:43 +0200
Subject: [Buildroot] [PATCH 19/26] package/weston: bump version
In-Reply-To: <cover.1401656581.git.yann.morin.1998@free.fr>
References: <cover.1401656581.git.yann.morin.1998@free.fr>
Message-ID: <f2d013adbaf56b6840f357648b57854014beeefb.1401656581.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Bump to the recently -released 1.5.0.

Remove existing patches, they are no longer needed:
  - weston-0000-compositor-rpi-fix-input-initialization.patch was a
    back-port of anupstream fix, so no longer needed,
  - weston-0003-dont-build-tests.patch no longer applies due to a
    complete rewrite of Makefile.am, but it seems tests now build fine
    even without EGL support: there is code in the Makefile.am to
    explicitly handle that case

Add a new patch from upstream to avoid a use-after-free situation.

So, it's no longer needed to autoreconf.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 ...0-compositor-rpi-fix-input-initialization.patch | 57 ----------------------
 package/weston/weston-0000-safe-foreach.patch      | 36 ++++++++++++++
 package/weston/weston-0003-dont-build-tests.patch  | 17 -------
 package/weston/weston.mk                           |  5 +-
 4 files changed, 37 insertions(+), 78 deletions(-)
 delete mode 100644 package/weston/weston-0000-compositor-rpi-fix-input-initialization.patch
 create mode 100644 package/weston/weston-0000-safe-foreach.patch
 delete mode 100644 package/weston/weston-0003-dont-build-tests.patch

diff --git a/package/weston/weston-0000-compositor-rpi-fix-input-initialization.patch b/package/weston/weston-0000-compositor-rpi-fix-input-initialization.patch
deleted file mode 100644
index 8722d07..0000000
--- a/package/weston/weston-0000-compositor-rpi-fix-input-initialization.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-commit bf539e39c15e9a4ef4479d03c52263a3f020ef4a
-Author: Emilio Pozuelo Monfort <emilio.pozuelo@collabora.co.uk>
-Date:   Mon Feb 3 16:57:27 2014 +0100
-
-    compositor-rpi: Fix input initialization
-    
-    The input initialization code assumes the outputs have already
-    been initialized; thus create the outputs first. This fixes a
-    segfault upon startup. It is also what the drm and fbdev backends
-    do.
-
-diff --git a/src/compositor-rpi.c b/src/compositor-rpi.c
-index 399090d..e7c0e0d 100644
---- a/src/compositor-rpi.c
-+++ b/src/compositor-rpi.c
-@@ -527,13 +527,6 @@ rpi_compositor_create(struct wl_display *display, int *argc, char *argv[],
- 	weston_log("Dispmanx planes are %s buffered.\n",
- 		   compositor->single_buffer ? "single" : "double");
- 
--	if (udev_input_init(&compositor->input,
--			    &compositor->base,
--			    compositor->udev, "seat0") != 0) {
--		weston_log("Failed to initialize udev input.\n");
--		goto out_launcher;
--	}
--
- 	for (key = KEY_F1; key < KEY_F9; key++)
- 		weston_compositor_add_key_binding(&compositor->base, key,
- 						  MODIFIER_CTRL | MODIFIER_ALT,
-@@ -549,19 +542,23 @@ rpi_compositor_create(struct wl_display *display, int *argc, char *argv[],
- 	bcm_host_init();
- 
- 	if (rpi_renderer_create(&compositor->base, &param->renderer) < 0)
--		goto out_udev_input;
-+		goto out_launcher;
- 
- 	if (rpi_output_create(compositor, param->output_transform) < 0)
- 		goto out_renderer;
- 
-+	if (udev_input_init(&compositor->input,
-+			    &compositor->base,
-+			    compositor->udev, "seat0") != 0) {
-+		weston_log("Failed to initialize udev input.\n");
-+		goto out_renderer;
-+	}
-+
- 	return &compositor->base;
- 
- out_renderer:
- 	compositor->base.renderer->destroy(&compositor->base);
- 
--out_udev_input:
--	udev_input_destroy(&compositor->input);
--
- out_launcher:
- 	weston_launcher_destroy(compositor->base.launcher);
- 
diff --git a/package/weston/weston-0000-safe-foreach.patch b/package/weston/weston-0000-safe-foreach.patch
new file mode 100644
index 0000000..7ea7197
--- /dev/null
+++ b/package/weston/weston-0000-safe-foreach.patch
@@ -0,0 +1,36 @@
+commit a35d028d66cdd83a4a08663231dd2504f1b228f9
+Author: U. Artie Eoff <ullysses.a.eoff@intel.com>
+Date:   Wed May 21 09:20:02 2014 -0700
+
+    comp-wayland: use safe foreach when destroying outputs
+    
+    wl_list_for_each dereference's output to increment the
+    next iteration of the loop.  However, output is free'd
+    inside the loop resulting in a dereference to free'd
+    memory.
+    
+    Use wl_list_for_each_safe instead, which is designed to
+    handle this kind of pattern.
+    
+    Signed-off-by: U. Artie Eoff <ullysses.a.eoff@intel.com>
+    Reviewed-by: Thierry Reding <thierry.reding@gmail.com>
+    Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff --git a/src/compositor-wayland.c b/src/compositor-wayland.c
+index a08b71a..76e5396 100644
+--- a/src/compositor-wayland.c
++++ b/src/compositor-wayland.c
+@@ -1997,9 +1997,9 @@ err_free:
+ static void
+ wayland_compositor_destroy(struct wayland_compositor *c)
+ {
+-	struct weston_output *output;
++	struct weston_output *output, *next;
+ 
+-	wl_list_for_each(output, &c->base.output_list, link)
++	wl_list_for_each_safe(output, next, &c->base.output_list, link)
+ 		wayland_output_destroy(output);
+ 
+ 	c->base.renderer->destroy(&c->base);
diff --git a/package/weston/weston-0003-dont-build-tests.patch b/package/weston/weston-0003-dont-build-tests.patch
deleted file mode 100644
index daf8452..0000000
--- a/package/weston/weston-0003-dont-build-tests.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Makefile: do not build tests
-
-Tests are broken if no EGL support is available.
-
-Reported-by: Peter Korsgaard <jacmet@uclibc.org>
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-diff -durN weston-1.3.0.orig/Makefile.am weston-1.3.0/Makefile.am
---- weston-1.3.0.orig/Makefile.am	2013-08-20 20:15:19.000000000 +0200
-+++ weston-1.3.0/Makefile.am	2013-10-14 23:08:12.016392097 +0200
-@@ -14,7 +14,6 @@
- 	clients					\
- 	data					\
- 	protocol				\
--	tests					\
- 	$(wcap_subdir)				\
- 	man
- 
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index b6b8556..8188ae6 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 1.4.0
+WESTON_VERSION = 1.5.0
 WESTON_SITE = http://wayland.freedesktop.org/releases/
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
@@ -13,9 +13,6 @@ WESTON_LICENSE_FILES = COPYING
 WESTON_DEPENDENCIES = host-pkgconf wayland libxkbcommon pixman libpng \
 	jpeg mtdev udev cairo
 
-# We're touching Makefile.am
-WESTON_AUTORECONF = YES
-
 WESTON_CONF_OPT = \
 	--with-dtddir=$(STAGING_DIR)/usr/share/wayland \
 	--disable-egl \
-- 
1.8.3.2
