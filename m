Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2411AC5DF6D
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 19:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F5F280E17;
	Sun, 16 Aug 2026 19:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hvZvwn9ZCGlW; Sun, 16 Aug 2026 19:18:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D17480E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786907885;
	bh=Erkvy83LTAJo1ouMTgEqsD+3TsWsjhPnUrHFov/h5AY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n/UPzzbAIfsxkW7/agPIpf+rK4RyioaZ/P9fjbZh5GJNZeCHuNKm3es/WgIK1zgIE
	 WNvRUtOFQUlH5aHTZWe7/Q1SKqX1SRNMkBarXractNGItRiqFZdYv14ukSubjXvmJt
	 /rGwVka90aRLkQIUNLZTrUGup6NW/nPQjECKHrrngYDS0B7ZZzX3GGH0lrs3wi821b
	 Ltp+NAxe8/r6/0tpQ9x5M12n6zq2DtG/689v6KiVcsMcuze5yU0ZrVfnxli9wsCgbU
	 sZ6/OQltz6wgXmwhgLBVIKqY8yEruVVxxYwt+bvlTuH1M/WRyDo2cp+2fXJI54Oin8
	 /ZqYz1GMzofmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D17480E0D;
	Sun, 16 Aug 2026 19:18:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8395B3A0
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 757CE4009D
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9diof0Lu9k9i for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 19:18:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::729; helo=mail-qk1-x729.google.com;
 envelope-from=alseycmiller@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7210E40063
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7210E40063
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=BLeIB1pi
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7210E40063
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:18:00 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-92e7c6ec9dbso122617385a.0
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 12:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786907879; x=1787512679; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vtmL9QtzpI1GjvnwRsYHxT5Uyv/Iu4ox+lv+/PAnsZM=;
 b=BLeIB1pi/2cG4k92zJdjubfWPchqkGlFQmV5yL+K9z+jR6i2ms1v5/IsmI+QH6ndO6
 B1WnhPi4zwajl5wdEacwBVbyXDwAPYxdrCo37BNSbt/C7RRiDbKrkS9WwxdgC+sKf3X/
 pw0a9E1XBr5qceQY7Ydq+D/+PjG6PdEkRHXVvk1emc3ex5lLawCRKolsFuEFT/Wh6/0Z
 YCZNd0DdY+6EPsJHZM8BrbYW9qdWKd/u7dA/cn3hDXdjPUL+F4fqH3QjNAnJkdPFJLqz
 5SD3Dri0h8yA61dwjIfJ/Vh7TZoGl/soXNbbjWOfDwG3fA3uq4qLjgFTBBHX3Gk0F6rI
 IVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786907879; x=1787512679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=vtmL9QtzpI1GjvnwRsYHxT5Uyv/Iu4ox+lv+/PAnsZM=;
 b=EOpNzP12omRgMSOer4/zr+sFdqD4Euh9V+ZEiES3j9Sav4hR6ccASVyNTrkMo54Xl+
 w4yZrXmTXzOfrk4Sk0XwCMANyBRVO2qboFkg6P3CmrFASEHezFYS6rCuO5I105YgvWj9
 mHJ9GQPypSrzAEUJPwdhGODE50Ya7lqXyMxkBQXqlw4DTjpW/wkm0J+Uv1jrHh+L6Yx+
 5fWG95i1ofFektI13hNpXOkweqexXUNlJXVpW4/c0/xZYFAow3nBpDIKQd9niwmUdwmg
 +ADRTk5u2WuKSJ+E0LQ7xkaONDwzz63nHZ2TJ4F3zEeTLwiE7x3mI3x2QuFSk2wVlV0M
 SW9w==
X-Gm-Message-State: AOJu0YwSH3dzb0rdbRRWswiJUMb2Eqi0yKMe/RJts9Km6qrrgbIW8f27
 7j1CQi32QGgjW3V3h1NMt9sg2H+1y5aINX4zeKUn0DLWGGdsERJV7MKZNZLBjQ==
