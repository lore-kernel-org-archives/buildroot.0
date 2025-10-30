Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D8BCCF9F8
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EDF58118A;
	Thu, 30 Oct 2025 08:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vvOhcs7LfdkV; Thu, 30 Oct 2025 08:23:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC459810E1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC459810E1;
	Thu, 30 Oct 2025 08:23:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2788A2A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 178BD40793
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5NfX4r3tu6Jo for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:23:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0407D40748
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0407D40748
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0407D40748
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:47 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47114a40161so8294065e9.3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 01:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761812626; x=1762417426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=62vbd/NqtVbvydyL5Hud1qCHqQt7Qjh6bhh3BM68J7A=;
 b=LyIMedaLRoFnS6GUagmDEeiSU2XvMDDc2VbCWLm2iqh1MTAKcOKEqQWudZfjKoMk+H
 92lTwgjqtUezP31dk18HpG4Ar25NXkWTDAI3weQ/lTnuzVaISz6w8YtXgl+oKFOOxmFU
 coZAYjy8l6ItrSsqjedpfAcYaj5dzyeQ9te62dPckAmOgsDFVOYS5ufT2SOKoXV+7I+4
 t8BQOdQfcvvPFiweUmZwQoqe/0YF0QRDBsIw2KHCfymRmXeo1BKe2G+SuxLOuSkq2Eba
 FzeTQE1cOdauyqRH5oaax58t8hYwtRAXPHa/Bu85R/bXGDo9zMGRKzsWXwn8ARIUFTYc
 MuwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdPi9ikqIE0GdbFai1PB20GX9pZEcmr/OW4WdxTVAlCY0NUGFN0h1XS8gN4nx3gAhKhPJmln5Jz2g=@buildroot.org
X-Gm-Message-State: AOJu0YyCWNlBZN7IzMiAbNeehhmWsGgJYLVlYsmylH4HIKQMCM3pxj7F
 JET2/Hpcmqhavc0yR2Va11kVQcGW0ltrd0i12m04ZpDdE5qFfL4+zeXn4ElYg9gMWqA=
X-Gm-Gg: ASbGnctlmLcXcg42+WV0ne4gL5+Tng7lVlqUuEGnLhgGnAN1+T/0ojhNVm5OzD5rhfx
 PLnEFkI75SLoBfy6+7W12+gwYrhGsKJyZrFF5Dbm1P4hQ9UUY+GiY90oIKmvmb25sc9fQ0zHJFk
 EmqPQA90bdvkcHIvnzSmndpUJNSh0EKYyvEa4xkNwJbSJ8EUhIVLUv4XKzb0AlzXoNpytLvXkpg
 JX9pkOaDZXMlJyzCaWFK+UiSYECYxmi1EqNjZ5jkOvw0fvxbvFyd0gipVvBHguU8PdVFMJng/fY
 fIgb66Vu5d//cV5Qf4OWN9AfGPrto1scwvgMVwOvCRHmXFczxaT8A/AE1lobsbbejmXIZazBxza
 UusPNlvl8L50TN9shHetNTeDKWesO7//mbHxqcMXke3uv+grAPWogrVRr/ifHz/ukfuEi6fYiHV
 b2cOG2nxZ6z+P7daDYfDAh09eZFA==
X-Google-Smtp-Source: AGHT+IHm3MRsVczcMfDUitGdohIBl8PbdvbA6tQLE97PrWG4E4lVvOELEMkCq5jjXnLylHOel1+9uA==
X-Received: by 2002:a05:600c:46ce:b0:471:15c1:45b9 with SMTP id
 5b1f17b1804b1-4771e3b84c0mr61097865e9.29.1761812625925; 
 Thu, 30 Oct 2025 01:23:45 -0700 (PDT)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477289b0dbesm27065225e9.5.2025.10.30.01.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 01:23:45 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:23:45 +0100
