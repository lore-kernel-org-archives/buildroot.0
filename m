Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 687A2C433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:03:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05F4661186
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05F4661186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1EAB40015;
	Tue,  9 Nov 2021 22:03:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3-YMBDWtwClz; Tue,  9 Nov 2021 22:03:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2E0B401B1;
	Tue,  9 Nov 2021 22:03:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F7A41BF5DF
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DE83817ED
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:03:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9i6r-ZRlCSYO for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 22:03:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8FAF817AF
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 22:03:08 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r8so424471wra.7
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 14:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YcASDVz37wacpM3O7oss8jUC7IASo5smcVdypQ6Vtwg=;
 b=fMn3sIWixrbCH7FTuEhVMhy+kCDnk2u8d16unASb0/dSKkz2YJkaZMFLW/h7SCn6cJ
 QrpaQwdlUBLcT8kqa1U+wcEbZnEQV9osicDpfU/h64z0UAlO8xtrehSOo8M12DxjFrO7
 6G6dWK1TfDr/fvtOO3xQDQs9vlfUodcuGJ59sQ2+rpjoIgurAxddeIn2lVPDXw4Lo37u
 PN8nZUBrEHr8asPE2rLlVkWyHHw56s9izsMtG2srlWwx+aGc2KtOAJ+ayPGAENiMLGJs
 2s6+ZbPV1RklLqO6F2XwOVi/Qfee0wCL5rV0jixJ6LHnPvgIcNwkbvnEhe7a5D7QRobN
 XL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YcASDVz37wacpM3O7oss8jUC7IASo5smcVdypQ6Vtwg=;
 b=RcKYAM/PRjWnJ9SGCo+1JNcMsVXpwXGVkAB6wlKXhS7VRgw5KTD0S7ggeqsbSvwBLC
 CorIZI8NMduiOdN1BgRUH9+deYfZ0kreXCtW3i9gzFkWj6K8LC8P9JZo+ZX9UNNAKD0r
 VHd1sGGTo2k9ZYIkCwYJ5s2RY+54sLRL77tl2KA/Kyn2IdeYPsGQ9uC4UlcLyhq1HDsE
 X2AvYbSvsg6dtAjGQ6xozPAKnnojZIzSQdXt6SUxFrzGlseVvKaa++mgAblXGW9/XkGA
 LloheLNPoy21wN589HXSR2hwxjQa+tnUFuE+wUBCL66WLslJ5tCFGCEIjalejtU4vQSs
 XXuA==
X-Gm-Message-State: AOAM531nl0Ruk6KBRzZpeMcaWBjPw0peY38NggLb0+64nafR46oTf25W
 d/MFdJrZt4ZxvgXtPkOHz+E5YjSGKRk=
X-Google-Smtp-Source: ABdhPJz0DKOOQsIkOQ6RAgEsLNhaXPt7gvva7Dzfdoid8guYh9zezn5m8wlz5ND43PxpDFhHrO8ZxA==
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr13477722wrw.116.1636495386718; 
 Tue, 09 Nov 2021 14:03:06 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id n32sm4298031wms.1.2021.11.09.14.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 14:03:06 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 23:01:06 +0100
Message-Id: <20211109220106.1645006-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/botan: fix build on mips
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure on one mips toolchain with gcc 5.3
raised since bump to version 2.18.2 in commit
47fa16dffa6c6a72b2f76984f6d492f4f352a52b:

src/lib/hash/sha3/sha3.cpp: In function 'std::tuple<long long unsigned int, long long unsigned int, long long unsigned int, long long unsigned int, long long unsigned int> Botan::{anonymous}::xor_CNs(const uint64_t*)':
src/lib/hash/sha3/sha3.cpp:41:42: error: converting to 'std::tuple<long long unsigned int, long long unsigned int, long long unsigned int, long long unsigned int, long long unsigned int>' from initializer list would use explicit constructor 'constexpr std::tuple< <template-parameter-1-1> >::tuple(_UElements&& ...) [with _UElements = {long long unsigned int, long long unsigned int, long long unsigned int, long long unsigned int, long long unsigned int}; <template-parameter-2-2> = void; _Elements = {long long unsigned int, long long unsigned int, long long unsigned int, long long unsigned int, long long unsigned int}]'
       A[4] ^ A[9] ^ A[14] ^ A[19] ^ A[24]};
                                          ^

Fixes:
 - http://autobuild.buildroot.org/results/4e86c3008aa70284a3002f426066fcc21d018e95

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...d-a-miscompilation-issue-in-clang-12.patch | 144 ++++++++++++++++++
 1 file changed, 144 insertions(+)
 create mode 100644 package/botan/0001-Revert-workaround-a-miscompilation-issue-in-clang-12.patch

