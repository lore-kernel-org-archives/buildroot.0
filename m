Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9593E77180
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 18:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C85D80CCF;
	Mon, 16 Dec 2024 18:10:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id swGyG1Obf5eT; Mon, 16 Dec 2024 18:10:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C17480D0C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C17480D0C;
	Mon, 16 Dec 2024 18:10:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 94599E3
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 18:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D809401A2
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 18:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YUq3RSslZ8wb for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 18:10:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.48;
 helo=mail-ed1-f48.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 025FB40191
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 025FB40191
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 025FB40191
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 18:10:52 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5d647d5df90so4603736a12.2
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 10:10:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734372650; x=1734977450;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Khn4sIm1jeA8+eNn72xxv92OKN/7z/nYoKCfx5M6osI=;
 b=qTKnGuC2yzFqbgyvce3/NRwc11h5APq1MoIq1tQjp85miXqWMZjIqYRX5AhEQ0WM5v
 FUG1YYX7Z+jwmnp9+m95WUOF6Jy//kVcNvWvx/rqbwvFc6ibRbiuzA6gqWnoyYMALqCB
 B3QqKZLYDdBId7s7fI8B6HyrBDnI004AXgSPYW1k8umJHqH1die3QfszV+lQzZONqPqT
 2lYXwVTDwzkQ3sJlNS3vqidwnEcKssJNLGqGTXnPifktFjt4AjPXOrlr6KK8F7Ketaqk
 XHA+hqc84YOVcX1Yilxq4Xk87DgJSKRHrDxOrakR/BEcYXtqSiytJXGAWGEEHBHXaNQt
 /Aig==
X-Gm-Message-State: AOJu0Yy/7HxLMym365eRyjyXihqUENePr8uq/vDaxHpz3KmKTkICECDG
 M7Q/j0yWuVzxqXmHsZ9SLo7IkxV9/up72M0U511cr+2XON+fzJgKoz7Jis0i
X-Gm-Gg: ASbGncuojbP/SSX9/7gg5LaTKnUF9sN3E6m6bmtpjCuVIACnL/QZJmVLJgxQjFz4Gpm
 CXSCFKap4eyq9EpZYds6n9Y0RNaYFvstGvK6unclK9bQICDfFtvnP5i3tKBKw6AQJMSOPgoweVi
 nvtbZ75AWd6nkZ25hWdwtNcTvegWHrmCLHJGWNJieo28FK7oatA1kuTOhJSiFm9Kf1DuYqPZMLl
 GJ7J5a3Azl9QxbiE5MQvOyXfVM73AnKIhjkWyDbOFC+bUFENzespN+gCP6sNKapgL9zD4vsBdIK
X-Google-Smtp-Source: AGHT+IEHu4AkY2UVFVYdDZL2OfFKo5AltXii64O1d5X3vhNrnRWsPw5Eqt1yrtFGhwMLvcDw5zB8CA==
X-Received: by 2002:a05:6402:2548:b0:5d3:baa3:29f with SMTP id
 4fb4d7f45d1cf-5d63c30afbdmr11662391a12.9.1734372649690; 
 Mon, 16 Dec 2024 10:10:49 -0800 (PST)
Received: from thomas-Precision-7670.home
 ([2a02:a03f:eb68:2f00:9c94:3a1:94:d6bf])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d652f25acesm3407592a12.62.2024.12.16.10.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 10:10:49 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Mon, 16 Dec 2024 19:10:44 +0100
Message-ID: <20241216181045.757259-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240917203231.1240125-1-thomas@devoogdt.com>
References: <20240917203231.1240125-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v3] package/webkitgtk: add libgtk4 support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WebKitGTK defaults on GTK4 since version 2.44 [1],
and the libgtk4 package was added in commit faf2a1d,
so start using it. Note that webkitgtk-6.0 is the new API
if compile with GTK4 [2].

