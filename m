Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E862CD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 538B04197C;
	Fri,  5 Jun 2026 12:40:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zzJFuDcxQwzx; Fri,  5 Jun 2026 12:40:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61C9C41971
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663223;
	bh=/hjRoaLG4tpnzFHuWEcewLkJHKYtt2nyn592PbUgEsI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pThcM71Ysk1pJrQBlgqFTVwzfBQuHGbvA4zYnFuChBR1yUNPvtE7NT3LOC1531LGI
	 BsUzHU9D/Hu7YvhvSUoXDJGfmeaADYmtjTqEyZ1MqpFwYKmDToi/mZ52QWZViYdtHp
	 E23VAwX/dG6W6DxgQ4m2HKj5w9VbOUv5022x6rGFShQ+V+2R6N90dn8H+D15mue+H2
	 FmSnbIDxQCmwc30ggfDh0CO3tRY/joe2Q8EQxwovDJM04+t7RKxKWI4tHmiwhNM/k4
	 QMa2lkx+1AdqcYmejHRC0H0+OYVpABbdHXroOTpSM17L/lQwh6b9y1WRRq/mix7THr
	 RrpGS9NvAy0kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61C9C41971;
	Fri,  5 Jun 2026 12:40:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03BE4F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 338F340F18
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AD-oKrwTmiWL for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82C8B41072
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82C8B41072
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC77287B03; Fri,  5 Jun 2026 12:38:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:09:33 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 49cc5deacd4d0d3e19b83a3b856ed66b02f7f9b7
X-Git-Newrev: 7b9b53d1be767d29c470a633b94fddf03516e976
X-Patchwork-Hint: ignore
Message-Id: <20260605123838.AC77287B03@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libbpf: fix
 bpftrace build with kernel headers 5.{9, 10}
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7b9b53d1be767d29c470a633b94fddf03516e976
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
(cherry picked from commit 7e5241e14aab1b6ff31c30bca05f9fa2ce81b6c1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
