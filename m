Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1C1CF9C71
	for <buildroot@archiver.kernel.org>; Mon, 23 Sep 2024 19:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6DF7401D5;
	Mon, 23 Sep 2024 19:12:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3_bZNHRC3qfg; Mon, 23 Sep 2024 19:12:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 555CF401E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 555CF401E4;
	Mon, 23 Sep 2024 19:12:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D6DD1BF3C3
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 19:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C324405D9
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 19:12:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WIVHRoW3RrKs for <buildroot@lists.busybox.net>;
 Mon, 23 Sep 2024 19:12:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53BEE40129
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53BEE40129
 for <buildroot@buildroot.org>; Mon, 23 Sep 2024 19:12:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 49E7981439; Mon, 23 Sep 2024 19:12:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 23 Sep 2024 21:11:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ddcddc47882fac09b895e1414bf97f8b7baea46e
X-Git-Newrev: d28d24dbc543cf8365a11582bdf1b8aa0e39bc89
X-Patchwork-Hint: ignore
Message-Id: <20240923191216.49E7981439@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/busybox: patch to fix tc build on
 6.8+ kernels
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

commit: https://git.buildroot.net/buildroot/commit/?id=d28d24dbc543cf8365a11582bdf1b8aa0e39bc89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a build error introduced by bumping the linux kernel headers to
6.8 with buildroot commit 807a44925697b9567d5bd9872a334a073b3dcf55.

No autobuilder failures were recorded with this problem.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...rc1-removed-the-definitions-related-to-CB.patch | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/package/busybox/0010-Linux-v6.8-rc1-removed-the-definitions-related-to-CB.patch b/package/busybox/0010-Linux-v6.8-rc1-removed-the-definitions-related-to-CB.patch
new file mode 100644
index 0000000000..d997f00e82
--- /dev/null
+++ b/package/busybox/0010-Linux-v6.8-rc1-removed-the-definitions-related-to-CB.patch
@@ -0,0 +1,70 @@
+From c4f93565acf3718111cdbaea15e1a8aacf2f44cf Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
+Date: Mon, 23 Sep 2024 18:56:00 +0200
+Subject: [PATCH] tc: Fix compilation with Linux v6.8-rc1
+
+Linux v6.8-rc1 removed the definitions related to CBQ:
+https://github.com/torvalds/linux/commit/33241dca486264193ed68167c8eeae1fb197f3df
+making tc fail to build.
+Add some #ifdefs to handle this missing support.
+
+Upstream: http://lists.busybox.net/pipermail/busybox/2024-March/090678.html
+Bug report: https://bugs.busybox.net/show_bug.cgi?id=15931
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ networking/tc.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/networking/tc.c b/networking/tc.c
+index 3a79fd2d9..d08fd1359 100644
+--- a/networking/tc.c
++++ b/networking/tc.c
+@@ -231,6 +231,13 @@ static int cbq_parse_opt(int argc, char **argv, struct nlmsghdr *n)
+ 	return 0;
+ }
+ #endif
++
++#ifndef TCA_CBQ_MAX
++/*
++ * Linux v6.8-rc1~131^2~60^2^2 removed the uapi definitions for CBQ.
++ * See https://git.kernel.org/linus/33241dca48626
++ */
++#else
+ static int cbq_print_opt(struct rtattr *opt)
+ {
+ 	struct rtattr *tb[TCA_CBQ_MAX+1];
+@@ -322,6 +329,7 @@ static int cbq_print_opt(struct rtattr *opt)
+  done:
+ 	return 0;
+ }
++#endif
+ 
+ static FAST_FUNC int print_qdisc(
+ 		const struct sockaddr_nl *who UNUSED_PARAM,
+@@ -372,8 +380,10 @@ static FAST_FUNC int print_qdisc(
+ 		int qqq = index_in_strings(_q_, name);
+ 		if (qqq == 0) { /* pfifo_fast aka prio */
+ 			prio_print_opt(tb[TCA_OPTIONS]);
++#ifdef TCA_CBQ_MAX
+ 		} else if (qqq == 1) { /* class based queuing */
+ 			cbq_print_opt(tb[TCA_OPTIONS]);
++#endif
+ 		} else {
+ 			/* don't know how to print options for this qdisc */
+ 			printf("(options for %s)", name);
+@@ -442,9 +452,11 @@ static FAST_FUNC int print_class(
+ 		int qqq = index_in_strings(_q_, name);
+ 		if (qqq == 0) { /* pfifo_fast aka prio */
+ 			/* nothing. */ /*prio_print_opt(tb[TCA_OPTIONS]);*/
++#ifdef TCA_CBQ_MAX
+ 		} else if (qqq == 1) { /* class based queuing */
+ 			/* cbq_print_copt() is identical to cbq_print_opt(). */
+ 			cbq_print_opt(tb[TCA_OPTIONS]);
++#endif
+ 		} else {
+ 			/* don't know how to print options for this class */
+ 			printf("(options for %s)", name);
+-- 
+2.39.5
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
