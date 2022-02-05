Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E292EC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 23:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E326400C7;
	Sat,  5 Feb 2022 23:03:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lEmat1P1uulz; Sat,  5 Feb 2022 23:03:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 392794010E;
	Sat,  5 Feb 2022 23:03:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B1C11BF2A5
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 23:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56DEE81CA3
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 23:03:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZOy6_VghMMc9 for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 23:03:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59EAC81B6D
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 23:03:06 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id m185so3888467iof.10
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 15:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qGgwgFQYdKB3H6J30wFWdRd8t+/lWskxvIzR4SbeCxI=;
 b=BYGsu1FrK+YN7M68QRwH8+MvXFIlcmqHPYGROpnE66ris8wveqFJEeKvD5Bx1y4oHm
 qg7TkujpOocbrUT+JLAHtoSrdclzyGbNyBT38+dOxCeoJSfpximFq84+NY7I+howWWm4
 0B74AYo/C03H8FFa3fLRbReV3drls27Ds1HHposvLbsg87dN1j799WgiymOhjdre1oY9
 ExqfmA878R2ggmzY6IUlEuNX/dhtnHk855qwxLE8zGXNSbzFGf+CN0gMwSKKl+cW23sf
 BgNrivUrl3qigml3GRS+LYozlu+HvqjgmcSX00jbm4lw3sHuGCc5/6mD4WoE12rFd/Xk
 lH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qGgwgFQYdKB3H6J30wFWdRd8t+/lWskxvIzR4SbeCxI=;
 b=FSLDDJnOayrClMuYBlacxiAnxT+rZpdEoYyf9hzzTgApGq0C1m+RZVINao+tasETP3
 Rt8zMWyk4Nw3UWtEGPf5cqesEAXZX05VnfdWnyJN+AF3nPH7OmouzI6NzALs3CyHQbeW
 nnKLX7JW5ZOsoL+Lve1N88whakLzn3lZlkUo/wywCOGmI9IGSNR3Ypq50zaCwB2CNTul
 hZOirkkqEz3GbCuALaJfw+XSXZ2mblVTmcdBzoDgrU7F4WsKBmBlT/ea6NyPjBqXw22L
 dS7CcOpy8rJQsDM1c3TAOvFoFQmXLLke5ZRewXnUxSJLQU/dlp7M6osbHmszZ71nHUGR
 kY9A==
X-Gm-Message-State: AOAM532q/BaDnUX3EPGThO2H5DiBBDJqACORSmPqQcjRKFLU/+a14smL
 DWp+HnomTw7zGe5BVhViibW+nDDR3CU=
X-Google-Smtp-Source: ABdhPJxL+EwCF3VvNDkB8RL/9CRa/M5spt9Wj9PVdMwCuZ04yuxLfo0lXcKxIwCXKyDYC5bDHn1oWA==
X-Received: by 2002:a05:6602:1350:: with SMTP id
 i16mr2581606iov.153.1644102184960; 
 Sat, 05 Feb 2022 15:03:04 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id n23sm3062348ioo.55.2022.02.05.15.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 15:03:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Feb 2022 16:03:02 -0700
Message-Id: <20220205230302.3837382-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220205230302.3837382-1-james.hilliard1@gmail.com>
References: <20220205230302.3837382-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/weston: bump to version 10.0.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patches that are now upstream.

Jpeg dependency is now optional.

Add new backend compositor options.

Add comment indicating fbdev is deprecated(not yet removed).

Enable tools to match existing default(all enabled).

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...ntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch |  48 ---
 ...libweston-backend-drm-might-need-EGL.patch |  47 ---
 ...003-pipewire-add-support-for-0.3-API.patch | 391 ------------------
 ...4-pipewire-fix-null-deref-in-0-3-API.patch |  28 --
 package/weston/Config.in                      |  34 +-
 package/weston/weston.hash                    |  10 +-
 package/weston/weston.mk                      |  35 +-
 7 files changed, 58 insertions(+), 535 deletions(-)
 delete mode 100644 package/weston/0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch
 delete mode 100644 package/weston/0002-libweston-backend-drm-might-need-EGL.patch
 delete mode 100644 package/weston/0003-pipewire-add-support-for-0.3-API.patch
 delete mode 100644 package/weston/0004-pipewire-fix-null-deref-in-0-3-API.patch

