Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59956C02197
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 13:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2141E4020B;
	Sat, 14 Sep 2024 13:00:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HOUfioxqW8nZ; Sat, 14 Sep 2024 13:00:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D84A240278
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D84A240278;
	Sat, 14 Sep 2024 13:00:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FAFD1BF232
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F27D86076F
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wm04Ef3nHfoP for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 13:00:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25DE5606E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25DE5606E7
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 13:00:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0DA99828E5; Sat, 14 Sep 2024 13:00:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 14:54:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8b83b861c5f503481c47c4fc9335dc3e87b027a
X-Git-Newrev: d1945f143d4c8cfc541c17ec6ce03c45e2a09155
X-Patchwork-Hint: ignore
Message-Id: <20240914130039.0DA99828E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-generic.mk: legal-info: create
 redist directory for override
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1945f143d4c8cfc541c17ec6ce03c45e2a09155
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit aacca7f0639bac6bb3fb262d0b1738c4387edeb0 introduced the
possibility to also create tarballs for packages that are local or
overridden (i.e., with a custom version). However, it forgot to create
the directory in which that tarball is stored. The original patch did,
but it was reworked by Arnout to use mk_tar_gz instead of tar directly,
and the mkdir was dropped there.

This failure was silent because the mk_tar_gz function doesn't exit on
error. The following error was printed but ignored:

    support/download/helpers: line 68: .../legal-info/sources/busybox-custom/busybox-custom.tar.gz: No such file or directory

Create the directory before calling mk_tar_gz.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Cc: Nicolas Carrier <carrier.nicolas0@gmail.com>
Reported-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 171163dcb4..69352b3730 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1163,6 +1163,7 @@ ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 	$$(Q)rsync -au --chmod=u=rwX,go=rX $$(RSYNC_VCS_EXCLUSIONS) \
 		$(call qstrip,$$($(2)_OVERRIDE_SRCDIR))/ \
 		 $$($(2)_BUILDDIR)/.legal-info-rsync/
+	$$(Q)mkdir -p $$($(2)_REDIST_SOURCES_DIR)
 	$$(Q). support/download/helpers; set -x; cd $$($(2)_BUILDDIR); TAR=$$(TAR) mk_tar_gz \
 		$$($(2)_BUILDDIR)/.legal-info-rsync/ \
 		$$($(2)_BASENAME_RAW) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
