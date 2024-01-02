Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B1AC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE1E140A60;
	Tue,  2 Jan 2024 20:48:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE1E140A60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uk-1SGrY3coJ; Tue,  2 Jan 2024 20:48:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B611400CB;
	Tue,  2 Jan 2024 20:48:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B611400CB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E8CCA1BF2FB
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBCB140A5F
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:48:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBCB140A5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gpvShFM2Mhec for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:48:06 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 49963408C0
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:48:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49963408C0
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3364c9ff8e1so6048587f8f.0
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 12:48:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704228483; x=1704833283;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=880hGO+GL5fEpg03mHagATc+o4xlk6bntcNbQy7sQpw=;
 b=gLIDK8sr6jTHdKaMfK0i4s4jdALxd1SXnRZ0PlszwnRCgH2DC7q48lw9KOcAzlWxOz
 i/84bZBiwZVTcH8vAwbKn7+D63sSo7yldaOTHDP4HAQADXgju5qdTrRY17zLALL/r6Ou
 6QSl+qPiGdK9VALxfhmAohCwJcjsWmbja4TDmkj3SffNOUvTFsgd2FUeTftLxWyd2hb0
 YrbGYvOs7u/QLRo99t8hrdcC8qR3Gg2Zfumz6mBDo8A8QfowkvLEF79zqKKHquFXD+pJ
 Y9oRPPHuZbzWpXCleuz/azgB9z7sSFnOLObqbfbd5mMHVPJ+ebIvCVmlSCBklxZzVVnu
 i8DA==
X-Gm-Message-State: AOJu0YwhaBcQEt4qWTV07xUykV6Jp+qyp9lAUt/2xJg3RNaiKAWa/S8w
 lJqBiF/1DULhSwjRsszgpOG/I9Ja7CQ=
X-Google-Smtp-Source: AGHT+IE0UPnV81CbfUvsogBqUwDFtjj+y5wmkIKb/LmB2SEXXHkdAkd6odYKKI+bkw2Gj6pW2DBisA==
X-Received: by 2002:a05:600c:154b:b0:40c:25ed:9be2 with SMTP id
 f11-20020a05600c154b00b0040c25ed9be2mr13958wmg.75.1704228483420; 
 Tue, 02 Jan 2024 12:48:03 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n4-20020a7bc5c4000000b0040d376ac369sm93539wmk.40.2024.01.02.12.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 12:48:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 21:47:55 +0100
Message-ID: <20240102204756.1666286-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704228483; x=1704833283; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=880hGO+GL5fEpg03mHagATc+o4xlk6bntcNbQy7sQpw=;
 b=g/na8ZU6mtC0rnmwzzRqXnr6xa9Y9+r2gJGIwIF9cQ0oqyGU+c9U59qBMIS7kXmHHB
 1LFj8VDRTnZRdGmdfpQ/pVZV3HsAS9gRu6/D5KqVMa3ZkIed5GEA3fzWT026/qhgpdni
 8G/B8t3G/jR3YMgeLukLwQDd6rW4lK9SAU3fhiMpdDdUE3+fNOCgRvzClDXLVqgyPdC7
 F2LrevB5uGCj80aTk4EqnFoebH4siBQ8r638aofV0sHIVtmIitxxn8THHjpJkVhHqWt2
 StrfzhrbSh/aThnqlpf7g+Pd98AYR2FFvMiJA98T8opJ3x0rQrfmCuKoZmRduFp8MPd6
 tvyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g/na8ZU6
Subject: [Buildroot] [PATCH v3,
 1/2] package/gdal: giflib and qhull are mandatory
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
Cc: Dominik Michael Rauh <dmrauh@posteo.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

giflib and qhull are mandatory since the addition of the package in
commit 1e64fa2956171cdc9d6e6c8896b4b589ce573513 and
https://github.com/OSGeo/gdal/commit/cb136fc051341ab99579daae3c8d8246fe918a76

Indeed, as explained in above commit, internal (bundled) libraries will
be used if GDAL_USE_GIF and GDAL_USE_QHULL are set to OFF

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3 (after review of Thomas Petazzoni):
 - Update commit message with bundled library explanation

 package/gdal/Config.in |  4 +++-
 package/gdal/gdal.mk   | 16 +++++++++++++---
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/package/gdal/Config.in b/package/gdal/Config.in
index ee7209566a..24a1f06af2 100644
--- a/package/gdal/Config.in
+++ b/package/gdal/Config.in
@@ -1,18 +1,20 @@
 config BR2_PACKAGE_GDAL
 	bool "gdal"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
-	depends on BR2_INSTALL_LIBSTDCPP # proj
+	depends on BR2_INSTALL_LIBSTDCPP # proj, qhull
 	# configure can't find proj, when linking statically
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, proj
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
 	depends on BR2_USE_WCHAR # proj
+	select BR2_PACKAGE_GIFLIB
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBGEOTIFF
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_PROJ
+	select BR2_PACKAGE_QHULL
 	select BR2_PACKAGE_ZLIB
 	help
 	  GDAL is a translator library for raster and vector geospatial
diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
index 3f39aa657a..7ab4f1a331 100644
--- a/package/gdal/gdal.mk
+++ b/package/gdal/gdal.mk
@@ -20,16 +20,28 @@ GDAL_SUPPORTS_IN_SOURCE_BUILD = NO
 # enabled but it seems, in contrast to mrf driver support, that they
 # can be implicitly disabled, by configuring gdal without their
 # respectively needed dependencies.
-GDAL_DEPENDENCIES = host-pkgconf jpeg json-c libgeotiff libpng proj tiff zlib
+GDAL_DEPENDENCIES = \
+	giflib \
+	host-pkgconf \
+	jpeg \
+	json-c \
+	libgeotiff \
+	libpng \
+	proj \
+	qhull \
+	tiff \
+	zlib
 
 # Yes, even though they have -DDGDAL_USE options, a few libraries are
 # mandatory. If we don't provide them, bundled versions are used.
 GDAL_CONF_OPTS = \
 	-DGDAL_USE_GEOTIFF=ON \
+	-DGDAL_USE_GIF=ON \
 	-DGDAL_USE_JPEG=ON \
 	-DGDAL_USE_JSONC=ON \
 	-DGDAL_USE_ZLIB=ON \
 	-DGDAL_USE_PNG=ON \
+	-DGDAL_USE_QHULL=ON \
 	-DGDAL_USE_ARMADILLO=OFF \
 	-DGDAL_USE_BLOSC=OFF \
 	-DGDAL_USE_BRUNSLI=OFF \
@@ -57,7 +69,6 @@ GDAL_CONF_OPTS = \
 	-DGDAL_USE_KDU=OFF \
 	-DGDAL_USE_KEA=OFF \
 	-DGDAL_USE_LERC=OFF \
-	-DGDAL_USE_GIF=OFF \
 	-DGDAL_USE_LIBLZMA=OFF \
 	-DGDAL_USE_DEFLATE=OFF \
 	-DGDAL_USE_MONGOCXX=OFF \
@@ -76,7 +87,6 @@ GDAL_CONF_OPTS = \
 	-DGDAL_USE_PDFIUM=OFF \
 	-DGDAL_USE_PODOFO=OFF \
 	-DGDAL_USE_POPPLER=OFF \
-	-DGDAL_USE_QHULL=OFF \
 	-DGDAL_USE_RASDAMAN=OFF \
 	-DGDAL_USE_RASTERLITE2=OFF \
 	-DGDAL_USE_RDB=OFF \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
