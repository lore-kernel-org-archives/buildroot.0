Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243E4C47073
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 09:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B46F812F3;
	Tue,  2 Jan 2024 09:09:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B46F812F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1gPZ1-6b7uwe; Tue,  2 Jan 2024 09:09:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 175DB812F8;
	Tue,  2 Jan 2024 09:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 175DB812F8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C6BCA1BF298
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 09:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC8A0606EB
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 09:09:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC8A0606EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R5yCLP0Hi10A for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 09:09:40 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E0D260681
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 09:09:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E0D260681
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40d2e56f3a6so51954125e9.1
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 01:09:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704186577; x=1704791377;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:sender:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=+O41vHl35mwhEXta+smJGVVcOLYuRXmkuu5vhVtvwKo=;
 b=m4kQ7NKJXzvzX3Myo2baq+OvbPGg9LdEav6KfsnHtqKYJSOMwg3qAJUS2FFjPYkS1r
 qSZhUHRrKy9ZsBrOhvkZ2ypEGKO+g6D4X4P5q65/yYwaZI9oaUQtHJvP6s7fZ+QEQkcG
 NCu1yBW1k0/LNNJeub87TFx1Bcu/tvcj7IUGh4p1Nu7WMgxyOK+lsKO5Utdfy1Rope5c
 rH/FblQPKz0Mi/py41q6V+w7xASJLkuOrrfTUj20QJriTVuF8r8SkIv+6IIZjbQfXExe
 P+8lxAnzWVa93DdXapwurUOu7jONaPukkALem7PUoxhwpnPVBkZql5FtHJkAy4XRIWLc
 9+Cw==
X-Gm-Message-State: AOJu0Yx+pMBSF7+fXfxdzSGolSFgeidknsUTs9ZYLCH1J32j+uf8NsB/
 9OufaZVs3uFDgm/STzfWcNh0xw2mqZo=
X-Google-Smtp-Source: AGHT+IFDoFI4g9MCHe4K6Ct6o//BKI24h4xReMsqSLRgeqPn1+5esjFTFxd+jIaZM5e5MFryez0D6w==
X-Received: by 2002:a05:600c:4e02:b0:40d:8da9:f982 with SMTP id
 b2-20020a05600c4e0200b0040d8da9f982mr141713wmq.127.1704186576573; 
 Tue, 02 Jan 2024 01:09:36 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 bd6-20020a05600c1f0600b0040d5335079dsm33761357wmb.47.2024.01.02.01.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 01:09:36 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 10:09:33 +0100
Message-ID: <20240102090933.64969-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704186577; x=1704791377; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+O41vHl35mwhEXta+smJGVVcOLYuRXmkuu5vhVtvwKo=;
 b=DNXaGdpxMUubICBUZWzAQWLLZT+mkzDtGHJJGulYP9XFqPesgY52YLLS5aSi3jKBd2
 NmLPH3tMOqG1noNdq8HEEc1i4Tvb5iPcrGffueRIIuGwovKk3cbIbt9GjOyXsYMUNuoj
 DU5WQns3G7JUQ3wpFBRg58qg7S9xtfvbjPCjzPesQyQoC4ePN5+RlC2NBw4AVqKMJt9d
 xfD4OAdUmKQiHnFsTD9qQ5mVoPG6qG756NL+yMDc0SBjNMJAGPrvj2BlSE+WIKA9VxOx
 oFHLkTtpy5bhWVpDDwtKhGlpMn+hgwEY6TCsCPn9SYhthH/ZLfq9B2hgdA2sbm0czpnh
 xYWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DNXaGdpx
Subject: [Buildroot] [PATCH v4] package/cairo: bump to 1.18.0
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
Reply-To: 20231116145113.1828682-1-thomas.devoogdt@barco.com
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas@devoogdt.com>

News:
 - https://www.cairographics.org/news/cairo-1.17.2/
 - https://www.cairographics.org/news/cairo-1.17.4/
 - https://www.cairographics.org/news/cairo-1.17.8/
 - https://www.cairographics.org/news/cairo-1.18.0/

Support for the meson build system was added in 1.17.4,
while support for autotools was dropped in 1.17.8.

