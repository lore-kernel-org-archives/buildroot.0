Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331A8C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 19:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC5CA41826;
	Tue, 21 Feb 2023 19:29:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC5CA41826
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PaEP8ke9ZBTf; Tue, 21 Feb 2023 19:29:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3C4C4186C;
	Tue, 21 Feb 2023 19:29:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3C4C4186C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4030F1BF362
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 19:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 193CC605BE
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 19:28:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 193CC605BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IiJWAb0vD6vY for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 19:28:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3EF660591
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3EF660591
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 19:28:22 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id z8so5336002wrm.8
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 11:28:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3Ec5+UlMnr4G3VCrq0YT4izvRJZkrDCuErnOV67HDqg=;
 b=kCZR89e/76C0F09AC7MGXt7fM74OYnOEpfbJfNum1yPEfkhmNWKDcRoTe63grlGVyM
 4Hd8o8kmZ5JI2FOUIBpxNDU1AzifIFbFHE9DkEZ4YQIu9VE68wo0jidHDQWKvUxOEI8o
 qsjOeu3C7iM35qo+S6l6Ij7HGoXU2YmI0StzKVixiBIQAtB/x4fVcWqm0W1MwflhMk73
 SiNsO/NVt9hVBL+EnUwfZNalhL36vFxUFUSzP0qe1hv0bP9NE/0bEsMPXefxTOkZk/dw
 SQDALaVS5my+ko1dMv7woF13qClD24yvaN6Peqy1hC0JXGsDy01x5isTJ0qv2c1aD26U
 M7Vw==
X-Gm-Message-State: AO0yUKVyMQ5q8x/myv5+RKKLfTkiLGXesqqSK28Oxt7WxrVq8GYDHhpe
 ixH1wYCMbJjYM1BDc8K2flFaH1WNaD0Nsuow
X-Google-Smtp-Source: AK7set/s3SOHN21lFzWlYUV7V/XTcISEjgbMPw9IKM4k0oN9nqoo3KdGcI7GPw+3XHtbTzp6MsHyqA==
X-Received: by 2002:a5d:5b0a:0:b0:2c6:c9f1:e444 with SMTP id
 bx10-20020a5d5b0a000000b002c6c9f1e444mr3696168wrb.16.1677007700599; 
 Tue, 21 Feb 2023 11:28:20 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 g16-20020a5d4890000000b002c56a991971sm8748163wrq.76.2023.02.21.11.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 11:28:20 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 20:28:01 +0100
Message-Id: <20230221192802.4117856-3-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230221192802.4117856-1-thomas.devoogdt@barco.com>
References: <CACXRmJj0nSjChCdU8+fDQsiqVw5gUn-91wqLXhYpcc4GfA-Cug@mail.gmail.com>
 <20230221192802.4117856-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Ec5+UlMnr4G3VCrq0YT4izvRJZkrDCuErnOV67HDqg=;
 b=DX0E/NhKdz5tkrz7xyriOamrWwY9s0vRT53PeFsITQbYXQ1KOzwNKBXKYr3ZjeWlGi
 mjJzdFM68nbG1q1kKkOhb+IZDFvQQZiptDIdgeymiez5D0sBGnqWLF0rtRZPHRdGs7Fq
 A08oJK3qmr/ipn4ydV+gt+dOASpnJFwqNJS9PAx7ESuslcvGCmi+mxo8hH9hD3emKESI
 LLb3ZBfMzXWPihx3Wi5msAiNfpCXhCb197+VGyVd9sr6m7uQrdH2Y8v0jbajUKb8UndA
 jXsuua1Rs0Fto9PhXLWAa/ADy9YwfOJ16AUA/Mgsu6vcna00/whNTb05HCrX0d6XYGrc
 3imA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DX0E/NhK
Subject: [Buildroot] [PATCH v3 3/4] package/atk: remove package
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Daniel Lang <d.lang@abatec.at>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Daniel Lang <d.lang@abatec.at>

atk has been merged into at-spi2-core with version 2.45.1.

