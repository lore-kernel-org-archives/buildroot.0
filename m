Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68E2CD6E4C
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 16:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7378B42F49;
	Sat, 30 May 2026 16:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CkZHxyghAU7Q; Sat, 30 May 2026 16:25:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 116A842F34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780158315;
	bh=ar7WlkJ4C6No2bDwAZHTLwpAlopykdHJe9DNSkto43g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GOs1/PjNFazl/yri6iUIVD2fxCfnQs0nbZ3KmCvshOuDw3zUjoWo1jq6dOt2ApmZG
	 G9NcVCPRPlaZEFw1YmizoMGz5E8q+8wNzmM0SNrmfQ2cz2+2hgZyozAig6s+SY7Qrg
	 XAiLS5FGERqUReSPdomMzpBhjmLzf4FDFJWVj0/67ZeD64IOah81U8/2TmkeGhc2Vg
	 NoJWRK0OWy1ns8Tn4MV2nv2mBZq86iLJQDWbKmmFAMOD+FvspCmzVviMUc+ZLraHPt
	 qAPDJ5U92D04By7WqZqkh71fNIOUE0iEmQcBKo9Yr3I9mrbIxJzeW1xI6rqxYdGyfT
	 8EtAd5d4DA1GA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 116A842F34;
	Sat, 30 May 2026 16:25:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 46A5712F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 16:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48AD96F5BC
 for <buildroot@buildroot.org>; Sat, 30 May 2026 16:25:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JCUzIwRUfQ-f for <buildroot@buildroot.org>;
 Sat, 30 May 2026 16:25:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 460736F5BA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 460736F5BA
 for <buildroot@buildroot.org>; Sat, 30 May 2026 16:25:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A18A835C8; Sat, 30 May 2026 16:24:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 18:01:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f07fb2bcd2ece6b7a85763858a55c2bdf7d1e6de
X-Git-Newrev: 7e5241e14aab1b6ff31c30bca05f9fa2ce81b6c1
X-Patchwork-Hint: ignore
Message-Id: <20260530162456.2A18A835C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libbpf: fix bpftrace build with
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7e5241e14aab1b6ff31c30bca05f9fa2ce81b6c1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
versions used for the buildroot toolchain or other build errors occurring
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
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/libbpf/libbpf.mk | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index a4bd270cbd..4b742ab966 100644
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
 
 define LIBBPF_FIX_STAGING_PC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
