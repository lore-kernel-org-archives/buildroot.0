Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB16C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 16:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0115340629;
	Sun,  3 Dec 2023 16:38:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0115340629
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l-yNxTivVKA8; Sun,  3 Dec 2023 16:38:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38AA84067F;
	Sun,  3 Dec 2023 16:38:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38AA84067F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B2CC1BF471
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C54E40467
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:38:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C54E40467
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y6eRHZwfDZYc for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 16:38:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CCCE408DA
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 16:38:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CCCE408DA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F7F78777E; Sun,  3 Dec 2023 16:38:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 17:27:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6a7050d7191b9a534d1d2789ceb72d69f25da83
X-Git-Newrev: a3db1dd1b7b4fca95eefb1f42a25881f89d881f7
X-Patchwork-Hint: ignore
Message-Id: <20231203163805.3F7F78777E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xenomai: fix build with gcc >= 12
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

commit: https://git.buildroot.net/buildroot/commit/?id=a3db1dd1b7b4fca95eefb1f42a25881f89d881f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc >= 12:

task.c: In function 't_start':
task.c:398:16: error: 'ret' may be used uninitialized [-Werror=maybe-uninitialized]
  398 |         return ret;
      |                ^~~
task.c:364:13: note: 'ret' was declared here
  364 |         int ret;
      |             ^~~
task.c: In function 't_resume':
task.c:444:16: error: 'ret' may be used uninitialized [-Werror=maybe-uninitialized]
  444 |         return ret;
      |                ^~~
task.c:428:13: note: 'ret' was declared here
  428 |         int ret;
      |             ^~~

Fixes:
 - http://autobuild.buildroot.org/results/bc1b40de22e563b704ad7f20b6bf4d1f73a6ed8a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...004-lib-psos-task.c-fix-build-with-gcc-12.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/xenomai/3.0.10/0004-lib-psos-task.c-fix-build-with-gcc-12.patch b/package/xenomai/3.0.10/0004-lib-psos-task.c-fix-build-with-gcc-12.patch
new file mode 100644
index 0000000000..fcc1f1e673
--- /dev/null
+++ b/package/xenomai/3.0.10/0004-lib-psos-task.c-fix-build-with-gcc-12.patch
@@ -0,0 +1,56 @@
+From 6c6da9e6d75ccfaa83c1efe14211f080c14181c6 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 3 Dec 2023 15:28:50 +0100
+Subject: [PATCH] lib/psos/task.c: fix build with gcc >= 12
+
+Fix the following build failure with gcc >= 12:
+
+task.c: In function 't_start':
+task.c:398:16: error: 'ret' may be used uninitialized [-Werror=maybe-uninitialized]
+  398 |         return ret;
+      |                ^~~
+task.c:364:13: note: 'ret' was declared here
+  364 |         int ret;
+      |             ^~~
+task.c: In function 't_resume':
+task.c:444:16: error: 'ret' may be used uninitialized [-Werror=maybe-uninitialized]
+  444 |         return ret;
+      |                ^~~
+task.c:428:13: note: 'ret' was declared here
+  428 |         int ret;
+      |             ^~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/bc1b40de22e563b704ad7f20b6bf4d1f73a6ed8a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://lore.kernel.org/xenomai/20231203144307.1940139-1-fontaine.fabrice@gmail.com/T/#u
+---
+ lib/psos/task.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/psos/task.c b/lib/psos/task.c
+index f678be61d..27bcc28a9 100644
+--- a/lib/psos/task.c
++++ b/lib/psos/task.c
+@@ -362,7 +362,7 @@ u_long t_start(u_long tid,
+ {
+ 	struct psos_task *task;
+ 	struct service svc;
+-	int ret;
++	int ret = SUCCESS;
+ 
+ 	CANCEL_DEFER(svc);
+ 
+@@ -426,7 +426,7 @@ u_long t_resume(u_long tid)
+ {
+ 	struct psos_task *task;
+ 	struct service svc;
+-	int ret;
++	int ret = SUCCESS;
+ 
+ 	CANCEL_DEFER(svc);
+ 
+-- 
+2.42.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
