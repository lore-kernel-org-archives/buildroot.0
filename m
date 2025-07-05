Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46760C8303C
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 08:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39363610A0;
	Sat,  5 Jul 2025 08:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g_52kdHN6pK2; Sat,  5 Jul 2025 08:16:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C06260F06
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C06260F06;
	Sat,  5 Jul 2025 08:16:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D51615F
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 08:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 233A783CA5
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 08:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E72QPrpb82jh for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 08:16:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A7BBC83CA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7BBC83CA6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7BBC83CA6
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 08:16:18 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-451e2f0d9c2so10089565e9.1
 for <buildroot@buildroot.org>; Sat, 05 Jul 2025 01:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751703376; x=1752308176;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yn2VJ5vouhYrzwL4tJlsHb/hJcfMgdE0aiBxr7uciGI=;
 b=XqTgIO2NARSktE0oVuimIvISJYgnaP8Thb9cAYHUEI7yo0r8wtVP0vs6yaaimVH7Ee
 MuHFPCXjzrKpWCjPeVUoY1RFDH2/GnSd5iyQvC2d7Xgx5UL22KQAwnGWJzpy40vY8PFV
 acnuJgco73hoEB7xK60PZwV9vkZmlcL48sLs3eBm6V5+Jt7y8dfuTMbgUSy2zFbxft9C
 DiLVypBQpMv2C4G6Xl7/osXg5P1YcIR3IBh0nznChNpwknBd4FzJPsiBjPOzPQcw7LOp
 zvMoziCF+22lQEJvUZLEjsd/hvoUm/dJXVCE6eMvHHBFspj4mEg3wfw8Ow3YsyHneDmy
 Uimw==
X-Gm-Message-State: AOJu0Yy7gCr1QbwYBSYmBhLJb4OAqX26b3cU4PZa4qMwaxrXCWRFQZR8
 SC/PLlFqaddhTWPt8zRQ+mShMiy9BkbQTZR9AfjTFnwUvOFYN9K1xBmD30ftzOOR37JjgiElZPE
 XFr5p
X-Gm-Gg: ASbGncuLUe7bJqSK11+4fmZMNwEjcclETKUsYDr9sKi0zBcViOcb5cwYe892tzN4g5D
 Zr0Xd7WLYWkna2BF8iEpniUHbmlaYZY//nWcJc9gUdWZZZ7oYZnEKeRQS3I23hDnJPbdjPq0CrL
 OaQ+9DQmWt6LSOLPbYgDt8X9SeC4I8hAjUQK8nsy16k2u8TQt13qENNAbtqFQKPXBMt2PYNvXgH
 jb+CgDaDS2LZwwiz5iEjrMw2c2Pi3CcZKWToHPLpnOY/HZ6lPg7DPhBq0Gr0h8oEPDhXWHA+apK
 YtW/R2Ydeljh7adSjDuQUH5rempn4b9/1iCErZ+3jYVIx22jzTSJUhFruxWW62yaQjVS1BEUX1P
 MiXwxsiaaog==
X-Google-Smtp-Source: AGHT+IGxrMB/tHpIwdUwEiwKWneS57q8MNqnkcMSuwwXaw87q9IWuZFT6mnZsf4M5d9um4voej/M8Q==
X-Received: by 2002:a7b:c006:0:b0:453:8e3d:26ef with SMTP id
 5b1f17b1804b1-454b1f4f177mr39679575e9.6.1751703375755; 
 Sat, 05 Jul 2025 01:16:15 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b4722597f0sm4474070f8f.68.2025.07.05.01.16.14
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 01:16:15 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat,  5 Jul 2025 10:16:14 +0200
Message-ID: <20250705081614.596604-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751703376; x=1752308176; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=yn2VJ5vouhYrzwL4tJlsHb/hJcfMgdE0aiBxr7uciGI=;
 b=XdGZMnfShOmeG5Dq1omHIk9s8TzeYdyyQ+3yLt14zjentyDXCNYbOcS6yRTy0B+doP
 zfo9fDDtK4EfBaQ7EPdPVVDztLgZwjNZzKuFeij/+7EVpiAvC1iZhahuqujrQlSyY+YW
 3O+d12mD364tfiCxgd52zoN79PzYqm59Y+yVkok22nm6efz1fJfY3yqjjgF52QDp++/8
 XNctM4Bdqayks/uASCZh2nQ1MSLJX8b1iOFjN+4+QE7wABvh4M3x4x+BDgq3ImP9NkyW
 rfQ5LR72RK8bwhKTHTLNYPVAVn6bg9XDJ0sUgdAdEg4OVjm6IWM7sXaBGXUzZbdVHFyN
 yzLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=XdGZMnfS
