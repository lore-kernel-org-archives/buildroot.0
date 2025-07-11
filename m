Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF333C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 805CB6159D;
	Fri, 11 Jul 2025 10:45:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s2erw4jmDH7U; Fri, 11 Jul 2025 10:45:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A16E61562
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A16E61562;
	Fri, 11 Jul 2025 10:45:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C515B1E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB4F540510
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DQOzw_zLO4kC for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:45:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6C1FD40094
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C1FD40094
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C1FD40094
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:15 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a522224582so976902f8f.3
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230713; x=1752835513;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cxsCJVShMoJUy07YV6/JjWMaLs55fR/mdR2UuW5X6hA=;
 b=PJq0hmotdUu3QFgxnWousSolUtSu8PlLouZW8yifJA0vk65qthoubaSgudmoavXvh0
 ibHqI9VdpZnUmILkHNDfv3VIlJLAexTIkzySt1WoRrtOsSp30cHywVlOBdgSMH5ItiYp
 dP943H07APOFTFoAycEzzXllQeg5LQ9xiAIGgHjeBp/J4oGEPqjkr3J76JVZQ7wdxNNm
 Xo7DaT5vsMlRlN46g+y/dROsH/Bm4AEqkuDaJHJypi/pOQS96jbVwel0aFWk60Br9BYY
 2mgdB4AJyP6Mm9so25d+E0uaDGPDQwRu2y1GZ0vbEGOw9K6G8OETa3/H2msfDIYxdx+i
 T/bA==
X-Gm-Message-State: AOJu0YwEEpAYeCQB5iIouev1gPdY4I/jf4JANOwdoJDf5wdb0gWGJrRm
 w7sMpAxCMgrC+9CWU6KCAUhXo+9xHfRVv6s0pa7zylBrl0gpEDYy5+Zq2ED7pZqyVi8tFFEHJGV
 5sESa
X-Gm-Gg: ASbGncs80h9ZED78CIeHLOTYtPOZT9UKqTjoHLlT3wH5j/7dnW85W6iNLzE3AAMhJEk
 v/fP1L1J9dJqbAsAp0zE9Z9zwbwZQpLyU+CyqWK5iNzMeu/UY0DehsA9JeFOKw4ZfImVEqM/HD5
 Yx00kOgurjFQlGJH0ux0ydWNwUIJ8SDGPI2likheJ/6Mg3utnJjskuvfFffalqPkElIggwqhG2N
 8XOR6KIRbKJmEC3cy2c/89D1i/poEYxY+G7MUHHC3rAFdWWgNlwlPg93akYGv+RP4++A99AW7lx
 fBAUD+JmKWoe6XtcRd6gPChxv+6uiGBPqO6fxVRBpJ8Tb0bqXkE3dAK7GYED8DQrwKWjohGgN7u
 GONfAQTFPlqy2BA==
X-Google-Smtp-Source: AGHT+IEoMM/GEZX4sA73iZAdrQ/gvIeLU6pu8FpT1hbAiE/iOJbeMZ8+ef5fp/ftUHFFdk7MgDQ6tg==
X-Received: by 2002:a05:6000:26ce:b0:3a5:1410:71c0 with SMTP id
 ffacd0b85a97d-3b5f35783a0mr1666801f8f.38.1752230713438; 
 Fri, 11 Jul 2025 03:45:13 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e1e2fasm4063479f8f.77.2025.07.11.03.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:45:13 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:45:12 +0200
Message-ID: <20250711104512.824889-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250705115751.610287-1-thomas.perale@mind.be>
References: <20250705115751.610287-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230713; x=1752835513; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cxsCJVShMoJUy07YV6/JjWMaLs55fR/mdR2UuW5X6hA=;
 b=I1d/mmaNwx2UqR2kpqan99SvDuH0UeLBMzN5SUk1E/eQWaQ/VwX7xO9A+QsyDiLEhI
 ASwHjpiJ5/jDhQNwOEEuXTVK9SNfHT3H/kHFrjNo+ohWJTyIjWE982GA45VNxwAlGDaR
 ovGtgMxjM6JYaEfU9Vyw2juzLx70v1XPS8SX2sLAjkITccNk8QRmBernxR2eBXoNUXc1
 fFppcfoCOf7RYQWcec1ESsYwyHOeyePXAusY5M0TEgRrLB1HtLSIhYnXn0mp8aLZPTD+
 P9+CcfaY9S37QIaf+TzHjVDQ5bfH4e157EPet4bRWEfH1dDPYcYYbRUSf7mXomisIN2l
 a3Cw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=I1d/mmaN
