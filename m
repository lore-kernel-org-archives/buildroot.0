Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3716C38145
	for <buildroot@archiver.kernel.org>; Thu,  8 Sep 2022 17:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1947E4160C;
	Thu,  8 Sep 2022 17:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1947E4160C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1vVPogPya7Br; Thu,  8 Sep 2022 17:56:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00DEE409F3;
	Thu,  8 Sep 2022 17:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00DEE409F3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A01801BF418
 for <buildroot@lists.busybox.net>; Thu,  8 Sep 2022 17:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B72660BFF
 for <buildroot@lists.busybox.net>; Thu,  8 Sep 2022 17:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B72660BFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id upERLsFipRWt for <buildroot@lists.busybox.net>;
 Thu,  8 Sep 2022 17:56:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CE1D6F71E
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2CE1D6F71E
 for <buildroot@buildroot.org>; Thu,  8 Sep 2022 17:56:26 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id e16so8181380wrx.7
 for <buildroot@buildroot.org>; Thu, 08 Sep 2022 10:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=/BcEEGf8YZRWjg0THaw3YeRkVFXg9Q60wO6MdiGHbtk=;
 b=vIc/Sy/wm+dVWlc/pFvXWRpuWujEsgTC2sMFgdgZ52/C8CCsldzihhfK2GcOry/k5c
 +BkCcDxWfA9lA5siS76Nld+ovZiQ7HgToTJrRp/nAqWdf48etsH7XnMrbMJrf3VKouYk
 nPQxZpXI6zlBHVtcMwhGerTTp+rw5/vdoPE4/QgvLuo0zziuKuUStdjPWzGeF5VMzNxr
 GzAVBGKDIELrlRqtahQtJCvDM20QlNU5QPeGs8PJPTI79hNBLGehZ+2VodJI2bzRSlGZ
 ngv+yi9NsNVO8jFGQXZw3OlVwnISHaqA8V1G0tOgui1Vr7PBgdnYdjsuZ2Qy93rG/Fe5
 7Ocw==
X-Gm-Message-State: ACgBeo0wFjEGFug4v4cpuLOqK/WR9GSUaXv2Jzlyza09lWIh/jRMSga0
 C8MhRoSaxRHAnXNWIXesMuoIrCfbFtjPgw==
X-Google-Smtp-Source: AA6agR7Tas5ipuLLOtPT2wTZ7+wsZ++SQYwMCTlqhbh8vzqxel4o1719RUR65KFklfBpwg8W4iRdQQ==
X-Received: by 2002:adf:ee89:0:b0:228:7bdf:47d with SMTP id
 b9-20020adfee89000000b002287bdf047dmr5701045wro.641.1662659781109; 
 Thu, 08 Sep 2022 10:56:21 -0700 (PDT)
Received: from sprado-office.spo.virtua.com.br ([2804:14c:46:297c::866f])
 by smtp.gmail.com with ESMTPSA id
 q63-20020a1c4342000000b003a5dde32e4bsm494045wma.37.2022.09.08.10.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 10:56:20 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu,  8 Sep 2022 14:56:15 -0300
Message-Id: <20220908175615.2688629-1-sergio.prado@e-labworks.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=e-labworks-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=/BcEEGf8YZRWjg0THaw3YeRkVFXg9Q60wO6MdiGHbtk=;
 b=GbyRH7r0fNDiXXclgc++lGtojRcBGPS8Rv2ZBvrZWyRE+iQB61/mwETtwDc5wl3HqI
 VVU76git6ZOlk9j1hMz39mYK9YG9bvu58qz5S2I+7FEQWoqMawAg67BFis5k4g5zqrhL
 pNWh+3lBEYejhfz4CrEC7jXV+OUqJjKF37kxfThhnqXKG+JQnCYqTbFbZbRsTe24RZzw
 E7WE7xh7yZ5MtbnH1MPwsSMmPGE2sm10ZEGLdHPTsYSsmLOJ/OlK0/zTb0C2VoNpysBs
 F8Q8ZNKin7Ov3QGFMOJPCL6NO4xFfklo2Dp/cIfGoSqQKcTUO8o/O3NDab2F6hxUIyk9
 ltPg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=e-labworks-com.20210112.gappssmtp.com
 header.i=@e-labworks-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=GbyRH7r0
