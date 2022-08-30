Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B6BECAAA1
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 16:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 280B7409FF;
	Tue, 30 Aug 2022 16:19:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 280B7409FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8El0APaeEpEW; Tue, 30 Aug 2022 16:19:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2392C41720;
	Tue, 30 Aug 2022 16:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2392C41720
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EEE1A1BF3A8
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FC3340BA5
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FC3340BA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IfdX1_4A9WLL for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 16:15:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1404640BAB
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 16:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1404640BAB
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5044B880D3; Tue, 30 Aug 2022 16:00:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Aug 2022 18:02:29 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 01a26c5d706c5a8f173c0bde031623d91bf3137f
X-Git-Newrev: ee51fd0efef5287a8119a78d16503c42e4436877
X-Patchwork-Hint: ignore
Message-Id: <20220830160007.5044B880D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/postgis: drop
 optional dependency on gdal
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ee51fd0efef5287a8119a78d16503c42e4436877
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The BR2_PACKAGE_LIBGDAL option does not exist, so drop this dead code,
and unconditionally disable GDAL support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d48af707737ece6242d58e83b98e5c601fa55acc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
