Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5BDCA101C
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 11:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACA1640185;
	Sat, 31 Aug 2024 11:36:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QSiqDblQGDyc; Sat, 31 Aug 2024 11:36:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16E5640015
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16E5640015;
	Sat, 31 Aug 2024 11:36:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A7A181BF484
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 11:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A228240251
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 11:36:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ievi5uesUyU for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 11:36:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.44;
 helo=mail-wm1-f44.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 37F4E40111
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37F4E40111
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 37F4E40111
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 11:36:32 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-42c79deb7c4so2741695e9.3
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 04:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725104190; x=1725708990;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SBnKn7estFO4xvvO8k9DxMF8O4U/vsYew58XZDpOyc4=;
 b=FAeyHy6rNc0gmxgam/tcVPB891ah8PlA6QAsBPFdldQBjNqxuBj9EAglfTIhodNH4+
 LN2fi4pwz2HA3i2I+O2WjaaMDoFGuOsYQt/tuC5rxI/vfN+RDaYVXOdH4Vm3sXhCmITf
 +fZadDqKtLZSeBLvc0KWiaPUTxasWWTnWlwFyoCQ/0uNMc26F01kSyqYpmguewl6Kggp
 Zv890kHcfNvNClbuGC31jLTPda40wKiazO93YJSvQWQwRER5IBB8qC+WAb07XpAzuWUq
 g6CipVR2+gAPnWIWF6c/NWx8TT5cqwo+xDMl9qkyaVmxAS9maWImRXwawGhCQZ1CWcIL
 FmNg==
X-Gm-Message-State: AOJu0YxgKLZ1FLUdxMlTlObR/JZOVjvBpf0YR5uqEuUMkEgPuE2dcA7q
 3+FxhIZ6pJWBEsD251OwuNC0v/bCs7XqAQ54DC/Q5EpHEbFsfjVzPh72T01q
X-Google-Smtp-Source: AGHT+IHd+UhGg2+lG3Ke7qG8RmSamn9ihvhmaw3kt+BR2HvQoCN5H1QDWFSRj8LgoHfTw6rcK32/Yg==
X-Received: by 2002:a05:600c:3d18:b0:426:5c9b:dee6 with SMTP id
 5b1f17b1804b1-42c7b5d8f7fmr4698825e9.26.1725104189445; 
 Sat, 31 Aug 2024 04:36:29 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:d3c8:da3f:79f7:89e5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c29aa150sm572196f8f.101.2024.08.31.04.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Aug 2024 04:36:28 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 13:36:25 +0200
Message-ID: <20240831113626.105125-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/webkitgtk: add libgtk4 support
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
so start using it.

[1] https://webkitgtk.org/2024/03/27/webkigit-2.44.html

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/webkitgtk/Config.in    | 33 +++++++++++++++++++++++++--------
 package/webkitgtk/webkitgtk.mk | 15 +++++++++++----
 2 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 8ee90dda1c..a556fec194 100644
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
index 468fefab0e..5115f3eec5 100644
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
@@ -103,7 +110,7 @@ else
 WEBKITGTK_CONF_OPTS += -DUSE_GBM=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
+ifeq ($(BR2_PACKAGE_WEBKITGTK_X11),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_X11_TARGET=ON
 WEBKITGTK_DEPENDENCIES += libgl \
 	xlib_libXcomposite xlib_libXdamage xlib_libXrender xlib_libXt
@@ -111,7 +118,7 @@ else
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