Some options are renamed/dropped so fix that along.
 - GL and GLES drawing has been dropped in 1.17.8.
 - The XML surface has been removed in 1.18.0.

Patches:
 - drop 0001-fix-nofork-build.patch, upstream: [1]
 - drop 0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch, upstream: [2]
 - drop 0003-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch, upstream: [3]
 - drop 0004-Fix-mask-usage-in-image-compositor.patch, upstream: [4]
 - add 0001-cairo-ft-private.h-fix-missing-FT_Color-error.patch, upstream: [5]
 - add 0002-meson.build-fix-x11-build.patch, upstream: [6]

[1]: https://gitlab.freedesktop.org/cairo/cairo/-/commit/cb2357f481396820ec954dc4b69eafc01a8d162a
[2]: https://gitlab.freedesktop.org/cairo/cairo/-/commit/90e85c2493fdfa3551f202ff10282463f1e36645
[3]: https://gitlab.freedesktop.org/cairo/cairo/-/commit/ab2c5ee21e5f3d3ee4b3f67cfcd5811a4f99c3a0
[4]: https://gitlab.freedesktop.org/cairo/cairo/-/commit/03a820b173ed1fdef6ff14b4468f5dbc02ff59be
[5]: https://gitlab.freedesktop.org/cairo/cairo/-/issues/792
[6]: https://gitlab.freedesktop.org/cairo/cairo/-/issues/613

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: added -std=gnu11 (allow inline int declaration in if loop, 99 caused some directives problems)
v3: enabled host-zlib, needed for librsvg
v4: also added gnu11 for host-cairo compiling (fixes my compilation on a gcc 4.9.2 based system)
---
 ...private.h-fix-missing-FT_Color-error.patch |  32 +++
 package/cairo/0001-fix-nofork-build.patch     |  29 ---
 ...vailable-in-cairo_ft_apply_variation.patch |  33 ----
 .../0002-meson.build-fix-x11-build.patch      |  29 +++
 ...or_tolerance_normalized-fix-infinite.patch |  39 ----
 ...4-Fix-mask-usage-in-image-compositor.patch |  56 ------
 package/cairo/Config.in                       |  34 ++--
 package/cairo/cairo.hash                      |   6 +-
 package/cairo/cairo.mk                        | 183 ++++++------------
 9 files changed, 136 insertions(+), 305 deletions(-)
 create mode 100644 package/cairo/0001-cairo-ft-private.h-fix-missing-FT_Color-error.patch
 delete mode 100644 package/cairo/0001-fix-nofork-build.patch
 delete mode 100644 package/cairo/0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch
 create mode 100644 package/cairo/0002-meson.build-fix-x11-build.patch
 delete mode 100644 package/cairo/0003-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch
 delete mode 100644 package/cairo/0004-Fix-mask-usage-in-image-compositor.patch

