Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3F8C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 19:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94EE7415EC;
	Mon, 18 Dec 2023 19:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94EE7415EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yKCMpUtXm7Ix; Mon, 18 Dec 2023 19:40:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7FD04181E;
	Mon, 18 Dec 2023 19:40:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7FD04181E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC39F1BF3DC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A511E60BEB
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A511E60BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bv5ofA2Z9JO3 for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 19:40:09 +0000 (UTC)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66DD760B50
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 19:40:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66DD760B50
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1d393e5d325so13109945ad.2
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 11:40:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702928408; x=1703533208;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nI0/xnruyXutJatZ2MBMNrsRo31ivtO6yYvX351yDOo=;
 b=VlpuIOUQN7CsTcEXoZPBytwdHdkwTUZ8xZ23FDkbQ+NW6zWNSaWEFrTOnvmZUdCsix
 9pgrlXjjjcJR24fEW6xvhWtxqY1536h7DpIwGw1yeeJVDlDqxXztNi0KwY2LMGyRaWK/
 VJJ+iJuw2MymBd0veieLIKq7kbpNknhJz+MniQXFYz6qIyTDrpMy81QWdPk4nun3jXv9
 HC3sJSnkeAakxGg9Qt2YrVA41vTd6FmS9nkmWZ4s5faxl4sW6C9Bow9uTtDGR8pVaQ6e
 wajyugWXY8bPo9XEA9eid8cutqbWWMaJ86IDtUip9YUTyvg0lmgZr/SyaFjewEjAbafs
 mVAA==
X-Gm-Message-State: AOJu0YyYBeJSXKCvEvu5nNW2BpaURGyjoRRCeSC4QojRVciSxjBwV81Q
 jxU+tXU5AjLsgsiFAHSw13G7tmiIJjX/XBcDr4U=
X-Google-Smtp-Source: AGHT+IFhmmyeCLH0r7f3p8kPQy8G9uIh9l48pdB6pPsJPEieLUvSMwe+S+8Hxl0I/q+ZvfMutDwmCw==
X-Received: by 2002:a17:903:120b:b0:1d0:c55b:c55a with SMTP id
 l11-20020a170903120b00b001d0c55bc55amr9131157plh.60.1702928407957; 
 Mon, 18 Dec 2023 11:40:07 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 jj20-20020a170903049400b001cfbd3f38dcsm2983808plb.225.2023.12.18.11.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 11:40:06 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 12:39:48 -0700
Message-ID: <20231218194001.544887-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
References: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702928408; x=1703533208;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nI0/xnruyXutJatZ2MBMNrsRo31ivtO6yYvX351yDOo=;
 b=XxK1BpJzPAykkgn6RsVce72oLV3k8PLET/0S7HH3scqeBHcD4RT0fROW2fypq9ta5a
 zLSFFGKhlhvwqKsvrMlI16RXBYKwrfTTRm7lAydpCPutFL0Z5pPyKgdjcPrYNbT2I0iC
 xd0cwcfPPh9eP6eM508y8D2vlxqqukQBRWFa4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=XxK1BpJz
Subject: [Buildroot] [PATCH v2 03/14] package/dmenu-wayland: new package
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

This package is an alternative to dmenu for X. Sway uses it by default as its
menu bar.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2:
  - ln -sf dmenu-wl $(TARGET_DIR)/usr/bin/dmenu (Thomas)
  - v1 -> v2: Fix the sha256sum of LICENSE

 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/dmenu-wayland/Config.in          | 26 +++++++++++++++++++++++
 package/dmenu-wayland/dmenu-wayland.hash |  3 +++
 package/dmenu-wayland/dmenu-wayland.mk   | 27 ++++++++++++++++++++++++
 5 files changed, 58 insertions(+)
 create mode 100644 package/dmenu-wayland/Config.in
 create mode 100644 package/dmenu-wayland/dmenu-wayland.hash
 create mode 100644 package/dmenu-wayland/dmenu-wayland.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 311dcd9504..acca5353b5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -33,6 +33,7 @@ F:	package/vulkan-tools/
 
 N:	Adam Duskett <adam.duskett@amarulasolutions.com>
 F:	package/depot-tools/
+F:	package/dmenu-wayland/
 F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-pi/
diff --git a/package/Config.in b/package/Config.in
index fcc09b07c4..9138f74b25 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -313,6 +313,7 @@ menu "Graphic libraries and applications (graphic/text)"
 comment "Graphic applications"
 	source "package/cage/Config.in"
 	source "package/cog/Config.in"
+	source "package/dmenu-wayland/Config.in"
 	source "package/fswebcam/Config.in"
 	source "package/ghostscript/Config.in"
 	source "package/glmark2/Config.in"
diff --git a/package/dmenu-wayland/Config.in b/package/dmenu-wayland/Config.in
new file mode 100644
index 0000000000..111bbfb434
--- /dev/null
+++ b/package/dmenu-wayland/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_DMENU_WAYLAND
+	bool "dmenu-wayland"
+	depends on BR2_USE_MMU # pango -> lib2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> glib2, wayland
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuz
+	depends on !BR2_STATIC_LIBS # wayland -> dlfcn.h
+	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype support
+	depends on BR2_USE_WCHAR # pango -> glib2
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PNG
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBXKBCOMMON
+	select BR2_PACKAGE_PANGO
+	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
+	help
+	  dmenu-wl is an efficient dynamic menu for wayland (wlroots).
+
+	  https://github.com/nyyManni/dmenu-wayland
+
+comment "dmenu-wayland needs a toolchain w/ wchar, threads, C++, dynamic library, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || BR2_STATIC_LIBS || \
+		!BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
diff --git a/package/dmenu-wayland/dmenu-wayland.hash b/package/dmenu-wayland/dmenu-wayland.hash
new file mode 100644
index 0000000000..a034e0ef40
--- /dev/null
+++ b/package/dmenu-wayland/dmenu-wayland.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  727f3525a7336491620dbe184e3c0d1deee15c85503a5d8c849fb0e5091e7dee  dmenu-wayland-a380201dff5bfac2dace553d7eaedb6cea6855f9-br1.tar.gz
+sha256  8d26bccf8a21c5e29dc756beef534403c935766c815bbb6e7eab0598632b9827  LICENSE
diff --git a/package/dmenu-wayland/dmenu-wayland.mk b/package/dmenu-wayland/dmenu-wayland.mk
new file mode 100644
index 0000000000..585aa05628
--- /dev/null
+++ b/package/dmenu-wayland/dmenu-wayland.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# dmenu-wayland
+#
+################################################################################
+
+DMENU_WAYLAND_VERSION = a380201dff5bfac2dace553d7eaedb6cea6855f9
+DMENU_WAYLAND_SITE = https://github.com/nyyManni/dmenu-wayland.git
+DMENU_WAYLAND_SITE_METHOD = git
+DMENU_WAYLAND_LICENSE = MIT
+DMENU_WAYLAND_LICENSE_FILES = LICENSE
+
+DMENU_WAYLAND_DEPENDENCIES = \
+	cairo \
+	libglib2 \
+	libxkbcommon \
+	pango \
+	wayland \
+	wayland-protocols
+
+# By default, sway calls dmenu not dmenu-wl
+define DMENU_WAYLAND_SYMLINK_DMENU_WL
+	ln -sf dmenu-wl $(TARGET_DIR)/usr/bin/dmenu
+endef
+DMENU_WAYLAND_POST_INSTALL_TARGET_HOOKS += DMENU_WAYLAND_SYMLINK_DMENU_WL
+
+$(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
