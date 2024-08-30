Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B9FCA0EFD
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 17:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC1BE6068F;
	Fri, 30 Aug 2024 17:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KZXWCLDhAPmn; Fri, 30 Aug 2024 17:52:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0020605F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0020605F1;
	Fri, 30 Aug 2024 17:52:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 343951BF2A5
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 17:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22184605F1
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 17:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xxfu9pcPjtAp for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 17:52:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.41;
 helo=mail-wm1-f41.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DAEBE605E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAEBE605E9
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DAEBE605E9
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 17:52:45 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-42bfb50e4e6so824925e9.2
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 10:52:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725040363; x=1725645163;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gnGv1+eddu3q3AhrmMS4mAXTC63Gfzvddqyoe7Xn9Vk=;
 b=Be4kUg60+xDrFHr3IYpCDQbD6A9ZRAyVHWLRYbH9yR51+D2Rs2YfvuXrztjHmaRbqf
 7RVA7a1zd5utPkEsMqQ2DfQZ4GdQ84UeCSxVaGdsZ1flhIoiWaXazn818nmtp0GXcc9R
 Dh9iXN93OVmvo2OmudjQSaNNQwbXD3O18FB1vJf1CkXHZyKoDEtR5jXkHzzC/EMU6g1m
 OohMhiyJ9WJFUKr3r7PQCzyZWeT+NKKN1e12P/+kttjee+GGhHD5XQZuOh6G9F4BbYEJ
 2u+cEm1I+B+tsUpeGTFeZ/g1jRzuppZ11tj2D3sNgJNyicGRMTqpCtQEcRtv6N3rCAmn
 es2g==
X-Gm-Message-State: AOJu0Yy6u+/iOyhwoTf2vdzFwxGLkVC60TAi6Tr9a2ugegbOmCaonasD
 cLWmEY/tOh9D/A8X/8pNPOeigiY9bBjhPrtJxbbZIDzWfm2dP9IeZFBADFwV
X-Google-Smtp-Source: AGHT+IHqqBeGE8JtYJi5lIioQiGBmThXPhaTzgPJt9Y2PEpTOgqPH4MncI9XQNo14b29AobI6xjWhw==
X-Received: by 2002:a05:600c:3550:b0:428:1310:b6b5 with SMTP id
 5b1f17b1804b1-42bb27bc4acmr63532365e9.34.1725040363073; 
 Fri, 30 Aug 2024 10:52:43 -0700 (PDT)
Received: from thomas-Precision-7670.barco.com
 ([2a02:a03f:eb68:2f00:84f8:dd6f:61cc:5673])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374b9859486sm1261069f8f.111.2024.08.30.10.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 10:52:42 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Fri, 30 Aug 2024 19:52:29 +0200
Message-ID: <20240830175229.2619362-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20230315085103.1671888-2-luke@ljones.dev>
References: <20230315085103.1671888-2-luke@ljones.dev>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/sdl2: enable wayland support
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
Cc: Michael Fischer <mf@go-sys.de>, Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/sdl2/Config.in | 17 +++++++++++++++++
 package/sdl2/sdl2.mk   |  8 +++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
index 7c8258fe73..ed24cbd9d7 100644
--- a/package/sdl2/Config.in
+++ b/package/sdl2/Config.in
@@ -29,6 +29,23 @@ comment "X11 video driver needs X.org"
 	depends on !BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU
 
+config BR2_PACKAGE_SDL2_WAYLAND
+	bool "Wayland video driver"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
+	depends on BR2_PACKAGE_WAYLAND
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_SDL2_OPENGLES
+	select BR2_PACKAGE_LIBXKBCOMMON
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
+
+comment "Wayland video driver needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "Wayland video driver needs wayland with an OpenGLES+EGL backend"
+	depends on !BR2_PACKAGE_WAYLAND || \
+		!BR2_PACKAGE_HAS_LIBEGL || \
+		!BR2_PACKAGE_SDL2_OPENGLES
+
 config BR2_PACKAGE_SDL2_KMSDRM
 	bool "KMS/DRM video driver"
 	depends on BR2_TOOLCHAIN_HAS_THREADS  # libdrm
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index d19bc0fb8f..a029e9d40f 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -23,7 +23,6 @@ SDL2_CONF_OPTS += \
 	--disable-video-vivante \
 	--disable-video-cocoa \
 	--disable-video-metal \
-	--disable-video-wayland \
 	--disable-video-dummy \
 	--disable-video-offscreen \
 	--disable-video-vulkan \
@@ -112,6 +111,13 @@ else
 SDL2_CONF_OPTS += --disable-video-x11-xcursor
 endif
 
+ifeq ($(BR2_PACKAGE_SDL2_WAYLAND),y)
+SDL2_DEPENDENCIES += libegl libxkbcommon wayland wayland-protocols
+SDL2_CONF_OPTS += --enable-video-wayland
+else
+SDL2_CONF_OPTS += --disable-video-wayland
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
 SDL2_DEPENDENCIES += xlib_libXi
 SDL2_CONF_OPTS += --enable-video-x11-xinput
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