Subject: Re: [Buildroot] [PATCH] package/shadowsocks-libev: fix build w/
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Since the mbedtls bump to v3.6 [1] the shadowsocks-libev package is
> failling  on the autobuilder:
> 
> ```
> checking for mbedtls_cipher_setup in -lmbedcrypto... yes
> checking whether mbedtls supports Cipher Feedback mode or not... configure: error: MBEDTLS_CIPHER_MODE_CFB required
> make: *** [package/pkg-generic.mk:263: /workdir/instance-0/output-1/build/shadowsocks-libev-3.3.5/.stamp_configured] Error 1
> make: Leaving directory '/workdir/instance-0/buildroot'
> ```
> 
> This is due to the breaking changes in the mbedtls API with the version
> bump.
> 
> This patch adds the upstream patch [2] that address this issue by verifying
> conditionally the version of mbedtls we are running on to make the API
> calls and includes.
> 
> [1] 3481a9643f package/mbedtls: bump to version 3.6.3.1
> [2] https://github.com/shadowsocks/shadowsocks-libev/commit/9afa3cacf947f910be46b69fc5a7a1fdd02fd5e6#
> 
> Fixes: https://autobuild.buildroot.org/results/070/070581d95f2739cee3b4cb8252639dd92b5a8421
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
> v1 -> v2: Forgot to add the autobuild link
> ---
>  .../0004-fix-mbedtls-3-6-compatibility.patch  | 231 ++++++++++++++++++
>  1 file changed, 231 insertions(+)
>  create mode 100644 package/shadowsocks-libev/0004-fix-mbedtls-3-6-compatibility.patch
> 
> diff --git a/package/shadowsocks-libev/0004-fix-mbedtls-3-6-compatibility.patch b/package/shadowsocks-libev/0004-fix-mbedtls-3-6-compatibility.patch
> new file mode 100644
> index 0000000000..ca46425c4d
> --- /dev/null
> +++ b/package/shadowsocks-libev/0004-fix-mbedtls-3-6-compatibility.patch
> @@ -0,0 +1,231 @@
> +From 9afa3cacf947f910be46b69fc5a7a1fdd02fd5e6 Mon Sep 17 00:00:00 2001
> +From: Lu jicong <jiconglu58@gmail.com>
> +Date: Fri, 10 Jan 2025 22:05:31 +0800
> +Subject: [PATCH] Fix in 'mbedtls 3.6.0 ver' compilation failure issue
> +
> +Fix mbedtls 3.6 compatibility
> +
> +Co-authored-by: Zxl hhyccc <zxlhhy@gmail.com>
> +Signed-off-by: Lu jicong <jiconglu58@gmail.com>
> +Upstream: https://github.com/shadowsocks/shadowsocks-libev/commit/9afa3cacf947f910be46b69fc5a7a1fdd02fd5e6
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + m4/mbedtls.m4 | 20 ++++++++++++++++++++
> + src/aead.c    | 23 +++++++++++------------
> + src/crypto.c  |  2 +-
> + src/crypto.h  |  1 -
> + src/stream.c  | 51 ++++++---------------------------------------------
> + 5 files changed, 38 insertions(+), 59 deletions(-)
> +
> +diff --git a/m4/mbedtls.m4 b/m4/mbedtls.m4
> +index 2c478b960..a795790ca 100644
> +--- a/m4/mbedtls.m4
> ++++ b/m4/mbedtls.m4
> +@@ -31,7 +31,12 @@ AC_DEFUN([ss_MBEDTLS],
> +   AC_COMPILE_IFELSE(
> +     [AC_LANG_PROGRAM(
> +       [[
> ++#include <mbedtls/version.h>
> ++#if MBEDTLS_VERSION_NUMBER >= 0x03000000
> ++#include <mbedtls/mbedtls_config.h>
> ++#else
> + #include <mbedtls/config.h>
> ++#endif
> +       ]],
> +       [[
> + #ifndef MBEDTLS_CIPHER_MODE_CFB
> +@@ -48,7 +53,12 @@ AC_DEFUN([ss_MBEDTLS],
> +   AC_COMPILE_IFELSE(
> +     [AC_LANG_PROGRAM(
> +       [[
> ++#include <mbedtls/version.h>
> ++#if MBEDTLS_VERSION_NUMBER >= 0x03000000
> ++#include <mbedtls/mbedtls_config.h>
> ++#else
> + #include <mbedtls/config.h>
> ++#endif
> +       ]],
> +       [[
> + #ifndef MBEDTLS_ARC4_C
> +@@ -64,7 +74,12 @@ AC_DEFUN([ss_MBEDTLS],
> +   AC_COMPILE_IFELSE(
> +     [AC_LANG_PROGRAM(
> +       [[
> ++#include <mbedtls/version.h>
> ++#if MBEDTLS_VERSION_NUMBER >= 0x03000000
> ++#include <mbedtls/mbedtls_config.h>
> ++#else
> + #include <mbedtls/config.h>
> ++#endif
> +       ]],
> +       [[
> + #ifndef MBEDTLS_BLOWFISH_C
> +@@ -80,7 +95,12 @@ AC_DEFUN([ss_MBEDTLS],
> +   AC_COMPILE_IFELSE(
> +     [AC_LANG_PROGRAM(
> +       [[
> ++#include <mbedtls/version.h>
> ++#if MBEDTLS_VERSION_NUMBER >= 0x03000000
> ++#include <mbedtls/mbedtls_config.h>
> ++#else
> + #include <mbedtls/config.h>
> ++#endif
> +       ]],
> +       [[
> + #ifndef MBEDTLS_CAMELLIA_C
> +diff --git a/src/aead.c b/src/aead.c
> +index 358ec9381..73349da64 100644
> +--- a/src/aead.c
> ++++ b/src/aead.c
> +@@ -177,9 +177,13 @@ aead_cipher_encrypt(cipher_ctx_t *cipher_ctx,
> +     // Otherwise, just use the mbedTLS one with crappy AES-NI.
> +     case AES192GCM:
> +     case AES128GCM:
> +-
> ++#if MBEDTLS_VERSION_NUMBER < 0x03000000
> +         err = mbedtls_cipher_auth_encrypt(cipher_ctx->evp, n, nlen, ad, adlen,
> +                                           m, mlen, c, clen, c + mlen, tlen);
> ++#else
> ++        err = mbedtls_cipher_auth_encrypt_ext(cipher_ctx->evp, n, nlen, ad, adlen,
> ++                                              m, mlen, c, mlen + tlen, clen, tlen);
> ++#endif
> +         *clen += tlen;
> +         break;
> +     case CHACHA20POLY1305IETF:
> +@@ -226,8 +230,13 @@ aead_cipher_decrypt(cipher_ctx_t *cipher_ctx,
> +     // Otherwise, just use the mbedTLS one with crappy AES-NI.
> +     case AES192GCM:
> +     case AES128GCM:
> ++#if MBEDTLS_VERSION_NUMBER < 0x03000000
> +         err = mbedtls_cipher_auth_decrypt(cipher_ctx->evp, n, nlen, ad, adlen,
> +                                           m, mlen - tlen, p, plen, m + mlen - tlen, tlen);
> ++#else
> ++        err = mbedtls_cipher_auth_decrypt_ext(cipher_ctx->evp, n, nlen, ad, adlen,
> ++                                              m, mlen, p, mlen - tlen, plen, tlen);
> ++#endif
> +         break;
> +     case CHACHA20POLY1305IETF:
> +         err = crypto_aead_chacha20poly1305_ietf_decrypt(p, &long_plen, NULL, m, mlen,
> +@@ -721,17 +730,7 @@ aead_key_init(int method, const char *pass, const char *key)
> +     cipher_t *cipher = (cipher_t *)ss_malloc(sizeof(cipher_t));
> +     memset(cipher, 0, sizeof(cipher_t));
> + 
> +-    if (method >= CHACHA20POLY1305IETF) {
> +-        cipher_kt_t *cipher_info = (cipher_kt_t *)ss_malloc(sizeof(cipher_kt_t));
> +-        cipher->info             = cipher_info;
> +-        cipher->info->base       = NULL;
> +-        cipher->info->key_bitlen = supported_aead_ciphers_key_size[method] * 8;
> +-        cipher->info->iv_size    = supported_aead_ciphers_nonce_size[method];
> +-    } else {
> +-        cipher->info = (cipher_kt_t *)aead_get_cipher_type(method);
> +-    }
> +-
> +-    if (cipher->info == NULL && cipher->key_len == 0) {
> ++    if (method < CHACHA20POLY1305IETF && aead_get_cipher_type(method) == NULL) {
> +         LOGE("Cipher %s not found in crypto library", supported_aead_ciphers[method]);
> +         FATAL("Cannot initialize cipher");
> +     }
> +diff --git a/src/crypto.c b/src/crypto.c
> +index b44d8674c..76c426b53 100644
> +--- a/src/crypto.c
> ++++ b/src/crypto.c
> +@@ -103,7 +103,7 @@ crypto_md5(const unsigned char *d, size_t n, unsigned char *md)
> +     if (md == NULL) {
> +         md = m;
> +     }
> +-#if MBEDTLS_VERSION_NUMBER >= 0x02070000
> ++#if MBEDTLS_VERSION_NUMBER < 0x03000000 && MBEDTLS_VERSION_NUMBER >= 0x02070000
> +     if (mbedtls_md5_ret(d, n, md) != 0)
> +         FATAL("Failed to calculate MD5");
> + #else
> +diff --git a/src/crypto.h b/src/crypto.h
> +index 1791551ff..70707932b 100644
> +--- a/src/crypto.h
> ++++ b/src/crypto.h
> +@@ -97,7 +97,6 @@ typedef struct buffer {
> + typedef struct {
> +     int method;
> +     int skey;
> +-    cipher_kt_t *info;
> +     size_t nonce_len;
> +     size_t key_len;
> +     size_t tag_len;
> +diff --git a/src/stream.c b/src/stream.c
> +index 35d9050b3..b2e2cea82 100644
> +--- a/src/stream.c
> ++++ b/src/stream.c
> +@@ -168,33 +168,6 @@ crypto_stream_xor_ic(uint8_t *c, const uint8_t *m, uint64_t mlen,
> +     return 0;
> + }
> + 
> +-int
> +-cipher_nonce_size(const cipher_t *cipher)
> +-{
> +-    if (cipher == NULL) {
> +-        return 0;
> +-    }
> +-    return cipher->info->iv_size;
> +-}
> +-
> +-int
> +-cipher_key_size(const cipher_t *cipher)
> +-{
> +-    /*
> +-     * Semi-API changes (technically public, morally prnonceate)
> +-     * Renamed a few headers to include _internal in the name. Those headers are
> +-     * not supposed to be included by users.
> +-     * Changed md_info_t into an opaque structure (use md_get_xxx() accessors).
> +-     * Changed pk_info_t into an opaque structure.
> +-     * Changed cipher_base_t into an opaque structure.
> +-     */
> +-    if (cipher == NULL) {
> +-        return 0;
> +-    }
> +-    /* From Version 1.2.7 released 2013-04-13 Default Blowfish keysize is now 128-bits */
> +-    return cipher->info->key_bitlen / 8;
> +-}
> +-
> + const cipher_kt_t *
> + stream_get_cipher_type(int method)
> + {
> +@@ -642,34 +615,22 @@ stream_key_init(int method, const char *pass, const char *key)
> +     cipher_t *cipher = (cipher_t *)ss_malloc(sizeof(cipher_t));
> +     memset(cipher, 0, sizeof(cipher_t));
> + 
> +-    if (method == SALSA20 || method == CHACHA20 || method == CHACHA20IETF) {
> +-        cipher_kt_t *cipher_info = (cipher_kt_t *)ss_malloc(sizeof(cipher_kt_t));
> +-        cipher->info             = cipher_info;
> +-        cipher->info->base       = NULL;
> +-        cipher->info->key_bitlen = supported_stream_ciphers_key_size[method] * 8;
> +-        cipher->info->iv_size    = supported_stream_ciphers_nonce_size[method];
> +-    } else {
> +-        cipher->info = (cipher_kt_t *)stream_get_cipher_type(method);
> +-    }
> +-
> +-    if (cipher->info == NULL && cipher->key_len == 0) {
> ++    if (method < SALSA20 && stream_get_cipher_type(method) == NULL) {
> +         LOGE("Cipher %s not found in crypto library", supported_stream_ciphers[method]);
> +         FATAL("Cannot initialize cipher");
> +     }
> + 
> +     if (key != NULL)
> +-        cipher->key_len = crypto_parse_key(key, cipher->key, cipher_key_size(cipher));
> ++        cipher->key_len = crypto_parse_key(key, cipher->key,
> ++                                           supported_stream_ciphers_key_size[method]);
> +     else
> +-        cipher->key_len = crypto_derive_key(pass, cipher->key, cipher_key_size(cipher));
> ++        cipher->key_len = crypto_derive_key(pass, cipher->key,
> ++                                            supported_stream_ciphers_key_size[method]);
> + 
> +     if (cipher->key_len == 0) {
> +         FATAL("Cannot generate key and NONCE");
> +     }
> +-    if (method == RC4_MD5) {
> +-        cipher->nonce_len = 16;
> +-    } else {
> +-        cipher->nonce_len = cipher_nonce_size(cipher);
> +-    }
> ++    cipher->nonce_len = supported_stream_ciphers_nonce_size[method];
> +     cipher->method = method;
> + 
> +     return cipher;
> -- 
> 2.50.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
