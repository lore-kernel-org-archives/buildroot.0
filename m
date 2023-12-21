Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A663C3DA6E
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 00:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D5AC41EB1;
	Thu, 21 Dec 2023 00:19:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D5AC41EB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zO4CFult3fET; Thu, 21 Dec 2023 00:19:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ACAA42114;
	Thu, 21 Dec 2023 00:19:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ACAA42114
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 137FC1BF408
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 00:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0CF58135D
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 00:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0CF58135D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HSz8SPL0MsMj for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 00:19:30 +0000 (UTC)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C203C8133F
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 00:19:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C203C8133F
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1d3ac87553bso2091635ad.3
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 16:19:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703117969; x=1703722769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ue/WQpsgIePtBMl/76m3r++SYKbgFoTsIWZY3REIe4Y=;
 b=CMTjz58sLHImiZQeALJj6SOV4CA+mMwslovq3HDH4kbAuFfpH+dk58ElrvRU7JvMDO
 8gIAhjmN0x/KpolPgO4ierOQUbzR/ksTPXLv4ixa+QWlF1X5etaNE9GKs8ScDuT4BYoh
 vG42FSbXOGCdtrqb0NT1WbxJZkQJhCN+wF5admyd62FK7TQBZPgYolpAzgrLXq5/Esep
 gdAyhRzlEhGDCJ4Nh7eXDNazjW5h/bXwwC4zDz5VY46MlypXbwjinh06UQ8n70PNdmFC
 P/WB9TWZjsfhHHssuhcDGJW7ocQe/FC9R255I36LSQkcL+a/DF0rgQcYknEJcoka5jMH
 PAJA==
X-Gm-Message-State: AOJu0YxI1uAlMXHHT1pzQ9c2JZIW++RUEt6Zg5gwcURN2kAHkizD+qJF
 +1mAXJpUJ7TMz3r6sUDWTUgQZCvMp3szWC7mecg=
X-Google-Smtp-Source: AGHT+IFVlysXpF1NateLtqSCSqy+lZyCQ9myoLwiv7TCkIeQMEsZP64wZUcZKH/TO8FO+w6nl80aCg==
X-Received: by 2002:a05:6a20:8407:b0:18f:97c:4f36 with SMTP id
 c7-20020a056a20840700b0018f097c4f36mr374753pzd.66.1703117969344; 
 Wed, 20 Dec 2023 16:19:29 -0800 (PST)
Received: from DESKTOP-OI0KN2B.ht.home (174-126-58-188.cpe.sparklight.net.
 [174.126.58.188]) by smtp.gmail.com with ESMTPSA id
 a5-20020a170902ecc500b001d364210979sm294459plh.224.2023.12.20.16.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 16:19:28 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 17:19:16 -0700
Message-ID: <20231221001924.1356215-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221001924.1356215-1-adam.duskett@amarulasolutions.com>
References: <20231221001924.1356215-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703117969; x=1703722769;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ue/WQpsgIePtBMl/76m3r++SYKbgFoTsIWZY3REIe4Y=;
 b=q1Sc/gypHVgDkYXfNSeJrpa479+tMYSUbiHGw5tgyeh8WA+4RmQMHrrWo4PSNxxbFD
 VhroHVngWwWbe0rJlNqZI8R5xizeAtUmV6bUT55vxXuH3VSRvIgMhE2et219IvtBYHCZ
 /hQj2gLOSV4coauwWnyw58RhLngvBs99qp+ds=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=q1Sc/gyp
Subject: [Buildroot] [PATCH v3 02/10] package/dmenu-wayland: new package
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
v2 -> v3: Added 0001-support-cross-compilation.patch [Thomas]

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 .../0001-support-cross-compilation.patch      | 32 +++++++++++++++++++
 package/dmenu-wayland/Config.in               | 26 +++++++++++++++
 package/dmenu-wayland/dmenu-wayland.hash      |  3 ++
 package/dmenu-wayland/dmenu-wayland.mk        | 29 +++++++++++++++++
 6 files changed, 92 insertions(+)
 create mode 100644 package/dmenu-wayland/0001-support-cross-compilation.patch
 create mode 100644 package/dmenu-wayland/Config.in
 create mode 100644 package/dmenu-wayland/dmenu-wayland.hash
 create mode 100644 package/dmenu-wayland/dmenu-wayland.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 874e7bd3d2..027604e495 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -33,6 +33,7 @@ F:	package/vulkan-tools/
 
 N:	Adam Duskett <adam.duskett@amarulasolutions.com>
 F:	package/depot-tools/
+F:	package/dmenu-wayland/
 F:	package/fcft/
 F:	package/flutter-engine/
 F:	package/flutter-gallery/
diff --git a/package/Config.in b/package/Config.in
index 7d4d624253..cf5d1aee68 100644
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
diff --git a/package/dmenu-wayland/0001-support-cross-compilation.patch b/package/dmenu-wayland/0001-support-cross-compilation.patch
new file mode 100644
index 0000000000..3d99330cba
--- /dev/null
+++ b/package/dmenu-wayland/0001-support-cross-compilation.patch
@@ -0,0 +1,32 @@
+From cd72cade6250a3ec46dd402b25a0bd55bbb97a88 Mon Sep 17 00:00:00 2001
+From: Rick van Schijndel <rol3517@gmail.com>
+Date: Wed, 20 Dec 2023 16:44:12 -0700
+Subject: [PATCH] support cross-compilation
+
+Marking wayland-scanner as native dependency fixes the path check for
+wayland-scanner.
+
+Upstream: https://github.com/nyyManni/dmenu-wayland/pull/23
+
+Signed-off-by: Rick van Schijndel <rol3517@gmail.com>
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 3ae6f69..8d401ff 100644
+--- a/meson.build
++++ b/meson.build
+@@ -26,7 +26,7 @@ pangocairo          = dependency('pangocairo')
+ rt                  = cc.find_library('rt')
+ wayland_client      = dependency('wayland-client')
+ wayland_protos      = dependency('wayland-protocols')
+-wayland_scanner_dep = dependency('wayland-scanner')
++wayland_scanner_dep = dependency('wayland-scanner', native: true)
+ wayland_scanner     = find_program(
+   wayland_scanner_dep.get_pkgconfig_variable('wayland_scanner')
+ )
+-- 
+2.43.0
+
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
index 0000000000..108eacd422
--- /dev/null
+++ b/package/dmenu-wayland/dmenu-wayland.mk
@@ -0,0 +1,29 @@
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
+# host-wayland is for wayland-scanner
+DMENU_WAYLAND_DEPENDENCIES = \
+	host-wayland \
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
