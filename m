Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3640FCC067
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58BD0420F7;
	Fri,  6 Mar 2026 19:53:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dhw5hYYSsznH; Fri,  6 Mar 2026 19:53:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0873E42042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826798;
	bh=MveGS/r8+PliO/6sLuTQIrln81iE8D9Qetd/q7hLzCE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XQ8/V7joX6ErZm2ZpTQF3A64Q0gELN4frpeLSNYbClBpWrK5K6DMCb9/flQeS/tnO
	 i23dJD9vRWHAb2Q3KPmM/91mY9U7d+in4NdNaqNex8ShoxO/SLiNkIOnraEnyF2iOb
	 culJNAhTvckJGQIcho4uGr9iWP428WrjPRCU/Egk/Ss6oAFfcg7jJE6Guxx3p6ww4U
	 6dtHONltSUNfHkM+yZGvPgBDxZyB1+ueKGoKRsCkTxMFSBDwpz8zZwcRCrW9ieKI77
	 NbDakZObC+XDIQnFir7MczHMHnPRLM3eBjUaall7VbcZY89oH9cze5KEFqoGy56iVe
	 EzPCtjr3dZaWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0873E42042;
	Fri,  6 Mar 2026 19:53:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B70E2223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D11340343
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxCtclVkxw-P for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8B15C406BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B15C406BE
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B15C406BE
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:11 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-439d8dc4ae4so1151402f8f.2
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826789; x=1773431589;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OntlVCpTtl45FpIjWguQZ4wy3nQzvewl9NaPLl5X8es=;
 b=FpqvxfabOjG67AAk/j7Y1wmM49bJmGuT6JHB4piYdc1TelZB8/F7elRjdTNVstyVlp
 gFpKguz/CR6hdo4902PSAB9POxcbu/n95eEuTHbK6FPP4rWG+4tjusLo06q0z5PYRD75
 537vZS9b6pFXu+ti1hMjgci1+3up/VbrCB84ziZugf9JEYR8ANBqephB+3ne7kwLcL9G
 nk9KEjR6ZzS+maJ3mQH0UMPvgY4UmNrVKm8sEpe847sYIOxyFYvIGTxoFlWQeO6VSHix
 +q5vhbArUX275POCNlWLsBYh01d8Ak6yZbeBelmYk005+AtNqQmfcB3cxUbqdO0aPYXB
 F0CA==
X-Gm-Message-State: AOJu0YxLm712GKLlKzInv/d3KMkEjn5MeihH0f54z1TzGntIUlSQRlIl
 2gbSvDvb+e4+bWLKUiTQRlweUevTdGojPPCXYfFHrJgRfq8gafTh/axbUk9LdN7txqwtaWo5gwI
 Jw5G/
X-Gm-Gg: ATEYQzw2G/hG58ewQU4z5uPhtTd8bGEzGEZ3DQlgq+95pg1lCQIH8ebsPEm4MkPYYdw
 TpUwPz8odWpk1TlahbwTKQRObljof8Wmgq8XAvvwV2eIme5CwtcHO/GI1eRl5giLruFcDE64i1A
 YBw4a/rpppiAuuHJMVUhxTM12QFTVJ7CZZLNrCMgLlSU9gRv3fuTMkG+EORl0mRwXWeQieO/ywy
 a4Kb3BGwWyklK8rHF2xNLLZeb2JElb0eB2Q99u7Nnnp3pmM3QZKiwgwfm5sWlDyxONg6A3hESZP
 kjtPdoed5cU4JJAQeLmtWzNZolHNwcX0aMt14Wtuo/MHGhkiAOb/VCK52V7LnFlnagTsRYA9o0+
 LJ/pT4BENcg49CbjsWVk78zL+xbmFeZHa5s7t/707PrqBxyf7etLmAB2DzM46JKM8zl/GQvLQ4Z
 3jHRGxo/tV6wd56X4=
X-Received: by 2002:a05:6000:4301:b0:439:c1b7:890d with SMTP id
 ffacd0b85a97d-439da369d2fmr5751090f8f.26.1772826789417; 
 Fri, 06 Mar 2026 11:53:09 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae2ba66sm4961734f8f.20.2026.03.06.11.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:08 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:08 +0100
Message-ID: <20260306195308.7643-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227084404.35563-1-thomas.perale@mind.be>
References: <20260227084404.35563-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826789; x=1773431589; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OntlVCpTtl45FpIjWguQZ4wy3nQzvewl9NaPLl5X8es=;
 b=ZSFSSRE8PfswB+GlJKzdY2VXT8D1F65u05CGOq0nzew2xaXhhhB/8JnWiKqmGnBm7c
 utUKwGd8pYStQXyDlN9rCoq9ALaEZ4cBow+WZEKBj338HoDys6uLYhI20pKc1XVDzTxH
 wjUXeBFia3+NB7pcoqy4gw2J4bnfNFpErBJyKfZ+OgbgPcQu8xwkGFR9CY4RBlBYLwCy
 uRiuLDPHLdvMMIYdFEqpu1f2l9slP1gWlVDGEDTHlP8M3itwJE93rAdMf9EF3IjNHOqL
 +MRYpxwVq5cd1sJKDMm+WkGIPBhgAYAGLmyMlnbEeou8Qt23ZVTb7Ontjrb9vCEoIBUg
 TpbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZSFSSRE8
Subject: Re: [Buildroot] [PATCH] package/botan: add patch for CVE-2024-50382
 & CVE-2024-50383
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

