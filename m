Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4632F5A8B1
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 19:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C944608E3;
	Mon, 20 Apr 2026 19:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bkI9Cyu-fWZT; Mon, 20 Apr 2026 19:08:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BA72610F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776712133;
	bh=Sbi9MyL6j7ShqplXVfum+mMEUamIxgLaXDR7cE5EXlQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wu1khTX/jIU2IXwTqLfXk5gUJVqHHJjTVMwFtzZiHdPe8ZJyUZv75EXpudaJwL8cY
	 OwY/qU8EIEeSJLYdgWjGi8kjQEKThXAeokktbFwmeuIGT6atDtZHIprPD4l+PcejKt
	 nyO04yptgXwUvrLe0V2Ku2BoOXd6IF6EE02a++Mjp1jRUNe2RXtqT5nFt9gShwgAMo
	 Xz10zonqgez6jNLmJEInIqtsAtxu6tZpHHxAFQ37uEJ6i+s3RtNhFGyZJIVVI1GVAy
	 8gOLL8IE9bTTbTDYJjLriJFPBHHjXoRtcQtBeJG2TSCHBQtIceQSrv2YAfrggg84Gs
	 uKMKlu6qTV74A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BA72610F0;
	Mon, 20 Apr 2026 19:08:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB610257
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 19:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C12AC4111F
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 19:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Ng-PWq6gcu9 for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 19:08:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B573141112
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B573141112
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B573141112
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 19:08:51 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-c7358a7a8d1so2057922a12.3
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 12:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776712130; x=1777316930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8ZVL7DpSsrdCAsCSUeZdAV6EtOhldJPWY4RdsPOY2HQ=;
 b=Kwohz3d4UOO0IQZT9sO9HIE7vNDKsNt7FE1+a3IPY8K+0Bf0iyzQtr+VdiXbs2esRl
 WQfc5aJ3Dc8mguPfQfCu7EaVSZyz1ZQcQGuNA4//8pHWDxioOqP+Vhmc2ClCBACa6imN
 5ZCysDAwvn7tW+DI1dPtmHnfb/FGlW+NV+Ybd1PEQrnSpgsBPWIuPqM8+iSnxW70nz+K
 cTt+AuAf0jH6NO0g1G7Jwzp5s39K0PnzCNFdaeaneqmiHyiz0BV/NJ4F+YsxbO6Csw85
 Uc3+/wDhRd+eJd5jHn4SElsa6ecN6ImhJ7F3mwGaNvAHXuxFU3FYV8qk7gFHu+FYlTEO
 b2jg==
X-Gm-Message-State: AOJu0YzPjur4t+ZfPsFwXJDQSlfAEE1Hs+M6t8LNcyx9w3ETPH9d62Lc
 RqK67YnAjHMkpk9eys47Y6TsxBfb+KJnH4sXM/ciLhKWL3cdR6Z6hCz/l9MkKDS1
X-Gm-Gg: AeBDietieXmrhdVE23zGh9cNgZdnYJ9AyLHmpCGiOOEYM4lZs3WI7SQuaB0ifFl3kDz
 7RQYgjjGt9zq7Ntr/g45P5gPwlq4Gb5KQZZRK1FP/T+P7WNUyOrNIbISE6aAVAnhnyTMnadFtrk
 LzgoNeT7MsubyNFpep21j3+cE9o3QdcGlLQkShbeaAIh0RVb2vTJVGg6oxuj36sLwiP7NDT/VFK
 5IaWTRQTHvXU3EzpLWjt5uF2FWjobt6gR6XXgI9WZECWEWakDy47Kzi0nE8TNgxUvJ9AQSSRcoY
 APaqBxzCa8t4Y4FF7e76M65hiiBfwe94cmOkn45FocEsVTu4sEa/HD4nIGLoOiHIJz9SuCxZ1Lw
 GDdXGqUIOpg2QE103rfcC2ezRB/2bwBlPe9bT+rwzGkgXi4qq8/t0fMma+ZMeYifrAnK8eWkiPC
 jNaP9ZkkcpwbB8zQSY1SUU26lBH15EwZI72+zBLCQ/IQ==
