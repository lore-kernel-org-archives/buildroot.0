Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3284C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 09:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 077B18100B;
	Mon, 15 Jul 2024 09:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0s9-kCIYBEAO; Mon, 15 Jul 2024 09:44:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAFA481016
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAFA481016;
	Mon, 15 Jul 2024 09:44:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB0381BF41C
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 09:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8C3C81016
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 09:44:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QHqJ4s8OYgPs for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 09:44:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDCA98100B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDCA98100B
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 09:44:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D765F86B30; Mon, 15 Jul 2024 09:44:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 11:38:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 246763308bfca93977c4ad5bee7c8654fcf7dfd3
X-Git-Newrev: 8dc7445056d1c21e4e4205cfcd92c0b539597e12
X-Patchwork-Hint: ignore
Message-Id: <20240715094453.D765F86B30@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libest: Add support for openssl v3
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8dc7445056d1c21e4e4205cfcd92c0b539597e12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libest uses functions that are no longer available in OpenSSL 3.0. Add a
wrapper that calls the proper replacements depending on the version.

Fixes:
  http://autobuild.buildroot.net/results/89024d6c1f10959282470b120d332fb32922b3b6

Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
[Arnout: add Upstream: tag to patches]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...est-fix-error-implicit-declaration-of-fun.patch |  64 ++++++
 ...kage-libest-Add-OpenSSL-3.0-compatibility.patch | 225 +++++++++++++++++++++
 2 files changed, 289 insertions(+)

