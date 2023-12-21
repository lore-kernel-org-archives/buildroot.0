Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93333C46CCD
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 15:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 475624259F;
	Thu, 21 Dec 2023 15:36:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 475624259F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AqOe7iNjVJMZ; Thu, 21 Dec 2023 15:36:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38B564264A;
	Thu, 21 Dec 2023 15:36:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38B564264A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 82D051BF381
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 15:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C06542597
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 15:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C06542597
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7EUbtuonUjuO for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 15:36:26 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C06A423F2
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 15:36:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C06A423F2
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1d3eabe9321so6242225ad.2
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 07:36:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703172985; x=1703777785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CI3FAaihf6QJGe+Q1KD12j7KWW8OyF6Pe8b55CDonmQ=;
 b=oLrVMeHaQZJbwdt4nBolpgUaDnrMF2vuFbjAW8WsM1MC328AydYrRl5tQqOt8b5dpa
 /JvFuyex0N/x1zewDv1N2mI78Zt4eGQ3HP/YAjzGftknhKJ/xYYw3ziJxTBVj0CyW7dS
 hAEcY9Ix3qATSmf/MYLHj3VHePoHyM+KPIRaLXivbyGhtdLDftzxjTFJY9a5p8/6brqX
 T6pJugeFopfKeqeKMZI7AxdYKxEKspt23eSAYc0W3d0hT1AdQfSUPRdoAHdvpTEq9SVw
 fnRBx1jxK5Siq9TrPYCnZLEqGd794C33HLaZW5IPYpwBLtH9rWX3f3goRjgY6pMe4vJV
 AIaQ==
X-Gm-Message-State: AOJu0YwuAL09itu101Ii5Mg0qgfPkBgjaIx45r7LGH7n1XE/WBok6SAR
 y9thJWvam95LG9cCKyg7P/ATPUu6Y2Z7/0RXYxQ=
X-Google-Smtp-Source: AGHT+IEYbmuKeKgRh9jIELivJCZi8z+PZyDAWUtQT76ewSHGl9y0j+GRDASuICnKev3Dny0oHf0gMQ==
X-Received: by 2002:a17:902:b197:b0:1d0:84f1:6fc5 with SMTP id
 s23-20020a170902b19700b001d084f16fc5mr11560220plr.88.1703172985395; 
 Thu, 21 Dec 2023 07:36:25 -0800 (PST)
Received: from DESKTOP-OI0KN2B.ht.home (174-126-58-188.cpe.sparklight.net.
 [174.126.58.188]) by smtp.gmail.com with ESMTPSA id
 g24-20020a170902fe1800b001d0c41b1d03sm1792029plj.32.2023.12.21.07.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 07:36:24 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 21 Dec 2023 08:36:12 -0700
Message-ID: <20231221153620.237439-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221153620.237439-1-adam.duskett@amarulasolutions.com>
References: <20231221153620.237439-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703172985; x=1703777785;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CI3FAaihf6QJGe+Q1KD12j7KWW8OyF6Pe8b55CDonmQ=;
 b=Iq75uu3ui5vEIlEk4hjHEhCxSp9UHNYO1dcb/s+5loDe35xKIIK5WonhbFJ4Iajmly
 uElgs6iZv7vPEz3vK5se5ZMNxHI1U+N2N6j+tI3MJvuoP/+qLAAfRwqmTsa7Q1zgysRB
 P6dkGbYDDNi70b+WF9SVuwgGFCWWiDJMQng08=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Iq75uu3u
Subject: [Buildroot] [PATCH v4 03/10] package/foot: new package
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
