Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902DEC46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 13:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02F3541DE4;
	Sat,  6 Jan 2024 13:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02F3541DE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ao46x3SdzozH; Sat,  6 Jan 2024 13:48:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3D6941E06;
	Sat,  6 Jan 2024 13:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3D6941E06
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3749D1BF322
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 13:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11099608A6
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 13:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11099608A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UTQzXby1J6dC for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 13:48:21 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBE6F60706
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 13:48:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBE6F60706
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3368b9bbeb4so527261f8f.2
 for <buildroot@buildroot.org>; Sat, 06 Jan 2024 05:48:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704548898; x=1705153698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yx9OsNPbWavOnwExMBoBkXfiAU0B0trFl87dqdUybe4=;
 b=l+Ms+92cbKgJqc0GNRynYKy5k+23cmWs3CRjjpAIH+vusGs+kyk2WkOcHVm2GfpERR
 2yZlKcxDQsuncApXM047s/jnJobSj5U4P7tLP/PSmXqzHHbxd69y87ub7Fknm8V9E8my
 l/cxi4+bNBM6e4NgxU9dnc3dg4wkZjcS3NPst2RU8SCcE9uS0hEhaZpkSOGyoYSywa7r
 1YiumrsIkxH09rtMubEr55QSZio8LjZwXgYH+br6+E52+ruRrP0ySK2+734SbdVcwIo8
 fXLJZFm7XBX71H2WRPNuYFc78H05+7Idkq7dLjUvCFXVMUVmSj3W+r7PYoDlTXI1vbf2
 P0vA==
X-Gm-Message-State: AOJu0YzA1tqG7u2WEURoWK7G64UW3XlGbTdaVs/B7/xumEt13js7s8JR
 K4aAviqnCkq1qyAREibLCt+9uKNXBgb7Qy4v
X-Google-Smtp-Source: AGHT+IGcu/PL2bbedvVooPlPDwsjeoSiQNaCzOkboX/EPy8UHtgjfewS4QAu8uD/ObUreajCFYO/9w==
X-Received: by 2002:a1c:7913:0:b0:40d:4d7a:b0c1 with SMTP id
 l19-20020a1c7913000000b0040d4d7ab0c1mr266307wme.279.1704548897988; 
 Sat, 06 Jan 2024 05:48:17 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:bb38:d24b:f402:8043])
 by smtp.gmail.com with ESMTPSA id
 p38-20020a05600c1da600b0040e426bd3dbsm268663wms.11.2024.01.06.05.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 05:48:17 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat,  6 Jan 2024 14:47:59 +0100
Message-Id: <20240106134800.506782-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240106134800.506782-1-thomas@devoogdt.com>
References: <20240105101105.6a181dcd@windsurf>
 <20240106134800.506782-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 2/3] package/cairo: move to the meson build
 system
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
 Thomas Devoogdt <thomas@devoogdt.com>, yann.morin.1998@free.fr,
 thomas.petazzoni@bootlin.com, aperez@igalia.com,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: added -std=gnu11 (allow inline int declaration in if loop, 99 caused some directives problems)
v3: enabled host-zlib, needed for librsvg
v4: also added gnu11 for host-cairo compiling (fixes my compilation on a gcc 4.9.2 based system)
v5: split in 3 commits: https://lore.kernel.org/buildroot/20240105101105.6a181dcd@windsurf/
---
 package/cairo/Config.in |  34 +++++----
 package/cairo/cairo.mk  | 165 +++++++++++-----------------------------
 2 files changed, 64 insertions(+), 135 deletions(-)

diff --git a/package/cairo/Config.in b/package/cairo/Config.in
index 0c87a2904b..caa6c37195 100644
--- a/package/cairo/Config.in
+++ b/package/cairo/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_XORG7
 	help
 	  Cairo is a 2D graphics library with support for multiple
 	  output devices. Currently supported output targets include
@@ -15,34 +16,35 @@ config BR2_PACKAGE_CAIRO
 
 if BR2_PACKAGE_CAIRO
 
-config BR2_PACKAGE_CAIRO_PS
-	bool "postscript support"
-	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_CAIRO_PDF
-
-config BR2_PACKAGE_CAIRO_PDF
-	bool "pdf support"
-	select BR2_PACKAGE_ZLIB
-
 config BR2_PACKAGE_CAIRO_PNG
 	bool "png support"
 	select BR2_PACKAGE_LIBPNG
-	select BR2_PACKAGE_ZLIB
-
-config BR2_PACKAGE_CAIRO_SCRIPT
-	bool "script support"
-	select BR2_PACKAGE_CAIRO_PNG
 
 config BR2_PACKAGE_CAIRO_SVG
 	bool "svg support"
 	select BR2_PACKAGE_CAIRO_PNG
