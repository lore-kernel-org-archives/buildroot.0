Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D12DC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 08:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 208C160F30;
	Thu, 28 Jul 2022 08:47:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 208C160F30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aAvXFttS2oJW; Thu, 28 Jul 2022 08:47:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C52D60B73;
	Thu, 28 Jul 2022 08:47:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C52D60B73
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 876A11BF2BC
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 08:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 521BF4197C
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 08:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 521BF4197C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SH__GfQsxjej for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 08:47:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F4085410B1
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 08:47:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F4085410B1
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id ECAA38410F; Thu, 28 Jul 2022 08:33:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 10:42:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 117c21820f3d9df67da6524400617d5fabbf424f
X-Git-Newrev: 622e5f67bd7f9249514c44c7b64f2821a8f74635
X-Patchwork-Hint: ignore
Message-Id: <20220728083332.ECAA38410F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdal: fix json dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=622e5f67bd7f9249514c44c7b64f2821a8f74635
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gdal needs json-c, not libjson, resulting in the following build failure
since the addition of the package in commit
1e64fa2956171cdc9d6e6c8896b4b589ce573513:

configure: error: could not find json-c/json.h

While at it, also drop unrecognized options:

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --disable-dependency-tracking, --enable-ipv6, --disable-nls, --without-dods-root, --without-fme, --without-grass, --without-libgrass, --without-ingres, --without-jasper, --without-charls, --without-mdb, --without-mongocxx, --without-mrsid_lidar, --without-perl

Fixes:
 - http://autobuild.buildroot.org/results/f977675125167806e844a176a4c8c8873557b709

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
