Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F15C2A06C
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 10:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C524D80DF2;
	Sun,  4 Jan 2026 10:43:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PRJMCdo3LjG6; Sun,  4 Jan 2026 10:43:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6BE180DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767523424;
	bh=ETwMfM6S9HKSxuxhIfB21dEJARmTD+HBeMQx5iy+Ktg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PYuGlTAPXB6qXCGhRQ1rEyIXhPR0WGkx1MNeroc9ro6LUAug+e2zjuRmgswNI2Y7/
	 pzM1SJy8ntAm4lF/MHE9oC5Rrf3Su7r+3RjxEss0ok9r7AeqJDC69l73xiPNG8I6dB
	 QjwVNTPimLpVBYv8Z/g69y/1AKBPCfRKBCQue6mM7Hc2mIKg3VC6N9dUsxQ/H8+RwD
	 ULMXZ6HZUMKq5W3D9YzxQ5Gf+nV+AeKw1I2xn59KJbTbiEBdgD+Q9iLQGjKP2YUO6n
	 xkS4aFUUW16ubxITWNtHg52JASDT8ksXpQVODKwJw8VhnITsvbqLZ5ujETZTmTuRF2
	 4iuBi7E3kRwoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6BE180DFA;
	Sun,  4 Jan 2026 10:43:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 61DCD2DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4803D80DFA
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vWNQaoMFNfVC for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 10:43:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2B69080DF2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B69080DF2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B69080DF2
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:43:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D5BCCA4C3432;
 Sun,  4 Jan 2026 11:43:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42628)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vcLaE-000000005co-27A9;
 Sun, 04 Jan 2026 10:43:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Sun,  4 Jan 2026 11:43:38 +0100
Message-ID: <20260104104338.2948272-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767523418;
 bh=0tc5A28R2pQfJs/cDvNvHs7ED9ZPFhNZ8zP4CS4F3YE=;
 h=From:To:Cc:Subject:Date:From;
 b=eNgapFnCwiRnja+7hnYr9S5mAyVlp/gnshzHvo2v7d9XV9gR2iVAYV56vdjyWwHq6
 Eq0BxMjBie0ZJuAXZKLFIlgda7yC9e6KEeEozfcKuBfuKPk6q2xN/KCUKD9XjxzOFj
 mz6qp7TEJNpEPcMUoPkdxbFyyCRyzvl7KKk5yP8MUkD9crEXyUohHNFP4FTR68rh/I
 ZZxjNPWxi5ZyfZiDhVCRG/AgQ2C0Ge23mqwv8ojz+sD2fTC52BonCQ9LlYZcHlbjg4
 i5lpuaZOBNVgr3+KVAfUEVZddJ/4pHGvRhw7HdY5fsfaaz/OZG7z1sYNO78y06Z/K3
 qbxp3gO0jtuSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=eNgapFnC
Subject: [Buildroot] [PATCH 1/1] package/brotli: fix LoongArch64 build
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

Buildroot commit 473c9400a0c7be14e7eb8ba617697a76286915b3 bumped brotli
to version 1.2.0 causing build errors on loongarch64 which were not seen
by the autobuilders with the previous brotli version 1.1.0.

Fixes:
https://autobuild.buildroot.net/results/57f/57f61a5fd17432bba05e4f1865f82cc2f4626d3c/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-BROTLI_MODEL-macro-for-some-targets.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/brotli/0001-disable-BROTLI_MODEL-macro-for-some-targets.patch

diff --git a/package/brotli/0001-disable-BROTLI_MODEL-macro-for-some-targets.patch b/package/brotli/0001-disable-BROTLI_MODEL-macro-for-some-targets.patch
new file mode 100644
index 0000000000..d35b4b3336
--- /dev/null
+++ b/package/brotli/0001-disable-BROTLI_MODEL-macro-for-some-targets.patch
@@ -0,0 +1,46 @@
+From e230f474b87134e8c6c85b630084c612057f253e Mon Sep 17 00:00:00 2001
+From: Evgenii Kliuchnikov <eustas@google.com>
+Date: Mon, 3 Nov 2025 07:20:19 -0800
+Subject: [PATCH] disable BROTLI_MODEL macro for some targets
+
+PiperOrigin-RevId: 827486322
+
+Upstream: https://github.com/google/brotli/commit/e230f474b87134e8c6c85b630084c612057f253e
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ c/common/platform.h | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/c/common/platform.h b/c/common/platform.h
+index b59f9b809..e1254d5ca 100644
+--- a/c/common/platform.h
++++ b/c/common/platform.h
+@@ -213,6 +213,10 @@ To apply compiler hint, enclose the branching condition into macros, like this:
+ #define BROTLI_TARGET_MIPS64
+ #endif
+ 
++#if defined(__ia64__) || defined(_M_IA64)
++#define BROTLI_TARGET_IA64
++#endif
++
+ #if defined(BROTLI_TARGET_X64) || defined(BROTLI_TARGET_ARMV8_64) || \
+     defined(BROTLI_TARGET_POWERPC64) || defined(BROTLI_TARGET_RISCV64) || \
+     defined(BROTLI_TARGET_LOONGARCH64) || defined(BROTLI_TARGET_MIPS64)
+@@ -665,13 +669,14 @@ BROTLI_UNUSED_FUNCTION void BrotliSuppressUnusedFunctions(void) {
+ #undef BROTLI_TEST
+ #endif
+ 
+-#if BROTLI_GNUC_HAS_ATTRIBUTE(model, 3, 0, 3)
++#if !defined(BROTLI_MODEL) && BROTLI_GNUC_HAS_ATTRIBUTE(model, 3, 0, 3) && \
++    !defined(BROTLI_TARGET_IA64) && !defined(BROTLI_TARGET_LOONGARCH64)
+ #define BROTLI_MODEL(M) __attribute__((model(M)))
+ #else
+ #define BROTLI_MODEL(M) /* M */
+ #endif
+ 
+-#if BROTLI_GNUC_HAS_ATTRIBUTE(cold, 4, 3, 0)
++#if !defined(BROTLI_COLD) && BROTLI_GNUC_HAS_ATTRIBUTE(cold, 4, 3, 0)
+ #define BROTLI_COLD __attribute__((cold))
+ #else
+ #define BROTLI_COLD /* cold */
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
