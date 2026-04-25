Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CCBFF885A
	for <buildroot@archiver.kernel.org>; Sat, 25 Apr 2026 21:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D82D742263;
	Sat, 25 Apr 2026 21:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T9f16bisWmtx; Sat, 25 Apr 2026 21:17:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F14314228D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777151835;
	bh=Ed67fLVqX6w4MAfcxXVTapvYaJy9oAfms1okmlSsamw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QXGLjfkdVGo5EXauC+ZRV7vVGwQflAUw8jx5WcnyvGkLTrXTGN8XLJtozU7favZp4
	 JazemPjlSaxYsFUBiBBzbnKgNf+6c+PRqy4eHExkLIS034J0DSJskhfHqHtGi0PZud
	 PlQylTOVmlNLCOjRBg430cnDjU7YS7ZlGYgg1UBrbLqpHSApdpIILnBH8xV9EfzftD
	 lU5fWq0KsCr+zjrxtOsc5bzCTnKEY5pk/Yu3i+j4GAmmrVnK1911FB3h+ihykq9kcY
	 QdustQJm8LOITsEEB1EGh5v9GzLjVGUCW+qHGG8a388+4EwIm6DTFC3iWKSCfePhPd
	 9kKkEyhYduLgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F14314228D;
	Sat, 25 Apr 2026 21:17:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DA2EE194
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 21:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC3E74228D
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 21:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kf2PJFS2E6WE for <buildroot@buildroot.org>;
 Sat, 25 Apr 2026 21:17:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B7B2942263
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7B2942263
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B7B2942263
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 21:17:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 78436A4C0F8C;
 Sat, 25 Apr 2026 23:16:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48402)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wGkMj-000000004gG-0yXA;
 Sat, 25 Apr 2026 21:16:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Qais Yousef <qais.yousef@arm.com>,
	Romain Naour <romain.naour@gmail.com>
Date: Sat, 25 Apr 2026 23:16:37 +0200
Message-ID: <20260425211641.479665-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260425211641.479665-1-bernd@kuhls.net>
References: <20260425211641.479665-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777151806;
 bh=4jeb1N4UP0ZwL+kNaRL8vjnG1VNdH/o5FeF4dPF/kFM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=vWMgvhWtuLkL9+W1TRXe2AZBNPxw3W9NokzLg5mbcsQa55OS9ENYkkSrSMdw1X2Om
 Eu3cNe+OJlPiFAN6ITPAU+dgzU5SQALA8zxVewXLY8dL+vFgKpQnn9iZllUo/iE4dE
 s0Vh7GbrU+hb66A+jfej8xU2wHJ3xF9/GiFK4QniWXZgvrn4FB/Ge8V2im5Pq6iRQv
 g9oojXUpwLRqn4ToU6r7UjIn6RQDC4AHC6dWngocktSV7u6Ex/wf1mIXWpOpHjgnUd
 3OYZ9PPU1gl91FO3tP4IkDhvwyCdjgtTgG+IxKBj8TuZLdkSfJgTgK/JfhYk1EfXGs
 w0NqiMDqladKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=vWMgvhWt
Subject: [Buildroot] [PATCH 4/8] package/libbpf: fix bpftrace build with
 kernel headers 5.{9, 10}
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

Buildroot added the bpftrace package in 2024 with commit
338acb27ff3e07560290085d7c6a2feab633c869
which initially provided version 0.19.1.

This release includes upstream commit
https://github.com/bpftrace/bpftrace/commit/fea31939899db48fa6d28f5ce880bfc39250ec9f
which was added to version 0.17.0 in 2022 and makes use of certain
variables of struct bpf_btf_info which were added to the linux kernel in
2020 with version 5.11:
https://github.com/torvalds/linux/commit/5329722057d41aebc31e391907a501feaa42f7d9

+	__aligned_u64 name;
+	__u32 name_len;
+	__u32 kernel_btf;

The libbpf package updates toolchain headers with its bundled version
only when the toolchain headers are version 5.8 or older, this condition
is part of the initial version of the package added in 2020 with
buildroot commit f7b8508e4fe9c96bf679cc5423cc1500b6523e83. This version
limit should have been raised when the bpftrace package was added to
avoid build errors when the toolchain contains header versions 5.9 or
5.10.

This situation caused build errors in the autobuilder, the last one in
February 2025:

/home/autobuild/autobuild/instance-18/output-1/build/bpftrace-0.19.1/src/bpffeature.cpp:
 In member function 'bool bpftrace::BPFfeature::has_module_btf()':
/home/autobuild/autobuild/instance-18/output-1/build/bpftrace-0.19.1/src/bpffeature.cpp:573:8:
 error: 'struct bpf_btf_info' has no member named 'name'
  573 |   info.name = (__u64)name;
      |        ^~~~
/home/autobuild/autobuild/instance-18/output-1/build/bpftrace-0.19.1/src/bpffeature.cpp:574:8:
 error: 'struct bpf_btf_info' has no member named 'name_len'
  574 |   info.name_len = sizeof(name);

The problem disappeared from the autobuilders due to newer headers
versions used for the buildroot toolchain or other build errors occuring
earlier, like llvm version mismatches.

The build error can today still be reproduced with this defconfig

BR2_aarch64=y
BR2_KERNEL_HEADERS_5_10=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_PACKAGE_BPFTRACE=y

on the 2026.02.x branch as of 0be927b89a319c9ac35249354558e9f4cb102fd0.

To fix the problem we raise the BR2_TOOLCHAIN_HEADERS_AT_LEAST_ version
number.

Fixes:
https://autobuild.buildroot.net/results/dbe/dbecf88c7edba357cee8fea31294ddb9f4d188ad/
https://autobuild.buildroot.net/results/df5/df59e038de47f63d14e1be7bd12dd16a69636f79/
https://autobuild.buildroot.net/results/359/3595d39dd53a686bbf996dd4e532ced44906b9e3/
https://autobuild.buildroot.net/results/e4f/e4f95a5f30a605eadb81802075ea6bb1e2880684/
https://autobuild.buildroot.net/results/bd0/bd075cb8c55f9f8a017711dc804b8d81ae89b4c5/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libbpf/libbpf.mk | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index 65061a82bc..cded3734b4 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -18,13 +18,14 @@ define LIBBPF_BUILD_CMDS
 		-C $(@D)/src
 endef
 
-# bpf/bpf.h installed by libbpf uses bpf_iter_link_info that was added since
-# kernel 5.9, so we need to update some uapi headers in STAGING_DIR if the
-# toolchain is build with linux-headers < 5.9.
-# Otherwise bpf/bpf.h is broken due to out of date linux/bpf.h installed by the
-# toolchain.
-# https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=a5cbe05a6673b85bed2a63ffcfea6a96c6410cff
-ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9),)
+# bpftrace uses variables from bpf_btf_info that were added since kernel
+# 5.11, so we need to update some uapi headers in STAGING_DIR if the
+# toolchain is build with linux-headers < 5.11.
+# Otherwise bpftrace is broken due to out of date linux/bpf.h installed
+# by the toolchain.
+# https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=5329722057d41aebc31e391907a501feaa42f7d9
+# https://github.com/bpftrace/bpftrace/commit/fea31939899db48fa6d28f5ce880bfc39250ec9f
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11),)
 LIBBPF_UPDATE_UAPI_HEADERS = install_uapi_headers UAPIDIR=/usr/include/bpf
 LIBBPF_POST_INSTALL_STAGING_HOOKS += LIBBPF_FIX_STAGING_PC
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
