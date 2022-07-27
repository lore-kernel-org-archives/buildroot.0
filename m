Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7811CC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 13:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1824F60C19;
	Wed, 27 Jul 2022 13:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1824F60C19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hVSdJleSMLKk; Wed, 27 Jul 2022 13:24:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5E8F60BDE;
	Wed, 27 Jul 2022 13:24:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5E8F60BDE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC6D21BF2BA
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A404240865
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A404240865
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id osc_ab7NnnFb for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 13:24:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA25940861
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 13:24:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA25940861
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 88E3486603; Wed, 27 Jul 2022 13:10:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 13:00:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9912d438afdd388d580ee094b8e1b1eb4bb6c53b
X-Git-Newrev: d48af707737ece6242d58e83b98e5c601fa55acc
X-Patchwork-Hint: ignore
Message-Id: <20220727131040.88E3486603@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgis: drop optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=d48af707737ece6242d58e83b98e5c601fa55acc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_PACKAGE_LIBGDAL option does not exist, so drop this dead code,
and unconditionally disable GDAL support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/postgis/postgis.mk | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index b77071d03b..652e7951ae 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -19,14 +19,8 @@ POSTGIS_DEPENDENCIES = postgresql libgeos proj libxml2
 POSTGIS_CONF_OPTS += \
 	--with-pgconfig=$(STAGING_DIR)/usr/bin/pg_config \
 	--with-geosconfig=$(STAGING_DIR)/usr/bin/geos-config \
-	--with-xml2config=$(STAGING_DIR)/usr/bin/xml2-config
-
-ifeq ($(BR2_PACKAGE_LIBGDAL),y)
-POSTGIS_DEPENDENCIES += libgdal
-POSTGIS_CONF_OPTS += --with-raster
-else
-POSTGIS_CONF_OPTS += --without-raster
-endif
+	--with-xml2config=$(STAGING_DIR)/usr/bin/xml2-config \
+	--without-raster
 
 ifeq ($(BR2_PACKAGE_JSON_C),y)
 POSTGIS_DEPENDENCIES += json-c
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
