Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC20C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 08:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70FEF81A27;
	Thu, 28 Jul 2022 08:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70FEF81A27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kNQ6ikWWIH-S; Thu, 28 Jul 2022 08:00:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A237383438;
	Thu, 28 Jul 2022 08:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A237383438
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8BBC11BF423
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 08:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67AEF8332A
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 08:00:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67AEF8332A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h4GnMApAHZ3G for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 08:00:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B57C8336F
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B57C8336F
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 08:00:27 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id v5so531493wmj.0
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 01:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NYWqsu1jL25Hw41kgey9aQptfI8fu+nLHfjEch5Y0E0=;
 b=UnMt4d+mP0Q2TnjPuNMmNqDUxQnO++Jj2RqRyvW3CdLqVB13q4w91TbzY76UaJBZtu
 N9N+SB9SiUkUvqaWA7VNLfMuWkcuKtLdnbuPKDyg8iKAEPpcpcpDTpO8B1sF0AOpoLIP
 /+Od+HY7ObDd3a54rwhwmH2127TCwRmq+0Dxb2fH4JK9GOlWsEiHsvo6LwYuCjucw6Is
 ELFWYfwdhDuJluHhyi2UAvkHTZUgmzA9fb/DATM3I1qeLMwq3f9zKqqFSEE33THSQncl
 bo/9Y1WuBZ5Slw+4CwQu1yWHAUU2t2KLEMxWcYzDjFSEkHhSXLrzJKj5FtEP14ptOl9P
 LJZw==
X-Gm-Message-State: AJIora+m0oJyxuC1w8V95Xd6weTp2cJRyXRnosFO7tNcpn46OpIWEdJz
 q9UmouSkgeUwZjCpHOZbMW6a0Yu8cOI=
X-Google-Smtp-Source: AGRyM1sl/dNfzkyQrJPeDcEoYzDlOURIiEJHGDwKHEd+P0SHmh9pceYORrqwF8tUX/sl6KPadl1jvA==
X-Received: by 2002:a05:600c:3229:b0:3a3:7d7b:c621 with SMTP id
 r41-20020a05600c322900b003a37d7bc621mr4182071wmp.108.1658995224718; 
 Thu, 28 Jul 2022 01:00:24 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a05600c4f4e00b003a2d47d3051sm408311wmq.41.2022.07.28.01.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 01:00:23 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 10:00:16 +0200
Message-Id: <20220728080016.1692435-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NYWqsu1jL25Hw41kgey9aQptfI8fu+nLHfjEch5Y0E0=;
 b=S/Yfc/XdL3mV0k/DvXiskgVoH+pM34FK2gTk4wMhkaKUpgo8g4+//B8KE3dTSMby2a
 2C9XGXk45f+ELelQswxgTmYNzgSpj51OEwVqL/HgH6mitgmxVcn4I5kLmA3BBO3tqgQ6
 +3gX7JKaEo9itBNE3nSnG7HeTZc/tgXM5Jym95ar/XBVQBOii2fap3NE82FD232GeLrj
 vxQxzONaBB9KEFPOu2/veVsskHp6Srjrb8n9/8eEU4KzQcoUxn9H4Y1vGLf3aEobLlF2
 YPc+7Aj92c7x97QfdHq/pR2sgDjqUPO5HlkF+gg0J5SXJ7JiXd2rC8ttJy5+/yq4c0Yj
 zWIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=S/Yfc/Xd
Subject: [Buildroot] [PATCH 1/1] package/gdal: fix json dependency
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

gdal needs json-c, not libjson, resulting in the following build failure
since the addition of the package in commit
1e64fa2956171cdc9d6e6c8896b4b589ce573513:

configure: error: could not find json-c/json.h

While at it, also drop unrecognized options:

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --disable-dependency-tracking, --enable-ipv6, --disable-nls, --without-dods-root, --without-fme, --without-grass, --without-libgrass, --without-ingres, --without-jasper, --without-charls, --without-mdb, --without-mongocxx, --without-mrsid_lidar, --without-perl