Subject: [Buildroot] [PATCH] package/shadowsocks-libev: fix build w/ mbedtls
 v3.6
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

Since the mbedtls bump to v3.6 [1] the shadowsocks-libev package is
failling  on the autobuilder:

```
checking for mbedtls_cipher_setup in -lmbedcrypto... yes
checking whether mbedtls supports Cipher Feedback mode or not... configure: error: MBEDTLS_CIPHER_MODE_CFB required
make: *** [package/pkg-generic.mk:263: /workdir/instance-0/output-1/build/shadowsocks-libev-3.3.5/.stamp_configured] Error 1
make: Leaving directory '/workdir/instance-0/buildroot'
```

This is due to the breaking changes in the mbedtls API with the version
bump.

This patch adds the upstream patch [2] that address this issue by verifying
conditionally the version of mbedtls we are running on to make the API
calls and includes.

[1] 3481a9643f package/mbedtls: bump to version 3.6.3.1
[2] https://github.com/shadowsocks/shadowsocks-libev/commit/9afa3cacf947f910be46b69fc5a7a1fdd02fd5e6#

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0004-fix-mbedtls-3-6-compatibility.patch  | 231 ++++++++++++++++++
 1 file changed, 231 insertions(+)
 create mode 100644 package/shadowsocks-libev/0004-fix-mbedtls-3-6-compatibility.patch

