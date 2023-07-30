Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539A2C001DF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FE0C60AEC;
	Sun, 30 Jul 2023 10:32:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FE0C60AEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bvr6eebwNnUh; Sun, 30 Jul 2023 10:32:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4208460B9F;
	Sun, 30 Jul 2023 10:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4208460B9F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3DC001BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 239E5410C5
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 239E5410C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zypYbYJ0JOph for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:32:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32A96410C2
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32A96410C2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1EE2183BC3; Sun, 30 Jul 2023 10:32:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 12:27:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 399db1eeb5033f1ececa45a50dd901e04de9eea6
X-Git-Newrev: f23178772075a6bf1a06c7de4954c7aa17aab7b7
X-Patchwork-Hint: ignore
Message-Id: <20230730103202.1EE2183BC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvips: add optional support for
 libheif
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

commit: https://git.buildroot.net/buildroot/commit/?id=f23178772075a6bf1a06c7de4954c7aa17aab7b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libvips/libvips.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index f7b15e8e06..1a0f9d5ead 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -132,6 +132,13 @@ else
 LIBVIPS_CONF_OPTS += --without-libexif
 endif
 
+ifeq ($(BR2_PACKAGE_LIBHEIF),y)
+LIBVIPS_CONF_OPTS += --with-heif
+LIBVIPS_DEPENDENCIES += libheif
+else
+LIBVIPS_CONF_OPTS += --without-heif
+endif
+
 ifeq ($(BR2_PACKAGE_WEBP_DEMUX)$(BR2_PACKAGE_WEBP_MUX),yy)
 LIBVIPS_CONF_OPTS += --with-libwebp
 LIBVIPS_DEPENDENCIES += webp
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
