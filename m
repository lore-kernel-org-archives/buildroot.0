Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D39F5A8BC
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 22:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE6E961017;
	Mon, 20 Apr 2026 22:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LpIJsnTQEQ1g; Mon, 20 Apr 2026 22:09:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1818610F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776722942;
	bh=K8Y5QzmDMJNEo3HRv9D5TgUdjmHAxBxxDO0S9vPKaKM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pehjt3hyyIYV2FThGCXKsSw2jOst1qs7JxwEhjIbaQ4R+aFYoeoE8PKSFgfBN2LTg
	 RKVtWS2dhzUw58JelD8IxPl3pIfFfbf5G9aCVIJzlj45JB/HcJOx0ZQ9lIDacDIdIr
	 ChApz4lrk4Uojo/osuK2OQlLjRnAS/62qduqqE3YDNcEfJ38QhQuV5wn2/P+daBryp
	 vS/YyUvOas8Q8l6wPsSV26ffQiJjrQXaSXjA0bf9vBkqoDOf8p1FM9+iy3wGW8Mh1D
	 SV5JmR9CHi/gQyzKUfWMta816KXocuU50LBdDWCHNEYLRw9KXKG2tURQO36pqYhUK3
	 Mhlj/IzzBqznw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1818610F4;
	Mon, 20 Apr 2026 22:09:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DD2D1259
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 22:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF06341110
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 22:08:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3tQpcNLD6Z2H for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 22:08:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3F90841104
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F90841104
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F90841104
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 22:08:57 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4JmN-1wFDmN1Xph-00Apgg; Tue, 21
 Apr 2026 00:08:50 +0200
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Fiona Klute <fiona.klute@gmx.de>
Date: Tue, 21 Apr 2026 00:08:38 +0200
Message-ID: <20260420220839.1232620-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420220839.1232620-1-fiona.klute@gmx.de>
References: <20260420220839.1232620-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:N6VksApCPXvpzEL3N4vpwf1XoNRCZZO55VP9NHYtjELNG2VgHuO
 MDXv0p/P8ioy5kvUTrNb31FL9IWZIkiGq0MmNPTw0XGOUDHbXnRe2oP3tZ8RmgOPEvdrUnq
 vD5lli6rykGYTiCWtCOg0osY2KgYHlR9XUhm07VUtxMiQxkduebcGilk8UwBoxvHStVzx7T
 o6HU2Ihlqba1unF6X3J7A==
UI-OutboundReport: notjunk:1;M01:P0:9EivL49IBh4=;b/p5U4UP/I2keOT9O7ncGBjjRG4
 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
 By38DA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1776722930; x=1777327730; i=fiona.klute@gmx.de;
 bh=/f1DSmyV7y3CCB/ih05dUSIqofm7ItwMxG7BbBG0s2U=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=MY8BLM+FWEx57FAs9eMkkrU6VHTUqQ+vAR1pZ17nSUDk5gNcY1ebOaxSi2E42pJ7
 H3o6DR4IGBsn9qiGxDTfSINxQICKrGMfFp8CudCiFTL/jcmvE/OvT66WmMcl1wSyK
 ux7f15AJ6y0fRo4UZ2cPgjpOS51QIBlZaBmgUOPxtAtRjLZR5BLnKig4MpwPG5Kvy
 pPK6bLWphfZLLwnzJJrxfEcO561t1NJP4UF7YyPtVlsptqfcjWxWoCHCAyGDeNNV0
 I93X+finQdDyKmob4ErhIKmy+WYQM0EYewQNR9731sI6M82Uj1OgzWEL7KHVZruYE
 27hoBFCiZ1+n/LQ8zg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=MY8BLM+F
Subject: [Buildroot] [PATCH 1/2] package/musl: add upstream security patch
 for CVE-2026-6042
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

Fixes CVE-2026-6042: musl libc: Algorithmic complexity DoS in iconv
GB18030 decoder
https://www.openwall.com/lists/oss-security/2026/04/09/19

Fixes: https://nvd.nist.gov/vuln/detail/CVE-2026-6042

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 ...-slowness-incorrect-mappings-in-icon.patch | 324 ++++++++++++++++++
 package/musl/musl.mk                          |   3 +
 2 files changed, 327 insertions(+)
 create mode 100644 package/musl/0003-fix-pathological-slowness-incorrect-mappings-in-icon.patch

