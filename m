Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E532EFD530F
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 08:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D7B981769;
	Fri, 27 Feb 2026 08:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vaSyvAXuKc4X; Fri, 27 Feb 2026 08:44:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B44081764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772181851;
	bh=iv7lzwKEu908nNzenvCWsl97Rg0E6YNTIRheSOQN0xo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=P2MkB/Glqusu7CevQ1PUhxGE0j6UBxGJm18FJvqHDtL9l7WBiAwa+4qCNnsPigFDE
	 aFlIEA7JrHY4ffprR11tfFeZKWamd/TFtWWvUO2RYvoKCpI0Vgstrf9Jop4hmg5FVG
	 /mqgZoagodo0ayiLyNnygPQTMAyEwFitN9G1wNyhkhkRw3JzznUxV9AdAgbpJ6+bvB
	 bnDQnU9zHrMx2iUIlDne5wWypMSWfOD/6lEMQcGVzxIDsfjKXn3Vq44t18apegCAgI
	 dtVP2bEW6asW8Pj0Ws8Dx45Y091H3nshjggG5eG7opUAhysm2WuLkUqB+tWhpHAgA5
	 S9ObMxLOD6Z1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B44081764;
	Fri, 27 Feb 2026 08:44:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 63829204
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 08:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54F1340459
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 08:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 55mAZO4OLvob for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 08:44:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 201F04044C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 201F04044C
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 201F04044C
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 08:44:07 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4834826e5a0so19011855e9.2
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 00:44:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772181845; x=1772786645;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OuYcZJwOYTBZ1OCriEjl0bNitHFMSZsaRAkjejd8+tU=;
 b=NbboRg5d8ZC1dBbgyaE6Q+FqVcXfyIpSNZ2C9Qpqdhs2T7gptWXY738tJGTa3bjZNc
 BxZRKQTFPT7eni4XXoA1BqmXvo/dincI6jD1VMDIW6ynDXSWOhVX4PrJHvOgGhqYswGp
 PGF/pO0Cxkhpt/yVEkalav08PdvYCsPdxFbao3BgkzJAYPabsPPlphQLXjLj4FwwJe9A
 NqTfwfyPCqH1TtYi/ey3/afk+4CZ0W0Gm6W9c8EUW9p/hRvwdiiGdWtQfp+XNodIEVSz
 /OvoaGU6CsfeRycmzSGYUvGgn8piYgoTJ7eqWlm/kkPocevA0aL3l9h3B14Zr/eIKx1L
 5KTA==
X-Gm-Message-State: AOJu0YwJF7CQYOEriJhDOMDHUMmUEjebkgSLPYLOiUD3iD4+VAUBpT8K
 DlSWW9SEFc1CqYLkccCgQbORNRSNmyxTHEmmsxOUIDVw+5AgmxplY6ENhYKc37aRXYSdbFPej95
 07Tsa
X-Gm-Gg: ATEYQzwFJu1JSw9Rv0LpMmd26QCtlb7xHkltmJQjI/diNhgkOGOcTwtNvFJPaaNDnbS
 Dosmv5K7H/7fxhwhp38BGmtOevQVg0lLeYtEAqN+lnmLv/0WKX9C85MUGaFGxeK5nZOhK2NBA+d
 tRPXeuCHu1n6TIdaOAvVOE6bBz8i4X1ONMkrJf0MidSRYG7+t/qTek96PAi9khSbhTvDPiTB55Y
 el3dFhVM6y7qVeyRV1Q2UI90+eUWil/TYppGpoW9UInlMyX2vy3uw5QD55E075dVKaXsFu4eINX
 IKlIU4S99B/oOhF4CwQsMDT1KLNIBuyClJwqIQZcrsODxUh/5aSElaHYL8IPo73iGfPxM1V1tqn
 VrrBwWp/MJXEIXnn9Jro0JZsoUuvK/e0fNuxOVVST+m8TWqZ6J++N8QtI5diNWM8VLWROI/6nk+
 MLv/rkKMP+8mf8se4=
X-Received: by 2002:a05:600c:81c9:b0:483:7783:5363 with SMTP id
 5b1f17b1804b1-483c9bfa6bdmr24352455e9.26.1772181845120; 
 Fri, 27 Feb 2026 00:44:05 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfcd0b14sm54379915e9.27.2026.02.27.00.44.04
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 00:44:04 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 27 Feb 2026 09:44:04 +0100
Message-ID: <20260227084404.35563-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772181845; x=1772786645; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=OuYcZJwOYTBZ1OCriEjl0bNitHFMSZsaRAkjejd8+tU=;
 b=QhewATMIY/ZvLc5tyV/PTkqE+0pDTQ3ZcLU+Rq/pcPKZ+MsDjSWNCWUW3X8crUF7/P
 J0dNpXCEaXYzCPMVWq9dt9jKBWh/QfqJ/uGtWPKBbRH7ZCWoliC0yq/ZE47pPpAnAM76
 le42qpvKHrQzSfGrw19967bSR58+vN18RuK3W620TjkYeweCIZttvfnva5zl0Rw84Hsj
 VkrQ5l+nIYQCVERfc37VBv5GSg86My7t2plyV5sFLYoo6GIInWZGmDQsEVVjImmhGNnN
 S727+CMFFVRMj7X+APQG/EFfP2sRFIxjD/UA0hy4pXkMh70te171p6ZFU2VRNZCELjMW
 XDSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QhewATMI