diff --git a/package/cairo/0001-cairo-ft-private.h-fix-missing-FT_Color-error.patch b/package/cairo/0001-cairo-ft-private.h-fix-missing-FT_Color-error.patch
new file mode 100644
index 0000000000..3b18d8077b
--- /dev/null
+++ b/package/cairo/0001-cairo-ft-private.h-fix-missing-FT_Color-error.patch
@@ -0,0 +1,32 @@
+From da698db0c20507f0e07492cbe40dbaf1c9053f71 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Sun, 12 Nov 2023 09:58:05 +0100
+Subject: [PATCH] cairo-ft-private.h: fix missing FT_Color error
+
+In file included from ../src/cairo-colr-glyph-render.c:37:
+../src/cairo-ft-private.h:87:30: error: unknown type name 'FT_Color'
+   87 |                              FT_Color               *palette,
+      |                              ^~~~~~~~
+
+Upstream: https://gitlab.freedesktop.org/cairo/cairo/-/issues/792
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ src/cairo-ft-private.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/cairo-ft-private.h b/src/cairo-ft-private.h
+index 836f7e523..6b0e30223 100644
+--- a/src/cairo-ft-private.h
++++ b/src/cairo-ft-private.h
+@@ -43,6 +43,8 @@
+ 
+ #if CAIRO_HAS_FT_FONT
+ 
++#include FT_COLOR_H
++
+ CAIRO_BEGIN_DECLS
+ 
+ typedef struct _cairo_ft_unscaled_font cairo_ft_unscaled_font_t;
+-- 
+2.34.1
+
diff --git a/package/cairo/0001-fix-nofork-build.patch b/package/cairo/0001-fix-nofork-build.patch
deleted file mode 100644
index 702e9910a5..0000000000
--- a/package/cairo/0001-fix-nofork-build.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-test: fix build when SHOULD_FORK is false
-
-The code in test/cairo-test-runner.c properly takes into account
-platforms that do have fork() support, and uses the SHOULD_FORK define
-to know whether fork is available or not.
-
-However, this SHOULD_FORK macro is used to guard the inclusion of
-<unistd.h>, which is needed to get the prototype of other functions
-(namely readlink and getppid), that are used in portions of this file
-not guarded by SHOULD_FORK.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/test/cairo-test-runner.c
-===================================================================
---- a/test/cairo-test-runner.c
-+++ b/test/cairo-test-runner.c
-@@ -36,10 +36,10 @@
- #include <pixman.h> /* for version information */
- 
- #define SHOULD_FORK HAVE_FORK && HAVE_WAITPID
--#if SHOULD_FORK
- #if HAVE_UNISTD_H
- #include <unistd.h>
- #endif
-+#if SHOULD_FORK
- #if HAVE_SIGNAL_H
- #include <signal.h>
- #endif
diff --git a/package/cairo/0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch b/package/cairo/0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch
deleted file mode 100644
index 10e000d16f..0000000000
--- a/package/cairo/0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 90e85c2493fdfa3551f202ff10282463f1e36645 Mon Sep 17 00:00:00 2001
-From: Carlos Garcia Campos <cgarcia@igalia.com>
-Date: Mon, 19 Nov 2018 12:33:07 +0100
-Subject: [PATCH] ft: Use FT_Done_MM_Var instead of free when available in
- cairo_ft_apply_variations
-
-Fixes a crash when using freetype >= 2.9
-[Retrieved from:
-https://gitlab.freedesktop.org/cairo/cairo/-/commit/90e85c2493fdfa3551f202ff10282463f1e36645]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/cairo-ft-font.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/cairo-ft-font.c b/src/cairo-ft-font.c
-index 325dd61b4..981973f78 100644
---- a/src/cairo-ft-font.c
-+++ b/src/cairo-ft-font.c
-@@ -2393,7 +2393,11 @@ skip:
- done:
-         free (coords);
-         free (current_coords);
-+#if HAVE_FT_DONE_MM_VAR
-+        FT_Done_MM_Var (face->glyph->library, ft_mm_var);
-+#else
-         free (ft_mm_var);
-+#endif
-     }
- }
- 
--- 
-2.24.1
-
diff --git a/package/cairo/0002-meson.build-fix-x11-build.patch b/package/cairo/0002-meson.build-fix-x11-build.patch
new file mode 100644
index 0000000000..fd17397586
--- /dev/null
+++ b/package/cairo/0002-meson.build-fix-x11-build.patch
@@ -0,0 +1,29 @@
+From 840e3ad20f8536d9857876ca2f5161896b68ab9b Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Sun, 12 Nov 2023 10:44:13 +0100
+Subject: [PATCH] meson.build: fix x11 build
+
+../../br-test-pkg/arm-aarch64/build/cairo-1.18.0/meson.build:381:13: ERROR: Can not run test applications in this cross environment.
+
+Upstream: https://gitlab.freedesktop.org/cairo/cairo/-/issues/613
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 9efe91978..9864b8699 100644
+--- a/meson.build
++++ b/meson.build
+@@ -369,7 +369,7 @@ if x11_dep.found() and xext_dep.found()
+ 
+   # Can skip the run check by providing the result in a cross file or
+   # native file as bool property value.
+-  prop = meson.get_external_property('ipc_rmid_deferred_release', 'auto')
++  prop = meson.get_external_property('ipc_rmid_deferred_release', 'false')
+   # We don't know the type of prop (bool, string) but need to differentiate
+   # between a set value (bool) or the fallback value (string), so convert to
+   # a string and check the string value.
+-- 
+2.34.1
+
diff --git a/package/cairo/0003-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch b/package/cairo/0003-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch
deleted file mode 100644
index 078e90fa42..0000000000
--- a/package/cairo/0003-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From ab2c5ee21e5f3d3ee4b3f67cfcd5811a4f99c3a0 Mon Sep 17 00:00:00 2001
-From: Heiko Lewin <hlewin@gmx.de>
-Date: Sun, 1 Aug 2021 11:16:03 +0000
-Subject: [PATCH] _arc_max_angle_for_tolerance_normalized: fix infinite loop
-
-[Retrieved from:
-https://gitlab.freedesktop.org/cairo/cairo/-/commit/ab2c5ee21e5f3d3ee4b3f67cfcd5811a4f99c3a0]
-Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
----
- src/cairo-arc.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/cairo-arc.c b/src/cairo-arc.c
-index 390397bae..1c891d1a0 100644
---- a/src/cairo-arc.c
-+++ b/src/cairo-arc.c
-@@ -90,16 +90,18 @@ _arc_max_angle_for_tolerance_normalized (double tolerance)
- 	{ M_PI / 11.0,  9.81410988043554039085e-09 },
-     };
-     int table_size = ARRAY_LENGTH (table);
-+    const int max_segments = 1000; /* this value is chosen arbitrarily. this gives an error of about 1.74909e-20 */
- 
-     for (i = 0; i < table_size; i++)
- 	if (table[i].error < tolerance)
- 	    return table[i].angle;
- 
-     ++i;
-+
-     do {
- 	angle = M_PI / i++;
- 	error = _arc_error_normalized (angle);
--    } while (error > tolerance);
-+    } while (error > tolerance && i < max_segments);
- 
-     return angle;
- }
--- 
-2.38.1
-
diff --git a/package/cairo/0004-Fix-mask-usage-in-image-compositor.patch b/package/cairo/0004-Fix-mask-usage-in-image-compositor.patch
deleted file mode 100644
index 54a95593c5..0000000000
--- a/package/cairo/0004-Fix-mask-usage-in-image-compositor.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 03a820b173ed1fdef6ff14b4468f5dbc02ff59be Mon Sep 17 00:00:00 2001
-From: Heiko Lewin <heiko.lewin@worldiety.de>
-Date: Tue, 15 Dec 2020 16:48:19 +0100
-Subject: [PATCH] Fix mask usage in image-compositor
-
-[Retrieved from
-https://gitlab.freedesktop.org/cairo/cairo/-/commit/03a820b173ed1fdef6ff14b4468f5dbc02ff59be]
-[Removed changes in test/ directory to remove binary diff so that the
-patch can be applied by `patch` tool]
-Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
----
- src/cairo-image-compositor.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/cairo-image-compositor.c b/src/cairo-image-compositor.c
-index bbf4cf228..2352c478e 100644
---- a/src/cairo-image-compositor.c
-+++ b/src/cairo-image-compositor.c
-@@ -2601,14 +2601,14 @@ _inplace_src_spans (void *abstract_renderer, int y, int h,
- 		    unsigned num_spans)
- {
-     cairo_image_span_renderer_t *r = abstract_renderer;
--    uint8_t *m;
-+    uint8_t *m, *base = (uint8_t*)pixman_image_get_data(r->mask);
-     int x0;
- 
-     if (num_spans == 0)
- 	return CAIRO_STATUS_SUCCESS;
- 
-     x0 = spans[0].x;
--    m = r->_buf;
-+    m = base;
-     do {
- 	int len = spans[1].x - spans[0].x;
- 	if (len >= r->u.composite.run_length && spans[0].coverage == 0xff) {
-@@ -2646,7 +2646,7 @@ _inplace_src_spans (void *abstract_renderer, int y, int h,
- 				      spans[0].x, y,
- 				      spans[1].x - spans[0].x, h);
- 
--	    m = r->_buf;
-+	    m = base;
- 	    x0 = spans[1].x;
- 	} else if (spans[0].coverage == 0x0) {
- 	    if (spans[0].x != x0) {
-@@ -2675,7 +2675,7 @@ _inplace_src_spans (void *abstract_renderer, int y, int h,
- #endif
- 	    }
- 
--	    m = r->_buf;
-+	    m = base;
- 	    x0 = spans[1].x;
- 	} else {
- 	    *m++ = spans[0].coverage;
--- 
-2.38.1
-
diff --git a/package/cairo/Config.in b/package/cairo/Config.in
index 0c87a2904b..caa6c37195 100644
--- a/package/cairo/Config.in
+++ b/package/cairo/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_XORG7
 	help
 	  Cairo is a 2D graphics library with support for multiple
 	  output devices. Currently supported output targets include
@@ -15,34 +16,35 @@ config BR2_PACKAGE_CAIRO
 
 if BR2_PACKAGE_CAIRO
 
-config BR2_PACKAGE_CAIRO_PS
-	bool "postscript support"
-	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_CAIRO_PDF
-
-config BR2_PACKAGE_CAIRO_PDF
-	bool "pdf support"
-	select BR2_PACKAGE_ZLIB
-
 config BR2_PACKAGE_CAIRO_PNG
 	bool "png support"
 	select BR2_PACKAGE_LIBPNG
-	select BR2_PACKAGE_ZLIB
-
-config BR2_PACKAGE_CAIRO_SCRIPT
-	bool "script support"
-	select BR2_PACKAGE_CAIRO_PNG
 
 config BR2_PACKAGE_CAIRO_SVG
 	bool "svg support"
 	select BR2_PACKAGE_CAIRO_PNG
-	select BR2_PACKAGE_CAIRO_PDF
 
 config BR2_PACKAGE_CAIRO_TEE
 	bool "tee support"
 
+config BR2_PACKAGE_CAIRO_ZLIB
+	bool "zlib support"
+	select BR2_PACKAGE_ZLIB
+
+config BR2_PACKAGE_CAIRO_SCRIPT
+	bool "script support"
+	select BR2_PACKAGE_CAIRO_ZLIB
+
+config BR2_PACKAGE_CAIRO_PS
+	bool "postscript support"
+	select BR2_PACKAGE_CAIRO_ZLIB
+
+config BR2_PACKAGE_CAIRO_PDF
+	bool "pdf support"
+	select BR2_PACKAGE_CAIRO_ZLIB
+
 config BR2_PACKAGE_CAIRO_XML
 	bool "xml support"
-	select BR2_PACKAGE_CAIRO_PNG
+	select BR2_PACKAGE_CAIRO_ZLIB
 
 endif
diff --git a/package/cairo/cairo.hash b/package/cairo/cairo.hash
index 3b93e24a22..df9c693bad 100644
--- a/package/cairo/cairo.hash
+++ b/package/cairo/cairo.hash
@@ -1,7 +1,5 @@
-# From https://www.cairographics.org/releases/cairo-1.16.0.tar.xz.sha1
-sha1  00e81842ae5e81bb0343108884eb5205be0eac14  cairo-1.16.0.tar.xz
-# Calculated based on the hash above
-sha256  5e7b29b3f113ef870d1e3ecf8adf21f923396401604bda16d44be45e66052331  cairo-1.16.0.tar.xz
+# From https://www.cairographics.org/releases/cairo-1.18.0.tar.xz.sha256sum
+sha256  243a0736b978a33dee29f9cca7521733b78a65b5418206fef7bd1c3d4cf10b64  cairo-1.18.0.tar.xz
 
 # Hash for license files:
 sha256  67228a9f7c5f9b67c58f556f1be178f62da4d9e2e6285318d8c74d567255abdf  COPYING
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 7bc8f92deb..393c99b8e9 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAIRO_VERSION = 1.16.0
+CAIRO_VERSION = 1.18.0
 CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
 CAIRO_LICENSE = LGPL-2.1 or MPL-1.1 (library)
 CAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
@@ -12,175 +12,102 @@ CAIRO_CPE_ID_VENDOR = cairographics
 CAIRO_SITE = http://cairographics.org/releases
 CAIRO_INSTALL_STAGING = YES
 
-# 0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch
-CAIRO_IGNORE_CVES += CVE-2018-19876
-# 0003-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch
-CAIRO_IGNORE_CVES += CVE-2019-6462
-# 0004-Fix-mask-usage-in-image-compositor.patch
-CAIRO_IGNORE_CVES += CVE-2020-35492
-
-CAIRO_CONF_ENV = LIBS="$(CAIRO_LIBS)"
+CAIRO_CFLAGS = $(TARGET_CFLAGS) -std=gnu11
+CAIRO_LDFLAGS = $(TARGET_LDFLAGS)
 
 # relocation truncated to fit: R_68K_GOT16O
 ifeq ($(BR2_m68k_cf),y)
-CAIRO_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mxgot"
-endif
-
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),)
-CAIRO_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -DCAIRO_NO_MUTEX=1"
+CAIRO_CFLAGS += -mxgot
 endif
 
 # cairo can use C++11 atomics when available, so we need to link with
 # libatomic for the architectures who need libatomic.
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-CAIRO_LIBS += -latomic
+CAIRO_LDFLAGS += -latomic
 endif
 
 CAIRO_CONF_OPTS = \
-	--enable-trace=no \
-	--enable-interpreter=no
-
-CAIRO_DEPENDENCIES = host-pkgconf fontconfig pixman
+	-Ddwrite=disabled \
+	-Dfontconfig=enabled \
+	-Dquartz=disabled \
+	-Dtests=disabled \
+	-Dspectre=disabled \
+	-Dsymbol-lookup=disabled \
+	-Dgtk_doc=false
+CAIRO_DEPENDENCIES = \
+	host-pkgconf \
+	fontconfig \
+	pixman
 
 # Just the bare minimum to make other host-* packages happy
 HOST_CAIRO_CONF_OPTS = \
-	--enable-trace=no \
-	--enable-interpreter=no \
-	--disable-directfb \
-	--enable-ft \
-	--enable-gobject \
-	--disable-glesv2 \
-	--disable-vg \
-	--disable-xlib \
-	--disable-xcb \
-	--without-x \
-	--disable-xlib-xrender \
-	--disable-ps \
-	--disable-pdf \
-	--enable-png \
-	--enable-script \
-	--disable-svg \
-	--disable-tee \
-	--disable-xml
+	-Dfontconfig=enabled \
+	-Dfreetype=enabled \
+	-Dpng=enabled \
+	-Dquartz=disabled \
+	-Dtee=disabled \
+	-Dxcb=disabled \
+	-Dxlib=disabled \
+	-Dzlib=enabled \
+	-Dtests=disabled \
+	-Dglib=enabled \
+	-Dspectre=disabled \
+	-Dsymbol-lookup=disabled \
+	-Dgtk_doc=false \
+	-Dc_std=gnu11
 HOST_CAIRO_DEPENDENCIES = \
 	host-freetype \
 	host-fontconfig \
 	host-libglib2 \
 	host-libpng \
 	host-pixman \
-	host-pkgconf
-
-# DirectFB svg support rely on Cairo and Cairo DirectFB support depends on
-# DirectFB. Break circular dependency by disabling DirectFB support in Cairo
-# (which is experimental)
-ifeq ($(BR2_PACKAGE_DIRECTFB)x$(BR2_PACKAGE_DIRECTFB_SVG),yx)
-CAIRO_CONF_OPTS += --enable-directfb
-CAIRO_DEPENDENCIES += directfb
-else
-CAIRO_CONF_OPTS += --disable-directfb
-endif
-
-ifeq ($(BR2_PACKAGE_FREETYPE),y)
-CAIRO_CONF_OPTS += --enable-ft
-CAIRO_DEPENDENCIES += freetype
-else
-CAIRO_CONF_OPTS += --disable-ft
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
-CAIRO_DEPENDENCIES += libexecinfo
-CAIRO_LIBS += -lexecinfo
-endif
-
-ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-CAIRO_CONF_OPTS += --enable-gobject
-CAIRO_DEPENDENCIES += libglib2
-else
-CAIRO_CONF_OPTS += --disable-gobject
-endif
-
-# Can use GL or GLESv2 but not both
-ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
-CAIRO_CONF_OPTS += --enable-gl --disable-glesv2
-CAIRO_DEPENDENCIES += libgl
-else
-ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
-CAIRO_CONF_OPTS += --disable-gl --enable-glesv2
-CAIRO_DEPENDENCIES += libgles
-else
-CAIRO_CONF_OPTS += --disable-gl --disable-glesv2
-endif
-endif
-
-ifeq ($(BR2_PACKAGE_HAS_LIBOPENVG),y)
-CAIRO_CONF_OPTS += --enable-vg
-CAIRO_DEPENDENCIES += libopenvg
-else
-CAIRO_CONF_OPTS += --disable-vg
-endif
+	host-pkgconf \
+	host-zlib
 
 ifeq ($(BR2_PACKAGE_LZO),y)
 CAIRO_DEPENDENCIES += lzo
 endif
 
-ifeq ($(BR2_PACKAGE_XORG7),y)
-CAIRO_CONF_OPTS += --enable-xlib --enable-xcb --with-x
-CAIRO_DEPENDENCIES += xlib_libX11 xlib_libXext
-else
-CAIRO_CONF_OPTS += --disable-xlib --disable-xcb --without-x
-endif
-
-ifeq ($(BR2_PACKAGE_XLIB_LIBXRENDER),y)
-CAIRO_CONF_OPTS += --enable-xlib-xrender
-CAIRO_DEPENDENCIES += xlib_libXrender
-else
-CAIRO_CONF_OPTS += --disable-xlib-xrender
-endif
-
-ifeq ($(BR2_PACKAGE_CAIRO_PS),y)
-CAIRO_CONF_OPTS += --enable-ps
-CAIRO_DEPENDENCIES += zlib
-else
-CAIRO_CONF_OPTS += --disable-ps
-endif
-
-ifeq ($(BR2_PACKAGE_CAIRO_PDF),y)
-CAIRO_CONF_OPTS += --enable-pdf
-CAIRO_DEPENDENCIES += zlib
+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+CAIRO_CONF_OPTS += -Dfreetype=enabled
+CAIRO_DEPENDENCIES += freetype
 else
-CAIRO_CONF_OPTS += --disable-pdf
+CAIRO_CONF_OPTS += -Dfreetype=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_CAIRO_PNG),y)
-CAIRO_CONF_OPTS += --enable-png
+CAIRO_CONF_OPTS += -Dpng=enabled
 CAIRO_DEPENDENCIES += libpng
 else
-CAIRO_CONF_OPTS += --disable-png
+CAIRO_CONF_OPTS += -Dpng=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_CAIRO_SCRIPT),y)
-CAIRO_CONF_OPTS += --enable-script
+ifeq ($(BR2_PACKAGE_CAIRO_TEE),y)
+CAIRO_CONF_OPTS += -Dtee=enabled
 else