diff --git a/package/musl/0003-fix-pathological-slowness-incorrect-mappings-in-icon.patch b/package/musl/0003-fix-pathological-slowness-incorrect-mappings-in-icon.patch
new file mode 100644
index 0000000000..5cbc8144d9
--- /dev/null
+++ b/package/musl/0003-fix-pathological-slowness-incorrect-mappings-in-icon.patch
@@ -0,0 +1,324 @@
+From 67219f0130ec7c876ac0b299046460fad31caabf Mon Sep 17 00:00:00 2001
+From: Rich Felker <dalias@aerifal.cx>
+Date: Mon, 30 Mar 2026 16:00:50 -0400
+Subject: [PATCH] fix pathological slowness & incorrect mappings in iconv
+ gb18030 decoder
+
+in order to implement the "UTF" aspect of gb18030 (ability to
+represent arbitrary unicode characters not present in the 2-byte
+mapping), we have to apply the index obtained from the encoded 4-byte
+sequence into the set of unmapped characters. this was done by
+scanning repeatedly over the table of mapped characters and counting
+off mapped characters below a running index by which to adjust the
+running index by on each iteration. this iterative process eventually
+leaves us with the value of the Nth unmapped character replacing the
+index, but depending on which particular character that is, the number
+of iterations needed to find it can be in the tens of thousands, and
+each iteration traverses the whole 126x190 table in the inner loop.
+this can lead to run times exceeding an entire second per character on
+moderate-speed machines.
+
+on top of that, the transformation logic produced wrong results for
+BMP characters above the the surrogate range, as a result of not
+correctly accounting for it being excluded, and for characters outside
+the BMP, as a result of a misunderstanding of how gb18030 encodes
+them.
+
+this patch replaces the unmapped character lookup with a single linear
+search of a list of unmapped ranges. there are only 206 such ranges,
+and these are permanently assigned and unchangeable as a consequence
+of the character encoding having to be stable, so a simple array of
+16-bit start/length values for each range consumes only 824 bytes, a
+very reasonable size cost here.
+
+this new table accounts for the previously-incorrect surrogate
+handling, and non-BMP characters are handled correctly by a single
+offset, without the need for any unmapped-range search.
+
+there are still a small number of mappings that are incorrect due to
+late changes made in the definition of gb18030, swapping PUA
+codepoints with proper Unicode characters. correcting these requires a
+postprocessing step that will be added later.
+
+CVE: CVE-2026-6042
+Upstream: https://git.musl-libc.org/cgit/musl/commit/?id=67219f0130ec7c876ac0b299046460fad31caabf
+Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
+---
+ src/locale/gb18030utf.h | 206 ++++++++++++++++++++++++++++++++++++++++
+ src/locale/iconv.c      |  33 +++++--
+ 2 files changed, 230 insertions(+), 9 deletions(-)
+ create mode 100644 src/locale/gb18030utf.h
+
+diff --git a/src/locale/gb18030utf.h b/src/locale/gb18030utf.h
+new file mode 100644
+index 00000000..322a2440
+--- /dev/null
++++ b/src/locale/gb18030utf.h
+@@ -0,0 +1,206 @@
++{ 0x80, 36 },
++{ 0xa5, 2 },
++{ 0xa9, 7 },
++{ 0xb2, 5 },
++{ 0xb8, 31 },
++{ 0xd8, 8 },
++{ 0xe2, 6 },
++{ 0xeb, 1 },
++{ 0xee, 4 },
++{ 0xf4, 3 },
++{ 0xf8, 1 },
++{ 0xfb, 1 },
++{ 0xfd, 4 },
++{ 0x102, 17 },
++{ 0x114, 7 },
++{ 0x11c, 15 },
++{ 0x12c, 24 },
++{ 0x145, 3 },
++{ 0x149, 4 },
++{ 0x14e, 29 },
++{ 0x16c, 98 },
++{ 0x1cf, 1 },
++{ 0x1d1, 1 },
++{ 0x1d3, 1 },
++{ 0x1d5, 1 },
++{ 0x1d7, 1 },
++{ 0x1d9, 1 },
++{ 0x1db, 1 },
++{ 0x1dd, 28 },
++{ 0x1fa, 87 },
++{ 0x252, 15 },
++{ 0x262, 101 },
++{ 0x2c8, 1 },
++{ 0x2cc, 13 },
++{ 0x2da, 183 },
++{ 0x3a2, 1 },
++{ 0x3aa, 7 },
++{ 0x3c2, 1 },
++{ 0x3ca, 55 },
++{ 0x402, 14 },
++{ 0x450, 1 },
++{ 0x452, 7102 },
++{ 0x2011, 2 },
++{ 0x2017, 1 },
++{ 0x201a, 2 },
++{ 0x201e, 7 },
++{ 0x2027, 9 },
++{ 0x2031, 1 },
++{ 0x2034, 1 },
++{ 0x2036, 5 },
++{ 0x203c, 112 },
++{ 0x20ad, 86 },
++{ 0x2104, 1 },
++{ 0x2106, 3 },
++{ 0x210a, 12 },
++{ 0x2117, 10 },
++{ 0x2122, 62 },
++{ 0x216c, 4 },
++{ 0x217a, 22 },
++{ 0x2194, 2 },
++{ 0x219a, 110 },
++{ 0x2209, 6 },
++{ 0x2210, 1 },
++{ 0x2212, 3 },
++{ 0x2216, 4 },
++{ 0x221b, 2 },
++{ 0x2221, 2 },
++{ 0x2224, 1 },
++{ 0x2226, 1 },
++{ 0x222c, 2 },
++{ 0x222f, 5 },
++{ 0x2238, 5 },
++{ 0x223e, 10 },
++{ 0x2249, 3 },
++{ 0x224d, 5 },
++{ 0x2253, 13 },
++{ 0x2262, 2 },
++{ 0x2268, 6 },
++{ 0x2270, 37 },
++{ 0x2296, 3 },
++{ 0x229a, 11 },
++{ 0x22a6, 25 },
++{ 0x22c0, 82 },
++{ 0x2313, 333 },
++{ 0x246a, 10 },
++{ 0x249c, 100 },
++{ 0x254c, 4 },
++{ 0x2574, 13 },
++{ 0x2590, 3 },
++{ 0x2596, 10 },
++{ 0x25a2, 16 },
++{ 0x25b4, 8 },
++{ 0x25be, 8 },
++{ 0x25c8, 3 },
++{ 0x25cc, 2 },
++{ 0x25d0, 18 },
++{ 0x25e6, 31 },
++{ 0x2607, 2 },
++{ 0x260a, 54 },
++{ 0x2641, 1 },
++{ 0x2643, 2110 },
++{ 0x2e82, 2 },
++{ 0x2e85, 3 },
++{ 0x2e89, 2 },
++{ 0x2e8d, 10 },
++{ 0x2e98, 15 },
++{ 0x2ea8, 2 },
++{ 0x2eab, 3 },
++{ 0x2eaf, 4 },
++{ 0x2eb4, 2 },
++{ 0x2eb8, 3 },
++{ 0x2ebc, 14 },
++{ 0x2ecb, 293 },
++{ 0x2ffc, 4 },
++{ 0x3004, 1 },
++{ 0x3018, 5 },
++{ 0x301f, 2 },
++{ 0x302a, 20 },
++{ 0x303f, 2 },
++{ 0x3094, 7 },
++{ 0x309f, 2 },
++{ 0x30f7, 5 },
++{ 0x30ff, 6 },
++{ 0x312a, 246 },
++{ 0x322a, 7 },
++{ 0x3232, 113 },
++{ 0x32a4, 234 },
++{ 0x3390, 12 },
++{ 0x339f, 2 },
++{ 0x33a2, 34 },
++{ 0x33c5, 9 },
++{ 0x33cf, 2 },
++{ 0x33d3, 2 },
++{ 0x33d6, 113 },
++{ 0x3448, 43 },
++{ 0x3474, 298 },
++{ 0x359f, 111 },
++{ 0x360f, 11 },
++{ 0x361b, 765 },
++{ 0x3919, 85 },
++{ 0x396f, 96 },
++{ 0x39d1, 14 },
++{ 0x39e0, 147 },
++{ 0x3a74, 218 },
++{ 0x3b4f, 287 },
++{ 0x3c6f, 113 },
++{ 0x3ce1, 885 },
++{ 0x4057, 264 },
++{ 0x4160, 471 },
++{ 0x4338, 116 },
++{ 0x43ad, 4 },
++{ 0x43b2, 43 },
++{ 0x43de, 248 },
++{ 0x44d7, 373 },
++{ 0x464d, 20 },
++{ 0x4662, 193 },
++{ 0x4724, 5 },
++{ 0x472a, 82 },
++{ 0x477d, 16 },
++{ 0x478e, 441 },
++{ 0x4948, 50 },
++{ 0x497b, 2 },
++{ 0x497e, 4 },
++{ 0x4984, 1 },
++{ 0x4987, 20 },
++{ 0x499c, 3 },
++{ 0x49a0, 22 },
++{ 0x49b8, 703 },
++{ 0x4c78, 39 },
++{ 0x4ca4, 111 },
++{ 0x4d1a, 148 },
++{ 0x4daf, 81 },
++{ 0x9fa6, 14426 },
++{ 0xe76c, 1 },
++{ 0xe7c8, 1 },
++{ 0xe7e7, 13 },
++{ 0xe815, 1 },
++{ 0xe819, 5 },
++{ 0xe81f, 7 },
++{ 0xe827, 4 },
++{ 0xe82d, 4 },
++{ 0xe833, 8 },
++{ 0xe83c, 7 },
++{ 0xe844, 16 },
++{ 0xe856, 14 },
++{ 0xe865, 4295 },
++{ 0xf92d, 76 },
++{ 0xf97a, 27 },
++{ 0xf996, 81 },
++{ 0xf9e8, 9 },
++{ 0xf9f2, 26 },
++{ 0xfa10, 1 },
++{ 0xfa12, 1 },
++{ 0xfa15, 3 },
++{ 0xfa19, 6 },
++{ 0xfa22, 1 },
++{ 0xfa25, 2 },
++{ 0xfa2a, 1030 },
++{ 0xfe32, 1 },
++{ 0xfe45, 4 },
++{ 0xfe53, 1 },
++{ 0xfe58, 1 },
++{ 0xfe67, 1 },
++{ 0xfe6c, 149 },
++{ 0xff5f, 129 },
++{ 0xffe6, 26 },
+diff --git a/src/locale/iconv.c b/src/locale/iconv.c
+index 52178950..4151411d 100644
+--- a/src/locale/iconv.c
++++ b/src/locale/iconv.c
+@@ -74,6 +74,10 @@ static const unsigned short gb18030[126][190] = {
+ #include "gb18030.h"
+ };
+ 
++static const unsigned short gb18030utf[][2] = {
++#include "gb18030utf.h"
++};
++
+ static const unsigned short big5[89][157] = {
+ #include "big5.h"
+ };
+@@ -224,6 +228,8 @@ static unsigned uni_to_jis(unsigned c)
+ 	}
+ }
+ 
++#define countof(a) (sizeof (a) / sizeof *(a))
++
+ size_t iconv(iconv_t cd, char **restrict in, size_t *restrict inb, char **restrict out, size_t *restrict outb)
+ {
+ 	size_t x=0;
+@@ -430,15 +436,24 @@ size_t iconv(iconv_t cd, char **restrict in, size_t *restrict inb, char **restri
+ 				d = *((unsigned char *)*in + 3);
+ 				if (d-'0'>9) goto ilseq;
+ 				c += d-'0';
+-				c += 128;
+-				for (d=0; d<=c; ) {
+-					k = 0;
+-					for (int i=0; i<126; i++)
+-						for (int j=0; j<190; j++)
+-							if (gb18030[i][j]-d <= c-d)
+-								k++;
+-					d = c+1;
+-					c += k;
++				/* Starting at 90 30 81 30 (189000), mapping is
++				 * linear without gaps, to U+10000 and up. */
++				if (c >= 189000) {
++					c -= 189000;
++					c += 0x10000;
++					if (c >= 0x110000) goto ilseq;
++					break;
++				}
++				/* Otherwise we must process an index into set
++				 * of characters unmapped by 2-byte table. */
++				for (int i=0; ; i++) {
++					if (i==countof(gb18030utf))
++						goto ilseq;
++					if (c<gb18030utf[i][1]) {
++						c += gb18030utf[i][0];
++						break;
++					}
++					c -= gb18030utf[i][1];
+ 				}
+ 				break;
+ 			}
+-- 
+2.53.0
+
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index bea9029455..29a9c90ce1 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -26,6 +26,9 @@ MUSL_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 MUSL_INSTALL_STAGING = YES
 
+# 0003-fix-pathological-slowness-incorrect-mappings-in-icon.patch
+MUSL_IGNORE_CVES += CVE-2026-6042
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
