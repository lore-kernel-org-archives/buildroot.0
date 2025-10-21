Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3845CCD184
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 14:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75B8160AAA;
	Tue, 21 Oct 2025 14:10:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Quvu00gRMr7I; Tue, 21 Oct 2025 14:10:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B5BD606BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B5BD606BB;
	Tue, 21 Oct 2025 14:10:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2183D70A
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 14:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 139186065F
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 14:10:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hELjz3u6rXOW for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 14:10:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 071D4606BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 071D4606BB
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 071D4606BB
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 14:10:38 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b3c2c748bc8so706581366b.2
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 07:10:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761055837; x=1761660637;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wXMtkMElJNSMUUZoMeAR+68rqBJ4dhwhzEjLb/9JQHA=;
 b=LSeOFykGipFFNGLy4B6C62eAxtsrSRezQVEMmyH9cF/0tLIsNyfPpO4EbigjdHfV2Y
 OToiHLS78/hmaYqXyDD5QWKE+craT4snN0U1etAlO1Ty82yYJMnOaZbfAkNiGMlbjmem
 QNlXxNrRY991d64lNd6ZcO5XvkEShy2AhyAPC16W/xowb3U+nlPtgXDzdAtxuQP3d/2w
 cGDfz+/pzOae3r5+edNy2kVAyHlJ/RnbrTpu4UPI6eWuF9qAo0oGgCBsZ0v7cwGod/oG
 gbaJYG2I1X6xw4WTh5/WnfplhWVQqIYVUbfcxiO3yr4gxO9dyuBF/qZ6dXGDQKkM4A62
 wPGA==
X-Gm-Message-State: AOJu0YzrCCH3ngv7J733jRmQksCj0bEMjSS/O/JZ0suiKdG0xdtbe2QG
 LJUcJFG4lN+HGl2++uBW5FjGxc0mwWjmkJdQHK9BYLX/Yw6etTOrGKHXCojli6DhrstDK9GVfWt
 NS/g+4TE=
X-Gm-Gg: ASbGncvTabfYOZp5cqHQQzmYTZ2Uh0rVJpT1PDiSnVaMcpKQkcG7SaP6BxVU/xFndUW
 fcaqEewQuNWeVaXnEU2sVTVVC/fRvt4NKX3nUwO34IIUvPOID6QcXNkcUA0zSPKqOuOQbqTZT/V
 MklLT+zS3uvXaSmtReVcvcMG71kpm9H/gVkfImriqGuDpUO7aSfBuullxHgev/jgzefejmt3EQG
 CMPREu5dDVCkMBXmSjRQwr3YGQ2SE9o4ZNrnIZc/C+i//EX3RIG3zjZIZSsQIIbWGrs9AM6d3JR
 qWkIijaLGkW9cj7gRbExWsyVmNAVlpjOK13dfuNfBO4mWsWbf2mmojxbjtpiaczz5zcPlwqKbIu
 pfZzczeOYlDMxHh/CKDHJPCw99cfRestT/ixwxzpl/UshPRQPECdcUnbJQ4zdPtdUYMogdKuZGn
 Vd3239JbEbCJ7JQE37RzpjliD1
X-Google-Smtp-Source: AGHT+IGv9PkPDkKrbWqz3juRepyk94M7FnW5KwIdMxe09TvNVWhoIqHLM5ElCU5/n4gLWFzv52OgLw==
X-Received: by 2002:a17:907:2687:b0:b57:78fa:db46 with SMTP id
 a640c23a62f3a-b64764d7dabmr2234103166b.43.1761055836894; 
 Tue, 21 Oct 2025 07:10:36 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65ebb4dcf2sm1070899766b.75.2025.10.21.07.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 07:10:36 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Pieter De Gendt <pieter.degendt@gmail.com>
Date: Tue, 21 Oct 2025 16:10:20 +0200
Message-ID: <20251021141020.55010-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761055837; x=1761660637; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wXMtkMElJNSMUUZoMeAR+68rqBJ4dhwhzEjLb/9JQHA=;
 b=Wo7RKz+VD/0LN+C31lGbdG3T3w8u1bJz0rcn5T23j2kZ8+oZ9qbIB9uax/DoaRztpj
 bjRF3qeGB6q8uuaN0C6gu8Tu/1Ij0/bRCerwrP1hCaCR3G9IPYpBxNJnFWxTvbSm252C
 eGfLzF7K3esNjr7js/YZWReu4Mh8V+JrHJbnczXRW6ycE+osJr57WaM4DP3IlNiD4Iwf
 mqIjSOH1yB5MAdCJD0CJz6mrD3ZfrgE+EUaQyXg28qOsBblHBk0IzpUtKvmkEMf/LuRv
 GBlU7wKYmaJt7jbPE6SJ/gF77KgM/xHbtXwWkX4AO0ojw+Q7RJRebne07UZPuvIQ2Vum
 EWjg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Wo7RKz+V
Subject: [Buildroot] [PATCH] package/libvips: security bump to v8.17.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the many release notes: https://github.com/libvips/libvips/releases

Along that version bump:
- Change source code archive compression from .gz to .xz as this the
  new upstream delivery format
