Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB15DC02197
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 13:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FA2E405CC;
	Sat, 14 Sep 2024 13:00:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ohr2p9S_zThW; Sat, 14 Sep 2024 13:00:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E66F405D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E66F405D8;
	Sat, 14 Sep 2024 13:00:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A885E1BF232
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85BE06076D
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VfoL5sL8tNQG for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 13:00:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FC5260769
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FC5260769
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 13:00:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B7D9828F0; Sat, 14 Sep 2024 13:00:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 14:58:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1945f143d4c8cfc541c17ec6ce03c45e2a09155
X-Git-Newrev: f4681fc417a057f46f00ac95474251944843a050
X-Patchwork-Hint: ignore
Message-Id: <20240914130039.1B7D9828F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-generic.mk: legal-info: make
 sure host-tar is available
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

commit: https://git.buildroot.net/buildroot/commit/?id=f4681fc417a057f46f00ac95474251944843a050
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit aacca7f0639bac6bb3fb262d0b1738c4387edeb0 introduced the
possibility to also create tarballs for packages that are local or
overridden (i.e., with a custom version). However, it doesn't work
correctly for PPD, because the PPD-host-tar and gzip are not available.

This failure was silent because the mk_tar_gz function doesn't exit on
error. The following error was printed but ignored:

    support/download/helpers: line 62: .../per-package/busybox/host/bin/tar: No such file or directory

Call prepare-per-package-directory before calling mk_tar_gz which uses
it. Note that we use only tar and gzip here, not all of
DOWNLOAD_DEPENDENCIES, because tar and gzip are the only ones we really
use.

Also add this dependency to the legal-info target. We use an order-only
dependency even though that makes not difference for a phony target, but
this makes it similar to how it's done for the stamp targets. Note also
that this dependency is redundant, because there is already a dependency
on the foo-rsync target which does depend on DOWNLOAD_DEPENDENCIES. We
still add the dependency explicitly in case things change with the
foo-rsync target in the future.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Cc: Nicolas Carrier <carrier.nicolas0@gmail.com>
Reported-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 69352b3730..48cc8ec800 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1008,6 +1008,9 @@ $(1)-rsync:		$$($(2)_TARGET_RSYNC)
 
 $(1)-source:
 $(1)-legal-source:
+# For override, legal-info uses host-tar and host-gzip
+$(1)-legal-info: | $(BR2_GZIP_HOST_DEPENDENCY) $(BR2_TAR_HOST_DEPENDENCY)
+
 
 $(1)-external-deps:
 	@echo "file://$$($(2)_OVERRIDE_SRCDIR)"
@@ -1163,6 +1166,7 @@ ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 	$$(Q)rsync -au --chmod=u=rwX,go=rX $$(RSYNC_VCS_EXCLUSIONS) \
 		$(call qstrip,$$($(2)_OVERRIDE_SRCDIR))/ \
 		 $$($(2)_BUILDDIR)/.legal-info-rsync/
+	$$(call prepare-per-package-directory,$$(BR2_GZIP_HOST_DEPENDENCY) $$(BR2_TAR_HOST_DEPENDENCY))
 	$$(Q)mkdir -p $$($(2)_REDIST_SOURCES_DIR)
 	$$(Q). support/download/helpers; set -x; cd $$($(2)_BUILDDIR); TAR=$$(TAR) mk_tar_gz \
 		$$($(2)_BUILDDIR)/.legal-info-rsync/ \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
