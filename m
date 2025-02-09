Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FA6C02199
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 15:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C413A80E14;
	Sun,  9 Feb 2025 15:10:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SUkIBs5R6pfK; Sun,  9 Feb 2025 15:10:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB7CF80DE4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB7CF80DE4;
	Sun,  9 Feb 2025 15:10:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CDBF96C
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 15:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACE0A40278
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 15:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TOncYPAnEzwq for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 15:09:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBAF04026F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBAF04026F
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 15:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4CAC38745E; Sun,  9 Feb 2025 15:09:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Feb 2025 15:20:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13deac1e39855cc8df1433299a6741a085afca46
X-Git-Newrev: 0100c6e402b6cf67c580b4b6b43b958d1c4f761f
X-Patchwork-Hint: ignore
Message-Id: <20250209150951.4CAC38745E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/mkusers: fix shellcheck
 error related to auto_id
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

commit: https://git.buildroot.net/buildroot/commit/?id=0100c6e402b6cf67c580b4b6b43b958d1c4f761f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SC2086 is now reported for auto_id since shellcheck 0.9.0:

In support/scripts/mkusers line 453:
                add_one_group "${g}" ${auto_id}
                                     ^--------^ SC2086 (info): Double quote to prevent globbing and word splitting.

So quote it to get rid of this error.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
[Peter: quote variable instead of disabling check]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/mkusers | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index 08f3344518..87a36a89a1 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -450,7 +450,7 @@ main() {
                 auto_id=${AUTO_USER_ID}
             fi
             for g in ${groups//,/ }; do
-                add_one_group "${g}" ${auto_id}
+                add_one_group "${g}" "${auto_id}"
             done
         fi
     done
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
