Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6CFF5A8C8
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 22:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01D8641104;
	Mon, 20 Apr 2026 22:09:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C3XxXPsTHjlC; Mon, 20 Apr 2026 22:09:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C92244112A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776722943;
	bh=XWqpd03l3dQXH3TZRCKrHdOCCVhvBtjh3G8wLKT4fgM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=b4CLixBoOCV40itbG1vhP6XXGuhDlZCNLjViwGnmb4o8757lFJ9/GSJBlBwfObc0r
	 6xbaw7dhKoUBQesQXNskPOt8wAOercRiOPcZJl0GY0qo39cC6dBwIpWqHRHz2xNCX+
	 Rb1Jw/2ygPepYHTOSIWb40a2e6d2pbEFcSuILhzzo6UUWc2USMr0I/DMH8pIkSZ2nL
	 wSAloChIEKHwkBLpBXmvmXPFoPzdluXZ/fS/qBQYooyFI9LvB5hxWTG9ytokZEEZ0o
	 EJSiyFI7XGYzd2ozmwg7YgMS1eFoo+AdGibVzfb6wFvXgTVyVyODN5zIN8worSAK01
	 c51D3vQ8UgfLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C92244112A;
	Mon, 20 Apr 2026 22:09:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A9E2524D
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 22:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BCFD41110
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 22:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hbb0kKVJFqWE for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 22:09:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 128C841104
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 128C841104
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 128C841104
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 22:08:59 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCbEf-1w5pqK3f6Z-001S2C; Tue, 21
 Apr 2026 00:08:52 +0200
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Fiona Klute <fiona.klute@gmx.de>
Date: Tue, 21 Apr 2026 00:08:39 +0200
Message-ID: <20260420220839.1232620-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420220839.1232620-1-fiona.klute@gmx.de>
References: <20260420220839.1232620-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:2Yd4jlhMlGr45K9KCZgrXnzl13G8wLf2wDF0nQgfSz73TdhK5gd
 7Mzzh01g48jXVjzXURXSqzyYvfXBvs8YUWIAJydEWiwsU92pL6JykI/ooykp6hNIiCLg3RF
 sp0mllCE277d/PX+XmoNLNQ2HxCceXau4ufIb8F+W+2IC+/nsnr0XS845Pkw4l1rMukFBNl
 s8AAwu5iHJtz0btAIF0Bg==
UI-OutboundReport: notjunk:1;M01:P0:PiRX5o9iIV8=;d3jDujMJw5O1nfi9s0mCfod16/Q
 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
 Y/9sm80DiNLQTOQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1776722932; x=1777327732; i=fiona.klute@gmx.de;
 bh=gCi2Kc1uLA9GFAKo/c1emGndQ0teTVqEQ3xqEj0NWe4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=WYJOe4ID7RqVx/GGJrRl1HwCA9vQW1XtxjYU8ox+cREPcBtgITZF0gEZdCTccgxo
 fNguftxOPkkvIxdT+bLUsaZuGqHI/D0kHF0GmkvR8+IlqqR2iB2LKyZJmW45efcy0
 vrh1KO90UmGvcJ/4XjK2REQdjeGUmaIdnvlqdmNTKKiJ1r15D+Qdgh3tNlHI66gxr
 zFMoLdH83WoxLtnk+69ENc51wTbnO/FtmtETIbQ0wTyPw/N35xlIReiBvmLmVkIJ6
 hyI6XbKkyCBlzCCteJjYJctYM2Uw63f5EoZEyBit+M+gQK4lEp5cgEub+Z4Pccloa
 OzSwWnadbgsqp2nRXQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=WYJOe4ID
Subject: [Buildroot] [PATCH 2/2] package/musl: add upstream security patches
 for CVE-2026-40200
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2026-40200: musl libc: stack corruption in qsort with
sufficiently large inputs
https://www.openwall.com/lists/musl/2026/04/10/3

Fixes: https://nvd.nist.gov/vuln/detail/CVE-2026-40200

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 ...do-heap-corruption-from-bug-in-doubl.patch | 48 +++++++++
 ...ude-oob-array-writes-independent-of-.patch | 97 +++++++++++++++++++
 ...06-qsort-fix-shift-UB-in-shl-and-shr.patch | 43 ++++++++
 package/musl/musl.mk                          |  5 +
 4 files changed, 193 insertions(+)
 create mode 100644 package/musl/0004-qsort-fix-leonardo-heap-corruption-from-bug-in-doubl.patch
 create mode 100644 package/musl/0005-qsort-hard-preclude-oob-array-writes-independent-of-.patch
 create mode 100644 package/musl/0006-qsort-fix-shift-UB-in-shl-and-shr.patch