X-Gm-Gg: AR+sD13i5sON5zJ9zDX34Lm9ZwRjHnwPLkEao0mwJOtuTqYafAgDUOBuTiUIBaJMguf
 V3L1uBL2XuX72ioI8yAovowv/8yYJ+DFyVAEdKNpmodiN9pbctrdlu8AkLgKNPODGpLB5U37yv+
 vAJAxq/AidlgdZicsjuytjMKn08hcoI005tWNX1RtDpNrxTGejXs7JgvGnKtNw0qemqSW4ocWjD
 evnFkEA80aTkfd7PH9YDKBDfasEj8w7TsdF1Rc/IuawbxbB0M0T46rD8isShpUxb7eyA4PqdMVU
 PK3kq5zg/FaNjSlmuq5MeunLNb4x2K3JheD8X+0zXSn17ZkWG11er6ryschKesHTciMsB8/aaDw
 locmZIAsZBe5bKdlR11cVnSEMsNBwJy3c8kp21EJirzeovwqMV8EUtXEBhkWJk/GOiAcI9cw252
 0DzyUYdwGPBzPpLgBQ6VyDl9P0v9VO4E6mrbIlBpuf0CS378JWZEbxizgwc7y849EPY9i2MByS+
 16ltwfZNmBGMM4=
X-Received: by 2002:a05:620a:a1d4:b0:92e:fe59:d619 with SMTP id
 af79cd13be357-936d224b369mr1992060585a.10.1786907879022; 
 Sun, 16 Aug 2026 12:17:59 -0700 (PDT)
Received: from optiplex-7020.tail176fc.ts.net ([67.21.186.162])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-936cdf561efsm825489585a.8.2026.08.16.12.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2026 12:17:58 -0700 (PDT)
From: Alsey Coleman Miller <alseycmiller@gmail.com>
To: buildroot@buildroot.org
Cc: Michael Fischer <mf@go-sys.de>,
 Alsey Coleman Miller <alseycmiller@gmail.com>
Date: Sun, 16 Aug 2026 15:18:26 -0400
Message-ID: <20260816191830.533747-5-alseycmiller@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260816191830.533747-1-alseycmiller@gmail.com>
References: <20260816191830.533747-1-alseycmiller@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/8] package/sdl3_image: bump to version 3.4.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

3.1.1 is a prerelease. 3.4.4 is the current release, and the option
names changed with it: PNG is now SDLIMAGE_PNG_LIBPNG, with
SDLIMAGE_BACKEND_STB selecting the built-in decoder used when no helper
library is available.

Build the optional format backends according to the image libraries
already in the configuration - AVIF, JPEG, TIFF, WEBP and JXL alongside
the existing PNG - rather than PNG alone. VENDORED stays off so the
copies of those libraries carried in the tarball are not used, and
DEPS_SHARED off so they are linked rather than dlopen()ed.

The formats SDL3_image decodes by itself (BMP, GIF, LBM, PCX, PNM, QOI,
SVG, TGA, XCF, XPM, XV) need no helper and are always available.

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
---
 package/sdl3_image/Config.in       | 10 ++++-
 package/sdl3_image/sdl3_image.hash |  4 +-
 package/sdl3_image/sdl3_image.mk   | 62 ++++++++++++++++++++++++++++--
 3 files changed, 68 insertions(+), 8 deletions(-)

diff --git a/package/sdl3_image/Config.in b/package/sdl3_image/Config.in
index 9b9c4f0d74..b93d40c1e7 100644
--- a/package/sdl3_image/Config.in
+++ b/package/sdl3_image/Config.in
@@ -3,7 +3,13 @@ config BR2_PACKAGE_SDL3_IMAGE
 	depends on BR2_PACKAGE_SDL3
 	help
 	  SDL3_image is an image file loading library. It loads images
-	  as SDL surfaces, and supports the following formats: BMP,
-	  GIF, JPEG, LBM, PCX, PNG, PNM, TGA, TIFF, XCF, XPM, XV.
+	  as SDL surfaces, and supports the following formats: AVIF,
+	  BMP, GIF, JPEG, JXL, LBM, PCX, PNG, PNM, QOI, SVG, TGA, TIFF,
+	  WEBP, XCF, XPM, XV.
+
+	  The formats needing a helper library are built according to
+	  the image libraries enabled in the configuration (jpeg,
+	  libpng, tiff, webp, libjxl, libavif); the rest are decoded by
+	  SDL3_image itself and are always available.
 
 	  http://www.libsdl.org/projects/SDL_image/
