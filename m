Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0514C43217
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 18:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD6D960B21;
	Thu, 21 Apr 2022 18:05:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0RA-9q2Z5C0X; Thu, 21 Apr 2022 18:05:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9811060EB3;
	Thu, 21 Apr 2022 18:05:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1310C1C1189
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7639360FA3
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:01:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HBtDdIK-PCTQ for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5042260EC8
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5B65F83FB8; Thu, 21 Apr 2022 17:50:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 19:31:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98c22550e208d79ae212d4481a24d355eb509d18
X-Git-Newrev: c2f829a71a728b689f8571187e1ff5b81f48a754
X-Patchwork-Hint: ignore
Message-Id: <20220421175056.5B65F83FB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/azure-iot-sdk-c: fix build with
 libressl >= 2.8.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c2f829a71a728b689f8571187e1ff5b81f48a754
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libressl >= 2.8.0 raised since
https://github.com/libressl-portable/openbsd/commit/703abab3212b397d500bd8c2f5f7ee6b03feb159:

/nvmedata/autobuild/instance-20/output-1/build/azure-iot-sdk-c-LTS_01_2022_Ref01/c-utility/adapters/tlsio_openssl.c: In function 'add_certificate_to_store':
/nvmedata/autobuild/instance-20/output-1/build/azure-iot-sdk-c-LTS_01_2022_Ref01/c-utility/adapters/tlsio_openssl.c:961:24: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
  961 |             bio_method = BIO_s_mem();
      |                        ^
cc1: all warnings being treated as errors

Fixes:
 - http://autobuild.buildroot.org/results/873f86fb2311ed29a791140f2341943475985fcc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...01-adapters-fix-build-with-libressl-2.8.0.patch | 85 ++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/package/azure-iot-sdk-c/0001-adapters-fix-build-with-libressl-2.8.0.patch b/package/azure-iot-sdk-c/0001-adapters-fix-build-with-libressl-2.8.0.patch
new file mode 100644
index 0000000000..e2a241bffe
--- /dev/null
+++ b/package/azure-iot-sdk-c/0001-adapters-fix-build-with-libressl-2.8.0.patch
@@ -0,0 +1,85 @@
+From 43b313988d66de144a528e4cf57827df1e8c692d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 12 Apr 2022 20:00:36 +0200
+Subject: [PATCH] adapters: fix build with libressl >= 2.8.0 (#589)
+
+Fix the following build failure with libressl >= 2.8.0 raised since
+https://github.com/libressl-portable/openbsd/commit/703abab3212b397d500bd8c2f5f7ee6b03feb159:
+
+/nvmedata/autobuild/instance-20/output-1/build/azure-iot-sdk-c-LTS_01_2022_Ref01/c-utility/adapters/tlsio_openssl.c: In function 'add_certificate_to_store':
+/nvmedata/autobuild/instance-20/output-1/build/azure-iot-sdk-c-LTS_01_2022_Ref01/c-utility/adapters/tlsio_openssl.c:961:24: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
+  961 |             bio_method = BIO_s_mem();
+      |                        ^
+cc1: all warnings being treated as errors
+
+Fix #585
+
+Fixes:
+ - http://autobuild.buildroot.org/results/873f86fb2311ed29a791140f2341943475985fcc
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/Azure/azure-c-shared-utility/commit/43b313988d66de144a528e4cf57827df1e8c692d]
+---
+ adapters/tlsio_openssl.c                | 2 +-
+ adapters/x509_openssl.c                 | 4 ++--
+ tests/x509_openssl_ut/x509_openssl_ut.c | 4 ++--
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/c-utility/adapters/tlsio_openssl.c b/c-utility/adapters/tlsio_openssl.c
+index 4a3df8496..aa48ce52d 100644
+--- a/c-utility/adapters/tlsio_openssl.c
++++ b/c-utility/adapters/tlsio_openssl.c
+@@ -953,7 +953,7 @@ static int add_certificate_to_store(TLS_IO_INSTANCE* tls_io_instance, const char
+         }
+         else
+         {
+-#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L)
++#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L) || defined(LIBRESSL_VERSION_NUMBER)
+             const BIO_METHOD* bio_method;
+ #else
+             BIO_METHOD* bio_method;
+diff --git a/c-utility/adapters/x509_openssl.c b/c-utility/adapters/x509_openssl.c
+index 5a9e5ac29..46195b403 100644
+--- a/c-utility/adapters/x509_openssl.c
++++ b/c-utility/adapters/x509_openssl.c
+@@ -75,7 +75,7 @@ static int load_certificate_chain(SSL_CTX* ssl_ctx, const char* certificate)
+                 // certificates.
+ 
+                 /* Codes_SRS_X509_OPENSSL_07_006: [ If successful x509_openssl_add_ecc_credentials shall to import each certificate in the cert chain. ] */
+-#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L)
++#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L) || defined(LIBRESSL_VERSION_NUMBER)
+                 SSL_CTX_clear_extra_chain_certs(ssl_ctx);
+ #else
+                 if (ssl_ctx->extra_certs != NULL)
+@@ -345,7 +345,7 @@ int x509_openssl_add_certificates(SSL_CTX* ssl_ctx, const char* certificates)
+         else
+         {
+             /*Codes_SRS_X509_OPENSSL_02_012: [ x509_openssl_add_certificates shall get the memory BIO method function by calling BIO_s_mem. ]*/
+-#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L)
++#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L) || defined(LIBRESSL_VERSION_NUMBER)
+             const BIO_METHOD* bio_method;
+ #else
+             BIO_METHOD* bio_method;
+diff --git a/c-utility/tests/x509_openssl_ut/x509_openssl_ut.c b/c-utility/tests/x509_openssl_ut/x509_openssl_ut.c
+index b3349f6b0..f73191e3f 100644
+--- a/c-utility/tests/x509_openssl_ut/x509_openssl_ut.c
++++ b/c-utility/tests/x509_openssl_ut/x509_openssl_ut.c
+@@ -348,7 +348,7 @@ BEGIN_TEST_SUITE(x509_openssl_unittests)
+         STRICT_EXPECTED_CALL(BIO_new_mem_buf((void*)TEST_PUBLIC_CERTIFICATE, -1));
+         STRICT_EXPECTED_CALL(PEM_read_bio_X509_AUX(IGNORED_PTR_ARG, NULL, NULL, NULL));
+         STRICT_EXPECTED_CALL(SSL_CTX_use_certificate(IGNORED_PTR_ARG, IGNORED_PTR_ARG));
+-#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L)
++#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L) || defined(LIBRESSL_VERSION_NUMBER)
+         // Actual macro name: SSL_CTX_clear_extra_chain_certs:
+         STRICT_EXPECTED_CALL(SSL_CTX_ctrl(TEST_SSL_CTX_STRUCTURE, SSL_CTRL_CLEAR_EXTRA_CHAIN_CERTS, 0, NULL));
+ #endif
+@@ -537,7 +537,7 @@ BEGIN_TEST_SUITE(x509_openssl_unittests)
+ 
+         umock_c_negative_tests_snapshot();
+ 
+-#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L)
++#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L) || defined(LIBRESSL_VERSION_NUMBER)
+     #ifdef __APPLE__
+         size_t calls_cannot_fail_rsa[] = { 4, 5, 6, 10, 12, 13, 14 };
+         size_t calls_cannot_fail_ecc[] = { 3, 4, 8, 10, 11, 12} ;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
