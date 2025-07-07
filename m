Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF57C8303C
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 15:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 020394187E;
	Mon,  7 Jul 2025 15:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eJap0Sc1Q_kj; Mon,  7 Jul 2025 15:47:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0673A4185C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0673A4185C;
	Mon,  7 Jul 2025 15:47:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 96F6B1BF
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 15:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 889B041821
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 15:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eNJ3lXxVLxdK for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 15:47:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5DEC441845
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DEC441845
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5DEC441845
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 15:47:09 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a503d9ef59so2517291f8f.3
 for <buildroot@buildroot.org>; Mon, 07 Jul 2025 08:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751903227; x=1752508027;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K7dE4OABACAV8cBYjZlWQrCwgcnH50AJcQhnNFdYCgg=;
 b=COy5Wo6iLeNHDMeJwd5yXPMXQwUIQNIHeLa06ZM2C0kslCC6yrec85YAGcW0/uhWWG
 xYOsEG5LqFD3NrAZzRd6hPsUObNiNaPvZEQOQKDXRsBLohxTdF2zUqg9/ARPPE+4Gl9M
 eA6oeB+JU6UCfkfbZVxSKYULjc6BscVayovZZNNfFSlcIOyI1pXKO03T/pSIhgku+O8s
 kzx17NlA4IcXTZNlyBNt2kBC3pj/f3qRNnmgeU3UjQH8YHP8rNPAaVuXDHyUCT28wWbd
 asUkSVzglJ5TTSwe77sqJ6YGeg7CrqGOO0tuEi0RnNd534hB4AI5Ie6T76Ik41YHwlW6
 TtGA==
X-Gm-Message-State: AOJu0Yxo7pBsfY/QiGmKMiRkTfDFfkMceca3KC70ZFlVIE+TavjErd21
 wCSVQ0N/Ez1JKIMTshFTf0etvR7KtmBI4FOJ0RN8Gki8nE+hpoYiK9YygSdveCZ206qUxToxPXh
 AueB/
X-Gm-Gg: ASbGncvGLSQ5P9sDF3EaE4KuXOySZtUcAEV3RRriUk9GFtKRZH6xo8uAwoV1jfl8E6/
 qHZY5gBAvwavtfklq/+cG7JGHyMp1C8DnnNTGTgR9Zi7DJxwonnoxYQZOPmNvrYEWvdOJQ54jtI
 6jfgN1HE7bqV4acuQhtG67NigAoZ7u9l0n+gOm2V8B7W1zbT45uIz0LwQYu6QggVc+hAfam9pH1
 C5zigdK7KGTB/z7JkreePCS/MwFHGJAG41ezYxumdtIF0kaxe+KtDeQXp1ezelTIqXzMNp6JH3u
 PvmNjGdhXQmig3GTjiMlWcjb8tC0ALr+m227HwWuvX+1DH8XhQwFhKHJer8s0gslWY184npNxMb
 P6ZofxBW5jg==
X-Google-Smtp-Source: AGHT+IF5ci2zxHlpy/zXpDyHlMnrBgjA8x7NtGJ2soyK+lqT7DtF+1wG/ZiyXbNtpwtKMagJ1VY/eA==
X-Received: by 2002:a05:6000:701:b0:3a6:f328:22b9 with SMTP id
 ffacd0b85a97d-3b49703d7a5mr10753959f8f.51.1751903226697; 
 Mon, 07 Jul 2025 08:47:06 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b471b9736bsm10784958f8f.60.2025.07.07.08.47.05
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 08:47:06 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  7 Jul 2025 17:47:05 +0200
Message-ID: <20250707154705.1303551-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751903227; x=1752508027; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=K7dE4OABACAV8cBYjZlWQrCwgcnH50AJcQhnNFdYCgg=;
 b=cpiVHCRboCvJ3BV5yMZhSe1rp1PnjUE9b+aMH27Ab8Z9GWHL0nA5B7VIDNIrZaJxvX
 szCHPACkl0FsAz+Pc/sbQtMRelGwPNnhahCgwIbzmIH1gBSXk3bhMpfvjWYeEwRzXudW
 S8VeSM67SKz5fjG66+MLhu0yIK7/XcT/BXMFPME3D5b+WWebWpDpNZo9lzSkSXoR9jHa
 ADcSZKIL+4cQ0ohemMSVQqfB1pXkDI0jlEfcEhuS1kfDZls4sxgWRLisxDZ5lUvfi8mP
 pnIeKwVxWHTCCSS0I0VThtnxw1N1khE9GmP/RVV2Y7x7HukazGRoC07XpKNzmQQw+7OG
 h40g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=cpiVHCRb
Subject: [Buildroot] [PATCH] package/shairport-sync: fix build w/ mbedtls
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

Since [1] when trying to build this package with mbedtls v3.6 the
following error is happening:

```
player.h:12:10: fatal error: mbedtls/havege.h: No such file or directory
   12 | #include <mbedtls/havege.h>
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.
```

This error can be reproduced with the following config:

```
cat <<EOF >.config
BR2_arm=y
BR2_cortex_a7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_MBEDTLS=y
BR2_PACKAGE_SHAIRPORT_SYNC=y
EOF
make olddefconfig
make
```

This patch backport the upstream commit [2] that add support for
mbedtls v3.

[1] 3481a9643f package/mbedtls: bump to version 3.6.3.1
[2] https://github.com/mikebrady/shairport-sync/commit/d73b585c6f6d9136ae7a04243a54d734fa57d779

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...0002-mbedtls-add-support-to-mbedtls3.patch | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 package/shairport-sync/0002-mbedtls-add-support-to-mbedtls3.patch

