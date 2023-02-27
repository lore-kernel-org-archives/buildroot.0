Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2362AC64ED6
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 10:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A174409EA;
	Mon, 27 Feb 2023 10:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A174409EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CmYNszNJ4l9W; Mon, 27 Feb 2023 10:59:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F193241554;
	Mon, 27 Feb 2023 10:59:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F193241554
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 696031BF25F
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 10:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42C3B60BDB
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 10:58:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42C3B60BDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6yEOMe43qAfD for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 10:58:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED71960BB0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED71960BB0
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 10:58:51 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 o38-20020a05600c512600b003e8320d1c11so6396613wms.1
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 02:58:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lLSGN2+g3ybhBX3VhlcvyntHM0PSvbGTEHoysqZ+HFo=;
 b=wZ9jOkiI5RjBRR1S/FTGQh0cUzj4X7Nso5lC+67YVmC2w6/1tS1o+PNfRbliF7MK1r
 KypQ9JJAjWbKWdgrUKQ6SYnld80oxmwhahZgLhEocnVxHk7cTH+PUz1ZWew7niLeBoww
 VUNqDIyFesO2C7mMaObHpxwMC3X5NCuucZrGwW1/nVJFhcU7SPpB83dB5+ypED0O7trb
 s56OzlpYeSY3l2P4RSxOY9FPb0xsnkizohoXwqRt+Y/NiNoRN6qcoX5d0BcEza691ptB
 U8N9IoeVwavs04xy7ShA+c13ce0eIbSE9Q11ajgiQIAR9eXe7Uo6A6lDVdFJf8l0DNm1
 S7eg==
X-Gm-Message-State: AO0yUKVUVBa7NL0CvC1KcAFn7O2mD0/Iyi7QBvBNH7YoiRGLMgb9jG4A
 GZnhpvuhKZJ/9zs0xqn/XBMqRbvNoVexBSqt
X-Google-Smtp-Source: AK7set9W8ZKPmZBFfx0dABmFf4a2q/sr5fos8fkYuY4Sgi/p96evUEDJ75gy9IiNV7UxChNliOVekA==
X-Received: by 2002:a05:600c:1c8b:b0:3ea:f883:5ac with SMTP id
 k11-20020a05600c1c8b00b003eaf88305acmr8415213wms.5.1677495529847; 
 Mon, 27 Feb 2023 02:58:49 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 l1-20020a1ced01000000b003ea57808179sm12055048wmh.38.2023.02.27.02.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 02:58:49 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Mon, 27 Feb 2023 11:58:35 +0100
Message-Id: <20230227105838.358916-2-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227105838.358916-1-thomas.devoogdt@barco.com>
References: <20230227105838.358916-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lLSGN2+g3ybhBX3VhlcvyntHM0PSvbGTEHoysqZ+HFo=;
 b=G5wsIEZSnlTA4N9Jzm9Uax3GbKL8srEyi6c5KGZIXvIq8aMaQixpxDiNSs0fausbCH
 xrJRMPDkN3N5nnLP6GNmBBmfSj2XR1fG35PomMK9lc+fnqBWz2UnpiY49K+t1/tH0eXJ
 URIwkOApUlt6OW3+U8Or+rtSZ2rdAfXc6Oo0y3Q3nJnjFY9QVy7Ax9b3FJg1T8iaOkCh
 msf0AHtbQL1zpEZeIObHJeONq7r5J1zTJkLsC9n3Dn7z2r7LWBollesH48N+Gav690mw
 LhrrE5LUKVKYNU+IRFjncwYpyu+SsIy8fT1ukjR/6fyI9VuEK2GdX5KBXrk2hjIcjBlA
 uMfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=G5wsIEZS
Subject: [Buildroot] [PATCH v5 2/5] package/at-spi2-atk: remove package
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
Cc: Daniel Lang <d.lang@abatec.at>, Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Daniel Lang <d.lang@abatec.at>

at-spi2-atk has been merged into at-spi2-core with version 2.45.1.

