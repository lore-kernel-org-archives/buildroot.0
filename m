Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F22CA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 18:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 033258466D;
	Fri, 29 Aug 2025 18:32:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nqkvXAlXZrjS; Fri, 29 Aug 2025 18:32:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BB35842E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BB35842E7;
	Fri, 29 Aug 2025 18:32:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BFB7D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 18:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CA03842E7
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 18:32:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4DAkqYKZ-GiW for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 18:32:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D9FB842D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D9FB842D7
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 18:32:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9876787E40; Fri, 29 Aug 2025 18:32:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 20:31:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31342fb5ff9adf1afd016ae56a07b830b5b24088
X-Git-Newrev: 7ed636069fbdc9942bcd637f6f902c13415a9910
X-Patchwork-Hint: ignore
Message-Id: <20250829183246.9876787E40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgsm: fix build failure with GCC
 15.x
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3680009426961998598=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3680009426961998598==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7ed636069fbdc9942bcd637f6f902c13415a9910
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/95f0ff842e4fddcf9d2ffaeb7ddbb9abeb821319/

There is no proper upstream project with a Git repo or mailing list,
so we just sent the patch by e-mail to the project maintainer.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../libgsm/0002-Fix-signal-handler-prototype.patch | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/package/libgsm/0002-Fix-signal-handler-prototype.patch b/package/libgsm/0002-Fix-signal-handler-prototype.patch
new file mode 100644
index 0000000000..c28cf584a1
--- /dev/null
+++ b/package/libgsm/0002-Fix-signal-handler-prototype.patch
@@ -0,0 +1,61 @@
+From 7ffab0a5028f0bfcb864c2387f41b8d4eb33fb8e Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Fri, 29 Aug 2025 17:27:55 +0200
+Subject: [PATCH] Fix signal handler prototype
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Recent versions of gcc, starting from gcc 15.x, are more picky about
+function prototypes, and that cause the following issue:
+
+usr/include/signal.h:93:23: note: expected ‘__sighandler_t’ {aka ‘void (*)(int)’} but argument is of type ‘void (*)(void)’
+
+ultimately causing a build failure.
+
+This patch fixes that by ensuring the signal handler has the right
+prototype. The onintr() function is not only used as a signal handler,
+but also on memory allocation failure, in which case a dummy value of
+0 is passed as argument, since anyway this value isn't used by
+onintr().
+
+Upstream: sent by e-mail to Jutta Degener <jutta@pobox.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/toast.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/toast.c b/src/toast.c
+index 05cd0b3..70a14ba 100644
+--- a/src/toast.c
++++ b/src/toast.c
+@@ -211,7 +211,7 @@ static char * suffix P2((name, suf), char *name, char * suf)
+ }
+ 
+ 
+-static void catch_signals P1((fun), SIGHANDLER_T (*fun) ())
++static void catch_signals P1((fun), SIGHANDLER_T (*fun) (int))
+ {
+ #ifdef	SIGHUP
+ 	signal( SIGHUP,   fun );
+@@ -230,7 +230,7 @@ static void catch_signals P1((fun), SIGHANDLER_T (*fun) ())
+ #endif
+ }
+ 
+-static SIGHANDLER_T onintr P0()
++static SIGHANDLER_T onintr P1((signo), int signo)
+ {
+ 	char * tmp = outname;
+ 
+@@ -253,7 +253,7 @@ static char * emalloc P1((len), size_t len)
+ 	if (!(s = malloc(len))) {
+ 		fprintf(stderr, "%s: failed to malloc %d bytes -- abort\n",
+ 			progname, (int)len);
+-		onintr();
++		onintr(0);
+ 		exit(1);
+ 	}
+ 	return s;
+-- 
+2.50.1
+

--===============3680009426961998598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3680009426961998598==--
