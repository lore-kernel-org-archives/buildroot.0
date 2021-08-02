Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DAAC4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 09:24:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D95861050
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 09:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D95861050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=posteo.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB1A7402C9;
	Mon,  2 Aug 2021 09:24:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EqyKM37ZUNrX; Mon,  2 Aug 2021 09:24:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEFFE40338;
	Mon,  2 Aug 2021 09:24:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE2F01BF4E4
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 09:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB3D240338
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 09:24:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hTKoPuN28U38 for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 09:24:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3DB9A402C9
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 09:24:36 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 1F5AB240028
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 11:24:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1627896274; bh=w8eOOfQ0mIzJm3pxnzlJjm/YFwZdaIJ2Yi+DmsHhXMo=;
 h=From:To:Cc:Subject:Date:From;
 b=dyu1eR7dMIHSeGHNUyf3Fm0Gxb13EvD1WavlqdNu5i9cMKwHzfzk/4hO79V1Q6FDp
 2mHgURp9pp1bNRpjDlWH5z8zfE+kcrm65tuvM1hBFTF0qB8q4+9ftanzXVXJc1+gpa
 M6rRWJRcdTn+q9niNTIIiznRKjqC1o1OdsrulvVS6ghFhVjIf6huszgIKt5exyoL3O
 jBgzPxNCIJNZ5VWzEq5LYuogPzkl+BliNiJ/R8xixUjEZwsi94B+BMSGnM6qHCEopF
 1gchDYTB27qk15PV4qBvy/OuU9OGMOqPRt3dDnTHYQ2U4hBqpVCjBetX3K8uL5k1/k
 px2bI9eMMfUtg==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4GdXdY1fxGz6tm6;
 Mon,  2 Aug 2021 11:24:33 +0200 (CEST)
From: Dominik Michael Rauh <dmrauh@posteo.de>
To: buildroot@buildroot.org
Date: Mon,  2 Aug 2021 09:24:26 +0000
Message-Id: <20210802092426.1259479-1-dmrauh@posteo.de>
In-Reply-To: <20210528152936.368915-1-dmrauh@posteo.de>
References: <20210528152936.368915-1-dmrauh@posteo.de>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4] package/libgdal: new package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Dominik Michael Rauh <dmrauh@posteo.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

GDAL is a translator library for raster and vector geospatial data
formats. As a library, it presents a single raster abstract data model
and single vector abstract data model to the calling application for all
supported formats. It also comes with a variety of useful command line
utilities for data translation and processing.

https://gdal.org/

Signed-off-by: Dominik Michael Rauh <dmrauh@posteo.de>
---
Changes v3 -> v4 (after review by Thomas Petazzoni):
-  Bump version from 3.3.0 to 3.3.1
-  Configure libgdal to use external libraries where possible
-  Explicitely disable libraries not yet handled by Buildroot

Changes v2 -> v3:
-  Bump version from 3.2.2 to 3.3.0

Changes v1 -> v2 (after review by Peter Seiderer):
-  Disable NEON and VSX support when using libgdal's libpng
-  Disable compilation for toolchains with binutils bug 21464 or 27597
-  Add the proper "depends" demanded by proj
-  Fix the comment in Config.in
-  Hopefully add the complete LIBGDAL_LICENSE information

 package/Config.in                             |   1 +
 ...1-port-cpl_recode_iconv.cpp-use-cast.patch |  38 ++++++
 package/libgdal/Config.in                     |  31 +++++
 package/libgdal/libgdal.hash                  |   6 +
 package/libgdal/libgdal.mk                    | 121 ++++++++++++++++++
 5 files changed, 197 insertions(+)
 create mode 100644 package/libgdal/0001-port-cpl_recode_iconv.cpp-use-cast.patch
 create mode 100644 package/libgdal/Config.in
 create mode 100644 package/libgdal/libgdal.hash
 create mode 100644 package/libgdal/libgdal.mk

diff --git a/package/Config.in b/package/Config.in
index 046c04e994..dbbdc35390 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1929,6 +1929,7 @@ menu "Other"
 	source "package/libevdev/Config.in"
 	source "package/libevent/Config.in"
 	source "package/libffi/Config.in"
+	source "package/libgdal/Config.in"
 	source "package/libgee/Config.in"
 	source "package/libgeos/Config.in"
 	source "package/libglib2/Config.in"