https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/AT_SPI2_CORE_2_45_1/NEWS
https://gitlab.gnome.org/GNOME/at-spi2-core/-/merge_requests/78

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v3:
 - rebased on https://patchwork.ozlabs.org/project/buildroot/list/?series=336254
 - needed to fix the webkitgtk 2.38.5 compilation
   (https://patchwork.ozlabs.org/project/buildroot/patch/20230220090923.2155635-2-thomas.devoogdt@barco.com/)
---
 Config.in.legacy             |  7 +++++++
 package/Config.in            |  1 -
 package/atk/Config.in        | 14 --------------
 package/atk/atk.hash         |  5 -----
 package/atk/atk.mk           | 25 -------------------------
 package/atkmm/Config.in      |  8 ++++----
 package/atkmm/atkmm.mk       |  2 +-
 package/libglade/Config.in   |  2 +-
 package/libglade/libglade.mk |  2 +-
 package/libgtk2/Config.in    |  2 +-
 package/libgtk2/libgtk2.mk   |  2 +-
 package/libgtk3/Config.in    |  2 +-
 package/libgtk3/libgtk3.mk   |  2 +-
 13 files changed, 18 insertions(+), 56 deletions(-)
 delete mode 100644 package/atk/Config.in
 delete mode 100644 package/atk/atk.hash
 delete mode 100644 package/atk/atk.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 0de7e6e6d6..0bdfc6cf73 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_ATK
+	bool "atk removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_AT_SPI2_CORE
+	help
+	  atk is now part of at-spi2-core.
+
 config BR2_PACKAGE_AT_SPI2_ATK
 	bool "at-spi2-atk removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index fe64b2a8e1..64876eb7f1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1554,7 +1554,6 @@ endmenu
 menu "Graphics"
 	source "package/assimp/Config.in"
 	source "package/at-spi2-core/Config.in"
-	source "package/atk/Config.in"
 	source "package/atkmm/Config.in"
 	source "package/bayer2rgb-neon/Config.in"
 	source "package/bullet/Config.in"
diff --git a/package/atk/Config.in b/package/atk/Config.in
deleted file mode 100644
index d9371b879b..0000000000
--- a/package/atk/Config.in
+++ /dev/null
@@ -1,14 +0,0 @@
-config BR2_PACKAGE_ATK
-	bool "atk"
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
-	select BR2_PACKAGE_LIBGLIB2
-	help
-	  The ATK accessibility toolkit, needed to build GTK+-2.x.
-
-	  https://gitlab.gnome.org/GNOME/atk
-
-comment "atk needs a toolchain w/ wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/atk/atk.hash b/package/atk/atk.hash
deleted file mode 100644
index d8cd69ff1f..0000000000
--- a/package/atk/atk.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From http://ftp.gnome.org/pub/gnome/sources/atk/2.38/atk-2.38.0.sha256sum
-sha256  ac4de2a4ef4bd5665052952fe169657e65e895c5057dffb3c2a810f6191a0c36  atk-2.38.0.tar.xz
-
-# Hash for license file
-sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
deleted file mode 100644
index 2820fb486d..0000000000
--- a/package/atk/atk.mk
+++ /dev/null
@@ -1,25 +0,0 @@
-################################################################################
-#
-# atk
-#
-################################################################################
-
-ATK_VERSION_MAJOR = 2.38
-ATK_VERSION = $(ATK_VERSION_MAJOR).0
-ATK_SOURCE = atk-$(ATK_VERSION).tar.xz
-ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)
-ATK_LICENSE = LGPL-2.0+
-ATK_LICENSE_FILES = COPYING
-ATK_INSTALL_STAGING = YES
-ATK_DEPENDENCIES = libglib2 $(TARGET_NLS_DEPENDENCIES)
-
-ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-ATK_CONF_OPTS += -Dintrospection=true
-ATK_DEPENDENCIES += gobject-introspection
-else
-ATK_CONF_OPTS += -Dintrospection=false
-endif
-
-ATK_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
-
-$(eval $(meson-package))
diff --git a/package/atkmm/Config.in b/package/atkmm/Config.in
index aa58f8d593..f6f2ca8fc2 100644
--- a/package/atkmm/Config.in
+++ b/package/atkmm/Config.in
@@ -2,10 +2,10 @@ config BR2_PACKAGE_ATKMM
 	bool "atkmm"
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigc
-	depends on BR2_TOOLCHAIN_HAS_THREADS # atk/glibmm -> libglib2
-	depends on BR2_USE_MMU # atk/glibmm -> libglib2
-	depends on BR2_USE_WCHAR # atk/glibmm -> libglib2
-	select BR2_PACKAGE_ATK
+	depends on BR2_TOOLCHAIN_HAS_THREADS # at-spi2-core/glibmm -> libglib2
+	depends on BR2_USE_MMU # at-spi2-core/glibmm -> libglib2
+	depends on BR2_USE_WCHAR # at-spi2-core/glibmm -> libglib2
+	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_GLIBMM
 	select BR2_PACKAGE_LIBSIGC
 
