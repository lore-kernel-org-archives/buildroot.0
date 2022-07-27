Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02C6C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 13:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A2F94055E;
	Wed, 27 Jul 2022 13:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A2F94055E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wntqY2GZi1Hv; Wed, 27 Jul 2022 13:24:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7628840558;
	Wed, 27 Jul 2022 13:24:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7628840558
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF08A1BF9D1
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A2D58177C
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A2D58177C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AgqzCK--pP8O for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 13:24:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBFFC81699
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 13:24:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBFFC81699
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A02A486609; Wed, 27 Jul 2022 13:10:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 15:23:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e64fa2956171cdc9d6e6c8896b4b589ce573513
X-Git-Newrev: b9a38a42ac817b963be2b4b51d218c5eabb1059d
X-Patchwork-Hint: ignore
Message-Id: <20220727131040.A02A486609@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgis: add optional dependency
 on gdal
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

commit: https://git.buildroot.net/buildroot/commit/?id=b9a38a42ac817b963be2b4b51d218c5eabb1059d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the gdal package added, we can add optional support for gdal in
postgis. This needs a small patch, which is in fact similar to the
existing patch, just for a different part of the postgis source
code. This new patch has been submitted upstream.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...er-Makefile.in-do-not-force-static-linkin.patch | 35 ++++++++++++++++++++++
 package/postgis/postgis.mk                         | 10 +++++--
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/package/postgis/0002-raster-loader-Makefile.in-do-not-force-static-linkin.patch b/package/postgis/0002-raster-loader-Makefile.in-do-not-force-static-linkin.patch
new file mode 100644
index 0000000000..756a7c10dd
--- /dev/null
+++ b/package/postgis/0002-raster-loader-Makefile.in-do-not-force-static-linkin.patch
@@ -0,0 +1,35 @@
+From 29c33c483e22a4445d870739187d128df0f11f60 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Wed, 27 Jul 2022 15:12:40 +0200
+Subject: [PATCH] raster/loader/Makefile.in: do not force static linking
+
+This is similar to commit
+https://github.com/postgis/postgis/commit/98070faad220e12fcaed9a583a70a37c510b7c6b,
+but applied to raster/loader. It ensures that if only shared variants
+of the libraries are available, the link still works. If you force
+-static and only shared variants of some of the libraries are
+available, the link fails with "d: attempted static link of dynamic
+object XYZ".
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://github.com/postgis/postgis/pull/702
+---
+ raster/loader/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/raster/loader/Makefile.in b/raster/loader/Makefile.in
+index 3df47a96f..d0a408333 100644
+--- a/raster/loader/Makefile.in
++++ b/raster/loader/Makefile.in
+@@ -36,7 +36,7 @@ PGSQL_BINDIR=@PGSQL_BINDIR@
+ 
+ RT_CORE=../rt_core
+ 
+-LIBLWGEOM_LDFLAGS= -static ../../liblwgeom/liblwgeom.la
++LIBLWGEOM_LDFLAGS= ../../liblwgeom/liblwgeom.la
+ LIBLWGEOM_CFLAGS=-I../../liblwgeom
+ LIBGDAL_CFLAGS=@LIBGDAL_CFLAGS@
+ LIBGDAL_LDFLAGS=@LIBGDAL_LDFLAGS@
+-- 
+2.37.1
+
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index 652e7951ae..1b5a7bc3ad 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -19,8 +19,7 @@ POSTGIS_DEPENDENCIES = postgresql libgeos proj libxml2
 POSTGIS_CONF_OPTS += \
 	--with-pgconfig=$(STAGING_DIR)/usr/bin/pg_config \
 	--with-geosconfig=$(STAGING_DIR)/usr/bin/geos-config \
-	--with-xml2config=$(STAGING_DIR)/usr/bin/xml2-config \
-	--without-raster
+	--with-xml2config=$(STAGING_DIR)/usr/bin/xml2-config
 
 ifeq ($(BR2_PACKAGE_JSON_C),y)
 POSTGIS_DEPENDENCIES += json-c
@@ -29,6 +28,13 @@ else
 POSTGIS_CONF_OPTS += --without-json
 endif
 
+ifeq ($(BR2_PACKAGE_GDAL),y)
+POSTGIS_DEPENDENCIES += gdal
+POSTGIS_CONF_OPTS += --with-raster --with-gdalconfig=$(STAGING_DIR)/usr/bin/gdal-config
+else
+POSTGIS_CONF_OPTS += --without-raster
+endif
+
 ifeq ($(BR2_PACKAGE_PCRE),y)
 POSTGIS_DEPENDENCIES += pcre
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
