Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1740ECA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 19:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DED2780E27;
	Thu, 14 Aug 2025 19:57:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AwA8ZW-IbBSA; Thu, 14 Aug 2025 19:57:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E16C80DF6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E16C80DF6;
	Thu, 14 Aug 2025 19:56:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4ED9A228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01680404A8
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QcloN3px32Yb for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 19:56:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 193F24049E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 193F24049E
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16D4F87609; Thu, 14 Aug 2025 19:56:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:26:25 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4f1ca35058d2e8621c5b961b603c080d17beaec5
X-Git-Newrev: 51eee4e7ac2319da7b5066f47f21157144fb9318
X-Patchwork-Hint: ignore
Message-Id: <20250814195612.16D4F87609@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Makefile: fix
 list-defconfigs for br2-external with weird descriptions
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=51eee4e7ac2319da7b5066f47f21157144fb9318
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

When a br2-external tree description contains an odd number of single
quotes, list-defconfigs will fail with a shell error message:

    /bin/sh: -c: line 1: unexpected EOF while looking for matching `"'
    make[1]: *** [Makefile:1243: list-defconfigs] Error 2

Whoever wrote that code will have to write this sentence 100 times
on the blackboard:

     Never, ever pass user-provided data in a printf format.

(see commit 49117c102803 (core: support description for br2-external
trees); dang, I knew it... And I should have known better when I wrote
that code, damit...)

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 161d7ded43da4d48641db5ea83b1af4cb976410a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index b9ab0f5caa..6b1a3da9e2 100644
--- a/Makefile
+++ b/Makefile
@@ -1223,7 +1223,7 @@ define list-defconfigs
 		[ -f "$${defconfig}" ] || continue; \
 		if $${first}; then \
 			if [ "$(2)" ]; then \
-				printf 'External configs in "$(call qstrip,$(2))":\n'; \
+				printf 'External configs in "%s":\n' "$(call qstrip,$(2))"; \
 			else \
 				printf "Built-in configs:\n"; \
 			fi; \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
