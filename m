Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0017C83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B782C410F2;
	Thu, 17 Jul 2025 20:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BCKoKnXbKndO; Thu, 17 Jul 2025 20:02:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1E4641133
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1E4641133;
	Thu, 17 Jul 2025 20:02:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 31C7CDA
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 187BD400C0
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZnRUDUX_jzbA for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:02:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E344B40317
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E344B40317
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E344B40317
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:02:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C6F34B977A8D; Thu, 17 Jul 2025 22:02:05 +0200 (CEST)
Message-ID: <fc459819-2d9f-4522-8af6-8c33630a7357@rnout.be>
Date: Thu, 17 Jul 2025 22:02:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20250707154705.1303551-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250707154705.1303551-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752782525; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=I1esH1CVg5vq3Ub8QPTSfuLxNsdJmhckIFDdECy13RA=;
 b=iOlhI2wrHfptazAFDhrP7sgUYObJEQreonWiD0l+RT14Vyxi8gXMYZS1E5S4P3G/jXdn/1
 1y/pbDa5NOl6S/+BrbGAUGQfQ150TabZPR1QAXd2EYO30eEykmaa8K6C5hCNsAUK1eIcdo
 bMy3IuVowYRbNZoOGlyduWE3LPTTYff8lhyBY3QWlXTUmpwVFlV+G23rLGd8IPjkB6Ol8u
 qScVqZZsHtj2jfA1TBRKqL8LhpGe2x9p57uaNg3rb3pFXGtg4yHyJvio6QlkFL1qh0wT/A
 JgzrZ/J5d6dxSnQB+yTr4Omnbo8T3vIsKt/1fOCD7W+xvZO+//6uyxFV/0Ed+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=iOlhI2wr
Subject: Re: [Buildroot] [PATCH] package/shairport-sync: fix build w/
 mbedtls v3.6
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



On 07/07/2025 17:47, Thomas Perale via buildroot wrote:
> Since [1] when trying to build this package with mbedtls v3.6 the
> following error is happening:
> 
> ```
> player.h:12:10: fatal error: mbedtls/havege.h: No such file or directory
>     12 | #include <mbedtls/havege.h>
>        |          ^~~~~~~~~~~~~~~~~~
> compilation terminated.
> ```
> 
> This error can be reproduced with the following config:
> 
> ```
> cat <<EOF >.config
> BR2_arm=y
> BR2_cortex_a7=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_PACKAGE_MBEDTLS=y
> BR2_PACKAGE_SHAIRPORT_SYNC=y
> EOF
> make olddefconfig
> make
> ```
> 
> This patch backport the upstream commit [2] that add support for
> mbedtls v3.
> 
> [1] 3481a9643f package/mbedtls: bump to version 3.6.3.1
> [2] https://github.com/mikebrady/shairport-sync/commit/d73b585c6f6d9136ae7a04243a54d734fa57d779
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

  Applied to 2025.02.x and 2025.05.x, thanks.

  Regards,
  Arnout