diff --git a/package/sdl3_image/sdl3_image.hash b/package/sdl3_image/sdl3_image.hash
index 83f5e7eaf1..c7ddbdc43b 100644
--- a/package/sdl3_image/sdl3_image.hash
+++ b/package/sdl3_image/sdl3_image.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d5685f220d5ae99439d710d808d8c478c6ccfaac539876929239b875a6723792  SDL3_image-3.1.1.tar.gz
-sha256  7826eca0a0f7e591f38dd844e207a200aac81a59b20d8a30c3af8c6282af13e6  LICENSE.txt
+sha256  29751304a13d25ac513f24305fa25b06a6edd9607718c90129b8350d35fc5573  SDL3_image-3.4.4.tar.gz
+sha256  e36997fe492c48e7ed873065cc3a694f38e8189a328d3709099ffdc9a8843f4c  LICENSE.txt
diff --git a/package/sdl3_image/sdl3_image.mk b/package/sdl3_image/sdl3_image.mk
index fadb870b6f..ac3e375551 100644
--- a/package/sdl3_image/sdl3_image.mk
+++ b/package/sdl3_image/sdl3_image.mk
@@ -4,19 +4,73 @@
 #
 ################################################################################
 
-SDL3_IMAGE_VERSION = 3.1.1
+SDL3_IMAGE_VERSION = 3.4.4
 SDL3_IMAGE_SITE = https://www.libsdl.org/projects/SDL_image/release
 SDL3_IMAGE_SOURCE = SDL3_image-$(SDL3_IMAGE_VERSION).tar.gz
 SDL3_IMAGE_LICENSE = Zlib
 SDL3_IMAGE_LICENSE_FILES = LICENSE.txt
+SDL3_IMAGE_CPE_ID_VENDOR = libsdl
+SDL3_IMAGE_CPE_ID_PRODUCT = sdl_image
 SDL3_IMAGE_INSTALL_STAGING = YES
-SDL3_IMAGE_DEPENDENCIES = sdl3
+SDL3_IMAGE_DEPENDENCIES = sdl3 host-pkgconf
+
+# VENDORED would build the copies of libpng and friends carried in the
+# tarball; DEPS_SHARED would dlopen them at runtime instead of linking, which
+# leaves nothing in the ELF for Buildroot to see.
+SDL3_IMAGE_CONF_OPTS = \
+	-DSDLIMAGE_VENDORED=OFF \
+	-DSDLIMAGE_DEPS_SHARED=OFF \
+	-DSDLIMAGE_STRICT=ON \
+	-DSDLIMAGE_SAMPLES=OFF \
+	-DSDLIMAGE_TESTS=OFF \
+	-DSDLIMAGE_INSTALL_MAN=OFF
+
+ifeq ($(BR2_PACKAGE_LIBAVIF),y)
+SDL3_IMAGE_DEPENDENCIES += libavif
+SDL3_IMAGE_CONF_OPTS += \
+	-DSDLIMAGE_AVIF=ON \
+	-DSDLIMAGE_AVIF_SAVE=OFF
+else
+SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_AVIF=OFF
+endif
+
+# Without jpeg, JPEG support falls back to the bundled stb_image decoder
+# rather than being dropped.
+ifeq ($(BR2_PACKAGE_JPEG),y)
+SDL3_IMAGE_DEPENDENCIES += jpeg
+SDL3_IMAGE_CONF_OPTS += \
+	-DSDLIMAGE_BACKEND_STB=OFF \
+	-DSDLIMAGE_JPG=ON
+else
+SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_BACKEND_STB=ON
+endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 SDL3_IMAGE_DEPENDENCIES += libpng
-SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_PNG=ON
+SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_PNG_LIBPNG=ON
+else
+SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_PNG_LIBPNG=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_TIFF),y)
+SDL3_IMAGE_DEPENDENCIES += tiff
+SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_TIF=ON
+else
+SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_TIF=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_WEBP_DEMUX)$(BR2_PACKAGE_WEBP_MUX),yy)
+SDL3_IMAGE_DEPENDENCIES += webp
+SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_WEBP=ON
+else
+SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_WEBP=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBJXL),y)
+SDL3_IMAGE_DEPENDENCIES += libjxl
+SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_JXL=ON
 else
-SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_PNG=OFF
+SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_JXL=OFF
 endif
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
