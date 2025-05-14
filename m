Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A178C3ABD8
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 13:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9A8D414D2;
	Wed, 14 May 2025 13:43:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SsIuCbXRVt56; Wed, 14 May 2025 13:43:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1B1740B7E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1B1740B7E;
	Wed, 14 May 2025 13:43:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CC1FC153
 for <buildroot@buildroot.org>; Wed, 14 May 2025 13:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDE0E404EC
 for <buildroot@buildroot.org>; Wed, 14 May 2025 13:43:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XgcoLdVM_xua for <buildroot@buildroot.org>;
 Wed, 14 May 2025 13:43:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8734540E1F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8734540E1F
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8734540E1F
 for <buildroot@buildroot.org>; Wed, 14 May 2025 13:43:22 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5fca00812dbso1233765a12.1
 for <buildroot@buildroot.org>; Wed, 14 May 2025 06:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747230200; x=1747835000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5zOn58ksHRPRkGP6JBD7wTW1f4AXWG6eJA4foaEnEtQ=;
 b=tCHHKi1wTp5R4o7ACJ/ZI1LtNBJvPxINkFDZYpNS28KtMvOCwbP5l/tQdEnQl79c3G
 f/W3CCKLQ0lm2WN4FEtdVVIGLvd9vZpe78S0VOq6Tuzq6vcvxuMyMKyYtNi3gffmdI+O
 PSbb8E2P8jOr3CZ3CGG35o0DjKsl752f+iWLgXLkMgT2cp168NYpL0pJIK3+t1b1KTkU
 xO0uVGEeOW6uddmlF1nnbVxToBBMia3Lll1MrMWq1vFM+EDJKaM+AN3Ee99aGOlo887j
 U9EoLzqJJ/B/vB1KAxop/lJD9/+rSnxAuiDC5w0rUS2e+jaNwE3o5SC92ekVE9Osc5fu
 WemA==
X-Gm-Message-State: AOJu0YzR9q/zDDQmw6ZRA/v8XCOxIbkWh0Mw85/4OSJeztcODVJ9qZcO
 hSa7K4kLZy56I4Uh6tTuNGjLcpUFN3nfGvOH7AoYflf8zmYmysZFSW+bkUrIR8vmLmwTQoPZIUO
 b
X-Gm-Gg: ASbGnct26Xxh6+/mbAWq0T9IDJtdlfT887JUAE27/U8Sp4lNpAhks/f5/Sjv1i9luZg
 GQsmqtB6MkuvKmt1gb/kwSXdwKYyXMLINKXMh0blUoYE/Q9G4FRU4/cgBXCeBzBuDjhea0VeTXY
 kXucf5Jg9xWit/NvXcOSeVQtFYccHwjDWwj5PFsBEz/PzzsSmpLnJY8zCgboS9IARaDTo7QIA90
 qDwQ46Lv0Z/1d3dztt+fxHzPiEu3P+3k6i195O3w7Ay0fhBC64pJ/1Po/9EXoRwD2t1NbH6GImZ
 WprkRbWtGBgDvy3S/R44vwXTDZOAUOZdnEyJ0LeK+ZZ2S+FTKT0Uo6Wil0dKXM7qbg/bMK7FR+w
 5ECVVxQWPqAMS/DvqwQB+kp7lbagRtYXg1n/uS6kG5kDRER29ttB3rZ0AIe5u6tZL49iQtNwMbu
 PKjSRCaQ2DjEVdcDpd15tf
X-Google-Smtp-Source: AGHT+IH+6krIFO3nMKHw9yGUn7j2y/GuxGLbHbffWAOVtNG0fdrCGVS/Vv7a+QZnuiFYbWEwLbbDDw==
X-Received: by 2002:a05:6402:524c:b0:5e0:a4ae:d486 with SMTP id
 4fb4d7f45d1cf-5ff988d7d6dmr1059172a12.7.1747230199600; 
 Wed, 14 May 2025 06:43:19 -0700 (PDT)
Received: from fedora.amarulasolutions.com
 (2001-1c00-8182-4700-cf31-04f3-d898-af42.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:cf31:4f3:d898:af42])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197bd3a6sm934783866b.131.2025.05.14.06.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 06:43:18 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 May 2025 15:43:10 +0200