diff --git a/package/botan/0001-Revert-workaround-a-miscompilation-issue-in-clang-12.patch b/package/botan/0001-Revert-workaround-a-miscompilation-issue-in-clang-12.patch
new file mode 100644
index 0000000000..b43aeafe13
--- /dev/null
+++ b/package/botan/0001-Revert-workaround-a-miscompilation-issue-in-clang-12.patch
@@ -0,0 +1,144 @@
+From 372bdf0348fb86d671e73baab19daa34bd0cf73d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 9 Nov 2021 19:01:20 +0100
+Subject: [PATCH] Revert "workaround a miscompilation issue in clang 12
+ (XCode 13)"
+
+This reverts commit 219329f8e777af54d785ae7259f8be32a714b751.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/randombit/botan/issues/2845]
+---
+ src/lib/hash/sha3/sha3.cpp                | 46 ++++++-----------------
+ src/lib/hash/sha3/sha3_bmi2/sha3_bmi2.cpp | 46 ++++++-----------------
+ 2 files changed, 22 insertions(+), 70 deletions(-)
+
+diff --git a/src/lib/hash/sha3/sha3.cpp b/src/lib/hash/sha3/sha3.cpp
+index 289e451ff..690c2b264 100644
+--- a/src/lib/hash/sha3/sha3.cpp
++++ b/src/lib/hash/sha3/sha3.cpp
+@@ -11,47 +11,23 @@
+ #include <botan/exceptn.h>
+ #include <botan/cpuid.h>
+ 
+-#include <tuple>
+-
+ namespace Botan {
+ 
+ namespace {
+ 
+-// This is a workaround for a suspected bug in clang 12 (and XCode 13)
+-// that caused a miscompile of the SHA3 implementation for optimization
+-// level -O2 and higher.
+-//
+-// For details, see: https://github.com/randombit/botan/issues/2802
+-#if    defined(__clang__) && \
+-    (( defined(__apple_build_version__) && __clang_major__ == 13) || \
+-     (!defined(__apple_build_version__) && __clang_major__ == 12))
+-#define BOTAN_WORKAROUND_MAYBE_INLINE __attribute__((noinline))
+-#else
+-#define BOTAN_WORKAROUND_MAYBE_INLINE inline
+-#endif
+-
+-BOTAN_WORKAROUND_MAYBE_INLINE std::tuple<uint64_t, uint64_t, uint64_t, uint64_t, uint64_t>
+-   xor_CNs(const uint64_t A[25])
+-   {
+-   return {
+-      A[0] ^ A[5] ^ A[10] ^ A[15] ^ A[20],
+-      A[1] ^ A[6] ^ A[11] ^ A[16] ^ A[21],
+-      A[2] ^ A[7] ^ A[12] ^ A[17] ^ A[22],
+-      A[3] ^ A[8] ^ A[13] ^ A[18] ^ A[23],
+-      A[4] ^ A[9] ^ A[14] ^ A[19] ^ A[24]};
+-   }
+-
+-#undef BOTAN_WORKAROUND_MAYBE_INLINE
+-
+ inline void SHA3_round(uint64_t T[25], const uint64_t A[25], uint64_t RC)
+    {
+-   const auto Cs = xor_CNs(A);
+-
+-   const uint64_t D0 = rotl<1>(std::get<0>(Cs)) ^ std::get<3>(Cs);
+-   const uint64_t D1 = rotl<1>(std::get<1>(Cs)) ^ std::get<4>(Cs);
+-   const uint64_t D2 = rotl<1>(std::get<2>(Cs)) ^ std::get<0>(Cs);
+-   const uint64_t D3 = rotl<1>(std::get<3>(Cs)) ^ std::get<1>(Cs);
+-   const uint64_t D4 = rotl<1>(std::get<4>(Cs)) ^ std::get<2>(Cs);
++   const uint64_t C0 = A[0] ^ A[5] ^ A[10] ^ A[15] ^ A[20];
++   const uint64_t C1 = A[1] ^ A[6] ^ A[11] ^ A[16] ^ A[21];
++   const uint64_t C2 = A[2] ^ A[7] ^ A[12] ^ A[17] ^ A[22];
++   const uint64_t C3 = A[3] ^ A[8] ^ A[13] ^ A[18] ^ A[23];
++   const uint64_t C4 = A[4] ^ A[9] ^ A[14] ^ A[19] ^ A[24];
++
++   const uint64_t D0 = rotl<1>(C0) ^ C3;
++   const uint64_t D1 = rotl<1>(C1) ^ C4;
++   const uint64_t D2 = rotl<1>(C2) ^ C0;
++   const uint64_t D3 = rotl<1>(C3) ^ C1;
++   const uint64_t D4 = rotl<1>(C4) ^ C2;
+ 
+    const uint64_t B00 =          A[ 0] ^ D1;
+    const uint64_t B01 = rotl<44>(A[ 6] ^ D2);
+diff --git a/src/lib/hash/sha3/sha3_bmi2/sha3_bmi2.cpp b/src/lib/hash/sha3/sha3_bmi2/sha3_bmi2.cpp
+index c7f1914a3..a9650ad9d 100644
+--- a/src/lib/hash/sha3/sha3_bmi2/sha3_bmi2.cpp
++++ b/src/lib/hash/sha3/sha3_bmi2/sha3_bmi2.cpp
+@@ -8,47 +8,23 @@
+ #include <botan/sha3.h>
+ #include <botan/rotate.h>
+ 
+-#include <tuple>
+-
+ namespace Botan {
+ 
+ namespace {
+ 
+-// This is a workaround for a suspected bug in clang 12 (and XCode 13)
+-// that caused a miscompile of the SHA3 implementation for optimization
+-// level -O2 and higher.
+-//
+-// For details, see: https://github.com/randombit/botan/issues/2802
+-#if    defined(__clang__) && \
+-    (( defined(__apple_build_version__) && __clang_major__ == 13) || \
+-     (!defined(__apple_build_version__) && __clang_major__ == 12))
+-#define BOTAN_WORKAROUND_MAYBE_INLINE __attribute__((noinline))
+-#else
+-#define BOTAN_WORKAROUND_MAYBE_INLINE inline
+-#endif
+-
+-BOTAN_WORKAROUND_MAYBE_INLINE std::tuple<uint64_t, uint64_t, uint64_t, uint64_t, uint64_t>
+-   xor_CNs(const uint64_t A[25])
+-   {
+-   return {
+-      A[0] ^ A[5] ^ A[10] ^ A[15] ^ A[20],
+-      A[1] ^ A[6] ^ A[11] ^ A[16] ^ A[21],
+-      A[2] ^ A[7] ^ A[12] ^ A[17] ^ A[22],
+-      A[3] ^ A[8] ^ A[13] ^ A[18] ^ A[23],
+-      A[4] ^ A[9] ^ A[14] ^ A[19] ^ A[24]};
+-   }
+-
+-#undef BOTAN_WORKAROUND_MAYBE_INLINE
+-
+ inline void SHA3_BMI2_round(uint64_t T[25], const uint64_t A[25], uint64_t RC)
+    {
+-   const auto Cs = xor_CNs(A);
+-
+-   const uint64_t D0 = rotl<1>(std::get<0>(Cs)) ^ std::get<3>(Cs);
+-   const uint64_t D1 = rotl<1>(std::get<1>(Cs)) ^ std::get<4>(Cs);
+-   const uint64_t D2 = rotl<1>(std::get<2>(Cs)) ^ std::get<0>(Cs);
+-   const uint64_t D3 = rotl<1>(std::get<3>(Cs)) ^ std::get<1>(Cs);
+-   const uint64_t D4 = rotl<1>(std::get<4>(Cs)) ^ std::get<2>(Cs);
++   const uint64_t C0 = A[0] ^ A[5] ^ A[10] ^ A[15] ^ A[20];
++   const uint64_t C1 = A[1] ^ A[6] ^ A[11] ^ A[16] ^ A[21];
++   const uint64_t C2 = A[2] ^ A[7] ^ A[12] ^ A[17] ^ A[22];
++   const uint64_t C3 = A[3] ^ A[8] ^ A[13] ^ A[18] ^ A[23];
++   const uint64_t C4 = A[4] ^ A[9] ^ A[14] ^ A[19] ^ A[24];
++
++   const uint64_t D0 = rotl<1>(C0) ^ C3;
++   const uint64_t D1 = rotl<1>(C1) ^ C4;
++   const uint64_t D2 = rotl<1>(C2) ^ C0;
++   const uint64_t D3 = rotl<1>(C3) ^ C1;
++   const uint64_t D4 = rotl<1>(C4) ^ C2;
+ 
+    const uint64_t B00 =          A[ 0] ^ D1;
+    const uint64_t B01 = rotl<44>(A[ 6] ^ D2);
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
