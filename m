Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEB6C83F05
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 18:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7753B412BF;
	Sun,  6 Jul 2025 18:09:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id psCHR46dYE5k; Sun,  6 Jul 2025 18:09:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52710412C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52710412C6;
	Sun,  6 Jul 2025 18:09:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 64B0B15F
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 18:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56676815AB
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 18:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eq14vuT29ho7 for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 18:09:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BC79781443
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC79781443
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC79781443
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 18:09:13 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a510432236so1648091f8f.0
 for <buildroot@buildroot.org>; Sun, 06 Jul 2025 11:09:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751825351; x=1752430151;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kNf/VTTUdxerIWZsW+JIEHHByN/fR5XEmNb2BZ+5+9g=;
 b=kzjv0sfOgUeBdz1Dgp1SIlbt87r4caoEWfRkY4beLO6xBGSPHdkdS2l2FMvIqpNch/
 B2Czc0HWtqaLiuoP5Dpw2jttGUaIcggbNVdzA0K1SRTkM5KspUBCuKwSzYnw3dQ0pu0l
 0zcnJy7jjKIAKV9FnwPh9Xl3CbbW7gCE5JsFrftY0/kRshXquHX1AgyDhii9Fqh1sQes
 9f6OdasCUSt/QPkoXBqSe4F/oCJZTFBhd9sKMYoZo0POyCEv87UcCqPwuEIKwusTaESa
 DkuevGUYs/aPbbjIs8ViHUwJ6qQrPq4ujL5h1BKqTH1mqs7PvbMzstbDCtn8PILWI3LD
 dxqw==
X-Gm-Message-State: AOJu0YxJ9/nzFbknaT+C/u6ZIWUzVYk5roJV0OCpe5DMkmL5D0MBijAx
 0CAB2xT3RojJ7V0TRwAhysUJn1Vi51JvvCeimCT+HZUJJxMhKzHDIgFaifQucMDLXXlJ9iRgsEe
 A4JPt1Uk=
X-Gm-Gg: ASbGncvIVgE5AWWALpVoaq3M475g6BI08op5pctjN+iezxzayE3fKOKY4bneJsoRQun
 3+NigUkaZzk4/PophKL2osgtCbVmt8oNgP3W0wDtJgsGHhZ3+uFwT/Kc3JrmvPi7GBnx2rtgCXo
 BsrUfpEVn5qO/TLLbrAHSM4uWq0oH05N4xEzAxDvBNJ9LsT0PDOpbfYsHEQ0XCf6Pvu2zp6RYrO
 SU8lBvprEV34hgpk4DZwELE1GrwYmmuVkGg/k323mA7czcN2NIxEhLKF8bVKlyvqeE3BW8gCepf
 vv/CBKrNyJvf9j6hrgwuuB4tqvhbN+gL1QRyh+d170jzMj3B+U7h0wQkdOu1FYUilP1xXSixbqV
 KD8EN4J3pvzyXaX3y9LxH
X-Google-Smtp-Source: AGHT+IHlndVmlf5J3MUYJEfZm4tipysLakPtxqEdYFoQbOZXRi3FbHH25/mxtMiF2hqG3UcJp1SsLw==
X-Received: by 2002:a05:6000:18ab:b0:3a4:efc0:c90b with SMTP id
 ffacd0b85a97d-3b497013067mr7704682f8f.15.1751825351344; 
 Sun, 06 Jul 2025 11:09:11 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47285dda7sm8223918f8f.99.2025.07.06.11.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 11:09:11 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Jianhui Zhao <zhaojh329@gmail.com>
