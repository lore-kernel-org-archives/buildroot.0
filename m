Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84711E77183
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 22:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1382407D4;
	Mon, 16 Dec 2024 22:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lPiEorJjCMqZ; Mon, 16 Dec 2024 22:01:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3703A407CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3703A407CE;
	Mon, 16 Dec 2024 22:01:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 22C44E3
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 22:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9AD1407CA
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 22:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lp0Fh2IlBHBy for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 22:01:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02054407CC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02054407CC
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 22:01:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8C8C8716B; Mon, 16 Dec 2024 22:01:37 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Dec 2024 22:57:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ab704699ea70b12478eac87313ec7d1ff902c7a
X-Git-Newrev: 5202ddc77734c80a0cdaa77a1d51e05e61fc5819
X-Patchwork-Hint: ignore
Message-Id: <20241216220137.B8C8C8716B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/quickjs: fix typo in prefix
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=5202ddc77734c80a0cdaa77a1d51e05e61fc5819
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The quickjs Makefile expects the variable PREFIX to be set [1] but
prefix is set instead.
Without this parameter quickjs is installed to /usr/local by default [2]
instead of /usr as requested.
This commit fixed this error.

[1]: https://github.com/bellard/quickjs/blob/master/Makefile#L383
[2]: https://github.com/bellard/quickjs/blob/master/Makefile#L43

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/quickjs/quickjs.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/quickjs/quickjs.mk b/package/quickjs/quickjs.mk
index e745923b87..2bd9da1392 100644
--- a/package/quickjs/quickjs.mk
+++ b/package/quickjs/quickjs.mk
@@ -29,7 +29,7 @@ define QUICKJS_INSTALL_STAGING_CMDS
 		EXTRA_LIBS="$(QUICKJS_EXTRA_LIBS)" \
 		DESTDIR=$(STAGING_DIR) \
 		STRIP=/bin/true \
-		prefix=/usr \
+		PREFIX=/usr \
 		install
 endef
 
@@ -39,7 +39,7 @@ define QUICKJS_INSTALL_TARGET_CMDS
 		EXTRA_LIBS="$(QUICKJS_EXTRA_LIBS)" \
 		DESTDIR=$(TARGET_DIR) \
 		STRIP=/bin/true \
-		prefix=/usr \
+		PREFIX=/usr \
 		install
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
