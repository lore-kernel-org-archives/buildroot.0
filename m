Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B0DC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 15:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C41F60E44;
	Wed, 27 Jul 2022 15:30:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C41F60E44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gsSmjKP2DY9G; Wed, 27 Jul 2022 15:30:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF19460E98;
	Wed, 27 Jul 2022 15:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF19460E98
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8216D1BF41A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E182819C8
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:30:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E182819C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FYrGrpfN4Ftv for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 15:30:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8878181445
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:30:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8878181445
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 395B3866DB; Wed, 27 Jul 2022 15:16:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 17:28:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 78727d83e6b8dc0447d3c37af043b56bc7565e20
X-Git-Newrev: ff506cdeb7d8c7f98164a77b516d1bcc5c2d67f3
X-Patchwork-Hint: ignore
Message-Id: <20220727151618.395B3866DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-utils: refine
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff506cdeb7d8c7f98164a77b516d1bcc5c2d67f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
