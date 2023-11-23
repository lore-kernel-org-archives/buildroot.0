Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3F2C27C40
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 00:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE28181F11;
	Thu, 23 Nov 2023 00:09:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE28181F11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qi8QfI4AXKKM; Thu, 23 Nov 2023 00:09:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCAE481F17;
	Thu, 23 Nov 2023 00:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCAE481F17
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4870C1BF4D6
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 00:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2157941759
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 00:08:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2157941759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2h98ARc5g2mm for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 00:08:35 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CE74415FB
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 00:08:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CE74415FB
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6cb749044a2so382312b3a.0
 for <buildroot@buildroot.org>; Wed, 22 Nov 2023 16:08:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700698113; x=1701302913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UEM/MaaoYORX/HSIMjpG0X1PB5/ak6eGqIBtibX6e2Y=;
 b=Tz1f7gDeg875aLBIEUIPC9bbhr9aW+/XyDQLi30mUYx5Oy79BaUjrsDq9kRfHArjtM
 9bB4Q0JxBTXdyXJYVbzyym2mE0mCEjwwA7KNcxXxUkYthSeb5MWA0ANwTSqbQbNsMjQo
 Ytue+QreimMrLg1BX8uSSSh1DWiddZcl7ljP54ekDgp1JX5Jqp2u5AU3TU18eTBW3vFk
 dk8BDin+7jNy7JsDVRnzOqirrcdPh/9IRqfQrd7tluAkHECEYnxd5VzY96nfpXlPGp7E
 IrXlmc0JObgwZ3R98xdlNdO32RK+oJHJjTg42NrPC1DVp77nAURTFvdffzmn2e3vqOJB
 7Yrw==
X-Gm-Message-State: AOJu0YwQOONh30o+cMOj7llpKKh84JBrG1ThcEaSgM7TR0QIlvKkbDtm
 At12As1mjCxDZ29+1r4vnNSmeTBteMoREr56mXI=
X-Google-Smtp-Source: AGHT+IG7U3i29A8TJ67XiGvJaZiYZSd9r0VDNK4M1Lt3pvp6obdo9gCMB1zq9LJPmeWcp5f3WWz1mQ==
X-Received: by 2002:a05:6a00:4387:b0:6cb:e3c5:7cb3 with SMTP id
 bt7-20020a056a00438700b006cbe3c57cb3mr868416pfb.16.1700698113185; 
 Wed, 22 Nov 2023 16:08:33 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.200.138])
 by smtp.gmail.com with ESMTPSA id
 fb6-20020a056a002d8600b006cb907e8059sm56858pfb.9.2023.11.22.16.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 16:08:32 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 Nov 2023 17:08:12 -0700
Message-ID: <20231123000819.488595-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
References: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700698113; x=1701302913;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UEM/MaaoYORX/HSIMjpG0X1PB5/ak6eGqIBtibX6e2Y=;
 b=grWed3ZZjVKYzhzT5v0x+V3VXvkV1KlFBV5tPXlK7GzeODVIbVJkDUirMYBm7ZOihq
 6ulhmtqsETmoIWEitYXdvS1PeZaA7z/b2b3Yzwf55i7Tp1rWfavijcpYmOHcN9jgh5i7
 7FgeTsoXme8B7V8lq6uCdJ3FYuwiV+PPlNum4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=grWed3ZZ
Subject: [Buildroot] [PATCH/next 06/13] package/foot: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is the default terminal sway uses.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
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
index a8cdd8e5a9..f368cb5d06 100644
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
index 6d0e84c4c4..891a862349 100644
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
index 0000000000..1b99ed9518
--- /dev/null
+++ b/package/foot/foot.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  0e02af376e5f4a96eeb90470b7ad2e79a1d660db2a7d1aa772be43c7db00e475  1.16.2.tar.gz
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
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
