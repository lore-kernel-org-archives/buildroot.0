Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6C4CA1013
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6006F41902;
	Mon,  8 Sep 2025 10:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gI04RFZaAl04; Mon,  8 Sep 2025 10:40:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 653A741966
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 653A741966;
	Mon,  8 Sep 2025 10:40:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70FA01D9
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63258414DE
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRgQFOVgwhrB for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:40:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2423B414BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2423B414BD
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2423B414BD
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:40:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5844FB978681; Mon,  8 Sep 2025 12:40:52 +0200 (CEST)
Message-ID: <1d6fa4d4-8ccd-4f14-9e8a-10a9ada69d56@rnout.be>
Date: Mon, 8 Sep 2025 12:40:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20250905074834.470035-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250905074834.470035-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1757328052; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Jx1V9Ig2Ui1JC/8cXt0Sb23Mn/8jxNaoXikjaeEyH2o=;
 b=Ftq5MwXr3IiwPcJpTpOMatTNBgSpm8AZKsQMbrlhgvy+RyDWaaQZQD3qycXQFCXpEwx5Ss
 4vVVnGlyaRb+A0h9MMrqkKPD/AJOK91kM1+duftML5VG9yvtQhqNVqOr9rNMJ1lYAcO0Ne
 8lP8402i/WlMyNGHTyzZXii/aiuLkhdVLpSLQJz14k2YbhvGjvpNY/UjKfIuxapeSKRqlN
 m7jfBpggXiEUXtdXww0b5Z1foqVDGrubxPyFZASn4Wte+JSbnCcHhI2hTdtNg3iH5/UM2c
 zOxOoLi2HFzlxAmPMWfK8+hbF7j5UOEcgeaBEBYkgZ9eQLiXj1gLP9UFCdsnbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Ftq5MwXr
Subject: Re: [Buildroot] [2025.02.x,
 PATCH 1/2] package/iperf3: add patch to fix CVE-2025-54349
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/09/2025 09:48, Thomas Perale via buildroot wrote:
> Fixes the following vulnerability:
> 
> - CVE-2025-54349
> 
>      In iperf before 3.19.1, iperf_auth.c has an off-by-one error and
>      resultant heap-based buffer overflow.
> 
> For more information, see:
>    - https://www.cve.org/CVERecord?id=CVE-2025-54349
>    - https://github.com/esnet/iperf/commit/4e5313bab0b9b3fe03513ab54f722c8a3e4b7bdf
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

  Applied both to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   ...Fix-off-by-one-head-overflow-in-auth.patch | 93 +++++++++++++++++++