https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/AT_SPI2_CORE_2_45_1/NEWS
https://gitlab.gnome.org/GNOME/at-spi2-core/-/merge_requests/78

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v3:
 - rebased on https://patchwork.ozlabs.org/project/buildroot/list/?series=336254
 - needed to fix the webkitgtk 2.38.5 compilation
   (https://patchwork.ozlabs.org/project/buildroot/patch/20230220090923.2155635-2-thomas.devoogdt@barco.com/)
v5: rebased + grouped patches
---
 Config.in.legacy                              |  7 +++
 DEVELOPERS                                    |  1 -
 package/Config.in                             |  1 -
 .../0001-meson-add-tests-option.patch         | 43 -------------------
 package/at-spi2-atk/Config.in                 | 22 ----------
 package/at-spi2-atk/at-spi2-atk.hash          |  5 ---
 package/at-spi2-atk/at-spi2-atk.mk            | 19 --------
 7 files changed, 7 insertions(+), 91 deletions(-)
 delete mode 100644 package/at-spi2-atk/0001-meson-add-tests-option.patch
 delete mode 100644 package/at-spi2-atk/Config.in
 delete mode 100644 package/at-spi2-atk/at-spi2-atk.hash
 delete mode 100644 package/at-spi2-atk/at-spi2-atk.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 381e1e3a8c..b303677d3f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_AT_SPI2_ATK
+        bool "at-spi2-atk removed"
+        select BR2_LEGACY
+        select BR2_PACKAGE_AT_SPI2_CORE
+        help
+          at-spi2-atk is now part of at-spi2-core.
+
 config BR2_PACKAGE_UCCP420WLAN
 	bool "uccp420wlan removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 6256576e02..9530c4cfb2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1612,7 +1612,6 @@ F:	support/testing/tests/package/test_avocado.py
 F:	support/testing/tests/package/test_python_aexpect.py
 
 N:	Joseph Kogut <joseph.kogut@gmail.com>
-F:	package/at-spi2-atk/
 F:	package/at-spi2-core/
 F:	package/clang/
 F:	package/earlyoom/
diff --git a/package/Config.in b/package/Config.in
index 3ace25c665..42173fa2b1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1552,7 +1552,6 @@ endmenu
 
 menu "Graphics"
 	source "package/assimp/Config.in"
-	source "package/at-spi2-atk/Config.in"
 	source "package/at-spi2-core/Config.in"
 	source "package/atk/Config.in"
 	source "package/atkmm/Config.in"
diff --git a/package/at-spi2-atk/0001-meson-add-tests-option.patch b/package/at-spi2-atk/0001-meson-add-tests-option.patch
deleted file mode 100644
index 3a2aefa090..0000000000
--- a/package/at-spi2-atk/0001-meson-add-tests-option.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 466d04a57b32417dbf2d5e818af1b7593af5f802 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 3 May 2020 10:29:36 +0200
-Subject: [PATCH] meson: add tests option
-
-Add tests option to allow the user to build at-spi2-atk without tests,
-it is especially useful as one of the test requires libxml-2.0
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.gnome.org/GNOME/at-spi2-atk/-/merge_requests/22]
----
- meson.build       | 4 +++-
- meson_options.txt | 4 ++++
- 2 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 9fce5d6..61bc93d 100644
---- a/meson.build
-+++ b/meson.build
-@@ -61,4 +61,6 @@ install_data('at-spi2-atk.desktop',
- 
- subdir('droute')
- subdir('atk-adaptor')
--subdir('tests')
-+if get_option('tests')
-+  subdir('tests')
-+endif
-diff --git a/meson_options.txt b/meson_options.txt
-index 24c9228..a4abdc2 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -2,3 +2,7 @@ option('disable_p2p',
-        description: 'Disable peer-to-peer DBus connections',
-        type: 'boolean',
-        value: false)
-+option('tests',
-+       description: 'Whether to build tests',
-+       type: 'boolean',
-+       value: true)
--- 
-2.26.2
-
diff --git a/package/at-spi2-atk/Config.in b/package/at-spi2-atk/Config.in
deleted file mode 100644
index 9a7cfde0af..0000000000
--- a/package/at-spi2-atk/Config.in
+++ /dev/null
@@ -1,22 +0,0 @@
-config BR2_PACKAGE_AT_SPI2_ATK
-	bool "at-spi2-atk"
-	depends on BR2_PACKAGE_XORG7 # at-spi2-core
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
-	depends on BR2_USE_WCHAR # glib2
-	select BR2_PACKAGE_ATK
-	select BR2_PACKAGE_AT_SPI2_CORE
-	select BR2_PACKAGE_LIBGLIB2
-	help
-	  The At-Spi2 Atk package contains a library that bridges
-	  ATK to At-Spi2 D-Bus service.
-
-	  https://www.freedesktop.org/wiki/Accessibility/AT-SPI2/
-
-comment "at-spi2-atk needs a toolchain w/ wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-
-comment "at-spi2-atk depends on X.org"
-	depends on BR2_USE_MMU
-	depends on !BR2_PACKAGE_XORG7
diff --git a/package/at-spi2-atk/at-spi2-atk.hash b/package/at-spi2-atk/at-spi2-atk.hash
deleted file mode 100644
index 9c564c32af..0000000000
--- a/package/at-spi2-atk/at-spi2-atk.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/at-spi2-atk/2.34/at-spi2-atk-2.34.2.sha256sum
-sha256  901323cee0eef05c01ec4dee06c701aeeca81a314a7d60216fa363005e27f4f0  at-spi2-atk-2.34.2.tar.xz
-
-# locally calculated
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/at-spi2-atk/at-spi2-atk.mk b/package/at-spi2-atk/at-spi2-atk.mk
deleted file mode 100644
index 232b577230..0000000000
--- a/package/at-spi2-atk/at-spi2-atk.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# at-spi2-atk
-#
-################################################################################
-
-AT_SPI2_ATK_VERSION_MAJOR = 2.34
-AT_SPI2_ATK_VERSION = $(AT_SPI2_ATK_VERSION_MAJOR).2
-AT_SPI2_ATK_SOURCE = at-spi2-atk-$(AT_SPI2_ATK_VERSION).tar.xz
-AT_SPI2_ATK_SITE = \
-	http://ftp.gnome.org/pub/gnome/sources/at-spi2-atk/$(AT_SPI2_ATK_VERSION_MAJOR)
-AT_SPI2_ATK_LICENSE = LGPL-2.1+
-AT_SPI2_ATK_LICENSE_FILES = COPYING
-AT_SPI2_ATK_CPE_ID_VENDOR = gnome
-AT_SPI2_ATK_INSTALL_STAGING = YES
-AT_SPI2_ATK_DEPENDENCIES = atk at-spi2-core libglib2 host-pkgconf
-AT_SPI2_ATK_CONF_OPTS = -Dtests=false
-
-$(eval $(meson-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
