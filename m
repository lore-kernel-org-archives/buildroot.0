Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D2CFEC11B
	for <buildroot@archiver.kernel.org>; Tue, 24 Mar 2026 21:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EA90838FB;
	Tue, 24 Mar 2026 21:38:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 32_6N-lwIddG; Tue, 24 Mar 2026 21:38:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0D3783B91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774388323;
	bh=JyRa0pQ4/SdgZnkZczZMjd7RTsRy/rwMTl6KYeWWZDM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=qxX5k9GZSsc23DlB6fsW+0xuPg2vRf7MSrD74LopWlmNwsvbm/llEEpUe1rnv3Y21
	 9RcGHIAcyPWvTD3+zxO5OGdogLTSM9HUerD6tGcT1qIphM4Kvvb3WdqM5AFNl1WJuP
	 EVd5rTwboAZZ9T865sEm5kYgsIW+3fLMdXNU78Za6BWwMcsuIMeGNveNmpfR0Za0mK
	 GQwrYffFJbD0T6CeWAIJqPLwsvz8g9vGaWmktgY5mZICNmCZ7jfxJAvrq9ml6JboCu
	 0jT+uoyfCupwOCLzYGmfPuI6Ai1Z7T6CuGRqXhpgmlmyGyywfZQQm3WcWZhQqquoOl
	 reZXtPf47dXiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0D3783B91;
	Tue, 24 Mar 2026 21:38:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 967D7353
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 21:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88529838FB
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 21:38:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bV7L7OUZz8Tk for <buildroot@buildroot.org>;
 Tue, 24 Mar 2026 21:38:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 822138376B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 822138376B
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 822138376B
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 21:38:40 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 1804419F57B;
 Tue, 24 Mar 2026 22:38:36 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Tue, 24 Mar 2026 22:38:15 +0100
Message-ID: <20260324213815.3506273-1-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774388318;
 bh=W5Ihp9OqyTdhr8S4RP90Bl9TVJo4GWDAcEOOYnTw5SQ=;
 h=From:To:Cc:Subject:Date:From;
 b=FHes8uCgzGT8Jx1sZER9MpvCGOoqTF6DxcSGrS5GCGi9g8sSV7JL5GzxEWAfuQnCH
 nS8qzpL5E9PRoQSbGb+u62JxgxIBw5H9UWbHOFV1M3/L5idISpFXuen7XMRoTYycPK
 3OxK0GJCyk7FR+f2U3QWgIrbDHEsLlrmAnW6X51xIecSmfRma++yk41GWnOEOpW4nm
 JuI9jRgG+rI9cu+l6rAVn+VGJUe5yE2VZzoP881MmWS79hCbRxJhx5NPxnrq/1wTGl
 C85bc6J3zNzbBEWO4wCjxaVMwDShi9KcUd+yTMS57cv7eqbUnunMITRn3n8FzdW6Vo
 smeLxanw/6e0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FHes8uCg
Subject: [Buildroot] [PATCH 1/1] package/openblas: bump to version v0.3.32
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since v0.3.31, see:
https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.32

This commit removes the package patch, which is included in this
release.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...allback-replacement-hook-in-singleth.patch | 53 -------------------
 package/openblas/openblas.hash                |  6 +--
 package/openblas/openblas.mk                  |  2 +-
 3 files changed, 4 insertions(+), 57 deletions(-)
 delete mode 100644 package/openblas/0002-Include-thread-callback-replacement-hook-in-singleth.patch

