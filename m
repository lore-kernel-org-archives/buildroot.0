Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7084C4167B
	for <buildroot@archiver.kernel.org>; Mon, 11 Dec 2023 13:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 187904161A;
	Mon, 11 Dec 2023 13:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 187904161A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QJR-YzVLxHTa; Mon, 11 Dec 2023 13:53:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CB5341609;
	Mon, 11 Dec 2023 13:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CB5341609
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F3D51BF28B
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 13:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F08E64037C
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 13:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F08E64037C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W31C5xL9wEvf for <buildroot@lists.busybox.net>;
 Mon, 11 Dec 2023 13:53:34 +0000 (UTC)
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C09964021C
 for <buildroot@buildroot.org>; Mon, 11 Dec 2023 13:53:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C09964021C
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id D688B165B5;
 Mon, 11 Dec 2023 14:53:30 +0100 (CET)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail0.hostpark.net [127.0.0.1]) (amavisd-new, port 10224)
 with ESMTP id IGSU0lqJe51W; Mon, 11 Dec 2023 14:53:30 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.hostpark.net (Postfix) with ESMTPSA id 52DE3164BD;
 Mon, 11 Dec 2023 14:53:30 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 11 Dec 2023 14:53:21 +0100
Message-ID: <20231211135321.1131298-1-christian@klarinett.li>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=klarinett.li; h=
 content-transfer-encoding:mime-version:x-mailer:message-id:date
 :date:subject:subject:from:from; s=sel2011a; t=1702302810; bh=lt
 pFBR/4+UUfXE5YghoQ7wZE67z6EvlRxnoFJiCY+A0=; b=JmE2g0phRtJBZL/l/7
 XN+MRmmgqciDpu1t72W7m9bhZHLUicNg5bYghci/ykpiDAxIplyUpIxJihx7fHpa
 TvbHZWTG8mQ2G6zLFjol8RImpQp/VJmim9ZVlhF1sZhFYdTEEqF8D+CVIisPjSlv
 qcVl1F3Vc7+7WroaPIsbDW7ho=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=klarinett.li header.i=@klarinett.li
 header.a=rsa-sha256 header.s=sel2011a header.b=JmE2g0ph
Subject: [Buildroot] [PATCH] package/imagemagick: build host-imagemagick
 with xml support
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
From: Christian Hitz via buildroot <buildroot@buildroot.org>
Reply-To: Christian Hitz <christian@klarinett.li>
Cc: Christian Hitz <christian.hitz@bbv.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Christian Hitz <christian.hitz@bbv.ch>

Since upstream commit
https://github.com/ImageMagick/ImageMagick/commit/25e3a4f3845f59536d19aba0ac0580aa6715147f
(which first appeared in version 7.1.1-19), ImageMagick does not trust
unvalidated XMP profiles in images anymore.

If such a XML profile is encountered inside e.g. a PNG image the
processing is aborted. Validating the XMP profile requires that
ImageMagick is compiled with XML support.
As host-imagemagick supports PNG file also activate XML support.

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
---
Backport to: 2023.02.x, 2023.11.x
---
 package/imagemagick/imagemagick.mk | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 719c6768af..cbf1d38cbf 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -220,7 +220,8 @@ HOST_IMAGEMAGICK_CONF_OPTS = \
 	--without-webp \
 	--with-jpeg \
 	--with-png \
-	--with-zlib
+	--with-zlib \
+	--with-xml
 
 # uses clock_gettime, which was provided by librt in glibc < 2.17
 HOST_IMAGEMAGICK_CONF_ENV = \
@@ -231,29 +232,27 @@ HOST_IMAGEMAGICK_DEPENDENCIES = \
 	host-libjpeg \
 	host-libpng \
 	host-pkgconf \
-	host-zlib
+	host-zlib \
+	host-libxml2
 
 ifeq ($(BR2_PACKAGE_HOST_IMAGEMAGICK_SVG),y)
 HOST_IMAGEMAGICK_DEPENDENCIES += \
 	host-fontconfig \
 	host-freetype \
 	host-librsvg \
-	host-libxml2 \
 	host-pango
 HOST_IMAGEMAGICK_CONF_ENV += ac_cv_path_xml2_config=$(HOST_DIR)/bin/xml2-config
 HOST_IMAGEMAGICK_CONF_OPTS += \
 	--with-fontconfig \
 	--with-freetype \
 	--with-pango \
-	--with-rsvg \
-	--with-xml
+	--with-rsvg
 else
 HOST_IMAGEMAGICK_CONF_OPTS += \
 	--without-fontconfig \
 	--without-freetype \
 	--without-pango \
-	--without-rsvg \
-	--without-xml
+	--without-rsvg
 endif
 
 $(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
