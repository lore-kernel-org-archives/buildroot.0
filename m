Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59340C52D7B
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 09:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44DD6405F4;
	Wed,  7 Aug 2024 09:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 84z7vVSYZs_p; Wed,  7 Aug 2024 09:24:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0667D4061F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0667D4061F;
	Wed,  7 Aug 2024 09:24:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBBF11BF2CE
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 09:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E42D680DDC
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 09:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qq1tkXgTNunj for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 09:24:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA59680BEA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA59680BEA
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 09:24:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0B8A82275; Wed,  7 Aug 2024 09:24:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Aug 2024 10:58:48 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 95583af63202a5fa254a10d4a47edfeb41d6a2e0
X-Git-Newrev: 87b042ff3ba0d49ccdaed6bbaf70423e3cb5cb39
X-Patchwork-Hint: ignore
Message-Id: <20240807092425.E0B8A82275@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/check: fix build
 on noMMU configurations
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

commit: https://git.buildroot.net/buildroot/commit/?id=87b042ff3ba0d49ccdaed6bbaf70423e3cb5cb39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

check was failing to build on noMMU configurations due to mistake in
the build conditionals of the code around the HAVE_FORK macro. This
commit brings a patch, submitted upstream, that fixes those issues.

Fixes:

  http://autobuild.buildroot.net/results/1509108aa111da706d544eb67e1ae2c2b34bd4e4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d10bee42012103fe7974c5e20be3af81e3c1c250)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-check_run.c-fix-build-on-noMMU-platforms.patch | 82 ++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/package/check/0002-src-check_run.c-fix-build-on-noMMU-platforms.patch b/package/check/0002-src-check_run.c-fix-build-on-noMMU-platforms.patch
new file mode 100644
index 0000000000..173fa4ae5a
--- /dev/null
+++ b/package/check/0002-src-check_run.c-fix-build-on-noMMU-platforms.patch
@@ -0,0 +1,82 @@
+From c9bebf051aa7e3037ca8e0fe554e073204ffedde Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Fri, 12 Jul 2024 21:27:47 +0200
+Subject: [PATCH] src/check_run.c: fix build on noMMU platforms
+
+src/check_run.c defines sig_handler() under the following conditions:
+
+  #if defined(HAVE_FORK) && HAVE_FORK==1
+
+however, it does use sig_handler under the following conditions:
+
+  #if defined(HAVE_SIGACTION) && defined(HAVE_FORK)
+
+which breaks when HAVE_FORK is defined, but has the value HAVE_FORK=0,
+as is the case on noMMU platforms.
+
+This commit fixes this by ensuring that the build conditions are
+aligned throughout check_run.c.
+
+Fixes:
+
+src/check_run.c: In function 'srunner_run_tagged':
+src/check_run.c:802:38: error: 'sig_handler' undeclared (first use in this function); did you mean 'sa_handler'?
+[...]
+
+Upstream: https://github.com/libcheck/check/pull/354
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/check_run.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/check_run.c b/src/check_run.c
+index 5f160e5..4c370b3 100644
+--- a/src/check_run.c
++++ b/src/check_run.c
+@@ -772,12 +772,12 @@ void srunner_run_tagged(SRunner * sr, const char *sname, const char *tcname,
+                         const char *include_tags, const char *exclude_tags,
+                         enum print_output print_mode)
+ {
+-#if defined(HAVE_SIGACTION) && defined(HAVE_FORK)
++#if defined(HAVE_SIGACTION) && defined(HAVE_FORK) && HAVE_FORK==1
+     static struct sigaction sigalarm_old_action;
+     static struct sigaction sigalarm_new_action;
+     static struct sigaction sigint_new_action;
+     static struct sigaction sigterm_new_action;
+-#endif /* HAVE_SIGACTION && HAVE_FORK */
++#endif /* HAVE_SIGACTION && HAVE_FORK && HAVE_FORK==1 */
+ 
+     /*  Get the selected test suite and test case from the
+        environment.  */
+@@ -797,7 +797,7 @@ void srunner_run_tagged(SRunner * sr, const char *sname, const char *tcname,
+         eprintf("Bad print_mode argument to srunner_run_all: %d",
+                 __FILE__, __LINE__, print_mode);
+     }
+-#if defined(HAVE_SIGACTION) && defined(HAVE_FORK)
++#if defined(HAVE_SIGACTION) && defined(HAVE_FORK) && HAVE_FORK==1
+     memset(&sigalarm_new_action, 0, sizeof(sigalarm_new_action));
+     sigalarm_new_action.sa_handler = sig_handler;
+     sigaction(SIGALRM, &sigalarm_new_action, &sigalarm_old_action);
+@@ -809,16 +809,16 @@ void srunner_run_tagged(SRunner * sr, const char *sname, const char *tcname,
+     memset(&sigterm_new_action, 0, sizeof(sigterm_new_action));
+     sigterm_new_action.sa_handler = sig_handler;
+     sigaction(SIGTERM, &sigterm_new_action, &sigterm_old_action);
+-#endif /* HAVE_SIGACTION && HAVE_FORK */
++#endif /* HAVE_SIGACTION && HAVE_FORK && HAVE_FORK==1 */
+     srunner_run_init(sr, print_mode);
+     srunner_iterate_suites(sr, sname, tcname, include_tags, exclude_tags,
+                            print_mode);
+     srunner_run_end(sr, print_mode);
+-#if defined(HAVE_SIGACTION) && defined(HAVE_FORK)
++#if defined(HAVE_SIGACTION) && defined(HAVE_FORK) && HAVE_FORK==1
+     sigaction(SIGALRM, &sigalarm_old_action, NULL);
+     sigaction(SIGINT, &sigint_old_action, NULL);
+     sigaction(SIGTERM, &sigterm_old_action, NULL);
+-#endif /* HAVE_SIGACTION && HAVE_FORK */
++#endif /* HAVE_SIGACTION && HAVE_FORK && HAVE_FORK==1 */
+ }
+ 
+ void srunner_run(SRunner * sr, const char *sname, const char *tcname,
+-- 
+2.45.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
