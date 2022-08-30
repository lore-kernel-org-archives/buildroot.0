Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A729ECAAA1
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 16:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BABEB8197D;
	Tue, 30 Aug 2022 16:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BABEB8197D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JTeTx8n0k5Ne; Tue, 30 Aug 2022 16:20:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF62C8176A;
	Tue, 30 Aug 2022 16:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF62C8176A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 208571BF3A8
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A617540BB6
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A617540BB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jkh0Fzx0vgUr for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 16:15:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58F63400CB
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 16:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58F63400CB
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9732C880E1; Tue, 30 Aug 2022 16:00:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Aug 2022 18:14:20 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2bcc94e808da90db08a73216ee1cdcda4f1eef6f
X-Git-Newrev: db57110be6a7376c9866a23d8c776eed72fd4130
X-Patchwork-Hint: ignore
Message-Id: <20220830160007.9732C880E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/pkg-utils: refine
 KCONFIG_MUNGE_DOT_CONFIG
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

commit: https://git.buildroot.net/buildroot/commit/?id=db57110be6a7376c9866a23d8c776eed72fd4130
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Given a .config with:

    FOO="1234"
    BAR="$(FOO)"

and then:

    $(call KCONFIG_SET_OPT,FOO,azerty)

would yield a .config with just:

    FOO="azerty"

because \<FOO\> would match the assignment to BAR.

Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ff506cdeb7d8c7f98164a77b516d1bcc5c2d67f3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index e5dba2add0..6ece27baa2 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -22,7 +22,7 @@ KCONFIG_DOT_CONFIG = $(strip \
 
 # KCONFIG_MUNGE_DOT_CONFIG (option, newline [, file])
 define KCONFIG_MUNGE_DOT_CONFIG
-	$(SED) "/\\<$(strip $(1))\\>/d" $(call KCONFIG_DOT_CONFIG,$(3)) && \
+	$(SED) '/^\(# \)\?$(strip $(1))\>/d' $(call KCONFIG_DOT_CONFIG,$(3)) && \
 	echo '$(strip $(2))' >> $(call KCONFIG_DOT_CONFIG,$(3))
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
