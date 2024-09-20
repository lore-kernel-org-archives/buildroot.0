Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896CAC78821
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 10:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BD23402AD;
	Fri, 20 Sep 2024 10:36:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PkGSzS9d4c4S; Fri, 20 Sep 2024 10:36:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A0A642BBE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A0A642BBE;
	Fri, 20 Sep 2024 10:36:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F10B1BF982
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27EF942C3D
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:36:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id siUyFVnYFDIw for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 10:36:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3044E42B84
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3044E42B84
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 10:36:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B34384117; Fri, 20 Sep 2024 10:36:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 12:29:33 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 5db78454b230652164db6e2a5eef91f65f891b5e
X-Git-Newrev: f70be8d584004524bda546735ac14f3fbc30cbf1
X-Patchwork-Hint: ignore
Message-Id: <20240920103606.2B34384117@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/pkg-generic.mk:
 legal-info: create redist directory for override
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

commit: https://git.buildroot.net/buildroot/commit/?id=f70be8d584004524bda546735ac14f3fbc30cbf1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

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
(cherry picked from commit d1945f143d4c8cfc541c17ec6ce03c45e2a09155)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
