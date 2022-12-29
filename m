Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BE7C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABAE860D5C;
	Thu, 29 Dec 2022 09:03:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABAE860D5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ySzj26OjfEh; Thu, 29 Dec 2022 09:03:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F263B60D4E;
	Thu, 29 Dec 2022 09:03:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F263B60D4E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BEB981BF3A0
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AF2D60D5C
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AF2D60D5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EJEYh4q4505J for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:03:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA5B060D58
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:03:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA5B060D58
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C8D4C86FC4; Thu, 29 Dec 2022 09:03:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:03:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0945e4913fba932217278f484de04cc366415bd6
X-Git-Newrev: 6a11ca5b218e42c970858ba1ef83ec8572c326c1
X-Patchwork-Hint: ignore
Message-Id: <20221229090320.C8D4C86FC4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rsync: add xxhash support
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a11ca5b218e42c970858ba1ef83ec8572c326c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rsync/rsync.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 8c7ad462ac..3cdd820fc0 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -19,7 +19,6 @@ RSYNC_CONF_OPTS = \
 	--with-included-popt=no \
 	--disable-roll-simd \
 	--disable-openssl \
-	--disable-xxhash \
 	--disable-zstd \
 	--disable-lz4 \
 	--disable-md5-asm
@@ -30,4 +29,11 @@ else
 RSYNC_CONF_OPTS += --disable-acl-support
 endif
 
+ifeq ($(BR2_PACKAGE_XXHASH),y)
+RSYNC_DEPENDENCIES += xxhash
+RSYNC_CONF_OPTS += --enable-xxhash
+else
+RSYNC_CONF_OPTS += --disable-xxhash
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