diff --git a/package/openblas/0002-Include-thread-callback-replacement-hook-in-singleth.patch b/package/openblas/0002-Include-thread-callback-replacement-hook-in-singleth.patch
deleted file mode 100644
index 7ea199fb2e..0000000000
--- a/package/openblas/0002-Include-thread-callback-replacement-hook-in-singleth.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 874243421298866d116e1e8bdbd7e0ed4e31e4f6 Mon Sep 17 00:00:00 2001
-From: Martin Kroeker <martin@ruby.chemie.uni-freiburg.de>
-Date: Sun, 18 Jan 2026 19:55:40 +0100
-Subject: [PATCH] Include thread callback replacement hook in singlethreaded
- builds as well
-
-Upstream: https://github.com/OpenMathLib/OpenBLAS/commit/874243421298866d116e1e8bdbd7e0ed4e31e4f6
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- driver/others/CMakeLists.txt | 2 +-
- driver/others/Makefile       | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/driver/others/CMakeLists.txt b/driver/others/CMakeLists.txt
-index a07a0baf99..72abdc4ee4 100644
---- a/driver/others/CMakeLists.txt
-+++ b/driver/others/CMakeLists.txt
-@@ -27,7 +27,6 @@ if (USE_THREAD)
-     ${BLAS_SERVER}
-     divtable.c # TODO: Makefile has -UDOUBLE
-     blas_l1_thread.c
--    blas_server_callback.c
-   )
- 
-   if (NOT NO_AFFINITY)
-@@ -42,6 +41,7 @@ set(COMMON_SOURCES
-   openblas_env.c
-   openblas_get_num_procs.c
-   openblas_get_num_threads.c
-+  blas_server_callback.c
- )
- 
- # these need to have NAME/CNAME set, so use GenerateNamedObjects, but don't use standard name mangling
-diff --git a/driver/others/Makefile b/driver/others/Makefile
-index 719d617c45..fbd016e6b0 100644
---- a/driver/others/Makefile
-+++ b/driver/others/Makefile
-@@ -1,12 +1,12 @@
- TOPDIR	= ../..
- include ../../Makefile.system
- 
--COMMONOBJS	 = memory.$(SUFFIX) xerbla.$(SUFFIX) c_abs.$(SUFFIX) z_abs.$(SUFFIX) openblas_set_num_threads.$(SUFFIX) openblas_get_num_threads.$(SUFFIX) openblas_get_num_procs.$(SUFFIX) openblas_get_config.$(SUFFIX) openblas_get_parallel.$(SUFFIX) openblas_error_handle.$(SUFFIX) openblas_env.$(SUFFIX)
-+COMMONOBJS	 = memory.$(SUFFIX) xerbla.$(SUFFIX) c_abs.$(SUFFIX) z_abs.$(SUFFIX) openblas_set_num_threads.$(SUFFIX) openblas_get_num_threads.$(SUFFIX) openblas_get_num_procs.$(SUFFIX) openblas_get_config.$(SUFFIX) openblas_get_parallel.$(SUFFIX) openblas_error_handle.$(SUFFIX) openblas_env.$(SUFFIX) blas_server_callback.$(SUFFIX)
- 
- #COMMONOBJS	+= slamch.$(SUFFIX) slamc3.$(SUFFIX) dlamch.$(SUFFIX)  dlamc3.$(SUFFIX)
- 
- ifdef SMP
--COMMONOBJS	+= blas_server.$(SUFFIX) divtable.$(SUFFIX) blasL1thread.$(SUFFIX) blas_server_callback.$(SUFFIX)
-+COMMONOBJS	+= blas_server.$(SUFFIX) divtable.$(SUFFIX) blasL1thread.$(SUFFIX)
- ifneq ($(NO_AFFINITY), 1)
- COMMONOBJS	+= init.$(SUFFIX)
- endif
diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index e97e32271a..a1e1cfc851 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,5 +1,5 @@
-# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.31
-md5  05050271d9196f65bc4ac3a89c6a3b05  openblas-0.3.31.tar.gz
+# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.32
+md5  021eb76c3fc66290b6ce14fa4c1ff3de  openblas-0.3.32.tar.gz
 # Locally calculated
-sha256  6dd2a63ac9d32643b7cc636eab57bf4e57d0ed1fff926dfbc5d3d97f2d2be3a6  openblas-0.3.31.tar.gz
+sha256  f8a1138e01fddca9e4c29f9684fd570ba39dedc9ca76055e1425d5d4b1a4a766  openblas-0.3.32.tar.gz
 sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index d56934e41a..e8836a9d27 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = 0.3.31
+OPENBLAS_VERSION = 0.3.32
 OPENBLAS_SITE = https://github.com/OpenMathLib/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
