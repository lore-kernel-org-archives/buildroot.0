Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECB4C47074
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 21:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E4104055F;
	Tue,  2 Jan 2024 21:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E4104055F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m7W1BbiLD0eF; Tue,  2 Jan 2024 21:42:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B254400CB;
	Tue,  2 Jan 2024 21:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B254400CB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F06F31BF2FB
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8B2F401E4
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:42:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8B2F401E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yI6kvVrYe4iy for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 21:42:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5E5D400FB
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 21:42:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5E5D400FB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9AB6D83D2F; Tue,  2 Jan 2024 21:42:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 22:19:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00d55c07306b385eea41d4bf98350d0e2405c3bf
X-Git-Newrev: 4c6ff16cf26acff45ac5a8bdedffe2df5696c416
X-Patchwork-Hint: ignore
Message-Id: <20240102214253.9AB6D83D2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdal: giflib and qhull are
 mandatory
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c6ff16cf26acff45ac5a8bdedffe2df5696c416
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

giflib and qhull are mandatory since the addition of the package in
commit 1e64fa2956171cdc9d6e6c8896b4b589ce573513 and
https://github.com/OSGeo/gdal/commit/cb136fc051341ab99579daae3c8d8246fe918a76

Indeed, as explained in above commit, internal (bundled) libraries will
be used if GDAL_USE_GIF and GDAL_USE_QHULL are set to OFF

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
