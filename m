Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FDAC3DA6E
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 00:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 635F541EB1;
	Thu, 21 Dec 2023 00:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 635F541EB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5kSjMGrgk8II; Thu, 21 Dec 2023 00:19:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6759642150;
	Thu, 21 Dec 2023 00:19:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6759642150
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E41A1BF408
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 00:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4797842124
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 00:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4797842124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gmx4t7-Vx6Qw for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 00:19:32 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3DF0F42118
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 00:19:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DF0F42118
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1d3e8a51e6bso2315225ad.3
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 16:19:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703117971; x=1703722771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lbwjfWG+sXz4TmugO+rj/tAXlVmxn0VxJEjFd3pJDBI=;
 b=k/NFpUMLrnKEkGOOVKOViyBFnLJJQckhxEOJh4qjF0CIkFFpCML+4k3Wm5fAPi6XWA
 HRmaW9ceMd6Do94rMe57UadhYqsw1SHCzG3LMKXgbzmURxncqNKPiZJV7JjldPFc/RV/
 dusIku0sNMIWS7Fhb7n5SARD9QRQCz4zK6uIDHVk/vGg4v6bNN0CgYS4S/szmG1b2j8A
 XzDdzv6ZHErgU2uU0o67MOn3O48cOBGfVAVNYJrZMjNdg7MVwWJf88TMhmm3JhY6foGu
 CFvy+5tBASz3HfwMhocTR+bzLz4HDF0uLiaAfxIApKqDSqAVRflFFF+oGX34zCfrgggi
 GyAw==
X-Gm-Message-State: AOJu0Yzz7qtXEioAXbqnLr5uoU+ldg5ysS1hW63/4eYAL0VLZHISS4xT
 T3jKeBbLcdfAQDpe6JBpplzfz0AXIjrN31PqkyI=
X-Google-Smtp-Source: AGHT+IFSERus9AQwqOqgx+S7aacZQJPJer89Wl4DTGP4NErebDJmHXmF72A5/Mrtcdy+Lej39dfkOQ==
X-Received: by 2002:a17:902:e54b:b0:1d0:b3f5:c318 with SMTP id
 n11-20020a170902e54b00b001d0b3f5c318mr23974996plf.106.1703117970733; 
 Wed, 20 Dec 2023 16:19:30 -0800 (PST)
Received: from DESKTOP-OI0KN2B.ht.home (174-126-58-188.cpe.sparklight.net.
 [174.126.58.188]) by smtp.gmail.com with ESMTPSA id
 a5-20020a170902ecc500b001d364210979sm294459plh.224.2023.12.20.16.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 16:19:29 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 17:19:17 -0700
Message-ID: <20231221001924.1356215-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221001924.1356215-1-adam.duskett@amarulasolutions.com>
References: <20231221001924.1356215-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703117971; x=1703722771;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lbwjfWG+sXz4TmugO+rj/tAXlVmxn0VxJEjFd3pJDBI=;
 b=fSp4u5VFzIubbdb8FysdpAbhHfkPg/M1ZvYFIV9jdNvfIDzj4XYHQU7EEGqXsSAiRy
 xLHozmDA2huNlqVPWJma0VvDryibeWqXBdX+pYBDmw9mGQrm9esoP7fOACvmjta5ZQgo
 VO+XYvRfhv4Ys1IwSlaNojGAm04eyZVqXCf5w=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=fSp4u5VF
Subject: [Buildroot] [PATCH v3 03/10] package/foot: new package
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

This is the default terminal sway uses.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v2 -> v3: Removed libutempter as a unconditional dependency (whoops!)

 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/foot/Config.in | 36 ++++++++++++++++++++++++++++++
 package/foot/foot.hash |  3 +++
 package/foot/foot.mk   | 50 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 91 insertions(+)
 create mode 100644 package/foot/Config.in
 create mode 100644 package/foot/foot.hash
 create mode 100644 package/foot/foot.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 027604e495..66a037516f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -35,6 +35,7 @@ N:	Adam Duskett <adam.duskett@amarulasolutions.com>
 F:	package/depot-tools/
 F:	package/dmenu-wayland/
 F:	package/fcft/
