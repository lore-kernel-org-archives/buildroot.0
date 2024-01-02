Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26117C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 11:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA56040931;
	Tue,  2 Jan 2024 11:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA56040931
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19NdxBfnWX_R; Tue,  2 Jan 2024 11:46:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE2EC40876;
	Tue,  2 Jan 2024 11:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE2EC40876
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B9861BF2B6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 11:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2A1B60D4F
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 11:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2A1B60D4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iy40gyY5unsV for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 11:46:51 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 562A760AF1
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 11:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 562A760AF1
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33687627ad0so8717067f8f.2
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 03:46:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704196008; x=1704800808;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/QQytY/Aj0nYtF4cro1kKcUwFRFBoi+F/bAXiA06NDQ=;
 b=EaUNt5zB9E5qnWdbtdmYLnljEBqwSN6KcFwlaf2PvI9O56xuZ55QiKYsD5sML7lmKx
 wIh/Y8RGbAmNCaBDtc1aZR5IL37PNE5Gb279dfZq5XpMtwOXYoFKKYCDldc+4oWjGJTd
 1oEY/lHaXYWZtWJRugl+opXHyxN9HwPr4folwQIAeqevyS/ET0+Y4RYaBaI16PmDvhca
 yFAm19mfRc1pzUrzR0DQtlKxS7BCnoeu8/PY8TUsdCQEAgwSQtmw2kfXp6OCcFaektD3
 tfic1LcXVxbDS0jpDW1+bfwQinMmZ3jh2K1fQnWpNlkO3Fcl2ncyKtZmowqpLCz3AAX+
 uzbQ==
X-Gm-Message-State: AOJu0YzKVr+8ZKqoY6qdlB/ZXuPe8FLEXG1mF/6KG+GdIoYN701yRriS
 xYwYlLV3g6KGHm8+0FIuuhanYnVM1es=
X-Google-Smtp-Source: AGHT+IGxtbLgSOGa8+ruS4KQ42RWi/R1Ctua5ILmDRl1V5CQSzP2nfciZmx2ZfqXWg8kPMgW1DeHfg==
X-Received: by 2002:a5d:4491:0:b0:336:9ec:683 with SMTP id
 j17-20020a5d4491000000b0033609ec0683mr8585796wrq.24.1704196008240; 
 Tue, 02 Jan 2024 03:46:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v12-20020adfa1cc000000b00337478efa4fsm1497227wrv.60.2024.01.02.03.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 03:46:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 12:46:42 +0100
Message-ID: <20240102114643.1060232-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704196008; x=1704800808; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/QQytY/Aj0nYtF4cro1kKcUwFRFBoi+F/bAXiA06NDQ=;
 b=XY/1QNM15erzEAWJegFeqrcxdvUiqmZhFhr3LTwMz4oPFNvKmnAv2pQ+Sv0X9tCa0D
 I8Xqfa9MUYor+Lh8Ip5qBkF7P+N3hhyw+NkDxT9X7Y4FUhfPCbGbJEPgrG2yRONftqCd
 hm+gfPto4WDH8e9Uwdtq9AiwhFuyoMV/fwLtQxEMxBogZesYZW9f6ViZR2subFU06XNa
 Yg+Ft2VbVkR1acTjXBnHcsXBoX+PY5uBAwW5aL0jGRGaBT2yDzQvP0m3DCBA1IILtPIj
 jOvFIdVUGqmk+vIIvyTtH+WOmoUGgCeWf/uYNJ0TKaa7GuNgMAL3SzmsgD0asrWiU97z
 Rdqg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XY/1QNM1
Subject: [Buildroot] [PATCH v2,
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

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
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