- Switch from autotools to meson build system (see upstream commit
  https://github.com/libvips/libvips/commit/538aa2a8415e10e5c30e4e8671ab5387ca4869fb)
- Update the LICENSE file (see upstream commit
  https://github.com/libvips/libvips/commit/057703938e76083f78760d64ece983dcf7be65ff)

This fixes the following vulnerabilities:
- CVE-2025-29769:
    libvips is a demand-driven, horizontally threaded image processing
    library.  The heifsave operation could incorrectly determine the
    presence of an alpha channel in an input when it was not possible to
    determine the colour interpretation, known internally within libvips
    as "multiband". There aren't many ways to create a "multiband" input,
    but it is possible with a well-crafted TIFF image. If a "multiband"
    TIFF input image had 4 channels and HEIF-based output was requested,
    this led to libvips creating a 3 channel HEIF image without an alpha
    channel but then attempting to write 4 channels of data. This caused a
    heap buffer overflow, which could crash the process. This
    vulnerability is fixed in 8.16.1.
    https://www.cve.org/CVERecord?id=CVE-2025-29769

- CVE-2025-59933:
    libvips is a demand-driven, horizontally threaded image processing
    library. For versions 8.17.1 and below, when libvips is compiled with
    support for PDF input via poppler, the pdfload operation is affected
    by a buffer read overflow when parsing the header of a crafted PDF
    with a page that defines a width but not a height. Those using libvips
    compiled without support for PDF input are unaffected as well as
    thosewith support for PDF input via PDFium. This issue is fixed in
    version 8.17.2. A workaround for those affected is to block the
    VipsForeignLoadPdf operation via vips_operation_block_set, which is
    available in most language bindings, or to set VIPS_BLOCK_UNTRUSTED
    environment variable at runtime, which will block all untrusted
    loaders including PDF input via poppler.
    https://www.cve.org/CVERecord?id=CVE-2025-59933

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libvips/libvips.hash |  6 +--
 package/libvips/libvips.mk   | 90 ++++++++++++++++--------------------
 2 files changed, 43 insertions(+), 53 deletions(-)

diff --git a/package/libvips/libvips.hash b/package/libvips/libvips.hash
index 1ba242d1cf..dd7510ecb2 100644
--- a/package/libvips/libvips.hash
+++ b/package/libvips/libvips.hash
@@ -1,3 +1,3 @@
-# Locally calculated
-sha256  2468088d958e0e2de1be2991ff8940bf45664a826c0dad12342e1804e2805a6e  vips-8.10.6.tar.gz
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
+# From https://github.com/libvips/libvips/releases/download/v8.17.2/vips-8.17.2.tar.xz.sha256sum
+sha256  57ea0ec4f30ea04748c9e8eec5415e7c9ac7cafe6822e4788fc110376a1d224a  vips-8.17.2.tar.xz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE
diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index 8eb1f0964e..35f9f1475a 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBVIPS_VERSION = 8.10.6
-LIBVIPS_SOURCE = vips-$(LIBVIPS_VERSION).tar.gz
+LIBVIPS_VERSION = 8.17.2
+LIBVIPS_SOURCE = vips-$(LIBVIPS_VERSION).tar.xz
 LIBVIPS_SITE = https://github.com/libvips/libvips/releases/download/v$(LIBVIPS_VERSION)
 LIBVIPS_LICENSE = LGPL-2.1+
 LIBVIPS_LICENSE_FILES = COPYING
@@ -22,135 +22,125 @@ LIBVIPS_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) $(LIBVIPS_CXXFLAGS)" \
 	LIBS=$(TARGET_NLS_LIBS)
 
 LIBVIPS_CONF_OPTS = \
-	--without-dmalloc \
-	--without-gsf \
-	--without-OpenEXR \
-	--without-openslide \
-	--without-cfitsio \
-	--without-pangoft2 \
-	--without-x
+	-Dopenexr=disabled \
+	-Dopenslide=disabled \
+	-Dcfitsio=disabled \
+	-Dpangocairo=disabled
 LIBVIPS_INSTALL_STAGING = YES
 LIBVIPS_DEPENDENCIES = \
 	host-pkgconf expat libglib2 \
 	$(TARGET_NLS_DEPENDENCIES)
 
-ifeq ($(BR2_PACKAGE_GIFLIB),y)
-LIBVIPS_CONF_OPTS += --with-giflib
-LIBVIPS_DEPENDENCIES += giflib
-else
-LIBVIPS_CONF_OPTS += --without-giflib
-endif
-
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-LIBVIPS_CONF_OPTS += --enable-introspection
+LIBVIPS_CONF_OPTS += -Dintrospection=enabled
 LIBVIPS_DEPENDENCIES += gobject-introspection
 else
-LIBVIPS_CONF_OPTS += --disable-introspection
+LIBVIPS_CONF_OPTS += -Dintrospection=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_IMAGEMAGICK),y)
 LIBVIPS_CONF_OPTS += \
