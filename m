Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35954FF885A
	for <buildroot@archiver.kernel.org>; Sat, 25 Apr 2026 21:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05ED54228D;
	Sat, 25 Apr 2026 21:17:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MEeEhLkImfJT; Sat, 25 Apr 2026 21:17:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B7F04228F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777151872;
	bh=ynkFhCVhpZCrpv8w0bQTKLsYl+gnrpj1TUwni44VobQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NH6cZhYh0X96MHQVtnRxWxdXU+xg1K/eTfE8+H/bOM9eY4bbUHVsvTItCNPGa4J8E
	 2rAFTwN5HE1vkxSxDNCzL5Kwo04CKXTzBDT5g053AIB299jZWs0xfQEgFPvOK5VPwp
	 nHpPNmHM6BRfDpsMGz2A+5ILZwIq7FhVzXyCmYBesYwuvRbtgipx/NxBwQoDKe4jvj
	 OS8QmAgXgAdbw5lNsBWCS19zrF5WCsba25e84jLDk0fVVW1uJjo5GVTnkG7SFNRyfR
	 haV3ycCqDUMBfMLC7fz5f1BZxlaYNBYhvIyMXqD3c55yvExwBS+iQQmEwRGWcBRhjg
	 L5WqgEFYT17NA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B7F04228F;
	Sat, 25 Apr 2026 21:17:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 09F44194
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 21:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F00FC4228F
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 21:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q8fGXOYjvDeP for <buildroot@buildroot.org>;
 Sat, 25 Apr 2026 21:17:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E34244228D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E34244228D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E34244228D
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 21:17:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2EE72A4C0FEF;
 Sat, 25 Apr 2026 23:17:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48402)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wGkMj-000000004gG-2ZpC;
 Sat, 25 Apr 2026 21:16:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Qais Yousef <qais.yousef@arm.com>,
	Romain Naour <romain.naour@gmail.com>
Date: Sat, 25 Apr 2026 23:16:41 +0200
Message-ID: <20260425211641.479665-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260425211641.479665-1-bernd@kuhls.net>
References: <20260425211641.479665-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777151822;
 bh=qRkfZW8iUZgc7hYOuPmmEJdCvs6BaCXbHo0I9NXd718=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=kXlbXDHtSfTKJTDnMbYBbWgxq3LVsBl4p2Ls5xmMG8Gk4OsBebZQoWeqHayop8RaE
 n8Jj5MhKEjD4UGk/cFAnI2APshh8LXaFjY4ILdT+g4zxGzT1cZd9wxNyMAHGAsD/r1
 r4kXKsiG6vq1gOLDOatiFL2WvXf+Cb7qtNGr44bDDSBQPjoK9/+KUp1C57OI1AKNGK
 dDpBlUun4E+ByFgspr254ZIJBeYkN1d8Fcr79Wbple1Xop0cTtuuHdij4Wh2h3N84D
 4ZXCrtIK23597XLtGMweLw8EM/90C7NtD+5hp0dVB3L2m9cQz1ABKTaTRv6b3GylJ3
 t8fy4Q1VAIupQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=kXlbXDHt
Subject: [Buildroot] [PATCH v2 8/8] package/bpftrace: bump version to 0.25.1
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

https://github.com/bpftrace/bpftrace/blob/v0.25.1/CHANGELOG.md

Added configure option USE_SYSTEM_LIBBPF to use our libbpf package,
needed due to upstream commit
https://github.com/bpftrace/bpftrace/commit/6d53738627d4f80c83f799f9e042f6bdd373a433
which was added to version 0.25.0.

The bump includes upstream commit
https://github.com/bpftrace/bpftrace/commit/c6442cde6e45945e3cfd72cb2fdbcca590454d0c
which adds support for LLVM 22 and fixes build errors introduced by
buildroot commit 25cb3813e7fc6ed3e455f983cf0e09c7bc02fccb.

