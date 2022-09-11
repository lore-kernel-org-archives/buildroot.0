Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CBEECAAD3
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 23:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4589A424EB;
	Sun, 11 Sep 2022 23:02:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4589A424EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JJhINLjg0F33; Sun, 11 Sep 2022 23:02:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7B5A41E64;
	Sun, 11 Sep 2022 23:02:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7B5A41E64
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 595E81BF4E2
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 23:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 301B36104E
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 23:02:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 301B36104E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b83kN_X-1DuA for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 23:02:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F03F060B45
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F03F060B45
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 23:02:14 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id m16so3718728ilg.3
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 16:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=VIusQQqhchYY5nKj1B69ZPrttvk9leLXLoxLctNYrdE=;
 b=DbvcubzkWi088hOUik/IibRPoOr4PdE8l9pICcABorWBGfVS0RAY+AmZTX8coE9X7j
 p8K+ABp8rdk0YZAEBDKSfjZQmXVjUGXpg+joxuJx4YBedIUFOlDoIVtREGm985NNlTpQ
 DB4/XtGFxC3RU+cowtxFXt5h+U9/gv3oF9RCBdQqZ9Lj5fLDg/o9ud6T3F+n/Zg+9lZ+
 x6vjjrtoCcI1eQrP9QA9+eVU516YghF8mNB/D8aSgwZ/TKpLooEerQm4C2Xf0Lrui1Rk
 XanmHXxYMA1hs/ApxF3lVKNNQsa2eHxOe5vYfxpVsNa7ZdTf0x5jCTK9a3Y79R3qE+QR
 hTqA==
X-Gm-Message-State: ACgBeo2G5VTnvkVqH8BF5HXgepAnKo/OHKq5Sckp4TNWxyEYGtCzOTuP
 V8GSpbIdRpBP9IWySe+3e/wFb9n9yHg=
X-Google-Smtp-Source: AA6agR6da36X0KbUVo2nVmq9Yl5FTF6Rm8y/+vwhIHcP2ZKnmRO58UU5EMto9S0YqBPqlViNKRr7jQ==
X-Received: by 2002:a05:6e02:180a:b0:2ee:70e7:1918 with SMTP id
 a10-20020a056e02180a00b002ee70e71918mr9108014ilv.52.1662937333791; 
 Sun, 11 Sep 2022 16:02:13 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 p47-20020a02782f000000b00359ae384ffbsm2752667jac.19.2022.09.11.16.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:02:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Sep 2022 17:02:11 -0600
Message-Id: <20220911230211.3730844-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=VIusQQqhchYY5nKj1B69ZPrttvk9leLXLoxLctNYrdE=;
 b=X1tyOLCAUvY7bgTCkBf+socnMu/9IVjEthXY7l1UOm5GtKnYWTuEcmtxpqBoPOoBUG
 Ay7QtpruEbMcYbWaUWUinmzdcbrc9uSNSA07tzMZBc4Oqfyimk9yVN4JshnAWdRnbjzQ
 6ZpNqNKg6emb1/Q2yPreq+SsTDzxiUoO4nOukzZsoBus3rtCVeTl2KAIumkFAujNY4aU
 +qAJlEFFmDNsxeWhTMLJCpE6opB2aB6v9aM37eXPOHgRyPkoC+QKO+4IZjihRyHt63ht
 PMplLmMO7I/gAIIG5/tfonZBq9l+B2KED58qzuwnD9E2S9fqm+SM9ok9IorGrp4xg3Pk
 0KZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=X1tyOLCA
Subject: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 38.0.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...id-OPENSSL_NO_PSK-defined-guard-7146.patch | 56 -------------------
 .../python-cryptography.hash                  |  2 +-
 .../python-cryptography.mk                    |  4 +-
 3 files changed, 3 insertions(+), 59 deletions(-)
 delete mode 100644 package/python-cryptography/0001-Remove-invalid-OPENSSL_NO_PSK-defined-guard-7146.patch

