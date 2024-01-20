Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17ECFC47DAF
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 01:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A333C42C47;
	Sat, 20 Jan 2024 01:18:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A333C42C47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yZy7Uy5Hm9PW; Sat, 20 Jan 2024 01:18:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA9A142D28;
	Sat, 20 Jan 2024 01:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA9A142D28
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2DF391BF298
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 01:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02B5C41E2D
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 01:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02B5C41E2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wyhiVRUSm9kP for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 01:18:15 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCB4C41D74
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 01:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCB4C41D74
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9109361987;
 Sat, 20 Jan 2024 01:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF53BC433A6;
 Sat, 20 Jan 2024 01:18:12 +0000 (UTC)
From: Mat Martineau <martineau@kernel.org>
To: buildroot@buildroot.org
Date: Fri, 19 Jan 2024 17:17:59 -0800
Message-ID: <20240120011759.2454452-3-martineau@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240120011759.2454452-1-martineau@kernel.org>
References: <20240120011759.2454452-1-martineau@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1705713493;
 bh=Dqg0yXk0QMM7qMWYGFGer1KzJDNQiQx4TKI3SPlpBDE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VUnDht0ps2e6mX7j5mBGgOUTqNmYj4mXzjpW4Kale4d3s8SNyUM3hvu21vq5Orucx
 D0Q22aXexq9dkdz5bzYsNCwnNi+ovFzyZrkS086TLe2WQxbkYDuRA7rIhMdUVha88c
 OdH0Zc/nI2QiZJa8Jck1XcB9wS3jWr4SkSHVEV9eEAt69xKPHA9fbXVvzxvxDZTtfx
 HrWNRrAdUxuqCIxRuX96UVPeQHEPtT1o8x/bXnwJDivqWXg0B1nsnQscT6lretCW0J
 h22VnW3bQcirki+kPBFSza9x5O/csyhgFHS97ZqQTzUJwVnrLQ4g9KPAuTzUWg8zgw
 tn9uuorLJDKXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=VUnDht0p
Subject: [Buildroot] [PATCH v7 2/2] package/bpftrace: new package
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
Cc: jugurtha.belkalem@smile.fr, qyousef@layalina.io,
 Qais Yousef <qais.yousef@arm.com>, naveen.mamindlapalli@gmail.com,
 romain.naour@smile.fr, Mat Martineau <martineau@kernel.org>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Qais Yousef <qais.yousef@arm.com>

bpftrace is a high-level tracing language for Linux enhanced Berkeley
Packet Filter (eBPF) available in recent Linux kernels (4.1 and later).

Only tested on x86_64.

v7 changes:
 - Ported to current buildroot release
 - Update to bpftrace 0.19.1
 - Add libcereal dependency
 - Use new configure option for USE_SYSTEM_BPF_BCC
 - Update dependencies
 - Use BUILD_SHARED_LIBS=OFF instead of patching cmake files
 - Don't install tool docs in target filesystem
 - Propagate config dependencies

Signed-off-by: Qais Yousef <qais.yousef@arm.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Cc: Qais Yousef <qyousef@layalina.io>
Signed-off-by: Mat Martineau <martineau@kernel.org>

squashme: bpftrace: more review fixups
---
 DEVELOPERS                     |  4 +++
 package/Config.in              |  1 +
 package/bpftrace/Config.in     | 54 ++++++++++++++++++++++++++++++++++
 package/bpftrace/bpftrace.hash |  3 ++
 package/bpftrace/bpftrace.mk   | 24 +++++++++++++++
 5 files changed, 86 insertions(+)
 create mode 100644 package/bpftrace/Config.in
 create mode 100644 package/bpftrace/bpftrace.hash
 create mode 100644 package/bpftrace/bpftrace.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0af50f1f848d..2218b13f1121 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2505,6 +2505,9 @@ F:	package/synergy/
 N:	Prabhu Sannachi <prabhu.sannachi@collins.com>
 F:	package/redis-plus-plus/
 
+N:	Qais Yousef <qais.yousef@arm.com>
+F:	package/bpftrace/
+
 N:	Rafal Susz <rafal.susz@gmail.com>
 F:	board/avnet/s6lx9_microboard/
 F:	configs/s6lx9_microboard_defconfig
@@ -2606,6 +2609,7 @@ F:	package/alure/
 F:	package/aubio/
 F:	package/bcc/
 F:	package/binutils/
+F:	package/bpftrace/
 F:	package/bullet/
 F:	package/clinfo/
 F:	package/efl/
