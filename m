Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B295CD98DA
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 20:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46736419A2;
	Mon, 15 Jun 2026 20:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kwVB57v7uAaV; Mon, 15 Jun 2026 20:25:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FEBE419A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781555144;
	bh=Fpu8li6vsAkS2b2WUPT2RkavGgPFa1xY3kbNa7UIBW8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oFe8sydvVBzIOIaxwKsx/cDoAcXnmcCpyg3B3mNIKWlG/zt95yRFdK64337d2MAFs
	 FkZK2iBmcbauvF9lvGAIIBeC7X0mHotIsgG/WfgYknJASRT+ajO8AZEIJGO+RBqmcR
	 Ub1pX0xncvewkE7SBb/FCoObvWrh5gLDcpFSwyjF8fYjAZlk1P1+gnO5WmhMxLY0Ia
	 /4QM0QS1RF3YTkVIs2WpZzu/AKMZteCHVEIV2B4igSuoezVmSGPRcMLl67+iNDVbcp
	 UCcd0bwCSKJaPpGkVGArMdD1F0QdcLreYvfn6W9gsK5CN1RzXfUMI9Lwf4y9hDbCXL
	 QHuuc6Ysy2IkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FEBE419A3;
	Mon, 15 Jun 2026 20:25:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AA61A2F3
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90D594199E
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mt8bBsrd5Zph for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 20:25:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CC9124197E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC9124197E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC9124197E
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:25:40 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -355815260; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 15 Jun 2026 20:25:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wZDsG-00000005NPK-485G;
 Mon, 15 Jun 2026 22:25:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jun 2026 22:25:31 +0200
Message-ID: <20260615202534.1281579-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Y1t8amX0Uhf+3n0oCzYq4D2UMp+acguxNHqAGiEslFD2HQ2HlcDvB3BS+7ESyyGmYeT+3TqcKN57cXCw0D0kOu063+9SMtoHeA7XeH1ZEhrfpCQysPaPnGw4futN8MlU1fu0cHgrxm7fMFOtR90moGhApNHK9VIuNMscdQEocnS7XvVeDEEwXIGz/5uONWdQgDDxppnVd7zjT9wTkdhYJeR0TyTaIIXWJqOxzCv78c7nOK3PLCwcdHfUJTPfpvC4O19DrdhPqLA+OdmgSbc6AxwkZAlcXETIQeDvBWgkJdfBt3hJycqQQ660odNYM/yuHQjAN43Kp/xe1hFWJ267Lw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=/JdJY990OlTEAU4F9//SFyNnw6wz0jPO5U+vk4JPeFI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Y1t8amX0
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] boot/shim: add patch to fix builds with -O3 /
 -Ofast
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

Fixes:
https://autobuild.buildroot.net/results/c6ad52a048ba030bb1adc3ee1aeb69ef880cbdad/
https://autobuild.buildroot.net/results/136d1afc2ecacea6a4e12b915073e3eaf5c8ca01/
https://autobuild.buildroot.net/results/a3f293371f6bd0125dc7baa5afb64373e4383f4f/

Shim contains an embedded copy of OpenSSL.  Depending on the optimization
level, an error is triggered from make_kn():

In function 'make_kn',
    inlined from 'make_kn' at crypto/cmac/cmac.c:81:13,
    inlined from 'CMAC_Init' at crypto/cmac/cmac.c:205:9:
crypto/cmac/cmac.c:92:20: error: writing 1 byte into a region of size 0 [-Werror=stringop-overflow=]
   92 |         k1[bl - 1] ^= bl == 16 ? 0x87 : 0x1b;
      |         ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
crypto/cmac/cmac.c: In function 'CMAC_Init':
crypto/cmac/cmac.c:69:19: note: at offset 2147483647 into destination object 'k1' of size 32
   69 |     unsigned char k1[EVP_MAX_BLOCK_LENGTH];
      |                   ^~

Fix it by including a patch submitted upstream which backports an upstream
OpenSSL change to workaround this.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...make_kn-and-move-zero_iv-to-const-se.patch | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 boot/shim/0002-cmac.c-optimize-make_kn-and-move-zero_iv-to-const-se.patch