In reply of:
> Fixes the following vulnerabilities:
> 
> - CVE-2024-50382:
>     Botan before 3.6.0, when certain LLVM versions are used, has compiler-
>     induced secret-dependent control flow in lib/utils/ghash/ghash.cpp in
>     GHASH in AES-GCM. There is a branch instead of an XOR with carry. This
>     was observed for Clang in LLVM 15 on RISC-V.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2024-50382
>   - https://github.com/randombit/botan/commit/53b0cfde580e86b03d0d27a488b6c134f662e957
> 
> - CVE-2024-50383:
>     Botan before 3.6.0, when certain GCC versions are used, has a
>     compiler-induced secret-dependent operation in lib/utils/donna128.h in
>     donna128 (used in Chacha-Poly1305 and x25519). An addition can be
>     skipped if a carry is not set. This was observed for GCC 11.3.0 with
>     -O2 on MIPS, and GCC on x86-i386. (Only 32-bit processors can be
>     affected.)
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2024-50383
>   - https://github.com/randombit/botan/commit/53b0cfde580e86b03d0d27a488b6c134f662e957
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  ...avoid-compiler-induced-side-channels.patch | 65 +++++++++++++++++++
>  package/botan/botan.mk                        |  3 +
>  2 files changed, 68 insertions(+)
>  create mode 100644 package/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch
> 
> diff --git a/package/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch b/package/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch
> new file mode 100644
> index 0000000000..22f64be1b9
> --- /dev/null
> +++ b/package/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch
> @@ -0,0 +1,65 @@
> +From 53b0cfde580e86b03d0d27a488b6c134f662e957 Mon Sep 17 00:00:00 2001
> +From: Jack Lloyd <jack@randombit.net>
> +Date: Sat, 19 Oct 2024 07:43:18 -0400
> +Subject: [PATCH] Add more value barriers to avoid compiler induced side
> + channels
> +
> +The paper https://arxiv.org/pdf/2410.13489 claims that on specific
> +architectures Clang and GCC may introduce jumps here. The donna128
> +issues only affect 32-bit processors, which explains why we would not
> +see it in the x86-64 valgrind runs.
> +
> +The GHASH leak would seem to be generic but the authors only observed
> +it on RISC-V.
> +
> +CVE: CVE-2024-50382
> +CVE: CVE-2024-50383
> +Upstream: https://github.com/randombit/botan/commit/53b0cfde580e86b03d0d27a488b6c134f662e957
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/lib/utils/donna128.h      | 5 +++--
> + src/lib/utils/ghash/ghash.cpp | 2 +-
> + 2 files changed, 4 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/lib/utils/donna128.h b/src/lib/utils/donna128.h
> +index 8212bd349e0..7adf54546df 100644
> +--- a/src/lib/utils/donna128.h
> ++++ b/src/lib/utils/donna128.h
> +@@ -8,6 +8,7 @@
> + #ifndef BOTAN_CURVE25519_DONNA128_H_
> + #define BOTAN_CURVE25519_DONNA128_H_
> + 
> ++#include <botan/internal/ct_utils.h>
> + #include <botan/internal/mul128.h>
> + #include <type_traits>
> + 
> +@@ -73,14 +74,14 @@ class donna128 final {
> +          l += x.l;
> +          h += x.h;
> + 
> +-         const uint64_t carry = (l < x.l);
> ++         const uint64_t carry = CT::Mask<uint64_t>::is_lt(l, x.l).if_set_return(1);
> +          h += carry;
> +          return *this;
> +       }
> + 
> +       constexpr donna128& operator+=(uint64_t x) {
> +          l += x;
> +-         const uint64_t carry = (l < x);
> ++         const uint64_t carry = CT::Mask<uint64_t>::is_lt(l, x).if_set_return(1);
> +          h += carry;
> +          return *this;
> +       }
> +diff --git a/src/lib/utils/ghash/ghash.cpp b/src/lib/utils/ghash/ghash.cpp
> +index 8c3b1ed6c2a..61b28590002 100644
> +--- a/src/lib/utils/ghash/ghash.cpp
> ++++ b/src/lib/utils/ghash/ghash.cpp
> +@@ -131,7 +131,7 @@ void GHASH::key_schedule(std::span<const uint8_t> key) {
> +          m_HM[4 * j + 2 * i + 1] = H1;
> + 
> +          // GCM's bit ops are reversed so we carry out of the bottom
> +-         const uint64_t carry = R * (H1 & 1);
> ++         const uint64_t carry = CT::Mask<uint64_t>::expand(H1 & 1).if_set_return(R);
> +          H1 = (H1 >> 1) | (H0 << 63);
> +          H0 = (H0 >> 1) ^ carry;
> +       }
> diff --git a/package/botan/botan.mk b/package/botan/botan.mk
> index 561e7bf702..38948f0184 100644
> --- a/package/botan/botan.mk
> +++ b/package/botan/botan.mk
> @@ -11,6 +11,9 @@ BOTAN_LICENSE = BSD-2-Clause
>  BOTAN_LICENSE_FILES = license.txt
>  BOTAN_CPE_ID_VALID = YES
>  
> +# 0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch
> +BOTAN_IGNORE_CVES += CVE-2024-50382 CVE-2024-50383
> +
>  BOTAN_INSTALL_STAGING = YES
>  
>  BOTAN_DEPENDENCIES = host-python3
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