-	select BR2_PACKAGE_CAIRO_PDF
 
 config BR2_PACKAGE_CAIRO_TEE
 	bool "tee support"
 
+config BR2_PACKAGE_CAIRO_ZLIB
+	bool "zlib support"
+	select BR2_PACKAGE_ZLIB
+
+config BR2_PACKAGE_CAIRO_SCRIPT
+	bool "script support"
+	select BR2_PACKAGE_CAIRO_ZLIB
+
+config BR2_PACKAGE_CAIRO_PS
+	bool "postscript support"
+	select BR2_PACKAGE_CAIRO_ZLIB
+
+config BR2_PACKAGE_CAIRO_PDF
+	bool "pdf support"
+	select BR2_PACKAGE_CAIRO_ZLIB
+
 config BR2_PACKAGE_CAIRO_XML
 	bool "xml support"
-	select BR2_PACKAGE_CAIRO_PNG
+	select BR2_PACKAGE_CAIRO_ZLIB
 
 endif
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 4515b76075..035eae525d 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -17,49 +17,43 @@ CAIRO_IGNORE_CVES += CVE-2019-6462
 # 0002-Fix-mask-usage-in-image-compositor.patch
 CAIRO_IGNORE_CVES += CVE-2020-35492
 
-CAIRO_CONF_ENV = LIBS="$(CAIRO_LIBS)"
+CAIRO_CFLAGS = $(TARGET_CFLAGS)
+CAIRO_LDFLAGS = $(TARGET_LDFLAGS)
 
 # relocation truncated to fit: R_68K_GOT16O
 ifeq ($(BR2_m68k_cf),y)
-CAIRO_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mxgot"
-endif
-
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),)
-CAIRO_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -DCAIRO_NO_MUTEX=1"
+CAIRO_CFLAGS += -mxgot
 endif
 
 # cairo can use C++11 atomics when available, so we need to link with
 # libatomic for the architectures who need libatomic.
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-CAIRO_LIBS += -latomic
+CAIRO_LDFLAGS += -latomic
 endif
 
 CAIRO_CONF_OPTS = \
-	--enable-trace=no \
-	--enable-interpreter=no
-
-CAIRO_DEPENDENCIES = host-pkgconf fontconfig pixman
+	-Dfontconfig=enabled \
+	-Dtests=disabled \
+	-Dspectre=disabled \
+	-Dc_std=gnu11
+CAIRO_DEPENDENCIES = \
+	host-pkgconf \
+	fontconfig \
+	pixman
 
 # Just the bare minimum to make other host-* packages happy
 HOST_CAIRO_CONF_OPTS = \
-	--enable-trace=no \
-	--enable-interpreter=no \
-	--disable-directfb \
-	--enable-ft \
-	--enable-gobject \
-	--disable-glesv2 \
-	--disable-vg \
-	--disable-xlib \
-	--disable-xcb \
-	--without-x \
-	--disable-xlib-xrender \
-	--disable-ps \
-	--disable-pdf \
-	--enable-png \
-	--enable-script \
-	--disable-svg \
-	--disable-tee \
-	--disable-xml
+	-Dfontconfig=enabled \
+	-Dfreetype=enabled \
+	-Dpng=enabled \
+	-Dtee=disabled \
+	-Dxcb=disabled \
+	-Dxlib=disabled \
+	-Dzlib=disabled \
+	-Dtests=disabled \
+	-Dglib=enabled \
+	-Dspectre=disabled \
+	-Dc_std=gnu11
 HOST_CAIRO_DEPENDENCIES = \
 	host-freetype \
 	host-fontconfig \
@@ -68,117 +62,50 @@ HOST_CAIRO_DEPENDENCIES = \
 	host-pixman \
 	host-pkgconf
 