Fixes:
 - http://autobuild.buildroot.org/results/f977675125167806e844a176a4c8c8873557b709

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gdal/Config.in |  6 ++++--
 package/gdal/gdal.mk   | 15 ++-------------
 2 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/package/gdal/Config.in b/package/gdal/Config.in
index 55a8c7fb83..ee7209566a 100644
--- a/package/gdal/Config.in
+++ b/package/gdal/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GDAL
 	bool "gdal"
-	depends on BR2_INSTALL_LIBSTDCPP # proj, libjson
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	depends on BR2_INSTALL_LIBSTDCPP # proj
 	# configure can't find proj, when linking statically
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, proj
@@ -8,8 +9,8 @@ config BR2_PACKAGE_GDAL
 	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
 	depends on BR2_USE_WCHAR # proj
 	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBGEOTIFF
-	select BR2_PACKAGE_LIBJSON
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_PROJ
 	select BR2_PACKAGE_ZLIB
@@ -24,6 +25,7 @@ config BR2_PACKAGE_GDAL
 	  https://gdal.org/
 
 comment "gdal needs a toolchain w/ C++, dynamic library, gcc >= 4.7, not binutils bug 27597, threads, wchar"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
 		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597 || \
diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
index c75b7743ce..33e7ba724a 100644
--- a/package/gdal/gdal.mk
+++ b/package/gdal/gdal.mk
@@ -18,14 +18,14 @@ GDAL_CONFIG_SCRIPTS = gdal-config
 # enabled but it seems, in contrast to mrf driver support, that they
 # can be implicitly disabled, by configuring gdal without their
 # respectively needed dependencies.
-GDAL_DEPENDENCIES = host-pkgconf jpeg libgeotiff libpng proj tiff zlib
+GDAL_DEPENDENCIES = host-pkgconf jpeg json-c libgeotiff libpng proj tiff zlib
 
 # Yes, even though they have --with options, these few libraries are
 # mandatory. If we don't provide them, bundled versions are used.
 GDAL_CONF_OPTS = \
 	--with-geotiff \
 	--with-jpeg \
-	--with-libjson-c \
+	--with-libjson-c=$(STAGING_DIR)/usr \
 	--with-libtool \
 	--with-libz \
 	--with-png \
@@ -38,45 +38,35 @@ GDAL_CONF_OPTS = \
 	--without-cryptopp \
 	--without-curl \
 	--without-dds \
-	--without-dods-root \
 	--without-ecw \
 	--without-expat \
 	--without-exr \
 	--without-fgdb \
-	--without-fme \
 	--without-freexl \
 	--without-geos \
 	--without-gnm \
 	--without-libkml \
 	--without-lz4 \
-	--without-grass \
-	--without-libgrass \
 	--without-gta \
 	--without-hdf4 \
 	--without-hdf5 \
 	--without-hdfs \
 	--without-heif \
 	--without-idb \
-	--without-ingres \
 	--without-jp2lura \
-	--without-jasper \
 	--without-java \
 	--without-jpeg12 \
 	--without-jxl \
-	--without-charls \
 	--without-kakadu \
 	--without-kea \
 	--without-lerc \
 	--without-gif \
 	--without-liblzma \
 	--without-libdeflate \
-	--without-mdb \
-	--without-mongocxx \
 	--without-mongocxxv3 \
 	--without-mrsid \
 	--without-jp2mrsid \
 	--without-macosx-framework \
-	--without-mrsid_lidar \
 	--without-msg \
 	--without-mysql \
 	--without-netcdf \
@@ -92,7 +82,6 @@ GDAL_CONF_OPTS = \
 	--without-pcre \
 	--without-pcre2 \
 	--without-pdfium \
-	--without-perl \
 	--without-podofo \
 	--without-poppler \
 	--without-python \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