diff --git a/package/shadowsocks-libev/0004-fix-mbedtls-3-6-compatibility.patch b/package/shadowsocks-libev/0004-fix-mbedtls-3-6-compatibility.patch
new file mode 100644
index 0000000000..ca46425c4d
--- /dev/null
+++ b/package/shadowsocks-libev/0004-fix-mbedtls-3-6-compatibility.patch
@@ -0,0 +1,231 @@
+From 9afa3cacf947f910be46b69fc5a7a1fdd02fd5e6 Mon Sep 17 00:00:00 2001
+From: Lu jicong <jiconglu58@gmail.com>
+Date: Fri, 10 Jan 2025 22:05:31 +0800
+Subject: [PATCH] Fix in 'mbedtls 3.6.0 ver' compilation failure issue
+
+Fix mbedtls 3.6 compatibility
+
+Co-authored-by: Zxl hhyccc <zxlhhy@gmail.com>
+Signed-off-by: Lu jicong <jiconglu58@gmail.com>
+Upstream: https://github.com/shadowsocks/shadowsocks-libev/commit/9afa3cacf947f910be46b69fc5a7a1fdd02fd5e6
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ m4/mbedtls.m4 | 20 ++++++++++++++++++++
+ src/aead.c    | 23 +++++++++++------------
+ src/crypto.c  |  2 +-
+ src/crypto.h  |  1 -
+ src/stream.c  | 51 ++++++---------------------------------------------
+ 5 files changed, 38 insertions(+), 59 deletions(-)
+
+diff --git a/m4/mbedtls.m4 b/m4/mbedtls.m4
+index 2c478b960..a795790ca 100644
+--- a/m4/mbedtls.m4
++++ b/m4/mbedtls.m4
+@@ -31,7 +31,12 @@ AC_DEFUN([ss_MBEDTLS],
+   AC_COMPILE_IFELSE(
+     [AC_LANG_PROGRAM(
+       [[
++#include <mbedtls/version.h>
++#if MBEDTLS_VERSION_NUMBER >= 0x03000000
++#include <mbedtls/mbedtls_config.h>
++#else
+ #include <mbedtls/config.h>
++#endif
+       ]],
+       [[
+ #ifndef MBEDTLS_CIPHER_MODE_CFB
+@@ -48,7 +53,12 @@ AC_DEFUN([ss_MBEDTLS],
+   AC_COMPILE_IFELSE(
+     [AC_LANG_PROGRAM(
+       [[
++#include <mbedtls/version.h>
++#if MBEDTLS_VERSION_NUMBER >= 0x03000000
++#include <mbedtls/mbedtls_config.h>
++#else
+ #include <mbedtls/config.h>
++#endif
+       ]],
+       [[
+ #ifndef MBEDTLS_ARC4_C
+@@ -64,7 +74,12 @@ AC_DEFUN([ss_MBEDTLS],
+   AC_COMPILE_IFELSE(
+     [AC_LANG_PROGRAM(
+       [[
++#include <mbedtls/version.h>
++#if MBEDTLS_VERSION_NUMBER >= 0x03000000
++#include <mbedtls/mbedtls_config.h>
++#else
+ #include <mbedtls/config.h>
++#endif
+       ]],
+       [[
+ #ifndef MBEDTLS_BLOWFISH_C
+@@ -80,7 +95,12 @@ AC_DEFUN([ss_MBEDTLS],
+   AC_COMPILE_IFELSE(
+     [AC_LANG_PROGRAM(
+       [[
++#include <mbedtls/version.h>
++#if MBEDTLS_VERSION_NUMBER >= 0x03000000
++#include <mbedtls/mbedtls_config.h>
++#else
+ #include <mbedtls/config.h>
++#endif
+       ]],
+       [[
+ #ifndef MBEDTLS_CAMELLIA_C
+diff --git a/src/aead.c b/src/aead.c
+index 358ec9381..73349da64 100644
+--- a/src/aead.c
++++ b/src/aead.c
+@@ -177,9 +177,13 @@ aead_cipher_encrypt(cipher_ctx_t *cipher_ctx,
+     // Otherwise, just use the mbedTLS one with crappy AES-NI.
+     case AES192GCM:
+     case AES128GCM:
+-
++#if MBEDTLS_VERSION_NUMBER < 0x03000000
+         err = mbedtls_cipher_auth_encrypt(cipher_ctx->evp, n, nlen, ad, adlen,
+                                           m, mlen, c, clen, c + mlen, tlen);
++#else
++        err = mbedtls_cipher_auth_encrypt_ext(cipher_ctx->evp, n, nlen, ad, adlen,
++                                              m, mlen, c, mlen + tlen, clen, tlen);
++#endif
+         *clen += tlen;
+         break;
+     case CHACHA20POLY1305IETF:
+@@ -226,8 +230,13 @@ aead_cipher_decrypt(cipher_ctx_t *cipher_ctx,
+     // Otherwise, just use the mbedTLS one with crappy AES-NI.
+     case AES192GCM:
+     case AES128GCM:
++#if MBEDTLS_VERSION_NUMBER < 0x03000000
+         err = mbedtls_cipher_auth_decrypt(cipher_ctx->evp, n, nlen, ad, adlen,
+                                           m, mlen - tlen, p, plen, m + mlen - tlen, tlen);
++#else
++        err = mbedtls_cipher_auth_decrypt_ext(cipher_ctx->evp, n, nlen, ad, adlen,
++                                              m, mlen, p, mlen - tlen, plen, tlen);
++#endif
+         break;
+     case CHACHA20POLY1305IETF:
+         err = crypto_aead_chacha20poly1305_ietf_decrypt(p, &long_plen, NULL, m, mlen,
+@@ -721,17 +730,7 @@ aead_key_init(int method, const char *pass, const char *key)
+     cipher_t *cipher = (cipher_t *)ss_malloc(sizeof(cipher_t));
+     memset(cipher, 0, sizeof(cipher_t));
+ 
+-    if (method >= CHACHA20POLY1305IETF) {
+-        cipher_kt_t *cipher_info = (cipher_kt_t *)ss_malloc(sizeof(cipher_kt_t));
+-        cipher->info             = cipher_info;
+-        cipher->info->base       = NULL;
+-        cipher->info->key_bitlen = supported_aead_ciphers_key_size[method] * 8;
+-        cipher->info->iv_size    = supported_aead_ciphers_nonce_size[method];
+-    } else {
+-        cipher->info = (cipher_kt_t *)aead_get_cipher_type(method);
+-    }
+-
+-    if (cipher->info == NULL && cipher->key_len == 0) {
++    if (method < CHACHA20POLY1305IETF && aead_get_cipher_type(method) == NULL) {
+         LOGE("Cipher %s not found in crypto library", supported_aead_ciphers[method]);
+         FATAL("Cannot initialize cipher");
+     }
+diff --git a/src/crypto.c b/src/crypto.c
+index b44d8674c..76c426b53 100644
+--- a/src/crypto.c
++++ b/src/crypto.c
+@@ -103,7 +103,7 @@ crypto_md5(const unsigned char *d, size_t n, unsigned char *md)
+     if (md == NULL) {
+         md = m;
+     }
+-#if MBEDTLS_VERSION_NUMBER >= 0x02070000
++#if MBEDTLS_VERSION_NUMBER < 0x03000000 && MBEDTLS_VERSION_NUMBER >= 0x02070000
+     if (mbedtls_md5_ret(d, n, md) != 0)
+         FATAL("Failed to calculate MD5");
+ #else
+diff --git a/src/crypto.h b/src/crypto.h
+index 1791551ff..70707932b 100644
+--- a/src/crypto.h
++++ b/src/crypto.h
+@@ -97,7 +97,6 @@ typedef struct buffer {
+ typedef struct {
+     int method;
+     int skey;
+-    cipher_kt_t *info;
+     size_t nonce_len;
+     size_t key_len;
+     size_t tag_len;
+diff --git a/src/stream.c b/src/stream.c
+index 35d9050b3..b2e2cea82 100644
+--- a/src/stream.c
++++ b/src/stream.c
+@@ -168,33 +168,6 @@ crypto_stream_xor_ic(uint8_t *c, const uint8_t *m, uint64_t mlen,
+     return 0;
+ }
+ 
+-int
+-cipher_nonce_size(const cipher_t *cipher)
+-{
+-    if (cipher == NULL) {
+-        return 0;
+-    }
+-    return cipher->info->iv_size;
+-}
+-
+-int
+-cipher_key_size(const cipher_t *cipher)
+-{
+-    /*
+-     * Semi-API changes (technically public, morally prnonceate)
+-     * Renamed a few headers to include _internal in the name. Those headers are
+-     * not supposed to be included by users.
+-     * Changed md_info_t into an opaque structure (use md_get_xxx() accessors).
+-     * Changed pk_info_t into an opaque structure.
+-     * Changed cipher_base_t into an opaque structure.
+-     */
+-    if (cipher == NULL) {
+-        return 0;
+-    }
+-    /* From Version 1.2.7 released 2013-04-13 Default Blowfish keysize is now 128-bits */
+-    return cipher->info->key_bitlen / 8;
+-}
+-
+ const cipher_kt_t *
+ stream_get_cipher_type(int method)
+ {
+@@ -642,34 +615,22 @@ stream_key_init(int method, const char *pass, const char *key)
+     cipher_t *cipher = (cipher_t *)ss_malloc(sizeof(cipher_t));
+     memset(cipher, 0, sizeof(cipher_t));
+ 
+-    if (method == SALSA20 || method == CHACHA20 || method == CHACHA20IETF) {
+-        cipher_kt_t *cipher_info = (cipher_kt_t *)ss_malloc(sizeof(cipher_kt_t));
+-        cipher->info             = cipher_info;
+-        cipher->info->base       = NULL;
+-        cipher->info->key_bitlen = supported_stream_ciphers_key_size[method] * 8;
+-        cipher->info->iv_size    = supported_stream_ciphers_nonce_size[method];
+-    } else {
+-        cipher->info = (cipher_kt_t *)stream_get_cipher_type(method);
+-    }
+-
+-    if (cipher->info == NULL && cipher->key_len == 0) {
++    if (method < SALSA20 && stream_get_cipher_type(method) == NULL) {
+         LOGE("Cipher %s not found in crypto library", supported_stream_ciphers[method]);
+         FATAL("Cannot initialize cipher");
+     }
+ 
+     if (key != NULL)
+-        cipher->key_len = crypto_parse_key(key, cipher->key, cipher_key_size(cipher));
++        cipher->key_len = crypto_parse_key(key, cipher->key,
++                                           supported_stream_ciphers_key_size[method]);
+     else
+-        cipher->key_len = crypto_derive_key(pass, cipher->key, cipher_key_size(cipher));
++        cipher->key_len = crypto_derive_key(pass, cipher->key,
++                                            supported_stream_ciphers_key_size[method]);
+ 
+     if (cipher->key_len == 0) {
+         FATAL("Cannot generate key and NONCE");
+     }
+-    if (method == RC4_MD5) {
+-        cipher->nonce_len = 16;
+-    } else {
+-        cipher->nonce_len = cipher_nonce_size(cipher);
+-    }
++    cipher->nonce_len = supported_stream_ciphers_nonce_size[method];
+     cipher->method = method;
+ 
+     return cipher;
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