X-Received: by 2002:a05:6a00:4186:b0:82f:280a:d888 with SMTP id
 d2e1a72fcca58-82f8c81d952mr16524769b3a.12.1776712130470; 
 Mon, 20 Apr 2026 12:08:50 -0700 (PDT)
Received: from fedora ([2409:40e5:101d:f700:95:a358:be57:4a93])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82f8e9819fesm11477375b3a.4.2026.04.20.12.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 12:08:49 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Tue, 21 Apr 2026 00:37:47 +0530
Message-ID: <20260420190748.181272-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420084407.37993-1-chakrabortyshubham66@gmail.com>
References: <20260420084407.37993-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776712130; x=1777316930; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ZVL7DpSsrdCAsCSUeZdAV6EtOhldJPWY4RdsPOY2HQ=;
 b=GhL5UAGm3Dhd2lKcUZCT1wDCftjfyr9ggiLQz9LWL8/CihpsW0+KtJGhYT4yjeEko7
 ov1Jk4yoKVwsRY134sIwqxtdwCWytmhZKlBgqNeeRJGBV/7pqa56iyKx+Sqa4ZR2aR32
 TKjYSLJbW6PEODPKJ6ojUugKhRaYyqULrDtYc1XrHr3DgFAcF0ybEUYJbZQ59p5Fxkpi
 NcsX6efKtwr4sgI/VKo9IkXxOaGjoG5/18y3y8G00FpbSgenGPaUWjb7N97pdl5g5R9h
 nEwYmFEvvU0qx60NB+SDXGMBpuInW9PUs7+/aMUqNkkTJaE3+0cwPIhg+ZqZ5nxxVIg2
 rdEA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=GhL5UAGm
Subject: [Buildroot] [PATCH v2] package/botan: security bump to version
 3.11.1
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

- Update BOTAN_VERSION to 3.11.1
- Remove 0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch
  as it is already integrated upstream in this version.

