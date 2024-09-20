Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1ABC78821
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 10:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20DB142B8D;
	Fri, 20 Sep 2024 10:36:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R09UeuyYXyFS; Fri, 20 Sep 2024 10:36:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C149442D0C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C149442D0C;
	Fri, 20 Sep 2024 10:36:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3FE1A1BF599
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91B774150A
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:36:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bLxa9k4USvLr for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 10:36:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D971414F8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D971414F8
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 10:36:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 44C3584124; Fri, 20 Sep 2024 10:36:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 12:31:48 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: edde5c1a44b995036c1173ad2040f1a8be8d323a
X-Git-Newrev: be164d261dff183796b95021053a8032aeea18b3
X-Patchwork-Hint: ignore
Message-Id: <20240920103606.44C3584124@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/pkg-generic.mk:
 legal-info: proper double-dollar
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

commit: https://git.buildroot.net/buildroot/commit/?id=be164d261dff183796b95021053a8032aeea18b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Everything inside the generic-package macro should be double-dollared,
except for $(1) $(2) etc. There was still a $(call ...) that was not
double-dollared in the legal-info target. The result is that
OVERRIDE_SRCDIR isn't actually qstrip'ed.

Double dollar the $(call ...) like everywhere else.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Cc: Nicolas Carrier <carrier.nicolas0@gmail.com>
Reported-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 109c7c437c9743a6fd71a5653c634d7ba7514df9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 48cc8ec800..e67f141604 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1164,7 +1164,7 @@ ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 	$$(Q)rm -rf  $$($(2)_BUILDDIR)/.legal-info-rsync
 	$$(Q)mkdir -p  $$($(2)_BUILDDIR)/.legal-info-rsync
 	$$(Q)rsync -au --chmod=u=rwX,go=rX $$(RSYNC_VCS_EXCLUSIONS) \
-		$(call qstrip,$$($(2)_OVERRIDE_SRCDIR))/ \
+		$$(call qstrip,$$($(2)_OVERRIDE_SRCDIR))/ \
 		 $$($(2)_BUILDDIR)/.legal-info-rsync/
 	$$(call prepare-per-package-directory,$$(BR2_GZIP_HOST_DEPENDENCY) $$(BR2_TAR_HOST_DEPENDENCY))
 	$$(Q)mkdir -p $$($(2)_REDIST_SOURCES_DIR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
