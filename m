Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B36BC02194
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 13:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63AA9405A8;
	Sat, 14 Sep 2024 13:00:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6MFxLB-kG6FQ; Sat, 14 Sep 2024 13:00:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FFB140568
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FFB140568;
	Sat, 14 Sep 2024 13:00:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 337911BF232
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E77340612
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J7zmkOQ7jFoo for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 13:00:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EA5840102
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EA5840102
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 13:00:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29BCC828F8; Sat, 14 Sep 2024 13:00:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 14:59:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f4681fc417a057f46f00ac95474251944843a050
X-Git-Newrev: 109c7c437c9743a6fd71a5653c634d7ba7514df9
X-Patchwork-Hint: ignore
Message-Id: <20240914130039.29BCC828F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-generic.mk: legal-info: proper
 double-dollar
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

commit: https://git.buildroot.net/buildroot/commit/?id=109c7c437c9743a6fd71a5653c634d7ba7514df9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Everything inside the generic-package macro should be double-dollared,
except for $(1) $(2) etc. There was still a $(call ...) that was not
double-dollared in the legal-info target. The result is that
OVERRIDE_SRCDIR isn't actually qstrip'ed.

Double dollar the $(call ...) like everywhere else.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Cc: Nicolas Carrier <carrier.nicolas0@gmail.com>
Reported-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
