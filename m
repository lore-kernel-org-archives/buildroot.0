Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE865C3ABD9
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 13:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47C76836A7;
	Wed, 14 May 2025 13:43:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id osEWAMyw7qjN; Wed, 14 May 2025 13:43:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2992C835F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2992C835F2;
	Wed, 14 May 2025 13:43:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0582B150
 for <buildroot@buildroot.org>; Wed, 14 May 2025 13:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAA4C40B49
 for <buildroot@buildroot.org>; Wed, 14 May 2025 13:43:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aj2mwA0tF6cX for <buildroot@buildroot.org>;
 Wed, 14 May 2025 13:43:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E1B994062E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1B994062E
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1B994062E
 for <buildroot@buildroot.org>; Wed, 14 May 2025 13:43:20 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ad23e8fcc38so90217366b.2
 for <buildroot@buildroot.org>; Wed, 14 May 2025 06:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747230198; x=1747834998;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3kC0G6Af+V9Z5DJq9mVy/YfAMt9IFeF1IZ5e0huVpVY=;
 b=HwdFO0zQTxD8Kq62C42wg/arKYj4Z6CawUtR8Hu2T/nXwfGVdDyQRspquV1j0pdv3H
 i9Q87yVH21o2qTozHLw9dr1AS5iteBy5KVT5zFkoNzMrn6DntacN081c+ZKnWEoyhYFB
 YybJsJW1By+Z47cG9o/NxWKgXPK4QqMpQbgNuuVvRIDI0KeYsDrlJyvUzShUGl0hcv5i
 HC6UCi28KadGuwpBcLxhY09QSCJNVFiF/mSSaH5dWIJSB48/OsXHIjiak+yi61My+rHu
 ZdSNqetS+FCt6qrkuuKjVA1OVsndS2OiqYU7/SEYjfagUYEKI1N28wgixD034ud1KrTF
 Jazg==
X-Gm-Message-State: AOJu0YyuSz0l+HSprey9dirU3NQ46CnyXVMlVMibcOM93z2xJAe/Ld/q
 wc5a+KZwxZtZTyftrph6kLOIi4xCFT3hKIii6+TK5sS8GTr9ddwtKqLn24eaUcxXTlzi8yNeIdY
 W
X-Gm-Gg: ASbGncskNvgo3tJxB1mad+brandddjec5doH7a5t+c0LX/UXE/qKW/B6doFwbs1Ofbq
 h6/UPQxbSzMJZ9J5AAnzbAgvV/jkWbisikmV9fyiaSzznZehrAvH2qnsO2rkqWZQHoZAOWGp0tT
 QH3yvyZJlYXSYxhEqAOsowAA4P7s2bVAE6PANpmmid1USfkrOu8jNmPgkjcclja1qr3lnhXu1Iy
 3UAdeS4IYz33iL2sHxhz6kLJUCrd+CgHSLkcSamNduPmQ9I2HEP4XkpncOtyAqDp8fwkg9zyi9m
 Ugo1OBc58PDd5TEsJEdW/R7pzYqB1fg4tkLbp+i/HYVf/Jj4eUE34o12Bp+YjHWVV2WX9sjqBwo
 DecvULK9C44EupHTUiSsZ87czZl4lv61+7C2pthCTp/5gudlBWWDs8+GlfyAA2x3xmt38rnapqd
 jmTRMbVyuO1WRj0BaGDlMr
X-Google-Smtp-Source: AGHT+IEGYQiN/KcaRSq1/BqkW8Aob4rnLleovNLWeUrrXEE4g6IYeJI9w5RurdJ9IQi/TWP+ZN1TWA==
X-Received: by 2002:a17:907:b11:b0:ad2:3c44:2a47 with SMTP id
 a640c23a62f3a-ad4f71294f7mr112597966b.5.1747230198183; 
 Wed, 14 May 2025 06:43:18 -0700 (PDT)
Received: from fedora.amarulasolutions.com
 (2001-1c00-8182-4700-cf31-04f3-d898-af42.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:cf31:4f3:d898:af42])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197bd3a6sm934783866b.131.2025.05.14.06.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 06:43:17 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 May 2025 15:43:09 +0200
Message-ID: <20250514134314.2405052-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514134314.2405052-1-adam.duskett@amarulasolutions.com>
References: <20250514134314.2405052-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747230198; x=1747834998;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3kC0G6Af+V9Z5DJq9mVy/YfAMt9IFeF1IZ5e0huVpVY=;
 b=OZVHQ2G+I+dTXaIWWLl7kiPjP6A3YQR5dGRLahKcdYydt7G8frXczwscC+mx9wjRKJ
 onNs3ged7g0A3f7cQFUAiiYbyx6ZLCoa70K+/U9E8aHl8Ms2T64tRoJtgDJIQMkShYZW
 fWZ9BwSOhIaUUWAye5YkJBN8CdSI6WNMpwtH8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=OZVHQ2G+
