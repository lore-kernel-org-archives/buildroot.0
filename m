Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E82C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 11:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1386A4071F;
	Sun, 20 Sep 2026 11:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wwUbjnSlErze; Sun, 20 Sep 2026 11:38:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 60DD54075D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789904332;
	b=bpNNassdn4YfGC8hUQoeDVl172F2wOQM4RJJss86N6VTxI0/Or5rtxlb8lCIJ1+6bf/n
	 3kTwXOlsFzj/HcGWAm69x4U5S0jXKE3JJab5SUXCi/EUunphq0OIhEJudKI4Pki3axV1a
	 2WVe67rGdf8My9IV9ulfv+DVaBGbJpQUKfQwTI7+G7WXEjnfMMAqd+5ZuRzKUpDUErHJC
	 jkQ4ptDNhFLbS7yKJ4VU/zQIFIEZgffwbnyWFtCLvXXvJYuDfCXgU+SFPC982iLmDqHyO
	 eKYI1wCSWlZhHMR/txGC/p66dIsHjdSdz2vvcyyqIsDIvvohrOCwpM0bVmWfkCRwY+Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789904332;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9uEYkVIXyxigHkfUksfzAo73ICkWLxXtMiWb876HrQE=;
	b=hNVAjB9eL5mz++gH+NyaoPkeeKA38VDuyLup4i/qWmyjOjYqNiseOxBPJ1U3CxCOLJP4
	 WFkUIM4MHEiY2bqwHEkkyM65qUWLm28/E6sRvV+cb9u9frVzLfKyVbgy8pivPhvQ6U6iW
	 729KwrIxJ4h3SX1dSsHYSMkxr1l7ww1sOxzFkKTKW8TTgHQIGb0Z3KFlOBhg8DApsm/ak
	 jZ/h8P8WSfBRjx2qAQ+rUwo65k74SZ5mRfkUaCDzbwuuZPY0mi2QbrVZXGhIhmStUhoNZ
	 zHtHfiUdtK8bkVKXWEcu1RmvPRFR3jdMT1LZW2KNQU3149nzPtzqH1tTs1VlsszeQaw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789904332;
	bh=9uEYkVIXyxigHkfUksfzAo73ICkWLxXtMiWb876HrQE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hG1wT089XwOhtUbh2cQwWcZGokYEpFUil3L7Sn49r2zbDRGAb8u61Esg/UTJKVtLF
	 8falN8oM0MNgjhoqJViG0nRx7F18x5Xk4mok7MXZ4OFxVaPpUtNise2zcK/plS2cgl
	 ZB7ohtwX0b2XjKCxyOtLugS81rq7FzkGw46EJUESw7cIYh7MqGWiSHMy2mR837fsUz
	 htZzRkkvRIdCXq6hBzANSV7TsexiekAhOLehCKG7XdiaB/vAQri9jCoJd0YMjmfuSq
	 Us5BxYi8J1/hwcAN2VBni/BimHLuFF58wDX09UJmu06pNq+TZCSu9Vd5MirMaToYdz
	 MnNRTZZjr+LXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60DD54075D;
	Sun, 20 Sep 2026 11:38:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A5E1013D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C17B40098
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:38:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8V_WZxK4dMQA for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 11:38:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 194324005A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789904329;
 b=tgDUskXZX/37lO2qgfiA+sBxeT/cF8j70mnH5AI8mbGr7NPQPHCXKr08rbEqjTVr0w0v
 M6Bpmy6tPf9hSvO2R8r8YFBy0Wfwi1hOvCNIiD2PIhOaM9d3o1tHoz7NTq66w1wUeanSE
 OIAFMIlaBjaJ6IF1WPtgpJulTQb4S3pbDhVjnLcLuzL7uol9RnbPBUsVRejGOyr4kB8hk
 4tHhW1cw5AfsPABAH5/WCh40pjOPyY44y+ZOvq1p2LNqxPG3kUf0BUoFt/fLJinaqnPDm
 omtL+sCS6icQOAhuhFR+mBF8fcqLy9ZPU+wF9Hu5YLTZ0vp2HnpEZsnlKCRD+iRtgjg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789904329;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=gp/eAjcxrd/ELvfs0vxdJMsN0ErPFA6avtIYgFPk4eE=;
 b=SKst5YoK9Q3acaERduXiVL6K1RpKtrFOrWvMcXYQ2Xzp+6gRlDXI5leCbXn01EHIbUZ5
 PQpbJCy8k/6LkcROHltit6eVfJUTHxnub37lkNdXT3lQEWW/5n887l0Unh4kaGj5mTWFl
 Vvb97aUZU0Bz3GbifpaSlSOjhY0B29iznp/t6PsPPPwYum7WDRWhZS1yCpUk3Y4MBgrE2
 8G4aSoY8jBE6bGNIvd/ksGf2RQx1tvRCxYpTxZRGrwufTennAWcAisjQlPEvvzhAUyFDS
 Z5MkNhMeC5adGG0OJmGnHROHC4xrjzHkqHFDv0+DPX5n3b78ykD1VYxytUJOKJo/7OA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 194324005A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:38:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CDEFE8D764; Sun, 20 Sep 2026 11:37:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 13:35:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f79161e4a8756acdb25c8500de9b2dee663f2ac