Date: Sun,  6 Jul 2025 20:09:09 +0200
Message-ID: <20250706180909.1114945-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250706180909.1114945-1-thomas.perale@mind.be>
References: <20250706180909.1114945-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751825351; x=1752430151; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kNf/VTTUdxerIWZsW+JIEHHByN/fR5XEmNb2BZ+5+9g=;
 b=FWLPB1d9kGAOKRaexlpjfqLeYMJSYoXSSw84oKkoW8mUZrH+R+xIqzIi527qM/RkFh
 FadmCMufWbBnchUC5F6v5Tey+a38SltVBTGvjO50wmx9g6kxTgdQxKRX/xWs+PC/KXo8
 QXIJyw7ZPNVEQAJj8he+JOYhG+B6AoXCk1V+0YD6Rooo995nK/L5FF9RyP92MqWm8V8y
 n6xfmqvycYNd+CAqlMSon7zs602icl5XY8nhMZDGhBS13F39Z6S3mqi1ZOebNN1pjAqo
 yXVGtAsSiB7mpQ8ONgzub55YA/jKb1w+HldPqJTr6Qz+EB/V3lajwWmYbh8R3jOC+Gzc
 Xr1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=FWLPB1d9
Subject: [Buildroot] [PATCH 2/2] package/libuhttpd: bump to v3.14.2
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

For more information see the release note:
  - https://github.com/zhaojh329/libuhttpd/releases/tag/v3.14.2

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                           |  1 -
 ...01-add-compatibility-for-wolfssl-5-0.patch | 30 ---------
 .../0002-compatibility-for-openssl-3.0.patch  | 31 ---------
 ...akeLists.txt-add-BUILD_WERROR-option.patch | 30 ---------
 ...dd-compatibility-with-mbed-tls-3-0-0.patch | 64 -------------------
 package/libuhttpd/libuhttpd.hash              |  2 +-
 package/libuhttpd/libuhttpd.mk                |  2 +-
 7 files changed, 2 insertions(+), 158 deletions(-)
 delete mode 100644 package/libuhttpd/0001-add-compatibility-for-wolfssl-5-0.patch
 delete mode 100644 package/libuhttpd/0002-compatibility-for-openssl-3.0.patch
 delete mode 100644 package/libuhttpd/0003-CMakeLists.txt-add-BUILD_WERROR-option.patch
 delete mode 100644 package/libuhttpd/0004-add-compatibility-with-mbed-tls-3-0-0.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index dbe0963ca2..9abfd531f4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -712,7 +712,6 @@ package/libtomcrypt/0001-fix-CVE-2019-17362.patch lib_patch.Upstream
 package/libtommath/0001-Build-test-bn_mp_set_double-c-on-more-platforms.patch lib_patch.Upstream
 package/libtorrent/0001-libtorrent.pc.in-add-Libs.Private.patch lib_patch.Upstream
 package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch lib_patch.Upstream
-package/libuhttpd/0001-add-compatibility-for-wolfssl-5-0.patch lib_patch.Upstream
 package/libuio/0001-configure.ac-set-automake-strictness-to-foreign.patch lib_patch.Upstream
 package/liburcu/0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch lib_patch.Upstream
 package/libvpx/0001-vpx_mem-vpx_mem.h-Fix-compilation-with-uClibc.patch lib_patch.Upstream