diff --git a/package/shairport-sync/0002-mbedtls-add-support-to-mbedtls3.patch b/package/shairport-sync/0002-mbedtls-add-support-to-mbedtls3.patch
new file mode 100644
index 0000000000..e0e8ea53de
--- /dev/null
+++ b/package/shairport-sync/0002-mbedtls-add-support-to-mbedtls3.patch
@@ -0,0 +1,105 @@
+From d73b585c6f6d9136ae7a04243a54d734fa57d779 Mon Sep 17 00:00:00 2001
+From: Seo Suchan <tjtncks@gmail.com>
+Date: Thu, 9 May 2024 19:10:59 +0900
+Subject: [PATCH] mbedtls: add support to mbedtls3
+
+Signed-off-by: Seo Suchan <tjtncks@gmail.com>
+Upstream: https://github.com/mikebrady/shairport-sync/commit/d73b585c6f6d9136ae7a04243a54d734fa57d779
+[thomas: backport the line numbers]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ common.c | 30 ++++++++++++++++++++++++++----
+ player.c |  1 -
+ player.h |  1 -
+ 3 files changed, 26 insertions(+), 6 deletions(-)
+
+diff --git a/common.c b/common.c
+index 4dc75bc7f..0e2a07243 100644
+--- a/common.c
++++ b/common.c
+@@ -77,6 +77,12 @@
+ #include <mbedtls/md.h>
+ #include <mbedtls/version.h>
+ #include <mbedtls/x509.h>
++
++#if MBEDTLS_VERSION_MAJOR == 3
++#define MBEDTLS_PRIVATE_V3_ONLY(_q) MBEDTLS_PRIVATE(_q)
++#else
++#define MBEDTLS_PRIVATE_V3_ONLY(_q) _q
++#endif
+ #endif
+ 
+ #ifdef CONFIG_LIBDAEMON
+@@ -691,8 +697,14 @@ uint8_t *rsa_apply(uint8_t *input, int inlen, int *outlen, int mode) {
+ 
+   mbedtls_pk_init(&pkctx);
+ 
++#if MBEDTLS_VERSION_MAJOR == 3
+   rc = mbedtls_pk_parse_key(&pkctx, (unsigned char *)super_secret_key, sizeof(super_secret_key),
++                            NULL, 0, mbedtls_ctr_drbg_random, &ctr_drbg);
++#else
++  rc = mbedtls_pk_parse_key(&pkctx, (unsigned char *)super_secret_key, sizeof(super_secret_key), 
+                             NULL, 0);
++
++#endif
+   if (rc != 0)
+     debug(1, "Error %d reading the private key.", rc);
+ 
+@@ -701,19 +713,29 @@ uint8_t *rsa_apply(uint8_t *input, int inlen, int *outlen, int mode) {
+ 
+   switch (mode) {
+   case RSA_MODE_AUTH:
+-    mbedtls_rsa_set_padding(trsa, MBEDTLS_RSA_PKCS_V15, MBEDTLS_MD_NONE);
+-    outbuf = malloc(trsa->len);
++    mbedtls_rsa_set_padding(trsa, MBEDTLS_RSA_PKCS_V15, MBEDTLS_MD_NONE);    
++    outbuf = malloc(trsa->MBEDTLS_PRIVATE_V3_ONLY(len));
++#if MBEDTLS_VERSION_MAJOR == 3
++    rc = mbedtls_rsa_pkcs1_encrypt(trsa, mbedtls_ctr_drbg_random, &ctr_drbg,
++                                   inlen, input, outbuf);
++#else
+     rc = mbedtls_rsa_pkcs1_encrypt(trsa, mbedtls_ctr_drbg_random, &ctr_drbg, MBEDTLS_RSA_PRIVATE,
+                                    inlen, input, outbuf);
++#endif
+     if (rc != 0)
+       debug(1, "mbedtls_pk_encrypt error %d.", rc);
+-    *outlen = trsa->len;
++    *outlen = trsa->MBEDTLS_PRIVATE_V3_ONLY(len);
+     break;
+   case RSA_MODE_KEY:
+     mbedtls_rsa_set_padding(trsa, MBEDTLS_RSA_PKCS_V21, MBEDTLS_MD_SHA1);
+-    outbuf = malloc(trsa->len);
++    outbuf = malloc(trsa->MBEDTLS_PRIVATE_V3_ONLY(len));
++#if MBEDTLS_VERSION_MAJOR == 3
++    rc = mbedtls_rsa_pkcs1_decrypt(trsa, mbedtls_ctr_drbg_random, &ctr_drbg,
++                                   &olen, input, outbuf, trsa->MBEDTLS_PRIVATE_V3_ONLY(len));
++#else
+     rc = mbedtls_rsa_pkcs1_decrypt(trsa, mbedtls_ctr_drbg_random, &ctr_drbg, MBEDTLS_RSA_PRIVATE,
+                                    &olen, input, outbuf, trsa->len);
++#endif
+     if (rc != 0)
+       debug(1, "mbedtls_pk_decrypt error %d.", rc);
+     *outlen = olen;
+diff --git a/player.c b/player.c
+index 8c1752722..d023d269c 100644
+--- a/player.c
++++ b/player.c
+@@ -47,7 +47,6 @@
+ 
+ #ifdef CONFIG_MBEDTLS
+ #include <mbedtls/aes.h>
+-#include <mbedtls/havege.h>
+ #endif
+ 
+ #ifdef CONFIG_POLARSSL
+diff --git a/player.h b/player.h
+index 11435bf91..b35eb7652 100644
+--- a/player.h
++++ b/player.h
+@@ -9,7 +9,6 @@
+ 
+ #ifdef CONFIG_MBEDTLS
+ #include <mbedtls/aes.h>
+-#include <mbedtls/havege.h>
+ #endif
+ 
+ #ifdef CONFIG_POLARSSL
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
