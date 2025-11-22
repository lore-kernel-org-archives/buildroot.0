Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1537CFC51F
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 16:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B9DB4075A;
	Sat, 22 Nov 2025 16:44:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNnm94Tb6gbm; Sat, 22 Nov 2025 16:44:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7454404CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7454404CA;
	Sat, 22 Nov 2025 16:44:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DEA2E34E
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEE6B4018D
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XH9r1nom4ZhE for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 16:43:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11300400F8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11300400F8
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:43:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1B437FDFE; Sat, 22 Nov 2025 16:43:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Nov 2025 17:37:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bf5f1b546b408883a721dcaa1a5e660b3d72ad95
X-Git-Newrev: 08a638d49ffb956e759f1b3950dd2b11f6fea483
X-Patchwork-Hint: ignore
Message-Id: <20251122164358.F1B437FDFE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/time: fix build with newer gcc
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=08a638d49ffb956e759f1b3950dd2b11f6fea483
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://autobuild.buildroot.net/results/2d4/2d440a31fc49366d77289f1d21080e1861c6ee21/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...001-time-fix-sighandler-prototype-for-C23.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/time/0001-time-fix-sighandler-prototype-for-C23.patch b/package/time/0001-time-fix-sighandler-prototype-for-C23.patch
new file mode 100644
index 0000000000..8d4e1d7033
--- /dev/null
+++ b/package/time/0001-time-fix-sighandler-prototype-for-C23.patch
@@ -0,0 +1,35 @@
+From 218cd7ce34b6dbc86c80f1c781639ea7661d1252 Mon Sep 17 00:00:00 2001
+From: Marcin Serwin <marcin@serwin.dev>
+Date: Thu, 2 Oct 2025 19:30:12 +0200
+Subject: [PATCH] time: fix sighandler prototype for C23
+
+In C23 functions with empty argument list in the prototype are treated
+as taking no arguments. This means that the `int` argument of the
+sighandler must be specified explicitly or the code will fail to
+compile due to mismatched function type.
+
+Signed-off-by: Marcin Serwin <marcin@serwin.dev>
+
+Upstream: https://lists.gnu.org/archive/html/bug-time/2025-10/msg00000.html
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/time.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/time.c b/src/time.c
+index 7b401bc..88287dd 100644
+--- a/src/time.c
++++ b/src/time.c
+@@ -77,7 +77,7 @@ enum
+ 
+ 
+ /* A Pointer to a signal handler.  */
+-typedef RETSIGTYPE (*sighandler) ();
++typedef RETSIGTYPE (*sighandler) (int);
+ 
+ /* msec = milliseconds = 1/1,000 (1*10e-3) second.
+    usec = microseconds = 1/1,000,000 (1*10e-6) second.  */
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
