Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A39FC72AF
	for <buildroot@archiver.kernel.org>; Sun, 22 Mar 2026 09:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C54183673;
	Sun, 22 Mar 2026 09:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HmsbqPirsb0s; Sun, 22 Mar 2026 09:07:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DDFA83529
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774170436;
	bh=RJBfbAvvz3MULj/9hn86EgrVYcZAIrryn+WCNOUk+o4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GinxVvSjfXJfCqn5tJUb7R6lyJvY2xonaep2b1aT1HIAZzKWFsExfC/E8XEeV1y+k
	 BRY4Pu4pgNrgti7ZRfl5+VaO1vnH9vgp8uVoeniDxToj4BRKD2Hed654MaGY3xYMQv
	 IJbJhll+GgLRsPpCZEY3QomJrqbG0o82wgg2R4hIj88FAlB8gx0OoA88KvJO/qPHTR
	 /t7QeJad4yENi4g5qv+P/YgyETHFzHsuaIUfKjavAMnvs69Y0lFHNHAQrLy/6m1FzQ
	 2SAxUzNwWnKSrlgf8Lq638VvlUCNQp9umOZLpT1Q5XXjzguCHgswQHpoWk0cIi2CuJ
	 ZiOhUPTiwMfLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DDFA83529;
	Sun, 22 Mar 2026 09:07:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CE9025C
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 09:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 295EE83546
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 09:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hm1i6VAZgBdc for <buildroot@buildroot.org>;
 Sun, 22 Mar 2026 09:07:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 630C483529
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 630C483529
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 630C483529
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 09:07:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ce09.dip0.t-ipconnect.de [79.214.206.9])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B9AF4A4C09C3;
 Sun, 22 Mar 2026 10:07:09 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47016)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w4Em4-000000007Cu-2Wty;
 Sun, 22 Mar 2026 09:07:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun, 22 Mar 2026 10:07:08 +0100
Message-ID: <20260322090709.1150583-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1774170429;
 bh=mumWL/4iQ+tR5wpaXunNK+h0KgcSHB1k0IfyWamm+DM=;
 h=From:To:Cc:Subject:Date:From;
 b=HqK+KJoWucMiISvRuwhhui0rD6Clm0Vtt/W0tawr9dXPmd5YRkrg1ZMyCfL+5Vi7C
 iGt+v8YTt1JTbYsnHKFjEQXhOw9WxRFvJU+JXuKqcmZl0TNpxfbj9YwExbWIsY89JV
 t0KGU78KehxvYA9cA0Ffqv7IKrrP4w98krKEv7gB2rX4YpKMTm6lu0KQRAdoyTbxvN
 oeCRfOnAfeJUt+u+OMA9qhVQt1hHUFamJan9h7MWDNarZLdLWGZkW/0Na1Vi1zEgWk
 QpkAK/QU6FCmhrik+O+DcOy1xagEmQF3dJzkb6IZHLN4utp07caEUtNzJxgsCUH58b
 zNmG7XwrhHbXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=HqK+KJoW
Subject: [Buildroot] [PATCH 1/1] package/openblas: fix build
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

Buildroot commit b08ac7636dc7b2753592989dc5fe73959e0f6507 bumped the
package to version 0.3.31 and introduced a build error

