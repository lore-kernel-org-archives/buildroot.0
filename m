Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72262C6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 07:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F5ED817BD;
	Wed, 30 Aug 2023 07:58:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F5ED817BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rdRYOsXc0Ydu; Wed, 30 Aug 2023 07:58:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3549B8210D;
	Wed, 30 Aug 2023 07:57:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3549B8210D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B2B381BF83A
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 07:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9920560C08
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 07:57:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9920560C08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QmLQ86Dk61FR for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 07:57:56 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4478760BE0
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 07:57:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4478760BE0
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-31c63cd4ec2so4398448f8f.0
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 00:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693382274; x=1693987074;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HodAwSkexeHKb+dEOCQ6jlUN7NJYEGPUnPuShHyx2xA=;
 b=KOpNU8GdkM9iZI+JMzYiJw1LKIPK0GNTJ+kU/W/1LfpBbAbWg9cRK45s8EZ1q6ig6k
 D02sC6XZItHtlCqXBCQO7r1FldjUg9KjwaYP5EsAmiYR2t/2tKGX9kEUbjlJkBfX3Ofj
 bRpf938FE7NBitvZolMlBm6YDxQ+AtX0/obRbV1XzTJryErbXv7HCeoflqKoYiJuaOUe
 0RAUgcPqEijNezHot0+gtqejafjMvC7CEFgSIqiiZG9srrX5JleArTAhR9/moCAKc+15
 2ZORqkoFH73Bdt/r9qlhcoWm9/JefzmpeQ3TzYwaBIY/OlXVjWMkxFyqCG4//z7FcXN0
 oR5w==
X-Gm-Message-State: AOJu0Yy5uauOYHTNqfOza92T3m4yPXkgWiarQ8jzJdwn6AN4FJYrVxBP
 2T+wxSGVr/josMUy3rTLLour+Ldmj4VBEw==
X-Google-Smtp-Source: AGHT+IFU4uu3BEYCGA+mQe/zE0fZfR9XGUin+5Dor8ZkQ/3M+/2tfdWC+c8st/I4MnCxh5X53Nj/Ig==
X-Received: by 2002:a5d:49c7:0:b0:317:70da:abdd with SMTP id
 t7-20020a5d49c7000000b0031770daabddmr1054453wrs.59.1693382273651; 
 Wed, 30 Aug 2023 00:57:53 -0700 (PDT)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 j14-20020adfea4e000000b003142ea7a661sm15925680wrn.21.2023.08.30.00.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 00:57:53 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 09:57:45 +0200
Message-ID: <20230830075745.1861095-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693382274; x=1693987074; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=HodAwSkexeHKb+dEOCQ6jlUN7NJYEGPUnPuShHyx2xA=;
 b=qxw85K4BZfo+OTPmm2S3SdGmsrXuO4pZLCqUHHDuKkhozUaI/q8Ywk6KCowYgCmncx
 XPG761cNvzzjsp5paECmE0AZUQFyM8Lx5OXDW7lxvGyBSeAAiVdA+RZaWsUjKWu0EpmB
 jDxUTRVoe/Ew8r7c9QM1BvM+LYA4wLNC44ba8OE2fxG75U9TQauwxBJadFLptQJfier1
 6ly7W0aOfpF4QAzdAv5jglZJKxtZtW69lXVm7AA5Jh3oZKLfiabhkR+n4K1fT//KmNiJ
 ehnDn/pcOMpCMPkLbT2mupsGK6lf057xZSeznUCbVBEcmKSKsMKcMv8iEuGjVCv3ViIB
 ySOQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=qxw85K4B
Subject: [Buildroot] [PATCH] package/libsrtp: bump to version 2.5.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Gregory Dymarek <gregd72002@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/cisco/libsrtp/releases/tag/v2.5.0

See detailed change log:
https://github.com/cisco/libsrtp/blob/v2.5.0/CHANGES#L3-L43

Dropped patch wich was already upstream.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 ...legacy-OpenSSL-to-fix-LibreSSL-build.patch | 86 -------------------
 package/libsrtp/libsrtp.hash                  |  2 +-
 package/libsrtp/libsrtp.mk                    |  2 +-
 3 files changed, 2 insertions(+), 88 deletions(-)
 delete mode 100644 package/libsrtp/0001-Remove-compatibility-code-for-legacy-OpenSSL-to-fix-LibreSSL-build.patch