-CAIRO_CONF_OPTS += --disable-script
+CAIRO_CONF_OPTS += -Dtee=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_CAIRO_SVG),y)
-CAIRO_CONF_OPTS += --enable-svg
+ifeq ($(BR2_PACKAGE_XORG7),y)
+CAIRO_CONF_OPTS += -Dxcb=enabled -Dxlib=enabled -Dxlib-xcb=enabled
+CAIRO_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXrender
 else
-CAIRO_CONF_OPTS += --disable-svg
+CAIRO_CONF_OPTS += -Dxcb=disabled -Dxlib=disabled -Dxlib-xcb=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_CAIRO_TEE),y)
-CAIRO_CONF_OPTS += --enable-tee
+ifeq ($(BR2_PACKAGE_CAIRO_ZLIB),y)
+CAIRO_CONF_OPTS += -Dzlib=enabled
+CAIRO_DEPENDENCIES += zlib
 else
-CAIRO_CONF_OPTS += --disable-tee
+CAIRO_CONF_OPTS += -Dzlib=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_CAIRO_XML),y)
-CAIRO_CONF_OPTS += --enable-xml
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+CAIRO_CONF_OPTS += -Dglib=enabled
+CAIRO_DEPENDENCIES += libglib2
 else
-CAIRO_CONF_OPTS += --disable-xml
+CAIRO_CONF_OPTS += -Dglib=disabled
 endif
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
