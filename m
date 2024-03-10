Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F87BC54791
	for <buildroot@archiver.kernel.org>; Sun, 10 Mar 2024 18:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A206440106;
	Sun, 10 Mar 2024 18:24:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X4zZo-Iq_gVx; Sun, 10 Mar 2024 18:24:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A60BA403E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A60BA403E9;
	Sun, 10 Mar 2024 18:24:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5BEB51BF405
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 18:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4892B8198A
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 18:24:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ge4ITIXoSEWN for <buildroot@lists.busybox.net>;
 Sun, 10 Mar 2024 18:24:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD13681585
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD13681585
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD13681585
 for <buildroot@buildroot.org>; Sun, 10 Mar 2024 18:24:46 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33e95b68b3eso348168f8f.1
 for <buildroot@buildroot.org>; Sun, 10 Mar 2024 11:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710095084; x=1710699884;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cgcTF+FADxMz+gwMb2cR/pyF3q1puQLirpKCMpv9uLU=;
 b=LYs773EvBTo1BzdFHw8j5c9v+5s7/+VYGyZ98SZhUsPXOi5fyh8MTbAMNELN3xsebl
 uVxnYZJy34GtOxhXC1GXxbrULYvhY6t+2kPi8lsDWpAf3j6E4d2b3wLC24nieHjpBs9e
 bScvVPQhHt24GtG3vfy/jEyCHZMANhgm9I6m/k3g2ml+XNI2BOa7zCZCeBVH2nbWv22/
 Vhlz/dDQLPkrZjo9y9xwiJKjHbcVcn0/cnAh+qZtSq8+dSC4zwleHZsOtTMrpG3BeKt/
 S2DpSZcX8g5bFZ4jU2TH80BV5QdVTrg8hjCkIsoHYwZvMU37s2E2DYpdmCZqZu9YQHI1
 /23Q==
X-Gm-Message-State: AOJu0YxXzRU5EjLIocxlwkQY+D0BWqaVuPD6o6ruIeBSTDLKxRBbWltG
 GdilhrcicJf2l+9aA1uYUDscDxMf01hqZt8SP2ucxa3mNxSJPqMydjqONdQm
X-Google-Smtp-Source: AGHT+IFmu4kk9m+bSuyPKQWIAcqrsPzydNOewefWIw69oSPsNxFQKD8zQ5r2xhqjFzkrlRFmee7BJQ==
X-Received: by 2002:a5d:6882:0:b0:33d:2d2c:f404 with SMTP id
 h2-20020a5d6882000000b0033d2d2cf404mr3155626wru.15.1710095083698; 
 Sun, 10 Mar 2024 11:24:43 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u12-20020a5d6acc000000b0033e7a499deasm2237537wrw.109.2024.03.10.11.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Mar 2024 11:24:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Mar 2024 19:24:39 +0100
Message-ID: <20240310182439.441668-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710095084; x=1710699884; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cgcTF+FADxMz+gwMb2cR/pyF3q1puQLirpKCMpv9uLU=;
 b=apS94xWgwA5oXL3/24Zlxp07bJFiZmgms5xhfpxwR96tnMXJl9goLdNiShHKdebV9A
 jeDZuIt5tdSevfvHRDlAW9zEEsGD8H4aYkjPeD4VUcLukCJeXbSif9xaAb8Fu3Vgbblw
 G4+WSiCMv/xGSlqUAd0k2XQNcCVByt+L8XWRMvvx1ad4M1yVia90H7MsA0K2BV7FhCWs
 g5nygpoeAS57FNA0EzfLnF2ptuX0izzIoiXqGf3hyfEgNi2y73T1QtHghQnP9QftsBuR
 n4r2ZILHDcCWu8II878lL5+cxND/3BrEPER9YgZbbjL0xoGY1HQxTT7eCfSRYdPMPybg
 bfgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=apS94xWg
Subject: [Buildroot] [PATCH 1/1] package/openblas: fix build without MMU
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without MMU:

