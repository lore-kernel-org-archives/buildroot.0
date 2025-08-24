Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746EFCA0EFC
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 14:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EA4283D89;
	Sun, 24 Aug 2025 14:15:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gHX6rYIZNorp; Sun, 24 Aug 2025 14:15:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F391A83BAD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F391A83BAD;
	Sun, 24 Aug 2025 14:15:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B0C91D9
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17EE1405C2
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:15:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t24aYnqu5VSf for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 14:15:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68DE84042A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68DE84042A
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:15:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 635B787A31; Sun, 24 Aug 2025 14:15:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Aug 2025 16:14:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f74f7d4a03885de3ea1b0c590deb720ad53fd1ec
X-Git-Newrev: 2c627ac6b3f76e268515c045f8f912ad966382e6
X-Patchwork-Hint: ignore
Message-Id: <20250824141525.635B787A31@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dtach: fix GCC 15 build
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2c627ac6b3f76e268515c045f8f912ad966382e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GCC 15 making C23 the default causes the dtach build to fail. Import the
upstream patch that fixes it.

Fixes: https://autobuild.buildroot.org/results/1ab/1ab2eead8309c138ad7a5190e2489e086c3d676d
Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/dtach/0001-fix-gcc-15-build.patch | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/dtach/0001-fix-gcc-15-build.patch b/package/dtach/0001-fix-gcc-15-build.patch
new file mode 100644
index 0000000000..4da6abb44e
--- /dev/null
+++ b/package/dtach/0001-fix-gcc-15-build.patch
@@ -0,0 +1,27 @@
+From 6d80909a8c0fd19717010a3c76fec560f988ca48 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Mon, 9 Dec 2024 12:35:09 +0000
+Subject: [PATCH] fix gcc-15 build
+
+Upstream: https://github.com/crigler/dtach/commit/6d80909a8c0fd19717010a3c76fec560f988ca48
+Signed-off-by: Florian Larysch <fl@n621.de>
+---
+ attach.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/attach.c b/attach.c
+index 41a696c..e4a46bd 100644
+--- a/attach.c
++++ b/attach.c
+@@ -96,7 +96,7 @@ die(int sig)
+ 
+ /* Window size change. */
+ static RETSIGTYPE
+-win_change()
++win_change(int sig)
+ {
+ 	signal(SIGWINCH, win_change);
+ 	win_changed = 1;
+-- 
+2.50.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