Subject: [Buildroot] [PATCH] package/botan: add patch for CVE-2024-50382 &
 CVE-2024-50383
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following vulnerabilities:

- CVE-2024-50382:
    Botan before 3.6.0, when certain LLVM versions are used, has compiler-
    induced secret-dependent control flow in lib/utils/ghash/ghash.cpp in
    GHASH in AES-GCM. There is a branch instead of an XOR with carry. This
    was observed for Clang in LLVM 15 on RISC-V.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2024-50382
  - https://github.com/randombit/botan/commit/53b0cfde580e86b03d0d27a488b6c134f662e957

- CVE-2024-50383:
    Botan before 3.6.0, when certain GCC versions are used, has a
    compiler-induced secret-dependent operation in lib/utils/donna128.h in
    donna128 (used in Chacha-Poly1305 and x25519). An addition can be
    skipped if a carry is not set. This was observed for GCC 11.3.0 with
    -O2 on MIPS, and GCC on x86-i386. (Only 32-bit processors can be
    affected.)

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2024-50383
  - https://github.com/randombit/botan/commit/53b0cfde580e86b03d0d27a488b6c134f662e957

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...avoid-compiler-induced-side-channels.patch | 65 +++++++++++++++++++
 package/botan/botan.mk                        |  3 +
 2 files changed, 68 insertions(+)
 create mode 100644 package/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch

diff --git a/package/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch b/package/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch
new file mode 100644
index 0000000000..22f64be1b9
--- /dev/null
+++ b/package/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch
@@ -0,0 +1,65 @@
+From 53b0cfde580e86b03d0d27a488b6c134f662e957 Mon Sep 17 00:00:00 2001
+From: Jack Lloyd <jack@randombit.net>
+Date: Sat, 19 Oct 2024 07:43:18 -0400
+Subject: [PATCH] Add more value barriers to avoid compiler induced side
+ channels
+
+The paper https://arxiv.org/pdf/2410.13489 claims that on specific
+architectures Clang and GCC may introduce jumps here. The donna128
+issues only affect 32-bit processors, which explains why we would not
+see it in the x86-64 valgrind runs.
+
+The GHASH leak would seem to be generic but the authors only observed
+it on RISC-V.
+
+CVE: CVE-2024-50382
+CVE: CVE-2024-50383
+Upstream: https://github.com/randombit/botan/commit/53b0cfde580e86b03d0d27a488b6c134f662e957
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/lib/utils/donna128.h      | 5 +++--
+ src/lib/utils/ghash/ghash.cpp | 2 +-
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/src/lib/utils/donna128.h b/src/lib/utils/donna128.h
+index 8212bd349e0..7adf54546df 100644
+--- a/src/lib/utils/donna128.h
++++ b/src/lib/utils/donna128.h
+@@ -8,6 +8,7 @@
+ #ifndef BOTAN_CURVE25519_DONNA128_H_
+ #define BOTAN_CURVE25519_DONNA128_H_
+ 
++#include <botan/internal/ct_utils.h>
+ #include <botan/internal/mul128.h>
+ #include <type_traits>
+ 
+@@ -73,14 +74,14 @@ class donna128 final {
+          l += x.l;
+          h += x.h;
+ 
+-         const uint64_t carry = (l < x.l);
++         const uint64_t carry = CT::Mask<uint64_t>::is_lt(l, x.l).if_set_return(1);
+          h += carry;
+          return *this;
+       }
+ 
+       constexpr donna128& operator+=(uint64_t x) {
+          l += x;
+-         const uint64_t carry = (l < x);
++         const uint64_t carry = CT::Mask<uint64_t>::is_lt(l, x).if_set_return(1);
+          h += carry;
+          return *this;
+       }
+diff --git a/src/lib/utils/ghash/ghash.cpp b/src/lib/utils/ghash/ghash.cpp
+index 8c3b1ed6c2a..61b28590002 100644
+--- a/src/lib/utils/ghash/ghash.cpp
++++ b/src/lib/utils/ghash/ghash.cpp
+@@ -131,7 +131,7 @@ void GHASH::key_schedule(std::span<const uint8_t> key) {
+          m_HM[4 * j + 2 * i + 1] = H1;
+ 
+          // GCM's bit ops are reversed so we carry out of the bottom
+-         const uint64_t carry = R * (H1 & 1);
++         const uint64_t carry = CT::Mask<uint64_t>::expand(H1 & 1).if_set_return(R);
+          H1 = (H1 >> 1) | (H0 << 63);
+          H0 = (H0 >> 1) ^ carry;
+       }
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 561e7bf702..38948f0184 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -11,6 +11,9 @@ BOTAN_LICENSE = BSD-2-Clause
 BOTAN_LICENSE_FILES = license.txt
 BOTAN_CPE_ID_VALID = YES
 
+# 0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch
+BOTAN_IGNORE_CVES += CVE-2024-50382 CVE-2024-50383
+
 BOTAN_INSTALL_STAGING = YES
 
 BOTAN_DEPENDENCIES = host-python3
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
