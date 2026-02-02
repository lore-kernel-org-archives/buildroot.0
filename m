Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D39E7DEF0
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 14:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0131840A48;
	Mon,  2 Feb 2026 14:24:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NUccjqcQRn7o; Mon,  2 Feb 2026 14:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FE3B40B53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770042254;
	bh=9MRQ1IHmR/tOIBWCNaL/qFwPM56ZsfGM5H42hLKSRnA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BkgkbDUZBaSPHK3a1PGDywviYpCmv1taxl5IVpO3+FgFuJ6ZhhvPutJaD0NoyUh8x
	 IF3LXiqFwc+PsvhIU9jKANZ5tBtDJcKWZsNpCkHEUKp5jBhOs0zfRYM6SFnKIPlQx1
	 O1M4TETUIXsLPoy+YAGx5UtNDsUBbY2mLDa6CxDiIL0TIGnO8NqNwqWzAB+hdJG0Nt
	 vWnvWclGb9w7x7thXVUmsJTkSqAdgqJ/WBlCSj2IxEZyKIKJ+Yqmj6p2x5Qp5uQG2Q
	 FB2qWpXCwxhtr6F9FZbxQ8nc+2Cf1Lq08Kql8L7T+l0MXEvy6RGv11s8LVXEaH5wz8
	 NgxuponUKB6XQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FE3B40B53;
	Mon,  2 Feb 2026 14:24:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 63BAF149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6487A606BD
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:24:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SjC6e7WG6RhF for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 14:24:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=207.54.77.171;
 helo=esa4.hc555-34.eu.iphmx.com; envelope-from=jimmy.wesolowski@mobileye.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CAC9860657
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAC9860657
Received: from esa4.hc555-34.eu.iphmx.com (esa4.hc555-34.eu.iphmx.com
 [207.54.77.171])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CAC9860657
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:24:06 +0000 (UTC)
X-CSE-ConnectionGUID: O5/HPpkQSi2ovLCGuJC6BA==
X-CSE-MsgGUID: pKGlnvjvQtqfMdNcdYMJHg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
 by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 16:24:03 +0200
X-CSE-ConnectionGUID: ohZy2nWzS2KdJZj1AJ8ZtQ==
X-CSE-MsgGUID: mp17M2DMRFOiJUt7ghZy7Q==
Received: from unknown (HELO epgd074.me-corp.lan) ([10.154.54.6])
 by ces01_data.me-corp.lan with SMTP; 02 Feb 2026 16:26:15 +0200
Received: by epgd074.me-corp.lan (sSMTP sendmail emulation);
 Mon, 02 Feb 2026 16:24:02 +0200
To: buildroot@buildroot.org
Cc: guenther.harrasser@mobileye.com,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Date: Mon,  2 Feb 2026 16:23:53 +0200
Message-ID: <20260202142359.2577937-2-jimmy.wesolowski@mobileye.com>
In-Reply-To: <20260202142359.2577937-1-jimmy.wesolowski@mobileye.com>
References: <20260202142359.2577937-1-jimmy.wesolowski@mobileye.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
 t=1770042246; x=1801578246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rze0A68qOrWbnV9HQBhhjm8YX/zo0LWqP13K8pGZ0Fs=;
 b=Bzs3/VQD0VHzi0WPM35wwdVQQesh2HYhwzBiJZHej5nD55BlOqM/tmRw
 rd5AB4EmcJBBAJV1JxAzDvXK3tKpg+dzLDMVoo/DlAQfIEWn55hR/sGgr
 hRXmE5lGS8c1CSoJ/Dxr6pIXvioXTHaKpvoSHHrfQl0EX5SYJxIp9BjrZ
 Csh0LatgyUPo992PojlAvIU3q/QkloZVJhnT8Zvu8nSe9lLGKGDhH55mp
 LiNjFDEMcaZCSMDyxE0MPwvZP8w4Hqdo7Kw8XIG1RsybM8BLQ6X4ypRiB
 0Cl8d453NRl/iHTU765LsTK4q1y7CE0K7FKt4DO7aCJYFGG5CAMnB3aI0
 w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
Subject: [Buildroot] [PATCH 2/3] package/gcc-bpf: add host package
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
From: Jimmy Durand Wesolowski via buildroot <buildroot@buildroot.org>
Reply-To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This adds GCC with BPF target to allow building BPF objects.

Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
---
 package/Config.in.host                        |   1 +
 ...le-split-stack-for-non-thread-builds.patch |  26 ++
 ...ISC-V-fix-build-issue-with-gcc-4.9.x.patch |  48 +++
 ...emove-crypt-and-crypt_r-interceptors.patch | 146 +++++++++
 ...bsanitizer-Fix-build-with-glibc-2.42.patch |  81 +++++
 ...le-split-stack-for-non-thread-builds.patch |  26 ++
 ...o-undef-_TIME_BITS-in-sanitizer_proc.patch |  53 ++++
 ...laze-add-atomic-test-and-set-support.patch | 286 ++++++++++++++++++
 ...bsanitizer-Fix-build-with-glibc-2.42.patch |  81 +++++
 ...le-split-stack-for-non-thread-builds.patch |  26 ++
 ...ce-support-for-atomics.-Fix-PR118280.patch | 286 ++++++++++++++++++
 ...-config-microblaze-fix-ira-for-GCC15.patch |  56 ++++
 package/gcc-bpf/Config.in.host                |  51 ++++
 package/gcc-bpf/gcc-bpf.hash                  |  13 +
 package/gcc-bpf/gcc-bpf.mk                    |  81 +++++
 package/gcc-bpf/gcc.hash                      |  20 ++
 16 files changed, 1281 insertions(+)
 create mode 100644 package/gcc-bpf/13.4.0/0001-disable-split-stack-for-non-thread-builds.patch
 create mode 100644 package/gcc-bpf/13.4.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
 create mode 100644 package/gcc-bpf/13.4.0/0003-Remove-crypt-and-crypt_r-interceptors.patch
 create mode 100644 package/gcc-bpf/13.4.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch
 create mode 100644 package/gcc-bpf/14.3.0/0001-disable-split-stack-for-non-thread-builds.patch
 create mode 100644 package/gcc-bpf/14.3.0/0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
 create mode 100644 package/gcc-bpf/14.3.0/0003-microblaze-add-atomic-test-and-set-support.patch
 create mode 100644 package/gcc-bpf/14.3.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch
 create mode 100644 package/gcc-bpf/15.2.0/0001-disable-split-stack-for-non-thread-builds.patch
 create mode 100644 package/gcc-bpf/15.2.0/0002-MicroBlaze-Enhance-support-for-atomics.-Fix-PR118280.patch
 create mode 100644 package/gcc-bpf/15.2.0/0003-gcc-config-microblaze-fix-ira-for-GCC15.patch
 create mode 100644 package/gcc-bpf/Config.in.host
 create mode 100644 package/gcc-bpf/gcc-bpf.hash
 create mode 100644 package/gcc-bpf/gcc-bpf.mk
 create mode 100644 package/gcc-bpf/gcc.hash

diff --git a/package/Config.in.host b/package/Config.in.host
index 55c52078a9..d50d407e10 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -45,6 +45,7 @@ menu "Host utilities"
 	source "package/firmware-utils/Config.in.host"
 	source "package/flutter-sdk-bin/Config.in.host"
 	source "package/fwup/Config.in.host"
+	source "package/gcc-bpf/Config.in.host"
 	source "package/genext2fs/Config.in.host"
 	source "package/genimage/Config.in.host"
 	source "package/genpart/Config.in.host"
