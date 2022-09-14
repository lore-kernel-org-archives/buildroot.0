Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD26ECAAD3
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 09:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A33FA40363;
	Wed, 14 Sep 2022 09:41:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A33FA40363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xpknPhjcXkau; Wed, 14 Sep 2022 09:41:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73E904028E;
	Wed, 14 Sep 2022 09:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73E904028E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 11F8A1BF355
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 09:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECCD24028E
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 09:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECCD24028E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h1C90h2pZ81c for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 09:40:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8B2040248
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 09:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8B2040248
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D621D83923; Wed, 14 Sep 2022 09:40:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Sep 2022 11:37:05 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f66f51b6c68b74e91ccde2eebf57e40c5e7ba582
X-Git-Newrev: fe73c6e9d02df06c0ca8a5e3b80679ce72415718
X-Patchwork-Hint: ignore
Message-Id: <20220914094044.D621D83923@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] Makefile: enhance
 reporting error about empty VARS
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

commit: https://git.buildroot.net/buildroot/commit/?id=fe73c6e9d02df06c0ca8a5e3b80679ce72415718
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Use $(error) to simplify the code (drop "exit 1") and sned the message
to stderr.

Reported-by: David Laight <David.Laight@ACULAB.COM>
Reported-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>
(cherry picked from commit 466d65d73e38545252528a81c31632ba316c77fa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 2b4d927445..51de2066d7 100644
--- a/Makefile
+++ b/Makefile
@@ -1062,8 +1062,7 @@ endif
 .PHONY: printvars
 printvars:
 ifndef VARS
-	@echo "Please pass a non-empty VARS to 'make printvars'"
-	@exit 1
+	$(error Please pass a non-empty VARS to 'make printvars')
 endif
 	@:
 	$(foreach V, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