diff --git a/package/atkmm/atkmm.mk b/package/atkmm/atkmm.mk
index 7ceb87b047..da763c8386 100644
--- a/package/atkmm/atkmm.mk
+++ b/package/atkmm/atkmm.mk
@@ -11,6 +11,6 @@ ATKMM_SITE = https://download.gnome.org/sources/atkmm/$(ATKMM_VERSION_MAJOR)
 ATKMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 ATKMM_LICENSE_FILES = COPYING COPYING.tools
 ATKMM_INSTALL_STAGING = YES
-ATKMM_DEPENDENCIES = atk glibmm libsigc host-pkgconf
+ATKMM_DEPENDENCIES = at-spi2-core glibmm libsigc host-pkgconf
 
 $(eval $(meson-package))
diff --git a/package/libglade/Config.in b/package/libglade/Config.in
index c97c9becd2..8d0d26f159 100644
--- a/package/libglade/Config.in
+++ b/package/libglade/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBGLADE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_ATK
+	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_LIBXML2
 	help
 	  Libglade allows you to load glade interface files in a program
diff --git a/package/libglade/libglade.mk b/package/libglade/libglade.mk
index 21aed60605..af73d8bd00 100644
--- a/package/libglade/libglade.mk
+++ b/package/libglade/libglade.mk
@@ -9,7 +9,7 @@ LIBGLADE_VERSION = $(LIBGLADE_VERSION_MAJOR).4
 LIBGLADE_SOURCE = libglade-$(LIBGLADE_VERSION).tar.bz2
 LIBGLADE_SITE = https://download.gnome.org/sources/libglade/$(LIBGLADE_VERSION_MAJOR)
 LIBGLADE_INSTALL_STAGING = YES
-LIBGLADE_DEPENDENCIES = host-pkgconf libglib2 libgtk2 atk libxml2
+LIBGLADE_DEPENDENCIES = host-pkgconf libglib2 libgtk2 at-spi2-core libxml2
 LIBGLADE_LICENSE = LGPL-2.0+
 LIBGLADE_LICENSE_FILES = COPYING
 
diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index c75c37fb63..f2888b2f51 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_LIBGTK2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
-	select BR2_PACKAGE_ATK
+	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PS
 	select BR2_PACKAGE_CAIRO_PDF
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 859925e8d3..608c263e4d 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -23,7 +23,7 @@ LIBGTK2_CONF_ENV = \
 
 LIBGTK2_CONF_OPTS = --disable-glibtest --enable-explicit-deps=no
 
-LIBGTK2_DEPENDENCIES = host-pkgconf host-libgtk2 libglib2 cairo pango atk \
+LIBGTK2_DEPENDENCIES = host-pkgconf host-libgtk2 libglib2 cairo pango at-spi2-core \
 	gdk-pixbuf $(TARGET_NLS_DEPENDENCIES)
 
 LIBGTK2_MAKE_OPTS = LIBS=$(TARGET_NLS_LIBS)
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index 82ca68d2da..34b8d49eb3 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -23,7 +23,7 @@ config BR2_PACKAGE_LIBGTK3
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
 		BR2_PACKAGE_HAS_LIBGL
-	select BR2_PACKAGE_ATK
+	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PS
 	select BR2_PACKAGE_CAIRO_PDF
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 283c129cef..2821c7eb52 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -14,7 +14,7 @@ LIBGTK3_CPE_ID_VENDOR = gnome
 LIBGTK3_CPE_ID_PRODUCT = gtk
 LIBGTK3_INSTALL_STAGING = YES
 
-LIBGTK3_DEPENDENCIES = host-pkgconf host-libgtk3 atk libglib2 cairo pango \
+LIBGTK3_DEPENDENCIES = host-pkgconf host-libgtk3 at-spi2-core libglib2 cairo pango \
 	gdk-pixbuf libepoxy $(TARGET_NLS_DEPENDENCIES)
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