diff --git a/package/libuhttpd/0001-add-compatibility-for-wolfssl-5-0.patch b/package/libuhttpd/0001-add-compatibility-for-wolfssl-5-0.patch
deleted file mode 100644
index 7da7199e7e..0000000000
--- a/package/libuhttpd/0001-add-compatibility-for-wolfssl-5-0.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 73aa4ef762b2de67bc8c7c260bd36b34fdb91e63 Mon Sep 17 00:00:00 2001
-From: "Sergey V. Lobanov" <sergey@lobanov.in>
-Date: Mon, 3 Jan 2022 19:36:52 +0300
-Subject: [PATCH] add compatibility for wolfssl >= 5.0
-
-NTRU support has been removed in wolfssl 5.0 so it is required to
-mask NTRU specific code if wolfssl >= 5.0
-
-Signed-off-by: Sergey V. Lobanov <sergey at lobanov.in>
-[Retrieved from:
-https://github.com/zhaojh329/ssl/commit/73aa4ef762b2de67bc8c7c260bd36b34fdb91e63]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- openssl.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/ssl/openssl.c b/src/ssl/openssl.c
-index 5a49267..278bab5 100644
---- a/src/ssl/openssl.c
-+++ b/src/ssl/openssl.c
-@@ -336,7 +336,9 @@ static bool handle_wolfssl_asn_error(void *ssl, int r,
-     case ASN_SIG_HASH_E:
-     case ASN_SIG_KEY_E:
-     case ASN_DH_KEY_E:
-+#if LIBWOLFSSL_VERSION_HEX < 0x05000000
-     case ASN_NTRU_KEY_E:
-+#endif
-     case ASN_CRIT_EXT_E:
-     case ASN_ALT_NAME_E:
-     case ASN_NO_PEM_HEADER:
diff --git a/package/libuhttpd/0002-compatibility-for-openssl-3.0.patch b/package/libuhttpd/0002-compatibility-for-openssl-3.0.patch
deleted file mode 100644
index 484d472bad..0000000000
--- a/package/libuhttpd/0002-compatibility-for-openssl-3.0.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From d93e6426ec1d8c019bd302e4599f3b91ba95fb3b Mon Sep 17 00:00:00 2001
-From: Jianhui Zhao <zhaojh329@gmail.com>
-Date: Fri, 29 Apr 2022 23:47:31 +0800
-Subject: [PATCH] compatibility for openssl >= 3.0
-
-Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
-
-Upstream: https://github.com/zhaojh329/ssl/commit/d93e6426ec1d8c019bd302e4599f3b91ba95fb3b
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- openssl.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/openssl.c b/openssl.c
-index 278bab5..2169db1 100644
---- a/src/ssl/openssl.c
-+++ b/src/ssl/openssl.c
-@@ -139,8 +139,11 @@ const char *ssl_last_error_string(char *buf, int len)
- 
-     if (ssl_err_code == SSL_ERROR_SSL) {
-         int used;
--
-+#if OPENSSL_VERSION_MAJOR < 3
-         ssl_err_code = ERR_peek_error_line_data(&file, &line, &data, &flags);
-+#else
-+        ssl_err_code = ERR_peek_error_all(&file, &line, NULL, &data, &flags);
-+#endif
-         ERR_error_string_n(ssl_err_code, buf, len);
- 
-         used = strlen(buf);
diff --git a/package/libuhttpd/0003-CMakeLists.txt-add-BUILD_WERROR-option.patch b/package/libuhttpd/0003-CMakeLists.txt-add-BUILD_WERROR-option.patch
deleted file mode 100644
index 2e87014e87..0000000000
--- a/package/libuhttpd/0003-CMakeLists.txt-add-BUILD_WERROR-option.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From c0f2260d8b7e435bce765e7ac91d51f1b349b87b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 10 Mar 2024 13:43:12 +0100
-Subject: [PATCH] CMakeLists.txt: add BUILD_WERROR option
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/zhaojh329/libuhttpd/commit/c0f2260d8b7e435bce765e7ac91d51f1b349b87b
----
- CMakeLists.txt | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 6fb9651..6719e5f 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -7,7 +7,13 @@ include(CheckLibraryExists)
- list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/Modules/")
- 
- add_definitions(-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64)
--add_compile_options(-O -Wall -Werror --std=gnu99)
-+add_compile_options(-O -Wall --std=gnu99)
-+
-+option(BUILD_WERROR "Build with -Werror" ON)
-+
-+if(BUILD_WERROR)
-+    add_compile_options(-Werror)
-+endif()
- 
- option(BUILD_STATIC "Build static library" OFF)
- 
diff --git a/package/libuhttpd/0004-add-compatibility-with-mbed-tls-3-0-0.patch b/package/libuhttpd/0004-add-compatibility-with-mbed-tls-3-0-0.patch
deleted file mode 100644
index 1f45d4634c..0000000000
--- a/package/libuhttpd/0004-add-compatibility-with-mbed-tls-3-0-0.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 28cc9b5d98179d161673d20e79333ae5a4864228 Mon Sep 17 00:00:00 2001
-From: Jianhui Zhao <zhaojh329@gmail.com>
-Date: Sat, 4 May 2024 19:40:07 +0800
-Subject: [PATCH] Add compatibility with Mbed TLS 3.0.0
-
-Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
-Upstream: https://github.com/zhaojh329/ssl/commit/28cc9b5d98179d161673d20e79333ae5a4864228
-[thomas: 
-  - Apply to submodule directory
-  - Rename 'urandom' to '_urandom'
-  - Adapt line numbers
-]
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- src/ssl/mbedtls.c | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/src/ssl/mbedtls.c b/src/ssl/mbedtls.c
-index 2e02e1c..cad7e00 100644
---- a/src/ssl/mbedtls.c
-+++ b/src/ssl/mbedtls.c
-@@ -49,7 +49,6 @@
- #include "ssl.h"
- 
- #include <mbedtls/ssl.h>
--#include <mbedtls/certs.h>
- #include <mbedtls/x509.h>
- #include <mbedtls/rsa.h>
- #include <mbedtls/error.h>
-@@ -136,9 +135,13 @@ static const int default_ciphersuites_client[] =
-     AES_CBC_CIPHERS(ECDHE_ECDSA),
-     AES_CBC_CIPHERS(ECDHE_RSA),
-     AES_CBC_CIPHERS(DHE_RSA),
-+#ifdef MBEDTLS_TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA
-     MBEDTLS_TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA,
-+#endif
-     AES_CIPHERS(RSA),
-+#ifdef MBEDTLS_TLS_RSA_WITH_3DES_EDE_CBC_SHA
-     MBEDTLS_TLS_RSA_WITH_3DES_EDE_CBC_SHA,
-+#endif
-     0
- };
- 
-@@ -221,7 +224,7 @@ static void ssl_update_own_cert(struct ssl_context *ctx)
-     if (!ctx->cert.version)
-         return;
- 
--    if (!ctx->key.pk_info)
-+    if (mbedtls_pk_get_type(&ctx->key) == MBEDTLS_PK_NONE)
-         return;
- 
-     mbedtls_ssl_conf_own_cert(&ctx->conf, &ctx->cert, &ctx->key);
-@@ -258,7 +261,11 @@ int ssl_load_key_file(struct ssl_context *ctx, const char *file)
- {
-     int ret;
- 
-+#if (MBEDTLS_VERSION_NUMBER >= 0x03000000)
-+    ret = mbedtls_pk_parse_keyfile(&ctx->key, file, NULL, _urandom, NULL);
-+#else
-     ret = mbedtls_pk_parse_keyfile(&ctx->key, file, NULL);
-+#endif
-     if (ret)
-         return -1;
- 
diff --git a/package/libuhttpd/libuhttpd.hash b/package/libuhttpd/libuhttpd.hash
index e4fde4eb64..7f0ecc0030 100644
--- a/package/libuhttpd/libuhttpd.hash
+++ b/package/libuhttpd/libuhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  512d4abfced0ec916d985d3d1eac7528e6676eecae6aca27fdaf313374e29f16  libuhttpd-3.14.1.tar.gz
+sha256  ce2abbc599a922c4bac12f1cdf3e9c9740f387f819a54ca01e9fed60905baa40  libuhttpd-3.14.2.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
index 78e0f42b22..dca26fc3c0 100644
--- a/package/libuhttpd/libuhttpd.mk
+++ b/package/libuhttpd/libuhttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUHTTPD_VERSION = 3.14.1
+LIBUHTTPD_VERSION = 3.14.2
 LIBUHTTPD_SITE = https://github.com/zhaojh329/libuhttpd/releases/download/v$(LIBUHTTPD_VERSION)
 LIBUHTTPD_LICENSE = MIT
 LIBUHTTPD_LICENSE_FILES = LICENSE
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
