Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4954BC433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 21:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E576F40B1A;
	Fri, 22 Apr 2022 21:50:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rVRopvK54MnK; Fri, 22 Apr 2022 21:50:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6991F40B0B;
	Fri, 22 Apr 2022 21:50:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A50AA1BF336
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 21:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92B608407B
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 21:49:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mfqo_jzGC9NT for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 21:49:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D4FA84006
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 21:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K9HbXr9u+tw8a0r9J/JioQVCNPRKKG/HjtC8pCUFOog=; b=groBzJNHy1JhPhUFaqjRMJRI5o
 onerunUrZTuqpnR8w2iIgO83vzbT5oadrdMprl6slxOJ5yBNaajMyJ/9ExEN47ZH85ENJALZnl4dK
 ybgQNjNujEroPMmpRLKZfkpyHuWuN2Od/g0alGlf2+W8Gipdqw2Gc3LzOMFgKYqBxzLa4+8Cs0j8l
 nMU/1eBdY8xIRHNs9YvbZ3AoZGPSgTI58j38lxdg0Rq0NXSPjiyYsFL9NAAaCXMRIBqirKFWagjn+
 pOX7X4ITlN3GT6pyftlYRJJuQ/rZ4iGk87nuHJx95THTOaNy6jZ+oYk/Ve3ZAElc7+Iy3TUuXfsCS
 x/xHMvLA==;
