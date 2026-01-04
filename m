Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E7FC2A06C
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 11:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 660CF6073C;
	Sun,  4 Jan 2026 11:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wtOXmEj1bQ4u; Sun,  4 Jan 2026 11:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D73E60634
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767524546;
	bh=cgn1ugUipHFOJASaz2KXv/eO807ysyZgwBDFPpp4mqk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UKFZrgT97YVNSt9wkE7s2/sz3PpKltFvIULJEk6aDmLUowGtJuNnaiDoRsP2oh62e
	 ka/mGv9Ah1Xe5z0nYGuu8xOBS/2hhCz1jkvrAP8ZjKeyVoSqN39A4OJWrbTw/QsEg9
	 fNdhcPjvd4C7ATZDSs9+oqLA0XD4oIOhjk5hSFVryfypR/w6OZLMaZqlgBf6Wp6xvG
	 JMojJ/qn39QaQdmI8qgREjbIcHbUkwkPLsmiYhsYeCHwk24a6RMNzmrL3s4zzYY4vv
	 fYr5ksZvq1kba4U/+i79gqnIyGYYjcZVqpCTDM+4KoxC2vGuai68k13cKnHc9z8mn6
	 peCYgpYRcyBqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D73E60634;
	Sun,  4 Jan 2026 11:02:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F6AB249
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 11:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51BFC4030B
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 11:02:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PHIGErh_DPpJ for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 11:02:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A2124011C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A2124011C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A2124011C
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 11:02:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1C610A4C2E41;
 Sun,  4 Jan 2026 12:02:21 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42264)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vcLsK-000000000UN-32QW;
 Sun, 04 Jan 2026 11:02:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Sun,  4 Jan 2026 12:02:20 +0100
Message-ID: <20260104110220.352547-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767524541;
 bh=hpP4bL8fZlgMN4X6qfWn86o2mkQwiBrbOYvq2s1mP0w=;
 h=From:To:Cc:Subject:Date:From;
 b=tUoQzzNPTSaLymhOjJPIXZAJe6xKdgIEBdYf+PI2Cfrs2MrkAQ5+PGGozPaon258H
 h+crOOI9TaBVPKz7izmN6D6vt//KW8QdyWt5YIdwTS/i9mq3tKkecm63BQisvIP6xa
 hIj/hq1KvrSzJGIh/5iD8ZUVuUWRoxX63OkUjYZDZRh213wfu47lKkmENSidLRLACv
 tg9Amow0e+CQ56g8LYC6ziK3+aJ6h5VaXXTr8StGtYJsIQeHYJCiUNzI1rBuQb71fa
 244Q7ljALomN7lZrAGpC/cX/kcpvZUu/+wiwUC0r8t1aBNMbmUNlD4QLu0QM0SU+2G
 Z3m+BFXJanz9Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=tUoQzzNP
Subject: [Buildroot] [PATCH v2 1/1] package/brotli: fix LoongArch64 build
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
to version 1.2.0 causing build errors on loongarch64. The build error
does not occur with brotli 1.1.0.

Fixes:
https://autobuild.buildroot.net/results/57f/57f61a5fd17432bba05e4f1865f82cc2f4626d3c/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: added comment that the previous brotli version builds with
    LoongArch64 (Thomas)

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