Message-ID: <20250514134314.2405052-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514134314.2405052-1-adam.duskett@amarulasolutions.com>
References: <20250514134314.2405052-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747230200; x=1747835000;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5zOn58ksHRPRkGP6JBD7wTW1f4AXWG6eJA4foaEnEtQ=;
 b=C4raNwdNhCvWWYTEk2GUgoKlFhEWfgLOAv9kM56TETeNhkLdnzL4kfq5Qzbz8zIw2S
 mJd7HamQ3KeciXUQGWmD+WKwb7kbyGG3AqLdhQG2VONf1zcYOLFI1xfC935ylTLSzI74
 FuE2dCexzFuKiSFVsiWqO66KLheH7ENIvMTnw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=C4raNwdN
Subject: [Buildroot] [PATCH 2/6] package/dmenu-wayland: remove package
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

The package has been abandoned for several years. The only package that
previously relied on dmenu-wayland was the swaybar option for the sway package,
and that option now relies on wmenu.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 Config.in.legacy                              |  9 ++++++
 DEVELOPERS                                    |  1 -
 package/Config.in                             |  1 -
 .../0001-support-cross-compilation.patch      | 32 -------------------
 package/dmenu-wayland/Config.in               | 27 ----------------
 package/dmenu-wayland/dmenu-wayland.hash      |  3 --
 package/dmenu-wayland/dmenu-wayland.mk        | 29 -----------------
 7 files changed, 9 insertions(+), 93 deletions(-)
 delete mode 100644 package/dmenu-wayland/0001-support-cross-compilation.patch
 delete mode 100644 package/dmenu-wayland/Config.in
 delete mode 100644 package/dmenu-wayland/dmenu-wayland.hash
 delete mode 100644 package/dmenu-wayland/dmenu-wayland.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 02dc3eab73..ca445f4f09 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -143,6 +143,15 @@ comment "----------------------------------------------------"
 endif
 
 ###############################################################################
+comment "Legacy options removed in 2025.08"
+
+config BR2_PACKAGE_DMENU_WAYLAND
+	bool "dmenu-wayland has been removed"
+	help
+	  The package has been abandoned for several years.
+	  The only package that previously relied on dmenu-wayland
+	  was sway, and that now relies on wmenu. Please select
+	  wmenu instead.
 
 comment "Legacy options removed in 2025.05"
 
diff --git a/DEVELOPERS b/DEVELOPERS
index b92b384253..a15cff2ea7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -28,7 +28,6 @@
 
 N:	Adam Duskett <adam.duskett@amarulasolutions.com>
 F:	package/depot-tools/
-F:	package/dmenu-wayland/
 F:	package/fcft/
 F:	package/foot/
 F:	package/flutter-engine/
diff --git a/package/Config.in b/package/Config.in
index 31856384c9..a7dd6f7dcd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -313,7 +313,6 @@ menu "Graphic libraries and applications (graphic/text)"
 comment "Graphic applications"
 	source "package/cage/Config.in"
 	source "package/cog/Config.in"
-	source "package/dmenu-wayland/Config.in"
 	source "package/flutter-packages/Config.in"
 	source "package/flutter-pi/Config.in"
 	source "package/foot/Config.in"