+F:	package/foot/
 F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-pi/
diff --git a/package/Config.in b/package/Config.in
index cf5d1aee68..251003222a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -314,6 +314,7 @@ comment "Graphic applications"
 	source "package/cage/Config.in"
 	source "package/cog/Config.in"
 	source "package/dmenu-wayland/Config.in"
+	source "package/foot/Config.in"
 	source "package/fswebcam/Config.in"
 	source "package/ghostscript/Config.in"
 	source "package/glmark2/Config.in"
diff --git a/package/foot/Config.in b/package/foot/Config.in
new file mode 100644
index 0000000000..a3894c5469
--- /dev/null
+++ b/package/foot/Config.in
@@ -0,0 +1,36 @@
+config BR2_PACKAGE_FOOT
+	bool "foot"
+	depends on !BR2_STATIC_LIBS # wayland -> dlfcn.h
+	depends on BR2_TOOLCHAIN_HAS_THREADS # fcft, wayland
+	select BR2_PACKAGE_FCFT
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_LIBXKBCOMMON
+	select BR2_PACKAGE_PIXMAN
+	select BR2_PACKAGE_TLLIST
+	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
+	help
+	  A fast, lightweight and minimalistic Wayland terminal
+	  emulator.
+	  NOTE: foot needs a working UTF-8 locale (BR2_GENERATE_LOCALE)
+
+	  https://codeberg.org/dnkl/foot
+
+if BR2_PACKAGE_FOOT
+
+config BR2_PACKAGE_FOOT_GRAPHEME_CLUSTERING
+	bool "grapheme-clustering"
+	select BR2_PACKAGE_UTF8PROC
+	help
+	  Enables grapheme clustering.
+
+config BR2_PACKAGE_FOOT_THEMES
+	bool "themes"
+	help
+	  Install themes (predefined color schemes)
+
+endif # BR2_PACKAGE_FOOT
+
+comment "foot needs a toolchain w/ dynamic library, threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/foot/foot.hash b/package/foot/foot.hash
new file mode 100644
index 0000000000..f3bf0f6058
--- /dev/null
+++ b/package/foot/foot.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  8060ec28cbf6e2e3d408665330da4bc48fd094d4f1265d7c58dc75c767463c29  1.16.2.tar.gz
+sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
diff --git a/package/foot/foot.mk b/package/foot/foot.mk
new file mode 100644
index 0000000000..1595e2a718
--- /dev/null
+++ b/package/foot/foot.mk
@@ -0,0 +1,50 @@
+################################################################################
+#
+# foot
+#
+################################################################################
+
+FOOT_VERSION = 1.16.2
+FOOT_SOURCE = $(FOOT_VERSION).tar.gz
+FOOT_SITE = https://codeberg.org/dnkl/foot/archive
+FOOT_LICENSE = MIT
+FOOT_LICENSE_FILES = LICENSE
+FOOT_DEPENDENCIES = \
+	fcft \
+	fontconfig \
+	freetype \
+	libxkbcommon \
+	pixman \
+	tllist \
+	wayland \
+	wayland-protocols
+
+FOOT_CONF_OPTS = \
+	-Ddocs=disabled \
+	-Dtests=false
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+FOOT_DEPENDENCIES += systemd
+endif
+
+ifeq ($(BR2_PACKAGE_LIBUTEMPTER),y)
+FOOT_DEPENDENCIES += libutempter
+FOOT_CONF_OPTS += -Dutmp-backend='libutempter'
+else
+FOOT_CONF_OPTS += -Dutmp-backend='none'
+endif
+
+ifeq ($(BR2_PACKAGE_FOOT_GRAPHEME_CLUSTERING),y)
+FOOT_DEPENDENCIES += utf8proc
+FOOT_CONF_OPTS += -Dgrapheme-clustering=enabled
+else
+FOOT_CONF_OPTS += -Dgrapheme-clustering=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_FOOT_THEMES),y)
+FOOT_CONF_OPTS += -Dthemes=true
+else
+FOOT_CONF_OPTS += -Dthemes=false
+endif
+
+$(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
