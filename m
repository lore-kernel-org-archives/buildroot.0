Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493B7FF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 230BF614FF;
	Mon,  4 May 2026 14:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7IgJn07C5rnB; Mon,  4 May 2026 14:47:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D314D61501
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906064;
	bh=uEBJ8i7TO0WgptdkyDI9GZXjsV6FJmYHPSduc76g2p8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gLCqoVtiXTT4q9paot8l2OUWOpSITIdGmyHuLiDqQTUIq6ilTz6EFawc7/5yoeKhC
	 qPJsyqxR8N8KMaaDWswwH7N3ZPYsiDVR8UNeBcYbRVLuvCxwd7XwgKr88abpmTdDt8
	 zA46wPzqBiB6gGA6lNZbZ1T84//G/kudDA2ri+Oq1LI6Jns0Njgu2bRbVO+3vDBRLC
	 MAEQvSkJXWmMjtioD6NslM+xn12Fe0JHUn96o4T1w+okOofqm8pqdQ7WNwGOVl3xxM
	 XJ3F1+WArPDXzydD7NQmOUOI9mxx9y/FifaTrlpF2OAgS8emMqEnPUjo16bDv+pfkn
	 Uc5Q91KjY6hKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D314D61501;
	Mon,  4 May 2026 14:47:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 887BB25D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79D88845F2
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uYck3BPyNql0 for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:47:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1C617845BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C617845BF
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C617845BF
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:41 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-44a786a9a35so1975759f8f.3
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906060; x=1778510860;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=N72i6ldoQgFBhFD77ddXju5LITFATTv4Tq3XcXaJriQ=;
 b=ZbEpG1Lw/Of/lY25U3qPP+qV1mIQ6dpv8Pe36kaNt1Y3wmtNjS+GFiDXCVoC313tFF
 nBlQCSNaNSqaN78OEBanrpjou6i4ZVemE4/tVLJqw644V6M0r+xXYoqnWyYvoACIhNBE
 019XOkXGjkLXkYjRTvhwkYKAXtZBrbTSS4xTJyyZOHSpzL1DK/nJeXdfdlvbNKR+J+wi
 zubBIS0lanU0a1kvzHy98GCf94xaysr6x2n3qvrT6wY4M0EbGKdd37PDBoarcPcPhB6T
 /aappplA3C/FeoofsYKMI+XQBM6lJxWkjJ7vUSJ2W1WHaLafV/4cLbf1Q8ya0AT15zvG
 ZdbA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9+PVHh7Q8UCtImli82IQAn7NDqfJV5fbt2ULYdE9GvB0F/HGVEVkHnfMIIrHqSV9PNIHNjLUdIS28=@buildroot.org
X-Gm-Message-State: AOJu0YyekXM/SuIZRtIRoi9ct7D/Mz0lyIQP6UYbtxxH52q8OOlwkhl/
 Sg1241Q3HiZ1zuRtFLXwtybXg6uavQeuhzby1tJABpKQBFflbA94iYhOOsc1/L6+cFM=
X-Gm-Gg: AeBDieu9BmLpkBTSoNMv20YDliif+zdax+pAcJQIwrAmyT08ZyCcHp/mQysjuNXZLeJ
 HuEUMMoTsq+JpF60BF/9ZBCLmphhUhdavy7wZFgu3gOQxLw1dppMyiztd/BFYxetqTZw6sAcqNx
 MJalHNDl7sNOhDHrJjBIsmatcLl33X5thujJD3eKt0HrJ6KZqnevBj2RDLVk23YXoJeXXV/Jqjg
 qu+lK2Zb1ASevInZ1J5A3sLCwahrmxfKJ2qwq9I9EuXguPaVueUsxQA0wfV+/pbxr5NGA1hIFDy
 dHfiGYrPFgBqiuOli3DN6rPAQ8tm5xutNS1hqwFVIoRG7TCMH+baM+NwGch8DW/6CdCbxCi91wc
 bwBcEBgILQKzfv5clDrOX4bu5T9vEgJbE/PfAind5Jz2bfawBhBC2HCIpbrsouOfGNLDHGeXOU3
 Ak5kxCvjoxML/yiBUr7y3L5ZW6Fg==
X-Received: by 2002:a05:6000:61e:b0:43f:ea25:20ff with SMTP id
 ffacd0b85a97d-44bb65df078mr18121625f8f.29.1777906059991; 
 Mon, 04 May 2026 07:47:39 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44a986aab44sm27621053f8f.29.2026.05.04.07.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:47:39 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  4 May 2026 16:47:39 +0200
