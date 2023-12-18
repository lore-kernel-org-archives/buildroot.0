Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C90DC35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 18:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38DC341932;
	Mon, 18 Dec 2023 18:55:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38DC341932
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 90YVSvWwhc_m; Mon, 18 Dec 2023 18:55:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60DEF4192D;
	Mon, 18 Dec 2023 18:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60DEF4192D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 965D21BF20B
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6ED9B60AE8
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:54:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ED9B60AE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EOxW_An4uWau for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 18:54:49 +0000 (UTC)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 173F960AC2
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 18:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 173F960AC2
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5c701bd98f3so1260072a12.1
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 10:54:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702925687; x=1703530487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g8WNX0UtepYGBX3graDQg0JbdGO5rqmqYsrQmP5dzvQ=;
 b=HdTTdr7od3PB139F10F0dDF20R9Pta4FO86ZSJcorgyyix6ozb33eqB1TCD2XehTO8
 UvG2R7Aa9o3txlvw6rGuqzMYrEbVIFogh1xVHagisPFW3w5P/NQfWlsFXdL6Rba7h4FE
 E6tn9I3lQTPQWmzZB5uCiOlw0GR3MbFC0rFZlsjoYUXvUYVxJF402oEXxnErTjmJtgUi
 HqDKgYWoszpbbwREbj3ESLy57G7TDoMnf6u2dNakQS7K5DlWLML9Jx3HP1qfGz8kDJsl
 FmgP08BJvf/uwuwFblAaJdQw9MX4J9eDUREpgUiBqXnL9VIATOt9k226owJJINdKz4ab
 PFNA==
X-Gm-Message-State: AOJu0Yw3+LiUWuqOSb/ryD9CxFjrCiEO0yChO+HBOGRU0uvWi+PEGman
 sGkCJA3v3fNo35MO5vsU+7xPucN89tEYglLGr9A=
X-Google-Smtp-Source: AGHT+IGR9a5FIXqXYh1jOpQlkv68wV7RY+YUX7iMxhOnn69N6lRAwxxthJFqFHlsk6bAWKW7k2IxIQ==
X-Received: by 2002:a17:90a:4603:b0:286:5965:1f6e with SMTP id
 w3-20020a17090a460300b0028659651f6emr7346190pjg.10.1702925687610; 
 Mon, 18 Dec 2023 10:54:47 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a17090ac00500b00285cc7a867esm21890580pjt.0.2023.12.18.10.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 10:54:47 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 11:54:31 -0700
Message-ID: <20231218185440.506995-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218185440.506995-1-adam.duskett@amarulasolutions.com>
References: <20231218185440.506995-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702925687; x=1703530487;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g8WNX0UtepYGBX3graDQg0JbdGO5rqmqYsrQmP5dzvQ=;
 b=QuBtCqNgQWTenz5rSlBONReTOJHTFdGDqok/bpeVI8BViQxwV6TyfHewN+t1NX7c2/
 rqHc0EviaucaNFL1dGoIo7Q/r9n4yiBgFu6tIMJuOUvapJj62ZB6tI1KwUJIFDu74s+J
 C2lOL0eS6rO6lWAEL796PvMpemOdCmJfBXsv0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=QuBtCqNg
Subject: [Buildroot] [PATCH v2 05/13] package/flutter-pi: bump version to
 f34d7bdbda713ba607b9625541ddfa314d9999a0
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop upstream 0001-src-egl_gbm_render_surface-properly-fallback-to-surf.patch
- Disable new charset converter plugin.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Add to series, bump to f34d7bdbda713ba607b9625541ddfa314d9999a0

 ...er_surface-properly-fallback-to-surf.patch | 59 -------------------
 package/flutter-pi/flutter-pi.hash            |  2 +-
 package/flutter-pi/flutter-pi.mk              |  3 +-
 3 files changed, 3 insertions(+), 61 deletions(-)
 delete mode 100644 package/flutter-pi/0001-src-egl_gbm_render_surface-properly-fallback-to-surf.patch

