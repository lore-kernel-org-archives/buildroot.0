Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10CCC61D99
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 00:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6578381ED5;
	Thu, 23 Nov 2023 00:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6578381ED5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dN9eCPEDl0Lr; Thu, 23 Nov 2023 00:08:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8049E81F53;
	Thu, 23 Nov 2023 00:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8049E81F53
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 372961BF4D6
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 00:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F0614015A
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 00:08:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F0614015A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t9RVPWTKpqW4 for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 00:08:27 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5215400D8
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 00:08:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5215400D8
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-35b144ba935so1088295ab.1
 for <buildroot@buildroot.org>; Wed, 22 Nov 2023 16:08:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700698106; x=1701302906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rmOfI1NTQmxHKAB2G5GycWjr4ac0mJ1cugwUmRmM+lo=;
 b=DGX7ydkFbzCuo90SG9yxknz9Gjbw9dsZPuQ5TBdVShjpNaMPB4OgRSoC6Mbfp/YvX1
 fxldGGdJxxzvjBDJoB5p7rwHN7Lhza2k6a4QwRK+wlR7BRggYgC1C5CJ1SAU6cb236tQ
 eESLuvjVpUHTe1XRO6GL+YTMWvXOnlGiLKzeCbf11isgpCtK+WjqhL1YHSuTH5hcDroI
 Ki8Y52JjdCD+gTWndBvKzlNfgmVawtDkMOzI8gwIl6aaw21YiLcx0lkC1QACEQAsQax7
 lxc9SG4mpSdjbIWpmLoWRygaHnFQXPfK+XAg0bqTtC8Ci9wfde0zneQe7UrbXyntHEvs
 OHKQ==
X-Gm-Message-State: AOJu0YxLfIQTPclBzo3OmpApKgdLZ1XbTEq72oc+6+bBQjZ6jtM4k445
 F5N/JnagmNKRreE2/8tiSSrdC6OdkkCjoUD2aIs=
X-Google-Smtp-Source: AGHT+IFOd3R+a3dJLm8Kf4sZ6fSZ5mVP+dKz9Lf46LrE/sQiYZZDYuLAvlPUQ/W5etIH66gsx/BK+A==
X-Received: by 2002:a92:3f0a:0:b0:35b:2cf7:e3dc with SMTP id
 m10-20020a923f0a000000b0035b2cf7e3dcmr3950171ila.17.1700698105833; 
 Wed, 22 Nov 2023 16:08:25 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.200.138])
 by smtp.gmail.com with ESMTPSA id
 fb6-20020a056a002d8600b006cb907e8059sm56858pfb.9.2023.11.22.16.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 16:08:25 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 Nov 2023 17:08:08 -0700
Message-ID: <20231123000819.488595-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
References: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700698106; x=1701302906;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rmOfI1NTQmxHKAB2G5GycWjr4ac0mJ1cugwUmRmM+lo=;
 b=dMNg6YxBQuw1C8t9UvQSMbfGuXR+GHMtZo3o+UHdwkmDauPNq3AFsj6vTi0jZib7f7
 r3Y4D+BFMNDUeN7Eb0Env8IPtj6NBUw0YCAiaJowLBKqZ9UhNhiS8bdRLhxIrCYNGDgg
 RcFedAxlEJia8V5Vj9TzMgjB5xc/YIObw4kzA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=dMNg6YxB
Subject: [Buildroot] [PATCH/next 02/13] package/dmenu-wayland: new package
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

This package is an alternative to dmenu for X. Sway uses it by default as its
menu bar.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/dmenu-wayland/Config.in          | 26 ++++++++++++++++++++++
 package/dmenu-wayland/dmenu-wayland.hash |  3 +++
 package/dmenu-wayland/dmenu-wayland.mk   | 28 ++++++++++++++++++++++++
 5 files changed, 59 insertions(+)
 create mode 100644 package/dmenu-wayland/Config.in
 create mode 100644 package/dmenu-wayland/dmenu-wayland.hash
 create mode 100644 package/dmenu-wayland/dmenu-wayland.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1f26e9bc81..16be3896f8 100644
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
index 5a3410d758..790ed3cbd3 100644
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
index 0000000000..007779624b
--- /dev/null
+++ b/package/dmenu-wayland/dmenu-wayland.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  727f3525a7336491620dbe184e3c0d1deee15c85503a5d8c849fb0e5091e7dee  dmenu-wayland-a380201dff5bfac2dace553d7eaedb6cea6855f9-br1.tar.gz
+sha256  95224d118a325daf31828afcca98cd958d53f0a7cdd856b50b1be8ac44832faf  LICENSE
diff --git a/package/dmenu-wayland/dmenu-wayland.mk b/package/dmenu-wayland/dmenu-wayland.mk
new file mode 100644
index 0000000000..5a6c0194d5
--- /dev/null
+++ b/package/dmenu-wayland/dmenu-wayland.mk
@@ -0,0 +1,28 @@
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
+	cd $(TARGET_DIR)/usr/bin && \
+	ln -sf dmenu-wl dmenu
+endef
+DMENU_WAYLAND_POST_INSTALL_TARGET_HOOKS += DMENU_WAYLAND_SYMLINK_DMENU_WL
+
+$(eval $(meson-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
