Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B551C4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 18:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 238B482038;
	Thu,  2 Nov 2023 18:55:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 238B482038
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EEndIhMFyoiR; Thu,  2 Nov 2023 18:55:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C08982039;
	Thu,  2 Nov 2023 18:55:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C08982039
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B9D1B1BF287
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 18:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F43D4F2C6
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 18:54:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F43D4F2C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fwqkrdOeUwmS for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 18:54:21 +0000 (UTC)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20E2D4F2C5
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 18:54:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20E2D4F2C5
Received: by mail-pj1-x1041.google.com with SMTP id
 98e67ed59e1d1-2809414efa9so1238638a91.1
 for <buildroot@buildroot.org>; Thu, 02 Nov 2023 11:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698951260; x=1699556060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BD3V80KBp1aZA2yZjBrRPP59EhYzCHAvqZE2hLBG9DI=;
 b=IaIMmKPxXCtHh3HIqvAyAGrseK061xPazOF5R1vMEuwEzksg/r79KeY4+DFEhd7EKg
 2F76Kp4HovAtsQqKSTPI7dIxTKdF89zdGeIK9szwLI4bOq3/26AYA0raVVSCNUf6tO92
 2LtnStypGTIu++Vt1XUU+/xmLwLnMZqFt8CjPyMyqmjFFV6wtJu8/ZuOBVnI8c9+fS6e
 q3fmpMC7yMpeTE/R+SjTbAacnSa8iVJID3LjP0rSnej3dkHh9aRgNAt7c/Uwc+4Ekayr
 ft4yELlGby1lX61Kqxnpv7Xiucvq8ik1hPVf9C0p5u/6KY/Lzb/lW9jmbzmSRGGBikr/
 EiTQ==
X-Gm-Message-State: AOJu0YxqDSwtKpX5h1tWUfdzrMRgg3utfB+YODPmGitQR0vasE8KEcGv
 TurFe/JitgJmh0PIBQFDDy4DYxlMTPqFWYTeo6KqZrmAGvA=
X-Google-Smtp-Source: AGHT+IE8q/SRjH3rcBTgZJ4b5s0O34guFcJT6pZ9FnvDY9YR/nU8PYDVazV0ZxlWC2rC7iVvJBaeOg==
X-Received: by 2002:a17:90b:4d12:b0:280:959c:660f with SMTP id
 mw18-20020a17090b4d1200b00280959c660fmr8198388pjb.27.1698951259736; 
 Thu, 02 Nov 2023 11:54:19 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 ge17-20020a17090b0e1100b0027cf8869ee7sm210962pjb.0.2023.11.02.11.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 11:54:18 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  2 Nov 2023 12:54:10 -0600
Message-ID: <20231102185411.51382-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231102185411.51382-1-adam.duskett@amarulasolutions.com>
References: <20231102185411.51382-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698951260; x=1699556060;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BD3V80KBp1aZA2yZjBrRPP59EhYzCHAvqZE2hLBG9DI=;
 b=rmoUbtwv5u4vPMHQaYnuHXrA/K9YGvAIUKL/wkAXBMKQ/sISA2cE9T7oti5e6r8NCn
 bOp8eHQwwL9RIWxungrLc74zomLReAWdhKvp5M8yky+dEa9gtoZgQnF9mcFiVVHmXO1w
 VXNoN8D056c/HfybNDh9D11p9KZXPhmcHDGh4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=rmoUbtwv
Subject: [Buildroot] [PATCH 4/5] package/flutter-pi: bump version to
 8f4e9726a18b32822b6e7faf19c044f88bded570
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
index f7148963a4..bb8f52c608 100644
--- a/package/flutter-pi/flutter-pi.hash
+++ b/package/flutter-pi/flutter-pi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e4af79c8f53c15913f52a83a221f099a2a750d023a0bc4560d0db6f15def79a2  flutter-pi-d62e84350d2869b3ec1dfb1af21bfe234c4b817f-br1.tar.gz
+sha256  ecb1557020afc22b30a4361230a4ed09be2493d420fed5e89cd93698a008a2fd  flutter-pi-8f4e9726a18b32822b6e7faf19c044f88bded570-br1.tar.gz
 sha256  b34df9d3e1b4e5d1ba70b1740ec74b69f1189b44efd0c96b898b074ef8db1c70  LICENSE
diff --git a/package/flutter-pi/flutter-pi.mk b/package/flutter-pi/flutter-pi.mk
index 27f140c177..491c074e13 100644
--- a/package/flutter-pi/flutter-pi.mk
+++ b/package/flutter-pi/flutter-pi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PI_VERSION = d62e84350d2869b3ec1dfb1af21bfe234c4b817f
+FLUTTER_PI_VERSION = 8f4e9726a18b32822b6e7faf19c044f88bded570
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
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
