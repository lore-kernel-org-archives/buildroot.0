Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0530DC001DF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F50060A98;
	Sun, 30 Jul 2023 10:32:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F50060A98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EnKvqrZ9SljJ; Sun, 30 Jul 2023 10:32:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD4AF60ACA;
	Sun, 30 Jul 2023 10:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD4AF60ACA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 129F11BF8C7
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED47681C58
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED47681C58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UnQQhW4x-C4p for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:32:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 284698176A
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 284698176A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14AF383BC2; Sun, 30 Jul 2023 10:32:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 12:27:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c15d7a9e7b1da8824b1459b84ebec9c17e6f170
X-Git-Newrev: 399db1eeb5033f1ececa45a50dd901e04de9eea6
X-Patchwork-Hint: ignore
Message-Id: <20230730103202.14AF383BC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/imagemagick: add optional support
 for libheif
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

commit: https://git.buildroot.net/buildroot/commit/?id=399db1eeb5033f1ececa45a50dd901e04de9eea6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/imagemagick/imagemagick.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 8a2ec460d5..91dd208b0d 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -32,7 +32,6 @@ IMAGEMAGICK_CONF_OPTS = \
 	--without-fpx \
 	--without-gslib \
 	--without-gvc \
-	--without-heic \
 	--without-jbig \
 	--without-jxl \
 	--without-lqr \
@@ -84,6 +83,13 @@ else
 IMAGEMAGICK_CONF_OPTS += --without-lcms
 endif
 
+ifeq ($(BR2_PACKAGE_LIBHEIF),y)
+IMAGEMAGICK_CONF_OPTS += --with-heic
+IMAGEMAGICK_DEPENDENCIES += libheif
+else
+IMAGEMAGICK_CONF_OPTS += --without-heic
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 IMAGEMAGICK_CONF_OPTS += --with-png
 IMAGEMAGICK_DEPENDENCIES += libpng
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