diff --git a/package/libsrtp/0001-Remove-compatibility-code-for-legacy-OpenSSL-to-fix-LibreSSL-build.patch b/package/libsrtp/0001-Remove-compatibility-code-for-legacy-OpenSSL-to-fix-LibreSSL-build.patch
deleted file mode 100644
index 68bfb085f7..0000000000
--- a/package/libsrtp/0001-Remove-compatibility-code-for-legacy-OpenSSL-to-fix-LibreSSL-build.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 16483b18a9980575bee23898b2dbfbe2a4675d84 Mon Sep 17 00:00:00 2001
-From: Klemens Nanni <kn@openbsd.org>
-Date: Sat, 15 Jan 2022 23:19:35 +0300
-Subject: [PATCH] Remove compatibility code for legacy OpenSSL to fix LibreSSL
- build
-
-In current LibreSSL, `HMAC_CTX` aka. `struct hmac_ctx_st` is an opaque
-structure as of LibreSSL hmac.h revision 1.15 (14.01.2022) [0], thus
-`sizeof(HMAC_CTX)` fails to compile.
-
-The non-legacy code path should compile with LibreSSL versions as old
-as 2.7.0 (21.03.2018).
-
-Found while building https://github.com/desktop-app/tg_owt which bundles
-libsrtp 2.2.0 [1] on OpenBSD 7.0 -CURRENT/with latest LibreSSL.
-
-Suggestion to remove the legacy code from Theo Buehler, thanks.
-
-0: http://cvsweb.openbsd.org/cgi-bin/cvsweb/src/lib/libcrypto/hmac/hmac.h?rev=1.15&content-type=text/x-cvsweb-markup
-1: https://github.com/desktop-app/tg_owt/blob/6708e0d31a73e64fe12f54829bf4060c41b2658e/src/third_party/libsrtp/crypto/hash/hmac_ossl.c#L85
-
-[Retrieved from:
-https://github.com/cisco/libsrtp/commit/16483b18a9980575bee23898b2dbfbe2a4675d84]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- crypto/hash/hmac_ossl.c | 29 -----------------------------
- 1 file changed, 29 deletions(-)
-
-diff --git a/crypto/hash/hmac_ossl.c b/crypto/hash/hmac_ossl.c
-index ee6b0b58..c23c7f21 100644
---- a/crypto/hash/hmac_ossl.c
-+++ b/crypto/hash/hmac_ossl.c
-@@ -78,26 +78,6 @@ static srtp_err_status_t srtp_hmac_alloc(srtp_auth_t **a,
-         return srtp_err_status_bad_param;
-     }
- 
--/* OpenSSL 1.1.0 made HMAC_CTX an opaque structure, which must be allocated
--   using HMAC_CTX_new.  But this function doesn't exist in OpenSSL 1.0.x. */
--#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
--    {
--        /* allocate memory for auth and HMAC_CTX structures */
--        uint8_t *pointer;
--        HMAC_CTX *new_hmac_ctx;
--        pointer = (uint8_t *)srtp_crypto_alloc(sizeof(HMAC_CTX) +
--                                               sizeof(srtp_auth_t));
--        if (pointer == NULL) {
--            return srtp_err_status_alloc_fail;
--        }
--        *a = (srtp_auth_t *)pointer;
--        (*a)->state = pointer + sizeof(srtp_auth_t);
--        new_hmac_ctx = (HMAC_CTX *)((*a)->state);
--
--        HMAC_CTX_init(new_hmac_ctx);
--    }
--
--#else
-     *a = (srtp_auth_t *)srtp_crypto_alloc(sizeof(srtp_auth_t));
-     if (*a == NULL) {
-         return srtp_err_status_alloc_fail;
-@@ -109,7 +89,6 @@ static srtp_err_status_t srtp_hmac_alloc(srtp_auth_t **a,
-         *a = NULL;
-         return srtp_err_status_alloc_fail;
-     }
--#endif
- 
-     /* set pointers */
-     (*a)->type = &srtp_hmac;
-@@ -126,18 +105,10 @@ static srtp_err_status_t srtp_hmac_dealloc(srtp_auth_t *a)
- 
-     hmac_ctx = (HMAC_CTX *)a->state;
- 
--#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
--    HMAC_CTX_cleanup(hmac_ctx);
--
--    /* zeroize entire state*/
--    octet_string_set_to_zero(a, sizeof(HMAC_CTX) + sizeof(srtp_auth_t));
--
--#else
-     HMAC_CTX_free(hmac_ctx);
- 
-     /* zeroize entire state*/
-     octet_string_set_to_zero(a, sizeof(srtp_auth_t));
--#endif
- 
-     /* free memory */
-     srtp_crypto_free(a);
diff --git a/package/libsrtp/libsrtp.hash b/package/libsrtp/libsrtp.hash
index 8e51e68ac2..f95dc2e7b0 100644
--- a/package/libsrtp/libsrtp.hash
+++ b/package/libsrtp/libsrtp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3b1bcb14ebda572b04b9bdf07574a449c84cb924905414e4d94e62837d22b628  libsrtp-2.4.2.tar.gz
+sha256  8a43ef8e9ae2b665292591af62aa1a4ae41e468b6d98d8258f91478735da4e09  libsrtp-2.5.0.tar.gz
 sha256  8e19d42a1eec9561f3f347253ddf2e385c55f392f025bb0fd41b88dbf38db5ae  LICENSE
diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
index e7a771c6b2..0ffdd98283 100644
--- a/package/libsrtp/libsrtp.mk
+++ b/package/libsrtp/libsrtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSRTP_VERSION = 2.4.2
+LIBSRTP_VERSION = 2.5.0
 LIBSRTP_SITE = $(call github,cisco,libsrtp,v$(LIBSRTP_VERSION))
 LIBSRTP_INSTALL_STAGING = YES
 LIBSRTP_LICENSE = BSD-3-Clause
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
