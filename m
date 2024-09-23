Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA158CF9C6F
	for <buildroot@archiver.kernel.org>; Mon, 23 Sep 2024 17:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54C99408C0;
	Mon, 23 Sep 2024 17:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yjruk4IDKRiX; Mon, 23 Sep 2024 17:06:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDF98408A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDF98408A7;
	Mon, 23 Sep 2024 17:06:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4478E1BF3CA
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 17:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32D97405D8
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 17:06:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8imkbu5REOdO for <buildroot@lists.busybox.net>;
 Mon, 23 Sep 2024 17:06:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 27ED3401CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27ED3401CC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27ED3401CC
 for <buildroot@buildroot.org>; Mon, 23 Sep 2024 17:06:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0835.dip0.t-ipconnect.de [91.58.8.53])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BDB81A4C2C5C;
 Mon, 23 Sep 2024 19:06:37 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46336)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1ssmWC-000000004Vt-3ecc;
 Mon, 23 Sep 2024 17:06:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 23 Sep 2024 19:06:36 +0200
Message-Id: <20240923170636.3757575-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1727111197;
 bh=+vTg/YJis8NsqdUH0z8KtN6+w7lUlEJXTzmeCR8Gl8A=;
 h=From:To:Cc:Subject:Date:From;
 b=MvhChHyvMkj7i2w5QaKvTUnsC4eQsqtUqIq14A5wo6SH7uGOmI8VlRZ4yEh+0XCG0
 cgvxguZM3pGlMBERFO7tRqvoTnTf+Rvau2H98+0xuvPmmq2Up4V1YyC1aIjgtHKko7
 9mJvIKEzAzcAU3E2530l2mY9ckoA8K5VtYnhVS7v/yiMf9MLeVf7QQ/WGKNqFmDmiv
 wSE64ljVHjRGFeErTb8uiKlzwtZDSbKZJbC9QWj2tRg1rPu52/UK+0+ACqbvxAXQo3
 XeGB117L4oBwF7a2aVgjmoALHdWwDOZWgr3ly6ijW7vtzacDCBfyBgYSmKNTEtZlJZ
 LvgL/GXvdfY2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=MvhChHyv
Subject: [Buildroot] [PATCH 1/1] package/busybox: patch to fix tc build on
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
Cc: Un1q32 <joey.t.reinhart@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes a build error introduced by bumping the linux kernel headers to
6.8 with buildroot commit 807a44925697b9567d5bd9872a334a073b3dcf55.

No autobuilder failures were recorded with this problem.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Follow-up of
https://patchwork.ozlabs.org/project/buildroot/patch/20240823090939.79455-1-joey.t.reinhart@gmail.com/

 ...emoved-the-definitions-related-to-CB.patch | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 package/busybox/0010-Linux-v6.8-rc1-removed-the-definitions-related-to-CB.patch

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
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