Subject: [Buildroot] [PATCH 1/6] package/wmenu: new package
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

wmenu is an efficient dynamic menu for Sway and wlroots based Wayland
compositors. It provides a Wayland-native dmenu replacement which
maintains the look and feel of dmenu.

Furthermore, as of commit b4401557, sway uses wmenu instead of dmenu-wayland
with the following commit message:

"""
Switch default config to wmenu-run
This removes the last dependency bit on dmenu. No need for
"swaymsg exec" anymore: wmenu-run handles the xdg-activation
shenanigans.
"""

As such, change sway/Config.in to select wmenu instead of dmenu-wayland when
a user selects swaybar.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/sway/Config.in   |  2 +-
 package/wmenu/Config.in  | 29 +++++++++++++++++++++++++++++
 package/wmenu/wmenu.hash |  3 +++
 package/wmenu/wmenu.mk   | 20 ++++++++++++++++++++
 6 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 package/wmenu/Config.in
 create mode 100644 package/wmenu/wmenu.hash
 create mode 100644 package/wmenu/wmenu.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c4d14aa875..b92b384253 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -44,6 +44,7 @@ F:	package/flutter-sdk-bin/
 F:	package/ivi-homescreen/
 F:	package/libutempter/
 F:	package/tllist/
+F:	package/wmenu/
 F:	support/testing/tests/package/test_flutter.py
 
 N:	Adam Heinrich <adam@adamh.cz>
diff --git a/package/Config.in b/package/Config.in
index a9074ac405..31856384c9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -338,6 +338,7 @@ comment "Graphic applications"
 	source "package/swaybg/Config.in"
 	source "package/tesseract-ocr/Config.in"
 	source "package/tinifier/Config.in"
+	source "package/wmenu/Config.in"
 
 comment "Graphic libraries"
 	source "package/cegui/Config.in"
diff --git a/package/sway/Config.in b/package/sway/Config.in
index d78f792c48..1f4b497af3 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -33,7 +33,7 @@ config BR2_PACKAGE_SWAY_SWAYBAR
 	bool "swaybar"
 	select BR2_PACKAGE_DEJAVU
 	select BR2_PACKAGE_JQ if BR2_PACKAGE_BASH_COMPLETION # Runtime
-	select BR2_PACKAGE_DMENU_WAYLAND # Runtime
+	select BR2_PACKAGE_WMENU # Runtime
 	help
 	  Enable support for swaybar
 
diff --git a/package/wmenu/Config.in b/package/wmenu/Config.in
new file mode 100644
index 0000000000..ce9e70f9f8
--- /dev/null
+++ b/package/wmenu/Config.in
@@ -0,0 +1,29 @@
+config BR2_PACKAGE_WMENU
+	bool "wmenu"
+	depends on BR2_USE_MMU # pango
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, pango, wayland
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango
+	depends on !BR2_STATIC_LIBS # wayland
+	depends on BR2_INSTALL_LIBSTDCPP # pango
+	depends on BR2_USE_WCHAR # libglib2, pango
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PNG
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBXKBCOMMON
+	select BR2_PACKAGE_PANGO
+	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
+	help
+	  wmenu is an efficient dynamic menu for Sway and wlroots based
+	  Wayland compositors. It provides a Wayland-native dmenu
+	  replacement which maintains the look and feel of dmenu.
+
+	  https://codeberg.org/adnano/wmenu
+
+comment "wmenu needs a toolchain w/ wchar, threads, C++, dynamic library, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || BR2_STATIC_LIBS || \
+		!BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
diff --git a/package/wmenu/wmenu.hash b/package/wmenu/wmenu.hash
new file mode 100644
index 0000000000..c4941001f4
--- /dev/null
+++ b/package/wmenu/wmenu.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  4e6aea3f8975fec720f6eb87aad620d5297a8a5a137615e4cf047e95d2b9d308  0.2.0.tar.gz
+sha256  500f0a221b2f3667676f6a084fb4e92ba4f74d09f45bc492e55aec4dd296bff2  LICENSE
diff --git a/package/wmenu/wmenu.mk b/package/wmenu/wmenu.mk
new file mode 100644
index 0000000000..7454dba8b9
--- /dev/null
+++ b/package/wmenu/wmenu.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# wmenu
+#
+################################################################################
+
+WMENU_VERSION = 0.2.0
+WMENU_SOURCE = $(WMENU_VERSION).tar.gz
+WMENU_SITE = https://codeberg.org/adnano/wmenu/archive
+WMENU_LICENSE = MIT
+WMENU_LICENSE_FILES = LICENSE
+WMENU_DEPENDENCIES = \
+	cairo \
+	pango \
+	wayland \
+	libxkbcommon \
+	wayland \
+	wayland-protocols
+
+$(eval $(meson-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
