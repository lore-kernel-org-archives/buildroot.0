Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39462C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 09:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40D5A81E6C;
	Mon, 25 Mar 2024 09:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id giXumpX6uvJH; Mon, 25 Mar 2024 09:22:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6E2181E4B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6E2181E4B;
	Mon, 25 Mar 2024 09:21:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C5CB1BF370
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 09:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8933940179
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 09:21:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SibhkiB-K05A for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 09:21:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C34540146
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C34540146
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 09:21:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E75B83DB1; Mon, 25 Mar 2024 09:21:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 10:11:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f98239dada59270efe19de9d9fae50ec9ab9d28c
X-Git-Newrev: bb4371d0863a2714e81b81bb2d5bafe18b4b3110
X-Patchwork-Hint: ignore
Message-Id: <20240325092156.3E75B83DB1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/doc-asciidoc.mk: unbreak docs
 logic after pkgdir change
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bb4371d0863a2714e81b81bb2d5bafe18b4b3110
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 748fc4be21e (package/pkg-utils.mk: remove trailing slash in pkgdir
definition) broke the docs generation logic:

make manual-html
>>>   Preparing the manual sources...
>>>   Generating HTML manual...
a2x: ERROR: missing ASCIIDOC_FILE: /home/peko/source/buildroot/output/build/docs/manual/manual.adoc

make: *** [docs/manual/manual.mk:12: /home/peko/source/buildroot/output/docs/manual/manual.html] Error 1

As it now ends up with the .adoc file one level below
(../docs/manual/manual/manual.adoc).  The reason is that the pkgdir macro is
used to define $(2)_DOCDIR, which is passed to rsync:

rsync -a docs/manual /home/peko/source/buildroot/output/build/docs/manual

Fix it by appending a / to the rsync arguments like we do elsewhere.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/doc-asciidoc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
index 40c9a725d1..d6ecd1e30e 100644
--- a/package/doc-asciidoc.mk
+++ b/package/doc-asciidoc.mk
@@ -155,7 +155,7 @@ $(1)-check-dependencies: asciidoc-check-dependencies $$($(2)_DEPENDENCIES)
 $$(BUILD_DIR)/docs/$(1)/.stamp_doc_rsynced:
 	$$(Q)$$(call MESSAGE,"Preparing the $(1) sources...")
 	$$(Q)mkdir -p $$(@D)
-	$$(Q)rsync -a $$($(2)_DOCDIR) $$(@D)
+	$$(Q)rsync -a $$($(2)_DOCDIR)/ $$(@D)/
 	$$(Q)$$(foreach hook,$$($(2)_POST_RSYNC_HOOKS),$$(call $$(hook))$$(sep))
 
 .PHONY: $(1)-prepare-sources
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
