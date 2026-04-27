Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFA4FF8860
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 19:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD1F9812D4;
	Mon, 27 Apr 2026 19:04:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NeTvRHJZf0cz; Mon, 27 Apr 2026 19:04:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D664E812D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777316661;
	bh=4EkvQJ3gAIwy9Xp3zC+Kl17ZWmZJoTriJ6r3n0cW6BA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XIKpqHXjkJkCoInWt+C/HQ/o9D5dtCpV88bQGC4ya21byX4MbP2KIUrNVsbBKkJcg
	 +ehU/iJrwELaXALE4vy4bK6huUIjCJlaJkweYWXjNPmwYQWcdr2KKFDDs64kBGrMS4
	 QwVyubj89gwQDjhrzsXw1vAU5+lq/TFROrI2APdnP79BsDtyO5hpzE1OPV/L8m1u/R
	 gT7LxFr4cUbhDsSfNDDZOVHLZGmDGV0dDw8OxyIwmBg4sRNjUxoyEaSDTCO+lobgs9
	 Xx3/H5DfGg1OXmdGjLvDM+DY/I9mmLfKw+sAzGkcrgbrWary+aRqCA4H7CBzidF3Fi
	 uIh/1m/ocwOAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D664E812D5;
	Mon, 27 Apr 2026 19:04:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D70AE1B8
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 19:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC5046071D
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 19:04:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wgMZcwtZzMDv for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 19:04:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 67AD460715
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67AD460715
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 67AD460715
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 19:04:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8F03FA4C060E
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 21:04:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38564)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wHRFa-000000001sf-2Gl9
 for buildroot@buildroot.org; Mon, 27 Apr 2026 19:04:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 27 Apr 2026 21:04:10 +0200
Message-ID: <20260427190410.101712-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777316651;
 bh=s57sCY1dTHeriqxoOAOSZoq5dApBCnMIPDk1r0g3sbg=;
 h=From:To:Subject:Date:From;
 b=M5Y/ZW3OsNfmGZnT5B63okGTlSZ/FSQsiOoUWOCGFQsH4345X4U2j0CHRVG+29UlX
 KG3NQ4y74bxJ3D7Tf/KVlGLVXCBhykQpTzAnrgtxaaHHFKWeAbC/BSO9RJrXQBVEBE
 kuxBGxWhiHW454uWy/SsKin+PWGfW0R18HK0G627XMCSiC0GXbSMq+GwoL6aejBji4
 TzjE0AAGPoHX1Nd/DVMBjhjAM2oTk5rwG0Je6yl6Io9nTPKvL6HJbEX8jlFMw7bwQ7
 7suSLcfAfQbCCHRD6F55FjLPQOavA7Ykf7FSKKyzotgW1apVN9wWzETFMK8tKPpiG7
 P7Jija4mnLGwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=M5Y/ZW3O
Subject: [Buildroot] [PATCH v2 1/1] package/sqlite: Fix build on riscv32
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

Buildroot commit 7cf7140b4832d1281fd352893d3f7cfc92e8eef3 bumped the
package from 3.51.3 to 3.53.0. Version 3.52.0 contains upstream commit
https://github.com/sqlite/sqlite/commit/db84cdb747ac926d3f272933386fc6196c40cb19
which added the usage of __uint128_t with a dependency on, among others,
__riscv. This matches riscv32 and riscv64 but only riscv64 has
__uint128_t defined.

Added upstream patch to fix the problem.

Fixes:
https://autobuild.buildroot.net/results/a6e/a6e4f391081c8059d93fb5b7bd33e08c57b27dcf/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: replaced patch with upstream commit

 ...tion-fix-for-uint128-on-RISCV-32-bit.patch | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 package/sqlite/0001-Feature-detection-fix-for-uint128-on-RISCV-32-bit.patch

diff --git a/package/sqlite/0001-Feature-detection-fix-for-uint128-on-RISCV-32-bit.patch b/package/sqlite/0001-Feature-detection-fix-for-uint128-on-RISCV-32-bit.patch
new file mode 100644
index 0000000000..5d5a197b1f
--- /dev/null
+++ b/package/sqlite/0001-Feature-detection-fix-for-uint128-on-RISCV-32-bit.patch
@@ -0,0 +1,70 @@
+From 27e808ff2cdb6541c12793ccaa09949b5898f14b Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Mon, 27 Apr 2026 12:25:36 +0000
+Subject: [PATCH] Feature detection fix for uint128 on RISCV 32-bit.
+
+FossilOrigin-Name: e3f318bf52932460890333c6dcae352ab4b0c943d7be67734649eff1ff9fc9fc
+
+Upstream: https://sqlite.org/src/info/e3f318bf52932460
+
+Patch created from github repo commit:
+https://github.com/sqlite/sqlite/commit/27e808ff2cdb6541c12793ccaa09949b5898f14b
+
+[Bernd: rebased for "the amalgamation"
+        https://sqlite.org/amalgamation.html]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ sqlite3.c    | 17 +++++++++++------
+ 1 file changed, 11 insertions(+), 6 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 67e6e2ee03..57b98ad4c9 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -458,15 +458,20 @@ u8 sqlite3StrIHash(const char *z){
+   return h;
+ }
+ 
++#if !defined(SQLITE_DISABLE_INTRINSIC)               \
++  && (defined(__GNUC__) || defined(__clang__))       \
++  && (defined(__x86_64__) || defined(__aarch64__) || \
++      (defined(__riscv) && defined(__riscv_xlen) && (__riscv_xlen>32)))
++#define SQLITE_USE_UINT128
++#endif
++
+ /*
+ ** Two inputs are multiplied to get a 128-bit result.  Write the
+ ** lower 64-bits of the result into *pLo, and return the high-order
+ ** 64 bits.
+ */
+ static u64 sqlite3Multiply128(u64 a, u64 b, u64 *pLo){
+-#if (defined(__GNUC__) || defined(__clang__)) \
+-        && (defined(__x86_64__) || defined(__aarch64__) || defined(__riscv)) \
+-        && !defined(SQLITE_DISABLE_INTRINSIC)
++#if defined(SQLITE_USE_UINT128)
+   __uint128_t r = (__uint128_t)a * b;
+   *pLo = (u64)r;
+   return (u64)(r>>64);
+@@ -500,9 +505,7 @@ static u64 sqlite3Multiply128(u64 a, u64 b, u64 *pLo){
+ ** The lower 64 bits of A*B are discarded.
+ */
+ static u64 sqlite3Multiply160(u64 a, u32 aLo, u64 b, u32 *pLo){
+-#if (defined(__GNUC__) || defined(__clang__)) \
+-        && (defined(__x86_64__) || defined(__aarch64__) || defined(__riscv)) \
+-        && !defined(SQLITE_DISABLE_INTRINSIC)
++#if defined(SQLITE_USE_UINT128)
+   __uint128_t r = (__uint128_t)a * b;
+   r += ((__uint128_t)aLo * b) >> 32;
+   *pLo = (r>>32)&0xffffffff;
+@@ -540,6 +543,8 @@ static u64 sqlite3Multiply160(u64 a, u32 aLo, u64 b, u32 *pLo){
+ #endif
+ }
+ 
++#undef SQLITE_USE_UINT128
++
+ /*
+ ** Return a u64 with the N-th bit set.
+ */
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