[1] https://webkitgtk.org/2024/03/27/webkigit-2.44.html
[2] https://webkitgtk.org/reference/webkitgtk/stable/migrating-to-webkitgtk-6.0.html

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: rebase to add support for the MiniBrowser
v3: rebase to fix merge conflicts
---
 package/webkitgtk/Config.in    | 33 +++++++++++++++++++++++++--------
 package/webkitgtk/webkitgtk.mk | 21 +++++++++++++++++----
 2 files changed, 42 insertions(+), 12 deletions(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index dca62cf0f8..2f7fbf523a 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -16,11 +16,12 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, NPTL, dynamic library, gcc >= 10, host gcc >= 4.9"
+comment "webkitgtk needs libgtk3 or libgtk4 and a toolchain w/ C++, wchar, NPTL, dynamic library, gcc >= 10, host gcc >= 4.9"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
+	depends on (!BR2_PACKAGE_LIBGTK3 && !BR2_PACKAGE_LIBGTK4) || \
+		!BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
 		!BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_USE_MMU
@@ -35,7 +36,7 @@ config BR2_PACKAGE_WEBKITGTK
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_USE_WCHAR # icu, libsoup3
-	depends on BR2_PACKAGE_LIBGTK3
+	depends on BR2_PACKAGE_LIBGTK3 || BR2_PACKAGE_LIBGTK4
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
@@ -54,10 +55,10 @@ config BR2_PACKAGE_WEBKITGTK
 	select BR2_PACKAGE_WEBP
 	select BR2_PACKAGE_WEBP_DEMUX
 	select BR2_PACKAGE_WOFF2
-	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_LIBGTK3_X11
-	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_LIBGTK3_X11
-	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_LIBGTK3_X11
-	select BR2_PACKAGE_XLIB_LIBXT if BR2_PACKAGE_LIBGTK3_X11
+	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_WEBKITGTK_X11
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_WEBKITGTK_X11
+	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_WEBKITGTK_X11
+	select BR2_PACKAGE_XLIB_LIBXT if BR2_PACKAGE_WEBKITGTK_X11
 	help
 	  WebKit is an open source, standards compliant web browser
 	  engine.
@@ -66,6 +67,22 @@ config BR2_PACKAGE_WEBKITGTK
 
 if BR2_PACKAGE_WEBKITGTK
 
+comment "webkitgtk X11 target needs the X11 GDK backend"
+	depends on !BR2_PACKAGE_LIBGTK3_X11 && !BR2_PACKAGE_LIBGTK4_X11
+
+config BR2_PACKAGE_WEBKITGTK_X11
+	bool "enable x11 target"
+	default y
+	depends on BR2_PACKAGE_LIBGTK3_X11 || BR2_PACKAGE_LIBGTK4_X11
+
+comment "webkitgtk Wayland target needs the Wayland GDK backend"
+	depends on !BR2_PACKAGE_LIBGTK3_WAYLAND && !BR2_PACKAGE_LIBGTK4_WAYLAND
+
+config BR2_PACKAGE_WEBKITGTK_WAYLAND
+	bool "enable wayland target"
+	default y
+	depends on BR2_PACKAGE_LIBGTK3_WAYLAND || BR2_PACKAGE_LIBGTK4_WAYLAND
+
 config BR2_PACKAGE_WEBKITGTK_SANDBOX
 	bool "sandboxing support"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index ecdb3c788c..e326bb9512 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -14,7 +14,7 @@ WEBKITGTK_LICENSE_FILES = \
 	Source/WebCore/LICENSE-LGPL-2.1
 WEBKITGTK_CPE_ID_VENDOR = webkitgtk
 WEBKITGTK_DEPENDENCIES = host-ruby host-python3 host-gperf host-unifdef \
-	enchant harfbuzz icu jpeg libegl libepoxy libgcrypt libgtk3 libsecret \
+	enchant harfbuzz icu jpeg libegl libepoxy libgcrypt libsecret \
 	libsoup3 libtasn1 libxml2 libxslt sqlite webp woff2
 
 WEBKITGTK_CMAKE_BACKEND = ninja
@@ -28,10 +28,17 @@ WEBKITGTK_CONF_OPTS = \
 	-DENABLE_WEB_RTC=OFF \
 	-DPORT=GTK \
 	-DUSE_AVIF=OFF \
-	-DUSE_GTK4=OFF \
 	-DUSE_LIBHYPHEN=OFF \
 	-DUSE_WOFF2=ON
 
+ifeq ($(BR2_PACKAGE_LIBGTK4),y)
+WEBKITGTK_CONF_OPTS += -DUSE_GTK4=ON
+WEBKITGTK_DEPENDENCIES += libgtk4
+else
+WEBKITGTK_CONF_OPTS += -DUSE_GTK4=OFF
+WEBKITGTK_DEPENDENCIES += libgtk3
+endif
+
 ifeq ($(BR2_PACKAGE_WEBKITGTK_SANDBOX),y)
 WEBKITGTK_CONF_OPTS += \
 	-DENABLE_BUBBLEWRAP_SANDBOX=ON \
@@ -62,9 +69,15 @@ WEBKITGTK_CONF_OPTS += -DENABLE_WEBDRIVER=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_WEBKITGTK_MINIBROWSER),y)
+ifeq ($(BR2_PACKAGE_LIBGTK4),y)
+define WEBKITGTK_INSTALL_MINIBROWSER_SYMLINK
+	ln -sf ../libexec/webkitgtk-6.0/MiniBrowser $(TARGET_DIR)/usr/bin/MiniBrowser
+endef
+else
 define WEBKITGTK_INSTALL_MINIBROWSER_SYMLINK
 	ln -sf ../libexec/webkit2gtk-4.1/MiniBrowser $(TARGET_DIR)/usr/bin/MiniBrowser
 endef
+endif
 WEBKITGTK_POST_INSTALL_TARGET_HOOKS += WEBKITGTK_INSTALL_MINIBROWSER_SYMLINK
 WEBKITGTK_CONF_OPTS += -DENABLE_MINIBROWSER=ON
 else
@@ -120,7 +133,7 @@ else
 WEBKITGTK_CONF_OPTS += -DUSE_GBM=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
+ifeq ($(BR2_PACKAGE_WEBKITGTK_X11),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_X11_TARGET=ON
 WEBKITGTK_DEPENDENCIES += libgl \
 	xlib_libXcomposite xlib_libXdamage xlib_libXrender xlib_libXt
@@ -128,7 +141,7 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_X11_TARGET=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND),y)
+ifeq ($(BR2_PACKAGE_WEBKITGTK_WAYLAND),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=ON
 else
 WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=OFF
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