Message-ID: <20251030082345.34928-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021141020.55010-1-titouan.christophe@mind.be>
References: <20251021141020.55010-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761812626; x=1762417426; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=62vbd/NqtVbvydyL5Hud1qCHqQt7Qjh6bhh3BM68J7A=;
 b=g5jmUDEvLXKQtDXZhnLVJQ7zzASsg4AssgSmMpeGGeWRFjYTdLMFg4fyPNfMkDX02i
 k2vTa0kYZCVDbSG4XuesVcxnPZBwzMM44G96Ue21kz2hv//WuVcvbGqImV/vkUBohb6i
 MpMxocnIos+Ohy08FJfy6xwJMoJ1Ivq7yZhDUY7WSlg5RyExcNzOLXhB8qxFb3UZzp27
 vacI9WK0wVsgl3WWISTAWdDRm1R6QvOgL9UXl9wgAjGUlTJniCfaxd8yOzhl+GHdWfMD
 OGxlAvIekNRcpuQkmNGPE3x8F3WXptHuTE1s5WKUBn2GwmnUDYft8TN1Y9pKjkAagqGR
 TogA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=g5jmUDEv
Subject: Re: [Buildroot] [PATCH] package/libvips: security bump to v8.17.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> See the many release notes: https://github.com/libvips/libvips/releases
> 
> Along that version bump:
> - Change source code archive compression from .gz to .xz as this the
>   new upstream delivery format
> - Switch from autotools to meson build system (see upstream commit
>   https://github.com/libvips/libvips/commit/538aa2a8415e10e5c30e4e8671ab5387ca4869fb)
> - Update the LICENSE file (see upstream commit
>   https://github.com/libvips/libvips/commit/057703938e76083f78760d64ece983dcf7be65ff)
> 
> This fixes the following vulnerabilities:
> - CVE-2025-29769:
>     libvips is a demand-driven, horizontally threaded image processing
>     library.  The heifsave operation could incorrectly determine the
>     presence of an alpha channel in an input when it was not possible to
>     determine the colour interpretation, known internally within libvips
>     as "multiband". There aren't many ways to create a "multiband" input,
>     but it is possible with a well-crafted TIFF image. If a "multiband"
>     TIFF input image had 4 channels and HEIF-based output was requested,
>     this led to libvips creating a 3 channel HEIF image without an alpha
>     channel but then attempting to write 4 channels of data. This caused a
>     heap buffer overflow, which could crash the process. This
>     vulnerability is fixed in 8.16.1.
>     https://www.cve.org/CVERecord?id=CVE-2025-29769
> 
> - CVE-2025-59933:
>     libvips is a demand-driven, horizontally threaded image processing
>     library. For versions 8.17.1 and below, when libvips is compiled with
>     support for PDF input via poppler, the pdfload operation is affected
>     by a buffer read overflow when parsing the header of a crafted PDF
>     with a page that defines a width but not a height. Those using libvips
>     compiled without support for PDF input are unaffected as well as
>     thosewith support for PDF input via PDFium. This issue is fixed in
>     version 8.17.2. A workaround for those affected is to block the
>     VipsForeignLoadPdf operation via vips_operation_block_set, which is
>     available in most language bindings, or to set VIPS_BLOCK_UNTRUSTED
>     environment variable at runtime, which will block all untrusted
>     loaders including PDF input via poppler.
>     https://www.cve.org/CVERecord?id=CVE-2025-59933
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2025.08.x. Thanks

> ---
>  package/libvips/libvips.hash |  6 +--
>  package/libvips/libvips.mk   | 90 ++++++++++++++++--------------------
>  2 files changed, 43 insertions(+), 53 deletions(-)
> 
> diff --git a/package/libvips/libvips.hash b/package/libvips/libvips.hash
> index 1ba242d1cf..dd7510ecb2 100644
> --- a/package/libvips/libvips.hash
> +++ b/package/libvips/libvips.hash
> @@ -1,3 +1,3 @@
> -# Locally calculated
> -sha256  2468088d958e0e2de1be2991ff8940bf45664a826c0dad12342e1804e2805a6e  vips-8.10.6.tar.gz
> -sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> +# From https://github.com/libvips/libvips/releases/download/v8.17.2/vips-8.17.2.tar.xz.sha256sum
> +sha256  57ea0ec4f30ea04748c9e8eec5415e7c9ac7cafe6822e4788fc110376a1d224a  vips-8.17.2.tar.xz
> +sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE
> diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
> index 8eb1f0964e..35f9f1475a 100644
> --- a/package/libvips/libvips.mk
> +++ b/package/libvips/libvips.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -LIBVIPS_VERSION = 8.10.6
> -LIBVIPS_SOURCE = vips-$(LIBVIPS_VERSION).tar.gz
> +LIBVIPS_VERSION = 8.17.2
> +LIBVIPS_SOURCE = vips-$(LIBVIPS_VERSION).tar.xz
>  LIBVIPS_SITE = https://github.com/libvips/libvips/releases/download/v$(LIBVIPS_VERSION)
>  LIBVIPS_LICENSE = LGPL-2.1+
>  LIBVIPS_LICENSE_FILES = COPYING
> @@ -22,135 +22,125 @@ LIBVIPS_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) $(LIBVIPS_CXXFLAGS)" \
>  	LIBS=$(TARGET_NLS_LIBS)
>  
>  LIBVIPS_CONF_OPTS = \
> -	--without-dmalloc \
> -	--without-gsf \
> -	--without-OpenEXR \
> -	--without-openslide \
> -	--without-cfitsio \
> -	--without-pangoft2 \
> -	--without-x
> +	-Dopenexr=disabled \
> +	-Dopenslide=disabled \
> +	-Dcfitsio=disabled \
> +	-Dpangocairo=disabled
>  LIBVIPS_INSTALL_STAGING = YES
>  LIBVIPS_DEPENDENCIES = \
>  	host-pkgconf expat libglib2 \
>  	$(TARGET_NLS_DEPENDENCIES)
>  
> -ifeq ($(BR2_PACKAGE_GIFLIB),y)
> -LIBVIPS_CONF_OPTS += --with-giflib
> -LIBVIPS_DEPENDENCIES += giflib
> -else
> -LIBVIPS_CONF_OPTS += --without-giflib
> -endif
> -
>  ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> -LIBVIPS_CONF_OPTS += --enable-introspection
> +LIBVIPS_CONF_OPTS += -Dintrospection=enabled
>  LIBVIPS_DEPENDENCIES += gobject-introspection
>  else
> -LIBVIPS_CONF_OPTS += --disable-introspection
> +LIBVIPS_CONF_OPTS += -Dintrospection=disabled
>  endif
>  
>  ifeq ($(BR2_PACKAGE_IMAGEMAGICK),y)
>  LIBVIPS_CONF_OPTS += \
> -	--with-magick \
> -	--with-magickpackage=MagickCore
> +	-Dmagick=enabled \
> +	-Dmagick-package=MagickCore
>  LIBVIPS_DEPENDENCIES += imagemagick
>  else ifeq ($(BR2_PACKAGE_GRAPHICSMAGICK),y)
>  LIBVIPS_CONF_OPTS += \
> -	--with-magick \
> -	--with-magickpackage=GraphicsMagick
> +	-Dmagick=enabled \
> +	-Dmagick-package=GraphicsMagick
>  LIBVIPS_DEPENDENCIES += graphicsmagick
>  else
> -LIBVIPS_CONF_OPTS += --without-magick
> +LIBVIPS_CONF_OPTS += -Dmagick=disabled
>  endif
>  
>  ifeq ($(BR2_PACKAGE_JPEG),y)
> -LIBVIPS_CONF_OPTS += --with-jpeg
> +LIBVIPS_CONF_OPTS += -Djpeg=enabled
>  LIBVIPS_DEPENDENCIES += jpeg
>  else
> -LIBVIPS_CONF_OPTS += --without-jpeg
> +LIBVIPS_CONF_OPTS += -Djpeg=disabled
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LCMS2),y)
> -LIBVIPS_CONF_OPTS += --with-lcms
> +LIBVIPS_CONF_OPTS += -Dlcms=enabled
>  LIBVIPS_DEPENDENCIES += lcms2
>  else
> -LIBVIPS_CONF_OPTS += --without-lcms
> +LIBVIPS_CONF_OPTS += -Dlcms=disabled
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBPNG),y)
> -LIBVIPS_CONF_OPTS += --with-png
> +LIBVIPS_CONF_OPTS += -Dpng=enabled
>  LIBVIPS_DEPENDENCIES += libpng
>  else
> -LIBVIPS_CONF_OPTS += --without-png
> +LIBVIPS_CONF_OPTS += -Dpng=disabled
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBRSVG),y)
> -LIBVIPS_CONF_OPTS += --with-rsvg
> +LIBVIPS_CONF_OPTS += -Drsvg=enabled
>  LIBVIPS_DEPENDENCIES += librsvg
>  else
> -LIBVIPS_CONF_OPTS += --without-rsvg
> +LIBVIPS_CONF_OPTS += -Drsvg=disabled
>  endif
>  
>  ifeq ($(BR2_PACKAGE_MATIO),y)
> -LIBVIPS_CONF_OPTS += --with-matio
> +LIBVIPS_CONF_OPTS += -Dmatio=enabled
>  LIBVIPS_DEPENDENCIES += matio
>  else
> -LIBVIPS_CONF_OPTS += --without-matio
> +LIBVIPS_CONF_OPTS += -Dmatio=disabled
>  endif
>  
>  ifeq ($(BR2_PACKAGE_ORC),y)
> -LIBVIPS_CONF_OPTS += --with-orc
> +LIBVIPS_CONF_OPTS += -Dorc=enabled
>  LIBVIPS_DEPENDENCIES += orc
>  else
> -LIBVIPS_CONF_OPTS += --without-orc
> +LIBVIPS_CONF_OPTS += -Dorc=disabled
>  endif
>  
>  ifeq ($(BR2_PACKAGE_POPPLER),y)
> -LIBVIPS_CONF_OPTS += --with-poppler
> +LIBVIPS_CONF_OPTS += -Dpoppler=enabled
>  LIBVIPS_DEPENDENCIES += poppler
>  else
> -LIBVIPS_CONF_OPTS += --without-poppler
> +LIBVIPS_CONF_OPTS += -Dpoppler=disabled
>  endif
>  
>  ifeq ($(BR2_PACKAGE_TIFF),y)
> -LIBVIPS_CONF_OPTS += --with-tiff
> +LIBVIPS_CONF_OPTS += -Dtiff=enabled
>  LIBVIPS_DEPENDENCIES += tiff
>  else
> -LIBVIPS_CONF_OPTS += --without-tiff
> +LIBVIPS_CONF_OPTS += -Dtiff=disabled
>  endif
>  
>  ifeq ($(BR2_PACKAGE_FFTW_DOUBLE),y)
> -LIBVIPS_CONF_OPTS += --with-fftw
> +LIBVIPS_CONF_OPTS += -Dfftw=enabled
>  LIBVIPS_DEPENDENCIES += fftw-double
>  else
> -LIBVIPS_CONF_OPTS += --without-fftw
> +LIBVIPS_CONF_OPTS += -Dfftw=disabled
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBEXIF),y)
> -LIBVIPS_CONF_OPTS += --with-libexif
> +LIBVIPS_CONF_OPTS += -Dexif=enabled
>  LIBVIPS_DEPENDENCIES += libexif
>  else
> -LIBVIPS_CONF_OPTS += --without-libexif
> +LIBVIPS_CONF_OPTS += -Dexif=disabled
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBHEIF),y)
> -LIBVIPS_CONF_OPTS += --with-heif
> +LIBVIPS_CONF_OPTS += -Dheif=enabled
>  LIBVIPS_DEPENDENCIES += libheif
>  else
> -LIBVIPS_CONF_OPTS += --without-heif
> +LIBVIPS_CONF_OPTS += -Dheif=disabled
>  endif
>  
>  ifeq ($(BR2_PACKAGE_WEBP_DEMUX)$(BR2_PACKAGE_WEBP_MUX),yy)
> -LIBVIPS_CONF_OPTS += --with-libwebp
> +LIBVIPS_CONF_OPTS += -Dwebp=enabled
>  LIBVIPS_DEPENDENCIES += webp
>  else
> -LIBVIPS_CONF_OPTS += --without-libwebp
> +LIBVIPS_CONF_OPTS += -Dwebp=disabled
>  endif
>  
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
> -LIBVIPS_CONF_OPTS += --with-zlib
> +LIBVIPS_CONF_OPTS += -Dzlib=enabled
>  LIBVIPS_DEPENDENCIES += zlib
>  else
> -LIBVIPS_CONF_OPTS += --without-zlib
> +LIBVIPS_CONF_OPTS += -Dzlib=disabled
>  endif
>  
> -$(eval $(autotools-package))
> +$(eval $(meson-package))
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
