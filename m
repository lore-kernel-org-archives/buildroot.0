Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F93CD98CE
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 20:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 459A24056E;
	Mon, 15 Jun 2026 20:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mgqsXpNNGMqj; Mon, 15 Jun 2026 20:54:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E6E2405A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781556854;
	bh=LWKaeEjpqDvcDgX9FVNy23TALsWzWW6gg2776/zBhwg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FdcFyuXrUp3bGQIuVdjIAJmywS4Oiw8bExbFlqitz2IxzDnVTub1YJ9CMmxCKMKOB
	 WrQ1hh2qITv7J0Mm0PdhNrlwgMMOn+GtvxMukM1nytpsjdElIbdEiU7V4cvx5ERkBE
	 D3QU4fb4qDzAQumjo95uI4PQDrG+EZcPFqzxexbDP0RZrpUAkXlKe6juWlep19pKk5
	 RX6xVM2PJzD1nQMRe937ujPwuGeaNN/Km43X+um1mRsrYWR/cMSe7pAJ/Ih3I6OMvZ
	 viOmZllqhfdbmeSjd1IQ6zrfFN7kL9WpEz3YobNLKA/+hq2p+CI7wxfABqi+p9gBfp
	 9E6zCIKHF1GiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E6E2405A9;
	Mon, 15 Jun 2026 20:54:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C96672B8
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFC15405A9
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKkTSH1MgeTt for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 20:54:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF1044056E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF1044056E
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:54:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 015F57FEC6; Mon, 15 Jun 2026 20:53:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jun 2026 22:52:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ea98e0f1e4ee96fe7d87e972acae53355a41318
X-Git-Newrev: 96408d1313bface05f5dcc9e275eb118fce87fa9
X-Patchwork-Hint: ignore
Message-Id: <20260615205351.015F57FEC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/shim: add patch to fix builds with
 -O3 / -Ofast
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/96408d1313bface05f5dcc9e275eb118fce87fa9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...mize-make_kn-and-move-zero_iv-to-const-se.patch | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