X-Git-Newrev: 92e08f89a87d1ae111576c8e76fe4803e4501192
X-Patchwork-Hint: ignore
Message-Id: <20260920113740.CDEFE8D764@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libest: fix build with OpenSSL
 4.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/92e08f89a87d1ae111576c8e76fe4803e4501192
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...rs-for-opaque-ASN1_STRING-OpenSSL-4-compa.patch |  60 ++++
 ...rs-instead-of-the-ENGINE-API-on-OpenSSL-4.patch |  64 ++++
 .../0007-Port-ossl_srv.c-copies-to-OpenSSL-4.patch | 358 +++++++++++++++++++++
 package/libest/Config.in                           |   1 -
 4 files changed, 482 insertions(+), 1 deletion(-)

diff --git a/package/libest/0005-Use-accessors-for-opaque-ASN1_STRING-OpenSSL-4-compa.patch b/package/libest/0005-Use-accessors-for-opaque-ASN1_STRING-OpenSSL-4-compa.patch
new file mode 100644
index 0000000000..13511f0d27
--- /dev/null
+++ b/package/libest/0005-Use-accessors-for-opaque-ASN1_STRING-OpenSSL-4-compa.patch
@@ -0,0 +1,60 @@
+From 59695d938e0d23dda2eda124164bc8909ab2ddf5 Mon Sep 17 00:00:00 2001
+From: Karl Smeltzer <karl.smeltzer@canonical.com>
+Date: Fri, 24 Jul 2026 12:54:56 -0700
+Subject: [PATCH] Use accessors for opaque ASN1_STRING (OpenSSL 4
+ compatibility)
+
+OpenSSL 4.0 makes ASN1_STRING (and its typedefs ASN1_OCTET_STRING /
+ASN1_BIT_STRING) opaque. This uses the ASN1_STRING_get0_data() and
+ASN1_STRING_length() accessors instead, while keeping the direct access
+under HAVE_OLD_OPENSSL.
+
+Upstream: https://github.com/cisco/libest/pull/136
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/est/est_client.c | 8 ++++++--
+ src/est/est_server.c | 4 ++++
+ 2 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/src/est/est_client.c b/src/est/est_client.c
+index 8dff9d9..06ca510 100644
+--- a/src/est/est_client.c
++++ b/src/est/est_client.c
+@@ -5313,11 +5313,15 @@ EST_ERROR verify_voucher (EST_CTX *ctx)
+         return (EST_ERR_CLIENT_BRSKI_VOUCHER_VERIFY_FAILED);
+     }
+ 
++#ifdef HAVE_OLD_OPENSSL
+     ctx->brski_retrieved_voucher = pkcs7->d.sign->contents->d.data->data;
+-    ctx->brski_retrieved_voucher_len = pkcs7->d.sign->contents->d.data->length;
++#else
++    ctx->brski_retrieved_voucher = (unsigned char *)ASN1_STRING_get0_data(pkcs7->d.sign->contents->d.data);
++#endif
++    ctx->brski_retrieved_voucher_len = ASN1_STRING_length(pkcs7->d.sign->contents->d.data);
+ 
+     EST_LOG_INFO("Voucher verify passed.  Voucher =\n %s",
+-                 pkcs7->d.sign->contents->d.data->data);
++                 ctx->brski_retrieved_voucher);
+     
+     return (EST_ERR_NONE);
+ }
+diff --git a/src/est/est_server.c b/src/est/est_server.c
+index d047b48..4b4d617 100644
+--- a/src/est/est_server.c
++++ b/src/est/est_server.c
+@@ -1133,7 +1133,11 @@ int est_tls_uid_auth (EST_CTX *ctx, SSL *ssl, X509_REQ *req)
+          */
+         tls_uid = est_get_tls_uid(ssl, &uid_len, 0);
+         if (tls_uid) {
++#ifdef HAVE_OLD_OPENSSL
+ 	    i = memcmp_s(tls_uid, uid_len, bs->data, uid_len, &diff);
++#else
++	    i = memcmp_s(tls_uid, uid_len, ASN1_STRING_get0_data(bs), uid_len, &diff);
++#endif
+             if (i == EOK && !diff) {
+                 EST_LOG_INFO("PoP is valid");
+                 rv = EST_ERR_NONE;
+-- 
+2.47.3
+
diff --git a/package/libest/0006-Use-providers-instead-of-the-ENGINE-API-on-OpenSSL-4.patch b/package/libest/0006-Use-providers-instead-of-the-ENGINE-API-on-OpenSSL-4.patch
new file mode 100644
index 0000000000..3ef41c4db6
--- /dev/null
+++ b/package/libest/0006-Use-providers-instead-of-the-ENGINE-API-on-OpenSSL-4.patch
@@ -0,0 +1,64 @@
+From fdf43891c4cffd5f9a7776a6195a636988c7aed1 Mon Sep 17 00:00:00 2001
+From: Karl Smeltzer <karl.smeltzer@canonical.com>
+Date: Fri, 24 Jul 2026 12:55:06 -0700
+Subject: [PATCH] Use providers instead of the ENGINE API on OpenSSL 4 (est.h)
+
+OpenSSL 4.0 removes the ENGINE API, so the est_apps_startup() /
+est_apps_shutdown() macros in est.h no longer link: they call
+ENGINE_load_builtin_engines() / ENGINE_cleanup() and friends.
+
+Add OpenSSL >= 4.0 variants of both macros that load the default
+provider instead, keeping the existing variants for older versions,
+matching the HAVE_OLD_OPENSSL pattern already used in this header.
+
+Upstream: https://github.com/cisco/libest/pull/136
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/est/est.h | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/src/est/est.h b/src/est/est.h
+index ffbe85f..716dd7e 100644
+--- a/src/est/est.h
++++ b/src/est/est.h
+@@ -25,6 +25,9 @@
+ #include <openssl/engine.h>
+ #include <openssl/conf.h>
+ #include <openssl/srp.h>
++#if OPENSSL_VERSION_NUMBER >= 0x40000000L
++#include <openssl/provider.h>
++#endif
+ 
+ #ifdef  __cplusplus
+ extern "C" {
+@@ -829,6 +832,13 @@ LIBEST_API EST_ERROR est_disable_performance_timers(EST_CTX *ctx);
+          ENGINE_load_builtin_engines(); \
+          SSL_library_init(); \
+          SSL_load_error_strings(); } while (0)
++#elif OPENSSL_VERSION_NUMBER >= 0x40000000L
++#define est_apps_startup()               \
++    do { ERR_load_crypto_strings();      \
++         OpenSSL_add_all_algorithms();   \
++         OSSL_PROVIDER_load(NULL, "default"); \
++         SSL_library_init();             \
++         SSL_load_error_strings(); } while (0)
+ #else
+ #define est_apps_startup()               \
+     do { ERR_load_crypto_strings();      \
+@@ -854,6 +864,12 @@ LIBEST_API EST_ERROR est_disable_performance_timers(EST_CTX *ctx);
+          CRYPTO_cleanup_all_ex_data(); \
+          ERR_remove_thread_state(NULL); \
+          ERR_free_strings(); } while (0)
++#elif OPENSSL_VERSION_NUMBER >= 0x40000000L
++#define est_apps_shutdown() \
++    do { CONF_modules_unload(1); \
++         OBJ_cleanup(); EVP_cleanup(); \
++         CRYPTO_cleanup_all_ex_data(); \
++         ERR_free_strings(); } while (0)
+ #else
+ #define est_apps_shutdown() \
+     do { CONF_modules_unload(1); \
+-- 
+2.47.3
+
diff --git a/package/libest/0007-Port-ossl_srv.c-copies-to-OpenSSL-4.patch b/package/libest/0007-Port-ossl_srv.c-copies-to-OpenSSL-4.patch
new file mode 100644
index 0000000000..0a62049fbc
--- /dev/null
+++ b/package/libest/0007-Port-ossl_srv.c-copies-to-OpenSSL-4.patch
@@ -0,0 +1,358 @@
+From b2bcfd65b825a2adf8f9f3e8801211fae2332e17 Mon Sep 17 00:00:00 2001
+From: Karl Smeltzer <karl.smeltzer@canonical.com>
+Date: Fri, 24 Jul 2026 12:55:19 -0700
+Subject: [PATCH] Port ossl_srv.c copies to OpenSSL 4
+
+Both ossl_srv.c copies (example/server, test/util) fail to build
+against OpenSSL 4.0 due to relying on removed functionality.
+
+Fixes:
+- Add a shim mapping ASN1_STRING_get0_data() to ASN1_STRING_data() on
+  OpenSSL < 1.1.0, then use the ASN1_STRING_type/length/get0_data
+  accessors unconditionally. These files do not include config.h, so
+  HAVE_OLD_OPENSSL is never defined here; keying on
+  OPENSSL_VERSION_NUMBER is what actually keeps 1.0.x building.
+- Retag DN entries in the msie_hack path with
+  X509_NAME_ENTRY_set_data() instead of writing str->type, which has
+  no setter once the type is opaque.
+- Replace BN_pseudo_rand() with BN_rand(), available on all versions.
+- Ifdef out the FORMAT_ENGINE branch on OpenSSL >= 4.0.
+
+Upstream: https://github.com/cisco/libest/pull/136
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ example/server/ossl_srv.c | 69 +++++++++++++++++++++++----------------
+ test/util/ossl_srv.c      | 67 ++++++++++++++++++++++---------------
+ 2 files changed, 82 insertions(+), 54 deletions(-)
+
+diff --git a/example/server/ossl_srv.c b/example/server/ossl_srv.c
+index b87c2d1..3610e93 100644
+--- a/example/server/ossl_srv.c
++++ b/example/server/ossl_srv.c
+@@ -90,6 +90,10 @@
+ #include <openssl/bio.h>
+ #include "apps.h"  //taken from openssl/apps/apps.h
+ 
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#define ASN1_STRING_get0_data ASN1_STRING_data
++#endif
++
+ extern BIO *bio_err;
+ BIO *cacerts = NULL;
+ static int msie_hack = 0;
+@@ -317,6 +321,7 @@ EVP_PKEY *load_key(BIO *err, const char *file, int format, int maybe_stdin,
+         BIO_printf(err, "no keyfile specified\n");
+         goto end;
+     }
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
+     if (format == FORMAT_ENGINE) {
+         if (!e)
+             BIO_printf(err, "no engine specified\n");
+@@ -330,6 +335,7 @@ EVP_PKEY *load_key(BIO *err, const char *file, int format, int maybe_stdin,
+         }
+         goto end;
+     }
++#endif
+     key = BIO_new(BIO_s_file());
+     if (key == NULL) {
+         ERR_print_errors(err);
+@@ -883,7 +889,7 @@ int rand_serial(BIGNUM *b, ASN1_INTEGER *ai) {
+     if (!btmp)
+         return 0;
+ 
+-    if (!BN_pseudo_rand(btmp, SERIAL_RAND_BITS, 0, 0))
++    if (!BN_rand(btmp, SERIAL_RAND_BITS, 0, 0))
+         goto error;
+     if (ai && !BN_to_ASN1_INTEGER(btmp, ai))
+         goto error;
+@@ -1304,14 +1310,14 @@ static int do_updatedb(CA_DB *db) {
+ 
+     /* get actual time and make a string */
+     a_tm = X509_gmtime_adj(a_tm, 0);
+-    a_tm_s = (char *) OPENSSL_malloc(a_tm->length+1);
++    a_tm_s = (char *) OPENSSL_malloc(ASN1_STRING_length(a_tm)+1);
+     if (a_tm_s == NULL) {
+         cnt = -1;
+         goto err;
+     }
+ 
+-    memcpy(a_tm_s, a_tm->data, a_tm->length);
+-    a_tm_s[a_tm->length] = '\0';
++    memcpy(a_tm_s, ASN1_STRING_get0_data(a_tm), ASN1_STRING_length(a_tm));
++    a_tm_s[ASN1_STRING_length(a_tm)] = '\0';
+ 
+     if (strncmp(a_tm_s, "49", 2) <= 0)
+         a_y2k = 1;
+@@ -1367,19 +1373,19 @@ int old_entry_print(BIO *bp, ASN1_OBJECT *obj, ASN1_STRING *str) {
+     *(pbuf++) = '\0';
+     BIO_puts(bp, buf);
+ 
+-    if (str->type == V_ASN1_PRINTABLESTRING)
++    if (ASN1_STRING_type(str) == V_ASN1_PRINTABLESTRING)
+         BIO_printf(bp, "PRINTABLE:'");
+-    else if (str->type == V_ASN1_T61STRING)
++    else if (ASN1_STRING_type(str) == V_ASN1_T61STRING)
+         BIO_printf(bp, "T61STRING:'");
+-    else if (str->type == V_ASN1_IA5STRING)
++    else if (ASN1_STRING_type(str) == V_ASN1_IA5STRING)
+         BIO_printf(bp, "IA5STRING:'");
+-    else if (str->type == V_ASN1_UNIVERSALSTRING)
++    else if (ASN1_STRING_type(str) == V_ASN1_UNIVERSALSTRING)
+         BIO_printf(bp, "UNIVERSALSTRING:'");
+     else
+-        BIO_printf(bp, "ASN.1 %2d:'", str->type);
++        BIO_printf(bp, "ASN.1 %2d:'", ASN1_STRING_type(str));
+ 
+-    p = (char *) str->data;
+-    for (j = str->length; j > 0; j--) {
++    p = (char *) ASN1_STRING_get0_data(str);
++    for (j = ASN1_STRING_length(str); j > 0; j--) {
+         if ((*p >= ' ') && (*p <= '~'))
+             BIO_printf(bp, "%c", *p);
+         else if (*p & 0x80)
+@@ -1505,16 +1511,22 @@ STACK_OF(OPENSSL_STRING) *sigopts, STACK_OF(CONF_VALUE) *policy, CA_DB *db,
+             nid = OBJ_obj2nid(X509_NAME_ENTRY_get_object(ne));
+ #endif
+             
+-            if (str->type == V_ASN1_UNIVERSALSTRING)
++            if (ASN1_STRING_type(str) == V_ASN1_UNIVERSALSTRING)
+                 ASN1_UNIVERSALSTRING_to_string(str);
+ 
+-            if ((str->type == V_ASN1_IA5STRING)
+-                    && (nid != NID_pkcs9_emailAddress))
+-                str->type = V_ASN1_T61STRING;
++            if ((ASN1_STRING_type(str) == V_ASN1_IA5STRING)
++                    && (nid != NID_pkcs9_emailAddress)) {
++                X509_NAME_ENTRY_set_data(ne, V_ASN1_T61STRING,
++                        ASN1_STRING_get0_data(str), ASN1_STRING_length(str));
++                str = X509_NAME_ENTRY_get_data(ne);
++            }
+ 
+             if ((nid == NID_pkcs9_emailAddress)
+-                    && (str->type == V_ASN1_PRINTABLESTRING))
+-                str->type = V_ASN1_IA5STRING;
++                    && (ASN1_STRING_type(str) == V_ASN1_PRINTABLESTRING)) {
++                X509_NAME_ENTRY_set_data(ne, V_ASN1_IA5STRING,
++                        ASN1_STRING_get0_data(str), ASN1_STRING_length(str));
++                str = X509_NAME_ENTRY_get_data(ne);
++            }
+         }
+ 
+         /* If no EMAIL is wanted in the subject */
+@@ -1523,17 +1535,18 @@ STACK_OF(OPENSSL_STRING) *sigopts, STACK_OF(CONF_VALUE) *policy, CA_DB *db,
+ 
+         /* check some things */
+         if ((OBJ_obj2nid(obj) == NID_pkcs9_emailAddress)
+-                && (str->type != V_ASN1_IA5STRING)) {
++                && (ASN1_STRING_type(str) != V_ASN1_IA5STRING)) {
+             BIO_printf(bio_err,
+                     "\nemailAddress type needs to be of type IA5STRING\n");
+             goto err;
+         }
+-        if ((str->type != V_ASN1_BMPSTRING)
+-                && (str->type != V_ASN1_UTF8STRING)) {
+-            j = ASN1_PRINTABLE_type(str->data, str->length);
+-            if (((j == V_ASN1_T61STRING) && (str->type != V_ASN1_T61STRING))
++        if ((ASN1_STRING_type(str) != V_ASN1_BMPSTRING)
++                && (ASN1_STRING_type(str) != V_ASN1_UTF8STRING)) {
++            j = ASN1_PRINTABLE_type(ASN1_STRING_get0_data(str),
++                    ASN1_STRING_length(str));
++            if (((j == V_ASN1_T61STRING) && (ASN1_STRING_type(str) != V_ASN1_T61STRING))
+                     || ((j == V_ASN1_IA5STRING)
+-                            && (str->type == V_ASN1_PRINTABLESTRING))) {
++                            && (ASN1_STRING_type(str) == V_ASN1_PRINTABLESTRING))) {
+                 BIO_printf(bio_err,
+                         "\nThe string contains characters that are illegal for the ASN.1 type\n");
+                 goto err;
+@@ -1631,8 +1644,8 @@ STACK_OF(OPENSSL_STRING) *sigopts, STACK_OF(CONF_VALUE) *policy, CA_DB *db,
+                     BIO_printf(bio_err,
+                             "The %s field needed to be the same in the\nCA certificate (%s) and the request (%s)\n",
+                             cv->name,
+-                            ((str2 == NULL) ? "NULL" : (char *) str2->data),
+-                            ((str == NULL) ? "NULL" : (char *) str->data));
++                            ((str2 == NULL) ? "NULL" : (char *) ASN1_STRING_get0_data(str2)),
++                            ((str == NULL) ? "NULL" : (char *) ASN1_STRING_get0_data(str)));
+                     goto err;
+                 }
+             } else {
+@@ -1935,9 +1948,9 @@ STACK_OF(OPENSSL_STRING) *sigopts, STACK_OF(CONF_VALUE) *policy, CA_DB *db,
+     row[DB_type] = (char *) OPENSSL_malloc(2);
+ 
+     tm = X509_get_notAfter(ret);
+-    row[DB_exp_date] = (char *) OPENSSL_malloc(tm->length+1);
+-    memcpy(row[DB_exp_date], tm->data, tm->length);
+-    row[DB_exp_date][tm->length] = '\0';
++    row[DB_exp_date] = (char *) OPENSSL_malloc(ASN1_STRING_length(tm)+1);
++    memcpy(row[DB_exp_date], ASN1_STRING_get0_data(tm), ASN1_STRING_length(tm));
++    row[DB_exp_date][ASN1_STRING_length(tm)] = '\0';
+ 
+     row[DB_rev_date] = NULL;
+ 
+diff --git a/test/util/ossl_srv.c b/test/util/ossl_srv.c
+index 3efefa4..6ea539a 100644
+--- a/test/util/ossl_srv.c
++++ b/test/util/ossl_srv.c
+@@ -91,6 +91,10 @@
+ #include <openssl/bio.h>
+ #include "apps.h"  //taken from openssl/apps/apps.h
+ 
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#define ASN1_STRING_get0_data ASN1_STRING_data
++#endif
++
+ extern BIO *bio_err;
+ BIO *cacerts = NULL;
+ static int msie_hack=0;
+@@ -345,6 +349,7 @@ EVP_PKEY *load_key(BIO *err, const char *file, int format, int maybe_stdin,
+ 		BIO_printf(err,"no keyfile specified\n");
+ 		goto end;
+ 		}
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
+ 	if (format == FORMAT_ENGINE)
+ 		{
+ 		if (!e)
+@@ -361,6 +366,7 @@ EVP_PKEY *load_key(BIO *err, const char *file, int format, int maybe_stdin,
+ 			}
+ 		goto end;
+ 		}
++#endif
+ 	key=BIO_new(BIO_s_file());
+ 	if (key == NULL)
+ 		{
+@@ -971,7 +977,7 @@ int rand_serial(BIGNUM *b, ASN1_INTEGER *ai)
+ 	if (!btmp)
+ 		return 0;
+ 
+-	if (!BN_pseudo_rand(btmp, SERIAL_RAND_BITS, 0, 0))
++	if (!BN_rand(btmp, SERIAL_RAND_BITS, 0, 0))
+ 		goto error;
+ 	if (ai && !BN_to_ASN1_INTEGER(btmp, ai))
+ 		goto error;
+@@ -1434,15 +1440,15 @@ static int do_updatedb (CA_DB *db)
+ 
+ 	/* get actual time and make a string */
+ 	a_tm = X509_gmtime_adj(a_tm, 0);
+-	a_tm_s = (char *) OPENSSL_malloc(a_tm->length+1);
++	a_tm_s = (char *) OPENSSL_malloc(ASN1_STRING_length(a_tm)+1);
+ 	if (a_tm_s == NULL)
+ 		{
+ 		cnt = -1;
+ 		goto err;
+ 		}
+ 
+-	memcpy(a_tm_s, a_tm->data, a_tm->length);
+-	a_tm_s[a_tm->length] = '\0';
++	memcpy(a_tm_s, ASN1_STRING_get0_data(a_tm), ASN1_STRING_length(a_tm));
++	a_tm_s[ASN1_STRING_length(a_tm)] = '\0';
+ 
+ 	if (strncmp(a_tm_s, "49", 2) <= 0)
+ 		a_y2k = 1;
+@@ -1508,19 +1514,19 @@ int old_entry_print(BIO *bp, ASN1_OBJECT *obj, ASN1_STRING *str)
+ 	*(pbuf++)='\0';
+ 	BIO_puts(bp,buf);
+ 
+-	if (str->type == V_ASN1_PRINTABLESTRING)
++	if (ASN1_STRING_type(str) == V_ASN1_PRINTABLESTRING)
+ 		BIO_printf(bp,"PRINTABLE:'");
+-	else if (str->type == V_ASN1_T61STRING)
++	else if (ASN1_STRING_type(str) == V_ASN1_T61STRING)
+ 		BIO_printf(bp,"T61STRING:'");
+-	else if (str->type == V_ASN1_IA5STRING)
++	else if (ASN1_STRING_type(str) == V_ASN1_IA5STRING)
+ 		BIO_printf(bp,"IA5STRING:'");
+-	else if (str->type == V_ASN1_UNIVERSALSTRING)
++	else if (ASN1_STRING_type(str) == V_ASN1_UNIVERSALSTRING)
+ 		BIO_printf(bp,"UNIVERSALSTRING:'");
+ 	else
+-		BIO_printf(bp,"ASN.1 %2d:'",str->type);
+-			
+-	p=(char *)str->data;
+-	for (j=str->length; j>0; j--)
++		BIO_printf(bp,"ASN.1 %2d:'",ASN1_STRING_type(str));
++
++	p=(char *)ASN1_STRING_get0_data(str);
++	for (j=ASN1_STRING_length(str); j>0; j--)
+ 		{
+ 		if ((*p >= ' ') && (*p <= '~'))
+ 			BIO_printf(bp,"%c",*p);
+@@ -1658,16 +1664,24 @@ static int do_body(X509 **xret, EVP_PKEY *pkey, X509 *x509, const EVP_MD *dgst,
+ #else            
+                             nid = OBJ_obj2nid(X509_NAME_ENTRY_get_object(ne));
+ #endif
+-			if (str->type == V_ASN1_UNIVERSALSTRING)
++			if (ASN1_STRING_type(str) == V_ASN1_UNIVERSALSTRING)
+ 				ASN1_UNIVERSALSTRING_to_string(str);
+ 
+-			if ((str->type == V_ASN1_IA5STRING) &&
++			if ((ASN1_STRING_type(str) == V_ASN1_IA5STRING) &&
+ 				(nid != NID_pkcs9_emailAddress))
+-				str->type=V_ASN1_T61STRING;
++				{
++				X509_NAME_ENTRY_set_data(ne, V_ASN1_T61STRING,
++					ASN1_STRING_get0_data(str), ASN1_STRING_length(str));
++				str=X509_NAME_ENTRY_get_data(ne);
++				}
+ 
+ 			if ((nid == NID_pkcs9_emailAddress) &&
+-				(str->type == V_ASN1_PRINTABLESTRING))
+-				str->type=V_ASN1_IA5STRING;
++				(ASN1_STRING_type(str) == V_ASN1_PRINTABLESTRING))
++				{
++				X509_NAME_ENTRY_set_data(ne, V_ASN1_IA5STRING,
++					ASN1_STRING_get0_data(str), ASN1_STRING_length(str));
++				str=X509_NAME_ENTRY_get_data(ne);
++				}
+ 			}
+ 
+ 		/* If no EMAIL is wanted in the subject */
+@@ -1676,18 +1690,18 @@ static int do_body(X509 **xret, EVP_PKEY *pkey, X509 *x509, const EVP_MD *dgst,
+ 
+ 		/* check some things */
+ 		if ((OBJ_obj2nid(obj) == NID_pkcs9_emailAddress) &&
+-			(str->type != V_ASN1_IA5STRING))
++			(ASN1_STRING_type(str) != V_ASN1_IA5STRING))
+ 			{
+ 			BIO_printf(bio_err,"\nemailAddress type needs to be of type IA5STRING\n");
+ 			goto err;
+ 			}
+-		if ((str->type != V_ASN1_BMPSTRING) && (str->type != V_ASN1_UTF8STRING))
++		if ((ASN1_STRING_type(str) != V_ASN1_BMPSTRING) && (ASN1_STRING_type(str) != V_ASN1_UTF8STRING))
+ 			{
+-			j=ASN1_PRINTABLE_type(str->data,str->length);
++			j=ASN1_PRINTABLE_type(ASN1_STRING_get0_data(str),ASN1_STRING_length(str));
+ 			if (	((j == V_ASN1_T61STRING) &&
+-				 (str->type != V_ASN1_T61STRING)) ||
++				 (ASN1_STRING_type(str) != V_ASN1_T61STRING)) ||
+ 				((j == V_ASN1_IA5STRING) &&
+-				 (str->type == V_ASN1_PRINTABLESTRING)))
++				 (ASN1_STRING_type(str) == V_ASN1_PRINTABLESTRING)))
+ 				{
+ 				BIO_printf(bio_err,"\nThe string contains characters that are illegal for the ASN.1 type\n");
+ 				goto err;
+@@ -1791,7 +1805,8 @@ again2:
+ 					}
+ 				if (j < 0)
+ 					{
+-					BIO_printf(bio_err,"The %s field needed to be the same in the\nCA certificate (%s) and the request (%s)\n",cv->name,((str2 == NULL)?"NULL":(char *)str2->data),((str == NULL)?"NULL":(char *)str->data));
++					BIO_printf(bio_err,"The %s field needed to be the same in the\nCA certificate (%s) and the request (%s)\n",cv->name,
++						((str2 == NULL)?"NULL":(char *)ASN1_STRING_get0_data(str2)),((str == NULL)?"NULL":(char *)ASN1_STRING_get0_data(str)));
+ 					goto err;
+ 					}
+ 				}
+@@ -2098,9 +2113,9 @@ again2:
+ 	row[DB_type]=(char *)OPENSSL_malloc(2);
+ 
+ 	tm=X509_get_notAfter(ret);
+-	row[DB_exp_date]=(char *)OPENSSL_malloc(tm->length+1);
+-	memcpy(row[DB_exp_date],tm->data,tm->length);
+-	row[DB_exp_date][tm->length]='\0';
++	row[DB_exp_date]=(char *)OPENSSL_malloc(ASN1_STRING_length(tm)+1);
++	memcpy(row[DB_exp_date],ASN1_STRING_get0_data(tm),ASN1_STRING_length(tm));
++	row[DB_exp_date][ASN1_STRING_length(tm)]='\0';
+ 
+ 	row[DB_rev_date]=NULL;
+ 
+-- 
+2.47.3
+
diff --git a/package/libest/Config.in b/package/libest/Config.in
index 3a0328c2f8..bd5f40afae 100644
--- a/package/libest/Config.in
+++ b/package/libest/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_LIBEST
 	bool "libest"
 	depends on !BR2_STATIC_LIBS # libexecinfo or glibc
 	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC
-	select BR2_PACKAGE_LIBOPENSSL_ENGINES
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	select BR2_PACKAGE_SAFECLIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