diff --git a/package/dmenu-wayland/0001-support-cross-compilation.patch b/package/dmenu-wayland/0001-support-cross-compilation.patch
deleted file mode 100644
index 3d99330cba..0000000000
--- a/package/dmenu-wayland/0001-support-cross-compilation.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From cd72cade6250a3ec46dd402b25a0bd55bbb97a88 Mon Sep 17 00:00:00 2001
-From: Rick van Schijndel <rol3517@gmail.com>
-Date: Wed, 20 Dec 2023 16:44:12 -0700
-Subject: [PATCH] support cross-compilation
-
-Marking wayland-scanner as native dependency fixes the path check for
-wayland-scanner.
-
-Upstream: https://github.com/nyyManni/dmenu-wayland/pull/23
-
-Signed-off-by: Rick van Schijndel <rol3517@gmail.com>
-Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 3ae6f69..8d401ff 100644
---- a/meson.build
-+++ b/meson.build
-@@ -26,7 +26,7 @@ pangocairo          = dependency('pangocairo')
- rt                  = cc.find_library('rt')
- wayland_client      = dependency('wayland-client')
- wayland_protos      = dependency('wayland-protocols')
--wayland_scanner_dep = dependency('wayland-scanner')
-+wayland_scanner_dep = dependency('wayland-scanner', native: true)
- wayland_scanner     = find_program(
-   wayland_scanner_dep.get_pkgconfig_variable('wayland_scanner')
- )
--- 
-2.43.0
-
diff --git a/package/dmenu-wayland/Config.in b/package/dmenu-wayland/Config.in
deleted file mode 100644
index 8a4d0918dc..0000000000
--- a/package/dmenu-wayland/Config.in
+++ /dev/null
@@ -1,27 +0,0 @@
-config BR2_PACKAGE_DMENU_WAYLAND
-	bool "dmenu-wayland"
-	depends on BR2_USE_MMU # pango
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, pango, wayland
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango
-	depends on !BR2_STATIC_LIBS # wayland
-	depends on BR2_INSTALL_LIBSTDCPP # pango
-	depends on BR2_USE_WCHAR # libglib2, pango
-	select BR2_PACKAGE_CAIRO
-	select BR2_PACKAGE_CAIRO_PNG
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBXKBCOMMON
-	select BR2_PACKAGE_PANGO
-	select BR2_PACKAGE_WAYLAND
-	select BR2_PACKAGE_WAYLAND_PROTOCOLS
-	help
-	  dmenu-wl is an efficient dynamic menu for wayland (wlroots).
-
-	  https://github.com/nyyManni/dmenu-wayland
-
-comment "dmenu-wayland needs a toolchain w/ wchar, threads, C++, dynamic library, gcc >= 4.9"
-	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || BR2_STATIC_LIBS || \
-		!BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
diff --git a/package/dmenu-wayland/dmenu-wayland.hash b/package/dmenu-wayland/dmenu-wayland.hash
deleted file mode 100644
index 1248c4ad66..0000000000
--- a/package/dmenu-wayland/dmenu-wayland.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  56340e198a2c58468c6109f3bb07ab8a074487e67b0758b29c9d4fdce7c4d594  dmenu-wayland-a380201dff5bfac2dace553d7eaedb6cea6855f9.tar.gz
-sha256  8d26bccf8a21c5e29dc756beef534403c935766c815bbb6e7eab0598632b9827  LICENSE
diff --git a/package/dmenu-wayland/dmenu-wayland.mk b/package/dmenu-wayland/dmenu-wayland.mk
deleted file mode 100644
index fec984194c..0000000000
--- a/package/dmenu-wayland/dmenu-wayland.mk
+++ /dev/null
@@ -1,29 +0,0 @@
-################################################################################
-#
-# dmenu-wayland
-#
-################################################################################
-
-DMENU_WAYLAND_VERSION = a380201dff5bfac2dace553d7eaedb6cea6855f9
-DMENU_WAYLAND_SITE = $(call github,nyyManni,dmenu-wayland,$(DMENU_WAYLAND_VERSION))
-DMENU_WAYLAND_LICENSE = MIT
-DMENU_WAYLAND_LICENSE_FILES = LICENSE
-DMENU_WAYLAND_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
-
-# host-wayland is for wayland-scanner
-DMENU_WAYLAND_DEPENDENCIES = \
-	host-wayland \
-	cairo \
-	libglib2 \
-	libxkbcommon \
-	pango \
-	wayland \
-	wayland-protocols
-
-# By default, sway calls dmenu not dmenu-wl
-define DMENU_WAYLAND_SYMLINK_DMENU_WL
-	ln -sf dmenu-wl $(TARGET_DIR)/usr/bin/dmenu
-endef
-DMENU_WAYLAND_POST_INSTALL_TARGET_HOOKS += DMENU_WAYLAND_SYMLINK_DMENU_WL
-
-$(eval $(meson-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
