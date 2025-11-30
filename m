Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5466BD111A8
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 10:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06BCB8076B;
	Sun, 30 Nov 2025 10:44:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3T-XsDtjW1oJ; Sun, 30 Nov 2025 10:44:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D01F8072A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D01F8072A;
	Sun, 30 Nov 2025 10:44:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AF2B1A9
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 10:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C7F280709
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 10:44:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qgpWGWYlDLpM for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 10:44:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 98B9F806F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98B9F806F7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 98B9F806F7
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 10:44:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b593.dip0.t-ipconnect.de [84.161.181.147])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6BF46A4C775D;
 Sun, 30 Nov 2025 11:44:24 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43382)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vPeum-000000008LQ-019O;
 Sun, 30 Nov 2025 10:44:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Sun, 30 Nov 2025 11:44:23 +0100
Message-ID: <20251130104423.822691-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1764499464;
 bh=Dhp/wZEipKkJ6Z3wXsLE2Vi9zqlNjEsjxavrd6lV5jE=;
 h=From:To:Cc:Subject:Date:From;
 b=HKR3uq1jx/ARGpI7Qoa+1PhtyJ8o3DxY6wsXLSR/NSeJvoaiakcXOWaTQavHU3d+N
 zR04D9+2Rqd7c8utS77JcCdRwobidncgyDLpJAL9oKkHqS0NI7ui0Wng3SmN7rfFUx
 AMMc0uEJE/65Bi87qT6NawsxNRlMKAiES+cFyYbH78Y8DmzyMI25GCFc21TQIwHbSn
 CSJYLz/41a8cXU07BjsigVJSbswUmSiLIt7AJ6EsY3MR1Sde2u/nOLgTTVDazYH99W
 ILxHw4J3hh1hd/3TUid7u54WpfoLaY7rXvaK25y3mBZuynDtQgtGk8f60+rxEaqjgg
 XZe0Wvej0gxQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=HKR3uq1j
Subject: [Buildroot] [PATCH 1/1] package/stress-ng: fix non-NPTL build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 2ce329692ab60da7fe7ccd52bf64a8c4802fb317 bumped
stress-ng to version 0.19.06 which includes commit
https://github.com/ColinIanKing/stress-ng/commit/15b26e33daaf36acd5eeceaaf6fc954f46792a8b

This commit breaks the build with non-NPTL toolchains.

Fixes:
https://autobuild.buildroot.net/results/d4f/d4fadef213455b1776d93e30e51ffe09fb1879c5/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...01-stress-pthread-fix-non-NPTL-build.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/stress-ng/0001-stress-pthread-fix-non-NPTL-build.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
