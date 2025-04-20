Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16BCC369C2
	for <buildroot@archiver.kernel.org>; Sun, 20 Apr 2025 07:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3310A6088C;
	Sun, 20 Apr 2025 07:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wItIEYBWLALG; Sun, 20 Apr 2025 07:36:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FEC36082F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FEC36082F;
	Sun, 20 Apr 2025 07:36:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C310468
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 07:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3AE040451
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 07:36:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id djA0jcPaMxLS for <buildroot@buildroot.org>;
 Sun, 20 Apr 2025 07:36:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.46;
 helo=mail-wm1-f46.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 77E4D400D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77E4D400D0
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77E4D400D0
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 07:36:13 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso37215865e9.3
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 00:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745134571; x=1745739371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hUmf9dDb4jV1VTfd68LW0SuHsPXZ6zH9N7o7iyrP0lY=;
 b=hwXqGddRnZam0x1u6ZQtH4Wiwkk15OJ5rqzU/5QSAog3TFD4OEvaKHigQwv2ypfxE3
 aCnxr1BTRvzwrXU/pLbrpKw3KLI5OZA9Se40siI2OpWeKSxr4m8CnlufO/cg2lfsgPOi
 9ZUMlMNl/vCc4hTIbc8MO4umjfRPwmx/c0O4K6sYB8jlTD55IVS7aak0wzWLpkqLceNt
 hZUtljS/nIZIrp2KmDuhN6Blp2j0KauyWrHQ6xsPhn+Ou3l0gvZZ3ffFR3i8DmnAZ/XU
 u0mf/XXautjo92RX/vCrUMvY+4HwyZI08BmLTN5mDv/bdrB9T7wk30x/Yg/XID+EDQAx
 chfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdVfBfBXUWm8dRUpUu/ebBSiNHqS2BxrbhIUevw202yT8K1V7ou1QLuB8d8j++UrCu1VMIaaSx81U=@buildroot.org
X-Gm-Message-State: AOJu0Yyvy9dxJhNvjSPsIwzAovkmTfKxf6KqCyg+vy9D4wCUj7LLqnba
 vJBMZ8lzbBE4OvDaPphFYI9oNxyrh9ENCAiFLf3oaQiR+ipJAeqI
X-Gm-Gg: ASbGncswFUWAlWSQ2QLU+ZksSDibdrski6nKT9dD+5GTQZwzCqwml1FiextJs84f/7C
 UTVk/86ju8ACMDCCMjqnq2Ds951httZsGlhI8S/n+F0HGHuRbwVJ0ZNvTiSQeaFgotyEsFNXMoo
 rhPSNo+I0/FxfaQ+IFntEi9OdsmyiQmDr0CyrDtftvgehyyu6/ffPL8MdJTbEq2l31/VEkZWplA
 jj58lC2xsmw+NK7lWsCi9UlmHpYUVxgu9JzvwpQAQPCJOEmS6afItHu/Pvc0CCORnIPeSoyT+c6
 eYGsjZw5zRXN+xVHc/z4iWhHv05ZIsrc1g/dndNOcQJLPfYIB4Ae
X-Google-Smtp-Source: AGHT+IGYEMdrVyI2EslrHMm/7a1vgCjWHp+o9S5OBR6fsDz5jzpnxXkrijw4npi/RX4dm+xVUcGc6A==
X-Received: by 2002:a05:600c:3485:b0:43d:b32:40aa with SMTP id
 5b1f17b1804b1-4406ab6897fmr85189105e9.3.1745134571160; 
 Sun, 20 Apr 2025 00:36:11 -0700 (PDT)
Received: from localhost.localdomain ([87.66.230.131])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5bbc07sm90283125e9.17.2025.04.20.00.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Apr 2025 00:36:10 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: thomas@devoogdt.com
Cc: aperez@igalia.com,
	buildroot@buildroot.org
Date: Sun, 20 Apr 2025 09:36:08 +0200
Message-ID: <20250420073608.668902-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241216181045.757259-1-thomas@devoogdt.com>
References: <20241216181045.757259-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v4] package/webkitgtk: add libgtk4 support
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
v4: rebase to fix merge conflicts (Commit 6a47aa6 "package/webkitgtk: bump to 2.48.1")
---
 package/webkitgtk/Config.in    | 33 +++++++++++++++++++++++++--------
 package/webkitgtk/webkitgtk.mk | 21 +++++++++++++++++----
 2 files changed, 42 insertions(+), 12 deletions(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index bcb4b12fa3..7827dc6218 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -16,11 +16,12 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, NPTL, dynamic library, gcc >= 11, host gcc >= 4.9"
+comment "webkitgtk needs libgtk3 or libgtk4 and a toolchain w/ C++, wchar, NPTL, dynamic library, gcc >= 11, host gcc >= 4.9"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
+	depends on (!BR2_PACKAGE_LIBGTK3 && !BR2_PACKAGE_LIBGTK4) || \
+		!BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
 		!BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_USE_MMU
@@ -35,7 +36,7 @@ config BR2_PACKAGE_WEBKITGTK
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	depends on BR2_USE_WCHAR # icu, libsoup3
-	depends on BR2_PACKAGE_LIBGTK3
+	depends on BR2_PACKAGE_LIBGTK3 || BR2_PACKAGE_LIBGTK4
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
@@ -55,10 +56,10 @@ config BR2_PACKAGE_WEBKITGTK
 	select BR2_PACKAGE_WEBP_DEMUX
 	select BR2_PACKAGE_WEBP_MUX
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
@@ -67,6 +68,22 @@ config BR2_PACKAGE_WEBKITGTK
 
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
index 2c22bfb607..d139108126 100644
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
@@ -28,12 +28,19 @@ WEBKITGTK_CONF_OPTS = \
 	-DENABLE_WEB_RTC=OFF \
 	-DPORT=GTK \
 	-DUSE_AVIF=OFF \
-	-DUSE_GTK4=OFF \
 	-DUSE_LIBHYPHEN=OFF \
 	-DUSE_SKIA=OFF \
 	-DUSE_SYSTEM_SYSPROF_CAPTURE=OFF \
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
@@ -64,9 +71,15 @@ WEBKITGTK_CONF_OPTS += -DENABLE_WEBDRIVER=OFF
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
@@ -129,7 +142,7 @@ else
 WEBKITGTK_CONF_OPTS += -DUSE_GBM=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
+ifeq ($(BR2_PACKAGE_WEBKITGTK_X11),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_X11_TARGET=ON
 WEBKITGTK_DEPENDENCIES += libgl \
 	xlib_libXcomposite xlib_libXdamage xlib_libXrender xlib_libXt
@@ -137,7 +150,7 @@ else
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
