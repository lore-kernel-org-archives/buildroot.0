Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2600DC47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 10:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C549341E28;
	Sun,  7 Jan 2024 10:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C549341E28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XSRzFuHImX9V; Sun,  7 Jan 2024 10:56:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BAD741DFC;
	Sun,  7 Jan 2024 10:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BAD741DFC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 39FAB1BF3DA
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 10:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F13A41DF2
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 10:55:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F13A41DF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vnjJKAVX9jDS for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 10:55:53 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02CBD41DF5
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 10:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02CBD41DF5
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-40d4a7f0c4dso11462355e9.1
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 02:55:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704624950; x=1705229750;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A5+b1mK7myw8jbzGWXBpz2n24Ck0O/ee4wWEJhFwU8k=;
 b=nf20YW75WYCvu6yrZwO5oVeE0dh0kJK04T3F6QPob2MiQOLpJ2Whc9D1ec72LvvdfJ
 oCC2mVP9vHiW3X+FtJm2wlg6blCmR1xIINFBItGg1pmw7vCP/INvmTCgyAlSY80kfIa3
 qJvVPfrZW8ZPkzCuCYqgO88xQHXgjVi4JxLychFmaBA2F3n6iE3CsX7W5wkCoWGrtxEE
 jjXLm2/DHCVoAzjSoFV11XUuuxKJXnzNz84nuvEp8KK8ranN8H92U3DBZ+fqsfRUvo8S
 0XcXRM6cYDanCt/mbgogAtUX68fVVjCWAGlqXLGLKHtPOaww1BkbCi/7Yw2IQYWrP3F2
 iABw==
X-Gm-Message-State: AOJu0Yyai/vqrQpC3p7ic/BF/a9mAnJ8f164lhG6HaN2G8i0ORHq/kRp
 mLQJeAbCBAo+mrQ+CQn6OR4D23tGrl0U5w==
X-Google-Smtp-Source: AGHT+IHXWm2Mu2mSMuqjwYC5AbQryeuB4ElQ204Tjd8Uk/JUiuWO/uQZpKJrvbkpSkUTVIR+oqA50w==
X-Received: by 2002:a05:600c:4f89:b0:40d:91fd:7bd4 with SMTP id
 n9-20020a05600c4f8900b0040d91fd7bd4mr1023231wmq.177.1704624949868; 
 Sun, 07 Jan 2024 02:55:49 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:1aa4:9ced:e5bf:3268])
 by smtp.gmail.com with ESMTPSA id
 bg40-20020a05600c3ca800b0040d83ab2ecdsm7304584wmb.21.2024.01.07.02.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 02:55:49 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jan 2024 11:55:38 +0100
Message-Id: <20240107105539.1214363-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240107105539.1214363-1-thomas@devoogdt.com>
References: <20240105101105.6a181dcd@windsurf>
 <20240107105539.1214363-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 2/3] package/cairo: move to the meson build
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
v6: fix host-zlib option (again)
---
 package/cairo/Config.in |  34 ++++----
 package/cairo/cairo.mk  | 168 ++++++++++++----------------------------
 2 files changed, 66 insertions(+), 136 deletions(-)

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
index 4515b76075..190af15da0 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -17,168 +17,96 @@ CAIRO_IGNORE_CVES += CVE-2019-6462
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
+	-Dzlib=enabled \
+	-Dtests=disabled \
+	-Dglib=enabled \
+	-Dspectre=disabled \
+	-Dc_std=gnu11
 HOST_CAIRO_DEPENDENCIES = \
 	host-freetype \
 	host-fontconfig \
 	host-libglib2 \
 	host-libpng \
 	host-pixman \
-	host-pkgconf
-
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
+	host-pkgconf \
+	host-zlib
 
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
