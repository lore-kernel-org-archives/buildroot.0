From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 17 May 2019 01:08:36 +0300
Subject: [Buildroot] [RFC PATCH/next 2/2] package/cage: new package
In-Reply-To: <20190516220836.24543-1-aperez@igalia.com>
References: <20190516220836.24543-1-aperez@igalia.com>
Message-ID: <20190516220836.24543-3-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cage is a "kiosk" Wayland compositor, which shows a single maximized
application at a time and limits user interaction to that application.

https://www.hjdskes.nl/projects/cage/

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/Config.in                             |   1 +
 .../cage/0001-Updates-for-wlroots-0.6.0.patch | 264 ++++++++++++++++++
 package/cage/Config.in                        |  24 ++
 package/cage/cage.hash                        |   5 +
 package/cage/cage.mk                          |  19 ++
 5 files changed, 313 insertions(+)
 create mode 100644 package/cage/0001-Updates-for-wlroots-0.6.0.patch
 create mode 100644 package/cage/Config.in
 create mode 100644 package/cage/cage.hash
 create mode 100644 package/cage/cage.mk

diff --git a/package/Config.in b/package/Config.in
index 5b1f279b8e..7cac6de79f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -328,6 +328,7 @@ comment "QT libraries and helper libraries"
 	source "package/quazip/Config.in"
 	source "package/qwt/Config.in"
 endif
+	source "package/cage/Config.in"
 	source "package/tekui/Config.in"
 	source "package/weston/Config.in"
 	source "package/x11r7/Config.in"