diff --git a/package/gcc-bpf/13.4.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc-bpf/13.4.0/0001-disable-split-stack-for-non-thread-builds.patch
new file mode 100644
index 0000000000..e801085dad
--- /dev/null
+++ b/package/gcc-bpf/13.4.0/0001-disable-split-stack-for-non-thread-builds.patch
@@ -0,0 +1,26 @@
+From 4f67134e0b1404fef4ea72342be8fab4c37ca8c8 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Mon, 25 Jul 2022 00:29:55 +0200
+Subject: [PATCH] disable split-stack for non-thread builds
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Romain: convert to git format]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ libgcc/config/t-stack | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libgcc/config/t-stack b/libgcc/config/t-stack
+index cc0366b4cd8..f3f97e86d60 100644
+--- a/libgcc/config/t-stack
++++ b/libgcc/config/t-stack
+@@ -1,4 +1,6 @@
+ # Makefile fragment to provide generic support for -fsplit-stack.
+ # This should be used in config.host for any host which supports
+ # -fsplit-stack.
++ifeq ($(enable_threads),yes)
+ LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
++endif
+-- 
+2.34.3
+
diff --git a/package/gcc-bpf/13.4.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch b/package/gcc-bpf/13.4.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
new file mode 100644
index 0000000000..4368f08404
--- /dev/null
+++ b/package/gcc-bpf/13.4.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
@@ -0,0 +1,48 @@
+From e5253b777eefef7d66d3bd1c641de6d133d3573d Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Tue, 2 May 2023 14:21:55 +0200
+Subject: [PATCH] RISC-V: fix build issue with gcc 4.9.x
+
+GCC should still build with GCC 4.8.3 or newer [1]
+using C++03 by default. But a recent change in
+RISC-V port introduced a C++11 feature "std::log2" [2].
+
+Use log2 from the C header, without the namespace [3].
+
+[1] https://gcc.gnu.org/install/prerequisites.html
+[2] https://gcc.gnu.org/git/?p=gcc.git;a=patch;h=7caa1ae5e451e780fbc4746a54e3f19d4f4304dc
+[3] https://stackoverflow.com/questions/26733413/error-log2-is-not-a-member-of-std
+
+Fixes:
+https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/4202276589
+
+gcc/ChangeLog:
+	* config/riscv/genrvv-type-indexer.cc: Use log2 from the C header, without
+	the namespace.
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+Upstream: https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=87c347c2897537a6aa391efbfc5ed00c625434fe
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gcc/config/riscv/genrvv-type-indexer.cc | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/config/riscv/genrvv-type-indexer.cc b/gcc/config/riscv/genrvv-type-indexer.cc
+index e677b55290c..eebe382d1c3 100644
+--- a/gcc/config/riscv/genrvv-type-indexer.cc
++++ b/gcc/config/riscv/genrvv-type-indexer.cc
+@@ -115,9 +115,9 @@ same_ratio_eew_type (unsigned sew, int lmul_log2, unsigned eew, bool unsigned_p,
+   if (sew == eew)
+     elmul_log2 = lmul_log2;
+   else if (sew > eew)
+-    elmul_log2 = lmul_log2 - std::log2 (sew / eew);
++    elmul_log2 = lmul_log2 - log2 (sew / eew);
+   else /* sew < eew */
+-    elmul_log2 = lmul_log2 + std::log2 (eew / sew);
++    elmul_log2 = lmul_log2 + log2 (eew / sew);
+ 
+   if (float_p)
+     return floattype (eew, elmul_log2);
+-- 
+2.34.3
+
diff --git a/package/gcc-bpf/13.4.0/0003-Remove-crypt-and-crypt_r-interceptors.patch b/package/gcc-bpf/13.4.0/0003-Remove-crypt-and-crypt_r-interceptors.patch
new file mode 100644
index 0000000000..98bfed5949
--- /dev/null
+++ b/package/gcc-bpf/13.4.0/0003-Remove-crypt-and-crypt_r-interceptors.patch
@@ -0,0 +1,146 @@
+From 3521d93c552a11640a959ee61d551c225981c448 Mon Sep 17 00:00:00 2001
+From: Fangrui Song <i@maskray.me>
+Date: Fri, 28 Apr 2023 09:59:17 -0700
+Subject: [PATCH] Remove crypt and crypt_r interceptors
+
+From Florian Weimer's D144073
+
+> On GNU/Linux (glibc), the crypt and crypt_r functions are not part of the main shared object (libc.so.6), but libcrypt (with multiple possible sonames). The sanitizer libraries do not depend on libcrypt, so it can happen that during sanitizer library initialization, no real implementation will be found because the crypt, crypt_r functions are not present in the process image (yet). If its interceptors are called nevertheless, this results in a call through a null pointer when the sanitizer library attempts to forward the call to the real implementation.
+>
+> Many distributions have already switched to libxcrypt, a library that is separate from glibc and that can be build with sanitizers directly (avoiding the need for interceptors). This patch disables building the interceptor for glibc targets.
+
+Let's remove crypt and crypt_r interceptors (D68431) to fix issues with
+newer glibc.
+
+For older glibc, msan will not know that an uninstrumented crypt_r call
+initializes `data`, so there is a risk for false positives. However, with some
+codebase survey, I think crypt_r uses are very few and the call sites typically
+have a `memset(&data, 0, sizeof(data));` anyway.
+
+Fix https://github.com/google/sanitizers/issues/1365
+Related: https://bugzilla.redhat.com/show_bug.cgi?id=2169432
+
+Reviewed By: #sanitizers, fweimer, thesamesam, vitalybuka
+
+Differential Revision: https://reviews.llvm.org/D149403
+
+[Thomas: taken from Crosstool-NG]
+Upstream: (llvm) https://github.com/llvm/llvm-project/commit/d7bead833631486e337e541e692d9b4a1ca14edd
+Upstream: (gcc)  https://github.com/gcc-mirror/gcc/commit/d96e14ceb9475f9bccbbc0325d5b11419fad9246
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ .../sanitizer_common_interceptors.inc         | 37 -------------------
+ .../sanitizer_platform_interceptors.h         |  2 -
+ .../sanitizer_platform_limits_posix.cpp       |  8 ----
+ .../sanitizer_platform_limits_posix.h         |  1 -
+ 4 files changed, 48 deletions(-)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc
+index ba4b80081f0..662c4199742 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc
++++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc
+@@ -10187,41 +10187,6 @@ INTERCEPTOR(SSIZE_T, getrandom, void *buf, SIZE_T buflen, unsigned int flags) {
+ #define INIT_GETRANDOM
+ #endif
+ 
+-#if SANITIZER_INTERCEPT_CRYPT
+-INTERCEPTOR(char *, crypt, char *key, char *salt) {
+-  void *ctx;
+-  COMMON_INTERCEPTOR_ENTER(ctx, crypt, key, salt);
+-  COMMON_INTERCEPTOR_READ_RANGE(ctx, key, internal_strlen(key) + 1);
+-  COMMON_INTERCEPTOR_READ_RANGE(ctx, salt, internal_strlen(salt) + 1);
+-  char *res = REAL(crypt)(key, salt);
+-  if (res != nullptr)
+-    COMMON_INTERCEPTOR_INITIALIZE_RANGE(res, internal_strlen(res) + 1);
+-  return res;
+-}
+-#define INIT_CRYPT COMMON_INTERCEPT_FUNCTION(crypt);
+-#else
+-#define INIT_CRYPT
+-#endif
+-
+-#if SANITIZER_INTERCEPT_CRYPT_R
+-INTERCEPTOR(char *, crypt_r, char *key, char *salt, void *data) {
+-  void *ctx;
+-  COMMON_INTERCEPTOR_ENTER(ctx, crypt_r, key, salt, data);
+-  COMMON_INTERCEPTOR_READ_RANGE(ctx, key, internal_strlen(key) + 1);
+-  COMMON_INTERCEPTOR_READ_RANGE(ctx, salt, internal_strlen(salt) + 1);
+-  char *res = REAL(crypt_r)(key, salt, data);
+-  if (res != nullptr) {
+-    COMMON_INTERCEPTOR_WRITE_RANGE(ctx, data,
+-                                   __sanitizer::struct_crypt_data_sz);
+-    COMMON_INTERCEPTOR_INITIALIZE_RANGE(res, internal_strlen(res) + 1);
+-  }
+-  return res;
+-}
+-#define INIT_CRYPT_R COMMON_INTERCEPT_FUNCTION(crypt_r);
+-#else
+-#define INIT_CRYPT_R
+-#endif
+-
+ #if SANITIZER_INTERCEPT_GETENTROPY
+ INTERCEPTOR(int, getentropy, void *buf, SIZE_T buflen) {
+   void *ctx;
+@@ -10772,8 +10737,6 @@ static void InitializeCommonInterceptors() {
+   INIT_GETUSERSHELL;
+   INIT_SL_INIT;
+   INIT_GETRANDOM;
+-  INIT_CRYPT;
+-  INIT_CRYPT_R;
+   INIT_GETENTROPY;
+   INIT_QSORT;
+   INIT_QSORT_R;
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h b/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h
+index 8307b1ec28b..d50166ee6ce 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h
+@@ -571,8 +571,6 @@
+ #define SANITIZER_INTERCEPT_FDEVNAME SI_FREEBSD
+ #define SANITIZER_INTERCEPT_GETUSERSHELL (SI_POSIX && !SI_ANDROID)
+ #define SANITIZER_INTERCEPT_SL_INIT (SI_FREEBSD || SI_NETBSD)
+-#define SANITIZER_INTERCEPT_CRYPT (SI_POSIX && !SI_ANDROID)
+-#define SANITIZER_INTERCEPT_CRYPT_R (SI_LINUX && !SI_ANDROID)
+ 
+ #define SANITIZER_INTERCEPT_GETRANDOM \
+   ((SI_LINUX && __GLIBC_PREREQ(2, 25)) || SI_FREEBSD)
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+index c85cf1626a7..bcbd143d19d 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+@@ -176,10 +176,6 @@ typedef struct user_fpregs elf_fpregset_t;
+ #  include "sanitizer_platform_interceptors.h"
+ #  include "sanitizer_platform_limits_posix.h"
+ 
+-#if SANITIZER_INTERCEPT_CRYPT_R
+-#include <crypt.h>
+-#endif
+-
+ namespace __sanitizer {
+   unsigned struct_utsname_sz = sizeof(struct utsname);
+   unsigned struct_stat_sz = sizeof(struct stat);
+@@ -283,10 +279,6 @@ namespace __sanitizer {
+   unsigned struct_statvfs64_sz = sizeof(struct statvfs64);
+ #endif // SANITIZER_LINUX && !SANITIZER_ANDROID
+ 
+-#if SANITIZER_INTERCEPT_CRYPT_R
+-  unsigned struct_crypt_data_sz = sizeof(struct crypt_data);
+-#endif
+-
+ #if SANITIZER_LINUX && !SANITIZER_ANDROID
+   unsigned struct_timex_sz = sizeof(struct timex);
+   unsigned struct_msqid_ds_sz = sizeof(struct msqid_ds);
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+index 44dd3d9e22d..29ebb304a9b 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+@@ -319,7 +319,6 @@ extern unsigned struct_msqid_ds_sz;
+ extern unsigned struct_mq_attr_sz;
+ extern unsigned struct_timex_sz;
+ extern unsigned struct_statvfs_sz;
+-extern unsigned struct_crypt_data_sz;
+ #endif  // SANITIZER_LINUX && !SANITIZER_ANDROID
+ 
+ struct __sanitizer_iovec {
+-- 
+2.43.0
+
diff --git a/package/gcc-bpf/13.4.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch b/package/gcc-bpf/13.4.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch
new file mode 100644
index 0000000000..13f7f469c4
--- /dev/null
+++ b/package/gcc-bpf/13.4.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch
@@ -0,0 +1,81 @@
+From d32ece49d32b00448d967e7dbc6900fb25cbc775 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 2 May 2025 17:41:43 +0200
+Subject: [PATCH] libsanitizer: Fix build with glibc 2.42
+
+The termio structure will be removed from glibc 2.42.  It has
+been deprecated since the late 80s/early 90s.
+
+Cherry-picked from LLVM commit 59978b21ad9c65276ee8e14f26759691b8a65763
+("[sanitizer_common] Remove interceptors for deprecated struct termio
+(#137403)").
+
+Co-Authored-By: Tom Stellard <tstellar@redhat.com>
+
+libsanitizer/
+
+	* sanitizer_common/sanitizer_common_interceptors_ioctl.inc: Cherry
+	picked from LLVM commit 59978b21ad9c65276ee8e14f26759691b8a65763.
+	* sanitizer_common/sanitizer_platform_limits_posix.cpp: Likewise.
+	* sanitizer_common/sanitizer_platform_limits_posix.h: Likewise.
+
+Upstream: 1789c57dc97ea2f9819ef89e28bf17208b6208e7 (gcc master branch)
+Upstream: d32ece49d32b00448d967e7dbc6900fb25cbc775 (gcc 15.x branch)
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ .../sanitizer_common_interceptors_ioctl.inc               | 8 --------
+ .../sanitizer_common/sanitizer_platform_limits_posix.cpp  | 3 ---
+ .../sanitizer_common/sanitizer_platform_limits_posix.h    | 1 -
+ 3 files changed, 12 deletions(-)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
+index 49ec4097c90..dda11daa77f 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
++++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
+@@ -338,17 +338,9 @@ static void ioctl_table_fill() {
+   _(SOUND_PCM_WRITE_CHANNELS, WRITE, sizeof(int));
+   _(SOUND_PCM_WRITE_FILTER, WRITE, sizeof(int));
+   _(TCFLSH, NONE, 0);
+-#if SANITIZER_GLIBC
+-  _(TCGETA, WRITE, struct_termio_sz);
+-#endif
+   _(TCGETS, WRITE, struct_termios_sz);
+   _(TCSBRK, NONE, 0);
+   _(TCSBRKP, NONE, 0);
+-#if SANITIZER_GLIBC
+-  _(TCSETA, READ, struct_termio_sz);
+-  _(TCSETAF, READ, struct_termio_sz);
+-  _(TCSETAW, READ, struct_termio_sz);
+-#endif
+   _(TCSETS, READ, struct_termios_sz);
+   _(TCSETSF, READ, struct_termios_sz);
+   _(TCSETSW, READ, struct_termios_sz);
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+index c87d5ef42c9..7bbc6f2edac 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+@@ -485,9 +485,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
+   unsigned struct_input_id_sz = sizeof(struct input_id);
+   unsigned struct_mtpos_sz = sizeof(struct mtpos);
+   unsigned struct_rtentry_sz = sizeof(struct rtentry);
+-#if SANITIZER_GLIBC || SANITIZER_ANDROID
+-  unsigned struct_termio_sz = sizeof(struct termio);
+-#endif
+   unsigned struct_vt_consize_sz = sizeof(struct vt_consize);
+   unsigned struct_vt_sizes_sz = sizeof(struct vt_sizes);
+   unsigned struct_vt_stat_sz = sizeof(struct vt_stat);
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+index c07f7cd0b0d..a80df656826 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+@@ -1029,7 +1029,6 @@ extern unsigned struct_hd_geometry_sz;
+ extern unsigned struct_input_absinfo_sz;
+ extern unsigned struct_input_id_sz;
+ extern unsigned struct_mtpos_sz;
+-extern unsigned struct_termio_sz;
+ extern unsigned struct_vt_consize_sz;
+ extern unsigned struct_vt_sizes_sz;
+ extern unsigned struct_vt_stat_sz;
+-- 
+2.50.1
+
diff --git a/package/gcc-bpf/14.3.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc-bpf/14.3.0/0001-disable-split-stack-for-non-thread-builds.patch
new file mode 100644
index 0000000000..e801085dad
--- /dev/null
+++ b/package/gcc-bpf/14.3.0/0001-disable-split-stack-for-non-thread-builds.patch
@@ -0,0 +1,26 @@
+From 4f67134e0b1404fef4ea72342be8fab4c37ca8c8 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Mon, 25 Jul 2022 00:29:55 +0200
+Subject: [PATCH] disable split-stack for non-thread builds
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Romain: convert to git format]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ libgcc/config/t-stack | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libgcc/config/t-stack b/libgcc/config/t-stack
+index cc0366b4cd8..f3f97e86d60 100644
+--- a/libgcc/config/t-stack
++++ b/libgcc/config/t-stack
+@@ -1,4 +1,6 @@
+ # Makefile fragment to provide generic support for -fsplit-stack.
+ # This should be used in config.host for any host which supports
+ # -fsplit-stack.
++ifeq ($(enable_threads),yes)
+ LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
++endif
+-- 
+2.34.3
+
diff --git a/package/gcc-bpf/14.3.0/0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch b/package/gcc-bpf/14.3.0/0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
new file mode 100644
index 0000000000..b9dfcd0d01
--- /dev/null
+++ b/package/gcc-bpf/14.3.0/0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
@@ -0,0 +1,53 @@
+From 71de45698f60f8feabc0e91336f1e2fb387902df Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Thu, 18 Jul 2024 23:13:41 +0200
+Subject: [PATCH] libsanitizer: also undef _TIME_BITS in
+ sanitizer_procmaps_solaris.cpp
+
+Upstream commit
+https://github.com/llvm/llvm-project/commit/26800a2c7e7996dc773b4e990dd5cca41c45e1a9
+of LLVM added a #undef _TIME_BITS in
+libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp to
+fix the build on 32-bit Linux platforms that have enabled 64-bit
+time_t using _TIME_BITS=64.
+
+Indeed, _TIME_BITS=64 can only be used when _FILE_OFFSET_BITS=64, but
+sanitizer_platform_limits_posix.cpp undefines _FILE_OFFSET_BITS before
+including any header file. To fix this, the upstream fix was to also
+undef _TIME_BITS.
+
+This commit simply does the same in sanitizer_procmaps_solaris.cpp,
+which also gets compiled under Linux (despite what the file name
+says). In practice on Linux hosts (where _TIME_BITS=64 matters),
+sanitizer_procmaps_solaris.cpp will expand to nothing, as pretty much
+the rest of the file is inside a #ifdef SANITIZER_SOLARIS...#endif. So
+the #undef _FILE_OFFSET_BITS and #undef _TIME_BITS are only here
+before including sanitizer_platform.h, which will set the
+SANITIZER_LINUX/SANITIZER_SOLARIS define depending on the platform.
+
+Fixes:
+
+armeb-buildroot-linux-gnueabi/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
+   26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
+
+Upstream: https://gcc.gnu.org/pipermail/gcc-patches/2024-July/657811.html
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp b/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
+index eeb49e2afe3..1b23fd4d512 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
++++ b/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
+@@ -11,6 +11,7 @@
+ 
+ // Before Solaris 11.4, <procfs.h> doesn't work in a largefile environment.
+ #undef _FILE_OFFSET_BITS
++#undef _TIME_BITS
+ #include "sanitizer_platform.h"
+ #if SANITIZER_SOLARIS
+ #  include <fcntl.h>
+-- 
+2.45.2
+
diff --git a/package/gcc-bpf/14.3.0/0003-microblaze-add-atomic-test-and-set-support.patch b/package/gcc-bpf/14.3.0/0003-microblaze-add-atomic-test-and-set-support.patch
new file mode 100644
index 0000000000..db6aefaef2
--- /dev/null
+++ b/package/gcc-bpf/14.3.0/0003-microblaze-add-atomic-test-and-set-support.patch
@@ -0,0 +1,286 @@
+From cd01b277c4a9e03c83427290228e4b289a169431 Mon Sep 17 00:00:00 2001
+From: Gopi Kumar Bulusu <gopi@sankhya.com>
+Date: Thu, 10 Jul 2025 12:44:44 +0530
+Subject: [PATCH] MicroBlaze : Enhance support for atomics. Fix PR118280
+
+Atomic support enhanced to fix existing atomic_compare_and_swapsi pattern
+to handle side effects; new patterns atomic_fetch_op and atomic_test_and_set
+added. As MicroBlaze has no QImode test/set instruction, use shift magic
+to implement atomic_test_and_set. This fixes PR118280.
+
+Files Changed
+
+* gcc/config/microblaze/iterators.md: New
+* microblaze-protos.h/microblaze.cc : Add microblaze_subword_address
+* gcc/config/microblaze/microblaze.md: constants: Add UNSPECV_CAS_BOOL,
+  UNSPECV_CAS_MEM, UNSPECV_CAS_VAL, UNSPECV_ATOMIC_FETCH_OP
+  type: add atomic
+* gcc/config/microblaze/sync.md: Add atomic_fetch_<atomic_optab>si
+  atomic_test_and_set
+
+Fixes: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118280
+Upstream: https://patchwork.ozlabs.org/project/gcc/list/?series=466193
+
+Signed-off-by: Kirk Meyer <kirk.meyer@sencore.com>
+Signed-off-by: David Holsgrove <david.holsgrove@xilinx.com>
+Signed-off-by: Gopi Kumar Bulusu <gopi@sankhya.com>
+---
+ gcc/config/microblaze/iterators.md        |  25 +++++
+ gcc/config/microblaze/microblaze-protos.h |   1 +
+ gcc/config/microblaze/microblaze.cc       |  28 ++++++
+ gcc/config/microblaze/microblaze.h        |   2 +-
+ gcc/config/microblaze/microblaze.md       |   7 +-
+ gcc/config/microblaze/sync.md             | 107 ++++++++++++++++++----
+ 6 files changed, 150 insertions(+), 20 deletions(-)
+ create mode 100644 gcc/config/microblaze/iterators.md
+
+diff --git a/gcc/config/microblaze/iterators.md b/gcc/config/microblaze/iterators.md
+new file mode 100644
+index 00000000000..2ffc2422a0a
+--- /dev/null
++++ b/gcc/config/microblaze/iterators.md
+@@ -0,0 +1,25 @@ 
++;; Iterator definitions for GCC MicroBlaze machine description files.
++;; Copyright (C) 2012-2024 Free Software Foundation, Inc.
++;;
++;; This file is part of GCC.
++;;
++;; GCC is free software; you can redistribute it and/or modify
++;; it under the terms of the GNU General Public License as published by
++;; the Free Software Foundation; either version 3, or (at your option)
++;; any later version.
++;;
++;; GCC is distributed in the hope that it will be useful,
++;; but WITHOUT ANY WARRANTY; without even the implied warranty of
++;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++;; GNU General Public License for more details.
++;;
++;; You should have received a copy of the GNU General Public License
++;; along with GCC; see the file COPYING3.  If not see
++;; <http://www.gnu.org/licenses/>.
++
++; atomics code iterator
++(define_code_iterator any_atomic [plus ior xor and])
++
++; atomics code attribute
++(define_code_attr atomic_optab
++  [(plus "add") (ior "or") (xor "xor") (and "and")])
+diff --git a/gcc/config/microblaze/microblaze-protos.h b/gcc/config/microblaze/microblaze-protos.h
+index 90b79cfe716..1cee0b3096c 100644
+--- a/gcc/config/microblaze/microblaze-protos.h
++++ b/gcc/config/microblaze/microblaze-protos.h
+@@ -62,6 +62,7 @@  extern int symbol_mentioned_p (rtx);
+ extern int label_mentioned_p (rtx);
+ extern bool microblaze_cannot_force_const_mem (machine_mode, rtx);
+ extern void microblaze_eh_return (rtx op0);
++extern void microblaze_subword_address (rtx, rtx *, rtx *);
+ #endif  /* RTX_CODE */
+ 
+ /* Declare functions in microblaze-c.cc.  */
+diff --git a/gcc/config/microblaze/microblaze.cc b/gcc/config/microblaze/microblaze.cc
+index 2ab5ada4ec9..80d10ab60e0 100644
+--- a/gcc/config/microblaze/microblaze.cc
++++ b/gcc/config/microblaze/microblaze.cc
+@@ -1299,6 +1299,34 @@  microblaze_expand_block_move (rtx dest, rtx src, rtx length, rtx align_rtx)
+   return false;
+ }
+ 
++/* Compute memory address *aligned_mem and corresponding shift value (*shift)
++   from a QImode memory reference MEM */
++void
++microblaze_subword_address (rtx mem, rtx *aligned_mem, rtx *shift)
++{
++  /* Align the memory address to a word.  */
++  rtx addr = force_reg (Pmode, XEXP (mem, 0));
++
++  rtx addr_mask = gen_int_mode (-4, Pmode);
++
++  rtx aligned_addr = gen_reg_rtx (Pmode);
++
++  emit_move_insn (aligned_addr,  gen_rtx_AND (Pmode, addr, addr_mask));
++
++  *aligned_mem = change_address (mem, SImode, aligned_addr);
++
++  /* Calculate the shift amount.  */
++  emit_move_insn (*shift, gen_rtx_AND (SImode, addr, gen_int_mode (3, SImode)));
++
++  if (TARGET_LITTLE_ENDIAN == 0) {
++    emit_move_insn (*shift,
++		    gen_rtx_MINUS (SImode, gen_int_mode (3, SImode), *shift));
++  }
++
++  emit_move_insn (*shift, gen_rtx_ASHIFT (SImode, *shift,
++					  gen_int_mode (3, SImode)));
++}
++
+ static bool
+ microblaze_rtx_costs (rtx x, machine_mode mode, int outer_code ATTRIBUTE_UNUSED,
+ 		      int opno ATTRIBUTE_UNUSED, int *total,
+diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
+index 2390542434b..b2e9ccde363 100644
+--- a/gcc/config/microblaze/microblaze.h
++++ b/gcc/config/microblaze/microblaze.h
+@@ -57,7 +57,7 @@  extern enum pipeline_type microblaze_pipe;
+ 
+ /* Default target_flags if no switches are specified  */
+ #define TARGET_DEFAULT      (MASK_SOFT_MUL | MASK_SOFT_DIV | MASK_SOFT_FLOAT \
+-                             | TARGET_ENDIAN_DEFAULT)
++			      | TARGET_ENDIAN_DEFAULT)
+ 
+ /* Do we have CLZ?  */
+ #define TARGET_HAS_CLZ      (TARGET_PATTERN_COMPARE && microblaze_has_clz)
+diff --git a/gcc/config/microblaze/microblaze.md b/gcc/config/microblaze/microblaze.md
+index 45c48a71e8d..270df8da0c5 100644
+--- a/gcc/config/microblaze/microblaze.md
++++ b/gcc/config/microblaze/microblaze.md
+@@ -21,6 +21,7 @@ 
+ 
+ (include "constraints.md")
+ (include "predicates.md")
++(include "iterators.md")
+ 
+ ;;----------------------------------------------------
+ ;; Constants
+@@ -43,6 +44,10 @@ 
+   (UNSPEC_TLS           106)    ;; jump table
+   (UNSPEC_SET_TEXT      107)    ;; set text start
+   (UNSPEC_TEXT          108)    ;; data text relative
++  (UNSPECV_CAS_BOOL     201)    ;; compare and swap (bool)
++  (UNSPECV_CAS_VAL      202)    ;; compare and swap (val)
++  (UNSPECV_CAS_MEM      203)    ;; compare and swap (mem)
++  (UNSPECV_ATOMIC_FETCH_OP     204)    ;; atomic fetch op
+ ])
+ 
+ (define_c_enum "unspec" [
+@@ -79,7 +84,7 @@ 
+ ;; bshift 	Shift operations
+ 
+ (define_attr "type"
+-  "unknown,branch,jump,call,load,store,move,arith,darith,imul,idiv,icmp,multi,nop,no_delay_arith,no_delay_load,no_delay_store,no_delay_imul,no_delay_move,bshift,fadd,frsub,fmul,fdiv,fcmp,fsl,fsqrt,fcvt,trap"
++  "unknown,branch,jump,call,load,store,move,arith,darith,imul,idiv,icmp,multi,nop,no_delay_arith,no_delay_load,no_delay_store,no_delay_imul,no_delay_move,bshift,fadd,frsub,fmul,fdiv,fcmp,fsl,fsqrt,fcvt,trap,atomic"
+   (const_string "unknown"))
+ 
+ ;; Main data type used by the insn
+diff --git a/gcc/config/microblaze/sync.md b/gcc/config/microblaze/sync.md
+index db7b11e5379..6478ab6dcac 100644
+--- a/gcc/config/microblaze/sync.md
++++ b/gcc/config/microblaze/sync.md
+@@ -18,26 +18,97 @@ 
+ ;; <http://www.gnu.org/licenses/>.
+ 
+ (define_insn "atomic_compare_and_swapsi"
+-  [(match_operand:SI 0 "register_operand" "=&d")	;; bool output
+-   (match_operand:SI 1 "register_operand" "=&d")	;; val output
+-   (match_operand:SI 2 "nonimmediate_operand" "+Q")	;; memory
+-   (match_operand:SI 3 "register_operand" "d")		;; expected value
+-   (match_operand:SI 4 "register_operand" "d")		;; desired value
+-   (match_operand:SI 5 "const_int_operand" "")		;; is_weak
+-   (match_operand:SI 6 "const_int_operand" "")		;; mod_s
+-   (match_operand:SI 7 "const_int_operand" "")		;; mod_f
++  [(set (match_operand:SI 0 "register_operand" "=&d")		;; bool output
++        (unspec_volatile:SI
++          [(match_operand:SI 2 "nonimmediate_operand" "+Q")	;; memory
++           (match_operand:SI 3 "register_operand" "d")		;; expected value
++           (match_operand:SI 4 "register_operand" "d")]		;; desired value
++          UNSPECV_CAS_BOOL))
++   (set (match_operand:SI 1 "register_operand" "=&d")		;; val output
++        (unspec_volatile:SI [(const_int 0)] UNSPECV_CAS_VAL))
++   (set (match_dup 2)
++        (unspec_volatile:SI [(const_int 0)] UNSPECV_CAS_MEM))
++   (match_operand:SI 5 "const_int_operand" "")			;; is_weak
++   (match_operand:SI 6 "const_int_operand" "")			;; mod_s
++   (match_operand:SI 7 "const_int_operand" "")			;; mod_f
+    (clobber (match_scratch:SI 8 "=&d"))]
+   ""
+   {
+-    output_asm_insn ("addc \tr0,r0,r0", operands);
+-    output_asm_insn ("lwx  \t%1,%y2,r0", operands);
+-    output_asm_insn ("addic\t%8,r0,0", operands);
+-    output_asm_insn ("bnei \t%8,.-8", operands);
+-    output_asm_insn ("cmp  \t%0,%1,%3", operands);
+-    output_asm_insn ("bnei \t%0,.+16", operands);
+-    output_asm_insn ("swx  \t%4,%y2,r0", operands);
+-    output_asm_insn ("addic\t%8,r0,0", operands);
+-    output_asm_insn ("bnei \t%8,.-28", operands);
+-    return "";
++    return "add  \t%0,r0,r0\n\t"
++      "lwx  \t%1,%y2,r0\n\t"
++      "addic\t%8,r0,0\n\t"
++      "bnei \t%8,.-8\n\t"
++      "cmp  \t%8,%1,%3\n\t"
++      "bnei \t%8,.+20\n\t"
++      "swx  \t%4,%y2,r0\n\t"
++      "addic\t%8,r0,0\n\t"
++      "bnei \t%8,.-28\n\t"
++      "addi \t%0,r0,1";
+   }
++  [(set_attr "type"	"atomic")
++  (set_attr "mode"	"SI")
++  (set_attr "length"	"40")]
+ )
++
++;;
++;;
++;;
++;;
++(define_insn "atomic_fetch_<atomic_optab>si"
++  [(set (match_operand:SI 0 "register_operand" "=&d")
++	(match_operand:SI 1 "memory_operand" "+Q"))
++   (set (match_dup 1)
++	(unspec_volatile:SI
++	  [(any_atomic:SI (match_dup 1)
++		   (match_operand:SI 2 "register_operand" "d"))
++	   (match_operand:SI 3 "const_int_operand")] ;; model
++	 UNSPECV_ATOMIC_FETCH_OP))
++   (clobber (match_scratch:SI 4 "=&d"))]	  ;; tmp_1
++  ""
++  {
++    return 
++      "lwx  \t%0,%y1,r0\n\t"
++      "addic\t%4,r0,0\n\t"
++      "bnei \t%4,.-8\n\t"
++      "<atomic_optab>\t%4,%0,%2\n\t"
++      "swx  \t%4,%y1,r0\n\t"
++      "addic\t%4,r0,0\n\t"
++      "bnei \t%4,.-24";
++  }
++  [(set_attr "type"	"atomic")
++  (set_attr "mode"	"SI")
++  (set_attr "length"	"28")])
++
++;;
++;; MicroBlaze only supports lx/sx instructions for word mode only
++;;
++;; Use shift|mask magic to implement atomic_test_and_set using lwx/swx
++;;
++(define_expand "atomic_test_and_set"
++  [(match_operand:QI 0 "register_operand" "")    ;; bool output
++   (match_operand:QI 1 "memory_operand" "m")    ;; memory
++   (match_operand:SI 2 "const_int_operand" "")]  ;; model
++  ""
++{
++  rtx old = gen_reg_rtx (SImode);
++  rtx mem = operands[1];
++  rtx model = operands[2];
++  rtx set = gen_reg_rtx (SImode);
++  rtx aligned_mem = gen_reg_rtx (SImode);
++  rtx shift = gen_reg_rtx (SImode);
++
++  microblaze_subword_address (mem, &aligned_mem, &shift);
++
++  emit_move_insn (set, GEN_INT (1));
++  rtx shifted_set = gen_reg_rtx (SImode);
++
++  emit_move_insn (shifted_set, gen_rtx_ASHIFT (SImode, set, shift));
++
++  emit_insn (gen_atomic_fetch_orsi (old, aligned_mem, shifted_set, model));
++
++  emit_move_insn (old, gen_rtx_ASHIFTRT (SImode, old, shift));
++
++  emit_move_insn (operands[0], gen_lowpart (QImode, old));
++
++  DONE;
++})
+-- 
+2.43.5
+
diff --git a/package/gcc-bpf/14.3.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch b/package/gcc-bpf/14.3.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch
new file mode 100644
index 0000000000..13f7f469c4
--- /dev/null
+++ b/package/gcc-bpf/14.3.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch
@@ -0,0 +1,81 @@
+From d32ece49d32b00448d967e7dbc6900fb25cbc775 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 2 May 2025 17:41:43 +0200
+Subject: [PATCH] libsanitizer: Fix build with glibc 2.42
+
+The termio structure will be removed from glibc 2.42.  It has
+been deprecated since the late 80s/early 90s.
+
+Cherry-picked from LLVM commit 59978b21ad9c65276ee8e14f26759691b8a65763
+("[sanitizer_common] Remove interceptors for deprecated struct termio
+(#137403)").
+
+Co-Authored-By: Tom Stellard <tstellar@redhat.com>
+
+libsanitizer/
+
+	* sanitizer_common/sanitizer_common_interceptors_ioctl.inc: Cherry
+	picked from LLVM commit 59978b21ad9c65276ee8e14f26759691b8a65763.
+	* sanitizer_common/sanitizer_platform_limits_posix.cpp: Likewise.
+	* sanitizer_common/sanitizer_platform_limits_posix.h: Likewise.
+
+Upstream: 1789c57dc97ea2f9819ef89e28bf17208b6208e7 (gcc master branch)
+Upstream: d32ece49d32b00448d967e7dbc6900fb25cbc775 (gcc 15.x branch)
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ .../sanitizer_common_interceptors_ioctl.inc               | 8 --------
+ .../sanitizer_common/sanitizer_platform_limits_posix.cpp  | 3 ---
+ .../sanitizer_common/sanitizer_platform_limits_posix.h    | 1 -
+ 3 files changed, 12 deletions(-)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
+index 49ec4097c90..dda11daa77f 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
++++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
+@@ -338,17 +338,9 @@ static void ioctl_table_fill() {
+   _(SOUND_PCM_WRITE_CHANNELS, WRITE, sizeof(int));
+   _(SOUND_PCM_WRITE_FILTER, WRITE, sizeof(int));
+   _(TCFLSH, NONE, 0);
+-#if SANITIZER_GLIBC
+-  _(TCGETA, WRITE, struct_termio_sz);
+-#endif
+   _(TCGETS, WRITE, struct_termios_sz);
+   _(TCSBRK, NONE, 0);
+   _(TCSBRKP, NONE, 0);
+-#if SANITIZER_GLIBC
+-  _(TCSETA, READ, struct_termio_sz);
+-  _(TCSETAF, READ, struct_termio_sz);
+-  _(TCSETAW, READ, struct_termio_sz);
+-#endif
+   _(TCSETS, READ, struct_termios_sz);
+   _(TCSETSF, READ, struct_termios_sz);
+   _(TCSETSW, READ, struct_termios_sz);
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+index c87d5ef42c9..7bbc6f2edac 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+@@ -485,9 +485,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
+   unsigned struct_input_id_sz = sizeof(struct input_id);
+   unsigned struct_mtpos_sz = sizeof(struct mtpos);
+   unsigned struct_rtentry_sz = sizeof(struct rtentry);
+-#if SANITIZER_GLIBC || SANITIZER_ANDROID
+-  unsigned struct_termio_sz = sizeof(struct termio);
+-#endif
+   unsigned struct_vt_consize_sz = sizeof(struct vt_consize);
+   unsigned struct_vt_sizes_sz = sizeof(struct vt_sizes);
+   unsigned struct_vt_stat_sz = sizeof(struct vt_stat);
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+index c07f7cd0b0d..a80df656826 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+@@ -1029,7 +1029,6 @@ extern unsigned struct_hd_geometry_sz;
+ extern unsigned struct_input_absinfo_sz;
+ extern unsigned struct_input_id_sz;
+ extern unsigned struct_mtpos_sz;
+-extern unsigned struct_termio_sz;
+ extern unsigned struct_vt_consize_sz;
+ extern unsigned struct_vt_sizes_sz;
+ extern unsigned struct_vt_stat_sz;
+-- 
+2.50.1
+
diff --git a/package/gcc-bpf/15.2.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc-bpf/15.2.0/0001-disable-split-stack-for-non-thread-builds.patch
new file mode 100644
index 0000000000..c3b600cfb8
--- /dev/null
+++ b/package/gcc-bpf/15.2.0/0001-disable-split-stack-for-non-thread-builds.patch
@@ -0,0 +1,26 @@
+From 7d5f59e035341430e20f47420535d0e987516e55 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Mon, 25 Jul 2022 00:29:55 +0200
+Subject: [PATCH] disable split-stack for non-thread builds
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Romain: convert to git format]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ libgcc/config/t-stack | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libgcc/config/t-stack b/libgcc/config/t-stack
+index cc0366b4cd8..f3f97e86d60 100644
+--- a/libgcc/config/t-stack
++++ b/libgcc/config/t-stack
+@@ -1,4 +1,6 @@
+ # Makefile fragment to provide generic support for -fsplit-stack.
+ # This should be used in config.host for any host which supports
+ # -fsplit-stack.
++ifeq ($(enable_threads),yes)
+ LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
++endif
+-- 
+2.50.1
+
diff --git a/package/gcc-bpf/15.2.0/0002-MicroBlaze-Enhance-support-for-atomics.-Fix-PR118280.patch b/package/gcc-bpf/15.2.0/0002-MicroBlaze-Enhance-support-for-atomics.-Fix-PR118280.patch
new file mode 100644
index 0000000000..958339bf6c
--- /dev/null
+++ b/package/gcc-bpf/15.2.0/0002-MicroBlaze-Enhance-support-for-atomics.-Fix-PR118280.patch
@@ -0,0 +1,286 @@
+From f14e0b13a5abbc15b4b3b4c0c6a125bbb0509465 Mon Sep 17 00:00:00 2001
+From: Gopi Kumar Bulusu <gopi@sankhya.com>
+Date: Thu, 10 Jul 2025 12:44:44 +0530
+Subject: [PATCH] MicroBlaze : Enhance support for atomics. Fix PR118280
+
+Atomic support enhanced to fix existing atomic_compare_and_swapsi pattern
+to handle side effects; new patterns atomic_fetch_op and atomic_test_and_set
+added. As MicroBlaze has no QImode test/set instruction, use shift magic
+to implement atomic_test_and_set. This fixes PR118280.
+
+Files Changed
+
+* gcc/config/microblaze/iterators.md: New
+* microblaze-protos.h/microblaze.cc : Add microblaze_subword_address
+* gcc/config/microblaze/microblaze.md: constants: Add UNSPECV_CAS_BOOL,
+  UNSPECV_CAS_MEM, UNSPECV_CAS_VAL, UNSPECV_ATOMIC_FETCH_OP
+  type: add atomic
+* gcc/config/microblaze/sync.md: Add atomic_fetch_<atomic_optab>si
+  atomic_test_and_set
+
+Fixes: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118280
+Upstream: https://patchwork.ozlabs.org/project/gcc/list/?series=466193
+
+Signed-off-by: Kirk Meyer <kirk.meyer@sencore.com>
+Signed-off-by: David Holsgrove <david.holsgrove@xilinx.com>
+Signed-off-by: Gopi Kumar Bulusu <gopi@sankhya.com>
+---
+ gcc/config/microblaze/iterators.md        |  25 +++++
+ gcc/config/microblaze/microblaze-protos.h |   1 +
+ gcc/config/microblaze/microblaze.cc       |  28 ++++++
+ gcc/config/microblaze/microblaze.h        |   2 +-
+ gcc/config/microblaze/microblaze.md       |   7 +-
+ gcc/config/microblaze/sync.md             | 107 ++++++++++++++++++----
+ 6 files changed, 150 insertions(+), 20 deletions(-)
+ create mode 100644 gcc/config/microblaze/iterators.md
+
+diff --git a/gcc/config/microblaze/iterators.md b/gcc/config/microblaze/iterators.md
+new file mode 100644
+index 00000000000..2ffc2422a0a
+--- /dev/null
++++ b/gcc/config/microblaze/iterators.md
+@@ -0,0 +1,25 @@
++;; Iterator definitions for GCC MicroBlaze machine description files.
++;; Copyright (C) 2012-2024 Free Software Foundation, Inc.
++;;
++;; This file is part of GCC.
++;;
++;; GCC is free software; you can redistribute it and/or modify
++;; it under the terms of the GNU General Public License as published by
++;; the Free Software Foundation; either version 3, or (at your option)
++;; any later version.
++;;
++;; GCC is distributed in the hope that it will be useful,
++;; but WITHOUT ANY WARRANTY; without even the implied warranty of
++;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++;; GNU General Public License for more details.
++;;
++;; You should have received a copy of the GNU General Public License
++;; along with GCC; see the file COPYING3.  If not see
++;; <http://www.gnu.org/licenses/>.
++
++; atomics code iterator
++(define_code_iterator any_atomic [plus ior xor and])
++
++; atomics code attribute
++(define_code_attr atomic_optab
++  [(plus "add") (ior "or") (xor "xor") (and "and")])
+diff --git a/gcc/config/microblaze/microblaze-protos.h b/gcc/config/microblaze/microblaze-protos.h
+index 90b79cfe716..1cee0b3096c 100644
+--- a/gcc/config/microblaze/microblaze-protos.h
++++ b/gcc/config/microblaze/microblaze-protos.h
+@@ -62,6 +62,7 @@ extern int symbol_mentioned_p (rtx);
+ extern int label_mentioned_p (rtx);
+ extern bool microblaze_cannot_force_const_mem (machine_mode, rtx);
+ extern void microblaze_eh_return (rtx op0);
++extern void microblaze_subword_address (rtx, rtx *, rtx *);
+ #endif  /* RTX_CODE */
+ 
+ /* Declare functions in microblaze-c.cc.  */
+diff --git a/gcc/config/microblaze/microblaze.cc b/gcc/config/microblaze/microblaze.cc
+index 4b7f0a1a5e0..78b9428ef3b 100644
+--- a/gcc/config/microblaze/microblaze.cc
++++ b/gcc/config/microblaze/microblaze.cc
+@@ -1300,6 +1300,34 @@ microblaze_expand_block_move (rtx dest, rtx src, rtx length, rtx align_rtx)
+   return false;
+ }
+ 
++/* Compute memory address *aligned_mem and corresponding shift value (*shift)
++   from a QImode memory reference MEM */
++void
++microblaze_subword_address (rtx mem, rtx *aligned_mem, rtx *shift)
++{
++  /* Align the memory address to a word.  */
++  rtx addr = force_reg (Pmode, XEXP (mem, 0));
++
++  rtx addr_mask = gen_int_mode (-4, Pmode);
++
++  rtx aligned_addr = gen_reg_rtx (Pmode);
++
++  emit_move_insn (aligned_addr,  gen_rtx_AND (Pmode, addr, addr_mask));
++
++  *aligned_mem = change_address (mem, SImode, aligned_addr);
++
++  /* Calculate the shift amount.  */
++  emit_move_insn (*shift, gen_rtx_AND (SImode, addr, gen_int_mode (3, SImode)));
++
++  if (TARGET_LITTLE_ENDIAN == 0) {
++    emit_move_insn (*shift,
++		    gen_rtx_MINUS (SImode, gen_int_mode (3, SImode), *shift));
++  }
++
++  emit_move_insn (*shift, gen_rtx_ASHIFT (SImode, *shift,
++					  gen_int_mode (3, SImode)));
++}
++
+ static bool
+ microblaze_rtx_costs (rtx x, machine_mode mode, int outer_code ATTRIBUTE_UNUSED,
+ 		      int opno ATTRIBUTE_UNUSED, int *total,
+diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
+index 2390542434b..b2e9ccde363 100644
+--- a/gcc/config/microblaze/microblaze.h
++++ b/gcc/config/microblaze/microblaze.h
+@@ -57,7 +57,7 @@ extern enum pipeline_type microblaze_pipe;
+ 
+ /* Default target_flags if no switches are specified  */
+ #define TARGET_DEFAULT      (MASK_SOFT_MUL | MASK_SOFT_DIV | MASK_SOFT_FLOAT \
+-                             | TARGET_ENDIAN_DEFAULT)
++			      | TARGET_ENDIAN_DEFAULT)
+ 
+ /* Do we have CLZ?  */
+ #define TARGET_HAS_CLZ      (TARGET_PATTERN_COMPARE && microblaze_has_clz)
+diff --git a/gcc/config/microblaze/microblaze.md b/gcc/config/microblaze/microblaze.md
+index 45c48a71e8d..270df8da0c5 100644
+--- a/gcc/config/microblaze/microblaze.md
++++ b/gcc/config/microblaze/microblaze.md
+@@ -21,6 +21,7 @@
+ 
+ (include "constraints.md")
+ (include "predicates.md")
++(include "iterators.md")
+ 
+ ;;----------------------------------------------------
+ ;; Constants
+@@ -43,6 +44,10 @@
+   (UNSPEC_TLS           106)    ;; jump table
+   (UNSPEC_SET_TEXT      107)    ;; set text start
+   (UNSPEC_TEXT          108)    ;; data text relative
++  (UNSPECV_CAS_BOOL     201)    ;; compare and swap (bool)
++  (UNSPECV_CAS_VAL      202)    ;; compare and swap (val)
++  (UNSPECV_CAS_MEM      203)    ;; compare and swap (mem)
++  (UNSPECV_ATOMIC_FETCH_OP     204)    ;; atomic fetch op
+ ])
+ 
+ (define_c_enum "unspec" [
+@@ -79,7 +84,7 @@
+ ;; bshift 	Shift operations
+ 
+ (define_attr "type"
+-  "unknown,branch,jump,call,load,store,move,arith,darith,imul,idiv,icmp,multi,nop,no_delay_arith,no_delay_load,no_delay_store,no_delay_imul,no_delay_move,bshift,fadd,frsub,fmul,fdiv,fcmp,fsl,fsqrt,fcvt,trap"
++  "unknown,branch,jump,call,load,store,move,arith,darith,imul,idiv,icmp,multi,nop,no_delay_arith,no_delay_load,no_delay_store,no_delay_imul,no_delay_move,bshift,fadd,frsub,fmul,fdiv,fcmp,fsl,fsqrt,fcvt,trap,atomic"
+   (const_string "unknown"))
+ 
+ ;; Main data type used by the insn
+diff --git a/gcc/config/microblaze/sync.md b/gcc/config/microblaze/sync.md
+index db7b11e5379..6478ab6dcac 100644
+--- a/gcc/config/microblaze/sync.md
++++ b/gcc/config/microblaze/sync.md
+@@ -18,26 +18,97 @@
+ ;; <http://www.gnu.org/licenses/>.
+ 
+ (define_insn "atomic_compare_and_swapsi"
+-  [(match_operand:SI 0 "register_operand" "=&d")	;; bool output
+-   (match_operand:SI 1 "register_operand" "=&d")	;; val output
+-   (match_operand:SI 2 "nonimmediate_operand" "+Q")	;; memory
+-   (match_operand:SI 3 "register_operand" "d")		;; expected value
+-   (match_operand:SI 4 "register_operand" "d")		;; desired value
+-   (match_operand:SI 5 "const_int_operand" "")		;; is_weak
+-   (match_operand:SI 6 "const_int_operand" "")		;; mod_s
+-   (match_operand:SI 7 "const_int_operand" "")		;; mod_f
++  [(set (match_operand:SI 0 "register_operand" "=&d")		;; bool output
++        (unspec_volatile:SI
++          [(match_operand:SI 2 "nonimmediate_operand" "+Q")	;; memory
++           (match_operand:SI 3 "register_operand" "d")		;; expected value
++           (match_operand:SI 4 "register_operand" "d")]		;; desired value
++          UNSPECV_CAS_BOOL))
++   (set (match_operand:SI 1 "register_operand" "=&d")		;; val output
++        (unspec_volatile:SI [(const_int 0)] UNSPECV_CAS_VAL))
++   (set (match_dup 2)
++        (unspec_volatile:SI [(const_int 0)] UNSPECV_CAS_MEM))
++   (match_operand:SI 5 "const_int_operand" "")			;; is_weak
++   (match_operand:SI 6 "const_int_operand" "")			;; mod_s
++   (match_operand:SI 7 "const_int_operand" "")			;; mod_f
+    (clobber (match_scratch:SI 8 "=&d"))]
+   ""
+   {
+-    output_asm_insn ("addc \tr0,r0,r0", operands);
+-    output_asm_insn ("lwx  \t%1,%y2,r0", operands);
+-    output_asm_insn ("addic\t%8,r0,0", operands);
+-    output_asm_insn ("bnei \t%8,.-8", operands);
+-    output_asm_insn ("cmp  \t%0,%1,%3", operands);
+-    output_asm_insn ("bnei \t%0,.+16", operands);
+-    output_asm_insn ("swx  \t%4,%y2,r0", operands);
+-    output_asm_insn ("addic\t%8,r0,0", operands);
+-    output_asm_insn ("bnei \t%8,.-28", operands);
+-    return "";
++    return "add  \t%0,r0,r0\n\t"
++      "lwx  \t%1,%y2,r0\n\t"
++      "addic\t%8,r0,0\n\t"
++      "bnei \t%8,.-8\n\t"
++      "cmp  \t%8,%1,%3\n\t"
++      "bnei \t%8,.+20\n\t"
++      "swx  \t%4,%y2,r0\n\t"
++      "addic\t%8,r0,0\n\t"
++      "bnei \t%8,.-28\n\t"
++      "addi \t%0,r0,1";
+   }
++  [(set_attr "type"	"atomic")
++  (set_attr "mode"	"SI")
++  (set_attr "length"	"40")]
+ )
++
++;;
++;;
++;;
++;;
++(define_insn "atomic_fetch_<atomic_optab>si"
++  [(set (match_operand:SI 0 "register_operand" "=&d")
++	(match_operand:SI 1 "memory_operand" "+Q"))
++   (set (match_dup 1)
++	(unspec_volatile:SI
++	  [(any_atomic:SI (match_dup 1)
++		   (match_operand:SI 2 "register_operand" "d"))
++	   (match_operand:SI 3 "const_int_operand")] ;; model
++	 UNSPECV_ATOMIC_FETCH_OP))
++   (clobber (match_scratch:SI 4 "=&d"))]	  ;; tmp_1
++  ""
++  {
++    return 
++      "lwx  \t%0,%y1,r0\n\t"
++      "addic\t%4,r0,0\n\t"
++      "bnei \t%4,.-8\n\t"
++      "<atomic_optab>\t%4,%0,%2\n\t"
++      "swx  \t%4,%y1,r0\n\t"
++      "addic\t%4,r0,0\n\t"
++      "bnei \t%4,.-24";
++  }
++  [(set_attr "type"	"atomic")
++  (set_attr "mode"	"SI")
++  (set_attr "length"	"28")])
++
++;;
++;; MicroBlaze only supports lx/sx instructions for word mode only
++;;
++;; Use shift|mask magic to implement atomic_test_and_set using lwx/swx
++;;
++(define_expand "atomic_test_and_set"
++  [(match_operand:QI 0 "register_operand" "")    ;; bool output
++   (match_operand:QI 1 "memory_operand" "m")    ;; memory
++   (match_operand:SI 2 "const_int_operand" "")]  ;; model
++  ""
++{
++  rtx old = gen_reg_rtx (SImode);
++  rtx mem = operands[1];
++  rtx model = operands[2];
++  rtx set = gen_reg_rtx (SImode);
++  rtx aligned_mem = gen_reg_rtx (SImode);
++  rtx shift = gen_reg_rtx (SImode);
++
++  microblaze_subword_address (mem, &aligned_mem, &shift);
++
++  emit_move_insn (set, GEN_INT (1));
++  rtx shifted_set = gen_reg_rtx (SImode);
++
++  emit_move_insn (shifted_set, gen_rtx_ASHIFT (SImode, set, shift));
++
++  emit_insn (gen_atomic_fetch_orsi (old, aligned_mem, shifted_set, model));
++
++  emit_move_insn (old, gen_rtx_ASHIFTRT (SImode, old, shift));
++
++  emit_move_insn (operands[0], gen_lowpart (QImode, old));
++
++  DONE;
++})
+-- 
+2.50.1
+
diff --git a/package/gcc-bpf/15.2.0/0003-gcc-config-microblaze-fix-ira-for-GCC15.patch b/package/gcc-bpf/15.2.0/0003-gcc-config-microblaze-fix-ira-for-GCC15.patch
new file mode 100644
index 0000000000..663aab7218
--- /dev/null
+++ b/package/gcc-bpf/15.2.0/0003-gcc-config-microblaze-fix-ira-for-GCC15.patch
@@ -0,0 +1,56 @@
+From d2fdbd8c4abe67eea86877dfb3b3b9d8508c165f Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Wed, 6 Aug 2025 22:32:30 +0200
+Subject: [PATCH] gcc/config/microblaze: fix ira for GCC15
+
+Add new hooks for callee-save on microblaze defined by [1] and
+return 1 to restore the old behavior prior to the commit [3].
+
+Tested with qemu_microblazeel_mmu_defconfig and used to generate
+Microblaze toolchains for the Bootlin toolchains 2025.08-1 [4][5].
+
+Upstream: suggested in the bug report: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=121432#c10
+
+[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=b191e8bdecf881d11c1544c441e38f4c18392a15
+[2] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/i386/i386.cc;h=3128973ba79cccfc6761f451dcb716b9558cc4da;hb=d3ff498c478acefce35de04402f99171b4f64a1a#l20606
+[3] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=3b9b8d6cfdf59337f4b7ce10ce92a98044b2657b
+[4] https://lore.kernel.org/buildroot/87sehzndtp.fsf@dell.be.48ers.dk/T/#mce7decd0b3f6a41008d5de577538a8525c91b374
+[5] https://toolchains.bootlin.com/
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gcc/config/microblaze/microblaze.cc | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/gcc/config/microblaze/microblaze.cc b/gcc/config/microblaze/microblaze.cc
+index 78b9428ef3b..84ea7e8d55a 100644
+--- a/gcc/config/microblaze/microblaze.cc
++++ b/gcc/config/microblaze/microblaze.cc
+@@ -3228,6 +3228,14 @@ microblaze_secondary_reload (bool in_p ATTRIBUTE_UNUSED, rtx x ATTRIBUTE_UNUSED,
+   return NO_REGS;
+ }
+ 
++/* Implement TARGET_CALLEE_SAVE_COST.  */
++static int
++microblaze_callee_save_cost (spill_cost_type, unsigned int hard_regno, machine_mode,
++		       unsigned int, int mem_cost, const HARD_REG_SET &, bool)
++{
++  return 1;
++}
++
+ static void
+ microblaze_globalize_label (FILE * stream, const char *name)
+ {
+@@ -4066,6 +4074,9 @@ microblaze_starting_frame_offset (void)
+ #undef TARGET_SECONDARY_RELOAD
+ #define TARGET_SECONDARY_RELOAD		microblaze_secondary_reload
+ 
++#undef TARGET_CALLEE_SAVE_COST
++#define TARGET_CALLEE_SAVE_COST microblaze_callee_save_cost
++
+ #undef  TARGET_ASM_OUTPUT_MI_THUNK
+ #define TARGET_ASM_OUTPUT_MI_THUNK      microblaze_asm_output_mi_thunk
+ 
+-- 
+2.50.1
+
diff --git a/package/gcc-bpf/Config.in.host b/package/gcc-bpf/Config.in.host
new file mode 100644
index 0000000000..537cd9ba12
--- /dev/null
+++ b/package/gcc-bpf/Config.in.host
@@ -0,0 +1,51 @@
+config BR2_PACKAGE_HOST_GCC_BPF
+	bool "host gcc-bpf"
+	# powerpc spe support has been deprecated since gcc 8.x.
+	depends on !BR2_POWERPC_CPU_HAS_SPE
+	# ARC HS48 rel 31 only supported by gcc arc fork.
+	depends on !BR2_archs4x_rel31
+	select BR2_PACKAGE_HOST_BINUTILS_BPF
+	help
+	  Compile GCC with the BPF target.
+	  Enable if you need to build eBPF objects.
+
+config BR2_PACKAGE_HOST_GCC_BPF_AT_LEAST_13
+	bool
+
+config BR2_PACKAGE_HOST_GCC_BPF_AT_LEAST_14
+	bool
+
+config BR2_PACKAGE_HOST_GCC_BPF_AT_LEAST_15
+	bool
+
+# GCC / binutils compatibility based on
+# https://wiki.osdev.org/Cross-Compiler_Successful_Builds
+if BR2_PACKAGE_HOST_GCC_BPF
+choice
+	prompt "gcc-bpf version"
+	default BR2_PACKAGE_HOST_GCC_BPF_VERSION_15_X
+	help
+	  Select the version of gcc for BPF you wish to use.
+
+config BR2_PACKAGE_HOST_GCC_BPF_VERSION_13_X
+	bool "gcc 13.x"
+	select BR2_PACKAGE_HOST_GCC_BPF_AT_LEAST_13
+	select BR2_PACKAGE_HOST_BINUTILS_BPF_VERSION_2_42_X
+
+config BR2_PACKAGE_HOST_GCC_BPF_VERSION_14_X
+	bool "gcc 14.x"
+	select BR2_PACKAGE_HOST_GCC_BPF_AT_LEAST_14
+	select BR2_PACKAGE_HOST_BINUTILS_BPF_VERSION_2_43_X
+
+config BR2_PACKAGE_HOST_GCC_BPF_VERSION_15_X
+	bool "gcc 15.x"
+	select BR2_PACKAGE_HOST_GCC_BPF_AT_LEAST_15
+	select BR2_PACKAGE_HOST_BINUTILS_BPF_VERSION_2_45_X
+endchoice
+
+config BR2_PACKAGE_HOST_GCC_BPF_VERSION
+	string
+	default "13.4.0"    if BR2_PACKAGE_HOST_GCC_BPF_VERSION_13_X
+	default "14.3.0"    if BR2_PACKAGE_HOST_GCC_BPF_VERSION_14_X
+	default "15.2.0"    if BR2_PACKAGE_HOST_GCC_BPF_VERSION_15_X
+endif
diff --git a/package/gcc-bpf/gcc-bpf.hash b/package/gcc-bpf/gcc-bpf.hash
new file mode 100644
index 0000000000..ce4b419e06
--- /dev/null
+++ b/package/gcc-bpf/gcc-bpf.hash
@@ -0,0 +1,13 @@
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-13.4.0/sha512.sum
+sha512  9b4b83ecf51ef355b868608b8d257b2fa435c06d2719cb86657a7c2c2a0828ff4ce04e9bac1055bbcad8ed5b4da524cafaef654785e23a50233d95d89201e35f  gcc-13.4.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-14.3.0/sha512.sum
+sha512  cb4e3259640721bbd275c723fe4df53d12f9b1673afb3db274c22c6aa457865dccf2d6ea20b4fd4c591f6152e6d4b87516c402015900f06ce9d43af66d3b7a93  gcc-14.3.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-15.2.0/sha512.sum
+sha512  89047a2e07bd9da265b507b516ed3635adb17491c7f4f67cf090f0bd5b3fc7f2ee6e4cc4008beef7ca884b6b71dffe2bb652b21f01a702e17b468cca2d10b2de  gcc-15.2.0.tar.xz
+
+# Locally calculated
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
+sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING3.LIB
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
+sha256  9d6b43ce4d8de0c878bf16b54d8e7a10d9bd42b75178153e3af6a815bdc90f74  COPYING.RUNTIME
diff --git a/package/gcc-bpf/gcc-bpf.mk b/package/gcc-bpf/gcc-bpf.mk
new file mode 100644
index 0000000000..32d4acb312
--- /dev/null
+++ b/package/gcc-bpf/gcc-bpf.mk
@@ -0,0 +1,81 @@
+################################################################################
+#
+# gcc-bpf
+#
+################################################################################
+
+HOST_GCC_BPF_VERSION = $(call qstrip,$(BR2_PACKAGE_HOST_GCC_BPF_VERSION))
+HOST_GCC_BPF_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(HOST_GCC_BPF_VERSION)
+HOST_GCC_BPF_SOURCE = gcc-$(HOST_GCC_BPF_VERSION).tar.xz
+HOST_GCC_BPF_DEPENDENCIES = host-binutils-bpf
+HOST_GCC_BPF_DEPENDENCIES += \
+	host-gmp \
+	host-mpc \
+	host-mpfr
+
+HOST_GCC_BPF_EXCLUDES = $(HOST_GCC_EXCLUDES)
+# HOST_GCC_BPF_EXCLUDES += gotools/* libada/* libgomp/* libgrust/*
+HOST_GCC_BPF_TARGET_NAME = $(HOST_BINUTILS_BPF_TARGET_NAME)
+
+# gcc doesn't support in-tree build, so we create a 'build'
+# subdirectory in the gcc sources, and build from there.
+HOST_GCC_BPF_SUBDIR = build
+
+HOST_GCC_BPF_PRE_CONFIGURE_HOOKS += HOST_GCC_CONFIGURE_SYMLINK
+HOST_GCC_BPF_MAKE_OPTS += --print-directory
+
+HOST_GCC_BPF_CONF_OPTS = \
+	--target="$(HOST_GCC_BPF_TARGET_NAME)" \
+	--prefix="$(HOST_DIR)" \
+	--sysconfdir="$(HOST_DIR)/etc" \
+	--enable-languages=c \
+	--with-gnu-ld \
+	--enable-static \
+	--disable-decimal-float \
+	--disable-gcov \
+	--disable-libssp \
+	--disable-multilib \
+	--disable-shared \
+	--with-gmp=$(HOST_DIR) \
+	--with-mpc=$(HOST_DIR) \
+	--with-mpfr=$(HOST_DIR) \
+	--with-pkgversion="Buildroot $(BR2_VERSION_FULL)" \
+	--with-bugurl="http://bugs.buildroot.net/" \
+	--without-zstd
+
+# Don't build documentation. It takes up extra space / build time,
+# and sometimes needs specific makeinfo versions to work. Override the check
+# for a modern makeinfo otherwise the configure scripts will still enable it.
+# HOST_GCC_COMMON_CONF_ENV = \
+# 	MAKEINFO=missing
+# HOST_GCC_COMMON_MAKE_OPTS = \
+# 	gcc_cv_prog_makeinfo_modern=no
+
+# Target binaries and libraries which are being built as a part of GCC
+# don't use Buildroot toolchain wrapper because, instead its very own "xgcc"
+# binary is used. And so we need to explicitly propagate ALL the flags
+# directly to "xgcc" and that is done via configure-time environment
+# variables, see below setup of HOST_GCC_COMMON_CONF_ENV.
+GCC_BPF_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS) $(ARCH_TOOLCHAIN_WRAPPER_OPTS)
+GCC_BPF_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS) $(ARCH_TOOLCHAIN_WRAPPER_OPTS)
+GCC_BPF_COMMON_TARGET_LDFLAGS = $(TARGET_LDFLAGS) $(ARCH_TOOLCHAIN_WRAPPER_OPTS)
+
+# # Propagate options used for target software building to GCC target libs
+HOST_GCC_BPF_CONF_ENV += AR_FOR_TARGET=bpf-buildroot-none-ar
+HOST_GCC_BPF_CONF_ENV += AS_FOR_TARGET=bpf-buildroot-none-as
+HOST_GCC_BPF_CONF_ENV += NM_FOR_TARGET=bpf-buildroot-none-nm
+HOST_GCC_BPF_CONF_ENV += RANLIB_FOR_TARGET=bpf-buildroot-none-ranlib
+
+# Make sure we have 'cc'
+define HOST_GCC_BPF_CREATE_CC_SYMLINKS
+	if [ ! -e $(HOST_DIR)/bin/$(BPF_TARGET_NAME)-cc ]; then \
+		ln -f $(HOST_DIR)/bin/$(BPF_TARGET_NAME)-gcc \
+			$(HOST_DIR)/bin/$(BPF_TARGET_NAME)-cc; \
+	fi
+endef
+
+HOST_GCC_BPF_POST_INSTALL_HOOKS += HOST_GCC_BPF_CREATE_CC_SYMLINKS
+
+HOST_GCC_BPF_INSTALL_OPTS = install-gcc install-target-libgcc
+
+$(eval $(host-autotools-package))
diff --git a/package/gcc-bpf/gcc.hash b/package/gcc-bpf/gcc.hash
new file mode 100644
index 0000000000..deb7c40fa3
--- /dev/null
+++ b/package/gcc-bpf/gcc.hash
@@ -0,0 +1,20 @@
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-8.4.0/sha512.sum
+sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b4804bc7fe78df335cb53bc83f1ac055baed40979ce4c2c3e46b70280  gcc-8.4.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-13.4.0/sha512.sum
+sha512  9b4b83ecf51ef355b868608b8d257b2fa435c06d2719cb86657a7c2c2a0828ff4ce04e9bac1055bbcad8ed5b4da524cafaef654785e23a50233d95d89201e35f  gcc-13.4.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-14.3.0/sha512.sum
+sha512  cb4e3259640721bbd275c723fe4df53d12f9b1673afb3db274c22c6aa457865dccf2d6ea20b4fd4c591f6152e6d4b87516c402015900f06ce9d43af66d3b7a93  gcc-14.3.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-15.2.0/sha512.sum
+sha512  89047a2e07bd9da265b507b516ed3635adb17491c7f4f67cf090f0bd5b3fc7f2ee6e4cc4008beef7ca884b6b71dffe2bb652b21f01a702e17b468cca2d10b2de  gcc-15.2.0.tar.xz
+
+# Locally calculated (fetched from Github)
+sha512  7f08ae335d9112be65e92c3744c095d8fa265994b8282274948f99fe37409531e627e6dadfb77b138a82fa09d012c56d8c075b482a5a5186814a57f9db63c29e  gcc-arc-2024.12-release.tar.gz
+# Locally calculated (fetched from Github)
+sha512  2de7cf47333a4092b02d3bb98f4206f14966f1d139a724d09cf3b22f8a43ae0c704f33e6477d6367a03c29b265480dc900169e9d417006c5d46f0ae446b8c6f1  gcc-or1k-musl-5.4.0-20170218.tar.gz
+
+# Locally calculated
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
+sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING3.LIB
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
+sha256  9d6b43ce4d8de0c878bf16b54d8e7a10d9bd42b75178153e3af6a815bdc90f74  COPYING.RUNTIME
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