-	--with-magick \
-	--with-magickpackage=MagickCore
+	-Dmagick=enabled \
+	-Dmagick-package=MagickCore
 LIBVIPS_DEPENDENCIES += imagemagick
 else ifeq ($(BR2_PACKAGE_GRAPHICSMAGICK),y)
 LIBVIPS_CONF_OPTS += \
-	--with-magick \
-	--with-magickpackage=GraphicsMagick
+	-Dmagick=enabled \
+	-Dmagick-package=GraphicsMagick
 LIBVIPS_DEPENDENCIES += graphicsmagick
 else
-LIBVIPS_CONF_OPTS += --without-magick
+LIBVIPS_CONF_OPTS += -Dmagick=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
-LIBVIPS_CONF_OPTS += --with-jpeg
+LIBVIPS_CONF_OPTS += -Djpeg=enabled
 LIBVIPS_DEPENDENCIES += jpeg
 else
-LIBVIPS_CONF_OPTS += --without-jpeg
+LIBVIPS_CONF_OPTS += -Djpeg=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LCMS2),y)
-LIBVIPS_CONF_OPTS += --with-lcms
+LIBVIPS_CONF_OPTS += -Dlcms=enabled
 LIBVIPS_DEPENDENCIES += lcms2
 else
-LIBVIPS_CONF_OPTS += --without-lcms
+LIBVIPS_CONF_OPTS += -Dlcms=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
-LIBVIPS_CONF_OPTS += --with-png
+LIBVIPS_CONF_OPTS += -Dpng=enabled
 LIBVIPS_DEPENDENCIES += libpng
 else
-LIBVIPS_CONF_OPTS += --without-png
+LIBVIPS_CONF_OPTS += -Dpng=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBRSVG),y)
-LIBVIPS_CONF_OPTS += --with-rsvg
+LIBVIPS_CONF_OPTS += -Drsvg=enabled
 LIBVIPS_DEPENDENCIES += librsvg
 else
-LIBVIPS_CONF_OPTS += --without-rsvg
+LIBVIPS_CONF_OPTS += -Drsvg=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MATIO),y)
-LIBVIPS_CONF_OPTS += --with-matio
+LIBVIPS_CONF_OPTS += -Dmatio=enabled
 LIBVIPS_DEPENDENCIES += matio
 else
-LIBVIPS_CONF_OPTS += --without-matio
+LIBVIPS_CONF_OPTS += -Dmatio=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_ORC),y)
-LIBVIPS_CONF_OPTS += --with-orc
+LIBVIPS_CONF_OPTS += -Dorc=enabled
 LIBVIPS_DEPENDENCIES += orc
 else
-LIBVIPS_CONF_OPTS += --without-orc
+LIBVIPS_CONF_OPTS += -Dorc=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_POPPLER),y)
-LIBVIPS_CONF_OPTS += --with-poppler
+LIBVIPS_CONF_OPTS += -Dpoppler=enabled
 LIBVIPS_DEPENDENCIES += poppler
 else
-LIBVIPS_CONF_OPTS += --without-poppler
+LIBVIPS_CONF_OPTS += -Dpoppler=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_TIFF),y)
-LIBVIPS_CONF_OPTS += --with-tiff
+LIBVIPS_CONF_OPTS += -Dtiff=enabled
 LIBVIPS_DEPENDENCIES += tiff
 else
-LIBVIPS_CONF_OPTS += --without-tiff
+LIBVIPS_CONF_OPTS += -Dtiff=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_FFTW_DOUBLE),y)
-LIBVIPS_CONF_OPTS += --with-fftw
+LIBVIPS_CONF_OPTS += -Dfftw=enabled
 LIBVIPS_DEPENDENCIES += fftw-double
 else
-LIBVIPS_CONF_OPTS += --without-fftw
+LIBVIPS_CONF_OPTS += -Dfftw=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEXIF),y)
-LIBVIPS_CONF_OPTS += --with-libexif
+LIBVIPS_CONF_OPTS += -Dexif=enabled
 LIBVIPS_DEPENDENCIES += libexif
 else
-LIBVIPS_CONF_OPTS += --without-libexif
+LIBVIPS_CONF_OPTS += -Dexif=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBHEIF),y)
-LIBVIPS_CONF_OPTS += --with-heif
+LIBVIPS_CONF_OPTS += -Dheif=enabled
 LIBVIPS_DEPENDENCIES += libheif
 else
-LIBVIPS_CONF_OPTS += --without-heif
+LIBVIPS_CONF_OPTS += -Dheif=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_WEBP_DEMUX)$(BR2_PACKAGE_WEBP_MUX),yy)
-LIBVIPS_CONF_OPTS += --with-libwebp
+LIBVIPS_CONF_OPTS += -Dwebp=enabled
 LIBVIPS_DEPENDENCIES += webp
 else
-LIBVIPS_CONF_OPTS += --without-libwebp
+LIBVIPS_CONF_OPTS += -Dwebp=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-LIBVIPS_CONF_OPTS += --with-zlib
+LIBVIPS_CONF_OPTS += -Dzlib=enabled
 LIBVIPS_DEPENDENCIES += zlib
 else
-LIBVIPS_CONF_OPTS += --without-zlib
+LIBVIPS_CONF_OPTS += -Dzlib=disabled
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
