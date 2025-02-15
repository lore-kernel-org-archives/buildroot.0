Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF43C021A0
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 10:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2ADB40CFA;
	Sat, 15 Feb 2025 10:30:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id szAhp3mzDLKI; Sat, 15 Feb 2025 10:30:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 596BA41253
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 596BA41253;
	Sat, 15 Feb 2025 10:30:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 474F772
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 10:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3671A811F5
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 10:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UonVBj-ejnLx for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 10:30:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0207F811CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0207F811CD
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0207F811CD
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 10:30:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C64D443299;
 Sat, 15 Feb 2025 10:30:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1tjFQv-000HGt-07;
 Sat, 15 Feb 2025 11:30:01 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Feb 2025 11:29:59 +0100
Message-Id: <20250215103000.66380-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehvdefudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeetffefgeekvdduteehleeuvdekgfduuefgleeihfeuvefgkeehjeffgfetjeevfeenucffohhmrghinhepohhpvghnfigrlhhlrdgtohhmpdhmuhhslhdqlhhisggtrdhorhhgnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghkoheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/musl: add upstream security fixes for
 CVE-2025-26519
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2025-26519: Musl libc: input-controlled out-of-bounds write
primitive in iconv()

https://www.openwall.com/lists/musl/2025/02/13/1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ous-input-validation-in-EUC-KR-decod.patch | 41 +++++++++++++++++++
 ...-8-output-code-path-against-input-de.patch | 40 ++++++++++++++++++
 package/musl/musl.mk                          |  4 ++
 3 files changed, 85 insertions(+)
 create mode 100644 package/musl/0004-iconv-fix-erroneous-input-validation-in-EUC-KR-decod.patch
 create mode 100644 package/musl/0005-iconv-harden-UTF-8-output-code-path-against-input-de.patch

diff --git a/package/musl/0004-iconv-fix-erroneous-input-validation-in-EUC-KR-decod.patch b/package/musl/0004-iconv-fix-erroneous-input-validation-in-EUC-KR-decod.patch
new file mode 100644
index 0000000000..dbfd87db76
--- /dev/null
+++ b/package/musl/0004-iconv-fix-erroneous-input-validation-in-EUC-KR-decod.patch
@@ -0,0 +1,41 @@
+From e5adcd97b5196e29991b524237381a0202a60659 Mon Sep 17 00:00:00 2001
+From: Rich Felker <dalias@aerifal.cx>
+Date: Sun, 9 Feb 2025 10:07:19 -0500
+Subject: [PATCH] iconv: fix erroneous input validation in EUC-KR decoder
+
+as a result of incorrect bounds checking on the lead byte being
+decoded, certain invalid inputs which should produce an encoding
+error, such as "\xc8\x41", instead produced out-of-bounds loads from
+the ksc table.
+
+in a worst case, the loaded value may not be a valid unicode scalar
+value, in which case, if the output encoding was UTF-8, wctomb would
+return (size_t)-1, causing an overflow in the output pointer and
+remaining buffer size which could clobber memory outside of the output
+buffer.
+
+bug report was submitted in private by Nick Wellnhofer on account of
+potential security implications.
+
+Upstream: https://git.musl-libc.org/cgit/musl/commit/?id=e5adcd97b5196e29991b524237381a0202a60659
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/locale/iconv.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/locale/iconv.c b/src/locale/iconv.c
+index 9605c8e9..008c93f0 100644
+--- a/src/locale/iconv.c
++++ b/src/locale/iconv.c
+@@ -502,7 +502,7 @@ size_t iconv(iconv_t cd, char **restrict in, size_t *restrict inb, char **restri
+ 			if (c >= 93 || d >= 94) {
+ 				c += (0xa1-0x81);
+ 				d += 0xa1;
+-				if (c >= 93 || c>=0xc6-0x81 && d>0x52)
++				if (c > 0xc6-0x81 || c==0xc6-0x81 && d>0x52)
+ 					goto ilseq;
+ 				if (d-'A'<26) d = d-'A';
+ 				else if (d-'a'<26) d = d-'a'+26;
+-- 
+2.39.5
+
diff --git a/package/musl/0005-iconv-harden-UTF-8-output-code-path-against-input-de.patch b/package/musl/0005-iconv-harden-UTF-8-output-code-path-against-input-de.patch
new file mode 100644
index 0000000000..a14041364a
--- /dev/null
+++ b/package/musl/0005-iconv-harden-UTF-8-output-code-path-against-input-de.patch
@@ -0,0 +1,40 @@
+From c47ad25ea3b484e10326f933e927c0bc8cded3da Mon Sep 17 00:00:00 2001
+From: Rich Felker <dalias@aerifal.cx>
+Date: Wed, 12 Feb 2025 17:06:30 -0500
+Subject: [PATCH] iconv: harden UTF-8 output code path against input decoder
+ bugs
+
+the UTF-8 output code was written assuming an invariant that iconv's
+decoders only emit valid Unicode Scalar Values which wctomb can encode
+successfully, thereby always returning a value between 1 and 4.
+
+if this invariant is not satisfied, wctomb returns (size_t)-1, and the
+subsequent adjustments to the output buffer pointer and remaining
+output byte count overflow, moving the output position backwards,
+potentially past the beginning of the buffer, without storing any
+bytes.
+
+Upstream: https://git.musl-libc.org/cgit/musl/commit/?id=c47ad25ea3b484e10326f933e927c0bc8cded3da
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/locale/iconv.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/locale/iconv.c b/src/locale/iconv.c
+index 008c93f0..52178950 100644
+--- a/src/locale/iconv.c
++++ b/src/locale/iconv.c
+@@ -545,6 +545,10 @@ size_t iconv(iconv_t cd, char **restrict in, size_t *restrict inb, char **restri
+ 				if (*outb < k) goto toobig;
+ 				memcpy(*out, tmp, k);
+ 			} else k = wctomb_utf8(*out, c);
++			/* This failure condition should be unreachable, but
++			 * is included to prevent decoder bugs from translating
++			 * into advancement outside the output buffer range. */
++			if (k>4) goto ilseq;
+ 			*out += k;
+ 			*outb -= k;
+ 			break;
+-- 
+2.39.5
+
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 783a103fcd..13a49a15eb 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -26,6 +26,10 @@ MUSL_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 MUSL_INSTALL_STAGING = YES
 
+# 0004-iconv-fix-erroneous-input-validation-in-EUC-KR-decod.patch
+# 0005-iconv-harden-UTF-8-output-code-path-against-input-de.patch
+MUSL_IGNORE_CVES += CVE-2025-26519
+
 # musl does not build with LTO, so explicitly disable it
 # when using a compiler that may have support for LTO
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7),y)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
