Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6DBD116F3
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 17:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD6A382267;
	Sun, 30 Nov 2025 17:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fIkU_Q7RyHZ8; Sun, 30 Nov 2025 17:08:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25F8382274
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25F8382274;
	Sun, 30 Nov 2025 17:08:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C1774351
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 17:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3E6B40A9E
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 17:08:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b7wT1Zt8kvue for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 17:08:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4403640A8F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4403640A8F
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 17:08:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33EDF82653; Sun, 30 Nov 2025 17:08:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 30 Nov 2025 18:07:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92da94bf213cd8d0b0586770ec2db471976138cb
X-Git-Newrev: 363cfcb1a330bbbd0a68418c4e8db29c310d9277
X-Patchwork-Hint: ignore
Message-Id: <20251130170815.33EDF82653@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stress-ng: fix non-NPTL build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=363cfcb1a330bbbd0a68418c4e8db29c310d9277
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit 2ce329692ab60da7fe7ccd52bf64a8c4802fb317 bumped
stress-ng to version 0.19.06 which includes commit
https://github.com/ColinIanKing/stress-ng/commit/15b26e33daaf36acd5eeceaaf6fc954f46792a8b

This commit breaks the build with non-NPTL toolchains.

Fixes:
https://autobuild.buildroot.net/results/d4f/d4fadef213455b1776d93e30e51ffe09fb1879c5/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-stress-pthread-fix-non-NPTL-build.patch   | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/stress-ng/0001-stress-pthread-fix-non-NPTL-build.patch b/package/stress-ng/0001-stress-pthread-fix-non-NPTL-build.patch
new file mode 100644
index 0000000000..518296fdc4
--- /dev/null
+++ b/package/stress-ng/0001-stress-pthread-fix-non-NPTL-build.patch
@@ -0,0 +1,42 @@
+From 73d1f5ed2167fca8a1cbfb85f4da123f00e524a1 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 30 Nov 2025 11:36:10 +0100
+Subject: [PATCH] stress-pthread: fix non-NPTL build
+
+https://github.com/ColinIanKing/stress-ng/commit/15b26e33daaf36acd5eeceaaf6fc954f46792a8b
+added the usage of attr without using HAVE_PTHREAD_ATTR_SETSTACK for
+toolchains without NPTL support.
+
+This patch fixes build errors detected by buildroot autobuilders:
+https://autobuild.buildroot.net/results/d4f/d4fadef213455b1776d93e30e51ffe09fb1879c5/build-end.log
+
+stress-pthread.c: In function 'stress_pthread':
+stress-pthread.c:567:81: error: 'attr' undeclared (first use in this function)
+  567 |                         pthreads[i].ret = pthread_create(&pthreads[i].pthread, &attr,
+
+Upstream: https://github.com/ColinIanKing/stress-ng/pull/593
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ stress-pthread.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/stress-pthread.c b/stress-pthread.c
+index aafcf0f0a..8605b7a1d 100644
+--- a/stress-pthread.c
++++ b/stress-pthread.c
+@@ -564,7 +564,11 @@ static int stress_pthread(stress_args_t *args)
+ 
+ 			pthreads[i].t_create = stress_time_now();
+ 			pthreads[i].t_run = pthreads[i].t_create;
++#if defined(HAVE_PTHREAD_ATTR_SETSTACK)
+ 			pthreads[i].ret = pthread_create(&pthreads[i].pthread, &attr,
++#else
++			pthreads[i].ret = pthread_create(&pthreads[i].pthread, NULL,
++#endif
+ 				stress_pthread_func, (void *)&pargs);
+ 			if (UNLIKELY(pthreads[i].ret)) {
+ 				/* Out of resources, don't try any more */
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