>   package/iperf3/iperf3.mk                      |  3 +
>   2 files changed, 96 insertions(+)
>   create mode 100644 package/iperf3/0001-Fix-off-by-one-head-overflow-in-auth.patch
> 
> diff --git a/package/iperf3/0001-Fix-off-by-one-head-overflow-in-auth.patch b/package/iperf3/0001-Fix-off-by-one-head-overflow-in-auth.patch
> new file mode 100644
> index 0000000000..38fe1327ce
> --- /dev/null
> +++ b/package/iperf3/0001-Fix-off-by-one-head-overflow-in-auth.patch
> @@ -0,0 +1,93 @@
> +From 4e5313bab0b9b3fe03513ab54f722c8a3e4b7bdf Mon Sep 17 00:00:00 2001
> +From: Sarah Larsen <swlarsen@es.net>
> +Date: Wed, 25 Jun 2025 15:11:03 +0000
> +Subject: [PATCH] Fix off-by-one heap overflow in auth.
> +
> +Reported by Han Lee (Apple Information Security)
> +
> +CVE: CVE-2025-54349
> +Upstream: https://github.com/esnet/iperf/commit/4e5313bab0b9b3fe03513ab54f722c8a3e4b7bdf
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/iperf_auth.c | 18 +++++++++++++-----
> + 1 file changed, 13 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/iperf_auth.c b/src/iperf_auth.c
> +index b9f2bc0f2..632f03d24 100644
> +--- a/src/iperf_auth.c
> ++++ b/src/iperf_auth.c
> +@@ -288,6 +288,7 @@ int encrypt_rsa_message(const char *plaintext, EVP_PKEY *public_key, unsigned ch
> + }
> +
> + int decrypt_rsa_message(const unsigned char *encryptedtext, const int encryptedtext_len, EVP_PKEY *private_key, unsigned char **plaintext, int use_pkcs1_padding) {
> ++    int ret =0;
> + #if OPENSSL_VERSION_MAJOR >= 3
> +     EVP_PKEY_CTX *ctx;
> + #else
> +@@ -310,7 +311,8 @@ int decrypt_rsa_message(const unsigned char *encryptedtext, const int encryptedt
> +     keysize = RSA_size(rsa);
> + #endif
> +     rsa_buffer  = OPENSSL_malloc(keysize * 2);
> +-    *plaintext = (unsigned char*)OPENSSL_malloc(keysize);
> ++    // Note: +1 for NULL
> ++    *plaintext = (unsigned char*)OPENSSL_malloc(keysize + 1);
> +
> +     BIO *bioBuff   = BIO_new_mem_buf((void*)encryptedtext, encryptedtext_len);
> +     rsa_buffer_len = BIO_read(bioBuff, rsa_buffer, keysize * 2);
> +@@ -320,13 +322,15 @@ int decrypt_rsa_message(const unsigned char *encryptedtext, const int encryptedt
> +         padding = RSA_PKCS1_PADDING;
> +     }
> + #if OPENSSL_VERSION_MAJOR >= 3
> ++
> +     plaintext_len = keysize;
> +     EVP_PKEY_decrypt_init(ctx);
> +-    int ret = EVP_PKEY_CTX_set_rsa_padding(ctx, padding);
> ++
> ++    ret = EVP_PKEY_CTX_set_rsa_padding(ctx, padding);
> +     if (ret < 0){
> +         goto errreturn;
> +     }
> +-    EVP_PKEY_decrypt(ctx, *plaintext, &plaintext_len, rsa_buffer, rsa_buffer_len);
> ++    ret = EVP_PKEY_decrypt(ctx, *plaintext, &plaintext_len, rsa_buffer, rsa_buffer_len);
> +     EVP_PKEY_CTX_free(ctx);
> + #else
> +     plaintext_len = RSA_private_decrypt(rsa_buffer_len, rsa_buffer, *plaintext, rsa, padding);
> +@@ -337,7 +341,7 @@ int decrypt_rsa_message(const unsigned char *encryptedtext, const int encryptedt
> +     BIO_free(bioBuff);
> +
> +     /* Treat a decryption error as an empty string. */
> +-    if (plaintext_len < 0) {
> ++    if (plaintext_len <= 0) {
> +         plaintext_len = 0;
> +     }
> +
> +@@ -386,24 +390,28 @@ int decode_auth_setting(int enable_debug, const char *authtoken, EVP_PKEY *priva
> +     int plaintext_len;
> +     plaintext_len = decrypt_rsa_message(encrypted_b64, encrypted_len_b64, private_key, &plaintext, use_pkcs1_padding);
> +     free(encrypted_b64);
> +-    if (plaintext_len < 0) {
> ++    if (plaintext_len <= 0) {
> +         return -1;
> +     }
> ++
> +     plaintext[plaintext_len] = '\0';
> +
> +     char *s_username, *s_password;
> +     s_username = (char *) calloc(plaintext_len, sizeof(char));
> +     if (s_username == NULL) {
> ++        OPENSSL_free(plaintext);
> + 	return -1;
> +     }
> +     s_password = (char *) calloc(plaintext_len, sizeof(char));
> +     if (s_password == NULL) {
> ++        OPENSSL_free(plaintext);
> + 	free(s_username);
> + 	return -1;
> +     }
> +
> +     int rc = sscanf((char *) plaintext, auth_text_format, s_username, s_password, &utc_seconds);
> +     if (rc != 3) {
> ++        OPENSSL_free(plaintext);
> + 	free(s_password);
> + 	free(s_username);
> + 	return -1;
> diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
> index 744ee070a4..c5efb1d784 100644
> --- a/package/iperf3/iperf3.mk
> +++ b/package/iperf3/iperf3.mk
> @@ -11,6 +11,9 @@ IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
>   IPERF3_LICENSE_FILES = LICENSE
>   IPERF3_CPE_ID_VENDOR = es
>   
> +# 0001-Fix-off-by-one-head-overflow-in-auth.patch
> +IPERF3_IGNORE_CVES += CVE-2025-54349
> +
>   IPERF3_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
>   
>   ifeq ($(BR2_PACKAGE_OPENSSL),y)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
