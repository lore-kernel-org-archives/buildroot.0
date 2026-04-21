Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FA2F8FA65
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 12:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DE3183F57;
	Tue, 21 Apr 2026 12:09:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pUnvFM9rybAB; Tue, 21 Apr 2026 12:09:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1C6083F5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776773360;
	bh=N5fZituNPGSslUF1LdMwGC0UcNq2WajKsxAuvVUcMmM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OvinhRbt3JYWfhgvYLFRVbc2vE15sX4a6cV0ZYUKq4g5cRFKj/ybnAQayNLW33Moe
	 aqXniix/6g7SW4cjEFm7less6PRf+SsVXENkWYKB4gXuVkf4qJAwAsFr0VH9E0Fvsn
	 Q3mLTsaTA6qSq2S499eUifbBANVBoQDmBiKwEA6GExsxm7mSrLqD8LTZGikoCaO+7s
	 hOXga/bDDA4ZjaZb7TaCnYwyAKP1YPZhgMcGbu+tsZkCklsVEGsc2sL9G46oSuV/QL
	 ejDM+xBn7Dejxv5kQ+cLqtt9d5yM1aKPJUKBxHZdeGrBUqu2vQbsb383ndfqS5nuP8
	 u7U1qe88+kyWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1C6083F5B;
	Tue, 21 Apr 2026 12:09:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 64993257
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 12:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95A4E401D8
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 12:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p9P1oe9T7dkQ for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 12:09:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8D9640B38
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8D9640B38
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 12:09:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4DA66821C2; Tue, 21 Apr 2026 12:09:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Apr 2026 13:54:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e1c7f198dc537ebc1e2abc992c8e3a475e19b2cf
X-Git-Newrev: b5ff02164f5a793fd9abeae997ed54614830e89b
X-Patchwork-Hint: ignore
Message-Id: <20260421120915.4DA66821C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/musl: add upstream security patch
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b5ff02164f5a793fd9abeae997ed54614830e89b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes CVE-2026-6042: musl libc: Algorithmic complexity DoS in iconv
GB18030 decoder
https://www.openwall.com/lists/oss-security/2026/04/09/19

Fixes: https://nvd.nist.gov/vuln/detail/CVE-2026-6042

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...gical-slowness-incorrect-mappings-in-icon.patch | 324 +++++++++++++++++++++
 package/musl/musl.mk                               |   3 +
 2 files changed, 327 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