-# DirectFB svg support rely on Cairo and Cairo DirectFB support depends on
-# DirectFB. Break circular dependency by disabling DirectFB support in Cairo
-# (which is experimental)
-ifeq ($(BR2_PACKAGE_DIRECTFB)x$(BR2_PACKAGE_DIRECTFB_SVG),yx)
-CAIRO_CONF_OPTS += --enable-directfb
-CAIRO_DEPENDENCIES += directfb
-else
-CAIRO_CONF_OPTS += --disable-directfb
-endif
-
-ifeq ($(BR2_PACKAGE_FREETYPE),y)
-CAIRO_CONF_OPTS += --enable-ft
-CAIRO_DEPENDENCIES += freetype
-else
-CAIRO_CONF_OPTS += --disable-ft
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
-CAIRO_DEPENDENCIES += libexecinfo
-CAIRO_LIBS += -lexecinfo
-endif
-
-ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-CAIRO_CONF_OPTS += --enable-gobject
-CAIRO_DEPENDENCIES += libglib2
-else
-CAIRO_CONF_OPTS += --disable-gobject
-endif
-
-# Can use GL or GLESv2 but not both
-ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
-CAIRO_CONF_OPTS += --enable-gl --disable-glesv2
-CAIRO_DEPENDENCIES += libgl
-else
-ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
-CAIRO_CONF_OPTS += --disable-gl --enable-glesv2
-CAIRO_DEPENDENCIES += libgles
-else
-CAIRO_CONF_OPTS += --disable-gl --disable-glesv2
-endif
-endif
-
-ifeq ($(BR2_PACKAGE_HAS_LIBOPENVG),y)
-CAIRO_CONF_OPTS += --enable-vg
-CAIRO_DEPENDENCIES += libopenvg
-else
-CAIRO_CONF_OPTS += --disable-vg
-endif
-
 ifeq ($(BR2_PACKAGE_LZO),y)
 CAIRO_DEPENDENCIES += lzo
 endif
 
-ifeq ($(BR2_PACKAGE_XORG7),y)
-CAIRO_CONF_OPTS += --enable-xlib --enable-xcb --with-x
-CAIRO_DEPENDENCIES += xlib_libX11 xlib_libXext
-else
-CAIRO_CONF_OPTS += --disable-xlib --disable-xcb --without-x
-endif
-
-ifeq ($(BR2_PACKAGE_XLIB_LIBXRENDER),y)
-CAIRO_CONF_OPTS += --enable-xlib-xrender
-CAIRO_DEPENDENCIES += xlib_libXrender
-else
-CAIRO_CONF_OPTS += --disable-xlib-xrender
-endif
-
-ifeq ($(BR2_PACKAGE_CAIRO_PS),y)
-CAIRO_CONF_OPTS += --enable-ps
-CAIRO_DEPENDENCIES += zlib
-else
-CAIRO_CONF_OPTS += --disable-ps
-endif
-
-ifeq ($(BR2_PACKAGE_CAIRO_PDF),y)
-CAIRO_CONF_OPTS += --enable-pdf
-CAIRO_DEPENDENCIES += zlib
+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+CAIRO_CONF_OPTS += -Dfreetype=enabled
+CAIRO_DEPENDENCIES += freetype
 else
-CAIRO_CONF_OPTS += --disable-pdf
+CAIRO_CONF_OPTS += -Dfreetype=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_CAIRO_PNG),y)
-CAIRO_CONF_OPTS += --enable-png
+CAIRO_CONF_OPTS += -Dpng=enabled
 CAIRO_DEPENDENCIES += libpng
 else
-CAIRO_CONF_OPTS += --disable-png
+CAIRO_CONF_OPTS += -Dpng=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_CAIRO_SCRIPT),y)
-CAIRO_CONF_OPTS += --enable-script
+ifeq ($(BR2_PACKAGE_CAIRO_TEE),y)
+CAIRO_CONF_OPTS += -Dtee=enabled
 else
-CAIRO_CONF_OPTS += --disable-script
+CAIRO_CONF_OPTS += -Dtee=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_CAIRO_SVG),y)
-CAIRO_CONF_OPTS += --enable-svg
+ifeq ($(BR2_PACKAGE_XORG7),y)
+CAIRO_CONF_OPTS += -Dxcb=enabled -Dxlib=enabled
+CAIRO_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXrender
 else
-CAIRO_CONF_OPTS += --disable-svg
+CAIRO_CONF_OPTS += -Dxcb=disabled -Dxlib=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_CAIRO_TEE),y)
-CAIRO_CONF_OPTS += --enable-tee
+ifeq ($(BR2_PACKAGE_CAIRO_ZLIB),y)
+CAIRO_CONF_OPTS += -Dzlib=enabled
+CAIRO_DEPENDENCIES += zlib
 else
-CAIRO_CONF_OPTS += --disable-tee
+CAIRO_CONF_OPTS += -Dzlib=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_CAIRO_XML),y)
-CAIRO_CONF_OPTS += --enable-xml
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+CAIRO_CONF_OPTS += -Dglib=enabled
+CAIRO_DEPENDENCIES += libglib2
 else
-CAIRO_CONF_OPTS += --disable-xml
+CAIRO_CONF_OPTS += -Dglib=disabled
 endif
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