> ---
>   ...0002-mbedtls-add-support-to-mbedtls3.patch | 105 ++++++++++++++++++
>   1 file changed, 105 insertions(+)
>   create mode 100644 package/shairport-sync/0002-mbedtls-add-support-to-mbedtls3.patch
> 
> diff --git a/package/shairport-sync/0002-mbedtls-add-support-to-mbedtls3.patch b/package/shairport-sync/0002-mbedtls-add-support-to-mbedtls3.patch
> new file mode 100644
> index 0000000000..e0e8ea53de
> --- /dev/null
> +++ b/package/shairport-sync/0002-mbedtls-add-support-to-mbedtls3.patch
> @@ -0,0 +1,105 @@
> +From d73b585c6f6d9136ae7a04243a54d734fa57d779 Mon Sep 17 00:00:00 2001
> +From: Seo Suchan <tjtncks@gmail.com>
> +Date: Thu, 9 May 2024 19:10:59 +0900
> +Subject: [PATCH] mbedtls: add support to mbedtls3
> +
> +Signed-off-by: Seo Suchan <tjtncks@gmail.com>
> +Upstream: https://github.com/mikebrady/shairport-sync/commit/d73b585c6f6d9136ae7a04243a54d734fa57d779
> +[thomas: backport the line numbers]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + common.c | 30 ++++++++++++++++++++++++++----
> + player.c |  1 -
> + player.h |  1 -
> + 3 files changed, 26 insertions(+), 6 deletions(-)
> +
> +diff --git a/common.c b/common.c
> +index 4dc75bc7f..0e2a07243 100644
> +--- a/common.c
> ++++ b/common.c
> +@@ -77,6 +77,12 @@
> + #include <mbedtls/md.h>
> + #include <mbedtls/version.h>
> + #include <mbedtls/x509.h>
> ++
> ++#if MBEDTLS_VERSION_MAJOR == 3
> ++#define MBEDTLS_PRIVATE_V3_ONLY(_q) MBEDTLS_PRIVATE(_q)
> ++#else
> ++#define MBEDTLS_PRIVATE_V3_ONLY(_q) _q
> ++#endif
> + #endif
> +
> + #ifdef CONFIG_LIBDAEMON
> +@@ -691,8 +697,14 @@ uint8_t *rsa_apply(uint8_t *input, int inlen, int *outlen, int mode) {
> +
> +   mbedtls_pk_init(&pkctx);
> +
> ++#if MBEDTLS_VERSION_MAJOR == 3
> +   rc = mbedtls_pk_parse_key(&pkctx, (unsigned char *)super_secret_key, sizeof(super_secret_key),
> ++                            NULL, 0, mbedtls_ctr_drbg_random, &ctr_drbg);
> ++#else
> ++  rc = mbedtls_pk_parse_key(&pkctx, (unsigned char *)super_secret_key, sizeof(super_secret_key),
> +                             NULL, 0);
> ++
> ++#endif
> +   if (rc != 0)
> +     debug(1, "Error %d reading the private key.", rc);
> +
> +@@ -701,19 +713,29 @@ uint8_t *rsa_apply(uint8_t *input, int inlen, int *outlen, int mode) {
> +
> +   switch (mode) {
> +   case RSA_MODE_AUTH:
> +-    mbedtls_rsa_set_padding(trsa, MBEDTLS_RSA_PKCS_V15, MBEDTLS_MD_NONE);
> +-    outbuf = malloc(trsa->len);
> ++    mbedtls_rsa_set_padding(trsa, MBEDTLS_RSA_PKCS_V15, MBEDTLS_MD_NONE);
> ++    outbuf = malloc(trsa->MBEDTLS_PRIVATE_V3_ONLY(len));
> ++#if MBEDTLS_VERSION_MAJOR == 3
> ++    rc = mbedtls_rsa_pkcs1_encrypt(trsa, mbedtls_ctr_drbg_random, &ctr_drbg,
> ++                                   inlen, input, outbuf);
> ++#else
> +     rc = mbedtls_rsa_pkcs1_encrypt(trsa, mbedtls_ctr_drbg_random, &ctr_drbg, MBEDTLS_RSA_PRIVATE,
> +                                    inlen, input, outbuf);
> ++#endif
> +     if (rc != 0)
> +       debug(1, "mbedtls_pk_encrypt error %d.", rc);
> +-    *outlen = trsa->len;
> ++    *outlen = trsa->MBEDTLS_PRIVATE_V3_ONLY(len);
> +     break;
> +   case RSA_MODE_KEY:
> +     mbedtls_rsa_set_padding(trsa, MBEDTLS_RSA_PKCS_V21, MBEDTLS_MD_SHA1);
> +-    outbuf = malloc(trsa->len);
> ++    outbuf = malloc(trsa->MBEDTLS_PRIVATE_V3_ONLY(len));
> ++#if MBEDTLS_VERSION_MAJOR == 3
> ++    rc = mbedtls_rsa_pkcs1_decrypt(trsa, mbedtls_ctr_drbg_random, &ctr_drbg,
> ++                                   &olen, input, outbuf, trsa->MBEDTLS_PRIVATE_V3_ONLY(len));
> ++#else
> +     rc = mbedtls_rsa_pkcs1_decrypt(trsa, mbedtls_ctr_drbg_random, &ctr_drbg, MBEDTLS_RSA_PRIVATE,
> +                                    &olen, input, outbuf, trsa->len);
> ++#endif
> +     if (rc != 0)
> +       debug(1, "mbedtls_pk_decrypt error %d.", rc);
> +     *outlen = olen;
> +diff --git a/player.c b/player.c
> +index 8c1752722..d023d269c 100644
> +--- a/player.c
> ++++ b/player.c
> +@@ -47,7 +47,6 @@
> +
> + #ifdef CONFIG_MBEDTLS
> + #include <mbedtls/aes.h>
> +-#include <mbedtls/havege.h>
> + #endif
> +
> + #ifdef CONFIG_POLARSSL
> +diff --git a/player.h b/player.h
> +index 11435bf91..b35eb7652 100644
> +--- a/player.h
> ++++ b/player.h
> +@@ -9,7 +9,6 @@
> +
> + #ifdef CONFIG_MBEDTLS
> + #include <mbedtls/aes.h>
> +-#include <mbedtls/havege.h>
> + #endif
> +
> + #ifdef CONFIG_POLARSSL

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