diff --git a/package/weston/0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch b/package/weston/0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch
deleted file mode 100644
index 2eb6bd838c..0000000000
--- a/package/weston/0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From b10c0e843dcb8148bbe869bb15261955b94ac98c Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Tue, 8 Sep 2020 19:37:42 -0400
-Subject: [PATCH] tests: include fcntl.h for open(), O_RDWR, O_CLOEXEC and
- O_CREAT
-
-musl libc (unlike glibc) requires explicitly incuding fcntl.h to define open(),
-O_RDWR, O_CLOEXEC and O_CREAT. Otherwise the build fails with the errors:
-
-| ../weston-9.0.0/tests/weston-test-fixture-compositor.c: In function 'wait_for_lock':
-| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:7: warning: implicit declaration of function 'open'; did you mean 'popen'? [-Wimplicit-function-declaration]
-|   135 |  fd = open(lock_path, O_RDWR | O_CLOEXEC | O_CREAT, 00700);
-|       |       ^~~~
-|       |       popen
-| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:23: error: 'O_RDWR' undeclared (first use in this function)
-|   135 |  fd = open(lock_path, O_RDWR | O_CLOEXEC | O_CREAT, 00700);
-|       |                       ^~~~~~
-| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:23: note: each undeclared identifier is reported only once for each function it appears in
-| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:32: error: 'O_CLOEXEC' undeclared (first use in this function)
-|   135 |  fd = open(lock_path, O_RDWR | O_CLOEXEC | O_CREAT, 00700);
-|       |                                ^~~~~~~~~
-| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:44: error: 'O_CREAT' undeclared (first use in this function)
-|   135 |  fd = open(lock_path, O_RDWR | O_CLOEXEC | O_CREAT, 00700);
-|       |                                            ^~~~~~~
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-b10c0e843dcb8148bbe869bb15261955b94ac98c]
----
- tests/weston-test-fixture-compositor.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tests/weston-test-fixture-compositor.c b/tests/weston-test-fixture-compositor.c
-index 1c32959c..c1eb26c4 100644
---- a/tests/weston-test-fixture-compositor.c
-+++ b/tests/weston-test-fixture-compositor.c
-@@ -35,6 +35,7 @@
- #include <stdarg.h>
- #include <stdlib.h>
- #include <errno.h>
-+#include <fcntl.h>
- 
- #include "shared/helpers.h"
- #include "weston-test-fixture-compositor.h"
--- 
-2.25.1
-
diff --git a/package/weston/0002-libweston-backend-drm-might-need-EGL.patch b/package/weston/0002-libweston-backend-drm-might-need-EGL.patch
deleted file mode 100644
index f504e1145b..0000000000
--- a/package/weston/0002-libweston-backend-drm-might-need-EGL.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 4b93b71067949cc5efabb9b3d59278a3f362b11c Mon Sep 17 00:00:00 2001
-From: Heiko Thiery <heiko.thiery@gmail.com>
-Date: Wed, 21 Oct 2020 13:33:25 +0200
-Subject: [PATCH] libweston/backend/drm: might need EGL
-
-gbm-drm.c includes gl-renderer.h. When EGL is enabled, that in turns
-includes egl.h. As such, dependencies for drm should include EGL if
-it is available.
-
-This condition is modelled after a similar one in libweston/meson.build
-
-Reported-by: Gary Bisson <gary.bisson@boundarydevices.com>
-Reported-by: Heiko Thiery <heiko.thiery@gmail.com>
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
-Cc: Refik Tuzakli <tuzakli.refik@gmail.com>
-Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
-This patch should be a proper fix for the issue discribed in the patch from
-Gary [1].
-
-Since the MR on weston upstream [2] is not merged now I add this patch
-to have working weston with imx in buildroot.
-
-[1] https://patchwork.ozlabs.org/project/buildroot/patch/20200402130842.918696-3-gary.bisson@boundarydevices.com/
-[2] https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/508
----
- libweston/backend-drm/meson.build | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/libweston/backend-drm/meson.build b/libweston/backend-drm/meson.build
-index 484c2702..e3e5b976 100644
---- a/libweston/backend-drm/meson.build
-+++ b/libweston/backend-drm/meson.build
-@@ -53,6 +53,9 @@ if get_option('renderer-gl')
- 		config_h.set('HAVE_GBM_FD_IMPORT', '1')
- 	endif
- 	deps_drm += dep_gbm
-+	if dep_egl.found()
-+		deps_drm += dep_egl
-+	endif
- 	srcs_drm += 'drm-gbm.c'
- 	config_h.set('BUILD_DRM_GBM', '1')
- endif
---
-2.20.1
-
diff --git a/package/weston/0003-pipewire-add-support-for-0.3-API.patch b/package/weston/0003-pipewire-add-support-for-0.3-API.patch
deleted file mode 100644
index b486b3de5c..0000000000
--- a/package/weston/0003-pipewire-add-support-for-0.3-API.patch
+++ /dev/null
@@ -1,391 +0,0 @@
-From cc08737e3fd174ec3c4c208ea4f2a3a6a9e8af3e Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Mon, 6 Jul 2020 00:58:02 -0600
-Subject: [PATCH] pipewire: add support for 0.3 API
-
-Fixes: #369
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-80b585f8d2a31e780b4de41fbd187a742bea7e1a]
----
- .gitlab-ci.yml               |   2 +-
- .gitlab-ci/debian-install.sh |  16 ++++-
- pipewire/meson.build         |  28 ++++++---
- pipewire/pipewire-plugin.c   | 118 ++++++++++++++++++++++++++++++++++-
- 4 files changed, 151 insertions(+), 13 deletions(-)
-
-diff --git a/pipewire/meson.build b/pipewire/meson.build
-index 3d3374b8..e30a0b62 100644
---- a/pipewire/meson.build
-+++ b/pipewire/meson.build
-@@ -5,17 +5,25 @@ if get_option('pipewire')
- 		error('Attempting to build the pipewire plugin without the required DRM backend. ' + user_hint)
- 	endif
- 
--	depnames = [
--		'libpipewire-0.2', 'libspa-0.1'
--	]
- 	deps_pipewire = [ dep_libweston_private ]
--	foreach depname : depnames
--		dep = dependency(depname, required: false)
--		if not dep.found()
--			error('Pipewire plugin requires @0@ which was not found. '.format(depname) + user_hint)
--		endif
--		deps_pipewire += dep
--	endforeach
-+
-+	dep_libpipewire = dependency('libpipewire-0.3', required: false)
-+	if not dep_libpipewire.found()
-+		dep_libpipewire = dependency('libpipewire-0.2', required: false)
-+	endif
-+	if not dep_libpipewire.found()
-+		error('Pipewire plugin requires libpipewire which was not found. ' + user_hint)
-+	endif
-+	deps_pipewire += dep_libpipewire
-+
-+	dep_libspa = dependency('libspa-0.2', required: false)
-+	if not dep_libspa.found()
-+		dep_libspa = dependency('libspa-0.1', required: false)
-+	endif
-+	if not dep_libspa.found()
-+		error('Pipewire plugin requires libspa which was not found. ' + user_hint)
-+	endif
-+	deps_pipewire += dep_libspa
- 
- 	plugin_pipewire = shared_library(
- 		'pipewire-plugin',
-diff --git a/pipewire/pipewire-plugin.c b/pipewire/pipewire-plugin.c
-index 6f892574..ce70ea63 100644
---- a/pipewire/pipewire-plugin.c
-+++ b/pipewire/pipewire-plugin.c
-@@ -34,20 +34,27 @@
- #include <errno.h>
- #include <unistd.h>
- 
-+#include <pipewire/pipewire.h>
-+
- #include <spa/param/format-utils.h>
- #include <spa/param/video/format-utils.h>
- #include <spa/utils/defs.h>
- 
--#include <pipewire/pipewire.h>
-+#if PW_CHECK_VERSION(0, 2, 90)
-+#include <spa/buffer/meta.h>
-+#include <spa/utils/result.h>
-+#endif
- 
- #define PROP_RANGE(min, max) 2, (min), (max)
- 
-+#if !PW_CHECK_VERSION(0, 2, 90)
- struct type {
- 	struct spa_type_media_type media_type;
- 	struct spa_type_media_subtype media_subtype;
- 	struct spa_type_format_video format_video;
- 	struct spa_type_video_format video_format;
- };
-+#endif
- 
- struct weston_pipewire {
- 	struct weston_compositor *compositor;
-@@ -60,12 +67,19 @@ struct weston_pipewire {
- 	struct pw_loop *loop;
- 	struct wl_event_source *loop_source;
- 
-+#if PW_CHECK_VERSION(0, 2, 90)
-+	struct pw_context *context;
-+#endif
- 	struct pw_core *core;
- 	struct pw_type *t;
-+#if PW_CHECK_VERSION(0, 2, 90)
-+	struct spa_hook core_listener;
-+#else
- 	struct type type;
- 
- 	struct pw_remote *remote;
- 	struct spa_hook remote_listener;
-+#endif
- };
- 
- struct pipewire_output {
-@@ -100,6 +114,7 @@ struct pipewire_frame_data {
- 	struct wl_event_source *fence_sync_event_source;
- };
- 
-+#if !PW_CHECK_VERSION(0, 2, 90)
- static inline void init_type(struct type *type, struct spa_type_map *map)
- {
- 	spa_type_media_type_map(map, &type->media_type);
-@@ -107,6 +122,7 @@ static inline void init_type(struct type *type, struct spa_type_map *map)
- 	spa_type_format_video_map(map, &type->format_video);
- 	spa_type_video_format_map(map, &type->video_format);
- }
-+#endif
- 
- static void
- pipewire_debug_impl(struct weston_pipewire *pipewire,
-@@ -141,6 +157,7 @@ pipewire_debug_impl(struct weston_pipewire *pipewire,
- 	free(logstr);
- }
- 
-+#if !PW_CHECK_VERSION(0, 2, 90)
- static void
- pipewire_debug(struct weston_pipewire *pipewire, const char *fmt, ...)
- {
-@@ -150,6 +167,7 @@ pipewire_debug(struct weston_pipewire *pipewire, const char *fmt, ...)
- 	pipewire_debug_impl(pipewire, NULL, fmt, ap);
- 	va_end(ap);
- }
-+#endif
- 
- static void
- pipewire_output_debug(struct pipewire_output *output, const char *fmt, ...)
-@@ -185,7 +203,9 @@ pipewire_output_handle_frame(struct pipewire_output *output, int fd,
- 	const struct weston_drm_virtual_output_api *api =
- 		output->pipewire->virtual_output_api;
- 	size_t size = output->output->height * stride;
-+#if !PW_CHECK_VERSION(0, 2, 90)
- 	struct pw_type *t = output->pipewire->t;
-+#endif
- 	struct pw_buffer *buffer;
- 	struct spa_buffer *spa_buffer;
- 	struct spa_meta_header *h;
-@@ -203,7 +223,12 @@ pipewire_output_handle_frame(struct pipewire_output *output, int fd,
- 
- 	spa_buffer = buffer->buffer;
- 
-+#if PW_CHECK_VERSION(0, 2, 90)
-+	if ((h = spa_buffer_find_meta_data(spa_buffer, SPA_META_Header,
-+				     sizeof(struct spa_meta_header)))) {
-+#else
- 	if ((h = spa_buffer_find_meta(spa_buffer, t->meta.Header))) {
-+#endif
- 		h->pts = -1;
- 		h->flags = 0;
- 		h->seq = output->seq++;
-@@ -375,18 +400,40 @@ pipewire_set_dpms(struct weston_output *base_output, enum dpms_enum level)
- static int
- pipewire_output_connect(struct pipewire_output *output)
- {
-+#if !PW_CHECK_VERSION(0, 2, 90)
- 	struct weston_pipewire *pipewire = output->pipewire;
- 	struct type *type = &pipewire->type;
-+#endif
- 	uint8_t buffer[1024];
- 	struct spa_pod_builder builder =
- 		SPA_POD_BUILDER_INIT(buffer, sizeof(buffer));
- 	const struct spa_pod *params[1];
-+#if !PW_CHECK_VERSION(0, 2, 90)
- 	struct pw_type *t = pipewire->t;
-+#endif
- 	int frame_rate = output->output->current_mode->refresh / 1000;
- 	int width = output->output->width;
- 	int height = output->output->height;
- 	int ret;
- 
-+#if PW_CHECK_VERSION(0, 2, 90)
-+	params[0] = spa_pod_builder_add_object(&builder,
-+		SPA_TYPE_OBJECT_Format, SPA_PARAM_EnumFormat,
-+		SPA_FORMAT_mediaType, SPA_POD_Id(SPA_MEDIA_TYPE_video),
-+		SPA_FORMAT_mediaSubtype, SPA_POD_Id(SPA_MEDIA_SUBTYPE_raw),
-+		SPA_FORMAT_VIDEO_format, SPA_POD_Id(SPA_VIDEO_FORMAT_BGRx),
-+		SPA_FORMAT_VIDEO_size, SPA_POD_Rectangle(&SPA_RECTANGLE(width, height)),
-+		SPA_FORMAT_VIDEO_framerate, SPA_POD_Fraction(&SPA_FRACTION (0, 1)),
-+		SPA_FORMAT_VIDEO_maxFramerate,
-+		SPA_POD_CHOICE_RANGE_Fraction(&SPA_FRACTION(frame_rate, 1),
-+			&SPA_FRACTION(1, 1),
-+			&SPA_FRACTION(frame_rate, 1)));
-+
-+	ret = pw_stream_connect(output->stream, PW_DIRECTION_OUTPUT, SPA_ID_INVALID,
-+				(PW_STREAM_FLAG_DRIVER |
-+				 PW_STREAM_FLAG_MAP_BUFFERS),
-+				params, 1);
-+#else
- 	params[0] = spa_pod_builder_object(&builder,
- 		t->param.idEnumFormat, t->spa_format,
- 		"I", type->media_type.video,
-@@ -406,6 +453,7 @@ pipewire_output_connect(struct pipewire_output *output)
- 				(PW_STREAM_FLAG_DRIVER |
- 				 PW_STREAM_FLAG_MAP_BUFFERS),
- 				params, 1);
-+#endif
- 	if (ret != 0) {
- 		weston_log("Failed to connect pipewire stream: %s",
- 			   spa_strerror(ret));
-@@ -482,26 +530,42 @@ pipewire_output_stream_state_changed(void *data, enum pw_stream_state old,
- }
- 
- static void
-+#if PW_CHECK_VERSION(0, 2, 90)
-+pipewire_output_stream_param_changed(void *data, uint32_t id, const struct spa_pod *format)
-+#else
- pipewire_output_stream_format_changed(void *data, const struct spa_pod *format)
-+#endif
- {
- 	struct pipewire_output *output = data;
-+#if !PW_CHECK_VERSION(0, 2, 90)
- 	struct weston_pipewire *pipewire = output->pipewire;
-+#endif
- 	uint8_t buffer[1024];
- 	struct spa_pod_builder builder =
- 		SPA_POD_BUILDER_INIT(buffer, sizeof(buffer));
- 	const struct spa_pod *params[2];
-+#if !PW_CHECK_VERSION(0, 2, 90)
- 	struct pw_type *t = pipewire->t;
-+#endif
- 	int32_t width, height, stride, size;
- 	const int bpp = 4;
- 
- 	if (!format) {
- 		pipewire_output_debug(output, "format = None");
-+#if PW_CHECK_VERSION(0, 2, 90)
-+		pw_stream_update_params(output->stream, NULL, 0);
-+#else
- 		pw_stream_finish_format(output->stream, 0, NULL, 0);
-+#endif
- 		return;
- 	}
- 
-+#if PW_CHECK_VERSION(0, 2, 90)
-+	spa_format_video_raw_parse(format, &output->video_format);
-+#else
- 	spa_format_video_raw_parse(format, &output->video_format,
- 				   &pipewire->type.format_video);
-+#endif
- 
- 	width = output->video_format.size.width;
- 	height = output->video_format.size.height;
-@@ -510,6 +574,21 @@ pipewire_output_stream_format_changed(void *data, const struct spa_pod *format)
- 
- 	pipewire_output_debug(output, "format = %dx%d", width, height);
- 
-+#if PW_CHECK_VERSION(0, 2, 90)
-+	params[0] = spa_pod_builder_add_object(&builder,
-+		SPA_TYPE_OBJECT_ParamBuffers, SPA_PARAM_Buffers,
-+		SPA_PARAM_BUFFERS_size, SPA_POD_Int(size),
-+		SPA_PARAM_BUFFERS_stride, SPA_POD_Int(stride),
-+		SPA_PARAM_BUFFERS_buffers, SPA_POD_CHOICE_RANGE_Int(4, 2, 8),
-+		SPA_PARAM_BUFFERS_align, SPA_POD_Int(16));
-+
-+	params[1] = spa_pod_builder_add_object(&builder,
-+		SPA_TYPE_OBJECT_ParamMeta, SPA_PARAM_Meta,
-+		SPA_PARAM_META_type, SPA_POD_Id(SPA_META_Header),
-+		SPA_PARAM_META_size, SPA_POD_Int(sizeof(struct spa_meta_header)));
-+
-+	pw_stream_update_params(output->stream, params, 2);
-+#else
- 	params[0] = spa_pod_builder_object(&builder,
- 		t->param.idBuffers, t->param_buffers.Buffers,
- 		":", t->param_buffers.size,
-@@ -527,12 +606,17 @@ pipewire_output_stream_format_changed(void *data, const struct spa_pod *format)
- 		":", t->param_meta.size, "i", sizeof(struct spa_meta_header));
- 
- 	pw_stream_finish_format(output->stream, 0, params, 2);
-+#endif
- }
- 
- static const struct pw_stream_events stream_events = {
- 	PW_VERSION_STREAM_EVENTS,
- 	.state_changed = pipewire_output_stream_state_changed,
-+#if PW_CHECK_VERSION(0, 2, 90)
-+	.param_changed = pipewire_output_stream_param_changed,
-+#else
- 	.format_changed = pipewire_output_stream_format_changed,
-+#endif
- };
- 
- static struct weston_output *
-@@ -560,7 +644,11 @@ pipewire_output_create(struct weston_compositor *c, char *name)
- 	if (!head)
- 		goto err;
- 
-+#if PW_CHECK_VERSION(0, 2, 90)
-+	output->stream = pw_stream_new(pipewire->core, name, NULL);
-+#else
- 	output->stream = pw_stream_new(pipewire->remote, name, NULL);
-+#endif
- 	if (!output->stream) {
- 		weston_log("Cannot initialize pipewire stream\n");
- 		goto err;
-@@ -704,6 +792,14 @@ weston_pipewire_loop_handler(int fd, uint32_t mask, void *data)
- 	return 0;
- }
- 
-+#if PW_CHECK_VERSION(0, 2, 90)
-+static void
-+weston_pipewire_error(void *data, uint32_t id, int seq, int res,
-+			      const char *error)
-+{
-+	weston_log("pipewire remote error: %s\n", error);
-+}
-+#else
- static void
- weston_pipewire_state_changed(void *data, enum pw_remote_state old,
- 			      enum pw_remote_state state, const char *error)
-@@ -725,12 +821,20 @@ weston_pipewire_state_changed(void *data, enum pw_remote_state old,
- 		break;
- 	}
- }
-+#endif
- 
- 
-+#if PW_CHECK_VERSION(0, 2, 90)
-+static const struct pw_core_events core_events = {
-+	PW_VERSION_CORE_EVENTS,
-+	.error = weston_pipewire_error,
-+};
-+#else
- static const struct pw_remote_events remote_events = {
- 	PW_VERSION_REMOTE_EVENTS,
- 	.state_changed = weston_pipewire_state_changed,
- };
-+#endif
- 
- static int
- weston_pipewire_init(struct weston_pipewire *pipewire)
-@@ -745,10 +849,19 @@ weston_pipewire_init(struct weston_pipewire *pipewire)
- 
- 	pw_loop_enter(pipewire->loop);
- 
-+#if PW_CHECK_VERSION(0, 2, 90)
-+	pipewire->context = pw_context_new(pipewire->loop, NULL, 0);
-+#else
- 	pipewire->core = pw_core_new(pipewire->loop, NULL);
- 	pipewire->t = pw_core_get_type(pipewire->core);
- 	init_type(&pipewire->type, pipewire->t->map);
-+#endif
- 
-+#if PW_CHECK_VERSION(0, 2, 90)
-+	pw_core_add_listener(pipewire->core,
-+			       &pipewire->core_listener,
-+			       &core_events, pipewire);
-+#else
- 	pipewire->remote = pw_remote_new(pipewire->core, NULL, 0);
- 	pw_remote_add_listener(pipewire->remote,
- 			       &pipewire->remote_listener,
-@@ -777,6 +890,7 @@ weston_pipewire_init(struct weston_pipewire *pipewire)
- 			goto err;
- 		}
- 	}
-+#endif
- 
- 	loop = wl_display_get_event_loop(pipewire->compositor->wl_display);
- 	pipewire->loop_source =
-@@ -786,12 +900,14 @@ weston_pipewire_init(struct weston_pipewire *pipewire)
- 				     pipewire);
- 
- 	return 0;
-+#if !PW_CHECK_VERSION(0, 2, 90)
- err:
- 	if (pipewire->remote)
- 		pw_remote_destroy(pipewire->remote);
- 	pw_loop_leave(pipewire->loop);
- 	pw_loop_destroy(pipewire->loop);
- 	return -1;
-+#endif
- }
- 
- static const struct weston_pipewire_api pipewire_api = {
--- 
-2.25.1
-
diff --git a/package/weston/0004-pipewire-fix-null-deref-in-0-3-API.patch b/package/weston/0004-pipewire-fix-null-deref-in-0-3-API.patch
deleted file mode 100644
index f65348e166..0000000000
--- a/package/weston/0004-pipewire-fix-null-deref-in-0-3-API.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From a67393c353e0f25b142910a817be5a7754d436c3 Mon Sep 17 00:00:00 2001
-From: Ambareesh Balaji <ambareeshbalaji@gmail.com>
-Date: Sat, 5 Dec 2020 20:49:55 -0500
-Subject: [PATCH] pipewire: fix null deref in 0.3 API
-
-Signed-off-by: Ambareesh Balaji <ambareeshbalaji@gmail.com>
-[Retrieved from:
-https://gitlab.freedesktop.org/wayland/weston/-/commit/a67393c353e0f25b142910a817be5a7754d436c3]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- pipewire/pipewire-plugin.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/pipewire/pipewire-plugin.c b/pipewire/pipewire-plugin.c
-index ca5cbfec1..55705acfc 100644
---- a/pipewire/pipewire-plugin.c
-+++ b/pipewire/pipewire-plugin.c
-@@ -856,6 +856,7 @@ weston_pipewire_init(struct weston_pipewire *pipewire)
- 
- #if PW_CHECK_VERSION(0, 2, 90)
- 	pipewire->context = pw_context_new(pipewire->loop, NULL, 0);
-+	pipewire->core = pw_context_connect(pipewire->context, NULL, 0);
- #else
- 	pipewire->core = pw_core_new(pipewire->loop, NULL);
- 	pipewire->t = pw_core_get_type(pipewire->core);
--- 
-GitLab
-
diff --git a/package/weston/Config.in b/package/weston/Config.in
index 8f3dbc7931..d45e50baaa 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -35,7 +35,7 @@ choice
 	prompt "default compositor"
 
 config BR2_PACKAGE_WESTON_DEFAULT_FBDEV
-	bool "fbdev"
+	bool "fbdev (deprecated)"
 	select BR2_PACKAGE_WESTON_FBDEV
 
 config BR2_PACKAGE_WESTON_DEFAULT_DRM
@@ -46,21 +46,31 @@ config BR2_PACKAGE_WESTON_DEFAULT_DRM
 comment "drm backend needs mesa3d w/ EGL driver"
 	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL && !BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
 
+config BR2_PACKAGE_WESTON_DEFAULT_HEADLESS
+	bool "headless"
+	select BR2_PACKAGE_WESTON_HEADLESS
+
+config BR2_PACKAGE_WESTON_DEFAULT_WAYLAND
+	bool "wayland (nested)"
+	select BR2_PACKAGE_WESTON_WAYLAND
+
 config BR2_PACKAGE_WESTON_DEFAULT_X11
-	bool "X11"
+	bool "X11 (nested)"
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_WESTON_X11
 
-comment "X11 backend needs X.org"
+comment "X11 (nested) backend needs X.org"
 	depends on !BR2_PACKAGE_XORG7
 
 endchoice
 
 config BR2_PACKAGE_WESTON_DEFAULT_COMPOSITOR
 	string
-	default "fbdev" if BR2_PACKAGE_WESTON_DEFAULT_FBDEV
-	default "drm"   if BR2_PACKAGE_WESTON_DEFAULT_DRM
-	default "x11"   if BR2_PACKAGE_WESTON_DEFAULT_X11
+	default "fbdev"    if BR2_PACKAGE_WESTON_DEFAULT_FBDEV
+	default "drm"      if BR2_PACKAGE_WESTON_DEFAULT_DRM
+	default "headless" if BR2_PACKAGE_WESTON_DEFAULT_HEADLESS
+	default "wayland"  if BR2_PACKAGE_WESTON_DEFAULT_WAYLAND
+	default "x11"      if BR2_PACKAGE_WESTON_DEFAULT_X11
 
 config BR2_PACKAGE_WESTON_DRM
 	bool "DRM compositor"
@@ -71,7 +81,7 @@ comment "DRM compositor needs an OpenGL EGL backend provided by mesa3d"
 	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL && !BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
 
 config BR2_PACKAGE_WESTON_FBDEV
-	bool "fbdev compositor"
+	bool "fbdev compositor (deprecated)"
 
 # FreeRDP needs threads and !static, already the case for weston
 config BR2_PACKAGE_WESTON_RDP
@@ -99,13 +109,19 @@ comment "RDP compositor needs a toolchain w/ wchar, C++"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
 
+config BR2_PACKAGE_WESTON_HEADLESS
+	bool "headless (testing) compositor"
+
+config BR2_PACKAGE_WESTON_WAYLAND
+	bool "Wayland (nested) compositor"
+
 config BR2_PACKAGE_WESTON_X11
-	bool "X11 compositor"
+	bool "X11 (nested) compositor"
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBXCB
 	select BR2_PACKAGE_XLIB_LIBX11
 
-comment "X11 compositor needs X.org enabled"
+comment "X11 (nested) compositor needs X.org enabled"
 	depends on !BR2_PACKAGE_XORG7
 
 config BR2_PACKAGE_WESTON_XWAYLAND
diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index 5a6b38686a..b78a7c7550 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2020-September/041595.html
-md5  b406da0fe9139fd39653238fde22a6cf  weston-9.0.0.tar.xz
-sha1  90b9540a0bd6d6f7a465817f1c696d4d393183c9  weston-9.0.0.tar.xz
-sha256  5cf5d6ce192e0eb15c1fc861a436bf21b5bb3b91dbdabbdebe83e1f83aa098fe  weston-9.0.0.tar.xz
-sha512  ccc263f8279b7b23e5c593b4a8a023de2c3dc178b1b8d6593599171770bcfe97608de9fcb77aa1cab39255451d289d323e51c317dae190c7641282e085b84f90  weston-9.0.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2022-February/042103.html
+md5  bc4abe2ee6904a4890a0c641c6257f91  weston-10.0.0.tar.xz
+sha1  b1a51e3bb7ee1d75bbf728c8071771e07fc97fdd  weston-10.0.0.tar.xz
+sha256  5c23964112b90238bed39e5dd1e41cd71a79398813cdc3bbb15a9fdc94e547ae  weston-10.0.0.tar.xz
+sha512  77e05530751e4f743eebf015ab5b78a1fcc66b774713b5e296cfffc488be84e459f811c85ac4280b7b63eebf4ff5c958dd7306376ab343e6b80feae16c8c35a4  weston-10.0.0.tar.xz
 sha256  fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  COPYING
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 6dd5439291..a0a18d9358 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 9.0.0
+WESTON_VERSION = 10.0.0
 WESTON_SITE = https://wayland.freedesktop.org/releases
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
@@ -12,12 +12,14 @@ WESTON_LICENSE_FILES = COPYING
 WESTON_CPE_ID_VENDOR = wayland
 
 WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
-	libxkbcommon pixman libpng jpeg udev cairo libinput libdrm
+	libxkbcommon pixman libpng udev cairo libinput libdrm
 
 WESTON_CONF_OPTS = \
 	-Dbackend-headless=false \
 	-Dcolor-management-colord=false \
-	-Dremoting=false
+	-Ddoc=false \
+	-Dremoting=false \
+	-Dtools=calibrator,debug,info,terminal,touch-calibrator
 
 # Uses VIDIOC_EXPBUF, only available from 3.8+
 ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8),y)
@@ -33,6 +35,13 @@ else
 WESTON_CONF_OPTS += -Dlauncher-logind=false
 endif
 
+ifeq ($(BR2_PACKAGE_JPEG),y)
+WESTON_CONF_OPTS += -Dimage-jpeg=true
+WESTON_DEPENDENCIES += jpeg
+else
+WESTON_CONF_OPTS += -Dimage-jpeg=false
+endif
+
 ifeq ($(BR2_PACKAGE_WEBP),y)
 WESTON_CONF_OPTS += -Dimage-webp=true
 WESTON_DEPENDENCIES += webp
@@ -48,10 +57,10 @@ endef
 define WESTON_USERS
 	- - weston-launch -1 - - - - Weston launcher group
 endef
-WESTON_CONF_OPTS += -Dweston-launch=true
+WESTON_CONF_OPTS += -Ddeprecated-weston-launch=true
 WESTON_DEPENDENCIES += linux-pam
 else
-WESTON_CONF_OPTS += -Dweston-launch=false
+WESTON_CONF_OPTS += -Ddeprecated-weston-launch=false
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND)$(BR2_PACKAGE_HAS_LIBGLES),yy)
@@ -77,9 +86,9 @@ WESTON_CONF_OPTS += -Dbackend-rdp=false
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_FBDEV),y)
-WESTON_CONF_OPTS += -Dbackend-fbdev=true
+WESTON_CONF_OPTS += -Ddeprecated-backend-fbdev=true
 else
-WESTON_CONF_OPTS += -Dbackend-fbdev=false
+WESTON_CONF_OPTS += -Ddeprecated-backend-fbdev=false
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_DRM),y)
@@ -88,6 +97,18 @@ else
 WESTON_CONF_OPTS += -Dbackend-drm=false
 endif
 
+ifeq ($(BR2_PACKAGE_WESTON_HEADLESS),y)
+WESTON_CONF_OPTS += -Dbackend-headless=true
+else
+WESTON_CONF_OPTS += -Dbackend-headless=false
+endif
+
+ifeq ($(BR2_PACKAGE_WESTON_WAYLAND),y)
+WESTON_CONF_OPTS += -Dbackend-wayland=true
+else
+WESTON_CONF_OPTS += -Dbackend-wayland=false
+endif
+
 ifeq ($(BR2_PACKAGE_WESTON_X11),y)
 WESTON_CONF_OPTS += -Dbackend-x11=true
 WESTON_DEPENDENCIES += libxcb xlib_libX11
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