diff --git a/package/musl/0004-qsort-fix-leonardo-heap-corruption-from-bug-in-doubl.patch b/package/musl/0004-qsort-fix-leonardo-heap-corruption-from-bug-in-doubl.patch
new file mode 100644
index 0000000000..1f179552df
--- /dev/null
+++ b/package/musl/0004-qsort-fix-leonardo-heap-corruption-from-bug-in-doubl.patch
@@ -0,0 +1,48 @@
+From 228da39e38c1cae13cbe637e771412c1984dba5d Mon Sep 17 00:00:00 2001
+From: Rich Felker <dalias@aerifal.cx>
+Date: Thu, 9 Apr 2026 22:51:30 -0400
+Subject: [PATCH] qsort: fix leonardo heap corruption from bug in doubleword
+ ctz primitive
+
+the pntz function, implementing a "count trailing zeros" variant for a
+bit vector consisting of two size_t words, erroneously returned zero
+rather than the number of bits in the low word when the first bit set
+was the low bit of the high word.
+
+as a result, a loop in the trinkle function which should have a
+guaranteed small bound on the number of iterations, could run
+unboundedly, thereby overflowing a stack-based working-space array
+which was sized for the bound.
+
+CVE-2026-40200 has been assigned for this issue.
+
+CVE: CVE-2026-40200
+Upstream: https://git.musl-libc.org/cgit/musl/commit/?id=228da39e38c1cae13cbe637e771412c1984dba5d
+Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
+---
+ src/stdlib/qsort.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/stdlib/qsort.c b/src/stdlib/qsort.c
+index ab79dc6f..13219ab3 100644
+--- a/src/stdlib/qsort.c
++++ b/src/stdlib/qsort.c
+@@ -34,11 +34,11 @@
+ 
+ typedef int (*cmpfun)(const void *, const void *, void *);
+ 
++/* returns index of first bit set, excluding the low bit assumed to always
++ * be set, starting from low bit of p[0] up through high bit of p[1] */
+ static inline int pntz(size_t p[2]) {
+-	int r = ntz(p[0] - 1);
+-	if(r != 0 || (r = 8*sizeof(size_t) + ntz(p[1])) != 8*sizeof(size_t)) {
+-		return r;
+-	}
++	if (p[0] != 1) return ntz(p[0] - 1);
++	if (p[1]) return 8*sizeof(size_t) + ntz(p[1]);
+ 	return 0;
+ }
+ 
+-- 
+2.53.0
+
diff --git a/package/musl/0005-qsort-hard-preclude-oob-array-writes-independent-of-.patch b/package/musl/0005-qsort-hard-preclude-oob-array-writes-independent-of-.patch
new file mode 100644
index 0000000000..1604ae9dc4
--- /dev/null
+++ b/package/musl/0005-qsort-hard-preclude-oob-array-writes-independent-of-.patch
@@ -0,0 +1,97 @@
+From b3291b9a9f77f1f993d2b4f8c68a26cf09221ae7 Mon Sep 17 00:00:00 2001
+From: Rich Felker <dalias@aerifal.cx>
+Date: Thu, 9 Apr 2026 23:40:53 -0400
+Subject: [PATCH] qsort: hard-preclude oob array writes independent of any
+ invariants
+
+while the root cause of CVE-2026-40200 was a faulty ctz primitive, the
+fallout of the bug would have been limited to erroneous sorting or
+infinite loop if not for the stores to a stack-based array that
+depended on trusting invariants in order not to go out of bounds.
+
+increase the size of the array to a power of two so that we can mask
+indices into it to force them into range. in the absence of any
+further bug, the masking is a no-op, but it does not have any
+measurable performance cost, and it makes spatial memory safety
+trivial to prove (and for readers not familiar with the algorithms to
+trust).
+
+CVE: CVE-2026-40200
+Upstream: https://git.musl-libc.org/cgit/musl/commit/?id=b3291b9a9f77f1f993d2b4f8c68a26cf09221ae7
+Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
+---
+ src/stdlib/qsort.c | 20 +++++++++++++-------
+ 1 file changed, 13 insertions(+), 7 deletions(-)
+
+diff --git a/src/stdlib/qsort.c b/src/stdlib/qsort.c
+index 13219ab3..e4bce9f7 100644
+--- a/src/stdlib/qsort.c
++++ b/src/stdlib/qsort.c
+@@ -89,10 +89,16 @@ static inline void shr(size_t p[2], int n)
+ 	p[1] >>= n;
+ }
+ 
++/* power-of-two length for working array so that we can mask indices and
++ * not depend on any invariant of the algorithm for spatial memory safety.
++ * the original size was just 14*sizeof(size_t)+1 */
++#define AR_LEN  (16 * sizeof(size_t))
++#define AR_MASK (AR_LEN - 1)
++
+ static void sift(unsigned char *head, size_t width, cmpfun cmp, void *arg, int pshift, size_t lp[])
+ {
+ 	unsigned char *rt, *lf;
+-	unsigned char *ar[14 * sizeof(size_t) + 1];
++	unsigned char *ar[AR_LEN];
+ 	int i = 1;
+ 
+ 	ar[0] = head;
+@@ -104,16 +110,16 @@ static void sift(unsigned char *head, size_t width, cmpfun cmp, void *arg, int p
+ 			break;
+ 		}
+ 		if(cmp(lf, rt, arg) >= 0) {
+-			ar[i++] = lf;
++			ar[i++ & AR_MASK] = lf;
+ 			head = lf;
+ 			pshift -= 1;
+ 		} else {
+-			ar[i++] = rt;
++			ar[i++ & AR_MASK] = rt;
+ 			head = rt;
+ 			pshift -= 2;
+ 		}
+ 	}
+-	cycle(width, ar, i);
++	cycle(width, ar, i & AR_MASK);
+ }
+ 
+ static void trinkle(unsigned char *head, size_t width, cmpfun cmp, void *arg, size_t pp[2], int pshift, int trusty, size_t lp[])
+@@ -121,7 +127,7 @@ static void trinkle(unsigned char *head, size_t width, cmpfun cmp, void *arg, si
+ 	unsigned char *stepson,
+ 	              *rt, *lf;
+ 	size_t p[2];
+-	unsigned char *ar[14 * sizeof(size_t) + 1];
++	unsigned char *ar[AR_LEN];
+ 	int i = 1;
+ 	int trail;
+ 
+@@ -142,7 +148,7 @@ static void trinkle(unsigned char *head, size_t width, cmpfun cmp, void *arg, si
+ 			}
+ 		}
+ 
+-		ar[i++] = stepson;
++		ar[i++ & AR_MASK] = stepson;
+ 		head = stepson;
+ 		trail = pntz(p);
+ 		shr(p, trail);
+@@ -150,7 +156,7 @@ static void trinkle(unsigned char *head, size_t width, cmpfun cmp, void *arg, si
+ 		trusty = 0;
+ 	}
+ 	if(!trusty) {
+-		cycle(width, ar, i);
++		cycle(width, ar, i & AR_MASK);
+ 		sift(head, width, cmp, arg, pshift, lp);
+ 	}
+ }
+-- 
+2.53.0
+
diff --git a/package/musl/0006-qsort-fix-shift-UB-in-shl-and-shr.patch b/package/musl/0006-qsort-fix-shift-UB-in-shl-and-shr.patch
new file mode 100644
index 0000000000..455a0677e2
--- /dev/null
+++ b/package/musl/0006-qsort-fix-shift-UB-in-shl-and-shr.patch
@@ -0,0 +1,43 @@
+From 5122f9f3c99fee366167c5de98b31546312921ab Mon Sep 17 00:00:00 2001
+From: Luca Kellermann <mailto.luca.kellermann@gmail.com>
+Date: Fri, 10 Apr 2026 03:03:22 +0200
+Subject: [PATCH] qsort: fix shift UB in shl and shr
+
+if shl() or shr() are called with n==8*sizeof(size_t), n is adjusted
+to 0. the shift by (sizeof(size_t) * 8 - n) that then follows will
+consequently shift by the width of size_t, which is UB and in practice
+produces an incorrect result.
+
+return early in this case. the bitvector p was already shifted by the
+required amount.
+
+CVE: CVE-2026-40200
+Upstream: https://git.musl-libc.org/cgit/musl/commit/?id=5122f9f3c99fee366167c5de98b31546312921ab
+Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
+---
+ src/stdlib/qsort.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/stdlib/qsort.c b/src/stdlib/qsort.c
+index e4bce9f7..28607450 100644
+--- a/src/stdlib/qsort.c
++++ b/src/stdlib/qsort.c
+@@ -71,6 +71,7 @@ static inline void shl(size_t p[2], int n)
+ 		n -= 8 * sizeof(size_t);
+ 		p[1] = p[0];
+ 		p[0] = 0;
++		if (!n) return;
+ 	}
+ 	p[1] <<= n;
+ 	p[1] |= p[0] >> (sizeof(size_t) * 8 - n);
+@@ -83,6 +84,7 @@ static inline void shr(size_t p[2], int n)
+ 		n -= 8 * sizeof(size_t);
+ 		p[0] = p[1];
+ 		p[1] = 0;
++		if (!n) return;
+ 	}
+ 	p[0] >>= n;
+ 	p[0] |= p[1] << (sizeof(size_t) * 8 - n);
+-- 
+2.53.0
+
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 29a9c90ce1..5384a08abf 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -29,6 +29,11 @@ MUSL_INSTALL_STAGING = YES
 # 0003-fix-pathological-slowness-incorrect-mappings-in-icon.patch
 MUSL_IGNORE_CVES += CVE-2026-6042
 
+# 0004-qsort-fix-leonardo-heap-corruption-from-bug-in-doubl.patch
+# 0005-qsort-hard-preclude-oob-array-writes-independent-of-.patch
+# 0006-qsort-fix-shift-UB-in-shl-and-shr.patch
+MUSL_IGNORE_CVES += CVE-2026-40200
+
 # musl does not build with LTO, so explicitly disable it
 # when using a compiler that may have support for LTO
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7),y)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