Message-ID: <20260504144739.10004-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260420220839.1232620-3-fiona.klute@gmx.de>
References: <20260420220839.1232620-3-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906060; x=1778510860; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N72i6ldoQgFBhFD77ddXju5LITFATTv4Tq3XcXaJriQ=;
 b=Fx9E1Rl6HbmJWkvfRqPERhSxkkEAUE95mVpJ3HoDRlT3T5m6t1JaB9dVaYBrmfd/jE
 yZsfd623D+oo5Gp5WdZuEFDfJdSJ+bEKQJ1v9BpudXAIivRX8ioohZhVg/eC2OU65E3L
 APSN3QT88wHqsfjZRWM4W7ue/mnFswCo204oJgqfFNyKpDeuTb1t1Xnmk2I9PWG4CLB/
 md54DBUVqZwHNO3x3pgUx7xdmcsuXzQi+yBeicR4rralCLpHQx18ThtiH5tIlurIqydf
 u+8Jo68IKu0ntTN9K0+zPDZf1BaSoS+HRGajn8+uSgxPJTTK8Lj6RzaVqvaqqzbaIHD1
 NR6Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Fx9E1Rl6
Subject: Re: [Buildroot] [PATCH 2/2] package/musl: add upstream security
 patches for CVE-2026-40200
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
> Fixes CVE-2026-40200: musl libc: stack corruption in qsort with
> sufficiently large inputs
> https://www.openwall.com/lists/musl/2026/04/10/3
> 
> Fixes: https://nvd.nist.gov/vuln/detail/CVE-2026-40200
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  ...do-heap-corruption-from-bug-in-doubl.patch | 48 +++++++++
>  ...ude-oob-array-writes-independent-of-.patch | 97 +++++++++++++++++++
>  ...06-qsort-fix-shift-UB-in-shl-and-shr.patch | 43 ++++++++
>  package/musl/musl.mk                          |  5 +
>  4 files changed, 193 insertions(+)
>  create mode 100644 package/musl/0004-qsort-fix-leonardo-heap-corruption-from-bug-in-doubl.patch
>  create mode 100644 package/musl/0005-qsort-hard-preclude-oob-array-writes-independent-of-.patch
>  create mode 100644 package/musl/0006-qsort-fix-shift-UB-in-shl-and-shr.patch
> 
> diff --git a/package/musl/0004-qsort-fix-leonardo-heap-corruption-from-bug-in-doubl.patch b/package/musl/0004-qsort-fix-leonardo-heap-corruption-from-bug-in-doubl.patch
> new file mode 100644
> index 0000000000..1f179552df
> --- /dev/null
> +++ b/package/musl/0004-qsort-fix-leonardo-heap-corruption-from-bug-in-doubl.patch
> @@ -0,0 +1,48 @@
> +From 228da39e38c1cae13cbe637e771412c1984dba5d Mon Sep 17 00:00:00 2001
> +From: Rich Felker <dalias@aerifal.cx>
> +Date: Thu, 9 Apr 2026 22:51:30 -0400
> +Subject: [PATCH] qsort: fix leonardo heap corruption from bug in doubleword
> + ctz primitive
> +
> +the pntz function, implementing a "count trailing zeros" variant for a
> +bit vector consisting of two size_t words, erroneously returned zero
> +rather than the number of bits in the low word when the first bit set
> +was the low bit of the high word.
> +
> +as a result, a loop in the trinkle function which should have a
> +guaranteed small bound on the number of iterations, could run
> +unboundedly, thereby overflowing a stack-based working-space array
> +which was sized for the bound.
> +
> +CVE-2026-40200 has been assigned for this issue.
> +
> +CVE: CVE-2026-40200
> +Upstream: https://git.musl-libc.org/cgit/musl/commit/?id=228da39e38c1cae13cbe637e771412c1984dba5d
> +Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> +---
> + src/stdlib/qsort.c | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/stdlib/qsort.c b/src/stdlib/qsort.c
> +index ab79dc6f..13219ab3 100644
> +--- a/src/stdlib/qsort.c
> ++++ b/src/stdlib/qsort.c
> +@@ -34,11 +34,11 @@
> + 
> + typedef int (*cmpfun)(const void *, const void *, void *);
> + 
> ++/* returns index of first bit set, excluding the low bit assumed to always
> ++ * be set, starting from low bit of p[0] up through high bit of p[1] */
> + static inline int pntz(size_t p[2]) {
> +-	int r = ntz(p[0] - 1);
> +-	if(r != 0 || (r = 8*sizeof(size_t) + ntz(p[1])) != 8*sizeof(size_t)) {
> +-		return r;
> +-	}
> ++	if (p[0] != 1) return ntz(p[0] - 1);
> ++	if (p[1]) return 8*sizeof(size_t) + ntz(p[1]);
> + 	return 0;
> + }
> + 
> +-- 
> +2.53.0
> +
> diff --git a/package/musl/0005-qsort-hard-preclude-oob-array-writes-independent-of-.patch b/package/musl/0005-qsort-hard-preclude-oob-array-writes-independent-of-.patch
> new file mode 100644
> index 0000000000..1604ae9dc4
> --- /dev/null
> +++ b/package/musl/0005-qsort-hard-preclude-oob-array-writes-independent-of-.patch
> @@ -0,0 +1,97 @@
> +From b3291b9a9f77f1f993d2b4f8c68a26cf09221ae7 Mon Sep 17 00:00:00 2001
> +From: Rich Felker <dalias@aerifal.cx>
> +Date: Thu, 9 Apr 2026 23:40:53 -0400
> +Subject: [PATCH] qsort: hard-preclude oob array writes independent of any
> + invariants
> +
> +while the root cause of CVE-2026-40200 was a faulty ctz primitive, the
> +fallout of the bug would have been limited to erroneous sorting or
> +infinite loop if not for the stores to a stack-based array that
> +depended on trusting invariants in order not to go out of bounds.
> +
> +increase the size of the array to a power of two so that we can mask
> +indices into it to force them into range. in the absence of any
> +further bug, the masking is a no-op, but it does not have any
> +measurable performance cost, and it makes spatial memory safety
> +trivial to prove (and for readers not familiar with the algorithms to
> +trust).
> +
> +CVE: CVE-2026-40200
> +Upstream: https://git.musl-libc.org/cgit/musl/commit/?id=b3291b9a9f77f1f993d2b4f8c68a26cf09221ae7
> +Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> +---
> + src/stdlib/qsort.c | 20 +++++++++++++-------
> + 1 file changed, 13 insertions(+), 7 deletions(-)
> +
> +diff --git a/src/stdlib/qsort.c b/src/stdlib/qsort.c
> +index 13219ab3..e4bce9f7 100644
> +--- a/src/stdlib/qsort.c
> ++++ b/src/stdlib/qsort.c
> +@@ -89,10 +89,16 @@ static inline void shr(size_t p[2], int n)
> + 	p[1] >>= n;
> + }
> + 
> ++/* power-of-two length for working array so that we can mask indices and
> ++ * not depend on any invariant of the algorithm for spatial memory safety.
> ++ * the original size was just 14*sizeof(size_t)+1 */
> ++#define AR_LEN  (16 * sizeof(size_t))
> ++#define AR_MASK (AR_LEN - 1)
> ++
> + static void sift(unsigned char *head, size_t width, cmpfun cmp, void *arg, int pshift, size_t lp[])
> + {
> + 	unsigned char *rt, *lf;
> +-	unsigned char *ar[14 * sizeof(size_t) + 1];
> ++	unsigned char *ar[AR_LEN];
> + 	int i = 1;
> + 
> + 	ar[0] = head;
> +@@ -104,16 +110,16 @@ static void sift(unsigned char *head, size_t width, cmpfun cmp, void *arg, int p
> + 			break;
> + 		}
> + 		if(cmp(lf, rt, arg) >= 0) {
> +-			ar[i++] = lf;
> ++			ar[i++ & AR_MASK] = lf;
> + 			head = lf;
> + 			pshift -= 1;
> + 		} else {
> +-			ar[i++] = rt;
> ++			ar[i++ & AR_MASK] = rt;
> + 			head = rt;
> + 			pshift -= 2;
> + 		}
> + 	}
> +-	cycle(width, ar, i);
> ++	cycle(width, ar, i & AR_MASK);
> + }
> + 
> + static void trinkle(unsigned char *head, size_t width, cmpfun cmp, void *arg, size_t pp[2], int pshift, int trusty, size_t lp[])
> +@@ -121,7 +127,7 @@ static void trinkle(unsigned char *head, size_t width, cmpfun cmp, void *arg, si
> + 	unsigned char *stepson,
> + 	              *rt, *lf;
> + 	size_t p[2];
> +-	unsigned char *ar[14 * sizeof(size_t) + 1];
> ++	unsigned char *ar[AR_LEN];
> + 	int i = 1;
> + 	int trail;
> + 
> +@@ -142,7 +148,7 @@ static void trinkle(unsigned char *head, size_t width, cmpfun cmp, void *arg, si
> + 			}
> + 		}
> + 
> +-		ar[i++] = stepson;
> ++		ar[i++ & AR_MASK] = stepson;
> + 		head = stepson;
> + 		trail = pntz(p);
> + 		shr(p, trail);
> +@@ -150,7 +156,7 @@ static void trinkle(unsigned char *head, size_t width, cmpfun cmp, void *arg, si
> + 		trusty = 0;
> + 	}
> + 	if(!trusty) {
> +-		cycle(width, ar, i);
> ++		cycle(width, ar, i & AR_MASK);
> + 		sift(head, width, cmp, arg, pshift, lp);
> + 	}
> + }
> +-- 
> +2.53.0
> +
> diff --git a/package/musl/0006-qsort-fix-shift-UB-in-shl-and-shr.patch b/package/musl/0006-qsort-fix-shift-UB-in-shl-and-shr.patch
> new file mode 100644
> index 0000000000..455a0677e2
> --- /dev/null
> +++ b/package/musl/0006-qsort-fix-shift-UB-in-shl-and-shr.patch
> @@ -0,0 +1,43 @@
> +From 5122f9f3c99fee366167c5de98b31546312921ab Mon Sep 17 00:00:00 2001
> +From: Luca Kellermann <mailto.luca.kellermann@gmail.com>
> +Date: Fri, 10 Apr 2026 03:03:22 +0200
> +Subject: [PATCH] qsort: fix shift UB in shl and shr
> +
> +if shl() or shr() are called with n==8*sizeof(size_t), n is adjusted
> +to 0. the shift by (sizeof(size_t) * 8 - n) that then follows will
> +consequently shift by the width of size_t, which is UB and in practice
> +produces an incorrect result.
> +
> +return early in this case. the bitvector p was already shifted by the
> +required amount.
> +
> +CVE: CVE-2026-40200
> +Upstream: https://git.musl-libc.org/cgit/musl/commit/?id=5122f9f3c99fee366167c5de98b31546312921ab
> +Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> +---
> + src/stdlib/qsort.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/stdlib/qsort.c b/src/stdlib/qsort.c
> +index e4bce9f7..28607450 100644
> +--- a/src/stdlib/qsort.c
> ++++ b/src/stdlib/qsort.c
> +@@ -71,6 +71,7 @@ static inline void shl(size_t p[2], int n)
> + 		n -= 8 * sizeof(size_t);
> + 		p[1] = p[0];
> + 		p[0] = 0;
> ++		if (!n) return;
> + 	}
> + 	p[1] <<= n;
> + 	p[1] |= p[0] >> (sizeof(size_t) * 8 - n);
> +@@ -83,6 +84,7 @@ static inline void shr(size_t p[2], int n)
> + 		n -= 8 * sizeof(size_t);
> + 		p[0] = p[1];
> + 		p[1] = 0;
> ++		if (!n) return;
> + 	}
> + 	p[0] >>= n;
> + 	p[0] |= p[1] << (sizeof(size_t) * 8 - n);
> +-- 
> +2.53.0
> +
> diff --git a/package/musl/musl.mk b/package/musl/musl.mk
> index 29a9c90ce1..5384a08abf 100644
> --- a/package/musl/musl.mk
> +++ b/package/musl/musl.mk
> @@ -29,6 +29,11 @@ MUSL_INSTALL_STAGING = YES
>  # 0003-fix-pathological-slowness-incorrect-mappings-in-icon.patch
>  MUSL_IGNORE_CVES += CVE-2026-6042
>  
> +# 0004-qsort-fix-leonardo-heap-corruption-from-bug-in-doubl.patch
> +# 0005-qsort-hard-preclude-oob-array-writes-independent-of-.patch
> +# 0006-qsort-fix-shift-UB-in-shl-and-shr.patch
> +MUSL_IGNORE_CVES += CVE-2026-40200
> +
>  # musl does not build with LTO, so explicitly disable it
>  # when using a compiler that may have support for LTO
>  ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7),y)
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