diff --git a/boot/shim/0002-cmac.c-optimize-make_kn-and-move-zero_iv-to-const-se.patch b/boot/shim/0002-cmac.c-optimize-make_kn-and-move-zero_iv-to-const-se.patch
new file mode 100644
index 0000000000..2baa0de56c
--- /dev/null
+++ b/boot/shim/0002-cmac.c-optimize-make_kn-and-move-zero_iv-to-const-se.patch
@@ -0,0 +1,72 @@
+From 7aee873d6f6b0737dfe566fc8c5cd4eaada9bd5e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 8 Apr 2024 11:56:06 +0200
+Subject: [PATCH] cmac.c: optimize make_kn and move zero_iv to const segment.
+
+Backport
+https://github.com/openssl/openssl/commit/03cf7e784caa4c61febbf249be63cbae3e368ac9
+to fix the following k1 stringop-overflow:
+
+In function 'make_kn',
+    inlined from 'make_kn' at crypto/cmac/cmac.c:81:13,
+    inlined from 'CMAC_Init' at crypto/cmac/cmac.c:205:9:
+crypto/cmac/cmac.c:92:20: error: writing 1 byte into a region of size 0 [-Werror=stringop-overflow=]
+   92 |         k1[bl - 1] ^= bl == 16 ? 0x87 : 0x1b;
+      |         ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
+crypto/cmac/cmac.c: In function 'CMAC_Init':
+crypto/cmac/cmac.c:69:19: note: at offset [-2147483649, -1] into destination object 'k1' of size 32
+   69 |     unsigned char k1[EVP_MAX_BLOCK_LENGTH];
+      |                   ^~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/97b6333cdc7bad24aba7af1b04890679e0058299
+
+Upstream: https://github.com/rhboot/shim/pull/652
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ Cryptlib/OpenSSL/crypto/cmac/cmac.c | 17 ++++++++---------
+ 1 file changed, 8 insertions(+), 9 deletions(-)
+
+diff --git a/Cryptlib/OpenSSL/crypto/cmac/cmac.c b/Cryptlib/OpenSSL/crypto/cmac/cmac.c
+index 2954b6eb..27dbfaac 100644
+--- a/Cryptlib/OpenSSL/crypto/cmac/cmac.c
++++ b/Cryptlib/OpenSSL/crypto/cmac/cmac.c
+@@ -78,18 +78,17 @@ struct CMAC_CTX_st {
+ 
+ /* Make temporary keys K1 and K2 */
+ 
+-static void make_kn(unsigned char *k1, unsigned char *l, int bl)
++static void make_kn(unsigned char *k1, const unsigned char *l, int bl)
+ {
+     int i;
++    unsigned char c = l[0], carry = c>>7, cnext;
++
+     /* Shift block to left, including carry */
+-    for (i = 0; i < bl; i++) {
+-        k1[i] = l[i] << 1;
+-        if (i < bl - 1 && l[i + 1] & 0x80)
+-            k1[i] |= 1;
+-    }
++    for (i = 0; i < bl-1; i++, c = cnext)
++        k1[i] = (c << 1) | ((cnext=l[i+1]) >> 7);
++
+     /* If MSB set fixup with R */
+-    if (l[0] & 0x80)
+-        k1[bl - 1] ^= bl == 16 ? 0x87 : 0x1b;
++    k1[i] = (c << 1) ^ ((0-carry)&(bl==16?0x87:0x1b));
+ }
+ 
+ CMAC_CTX *CMAC_CTX_new(void)
+@@ -151,7 +150,7 @@ int CMAC_CTX_copy(CMAC_CTX *out, const CMAC_CTX *in)
+ int CMAC_Init(CMAC_CTX *ctx, const void *key, size_t keylen,
+               const EVP_CIPHER *cipher, ENGINE *impl)
+ {
+-    static unsigned char zero_iv[EVP_MAX_BLOCK_LENGTH];
++    static const unsigned char zero_iv[EVP_MAX_BLOCK_LENGTH] = {0};
+ #ifdef OPENSSL_FIPS
+     if (FIPS_mode()) {
+         /* If we have an ENGINE need to allow non FIPS */
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
