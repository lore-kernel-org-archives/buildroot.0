Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEF9C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 17:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 270F840575;
	Sun,  9 Jan 2022 17:40:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f72kpIz2dZyw; Sun,  9 Jan 2022 17:40:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EFDF401FB;
	Sun,  9 Jan 2022 17:40:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6DAFF1BF969
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 17:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C28D81CBA
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 17:40:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N2WA_VjjN7WW for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 17:40:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC12481CAF
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 17:40:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F2E0982DF0; Sun,  9 Jan 2022 17:34:36 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 18:35:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 56d50e835441f384cc2d1b29ccbeed0b1f936728
X-Git-Newrev: 7818ba0d6fde9ce9836e6c869d2a5faa5f32586d
X-Patchwork-Hint: ignore
Message-Id: <20220109173436.F2E0982DF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Config.in.legacy: remove
 BR2_PACKAGE_SYSTEMD_TMPFILES
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

commit: https://git.buildroot.net/buildroot/commit/?id=7818ba0d6fde9ce9836e6c869d2a5faa5f32586d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the BR2_PACKAGE_SYSTEMD_TMPFILES was removed, it was added to
Config.in. The idea was to warn users who use the symbol in their
br2-external.

However, most users don't have a br2-external that uses this symbol.
Since the symbol defaults to y when systemd is enabled, they'll get this
legacy warning - which is completely meaningless for them since nothing
changes.

The annoyance of the many is worse than the possible unexpected change
for the few. And anyone actually relying on BR2_PACKAGE_SYSTEMD_TMPFILES
will probably easily discover the issue in testing (e.g. because the
tmpfiles conf is missing in the target).

Therefore, remove BR2_PACKAGE_SYSTEMD_TMPFILES from Config.in.legacy.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 5a3e9b5cc7..d36eac3302 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -153,15 +153,6 @@ config BR2_PACKAGE_PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE
 	  This package has been removed as python-setuptools-scm
 	  dropped support of python 2 since version 6.0.0.
 
-config BR2_PACKAGE_SYSTEMD_TMPFILES
-	bool "systemd tmpfiles support always enabled"
-	select BR2_LEGACY
-	help
-	  The systemd tmpfiles support is always enabled, so the symbol
-	  to make it optional has been removed. You need to update any
-	  external packages that use this symbol to use
-	  BR2_PACKAGE_SYSTEMD instead.
-
 config BR2_PACKAGE_CIVETWEB_WITH_LUA
 	bool "civetweb lua support option removed"
 	select BR2_LEGACY
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