Received: from 91-153-34-227.elisa-laajakaista.fi ([91.153.34.227] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1ni19m-0003SO-7f; Fri, 22 Apr 2022 23:49:38 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id b3d96bc8;
 Fri, 22 Apr 2022 21:49:20 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 00:49:18 +0300
Message-Id: <20220422214919.367067-3-aperez@igalia.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220422214919.367067-1-aperez@igalia.com>
References: <20220422214919.367067-1-aperez@igalia.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/cage: add upstream patch for
 wlroots 0.15.x
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a backported patch from the upstream repository which makes cage
usable with wlroots 0.15.x.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 .../cage/0001-Upgrade-to-wlroots-0.15.patch   | 312 ++++++++++++++++++
 1 file changed, 312 insertions(+)
 create mode 100644 package/cage/0001-Upgrade-to-wlroots-0.15.patch

diff --git a/package/cage/0001-Upgrade-to-wlroots-0.15.patch b/package/cage/0001-Upgrade-to-wlroots-0.15.patch
new file mode 100644
index 0000000000..a5716ede43
--- /dev/null
+++ b/package/cage/0001-Upgrade-to-wlroots-0.15.patch
@@ -0,0 +1,312 @@
+From e51bef3fdad649d453276717294cc6177666cf5a Mon Sep 17 00:00:00 2001
+From: Simon Ser <contact@emersion.fr>
+Date: Wed, 11 Aug 2021 11:31:14 +0200
+Subject: [PATCH] Upgrade to wlroots 0.15
+
+- Update wlr_box includes to util/box.h: the wlroots header has
+  been moved upstream.
+- Subsurface fields have been moved
+- Create renderer and allocator, stop using wlr_backend_get_renderer
+- Initalize output rendering
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+Upstream status: https://github.com/Hjdskes/cage/commit/395189fb051ed722c7b10b6cb11caa8f6904079c
+---
+ cage.c      | 21 +++++++++++++++++----
+ meson.build |  2 +-
+ output.c    |  5 +++++
+ render.c    | 26 ++++++++------------------
+ server.h    |  2 ++
+ util.c      |  2 --
+ util.h      |  2 +-
+ view.c      |  5 ++---
+ view.h      |  2 +-
+ xdg_shell.c |  1 -
+ xwayland.c  |  1 -
+ 11 files changed, 37 insertions(+), 32 deletions(-)
+
+diff --git a/cage.c b/cage.c
+index 5392535..f9db7a9 100644
+--- a/cage.c
++++ b/cage.c
+@@ -19,6 +19,7 @@
+ #include <unistd.h>
+ #include <wayland-server-core.h>
+ #include <wlr/backend.h>
++#include <wlr/render/allocator.h>
+ #include <wlr/render/wlr_renderer.h>
+ #include <wlr/types/wlr_compositor.h>
+ #include <wlr/types/wlr_data_device.h>
+@@ -261,7 +262,6 @@ main(int argc, char *argv[])
+ 	struct wl_event_source *sigint_source = NULL;
+ 	struct wl_event_source *sigterm_source = NULL;
+ 	struct wl_event_source *sigchld_source = NULL;
+-	struct wlr_renderer *renderer = NULL;
+ 	struct wlr_compositor *compositor = NULL;
+ 	struct wlr_data_device_manager *data_device_manager = NULL;
+ 	struct wlr_server_decoration_manager *server_decoration_manager = NULL;
+@@ -316,8 +316,21 @@ main(int argc, char *argv[])
+ 		goto end;
+ 	}
+ 
+-	renderer = wlr_backend_get_renderer(server.backend);
+-	wlr_renderer_init_wl_display(renderer, server.wl_display);
++	server.renderer = wlr_renderer_autocreate(server.backend);
++	if (!server.renderer) {
++		wlr_log(WLR_ERROR, "Unable to create the wlroots renderer");
++		ret = 1;
++		goto end;
++	}
++
++	server.allocator = wlr_allocator_autocreate(server.backend, server.renderer);
++	if (!server.allocator) {
++		wlr_log(WLR_ERROR, "Unable to create the wlroots allocator");
++		ret = 1;
++		goto end;
++	}
++
++	wlr_renderer_init_wl_display(server.renderer, server.wl_display);
+ 
+ 	wl_list_init(&server.views);
+ 	wl_list_init(&server.outputs);
+@@ -329,7 +342,7 @@ main(int argc, char *argv[])
+ 		goto end;
+ 	}
+ 
+-	compositor = wlr_compositor_create(server.wl_display, renderer);
++	compositor = wlr_compositor_create(server.wl_display, server.renderer);
+ 	if (!compositor) {
+ 		wlr_log(WLR_ERROR, "Unable to create the wlroots compositor");
+ 		ret = 1;
+diff --git a/meson.build b/meson.build
+index 3a84794..f2e5428 100644
+--- a/meson.build
++++ b/meson.build
+@@ -34,7 +34,7 @@ if is_freebsd
+   )
+ endif
+ 
+-wlroots        = dependency('wlroots', version: '>= 0.14.0')
++wlroots        = dependency('wlroots', version: '>= 0.15.0')
+ wayland_protos = dependency('wayland-protocols', version: '>=1.14')
+ wayland_server = dependency('wayland-server')
+ pixman         = dependency('pixman-1')
+diff --git a/output.c b/output.c
+index d8da3b9..e8b3a22 100644
+--- a/output.c
++++ b/output.c
+@@ -442,6 +442,11 @@ handle_new_output(struct wl_listener *listener, void *data)
+ 	struct cg_server *server = wl_container_of(listener, server, new_output);
+ 	struct wlr_output *wlr_output = data;
+ 
++	if (!wlr_output_init_render(wlr_output, server->allocator, server->renderer)) {
++		wlr_log(WLR_ERROR, "Failed to initialize output rendering");
++		return;
++	}
++
+ 	struct cg_output *output = calloc(1, sizeof(struct cg_output));
+ 	if (!output) {
+ 		wlr_log(WLR_ERROR, "Failed to allocate output");
+diff --git a/render.c b/render.c
+index 166a088..ffa960f 100644
+--- a/render.c
++++ b/render.c
+@@ -10,11 +10,11 @@
+ #include <wayland-server-core.h>
+ #include <wlr/backend.h>
+ #include <wlr/render/wlr_renderer.h>
+-#include <wlr/types/wlr_box.h>
+ #include <wlr/types/wlr_matrix.h>
+ #include <wlr/types/wlr_output.h>
+ #include <wlr/types/wlr_output_layout.h>
+ #include <wlr/types/wlr_surface.h>
++#include <wlr/util/box.h>
+ #include <wlr/util/log.h>
+ #include <wlr/util/region.h>
+ 
+@@ -27,8 +27,6 @@
+ static void
+ scissor_output(struct wlr_output *output, pixman_box32_t *rect)
+ {
+-	struct wlr_renderer *renderer = wlr_backend_get_renderer(output->backend);
+-
+ 	struct wlr_box box = {
+ 		.x = rect->x1,
+ 		.y = rect->y1,
+@@ -41,7 +39,7 @@ scissor_output(struct wlr_output *output, pixman_box32_t *rect)
+ 	enum wl_output_transform transform = wlr_output_transform_invert(output->transform);
+ 	wlr_box_transform(&box, &box, transform, output_width, output_height);
+ 
+-	wlr_renderer_scissor(renderer, &box);
++	wlr_renderer_scissor(output->renderer, &box);
+ }
+ 
+ struct render_data {
+@@ -52,8 +50,6 @@ static void
+ render_texture(struct wlr_output *wlr_output, pixman_region32_t *output_damage, struct wlr_texture *texture,
+ 	       const struct wlr_box *box, const float matrix[static 9])
+ {
+-	struct wlr_renderer *renderer = wlr_backend_get_renderer(wlr_output->backend);
+-
+ 	pixman_region32_t damage;
+ 	pixman_region32_init(&damage);
+ 	pixman_region32_union_rect(&damage, &damage, box->x, box->y, box->width, box->height);
+@@ -66,7 +62,7 @@ render_texture(struct wlr_output *wlr_output, pixman_region32_t *output_damage,
+ 	pixman_box32_t *rects = pixman_region32_rectangles(&damage, &nrects);
+ 	for (int i = 0; i < nrects; i++) {
+ 		scissor_output(wlr_output, &rects[i]);
+-		wlr_render_texture_with_matrix(renderer, texture, matrix, 1.0f);
++		wlr_render_texture_with_matrix(wlr_output->renderer, texture, matrix, 1.0f);
+ 	}
+ 
+ damage_finish:
+@@ -134,13 +130,7 @@ output_render(struct cg_output *output, pixman_region32_t *damage)
+ 	struct cg_server *server = output->server;
+ 	struct wlr_output *wlr_output = output->wlr_output;
+ 
+-	struct wlr_renderer *renderer = wlr_backend_get_renderer(wlr_output->backend);
+-	if (!renderer) {
+-		wlr_log(WLR_DEBUG, "Expected the output backend to have a renderer");
+-		return;
+-	}
+-
+-	wlr_renderer_begin(renderer, wlr_output->width, wlr_output->height);
++	wlr_renderer_begin(server->renderer, wlr_output->width, wlr_output->height);
+ 
+ 	if (!pixman_region32_not_empty(damage)) {
+ 		wlr_log(WLR_DEBUG, "Output isn't damaged but needs a buffer swap");
+@@ -149,7 +139,7 @@ output_render(struct cg_output *output, pixman_region32_t *damage)
+ 
+ #ifdef DEBUG
+ 	if (server->debug_damage_tracking) {
+-		wlr_renderer_clear(renderer, (float[]){1.0f, 0.0f, 0.0f, 1.0f});
++		wlr_renderer_clear(server->renderer, (float[]){1.0f, 0.0f, 0.0f, 1.0f});
+ 	}
+ #endif
+ 
+@@ -158,7 +148,7 @@ output_render(struct cg_output *output, pixman_region32_t *damage)
+ 	pixman_box32_t *rects = pixman_region32_rectangles(damage, &nrects);
+ 	for (int i = 0; i < nrects; i++) {
+ 		scissor_output(wlr_output, &rects[i]);
+-		wlr_renderer_clear(renderer, color);
++		wlr_renderer_clear(server->renderer, color);
+ 	}
+ 
+ 	// TODO: render only top view, possibly use focused view for this, see #35.
+@@ -178,8 +168,8 @@ renderer_end:
+ 	/* Draw software cursor in case hardware cursors aren't
+ 	   available. This is a no-op when they are. */
+ 	wlr_output_render_software_cursors(wlr_output, damage);
+-	wlr_renderer_scissor(renderer, NULL);
+-	wlr_renderer_end(renderer);
++	wlr_renderer_scissor(server->renderer, NULL);
++	wlr_renderer_end(server->renderer);
+ 
+ 	int output_width, output_height;
+ 	wlr_output_transformed_resolution(wlr_output, &output_width, &output_height);
+diff --git a/server.h b/server.h
+index 817637b..74970c5 100644
+--- a/server.h
++++ b/server.h
+@@ -25,6 +25,8 @@ struct cg_server {
+ 	struct wl_display *wl_display;
+ 	struct wl_list views;
+ 	struct wlr_backend *backend;
++	struct wlr_renderer *renderer;
++	struct wlr_allocator *allocator;
+ 
+ 	struct cg_seat *seat;
+ 	struct wlr_idle *idle;
+diff --git a/util.c b/util.c
+index 95de499..714c7e3 100644
+--- a/util.c
++++ b/util.c
+@@ -6,8 +6,6 @@
+  * See the LICENSE file accompanying this file.
+  */
+ 
+-#include <wlr/types/wlr_box.h>
+-
+ #include "util.h"
+ 
+ int
+diff --git a/util.h b/util.h
+index db6bc7d..b6281f3 100644
+--- a/util.h
++++ b/util.h
+@@ -1,7 +1,7 @@
+ #ifndef CG_UTIL_H
+ #define CG_UTIL_H
+ 
+-#include <wlr/types/wlr_box.h>
++#include <wlr/util/box.h>
+ 
+ /** Apply scale to a width or height. */
+ int scale_length(int length, int offset, float scale);
+diff --git a/view.c b/view.c
+index 3f3b0ed..33b59b4 100644
+--- a/view.c
++++ b/view.c
+@@ -12,7 +12,6 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <wayland-server-core.h>
+-#include <wlr/types/wlr_box.h>
+ #include <wlr/types/wlr_output.h>
+ #include <wlr/types/wlr_surface.h>
+ 
+@@ -235,10 +234,10 @@ view_map(struct cg_view *view, struct wlr_surface *surface)
+ 	view->wlr_surface = surface;
+ 
+ 	struct wlr_subsurface *subsurface;
+-	wl_list_for_each (subsurface, &view->wlr_surface->subsurfaces_below, parent_link) {
++	wl_list_for_each (subsurface, &view->wlr_surface->current.subsurfaces_below, current.link) {
+ 		subsurface_create(view, subsurface);
+ 	}
+-	wl_list_for_each (subsurface, &view->wlr_surface->subsurfaces_above, parent_link) {
++	wl_list_for_each (subsurface, &view->wlr_surface->current.subsurfaces_above, current.link) {
+ 		subsurface_create(view, subsurface);
+ 	}
+ 
+diff --git a/view.h b/view.h
+index cd16e42..87477d0 100644
+--- a/view.h
++++ b/view.h
+@@ -5,9 +5,9 @@
+ 
+ #include <stdbool.h>
+ #include <wayland-server-core.h>
+-#include <wlr/types/wlr_box.h>
+ #include <wlr/types/wlr_surface.h>
+ #include <wlr/types/wlr_xdg_shell.h>
++#include <wlr/util/box.h>
+ #if CAGE_HAS_XWAYLAND
+ #include <wlr/xwayland.h>
+ #endif
+diff --git a/xdg_shell.c b/xdg_shell.c
+index 2e42347..d676552 100644
+--- a/xdg_shell.c
++++ b/xdg_shell.c
+@@ -9,7 +9,6 @@
+ #include <stdbool.h>
+ #include <stdlib.h>
+ #include <wayland-server-core.h>
+-#include <wlr/types/wlr_box.h>
+ #include <wlr/types/wlr_xdg_shell.h>
+ #include <wlr/util/log.h>
+ 
+diff --git a/xwayland.c b/xwayland.c
+index 2aae0f9..ebd8e54 100644
+--- a/xwayland.c
++++ b/xwayland.c
+@@ -9,7 +9,6 @@
+ #include <stdbool.h>
+ #include <stdlib.h>
+ #include <wayland-server-core.h>
+-#include <wlr/types/wlr_box.h>
+ #include <wlr/util/log.h>
+ #include <wlr/xwayland.h>
+ 
+-- 
+2.36.0
+
-- 
2.36.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