The bump includes upstream commit
https://github.com/bpftrace/bpftrace/commit/5261e8e1f362bef6e651d4db0ad8ade380cf7857
which adds the usage of CAP_BPF and CAP_PERFMON that were added to the
linux kernel in version 5.8:
CAP_PERFMON: https://github.com/torvalds/linux/commit/980737282232b752bb14dab96d77665c15889c36
CAP_BPF: https://github.com/torvalds/linux/commit/a17b53c4a4b55ec322c132b6670743612229ee9c

Added BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8 to reflect the dependency.

Please note the upstream docs describe the minimal kernel version as
5.15:
https://github.com/bpftrace/bpftrace/commit/e31ad636847a6f650fab827fbf83401e89dbe06d

Build-tested using this defconfig:

BR2_x86_64=y
BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="5.8.18"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_PACKAGE_BPFTRACE=y

Fixes:
https://autobuild.buildroot.net/results/599/59920f909d808911ea2710938271ecfab48c367f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: fixed build errors (Julien)

 package/bpftrace/Config.in     | 6 +++---
 package/bpftrace/bpftrace.hash | 2 +-
 package/bpftrace/bpftrace.mk   | 5 +++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/bpftrace/Config.in b/package/bpftrace/Config.in
index 8af94443ab..c940420abf 100644
--- a/package/bpftrace/Config.in
+++ b/package/bpftrace/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_BPFTRACE
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # bcc -> clang
 	depends on BR2_INSTALL_LIBSTDCPP # bcc -> clang
 	depends on BR2_HOST_GCC_AT_LEAST_7 # bcc -> clang
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13 # libbpf
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8
 	depends on BR2_USE_WCHAR # bcc -> clang, bcc -> python3, libbpf
 	depends on BR2_TOOLCHAIN_HAS_THREADS # bcc -> clang, bcc -> python3, libbpf
 	depends on !BR2_STATIC_LIBS # bcc -> clang, bcc -> python3, libbpf
@@ -47,10 +47,10 @@ config BR2_PACKAGE_BPFTRACE
 
 	  https://www.github.com/iovisor/bpftrace
 
-comment "bpftrace needs a glibc toolchain w/ C++, gcc >= 7, host gcc >= 7, kernel headers >= 4.13"
+comment "bpftrace needs a glibc toolchain w/ C++, gcc >= 7, host gcc >= 7, kernel headers >= 5.8"
 	depends on BR2_PACKAGE_BPFTRACE_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_HOST_GCC_AT_LEAST_7 \
-		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8
diff --git a/package/bpftrace/bpftrace.hash b/package/bpftrace/bpftrace.hash
index 4add96aee3..9990ab3cdc 100644
--- a/package/bpftrace/bpftrace.hash
+++ b/package/bpftrace/bpftrace.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  e0514aa3e1a032b0b2de2cf3c281bfee9b9e80509498e70ed78786bbd64db373  bpftrace-0.24.2.tar.gz
+sha256  89d1cb7448a650eecebe52e8deb6dfa85517ae91c465bccd5246abd4588707dc  bpftrace-0.25.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
index f530d4861b..9047aa7a11 100644
--- a/package/bpftrace/bpftrace.mk
+++ b/package/bpftrace/bpftrace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BPFTRACE_VERSION = 0.24.2
+BPFTRACE_VERSION = 0.25.1
 BPFTRACE_SITE = $(call github,bpftrace,bpftrace,v$(BPFTRACE_VERSION))
 BPFTRACE_LICENSE = Apache-2.0
 BPFTRACE_LICENSE_FILES = LICENSE
@@ -29,6 +29,7 @@ BPFTRACE_CONF_OPTS += \
 	-DBUILD_SHARED_LIBS:BOOL=OFF \
 	-DBUILD_TESTING:BOOL=OFF \
 	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -I$(STAGING_DIR)/usr/include/bpf" \
-	-DENABLE_MAN:BOOL=OFF
+	-DENABLE_MAN:BOOL=OFF \
+	-DUSE_SYSTEM_LIBBPF:BOOL=ON
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
