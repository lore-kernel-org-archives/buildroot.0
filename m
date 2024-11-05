Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83C0D40D08
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 23:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56220608A1;
	Tue,  5 Nov 2024 23:41:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0XhclmGE_bpx; Tue,  5 Nov 2024 23:40:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 585BB608A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 585BB608A9;
	Tue,  5 Nov 2024 23:40:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 641D827F1
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 23:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 518A74068F
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 23:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yRjMGyBFN9Ow for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 23:40:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7E60E40688
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E60E40688
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E60E40688
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 23:40:55 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id F1C6CB00539;
 Wed,  6 Nov 2024 00:40:50 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
	Julien Olivain <ju.o@free.fr>
Date: Wed,  6 Nov 2024 00:40:45 +0100
Message-ID: <20241105234045.2624651-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730850053;
 bh=4VxfjWzdnIIHKyGvFaCSmlV3NFMHDK52o+3LLFaM8Hg=;
 h=From:To:Cc:Subject:Date:From;
 b=J3XBGV+xeO3xj9DyC9HTVt1cxWotu1KOgsox3MC1nFVcX6FJI/Y3MlEBEFEWXa8Y1
 VtiG9aDHc2t4OMaqicQxYMUG5ZECW92MQcLDZ88ToFaRSUwj7//DfK1TrWC6LDk3sj
 +zl1L+Toq2Rt4A8js5MNbLqvowBgp4nNcXEHoITCf0T2fP6a4AvM1BYpfbnc3h+H0+
 00K22sKAUfyBPRGqJScYC5PGz5WXyP1F1ZXJtjdLb4qOM9QfdBXptSkGxMLfVhcjsu
 YTLdz1uyPMS+MUcDo9MCCs2/31AefoLyx65TY79efs8PzWG1w8Z2dChgMMGAR2U5HT
 /FPfvqgevjFRw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=J3XBGV+x
Subject: [Buildroot] [PATCH 1/1] package/numactl: bump to version 2.0.19
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

For change logs since 2.0.18, see:
https://github.com/numactl/numactl/releases/tag/v2.0.19

This commit also removes the package patch, which is included in
this version.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8279029791
https://gitlab.com/jolivain/buildroot/-/pipelines/1528845024
---
 ...-when-set_mempolicy_home_node-syscal.patch | 46 -------------------
 package/numactl/numactl.hash                  |  2 +-
 package/numactl/numactl.mk                    |  2 +-
 3 files changed, 2 insertions(+), 48 deletions(-)
 delete mode 100644 package/numactl/0001-Don-t-fail-build-when-set_mempolicy_home_node-syscal.patch

diff --git a/package/numactl/0001-Don-t-fail-build-when-set_mempolicy_home_node-syscal.patch b/package/numactl/0001-Don-t-fail-build-when-set_mempolicy_home_node-syscal.patch
deleted file mode 100644
index ac532e1fb5..0000000000
--- a/package/numactl/0001-Don-t-fail-build-when-set_mempolicy_home_node-syscal.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From c265971648f82464a76f797c4c20a09def078be9 Mon Sep 17 00:00:00 2001
-From: Andi Kleen <ak@linux.intel.com>
-Date: Thu, 16 May 2024 09:03:24 -0700
-Subject: [PATCH] Don't fail build when set_mempolicy_home_node syscall is
- unknown
-
-Instead just warn at build and return ENOSYS. This fixes build
-on architectures like arm without kernel headers installed.
-
-Fixes #219
-
-Upstream: https://github.com/numactl/numactl/commit/87342c3b9a42aadbe1398ca8233d13ab524aa64f
-Signed-off-by: Andi Kleen <ak@linux.intel.com>
----
- syscall.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/syscall.c b/syscall.c
-index 63b3e53..392f736 100644
---- a/syscall.c
-+++ b/syscall.c
-@@ -144,7 +144,7 @@
- #if defined(__x86_64__) || defined(__aarch64__)
- #define __NR_set_mempolicy_home_node 450
- #else
--#error "Add syscalls for your architecture or update kernel headers"
-+#warning "Add syscalls for your architecture or update kernel headers"
- #endif
- 
- #endif
-@@ -261,7 +261,12 @@ long WEAK move_pages(int pid, unsigned long count,
- 
- int WEAK set_mempolicy_home_node(void *start, unsigned long len, int home_node, int flags)
- {
-+#ifndef __NR_set_mempolicy_home_node
-+   errno = ENOSYS;
-+   return -1;
-+#else
-    return syscall(__NR_set_mempolicy_home_node, start, len, home_node, flags);
-+#endif
- }
- 
- /* SLES8 glibc doesn't define those */
--- 
-2.46.2
-
diff --git a/package/numactl/numactl.hash b/package/numactl/numactl.hash
index c48df0ac69..8851c8c4f5 100644
--- a/package/numactl/numactl.hash
+++ b/package/numactl/numactl.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  b4fc0956317680579992d7815bc43d0538960dc73aa1dd8ca7e3806e30bc1274  numactl-2.0.18.tar.gz
+sha256  f2672a0381cb59196e9c246bf8bcc43d5568bc457700a697f1a1df762b9af884  numactl-2.0.19.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index 512a5eb96a..134d03bc53 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NUMACTL_VERSION = 2.0.18
+NUMACTL_VERSION = 2.0.19
 NUMACTL_SITE = \
 	https://github.com/numactl/numactl/releases/download/v$(NUMACTL_VERSION)
 NUMACTL_LICENSE = LGPL-2.1 (libnuma), GPL-2.0 (programs)
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