/home/buildroot/autobuild/instance-1/output-1/host/riscv64-buildroot-linux-uclibc/bin/ld.real: test_fork.o: in function `.L6':
test_fork.c:(.text+0x120): undefined reference to `fork'

autobuilder failure is raised since the addition of RISC-V support by
commit c789bcddf0fb17580bef0cdc45b5334a90ecdf13

Fixes:
 - http://autobuild.buildroot.org/results/b9d097ae077f2cb40fc60de94bf25423636af005

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ding-against-an-uClibc-that-does-not.patch | 28 +++++++++++++++++++
 ...-uclibc-that-does-not-implement-fork.patch | 28 +++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 package/openblas/0002-Skip-the-fork-test-when-building-against-an-uClibc-that-does-not.patch
 create mode 100644 package/openblas/0003-Skip-test-when-building-with-a-uclibc-that-does-not-implement-fork.patch

diff --git a/package/openblas/0002-Skip-the-fork-test-when-building-against-an-uClibc-that-does-not.patch b/package/openblas/0002-Skip-the-fork-test-when-building-against-an-uClibc-that-does-not.patch
new file mode 100644
index 0000000000..9b52dbfe05
--- /dev/null
+++ b/package/openblas/0002-Skip-the-fork-test-when-building-against-an-uClibc-that-does-not.patch
@@ -0,0 +1,28 @@
+From 30e8d255de4cfdfa2fdd7272e12d1efd6e74bc7b Mon Sep 17 00:00:00 2001
+From: Martin Kroeker <martin@ruby.chemie.uni-freiburg.de>
+Date: Sun, 10 Mar 2024 00:05:01 +0100
+Subject: [PATCH] Skip the fork test when building against an uClibc that does
+ not implement fork
+
+Signed-off-bt: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/OpenMathLib/OpenBLAS/commit/91b1fb7f9b9f053919e79e9b898060b90f5b0af3
+---
+ utest/test_fork.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/utest/test_fork.c b/utest/test_fork.c
+index bd531e7fb8..558026031b 100644
+--- a/utest/test_fork.c
++++ b/utest/test_fork.c
+@@ -64,6 +64,11 @@ static void check_dgemm(double *a, double *b, double *result, double *expected,
+ 
+ CTEST(fork, safety)
+ {
++#ifdef __UCLIBC__
++#if !defined __UCLIBC_HAS_STUBS__ && !defined __ARCH_USE_MMU__
++exit(0);
++#endif
++#endif
+ #ifndef BUILD_DOUBLE
+ exit(0);
+ #else
diff --git a/package/openblas/0003-Skip-test-when-building-with-a-uclibc-that-does-not-implement-fork.patch b/package/openblas/0003-Skip-test-when-building-with-a-uclibc-that-does-not-implement-fork.patch
new file mode 100644
index 0000000000..2e46266331
--- /dev/null
+++ b/package/openblas/0003-Skip-test-when-building-with-a-uclibc-that-does-not-implement-fork.patch
@@ -0,0 +1,28 @@
+From 8a665f0d57a355932e9571449f4cf30caed56ae1 Mon Sep 17 00:00:00 2001
+From: Martin Kroeker <martin@ruby.chemie.uni-freiburg.de>
+Date: Sun, 10 Mar 2024 19:08:03 +0100
+Subject: [PATCH] Skip test when building with a uclibc that does not implement
+ fork
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/OpenMathLib/OpenBLAS/pull/4546
+---
+ utest/test_post_fork.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/utest/test_post_fork.c b/utest/test_post_fork.c
+index 9370a02cee..6d640aebb6 100644
+--- a/utest/test_post_fork.c
++++ b/utest/test_post_fork.c
+@@ -67,6 +67,11 @@ static void check_dgemm(double *a, double *b, double *result, double *expected,
+ 
+ CTEST(fork, safety_after_fork_in_parent)
+ {
++#ifdef __UCLIBC__
++#if !defined __UCLIBC_HAS_STUBS__ && !defined __ARCH_USE_MMU__
++exit(0);
++#endif
++#endif
+ #ifndef BUILD_DOUBLE
+ exit(0);
+ #else
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
