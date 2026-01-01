Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15530EEB57C
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 16:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF2734039E;
	Thu,  1 Jan 2026 16:36:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TBiPVIuKVsR7; Thu,  1 Jan 2026 16:36:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E855C40270
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767285371;
	bh=+jXiBCcXNnCMcHJjbkEqBQvhnsMTqwGxOxrBF/0DZPI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=dvwrrrTwQQ1SyE255rZXK7NZwuqg+WVmrIqFTtcwtklVKnFU1gOXQ1NcLHCvwHQcn
	 FakvKiNEJI0/uvQNMv1D8OJSVv4wIukhjC1zTckPAHyNq7fK7YmLxqQS5ZXHAZPai9
	 NX6Vl4w94ksKUyaJfAjVkxDDggfj6VtWP0/UD9uf1Oi8nUit+e/e2rh3m9p7j+3P6X
	 OKXVJEilIWSN8iR02lcF89bGg2R3lclRElMQr7fRmZCEvHs0T1mTR54VwA7FiCALb8
	 dHeJqPRQ+7+ewDJrQ/iKkKqZ5ji1AHaa8xOZbn23M2vleUTnHdPEIxEfhRRBkfyXkF
	 DUz+lQos6u4Xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E855C40270;
	Thu,  1 Jan 2026 16:36:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DF254351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1D6F80CEB
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:36:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_w5GBdJ0wQ1 for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 16:36:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=pkerbrat@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C00A880CDF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C00A880CDF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C00A880CDF
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:36:07 +0000 (UTC)
Received: from sejong (unknown [82.64.130.240])
 (Authenticated sender: pkerbrat@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id EFD6FB00548;
 Thu,  1 Jan 2026 17:36:03 +0100 (CET)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Pierre-Yves Kerbrat <pkerbrat@free.fr>
Date: Thu,  1 Jan 2026 17:35:45 +0100
Message-ID: <20260101163545.1848514-1-pkerbrat@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767285366;
 bh=UnDBNc3jhQcELRnLIT8rzyD2lw664ZG50SIUYgrheq4=;
 h=From:To:Cc:Subject:Date:From;
 b=rbDE4NSeYHUV22s2mZgKYRbi+JPJXtgbfSPisp7FfESjhDgQqD6/XrM8fDvTEuPtA
 wXe21t+XIHlavi9cMLYImF/GdnFZ+IB6ZFgTRwJMXOj43GjzDaT5aPi29Sr0UDKa6k
 ErmYMQiUJf3LKFyQ+AKfhk/ry4xsjlFfBMteE6TuabY7SPXL1SPlBtWen5/27fRDZp
 BgbOaW3EGguDYUYCXpd5whtzJ0CZfNmmclA7GpCH3NraxphvU2CjJYJwjQKgbNGBKm
 CL355v0KzhSDJUdJT3L/Q+OwnbaaX6sBQnvpUPnlR9nvLnSYd0UkbeSbJHjc3dyd+d
 zKM8m5AIHE8OQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=rbDE4NSe
Subject: [Buildroot] [PATCH] package/stress-ng: bump to 0.20.00
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
From: Pierre-Yves Kerbrat via buildroot <buildroot@buildroot.org>
Reply-To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed unnecessary patch after merge of
https://github.com/ColinIanKing/stress-ng/commit/05353c7a9d0439e250f82ef9fc5643149811bb24

Changelog:
https://github.com/ColinIanKing/stress-ng/releases/tag/V0.20.00

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
---
 ...01-stress-pthread-fix-non-NPTL-build.patch | 42 -------------------
 package/stress-ng/stress-ng.hash              |  2 +-
 package/stress-ng/stress-ng.mk                |  2 +-
 3 files changed, 2 insertions(+), 44 deletions(-)
 delete mode 100644 package/stress-ng/0001-stress-pthread-fix-non-NPTL-build.patch

diff --git a/package/stress-ng/0001-stress-pthread-fix-non-NPTL-build.patch b/package/stress-ng/0001-stress-pthread-fix-non-NPTL-build.patch
deleted file mode 100644
index 518296fdc4f6..000000000000
--- a/package/stress-ng/0001-stress-pthread-fix-non-NPTL-build.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 73d1f5ed2167fca8a1cbfb85f4da123f00e524a1 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Sun, 30 Nov 2025 11:36:10 +0100
-Subject: [PATCH] stress-pthread: fix non-NPTL build
-
-https://github.com/ColinIanKing/stress-ng/commit/15b26e33daaf36acd5eeceaaf6fc954f46792a8b
-added the usage of attr without using HAVE_PTHREAD_ATTR_SETSTACK for
-toolchains without NPTL support.
-
-This patch fixes build errors detected by buildroot autobuilders:
-https://autobuild.buildroot.net/results/d4f/d4fadef213455b1776d93e30e51ffe09fb1879c5/build-end.log
-
-stress-pthread.c: In function 'stress_pthread':
-stress-pthread.c:567:81: error: 'attr' undeclared (first use in this function)
-  567 |                         pthreads[i].ret = pthread_create(&pthreads[i].pthread, &attr,
-
-Upstream: https://github.com/ColinIanKing/stress-ng/pull/593
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- stress-pthread.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/stress-pthread.c b/stress-pthread.c
-index aafcf0f0a..8605b7a1d 100644
---- a/stress-pthread.c
-+++ b/stress-pthread.c
-@@ -564,7 +564,11 @@ static int stress_pthread(stress_args_t *args)
- 
- 			pthreads[i].t_create = stress_time_now();
- 			pthreads[i].t_run = pthreads[i].t_create;
-+#if defined(HAVE_PTHREAD_ATTR_SETSTACK)
- 			pthreads[i].ret = pthread_create(&pthreads[i].pthread, &attr,
-+#else
-+			pthreads[i].ret = pthread_create(&pthreads[i].pthread, NULL,
-+#endif
- 				stress_pthread_func, (void *)&pargs);
- 			if (UNLIKELY(pthreads[i].ret)) {
- 				/* Out of resources, don't try any more */
--- 
-2.47.3
-
diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
index dbe5f60a2508..f91aa760546b 100644
--- a/package/stress-ng/stress-ng.hash
+++ b/package/stress-ng/stress-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  054953145d7de36725a54636ea68975bb9ada06b4769878d25e556fab5804513  stress-ng-0.19.06.tar.gz
+sha256  fe9e5161ac186c6ada22963251ff701fe3275fac2c5b87bdb59c4cab08aaeaae  stress-ng-0.20.00.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 7240e3e3214a..32ac21b54065 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRESS_NG_VERSION = 0.19.06
+STRESS_NG_VERSION = 0.20.00
 STRESS_NG_SITE = $(call github,ColinIanKing,stress-ng,V$(STRESS_NG_VERSION))
 STRESS_NG_LICENSE = GPL-2.0+
 STRESS_NG_LICENSE_FILES = COPYING
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
