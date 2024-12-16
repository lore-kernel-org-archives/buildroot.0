Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D677C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C9C44F6D6;
	Fri, 28 Feb 2025 16:40:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5U3Cd3QbDG46; Fri, 28 Feb 2025 16:40:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 809D84F6CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 809D84F6CD;
	Fri, 28 Feb 2025 16:40:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F5B21DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4500418F7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9M5pOo6cR-sm for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E46A424D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E46A424D4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 30D8885E77; Fri, 28 Feb 2025 16:29:42 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Dec 2024 22:57:38 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9ab704699ea70b12478eac87313ec7d1ff902c7a
X-Git-Newrev: 5202ddc77734c80a0cdaa77a1d51e05e61fc5819
X-Patchwork-Hint: ignore
Message-Id: <20250228162942.30D8885E77@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/quickjs: fix typo in
 prefix
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
