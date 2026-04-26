Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE416FF885C
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 11:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 565A8425E9;
	Sun, 26 Apr 2026 11:44:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nZ6S-D2LwaW2; Sun, 26 Apr 2026 11:44:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 343A2428BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777203878;
	bh=CAvTFeQlMBdpR6QaOjsMcQMtOeQ/JJX36zAVV1bPZLQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YmAfHawO/VqoKtU6I4yfOVXs9bVZhExJ3eLA5/CSpM/1NHp6ATgY/UclJHFYPgBcO
	 iH3NCOtRGeQmQ6sWoT7rll0D89ezG87QTzAjqvmLGViyflk7KmHEw5M6shCqlK1X6f
	 1vBqT+4EDaPYXEnk0Q4+FaVBpmY6p+VHwdrB5bmJFPCss+tq7Hz6cK3eB+Ts+rPhl4
	 n2qL9chkyYZNjo9LzzO9AydRSt3rI3peUL9MoKKT2mjA8Wk/Y90643N9BCMgKZ4Wcd
	 0f52afB/IhHb7gJxvs3ev2L5wOPSXpeoguuc8NMmifi/kIzhyn6+W4xeNqxtq8UE6b
	 L3eOKkFKNu0kQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 343A2428BB;
	Sun, 26 Apr 2026 11:44:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC4D5231
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 11:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBA4761B4C
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 11:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x6KqJKctPI6b for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 11:44:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0C9846132D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C9846132D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C9846132D
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 11:44:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1145DA4C0F11
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 13:44:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42284)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wGxuW-000000001mD-3uSq
 for buildroot@buildroot.org; Sun, 26 Apr 2026 11:44:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 26 Apr 2026 13:44:29 +0200
Message-ID: <20260426114429.1196358-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777203871;
 bh=Psyr7znqeFj7EkXx1Jp9aI7XB2QPUupwf8a48MVVpv4=;
 h=From:To:Subject:Date:From;
 b=lIMk2D6pSvMrwnUy5rE4RNLL98VXuVA0e6Eb7e6aI+3aYjRBjm7M29k734Gc++rlJ
 Lw9ENWy7lf0cLASIKuJdTjYlBhbqj6snt14SWB7NMt+LagdM7QGGgNA5bct+OcEId+
 5PnbG+3RbjyiIQFYCbatldN/Mzf+/7gS1t9KhuYpEVRqG6iGfyy2O2MoELy3jwf/Ux
 5JGCLayYAKz9vyJ+K4OBOqT6ghBADR0+ELMAfv7GC/gRxQMEjNn8vF0jIdekQBC534
 3Q9ZxxP3o/GT3AC1ZMZQYuVCRVGJUO/6Jo7ygrmamkPYl9GsWseAypRsTL1TkzNP0P
 o3RsB7zcMXdoA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=lIMk2D6p
Subject: [Buildroot] [PATCH 1/1] package/sqlite: Fix build on riscv32
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
which added the usage off __uint128_t with a dependency on, among
others, __riscv. This matches riscv32 and riscv64 but only riscv64 has
__uint128_t defined.

Fixes:
https://autobuild.buildroot.net/results/a6e/a6e4f391081c8059d93fb5b7bd33e08c57b27dcf/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...of-intrinsic-high-precision-multipli.patch | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 package/sqlite/0001-Disable-the-use-of-intrinsic-high-precision-multipli.patch

diff --git a/package/sqlite/0001-Disable-the-use-of-intrinsic-high-precision-multipli.patch b/package/sqlite/0001-Disable-the-use-of-intrinsic-high-precision-multipli.patch
new file mode 100644
index 0000000000..30c23791b6
--- /dev/null
+++ b/package/sqlite/0001-Disable-the-use-of-intrinsic-high-precision-multipli.patch
@@ -0,0 +1,54 @@
+From 0bfc92a2df5ec80f466df884de7225517febfe56 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 26 Apr 2026 13:28:13 +0200
+Subject: [PATCH] Disable the use of intrinsic high-precision multiplies on
+ riscv32
+
+Build is broken in riscv32:
+
+/home/vincent/autobuild/instance-3/output-1/build/sqlite-3.53.0/sqlite3.c:
+ In function 'sqlite3Multiply128':
+/home/vincent/autobuild/instance-3/output-1/build/sqlite-3.53.0/sqlite3.c:36804:3:
+ error: unknown type name '__uint128_t'; did you mean '__uint32_t'?
+36804 |   __uint128_t r = (__uint128_t)a * b;
+
+as reported by the buildroot autobuilders:
+https://autobuild.buildroot.net/results/a6e/a6e4f391081c8059d93fb5b7bd33e08c57b27dcf//build-end.log
+
+For a discussion about the preprocessor definitions see:
+https://github.com/riscv-android-src/platform-bionic/issues/10
+
+Upstream: https://github.com/sqlite/sqlite/pull/44
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ sqlite3.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index c75c19cc21..2573937567 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -36799,7 +36799,8 @@ u8 sqlite3StrIHash(const char *z){
+ */
+ static u64 sqlite3Multiply128(u64 a, u64 b, u64 *pLo){
+ #if (defined(__GNUC__) || defined(__clang__)) \
+-        && (defined(__x86_64__) || defined(__aarch64__) || defined(__riscv)) \
++        && (defined(__x86_64__) || defined(__aarch64__) \
++            || (defined(__riscv) && (__riscv_xlen == 64))) \
+         && !defined(SQLITE_DISABLE_INTRINSIC)
+   __uint128_t r = (__uint128_t)a * b;
+   *pLo = (u64)r;
+@@ -36835,7 +36836,8 @@ static u64 sqlite3Multiply128(u64 a, u64 b, u64 *pLo){
+ */
+ static u64 sqlite3Multiply160(u64 a, u32 aLo, u64 b, u32 *pLo){
+ #if (defined(__GNUC__) || defined(__clang__)) \
+-        && (defined(__x86_64__) || defined(__aarch64__) || defined(__riscv)) \
++        && (defined(__x86_64__) || defined(__aarch64__) \
++            || (defined(__riscv) && (__riscv_xlen == 64))) \
+         && !defined(SQLITE_DISABLE_INTRINSIC)
+   __uint128_t r = (__uint128_t)a * b;
+   r += ((__uint128_t)aLo * b) >> 32;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