linktest.c:(.text.startup+0x6f4):
 undefined reference to `openblas_set_threads_callback_function'

which according to https://github.com/OpenMathLib/OpenBLAS/issues/5607
was introduced by upstream commit
https://github.com/OpenMathLib/OpenBLAS/commit/879497990f42e6dcfa370bcbf478cc5674158336
that was first included in version 0.3.31.

This patch adds another upstream commit to fix the problem.

Fixes:
https://autobuild.buildroot.net/results/7d8/7d80a912ddda01acd109786641df02ad826399f6/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...allback-replacement-hook-in-singleth.patch | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 package/openblas/0002-Include-thread-callback-replacement-hook-in-singleth.patch

diff --git a/package/openblas/0002-Include-thread-callback-replacement-hook-in-singleth.patch b/package/openblas/0002-Include-thread-callback-replacement-hook-in-singleth.patch
new file mode 100644
index 0000000000..7ea199fb2e
--- /dev/null
+++ b/package/openblas/0002-Include-thread-callback-replacement-hook-in-singleth.patch
@@ -0,0 +1,53 @@
+From 874243421298866d116e1e8bdbd7e0ed4e31e4f6 Mon Sep 17 00:00:00 2001
+From: Martin Kroeker <martin@ruby.chemie.uni-freiburg.de>
+Date: Sun, 18 Jan 2026 19:55:40 +0100
+Subject: [PATCH] Include thread callback replacement hook in singlethreaded
+ builds as well
+
+Upstream: https://github.com/OpenMathLib/OpenBLAS/commit/874243421298866d116e1e8bdbd7e0ed4e31e4f6
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ driver/others/CMakeLists.txt | 2 +-
+ driver/others/Makefile       | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/driver/others/CMakeLists.txt b/driver/others/CMakeLists.txt
+index a07a0baf99..72abdc4ee4 100644
+--- a/driver/others/CMakeLists.txt
++++ b/driver/others/CMakeLists.txt
+@@ -27,7 +27,6 @@ if (USE_THREAD)
+     ${BLAS_SERVER}
+     divtable.c # TODO: Makefile has -UDOUBLE
+     blas_l1_thread.c
+-    blas_server_callback.c
+   )
+ 
+   if (NOT NO_AFFINITY)
+@@ -42,6 +41,7 @@ set(COMMON_SOURCES
+   openblas_env.c
+   openblas_get_num_procs.c
+   openblas_get_num_threads.c
++  blas_server_callback.c
+ )
+ 
+ # these need to have NAME/CNAME set, so use GenerateNamedObjects, but don't use standard name mangling
+diff --git a/driver/others/Makefile b/driver/others/Makefile
+index 719d617c45..fbd016e6b0 100644
+--- a/driver/others/Makefile
++++ b/driver/others/Makefile
+@@ -1,12 +1,12 @@
+ TOPDIR	= ../..
+ include ../../Makefile.system
+ 
+-COMMONOBJS	 = memory.$(SUFFIX) xerbla.$(SUFFIX) c_abs.$(SUFFIX) z_abs.$(SUFFIX) openblas_set_num_threads.$(SUFFIX) openblas_get_num_threads.$(SUFFIX) openblas_get_num_procs.$(SUFFIX) openblas_get_config.$(SUFFIX) openblas_get_parallel.$(SUFFIX) openblas_error_handle.$(SUFFIX) openblas_env.$(SUFFIX)
++COMMONOBJS	 = memory.$(SUFFIX) xerbla.$(SUFFIX) c_abs.$(SUFFIX) z_abs.$(SUFFIX) openblas_set_num_threads.$(SUFFIX) openblas_get_num_threads.$(SUFFIX) openblas_get_num_procs.$(SUFFIX) openblas_get_config.$(SUFFIX) openblas_get_parallel.$(SUFFIX) openblas_error_handle.$(SUFFIX) openblas_env.$(SUFFIX) blas_server_callback.$(SUFFIX)
+ 
+ #COMMONOBJS	+= slamch.$(SUFFIX) slamc3.$(SUFFIX) dlamch.$(SUFFIX)  dlamc3.$(SUFFIX)
+ 
+ ifdef SMP
+-COMMONOBJS	+= blas_server.$(SUFFIX) divtable.$(SUFFIX) blasL1thread.$(SUFFIX) blas_server_callback.$(SUFFIX)
++COMMONOBJS	+= blas_server.$(SUFFIX) divtable.$(SUFFIX) blasL1thread.$(SUFFIX)
+ ifneq ($(NO_AFFINITY), 1)
+ COMMONOBJS	+= init.$(SUFFIX)
+ endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
