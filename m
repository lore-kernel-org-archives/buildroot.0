Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD25C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 11:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0B134022C;
	Sun, 13 Feb 2022 11:44:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NwCF6JJfbiVg; Sun, 13 Feb 2022 11:44:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A170B40181;
	Sun, 13 Feb 2022 11:44:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AAF361BF842
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 999C4402E2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:44:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eBKUiWyu9COX for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 11:44:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E98A3402C1
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 11:44:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CB30B82578; Sun, 13 Feb 2022 11:36:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 12:43:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e19ca4cf302c772e5a6725e7d2ab80b7b3978da
X-Git-Newrev: 78a3807295f7436297056aab6ff4916bdb0f8289
X-Patchwork-Hint: ignore
Message-Id: <20220213113628.CB30B82578@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webp: enable host build
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

commit: https://git.buildroot.net/buildroot/commit/?id=78a3807295f7436297056aab6ff4916bdb0f8289
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will be needed by qt5webengine.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Peter: explicitly disable gif/gl/jpeg/png/tiff support]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webp/webp.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index d1462426c6..e8d204919c 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -19,6 +19,15 @@ WEBP_CONF_OPTS += \
 	--with-tiffincludedir=$(STAGING_DIR)/usr/include \
 	--with-tifflibdir=$(STAGING_DIR)/usr/lib
 
+HOST_WEBP_CONF_OPTS += \
+	--enable-libwebpdemux \
+	--enable-libwebpmux \
+	--disable-gif \
+	--disable-gl \
+	--disable-jpeg \
+	--disable-png \
+	--disable-tiff
+
 ifeq ($(BR2_PACKAGE_WEBP_DEMUX),y)
 WEBP_CONF_OPTS += --enable-libwebpdemux
 else
@@ -56,3 +65,4 @@ WEBP_DEPENDENCIES += $(if $(BR2_PACKAGE_JPEG),jpeg)
 WEBP_DEPENDENCIES += $(if $(BR2_PACKAGE_TIFF),tiff)
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