diff --git a/package/Config.in b/package/Config.in
index 662c935a1f1c..1fc983dfd8aa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -91,6 +91,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/blktrace/Config.in"
 	source "package/bonnie/Config.in"
 	source "package/bpftool/Config.in"
+	source "package/bpftrace/Config.in"
 	source "package/cache-calibrator/Config.in"
 	source "package/clinfo/Config.in"
 	source "package/clpeak/Config.in"
diff --git a/package/bpftrace/Config.in b/package/bpftrace/Config.in
new file mode 100644
index 000000000000..e8afa37b6e63
--- /dev/null
+++ b/package/bpftrace/Config.in
@@ -0,0 +1,54 @@
+config BR2_PACKAGE_BPFTRACE_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_x86_64
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+
+config BR2_PACKAGE_BPFTRACE
+	bool "bpftrace"
+	depends on BR2_PACKAGE_BPFTRACE_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # bcc
+	depends on BR2_TOOLCHAIN_USES_GLIBC # bcc
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # bcc -> clang
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libbpf
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libbpf
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13 # libbpf
+	depends on BR2_INSTALL_LIBSTDCPP # bcc -> clang
+	depends on BR2_HOST_GCC_AT_LEAST_7 # bcc -> clang
+	depends on BR2_USE_WCHAR # bcc -> clang, bcc -> python3, libbpf
+	depends on BR2_USE_MMU # bcc -> python3
+	depends on BR2_TOOLCHAIN_HAS_THREADS # bcc -> clang, bcc -> python3
+	depends on !BR2_STATIC_LIBS # bcc -> clang, bcc -> python3, libbpf
+	select BR2_PACKAGE_BCC
+	select BR2_PACKAGE_LIBBPF
+	select BR2_PACKAGE_CEREAL
+	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_XZ
+	# LLVM RTTI mendatory: https://github.com/iovisor/bpftrace/issues/1156
+	select BR2_PACKAGE_LLVM_RTTI
+	select BR2_PACKAGE_LLVM
+	help
+	  bpftrace is a high-level tracing language for Linux enhanced
+	  Berkeley Packet Filter (eBPF) available in recent Linux
+	  kernels (4.x).
+
+	  bpftrace uses LLVM as a backend to compile scripts to
+	  BPF-bytecode and makes use of BCC for interacting with the
+	  Linux BPF system, as well as existing Linux tracing
+	  capabilities: kernel dynamic tracing (kprobes), user-level
+	  dynamic tracing (uprobes), and tracepoints. The bpftrace
+	  language is inspired by awk and C, and predecessor tracers
+	  such as DTrace and SystemTap.
+
+	  It's highly recommended to NOT strip bpftrace binary.
+	  To do so, add "bpftrace" to BR2_STRIP_EXCLUDE_FILES.
+	  See:
+	    https://bugzilla.redhat.com/show_bug.cgi?id=1865787
+
+	  https://www.github.com/iovisor/bpftrace
+
+comment "bpftrace needs a glibc toolchain w/ C++, gcc >= 7"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/bpftrace/bpftrace.hash b/package/bpftrace/bpftrace.hash
new file mode 100644
index 000000000000..c2ecc927da35
--- /dev/null
+++ b/package/bpftrace/bpftrace.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256  b520340f28ce4d6f2fb2355f1675b6801ff8498ed9e8bff14abbbf6baff5a08e  bpftrace-0.19.1.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
new file mode 100644
index 000000000000..072cee4ae72e
--- /dev/null
+++ b/package/bpftrace/bpftrace.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# bpftrace
+#
+################################################################################
+
+BPFTRACE_VERSION = 0.19.1
+BPFTRACE_SITE = $(call github,iovisor,bpftrace,v$(BPFTRACE_VERSION))
+BPFTRACE_LICENSE = Apache-2.0
+BPFTRACE_LICENSE_FILES = LICENSE
+BPFTRACE_DEPENDENCIES = host-bison host-flex bcc libbpf cereal bzip2 xz elfutils llvm
+
+# libbfd, libopcodes
+ifeq ($(BR2_PACKAGE_BINUTILS),y)
+BPFTRACE_DEPENDENCIES += binutils
+endif
+
+BPFTRACE_CONF_OPTS += -DENABLE_MAN:BOOL=OFF \
+	-DUSE_SYSTEM_BPF_BCC:BOOL=ON \
+	-DBUILD_SHARED_LIBS:BOOL=OFF \
+	-DBUILD_TESTING:BOOL=OFF \
+	-DINSTALL_TOOL_DOCS:BOOL=OFF
+
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