Subject: [Buildroot] [PATCH] package/azure-iot-sdk-c: bump to version
 LTS_07_2022_Ref01
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
From: Sergio Prado via buildroot <buildroot@buildroot.org>
Reply-To: Sergio Prado <sergio.prado@e-labworks.com>
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Also drop patch (already in version).

See https://github.com/Azure/azure-iot-sdk-c/releases/tag/LTS_07_2022_Ref01

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 ...apters-fix-build-with-libressl-2.8.0.patch | 85 -------------------
 package/azure-iot-sdk-c/azure-iot-sdk-c.hash  |  2 +-
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk    |  2 +-
 3 files changed, 2 insertions(+), 87 deletions(-)
 delete mode 100644 package/azure-iot-sdk-c/0001-adapters-fix-build-with-libressl-2.8.0.patch

diff --git a/package/azure-iot-sdk-c/0001-adapters-fix-build-with-libressl-2.8.0.patch b/package/azure-iot-sdk-c/0001-adapters-fix-build-with-libressl-2.8.0.patch
deleted file mode 100644
index e2a241bffe84..000000000000
--- a/package/azure-iot-sdk-c/0001-adapters-fix-build-with-libressl-2.8.0.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 43b313988d66de144a528e4cf57827df1e8c692d Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 12 Apr 2022 20:00:36 +0200
-Subject: [PATCH] adapters: fix build with libressl >= 2.8.0 (#589)
-
-Fix the following build failure with libressl >= 2.8.0 raised since
-https://github.com/libressl-portable/openbsd/commit/703abab3212b397d500bd8c2f5f7ee6b03feb159:
-
-/nvmedata/autobuild/instance-20/output-1/build/azure-iot-sdk-c-LTS_01_2022_Ref01/c-utility/adapters/tlsio_openssl.c: In function 'add_certificate_to_store':
-/nvmedata/autobuild/instance-20/output-1/build/azure-iot-sdk-c-LTS_01_2022_Ref01/c-utility/adapters/tlsio_openssl.c:961:24: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
-  961 |             bio_method = BIO_s_mem();
-      |                        ^
-cc1: all warnings being treated as errors
-
-Fix #585
-
-Fixes:
- - http://autobuild.buildroot.org/results/873f86fb2311ed29a791140f2341943475985fcc
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/Azure/azure-c-shared-utility/commit/43b313988d66de144a528e4cf57827df1e8c692d]
----
- adapters/tlsio_openssl.c                | 2 +-
- adapters/x509_openssl.c                 | 4 ++--
- tests/x509_openssl_ut/x509_openssl_ut.c | 4 ++--
- 3 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/c-utility/adapters/tlsio_openssl.c b/c-utility/adapters/tlsio_openssl.c
-index 4a3df8496..aa48ce52d 100644
---- a/c-utility/adapters/tlsio_openssl.c
-+++ b/c-utility/adapters/tlsio_openssl.c
-@@ -953,7 +953,7 @@ static int add_certificate_to_store(TLS_IO_INSTANCE* tls_io_instance, const char
-         }
-         else
-         {
--#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L)
-+#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L) || defined(LIBRESSL_VERSION_NUMBER)
-             const BIO_METHOD* bio_method;
- #else
-             BIO_METHOD* bio_method;
-diff --git a/c-utility/adapters/x509_openssl.c b/c-utility/adapters/x509_openssl.c
-index 5a9e5ac29..46195b403 100644
---- a/c-utility/adapters/x509_openssl.c
-+++ b/c-utility/adapters/x509_openssl.c
-@@ -75,7 +75,7 @@ static int load_certificate_chain(SSL_CTX* ssl_ctx, const char* certificate)
-                 // certificates.
- 
-                 /* Codes_SRS_X509_OPENSSL_07_006: [ If successful x509_openssl_add_ecc_credentials shall to import each certificate in the cert chain. ] */
--#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L)
-+#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L) || defined(LIBRESSL_VERSION_NUMBER)
-                 SSL_CTX_clear_extra_chain_certs(ssl_ctx);
- #else
-                 if (ssl_ctx->extra_certs != NULL)
-@@ -345,7 +345,7 @@ int x509_openssl_add_certificates(SSL_CTX* ssl_ctx, const char* certificates)
-         else
-         {
-             /*Codes_SRS_X509_OPENSSL_02_012: [ x509_openssl_add_certificates shall get the memory BIO method function by calling BIO_s_mem. ]*/
--#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L)
-+#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L) || defined(LIBRESSL_VERSION_NUMBER)
-             const BIO_METHOD* bio_method;
- #else
-             BIO_METHOD* bio_method;
-diff --git a/c-utility/tests/x509_openssl_ut/x509_openssl_ut.c b/c-utility/tests/x509_openssl_ut/x509_openssl_ut.c
-index b3349f6b0..f73191e3f 100644
---- a/c-utility/tests/x509_openssl_ut/x509_openssl_ut.c
-+++ b/c-utility/tests/x509_openssl_ut/x509_openssl_ut.c
-@@ -348,7 +348,7 @@ BEGIN_TEST_SUITE(x509_openssl_unittests)
-         STRICT_EXPECTED_CALL(BIO_new_mem_buf((void*)TEST_PUBLIC_CERTIFICATE, -1));
-         STRICT_EXPECTED_CALL(PEM_read_bio_X509_AUX(IGNORED_PTR_ARG, NULL, NULL, NULL));
-         STRICT_EXPECTED_CALL(SSL_CTX_use_certificate(IGNORED_PTR_ARG, IGNORED_PTR_ARG));
--#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L)
-+#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L) || defined(LIBRESSL_VERSION_NUMBER)
-         // Actual macro name: SSL_CTX_clear_extra_chain_certs:
-         STRICT_EXPECTED_CALL(SSL_CTX_ctrl(TEST_SSL_CTX_STRUCTURE, SSL_CTRL_CLEAR_EXTRA_CHAIN_CERTS, 0, NULL));
- #endif
-@@ -537,7 +537,7 @@ BEGIN_TEST_SUITE(x509_openssl_unittests)
- 
-         umock_c_negative_tests_snapshot();
- 
--#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L)
-+#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L) || defined(LIBRESSL_VERSION_NUMBER)
-     #ifdef __APPLE__
-         size_t calls_cannot_fail_rsa[] = { 4, 5, 6, 10, 12, 13, 14 };
-         size_t calls_cannot_fail_ecc[] = { 3, 4, 8, 10, 11, 12} ;
diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
index 5dbb530954cd..187b90a35ac7 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  082e41f7cdf06fec036b8cfa1793f03e81ba527b55ea13c66be0e4cf9f20ff7b  azure-iot-sdk-c-LTS_01_2022_Ref01-br1.tar.gz
+sha256  7c23506e5acd6f400982f6f7a053d494c83b8a709c449bb9ded07aff9cfada78  azure-iot-sdk-c-LTS_07_2022_Ref01-br1.tar.gz
 
 # Hash for license files:
 sha256  be2e9913fad9ff33607287c728f392579e2a6cc83e51b203ef6274c41db02ee7  LICENSE
diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
index 874646c4457f..42fdd56b4887 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AZURE_IOT_SDK_C_VERSION = LTS_01_2022_Ref01
+AZURE_IOT_SDK_C_VERSION = LTS_07_2022_Ref01
 AZURE_IOT_SDK_C_SITE = https://github.com/Azure/azure-iot-sdk-c
 AZURE_IOT_SDK_C_SITE_METHOD = git
 AZURE_IOT_SDK_C_GIT_SUBMODULES = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
