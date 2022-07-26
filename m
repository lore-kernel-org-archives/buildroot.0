Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD97C00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 21:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74A348175B;
	Tue, 26 Jul 2022 21:54:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74A348175B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fVJpXBdwiFu2; Tue, 26 Jul 2022 21:54:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91A9A812F0;
	Tue, 26 Jul 2022 21:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91A9A812F0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 08A721BF59F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA916607B4
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA916607B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 21YI6K0er3uI for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 21:54:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B63160671
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 21:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B63160671
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 65A03863C4; Tue, 26 Jul 2022 21:40:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 23:53:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 359a2f8efd7835ed1b7cc2d580a4e41926fd7e03
X-Git-Newrev: 69e84008abf87eaeeb3f2d53c880cf33492a3bf8
X-Patchwork-Hint: ignore
Message-Id: <20220726214058.65A03863C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "libcurl: add host variant"
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

commit: https://git.buildroot.net/buildroot/commit/?id=69e84008abf87eaeeb3f2d53c880cf33492a3bf8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host-libcurl was initially added for host-cargo, but it is no
longer used, so we can remove it.

This reverts commit 736e0fc5d6103300fb5d6b0cde5e22ce978b8a80.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcurl/libcurl.mk | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index dc0f1230f1..9614ba5143 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -186,17 +186,4 @@ endef
 LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_CLEANUP
 endif
 
-HOST_LIBCURL_DEPENDENCIES = host-openssl
-HOST_LIBCURL_CONF_OPTS = \
-	--disable-manual \
-	--disable-ntlm-wb \
-	--disable-curldebug \
-	--with-ssl \
-	--without-gnutls \
-	--without-mbedtls \
-	--without-nss
-
-HOST_LIBCURL_POST_PATCH_HOOKS += LIBCURL_FIX_DOT_PC
-
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
