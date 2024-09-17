Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84AF8CAC59E
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 20:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C0E6817AD;
	Tue, 17 Sep 2024 20:32:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O7nMPs3WIdcu; Tue, 17 Sep 2024 20:32:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30745817AF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30745817AF;
	Tue, 17 Sep 2024 20:32:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 209561BF2C3
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 20:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FE78607A5
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 20:32:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k8F-T1atPtP2 for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 20:32:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.54;
 helo=mail-wm1-f54.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B07D3606B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B07D3606B1
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B07D3606B1
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 20:32:37 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-42bb7298bdeso63746045e9.1
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 13:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726605155; x=1727209955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BeqdsUQfBwChHb6D6BO353RaO2XVJYg/lpr6QaGDXwY=;
 b=jSCxa6II2c6FavY+/82/qMT45be/PF28TH83EINa5GtSarb+5nswsBdJS1mP4GGhXg
 W1ARZ5s8QdrxYNyZPTm6GJbuEEtxJvplVIB1vrPkImNtWuy74vhawE5A5B0JhSZ787pM
 qCsYj+1e84fhkFiKIaWfygoybwgkq14TQYJV0y+bRDp1YafI44apSvfjtI7NAllv2Voa
 ovKMOPaB3f/AUAsQTKKpsfoi26VeeHR5h1yrVGquI8a/m7cDKFjpnqlkf+3kilcOi/t8
 ju6K50eOYxQT+5YnpHQxl3KRj4P1vkHEfgqp7d+I9RMnpI7M41DcUAbZqyLhReKqr+lv
 dt3Q==
X-Gm-Message-State: AOJu0YwCWGR/JeGnurI0+d3HtOgpddisz/XNDTbZMyHwR19W0HC5/shW
 cdSQfyIEEzs+MnNIkOwZuG2nHAdp/isApYEKBd+8W3iPClJEr8gagWURwzaV
X-Google-Smtp-Source: AGHT+IFFrGjSCgnc+v2odiPr8fexwzLeaeLlNd85LhFgLOO+4O5KhWIJgSVvYcfwf6s32Qj4MRWCUA==
X-Received: by 2002:a05:600c:3588:b0:42c:bcc8:5882 with SMTP id
 5b1f17b1804b1-42d9070a259mr178991615e9.7.1726605154421; 
 Tue, 17 Sep 2024 13:32:34 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:eb68:2f00:2841:ccc:4e90:c28])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42da222da80sm113953565e9.0.2024.09.17.13.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 13:32:33 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 22:32:31 +0200
Message-ID: <20240917203231.1240125-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240831113626.105125-1-thomas@devoogdt.com>
References: <20240831113626.105125-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v2] package/webkitgtk: add libgtk4 support
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
 Thomas Devoogdt <thomas@devoogdt.com>
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
---
 package/webkitgtk/Config.in    | 33 +++++++++++++++++++++++++--------
 package/webkitgtk/webkitgtk.mk | 21 +++++++++++++++++----
 2 files changed, 42 insertions(+), 12 deletions(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index e6ab405cd5..06d981aaff 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -16,11 +16,12 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 10, host gcc >= 4.9"
+comment "webkitgtk needs libgtk3 or libgtk4 and a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 10, host gcc >= 4.9"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+	depends on (!BR2_PACKAGE_LIBGTK3 && !BR2_PACKAGE_LIBGTK4) || \
+		!BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
 		!BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_USE_MMU
@@ -35,7 +36,7 @@ config BR2_PACKAGE_WEBKITGTK
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup3
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
index 19740b3b4e..5ecc1d1d09 100644
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
@@ -113,7 +126,7 @@ else
 WEBKITGTK_CONF_OPTS += -DUSE_GBM=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
+ifeq ($(BR2_PACKAGE_WEBKITGTK_X11),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_X11_TARGET=ON
 WEBKITGTK_DEPENDENCIES += libgl \
 	xlib_libXcomposite xlib_libXdamage xlib_libXrender xlib_libXt
@@ -121,7 +134,7 @@ else
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
