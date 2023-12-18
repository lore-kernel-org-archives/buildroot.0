Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB47EC35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 19:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85E3041B1A;
	Mon, 18 Dec 2023 19:41:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85E3041B1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ijJ8ublqEj-4; Mon, 18 Dec 2023 19:41:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EC39404E1;
	Mon, 18 Dec 2023 19:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EC39404E1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AB5CF1BF3DC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91C5D60BEB
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91C5D60BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bLbim-OXYFOD for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 19:40:14 +0000 (UTC)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83AA360B50
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 19:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83AA360B50
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1d0c4d84bf6so16057955ad.1
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 11:40:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702928413; x=1703533213;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0fMjvcmu8mNLWlbVKXU9HF56xvEVswaDUbWtVFU8STY=;
 b=B3EGleq5TLoPFN/GA4oaX7W4wha+HOtGOstvNu/s7Nex2NQu9OBtyOe9KjBOumRoWz
 jvHMfJAKvH8rd13zbTIaYNaAeuZRb27qJcsbQ0+98ZEeiDHE8+y/L6ssT0Q3UU5ZlvRY
 RCY+kjD8QZLkD/h9Z7Xn68Z9ml5Y62ngoCLb4hYB83pacItIN5IHzEnD+0gtP13qyVk4
 5Rq66HQtvjCCVsljQalOEBSkUGJotw0glfcBCSBuRqT95CTlXeexf2vee4eYm0JFw2g4
 /8Olcf2GM73UtTt9mRzmaxh9S8olIVpH4FOPqJaKRXxcgBCMBMRLCls4nJi/UWww6k5+
 Ud+Q==
X-Gm-Message-State: AOJu0Yx8LSJH7xcQvIjLVM/kx31JY3lkiioPIR1Len4UOvgJm72ClmdR
 rnW6YOYLz7awf1ihaMTn3dG8NWVBK1+gz0eUrys=
X-Google-Smtp-Source: AGHT+IF9cPW/u1KBS7FsS1c88g4onIgJATRSFCJ3+qDv7r5CBLM6mbvM23jbO+qNL+JCxLb+RGd3IA==
X-Received: by 2002:a17:902:64c8:b0:1d3:ce15:305c with SMTP id
 y8-20020a17090264c800b001d3ce15305cmr953840pli.128.1702928413020; 
 Mon, 18 Dec 2023 11:40:13 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 jj20-20020a170903049400b001cfbd3f38dcsm2983808plb.225.2023.12.18.11.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 11:40:12 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 12:39:52 -0700
Message-ID: <20231218194001.544887-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
References: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702928413; x=1703533213;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0fMjvcmu8mNLWlbVKXU9HF56xvEVswaDUbWtVFU8STY=;
 b=rsuFe8N0o3QPdsIjfx8eHYxzz8MiVAKYOgvo/uAbO88XP4To9JrgBsNi8fU85SjhsR
 0B/nkQJALQqZXiyxV4jxpiLBNV9x22Q1HvnsZ+ODmw5ij5TxXfu98jTiSQ/loIdJtKJZ
 +FqSHoRlndZMr1pXyjtQv1zgglWuYeYaB+mKk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=rsuFe8N0
Subject: [Buildroot] [PATCH v2 07/14] package/foot: new package
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
v1 -> v2: v1 -> v2: Fix the sha256sum of 1.16.2.tar.gz

 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/foot/Config.in | 36 +++++++++++++++++++++++++++++
 package/foot/foot.hash |  3 +++
 package/foot/foot.mk   | 51 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 92 insertions(+)
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
index 2887538147..1096a4cc81 100644
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
index 0000000000..ab965bedf5
--- /dev/null
+++ b/package/foot/foot.mk
@@ -0,0 +1,51 @@
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
+	libutempter \
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