diff --git a/package/python-cryptography/0001-Remove-invalid-OPENSSL_NO_PSK-defined-guard-7146.patch b/package/python-cryptography/0001-Remove-invalid-OPENSSL_NO_PSK-defined-guard-7146.patch
deleted file mode 100644
index 5d953b8931..0000000000
--- a/package/python-cryptography/0001-Remove-invalid-OPENSSL_NO_PSK-defined-guard-7146.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 891a06101d7b48c61d0d3174f79e9962b995770e Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Fri, 29 Apr 2022 16:06:10 -0600
-Subject: [PATCH] Remove invalid OPENSSL_NO_PSK defined guard (#7146)
-
-These symbols are not conditional on OPENSSL_NO_PSK in ssl.h
-
-SSL_CTX_set_psk_find_session_callback:
-https://github.com/openssl/openssl/blob/openssl-3.0.2/include/openssl/ssl.h.in#L847
-
-SSL_CTX_set_psk_use_session_callback:
-https://github.com/openssl/openssl/blob/openssl-3.0.2/include/openssl/ssl.h.in#L850-L851
-
-As such we can not guard the fallback with defined(OPENSSL_NO_PSK)
-as this will result in redeclaration errors.
-
-Fixes:
-build/temp.linux-sparc64-3.10/_openssl.c:2286:8: error: 'SSL_CTX_set_psk_find_session_callback' redeclared as different kind of symbol
- 2286 | void (*SSL_CTX_set_psk_find_session_callback)(SSL_CTX *,
-      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-In file included from build/temp.linux-sparc64-3.10/_openssl.c:832:
-/home/giuliobenetti/autobuild/run/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/openssl/ssl.h:855:6: note: previous declaration of 'SSL_CTX_set_psk_find_session_callback' was here
-  855 | void SSL_CTX_set_psk_find_session_callback(SSL_CTX *ctx,
-      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-build/temp.linux-sparc64-3.10/_openssl.c:2293:8: error: 'SSL_CTX_set_psk_use_session_callback' redeclared as different kind of symbol
- 2293 | void (*SSL_CTX_set_psk_use_session_callback)(SSL_CTX *,
-      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-In file included from build/temp.linux-sparc64-3.10/_openssl.c:832:
-/home/giuliobenetti/autobuild/run/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/openssl/ssl.h:858:6: note: previous declaration of 'SSL_CTX_set_psk_use_session_callback' was here
-  858 | void SSL_CTX_set_psk_use_session_callback(SSL_CTX *ctx,
-      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-891a06101d7b48c61d0d3174f79e9962b995770e]
----
- src/_cffi_src/openssl/ssl.py | 3 +--
- 2 files changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/src/_cffi_src/openssl/ssl.py b/src/_cffi_src/openssl/ssl.py
-index 1314b85b0..d036e4f2d 100644
---- a/src/_cffi_src/openssl/ssl.py
-+++ b/src/_cffi_src/openssl/ssl.py
-@@ -785,8 +785,7 @@ void (*SSL_CTX_set_cookie_verify_cb)(SSL_CTX *,
- static const long Cryptography_HAS_SSL_COOKIE = 1;
- #endif
- #if CRYPTOGRAPHY_OPENSSL_LESS_THAN_111 || \
--    CRYPTOGRAPHY_IS_LIBRESSL || CRYPTOGRAPHY_IS_BORINGSSL || \
--    defined(OPENSSL_NO_PSK)
-+    CRYPTOGRAPHY_IS_LIBRESSL || CRYPTOGRAPHY_IS_BORINGSSL
- static const long Cryptography_HAS_PSK_TLSv1_3 = 0;
- void (*SSL_CTX_set_psk_find_session_callback)(SSL_CTX *,
-                                            int (*)(
--- 
-2.25.1
-
diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 66ac9d094a..0f6a62164b 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  49692c2a2b7c18f854d20ac5239cd5bbccef033e3efdc7647b3e29fd5970c823  cryptography-37.0.4.tar.gz
+sha256  59f77beef181a9e6643ad2c10b8c6551fc561452287bd3552bec76c86d55b774  cryptography-38.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  43dad2cc752ab721cd9a9f36ece70fb53ab7713551f2d3d8694d8e8c5a06d6e2  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 28ccc8a65c..c0265f5bfa 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 37.0.4
+PYTHON_CRYPTOGRAPHY_VERSION = 38.0.1
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/89/d9/5fcd312d5cce0b4d7ee8b551a0ea99e4ea9db0fdbf6dd455a19042e3370b
+PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/6d/0c/5e67831007ba6cd7e52c4095f053cf45c357739b0a7c46a45ddd50049019
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
