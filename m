Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E89C61DA4
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 19:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 858F14167A;
	Thu, 23 Feb 2023 19:11:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 858F14167A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tgHS1HfYd3wN; Thu, 23 Feb 2023 19:11:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65B1A41673;
	Thu, 23 Feb 2023 19:11:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65B1A41673
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 190FF1BF343
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 19:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1830814BA
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 19:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1830814BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JrL53_HyJ3pn for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 19:11:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26DFA8151E
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 19:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26DFA8151E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16D4D8697C; Thu, 23 Feb 2023 19:11:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 20:08:44 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 81b082a4fe581fe3729b0eb4155a2781f99be2fc
X-Git-Newrev: bc12f089b6f102b97497c287fa44e2ce5707639e
X-Patchwork-Hint: ignore
Message-Id: <20230223191106.16D4D8697C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/pkg-generic.mk:
 only check for virtual package conflicts when building
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc12f089b6f102b97497c287fa44e2ce5707639e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

The configuration checks should only be done when building so that
make allyespackageconfig && make source works.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7231701a290ba447fde9807ba9d260022ddfc8e4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index b31c563ae5..f9c0ea71e1 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1182,10 +1182,12 @@ ifeq ($$($$($(2)_KCONFIG_VAR)),y)
 
 # Ensure the calling package is the declared provider for all the virtual
 # packages it claims to be an implementation of.
+ifeq ($(BR_BUILDING),y)
 ifneq ($$($(2)_PROVIDES),)
 $$(foreach pkg,$$($(2)_PROVIDES),\
 	$$(eval $$(call virt-provides-single,$$(pkg),$$(call UPPERCASE,$$(pkg)),$(1))$$(sep)))
 endif
+endif
 
 # Register package as a reverse-dependencies of all its dependencies
 $$(eval $$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),\
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