diff --git a/package/libgdal/0001-port-cpl_recode_iconv.cpp-use-cast.patch b/package/libgdal/0001-port-cpl_recode_iconv.cpp-use-cast.patch
new file mode 100644
index 0000000000..9fa958524f
--- /dev/null
+++ b/package/libgdal/0001-port-cpl_recode_iconv.cpp-use-cast.patch
@@ -0,0 +1,38 @@
+From 0730ebc7a1e22a169bf3a1d873e130e079a68b3d Mon Sep 17 00:00:00 2001
+From: Dominik Michael Rauh <dmrauh@posteo.de>
+Date: Sat, 1 May 2021 20:11:30 +0200
+Subject: [PATCH] port/cpl_recode_iconv.cpp: use cast
+
+Fixes error: invalid cast from type 'int' to type 'iconv_t' {aka 'long
+int'}
+
+Signed-off-by: Dominik Michael Rauh <dmrauh@posteo.de>
+---
+ port/cpl_recode_iconv.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/port/cpl_recode_iconv.cpp b/port/cpl_recode_iconv.cpp
+index d341bb1..2346012 100644
+--- a/port/cpl_recode_iconv.cpp
++++ b/port/cpl_recode_iconv.cpp
+@@ -87,7 +87,7 @@ char *CPLRecodeIconv( const char *pszSource,
+ 
+     sConv = iconv_open( pszDstEncoding, pszSrcEncoding );
+ 
+-    if( sConv == reinterpret_cast<iconv_t>(-1) )
++    if( sConv == (iconv_t)(-1) )
+     {
+         CPLError( CE_Warning, CPLE_AppDefined,
+                   "Recode from %s to %s failed with the error: \"%s\".",
+@@ -234,7 +234,7 @@ char *CPLRecodeFromWCharIconv( const wchar_t *pwszSource,
+ 
+     sConv = iconv_open( pszDstEncoding, pszSrcEncoding );
+ 
+-    if( sConv == reinterpret_cast<iconv_t>(-1) )
++    if( sConv == (iconv_t)(-1) )
+     {
+         CPLFree( pszIconvSrcBuf );
+         CPLError( CE_Warning, CPLE_AppDefined,
+-- 
+2.31.1
+
diff --git a/package/libgdal/Config.in b/package/libgdal/Config.in
new file mode 100644
index 0000000000..1f3861e944
--- /dev/null
+++ b/package/libgdal/Config.in
@@ -0,0 +1,31 @@
+config BR2_PACKAGE_LIBGDAL
+	bool "libgdal"
+	depends on BR2_INSTALL_LIBSTDCPP # proj, libjson
+	# configure can't find proj, when linking statically
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, proj
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
+	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
+	depends on BR2_USE_WCHAR # proj
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBJSON
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_PROJ
+	select BR2_PACKAGE_ZLIB
+	help
+	  GDAL is a translator library for raster and vector geospatial
+	  data formats. As a library, it presents a single raster
+	  abstract data model and single vector abstract data model to
+	  the calling application for all supported formats. It also
+	  comes with a variety of useful command line utilities for data
+	  translation and processing.
+
+	  https://gdal.org/
+
+comment "libgdal needs a toolchain w/ C++, dynamic library, gcc >= 4.7, not binutils bug 21464, 27597, threads, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
+		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 || \
+		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597 || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR
diff --git a/package/libgdal/libgdal.hash b/package/libgdal/libgdal.hash
new file mode 100644
index 0000000000..ea770a38d2
--- /dev/null
+++ b/package/libgdal/libgdal.hash
@@ -0,0 +1,6 @@
+# md5 from: https://download.osgeo.org/gdal/3.3.1/gdal-3.3.1.tar.xz.md5, sha256 locally computed:
+md5  7611300fece06853a1a88149e0cc8922  gdal-3.3.1.tar.xz
+sha256  48ab00b77d49f08cf66c60ccce55abb6455c3079f545e60c90ee7ce857bccb70  gdal-3.3.1.tar.xz
+
+# Hash of license file:
+sha256  b82e6cca0b13f5db2f22ab667f22254fb1f4b135ea73d5bd6238ef89aff31f6c  LICENSE.TXT
diff --git a/package/libgdal/libgdal.mk b/package/libgdal/libgdal.mk
new file mode 100644
index 0000000000..337b8a7fb7
--- /dev/null
+++ b/package/libgdal/libgdal.mk
@@ -0,0 +1,121 @@
+################################################################################
+#
+# libgdal
+#
+################################################################################
+
+LIBGDAL_VERSION = 3.3.1
+LIBGDAL_SITE = https://download.osgeo.org/gdal/$(LIBGDAL_VERSION)
+LIBGDAL_SOURCE = gdal-$(LIBGDAL_VERSION).tar.xz
+LIBGDAL_LICENSE = MIT (GDAL/OGR), BSD-3-Clause, BSD-Style, APACHE-2.0
+LIBGDAL_LICENSE_FILES = LICENSE.TXT
+LIBGDAL_INSTALL_STAGING = YES
+LIBGDAL_CONFIG_SCRIPTS = gdal-config
+# libgdal at its core only needs host-pkgconf, libgeotiff, proj and tiff but
+# since by default mrf driver support is enabled, it also needs jpeg, libpng
+# and zlib. By default there are also many other drivers enabled but it seems,
+# in contrast to mrf driver support, that they can be implicitely disabled, by
+# configuring libgdal without their respectively needed dependencies.
+LIBGDAL_DEPENDENCIES = host-pkgconf jpeg libgeotiff libpng proj tiff zlib
+
+ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
+LIBGDAL_DEPENDENCIES += postgresql
+LIBGDAL_CONF_OPTS += --with-pg
+else
+LIBGDAL_CONF_OPTS += --without-pg
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+LIBGDAL_DEPENDENCIES += libxml2
+LIBGDAL_CONF_OPTS += --with-xml2
+else
+LIBGDAL_CONF_OPTS += --without-xml2
+endif
+
+LIBGDAL_CONF_OPTS += --with-cpp14 \
+					 --with-geotiff \
+					 --with-libjson-c \
+					 --with-libtiff \
+					 --with-libtool \
+					 --with-libz \
+					 --with-jpeg \
+					 --with-png \
+					 --with-proj
+
+# disable not yet handled packages and thus the associated libgdal drivers
+LIBGDAL_CONF_OPTS += --without-armadillo \
+					 --without-cfitsio \
+					 --without-crypto \
+					 --without-cryptopp \
+					 --without-curl \
+					 --without-dds \
+					 --without-dods-root \
+					 --without-ecw \
+					 --without-expat \
+					 --without-exr \
+					 --without-fgdb \
+					 --without-fme \
+					 --without-freexl \
+					 --without-geos \
+					 --without-gnm \
+					 --without-libkml \
+					 --without-grass \
+					 --without-libgrass \
+					 --without-gta \
+					 --without-hdf4 \
+					 --without-hdf5 \
+					 --without-hdfs \
+					 --without-heif \
+					 --without-idb \
+					 --without-ingres \
+					 --without-java \
+					 --without-jp2lura \
+					 --without-jpeg12 \
+					 --without-jasper \
+					 --without-charls \
+					 --without-kakadu \
+					 --without-kea \
+					 --without-lerc \
+					 --without-gif \
+					 --without-liblzma \
+					 --without-libdeflate \
+					 --without-mdb \
+					 --without-mongocxx \
+					 --without-mongocxxv3 \
+					 --without-mrsid \
+					 --without-jp2mrsid \
+					 --without-macosx-framework \
+					 --without-mrsid_lidar \
+					 --without-msg \
+					 --without-mysql \
+					 --without-netcdf \
+					 --without-null \
+					 --without-oci \
+					 --without-odbc \
+					 --without-ogdi \
+					 --without-opencl \
+					 --without-openjpeg \
+					 --without-pam \
+					 --without-pcidsk \
+					 --without-pcraster \
+					 --without-pcre \
+					 --without-pdfium \
+					 --without-perl \
+					 --without-podofo \
+					 --without-poppler \
+					 --without-python \
+					 --without-qhull \
+					 --without-rasdaman \
+					 --without-rasterlite2 \
+					 --without-rdb \
+					 --without-sfcgal \
+					 --without-sosi \
+					 --without-spatialite \
+					 --without-sqlite3 \
+					 --without-teigha \
+					 --without-tiledb \
+					 --without-webp \
+					 --without-xerces \
+					 --without-zstd
+
+$(eval $(autotools-package))
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