diff --git a/package/flutter-pi/0001-src-egl_gbm_render_surface-properly-fallback-to-surf.patch b/package/flutter-pi/0001-src-egl_gbm_render_surface-properly-fallback-to-surf.patch
deleted file mode 100644
index 7a1a49b3d4..0000000000
--- a/package/flutter-pi/0001-src-egl_gbm_render_surface-properly-fallback-to-surf.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 856f9849763535d62ed01b538ba23905875c93f4 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Tue, 26 Sep 2023 20:31:17 +0200
-Subject: [PATCH] src/egl_gbm_render_surface: properly fallback to surface with
- no modifier
-
-In 869fa7fcfbeb, we added a fallback to be able to create an EGL sruface
-when the driver do not support modifiers, like the llvmpipe software
-renderer (or like some proprietary drivers, like the MALI ones), as
-reported in #269 [0].
-
-However, in c6537673c9b6, there was a big overhaul of renderer
-infrastructure. That commit lost the with-modifiers code path and only
-kept the without-modifiers fallback one (i.e. it only kept the call to
-gbm_surface_create(), not to gbm_surface_create_with_modifiers()).
-
-Then in b0d09f5032a4, the with-modifier code path was re-instated, but
-in a way that made it exclusive with the without-modifiers one. That is,
-the without-modifiers code path was not a fallback to when the other
-failed.
-
-Re-instate the fallback mechanism as intiially implemented.
-
-[0] https://github.com/ardera/flutter-pi/issues/269
-
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
-Upstream: https://github.com/ardera/flutter-pi/pull/367
----
- src/egl_gbm_render_surface.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/src/egl_gbm_render_surface.c b/src/egl_gbm_render_surface.c
-index ce9e5e7..8a58667 100644
---- a/src/egl_gbm_render_surface.c
-+++ b/src/egl_gbm_render_surface.c
-@@ -146,6 +146,7 @@ static int egl_gbm_render_surface_init(
-     }
- #endif
- 
-+    gbm_surface = NULL;
-     if (allowed_modifiers != NULL) {
-         gbm_surface = gbm_surface_create_with_modifiers(
-             gbm_device,
-@@ -158,9 +159,10 @@ static int egl_gbm_render_surface_init(
-         if (gbm_surface == NULL) {
-             ok = errno;
-             LOG_ERROR("Couldn't create GBM surface for rendering. gbm_surface_create_with_modifiers: %s\n", strerror(ok));
--            return ok;
-+            LOG_ERROR("Will retry without modifiers\n");
-         }
--    } else {
-+    }
-+    if (gbm_surface == NULL) {
-         gbm_surface = gbm_surface_create(
-             gbm_device,
-             size.x,
--- 
-2.25.1
-
diff --git a/package/flutter-pi/flutter-pi.hash b/package/flutter-pi/flutter-pi.hash
index f7148963a4..6c5371d18a 100644
--- a/package/flutter-pi/flutter-pi.hash
+++ b/package/flutter-pi/flutter-pi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e4af79c8f53c15913f52a83a221f099a2a750d023a0bc4560d0db6f15def79a2  flutter-pi-d62e84350d2869b3ec1dfb1af21bfe234c4b817f-br1.tar.gz
+sha256  cf10ca9e26beea036ccf218e6a900de5f1f2000e00c03e7a48898c2a0c99f591  flutter-pi-f34d7bdbda713ba607b9625541ddfa314d9999a0-br1.tar.gz
 sha256  b34df9d3e1b4e5d1ba70b1740ec74b69f1189b44efd0c96b898b074ef8db1c70  LICENSE
diff --git a/package/flutter-pi/flutter-pi.mk b/package/flutter-pi/flutter-pi.mk
index 27f140c177..4ec89bdfad 100644
--- a/package/flutter-pi/flutter-pi.mk
+++ b/package/flutter-pi/flutter-pi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PI_VERSION = d62e84350d2869b3ec1dfb1af21bfe234c4b817f
+FLUTTER_PI_VERSION = f34d7bdbda713ba607b9625541ddfa314d9999a0
 FLUTTER_PI_SITE = https://github.com/ardera/flutter-pi.git
 FLUTTER_PI_SITE_METHOD = git
 FLUTTER_PI_LICENSE = MIT
@@ -27,6 +27,7 @@ FLUTTER_PI_CONF_OPTS = \
 	-DENABLE_VULKAN=OFF \
 	-DFILESYSTEM_LAYOUT=meta-flutter \
 	-DLINT_EGL_HEADERS=OFF \
+	-DBUILD_CHARSET_CONVERTER_PLUGIN=OFF \
 	-DTRY_BUILD_GSTREAMER_AUDIO_PLAYER_PLUGIN=OFF \
 	-DTRY_BUILD_GSTREAMER_VIDEO_PLAYER_PLUGIN=OFF \
 	-DTRY_ENABLE_OPENGL=OFF \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