diff --git a/package/libest/0001-package-libest-fix-error-implicit-declaration-of-fun.patch b/package/libest/0001-package-libest-fix-error-implicit-declaration-of-fun.patch
new file mode 100644
index 0000000000..6fd952170e
--- /dev/null
+++ b/package/libest/0001-package-libest-fix-error-implicit-declaration-of-fun.patch
@@ -0,0 +1,64 @@
+From 28c65fd9dff2f30438b98f0b71f387468259a2c3 Mon Sep 17 00:00:00 2001
+From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
+Date: Fri, 12 Jul 2024 21:07:10 +0300
+Subject: [PATCH] =?UTF-8?q?package/libest:=20fix=20error:=20implicit?=
+ =?UTF-8?q?=20declaration=20of=20function=20=E2=80=98ERR=5Ferror=5Fstring?=
+ =?UTF-8?q?=E2=80=99?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Added necessary header includes to fix 'implicit declaration' errors which occur when
+using -Wimplicit-function-declaration flag.
+
+Upstream: https://github.com/cisco/libest/pull/132
+Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
+---
+ src/est/est.c             | 4 +++-
+ src/est/est_client.c      | 1 +
+ src/est/est_server_http.c | 2 ++
+ 3 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/est/est.c b/src/est/est.c
+index 8a65f87..24474c0 100644
+--- a/src/est/est.c
++++ b/src/est/est.c
+@@ -42,7 +42,9 @@
+ #include <DbgHelp.h>
+ #endif  /* DISABLE_BACKTRACE*/
+ #endif /* WIN32*/
+-
++#include <openssl/err.h>
++#include <openssl/ssl.h>
++#include <openssl/rand.h>
+ #ifndef ENABLE_CLIENT_ONLY
+ static char hex_chpw[] = {0x06, 0x09, 0x2A, 0x86, 0x48, 0x86, 
+ 			  0xF7, 0x0D, 0x01, 0x09, 0x07};
+diff --git a/src/est/est_client.c b/src/est/est_client.c
+index 8dff9d9..5c25d4f 100644
+--- a/src/est/est_client.c
++++ b/src/est/est_client.c
+@@ -40,6 +40,7 @@
+ #include <openssl/ssl.h>
+ #include <openssl/cms.h>
+ #include <openssl/rand.h>
++#include <openssl/crypto.h>
+ #include "est.h"
+ #include "est_locl.h"
+ #include "est_ossl_util.h"
+diff --git a/src/est/est_server_http.c b/src/est/est_server_http.c
+index 2bd08d5..ce1cece 100644
+--- a/src/est/est_server_http.c
++++ b/src/est/est_server_http.c
+@@ -42,6 +42,8 @@
+ #include <openssl/err.h>
+ #include <openssl/ssl.h>
+ #include <openssl/x509v3.h>
++#include <openssl/crypto.h>
++#include <openssl/rand.h>
+ #if defined(_WIN32)
+ #define _CRT_SECURE_NO_WARNINGS // Disable deprecation warning in VS2005
+ #else
+-- 
+2.40.1
+
diff --git a/package/libest/0002-package-libest-Add-OpenSSL-3.0-compatibility.patch b/package/libest/0002-package-libest-Add-OpenSSL-3.0-compatibility.patch
new file mode 100644
index 0000000000..a4c74e424a
--- /dev/null
+++ b/package/libest/0002-package-libest-Add-OpenSSL-3.0-compatibility.patch
@@ -0,0 +1,225 @@
+From ad5ce7ff1cae92c151dc6f350ef943106ddd852f Mon Sep 17 00:00:00 2001
+From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
+Date: Fri, 12 Jul 2024 21:07:36 +0300
+Subject: [PATCH] package/libest: Add OpenSSL 3.0 compatibility
+
+The functions `FIPS_mode` and `FIPS_mode_set` are deprecated in OpenSSL 3.0, replaced by
+`EVP_default_properties_is_fips_enabled` and `EVP_default_properties_enable_fips` respectively.
+
+This commit introduces wrappers for these new EVP APIs to maintain compatibility with OpenSSL 3.0,
+while ensuring continued support for older versions of OpenSSL.
+
+- Implemented `is_fips_enabled` wrapper around `EVP_default_properties_is_fips_enabled`
+- Implemented `enable_fips` wrapper around `EVP_default_properties_enable_fips`
+- Added conditional compilation to support both new and legacy OpenSSL versions
+
+Upstream: https://github.com/cisco/libest/pull/132
+Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
+---
+ example/client-brski/estclient-brski.c |  2 +-
+ example/client/estclient.c             |  2 +-
+ example/proxy/estproxy.c               |  2 +-
+ example/server/estserver.c             |  2 +-
+ java/jni/client.c                      |  2 +-
+ src/est/est_client.c                   | 12 ++++++------
+ src/est/est_ossl_util.c                | 18 ++++++++++++++++++
+ src/est/est_ossl_util.h                |  2 ++
+ src/est/est_server.c                   |  2 +-
+ test/UT/US1864/us1864.c                |  4 ++--
+ 10 files changed, 34 insertions(+), 14 deletions(-)
+
+diff --git a/example/client-brski/estclient-brski.c b/example/client-brski/estclient-brski.c
+index 9e63af5..6e03052 100644
+--- a/example/client-brski/estclient-brski.c
++++ b/example/client-brski/estclient-brski.c
+@@ -388,7 +388,7 @@ int main (int argc, char **argv)
+                 break;
+             case 'f':
+                 /* Turn FIPS on if requested and exit if failure */
+-                set_fips_return = FIPS_mode_set(1);
++                set_fips_return = est_enable_fips(1);
+                 if (!set_fips_return) {
+                     printf("\nERROR setting FIPS MODE ON ...\n");
+                     ERR_load_crypto_strings();
+diff --git a/example/client/estclient.c b/example/client/estclient.c
+index a8a2d6f..75b1272 100644
+--- a/example/client/estclient.c
++++ b/example/client/estclient.c
+@@ -1280,7 +1280,7 @@ int main (int argc, char **argv)
+                 break;
+             case 'f':
+                 /* Turn FIPS on if requested and exit if failure */
+-                set_fips_return = FIPS_mode_set(1);
++                set_fips_return = est_enable_fips(1);
+                 if (!set_fips_return) {
+                     printf("\nERROR setting FIPS MODE ON ...\n");
+                     ERR_load_crypto_strings();
+diff --git a/example/proxy/estproxy.c b/example/proxy/estproxy.c
+index 114bd65..6dbdbda 100644
+--- a/example/proxy/estproxy.c
++++ b/example/proxy/estproxy.c
+@@ -593,7 +593,7 @@ int main (int argc, char **argv)
+             /*
+              * Turn FIPS on if user requested it and exit if failure
+              */
+-            set_fips_return = FIPS_mode_set(1);
++            set_fips_return = est_enable_fips(1);
+             if (set_fips_return != 1) {
+                 set_fips_error = ERR_get_error();
+                 printf("\nERROR WHILE SETTING FIPS MODE ON exiting ....\n");
+diff --git a/example/server/estserver.c b/example/server/estserver.c
+index 3539dc4..90886cf 100644
+--- a/example/server/estserver.c
++++ b/example/server/estserver.c
+@@ -2285,7 +2285,7 @@ int main (int argc, char **argv)
+             /* turn FIPS on if user requested it
+              * and exit if failure.
+              */
+-            set_fips_return = FIPS_mode_set(1);
++            set_fips_return = est_enable_fips(1);
+             if (set_fips_return != 1) {
+                 set_fips_error = ERR_get_error();
+                 printf("\nERROR WHILE SETTING FIPS MODE ON exiting ....\n");
+diff --git a/java/jni/client.c b/java/jni/client.c
+index c5bc28e..f58d5c0 100644
+--- a/java/jni/client.c
++++ b/java/jni/client.c
+@@ -179,7 +179,7 @@ static int jni_est_client_X509_REQ_sign (X509_REQ *x, EVP_PKEY *pkey, const EVP_
+  */
+ JNIEXPORT jint JNICALL Java_com_cisco_c3m_est_ESTClient_enable_1fips(
+ 		JNIEnv *env, jclass obj) {
+-	if (!FIPS_mode() && !FIPS_mode_set(1)) {
++	if (!est_is_fips_enabled() && !est_enable_fips(1)) {
+ 		ERR_print_errors_fp(stderr);
+ 		return -1;
+ 	} else {
+diff --git a/src/est/est_client.c b/src/est/est_client.c
+index 5c25d4f..63069af 100644
+--- a/src/est/est_client.c
++++ b/src/est/est_client.c
+@@ -3183,7 +3183,7 @@ EST_ERROR est_client_enroll_internal (EST_CTX *ctx, char *cn, int *pkcs7_len, in
+          * HTTPS digest mode requires the use of MD5.  Make sure we're not
+          * in FIPS mode and can use MD5
+          */
+-        if (ctx->auth_mode == AUTH_DIGEST && (FIPS_mode())){
++        if (ctx->auth_mode == AUTH_DIGEST && (est_is_fips_enabled())){
+             EST_LOG_ERR("HTTP digest auth not allowed while in FIPS mode");
+             rv = EST_ERR_BAD_MODE;
+             goto err;
+@@ -3594,7 +3594,7 @@ EST_ERROR est_client_reenroll (EST_CTX *ctx, X509 *cert, int *pkcs7_len, EVP_PKE
+          * HTTPS digest mode requires the use of MD5.  Make sure we're not
+          * in FIPS mode and can use MD5
+          */
+-        if (ctx->auth_mode == AUTH_DIGEST && (FIPS_mode())){
++        if (ctx->auth_mode == AUTH_DIGEST && (est_is_fips_enabled())){
+ 	    EST_LOG_ERR("HTTP digest auth not allowed while in FIPS mode");
+ 	    rv = EST_ERR_BAD_MODE;
+             goto err;
+@@ -3680,7 +3680,7 @@ static EST_ERROR est_client_enroll_csr_internal (EST_CTX *ctx, X509_REQ *csr, in
+          * HTTPS digest mode requires the use of MD5.  Make sure we're not
+          * in FIPS mode and can use MD5
+          */
+-        if (ctx->auth_mode == AUTH_DIGEST && (FIPS_mode())){
++        if (ctx->auth_mode == AUTH_DIGEST && (est_is_fips_enabled())){
+             EST_LOG_ERR("HTTP digest auth not allowed while in FIPS mode");
+             rv = EST_ERR_BAD_MODE;
+             goto err;
+@@ -5872,7 +5872,7 @@ static EST_ERROR est_client_brski_send_get_voucher (EST_CTX *ctx, int *cacert_le
+          * HTTPS digest mode requires the use of MD5.  Make sure we're not
+          * in FIPS mode and can use MD5
+          */
+-        if (ctx->auth_mode == AUTH_DIGEST && (FIPS_mode())){
++        if (ctx->auth_mode == AUTH_DIGEST && (est_is_fips_enabled())){
+             EST_LOG_ERR("HTTP digest auth not allowed while in FIPS mode");
+             rv = EST_ERR_BAD_MODE;
+             goto err;
+@@ -6366,7 +6366,7 @@ EST_ERROR est_client_brski_send_voucher_status (EST_CTX *ctx, EST_BRSKI_STATUS_V
+          * HTTPS digest mode requires the use of MD5.  Make sure we're not
+          * in FIPS mode and can use MD5
+          */
+-        if (ctx->auth_mode == AUTH_DIGEST && (FIPS_mode())){
++        if (ctx->auth_mode == AUTH_DIGEST && (est_is_fips_enabled())){
+             EST_LOG_ERR("HTTP digest auth not allowed while in FIPS mode");
+             rv = EST_ERR_BAD_MODE;
+             goto err;
+@@ -6535,7 +6535,7 @@ EST_ERROR est_client_brski_send_enroll_status (EST_CTX *ctx, EST_BRSKI_STATUS_VA
+          * HTTPS digest mode requires the use of MD5.  Make sure we're not
+          * in FIPS mode and can use MD5
+          */
+-        if (ctx->auth_mode == AUTH_DIGEST && (FIPS_mode())){
++        if (ctx->auth_mode == AUTH_DIGEST && (est_is_fips_enabled())){
+             EST_LOG_ERR("HTTP digest auth not allowed while in FIPS mode");
+             rv = EST_ERR_BAD_MODE;
+             goto err;
+diff --git a/src/est/est_ossl_util.c b/src/est/est_ossl_util.c
+index daa54f2..0887daa 100644
+--- a/src/est/est_ossl_util.c
++++ b/src/est/est_ossl_util.c
+@@ -500,3 +500,21 @@ char *est_find_ser_num_in_subj(X509 *cert)
+     return(ser_num_str);
+ }
+ #endif
++
++int est_is_fips_enabled()
++{
++#if OPENSSL_VERSION_NUMBER >= 0x30000000L
++    return EVP_default_properties_is_fips_enabled(NULL);
++#else
++    return FIPS_mode();
++#endif
++}
++
++int est_enable_fips(int enable)
++{
++#if OPENSSL_VERSION_NUMBER >= 0x30000000L
++	return EVP_default_properties_enable_fips(NULL, enable);
++#else
++	return FIPS_mode_set(enable);
++#endif
++}
+diff --git a/src/est/est_ossl_util.h b/src/est/est_ossl_util.h
+index 68ad290..2389e45 100644
+--- a/src/est/est_ossl_util.h
++++ b/src/est/est_ossl_util.h
+@@ -44,4 +44,6 @@ LIBEST_TEST_API void ossl_dump_ssl_errors(void);
+ EST_ERROR ossl_init_cert_store(X509_STORE *store,
+                                unsigned char *raw1, int size1);
+ 
++int est_is_fips_enabled();
++int est_enable_fips(int);
+ #endif
+diff --git a/src/est/est_server.c b/src/est/est_server.c
+index d047b48..979ae53 100644
+--- a/src/est/est_server.c
++++ b/src/est/est_server.c
+@@ -3355,7 +3355,7 @@ EST_ERROR est_server_set_auth_mode (EST_CTX *ctx, EST_HTTP_AUTH_MODE amode)
+         /*
+          * Since HTTP digest auth uses MD5, make sure we're not in FIPS mode.
+          */
+-	if (FIPS_mode()) {
++	if (est_is_fips_enabled()) {
+ 	    EST_LOG_ERR("HTTP digest auth not allowed while in FIPS mode");
+ 	    return (EST_ERR_BAD_MODE);
+ 	}
+diff --git a/test/UT/US1864/us1864.c b/test/UT/US1864/us1864.c
+index 3e41cd7..1f57494 100644
+--- a/test/UT/US1864/us1864.c
++++ b/test/UT/US1864/us1864.c
+@@ -218,12 +218,12 @@ static void us1864_test1 (void)
+     /*
+      * Make sure we don't allow DIGEST mode when in FIPS mode
+      */
+-    if (!FIPS_mode_set(1)) {
++    if (!est_enable_fips(1)) {
+         printf("FIPS mode not supported, skipping test to prevent digest auth when in FIPS mode");
+     } else {
+         est_rv = est_server_set_auth_mode(ctx, AUTH_DIGEST);
+         CU_ASSERT(est_rv == EST_ERR_BAD_MODE);
+-        FIPS_mode_set(0);
++        est_enable_fips(0);
+     }
+ 
+     X509_free(x);
+-- 
+2.40.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
