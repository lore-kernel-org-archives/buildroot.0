Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0F4C6FA86
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 09:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E40ED4174D;
	Wed, 14 Sep 2022 09:39:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E40ED4174D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YqdE20JjaMmu; Wed, 14 Sep 2022 09:39:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C86264171A;
	Wed, 14 Sep 2022 09:38:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C86264171A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 11A0A1BF355
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 09:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C031140213
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 09:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C031140213
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MNvhKLJAFjeP for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 09:38:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49C1140287
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 09:38:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49C1140287
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 159C383902; Wed, 14 Sep 2022 09:38:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Sep 2022 11:37:57 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 8c7c750fc8f1bc4534cd17c3db7d5986719d286c
X-Git-Newrev: 236fc63332fb9a35be297c15bd67ade3c23097fa
X-Patchwork-Hint: ignore
Message-Id: <20220914093808.159C383902@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] Makefile: enhance
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

commit: https://git.buildroot.net/buildroot/commit/?id=236fc63332fb9a35be297c15bd67ade3c23097fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
index 093fbb660c..14edc46865 100644
--- a/Makefile
+++ b/Makefile
@@ -1060,8 +1060,7 @@ endif
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