Fixed in 3.11.1:
- CVE-2026-35580: Resolve certificate verification bypass bug introduced
  in 3.11.0 (GH #5500)
- CVE-2026-35582: Resolve TLS 1.3 client authentication bypass (GH #5599)

Fixed in 3.11.0:
- CVE-2026-32877: Fix a heap over-read during SM2 decryption (GH #5450)
- CVE-2026-32883: Fix an OCSP response forgery vulnerability (GH #5449)
- CVE-2026-32884: Fix a name constraints bypass for DNS names (GH #5448)

- Remove the --disable-altivec configuration option as it has been removed
  from the Botan build system in version 3.x
- Optimize the --disable-neon logic using the yx pattern.
  In Botan 3.x, the --disable-neon flag is specifically targeted at the
  arm32 architecture. Furthermore, Buildroot's BR2_ARM_CPU_HAS_NEON
  variable is only defined for 32-bit ARM, which previously caused a
  false-positive --disable-neon flag to be passed on AArch64 builds
- Update license.txt hash in botan.hash due to the copyright year update
  to 2026

https://botan.randombit.net/news.html#version-3-11-1-2026-03-31

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

---
v1 -> v2:
  - Add "security" to the subject line.
  - Mention CVEs fixed in 3.11.0 and 3.11.1 as requested by Bernd Kuhls.
  - Optimize the NEON disable logic in botan.mk using the yx pattern.
---
 ...avoid-compiler-induced-side-channels.patch | 65 -------------------
 package/botan/botan.hash                      |  4 +-
 package/botan/botan.mk                        | 11 +---
 3 files changed, 4 insertions(+), 76 deletions(-)
 delete mode 100644 package/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch

diff --git a/package/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch b/package/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch
deleted file mode 100644
index 22f64be1b9..0000000000
--- a/package/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 53b0cfde580e86b03d0d27a488b6c134f662e957 Mon Sep 17 00:00:00 2001
-From: Jack Lloyd <jack@randombit.net>
-Date: Sat, 19 Oct 2024 07:43:18 -0400
-Subject: [PATCH] Add more value barriers to avoid compiler induced side
- channels
-
-The paper https://arxiv.org/pdf/2410.13489 claims that on specific
-architectures Clang and GCC may introduce jumps here. The donna128
-issues only affect 32-bit processors, which explains why we would not
-see it in the x86-64 valgrind runs.
-
-The GHASH leak would seem to be generic but the authors only observed
-it on RISC-V.
-
-CVE: CVE-2024-50382
-CVE: CVE-2024-50383
-Upstream: https://github.com/randombit/botan/commit/53b0cfde580e86b03d0d27a488b6c134f662e957
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- src/lib/utils/donna128.h      | 5 +++--
- src/lib/utils/ghash/ghash.cpp | 2 +-
- 2 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/src/lib/utils/donna128.h b/src/lib/utils/donna128.h
-index 8212bd349e0..7adf54546df 100644
---- a/src/lib/utils/donna128.h
-+++ b/src/lib/utils/donna128.h
-@@ -8,6 +8,7 @@
- #ifndef BOTAN_CURVE25519_DONNA128_H_
- #define BOTAN_CURVE25519_DONNA128_H_
- 
-+#include <botan/internal/ct_utils.h>
- #include <botan/internal/mul128.h>
- #include <type_traits>
- 
-@@ -73,14 +74,14 @@ class donna128 final {
-          l += x.l;
-          h += x.h;
- 
--         const uint64_t carry = (l < x.l);
-+         const uint64_t carry = CT::Mask<uint64_t>::is_lt(l, x.l).if_set_return(1);
-          h += carry;
-          return *this;
-       }
- 
-       constexpr donna128& operator+=(uint64_t x) {
-          l += x;
--         const uint64_t carry = (l < x);
-+         const uint64_t carry = CT::Mask<uint64_t>::is_lt(l, x).if_set_return(1);
-          h += carry;
-          return *this;
-       }
-diff --git a/src/lib/utils/ghash/ghash.cpp b/src/lib/utils/ghash/ghash.cpp
-index 8c3b1ed6c2a..61b28590002 100644
---- a/src/lib/utils/ghash/ghash.cpp
-+++ b/src/lib/utils/ghash/ghash.cpp
-@@ -131,7 +131,7 @@ void GHASH::key_schedule(std::span<const uint8_t> key) {
-          m_HM[4 * j + 2 * i + 1] = H1;
- 
-          // GCM's bit ops are reversed so we carry out of the bottom
--         const uint64_t carry = R * (H1 & 1);
-+         const uint64_t carry = CT::Mask<uint64_t>::expand(H1 & 1).if_set_return(R);
-          H1 = (H1 >> 1) | (H0 << 63);
-          H0 = (H0 >> 1) ^ carry;
-       }
diff --git a/package/botan/botan.hash b/package/botan/botan.hash
index d948271900..6b391c06a3 100644
--- a/package/botan/botan.hash
+++ b/package/botan/botan.hash
@@ -1,4 +1,4 @@
 # From https://botan.randombit.net/releases/sha256sums.txt
-sha256  67e8dae1ca2468d90de4e601c87d5f31ff492b38e8ab8bcbd02ddf7104ed8a9f  Botan-3.5.0.tar.xz
+sha256  c1cd7152519f4188591fa4f6ddeb116bc1004491f5f3c58aa99b00582eb8a137  Botan-3.11.1.tar.xz
 # Locally computed
-sha256  db9168bdccaaea26557094436652577cc9bf43164e8be078d88aef1342fe4fb6  license.txt
+sha256  758ea6b4a65d5611bf79c24920f92473ef44bdde0b3b97fa578470a0ffc34f14  license.txt
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 38948f0184..06f1ce2730 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-BOTAN_VERSION = 3.5.0
+BOTAN_VERSION = 3.11.1
 BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
 BOTAN_LICENSE_FILES = license.txt
 BOTAN_CPE_ID_VALID = YES
 
-# 0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch
-BOTAN_IGNORE_CVES += CVE-2024-50382 CVE-2024-50383
-
 BOTAN_INSTALL_STAGING = YES
 
 BOTAN_DEPENDENCIES = host-python3
@@ -91,11 +88,7 @@ BOTAN_DEPENDENCIES += zlib
 BOTAN_CONF_OPTS += --with-zlib
 endif
 
-ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),)
-BOTAN_CONF_OPTS += --disable-altivec
-endif
-
-ifeq ($(BR2_ARM_CPU_HAS_NEON),)
+ifeq ($(BR2_arm)x$(BR2_ARM_CPU_HAS_NEON),yx)
 BOTAN_CONF_OPTS += --disable-neon
 endif
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
