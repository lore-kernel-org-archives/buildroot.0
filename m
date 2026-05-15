Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFD8CD4F49
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D95AF41D62;
	Fri, 15 May 2026 17:45:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id suirleWFWWct; Fri, 15 May 2026 17:45:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2DC241D5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867121;
	bh=DR9XLpt5bNEXZaN++TSG4dixZvtntkkBtuZgG4n/S0Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BNiVz4HG1SYtg1+Hay3Gcf0IqHsbJqWUGmpVlIlJW7EvrznMyuUjNJmjkT3o4ynLs
	 B2S/tgrWnRfzvYxlxy0Wh8miGMt+ee8nyZZ33U3oFxqxHDJ5/SNTZFQ33dZ0mufXFG
	 +lyYkC2W6R2eGxEmVZNUyLumgW/Ta5PQbHDbtQ5LgWO9PapR7E3yiGAIUkWze6mOae
	 uctcSkP1gZCyTuzPFxnzYU8ksi7HA0B4OaSy3Oytk8wN4hkujVJ/s2wHotTfbjYFOv
	 CfytNFnlU1i4jgzjagh+r/rUbRB6GnHipFLnNMkgXTxhPaPDDnL2Wv/haW9HwucldV
	 iHc6V8uSC8lPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2DC241D5B;
	Fri, 15 May 2026 17:45:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D0A3A23F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6ABCA61544
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uy2wWiHCdfEC for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:44:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11E036169C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11E036169C
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F3F6863D9; Fri, 15 May 2026 17:44:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:59:19 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1f1a302056bb5e51a8a5d0194bda1bf67573f49d
X-Git-Newrev: 5c5c8f4b081262e697f07dfc7bcc9d7dd6dd36bf
X-Patchwork-Hint: ignore
Message-Id: <20260515174449.4F3F6863D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 support/scripts/pkg-stats: fix host/target infra filter
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5c5c8f4b081262e697f07dfc7bcc9d7dd6dd36bf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The filter is supposed to exclude host/target infra from output if the
respective package is not built with the current
configuration.

However, excluding host packages did not work correctly: If keep_host
is False because the host package is not built, the next branch was
checked and included the host infra in output with "target" type if
the target package is built. For a package that support host and
target build, but gets built only for the target, this leads to output
like (Meson example):

meson (target)
host-meson (target)

Skip host infra in the target branch instead. Also include
Package.infra in Package.__str__() result, which was needed for
debugging this bug.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit e8dcebf4597d74dc12c86535118ae0bd16d272a0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/pkg-stats | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index a87bb23a8e..bbd1e3e6f0 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -205,7 +205,7 @@ class Package:
                 infra = match.group(1)
                 if infra.startswith("host-") and keep_host:
                     self.infras.append(("host", infra[5:]))
-                elif keep_target:
+                elif not infra.startswith("host-") and keep_target:
                     self.infras.append(("target", infra))
 
     def set_license(self):
@@ -342,9 +342,10 @@ class Package:
         return self.path < other.path
 
     def __str__(self):
-        return "%s (path='%s', license='%s', license_files='%s', hash='%s', patches=%d)" % \
+        return "%s (path='%s', license='%s', license_files='%s', hash='%s', patches=%d, infras=%r)" % \
             (self.name, self.path, self.is_status_ok('license'),
-             self.is_status_ok('license-files'), self.status['hash'], self.patch_count)
+             self.is_status_ok('license-files'), self.status['hash'], self.patch_count,
+             self.infras)
 
 
 def get_pkglist(trees, npackages, package_list):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
