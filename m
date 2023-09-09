Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27B4EEB57F
	for <buildroot@archiver.kernel.org>; Sat,  9 Sep 2023 07:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E32981E0B;
	Sat,  9 Sep 2023 07:58:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E32981E0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gtScm0eNp7Eu; Sat,  9 Sep 2023 07:58:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D679F81E6E;
	Sat,  9 Sep 2023 07:58:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D679F81E6E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D6F211BF28C
 for <buildroot@lists.busybox.net>; Sat,  9 Sep 2023 07:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0C5B822E3
 for <buildroot@lists.busybox.net>; Sat,  9 Sep 2023 07:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0C5B822E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vzs8D6jFiW_Q for <buildroot@lists.busybox.net>;
 Sat,  9 Sep 2023 07:58:08 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F57D830FB
 for <buildroot@buildroot.org>; Sat,  9 Sep 2023 07:58:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F57D830FB
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-401da71b7faso32452065e9.2
 for <buildroot@buildroot.org>; Sat, 09 Sep 2023 00:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694246286; x=1694851086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NM+vvreQPVvnKIdY/PUmLt9+C1oYXWQAXo4TmXQTsIc=;
 b=PznPxP+gHzbrG105ebJRMFWWPKgcuZUns3HgXdLZXBR0w/VRDXuZmgc/zcht+1QEJ3
 zxe9umEymFWNGt6arlf2NlFs3R1rseNRpYRaK40XrXf38TIQbShJ0F3XCm1Wn6znJvWA
 +TeBO8zXnUeRd3VHN5oBQ5sHPSIITG6B6KUUMVkq9NcqUeg6to51zEvwSNhQ9FF3SuUo
 7b3zvnk0WEfmN1ZhTLMzO2qn7ehgR0i9X/mjkYpeoUXQhzfssn4zWGlq5cvGvRWeHZOc
 tQriKY0R1/ceRCCdRKj81siwnMla5zdMu65Z7picaTAVXwCKsxrIwCmxojasadlDELdV
 whaA==
X-Gm-Message-State: AOJu0YwSGaNVT/T3NWQdow04aS3Kwk7Dkb46B92ex7xz3/VeBuNVosjw
 MjAmCD3k3ZdT17fpeJNerEZtzXxAEkFM3w==
X-Google-Smtp-Source: AGHT+IFJMNvPll7Ijr1hcs2CCrmrf9hfRkgHQs7cPvjwiVTBG2zCbPANW0/20+smOPvwOsy4jTFdyg==
X-Received: by 2002:a7b:c3d0:0:b0:3fe:22a9:907 with SMTP id
 t16-20020a7bc3d0000000b003fe22a90907mr3653782wmj.20.1694246285950; 
 Sat, 09 Sep 2023 00:58:05 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:f478:a81f:8ede:9814])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a1c4b0c000000b003fee9cdf55esm3833262wma.14.2023.09.09.00.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Sep 2023 00:58:05 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat,  9 Sep 2023 09:57:53 +0200
Message-Id: <20230909075753.7471-4-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230909075753.7471-1-thomas@devoogdt.com>
References: <20230909075753.7471-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 4/4] package/webkitgtk: add a
 USE_OPENGL_OR_ES config option
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

OpenGL or GLES support is not mandatory, so make if configurable.
The default was -DUSE_OPENGL_OR_ES=ON, so keep it that way.

It's a quite complex dependency matrix to select libgl, libgles, and libegl.
So for simplicity, always depend on them if the corresponding BR2_PACKAGE_HAS flag is set.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v2: no change
---
 package/webkitgtk/Config.in    | 10 ++++++++++
 package/webkitgtk/webkitgtk.mk | 24 +++++++++++++++++++-----
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 6835467c46..748e529208 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -65,6 +65,16 @@ config BR2_PACKAGE_WEBKITGTK
 
 if BR2_PACKAGE_WEBKITGTK
 
+config BR2_PACKAGE_WEBKITGTK_OPENGL_OR_ES
+	bool "OpenGL or GLES support"
+	default y
+	depends on BR2_PACKAGE_HAS_LIBGBM
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
+
+comment "OpenGL or GLES support needs an OpenGL or GLES backend, libgbm"
+	depends on !BR2_PACKAGE_HAS_LIBGBM
+	depends on !BR2_PACKAGE_HAS_LIBGL && !BR2_PACKAGE_HAS_LIBGLES
+
 config BR2_PACKAGE_WEBKITGTK_SANDBOX
 	bool "sandboxing support"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 88bdfae27b..39dcaddcd8 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -32,6 +32,12 @@ WEBKITGTK_CONF_OPTS = \
 	-DUSE_OPENJPEG=ON \
 	-DUSE_WOFF2=ON
 
+ifeq ($(BR2_PACKAGE_WEBKITGTK_OPENGL_OR_ES),y)
+WEBKITGTK_CONF_OPTS += -DUSE_OPENGL_OR_ES=ON
+else
+WEBKITGTK_CONF_OPTS += -DUSE_OPENGL_OR_ES=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_WEBKITGTK_SANDBOX),y)
 WEBKITGTK_CONF_OPTS += \
 	-DENABLE_BUBBLEWRAP_SANDBOX=ON \
@@ -83,7 +89,6 @@ endif
 # Use GLES if available and desktop GL is not.
 ifeq ($(BR2_PACKAGE_HAS_LIBGL):$(BR2_PACKAGE_HAS_LIBGLES),:y)
 WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=ON
-WEBKITGTK_DEPENDENCIES += libgles
 else
 WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=OFF
 endif
@@ -97,7 +102,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_X11_TARGET=ON
-WEBKITGTK_DEPENDENCIES += libgl \
+WEBKITGTK_DEPENDENCIES += \
 	xlib_libXcomposite xlib_libXdamage xlib_libXrender xlib_libXt
 else
 WEBKITGTK_CONF_OPTS += -DENABLE_X11_TARGET=OFF
@@ -105,13 +110,22 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=ON
-WEBKITGTK_DEPENDENCIES += libegl
 else
 WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=OFF
 endif
 
-# If only the GTK Broadway backend is enabled, EGL is still needed.
-ifeq ($(BR2_PACKAGE_LIBGTK3_X11):$(BR2_PACKAGE_LIBGTK3_WAYLAND):$(BR2_PACKAGE_LIBGTK3_BROADWAY),::y)
+# required for ENABLE_X11_TARGET, USE_OPENGL_OR_ES
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+WEBKITGTK_DEPENDENCIES += libgl
+endif
+
+# required for ENABLE_GLES2, USE_OPENGL_OR_ES
+ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
+WEBKITGTK_DEPENDENCIES += libgles
+endif
+
+# required for ENABLE_WAYLAND_TARGET, BROADWAY
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
 WEBKITGTK_DEPENDENCIES += libegl
 endif
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