diff --git a/package/cage/0001-Updates-for-wlroots-0.6.0.patch b/package/cage/0001-Updates-for-wlroots-0.6.0.patch
new file mode 100644
index 0000000000..57e5a1289a
--- /dev/null
+++ b/package/cage/0001-Updates-for-wlroots-0.6.0.patch
@@ -0,0 +1,264 @@
+From 86b9d6719e52cbddda4fb6d055e60e9caf9a57ff Mon Sep 17 00:00:00 2001
+From: Jente Hidskes <hjdskes@gmail.com>
+Date: Fri, 3 May 2019 19:39:19 +0200
+Subject: [PATCH 1/3] CI: use wlroots 0.6.0
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+[Upstream status: https://github.com/Hjdskes/cage/pull/65]
+
+---
+ .builds/alpine.yml    | 4 ++--
+ .builds/archlinux.yml | 4 ++--
+ .builds/freebsd.yml   | 4 ++--
+ 3 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/.builds/alpine.yml b/.builds/alpine.yml
+index 909bd0e..2c6d089 100644
+--- a/.builds/alpine.yml
++++ b/.builds/alpine.yml
+@@ -17,8 +17,8 @@ tasks:
+   # version, instead of master, to avoid any breaking changes in wlroots.
+   - wlroots: |
+       cd wlroots
+-      # This corresponds to the tag of 0.5.0
+-      git checkout c9137cba691b57c3eaf3ff94f9bf8e623f66ccc5
++      # This corresponds to the tag of 0.6.0
++      git checkout c0305f4f864543f8c3fea6f302e91c9b1d3396f3
+       meson --prefix=/usr build -Drootston=false -Dexamples=false
+       ninja -C build
+       sudo ninja -C build install
+diff --git a/.builds/archlinux.yml b/.builds/archlinux.yml
+index b270c40..e052118 100644
+--- a/.builds/archlinux.yml
++++ b/.builds/archlinux.yml
+@@ -15,8 +15,8 @@ tasks:
+   # version, instead of master, to avoid any breaking changes in wlroots.
+   - wlroots: |
+       cd wlroots
+-      # This corresponds to the tag of 0.5.0
+-      git checkout c9137cba691b57c3eaf3ff94f9bf8e623f66ccc5
++      # This corresponds to the tag of 0.6.0
++      git checkout c0305f4f864543f8c3fea6f302e91c9b1d3396f3
+       meson --prefix=/usr build -Drootston=false -Dexamples=false
+       ninja -C build
+       sudo ninja -C build install
+diff --git a/.builds/freebsd.yml b/.builds/freebsd.yml
+index f1a4f52..274eaaa 100644
+--- a/.builds/freebsd.yml
++++ b/.builds/freebsd.yml
+@@ -18,8 +18,8 @@ tasks:
+   # version, instead of master, to avoid any breaking changes in wlroots.
+   - wlroots: |
+       cd wlroots
+-      # This corresponds to the tag of 0.5.0
+-      git checkout c9137cba691b57c3eaf3ff94f9bf8e623f66ccc5
++      # This corresponds to the tag of 0.6.0
++      git checkout c0305f4f864543f8c3fea6f302e91c9b1d3396f3
+       meson --prefix=/usr/local build -Drootston=false -Dexamples=false
+       ninja -C build
+       sudo ninja -C build install
+
+From 08ecd52a3313d00d06cc4e12d4d3243865af5dd0 Mon Sep 17 00:00:00 2001
+From: Drew DeVault <sir@cmpwn.com>
+Date: Thu, 25 Apr 2019 11:40:25 -0400
+Subject: [PATCH 2/3] Update to wlroots 0.6.0
+
+---
+ output.c    | 15 ++++++++-------
+ xdg_shell.c | 12 ++++++------
+ 2 files changed, 14 insertions(+), 13 deletions(-)
+
+diff --git a/output.c b/output.c
+index c682dcc..1849486 100644
+--- a/output.c
++++ b/output.c
+@@ -198,23 +198,23 @@ handle_output_damage_frame(struct wl_listener *listener, void *data)
+ 	struct timespec now;
+ 	clock_gettime(CLOCK_MONOTONIC, &now);
+ 
+-	bool needs_swap;
++	bool needs_frame;
+ 	pixman_region32_t damage;
+ 	pixman_region32_init(&damage);
+-	if (!wlr_output_damage_make_current(output->damage, &needs_swap, &damage)) {
++	if (!wlr_output_damage_attach_render(output->damage, &needs_frame, &damage)) {
+ 		wlr_log(WLR_ERROR, "Cannot make damage output current");
+ 		goto damage_finish;
+ 	}
+ 
+-	if (!needs_swap) {
+-		wlr_log(WLR_DEBUG, "Output doesn't need swap and isn't damaged");
++	if (!needs_frame) {
++		wlr_log(WLR_DEBUG, "Output doesn't need frame and isn't damaged");
+ 		goto damage_finish;
+ 	}
+ 
+ 	wlr_renderer_begin(renderer, output->wlr_output->width, output->wlr_output->height);
+ 
+ 	if (!pixman_region32_not_empty(&damage)) {
+-		wlr_log(WLR_DEBUG, "Output isn't damaged but needs a buffer swap");
++		wlr_log(WLR_DEBUG, "Output isn't damaged but needs a buffer frame");
+ 		goto renderer_end;
+ 	}
+ 
+@@ -267,8 +267,9 @@ handle_output_damage_frame(struct wl_listener *listener, void *data)
+ 	enum wl_output_transform transform = wlr_output_transform_invert(output->wlr_output->transform);
+ 	wlr_region_transform(&damage, &damage, transform, output_width, output_height);
+ 
+-	if (!wlr_output_damage_swap_buffers(output->damage, &now, &damage)) {
+-	        wlr_log(WLR_ERROR, "Could not swap buffers");
++	wlr_output_set_damage(output->wlr_output, &damage);
++	if (!wlr_output_commit(output->wlr_output)) {
++	        wlr_log(WLR_ERROR, "Could not commit output");
+ 	}
+ 
+  damage_finish:
+diff --git a/xdg_shell.c b/xdg_shell.c
+index 4fcb00e..f964f76 100644
+--- a/xdg_shell.c
++++ b/xdg_shell.c
+@@ -94,15 +94,15 @@ popup_unconstrain(struct cg_xdg_popup *popup)
+ {
+ 	struct cg_view *view = popup->view_child.view;
+ 	struct wlr_output *output = view->server->output->wlr_output;
++	struct wlr_output_layout *output_layout = view->server->output_layout;
+ 
+-	int width, height;
+-	wlr_output_effective_resolution(output, &width, &height);
++	struct wlr_box *output_box = wlr_output_layout_get_box(output_layout, output);
+ 
+ 	struct wlr_box output_toplevel_box = {
+-		.x = output->lx - view->x,
+-		.y = output->ly - view->y,
+-		.width = width,
+-		.height = height
++		.x = output_box->x - view->x,
++		.y = output_box->y - view->y,
++		.width = output_box->width,
++		.height = output_box->height
+ 	};
+ 
+ 	wlr_xdg_popup_unconstrain_from_box(popup->wlr_popup, &output_toplevel_box);
+
+From 711aebb4d20848d2d9052e0483cd301c7022b844 Mon Sep 17 00:00:00 2001
+From: Jente Hidskes <hjdskes@gmail.com>
+Date: Fri, 3 May 2019 20:53:19 +0200
+Subject: [PATCH 3/3] output: don't submit too much damage
+
+See https://github.com/swaywm/wlroots/issues/1666#issue-436967396 and
+the linked changes
+https://github.com/swaywm/wlroots/pull/1668/files#diff-95fe5e5b411cc64a5dc31e2b72669a0d
+---
+ output.c | 38 ++++++++++++++++++++++----------------
+ 1 file changed, 22 insertions(+), 16 deletions(-)
+
+diff --git a/output.c b/output.c
+index 1849486..bfb4822 100644
+--- a/output.c
++++ b/output.c
+@@ -152,7 +152,7 @@ render_surface(struct wlr_surface *surface, int sx, int sy, void *data)
+ 	pixman_region32_union_rect(&damage, &damage, box.x, box.y, box.width, box.height);
+ 	pixman_region32_intersect(&damage, &damage, rdata->damage);
+ 	if (!pixman_region32_not_empty(&damage)) {
+-		goto damage_finish;
++		goto buffer_damage_finish;
+ 	}
+ 
+ 	float matrix[9];
+@@ -166,7 +166,7 @@ render_surface(struct wlr_surface *surface, int sx, int sy, void *data)
+ 		wlr_render_texture_with_matrix(surface->renderer, texture, matrix, 1);
+ 	}
+ 
+- damage_finish:
++ buffer_damage_finish:
+ 	pixman_region32_fini(&damage);
+ }
+ 
+@@ -199,21 +199,21 @@ handle_output_damage_frame(struct wl_listener *listener, void *data)
+ 	clock_gettime(CLOCK_MONOTONIC, &now);
+ 
+ 	bool needs_frame;
+-	pixman_region32_t damage;
+-	pixman_region32_init(&damage);
+-	if (!wlr_output_damage_attach_render(output->damage, &needs_frame, &damage)) {
++	pixman_region32_t buffer_damage;
++	pixman_region32_init(&buffer_damage);
++	if (!wlr_output_damage_attach_render(output->damage, &needs_frame, &buffer_damage)) {
+ 		wlr_log(WLR_ERROR, "Cannot make damage output current");
+-		goto damage_finish;
++		goto buffer_damage_finish;
+ 	}
+ 
+ 	if (!needs_frame) {
+ 		wlr_log(WLR_DEBUG, "Output doesn't need frame and isn't damaged");
+-		goto damage_finish;
++		goto buffer_damage_finish;
+ 	}
+ 
+ 	wlr_renderer_begin(renderer, output->wlr_output->width, output->wlr_output->height);
+ 
+-	if (!pixman_region32_not_empty(&damage)) {
++	if (!pixman_region32_not_empty(&buffer_damage)) {
+ 		wlr_log(WLR_DEBUG, "Output isn't damaged but needs a buffer frame");
+ 		goto renderer_end;
+ 	}
+@@ -226,7 +226,7 @@ handle_output_damage_frame(struct wl_listener *listener, void *data)
+ 
+ 	float color[4] = {0.3, 0.3, 0.3, 1.0};
+ 	int nrects;
+-	pixman_box32_t *rects = pixman_region32_rectangles(&damage, &nrects);
++	pixman_box32_t *rects = pixman_region32_rectangles(&buffer_damage, &nrects);
+ 	for (int i = 0; i < nrects; i++) {
+ 		scissor_output(output->wlr_output, &rects[i]);
+ 		wlr_renderer_clear(renderer, color);
+@@ -236,7 +236,7 @@ handle_output_damage_frame(struct wl_listener *listener, void *data)
+ 		.output_layout = output->server->output_layout,
+ 		.output = output->wlr_output,
+ 		.when = &now,
+-		.damage = &damage,
++		.damage = &buffer_damage,
+ 	};
+ 
+ 	struct cg_view *view;
+@@ -251,29 +251,35 @@ handle_output_damage_frame(struct wl_listener *listener, void *data)
+  renderer_end:
+ 	/* Draw software cursor in case hardware cursors aren't
+ 	   available. This is a no-op when they are. */
+-	wlr_output_render_software_cursors(output->wlr_output, &damage);
++	wlr_output_render_software_cursors(output->wlr_output, &buffer_damage);
+ 	wlr_renderer_scissor(renderer, NULL);
+ 	wlr_renderer_end(renderer);
+ 
+ 	int output_width, output_height;
+ 	wlr_output_transformed_resolution(output->wlr_output, &output_width, &output_height);
+ 
++	pixman_region32_t output_damage;
++	pixman_region32_init(&output_damage);
++
+ #ifdef DEBUG
+ 	if (output->server->debug_damage_tracking) {
+-		pixman_region32_union_rect(&damage, &damage, 0, 0, output_width, output_height);
++		pixman_region32_union_rect(&output_damage, &output_damage, 0, 0, output_width, output_height);
+ 	}
+ #endif
+ 
+ 	enum wl_output_transform transform = wlr_output_transform_invert(output->wlr_output->transform);
+-	wlr_region_transform(&damage, &damage, transform, output_width, output_height);
++	wlr_region_transform(&output_damage, &output->damage->current, transform, output_width, output_height);
++
++	wlr_output_set_damage(output->wlr_output, &output_damage);
++	pixman_region32_fini(&output_damage);
+ 
+-	wlr_output_set_damage(output->wlr_output, &damage);
+ 	if (!wlr_output_commit(output->wlr_output)) {
+ 	        wlr_log(WLR_ERROR, "Could not commit output");
++		goto buffer_damage_finish;
+ 	}
+ 
+- damage_finish:
+-	pixman_region32_fini(&damage);
++ buffer_damage_finish:
++	pixman_region32_fini(&buffer_damage);
+ 
+ 	wl_list_for_each_reverse(view, &output->server->views, link) {
+ 		view_for_each_surface(view, send_frame_done, &now);
diff --git a/package/cage/Config.in b/package/cage/Config.in
new file mode 100644
index 0000000000..07dc4c9da3
--- /dev/null
+++ b/package/cage/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_CAGE
+	bool "cage"
+	depends on !BR2_STATIC_LIBS # wlroots
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wlroots
+	select BR2_PACKAGE_WLROOTS
+	help
+	  Kiosk compositor for Wayland, which displays a single
+	  maximized application at a time.
+
+	  https://www.hjdskes.nl/projects/cage/
+
+if BR2_PACKAGE_CAGE
+
+config BR2_PACKAGE_CAGE_XWAYLAND
+	bool "XWayland support"
+	depends on BR2_PACKAGE_XORG7 # wlroots
+	depends on BR2_PACKAGE_WLROOTS_XWAYLAND
+	help
+	  Enable support for running X11 applications through XWayland
+
+comment "XWayland supports needs X.org and support in wlroots enabled"
+	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_WLROOTS_XWAYLAND
+
+endif
diff --git a/package/cage/cage.hash b/package/cage/cage.hash
new file mode 100644
index 0000000000..5609b073d6
--- /dev/null
+++ b/package/cage/cage.hash
@@ -0,0 +1,5 @@
+# Generated locally
+sha256 03e2b4d97744aead935f4a289e5cfda4888dd06c6586982f4a25c8f435ef4166  v0.1.tar.gz
+
+# Hashes for license files:
+sha256 1fd28695090b961ed2846627365489228d84f784bff60a90e933febcedaeb65d  LICENSE
diff --git a/package/cage/cage.mk b/package/cage/cage.mk
new file mode 100644
index 0000000000..b24eb743ee
--- /dev/null
+++ b/package/cage/cage.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# cage
+#
+################################################################################
+
+CAGE_VERSION = 0.1
+CAGE_SITE = https://github.com/Hjdskes/cage/archive
+CAGE_SOURCE = v$(CAGE_VERSION).tar.gz
+CAGE_LICENSE = MIT
+CAGE_DEPENDENCIES = host-pkgconf wlroots
+
+ifeq ($(BR2_PACKAGE_CAGE_XWAYLAND),y)
+CAGE_CONF_OPTS = -Dxwayland=true
+else
+CAGE_CONF_OPTS = -Dxwayland=false
+endif
+
+$(eval $(meson-package))
-- 
2.21.0
