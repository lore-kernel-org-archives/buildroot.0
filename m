Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671D9C48BF6
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 20:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 333FC60592;
	Sat, 16 Mar 2024 20:55:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HRVlGisE5X-d; Sat, 16 Mar 2024 20:55:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05101605C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05101605C7;
	Sat, 16 Mar 2024 20:55:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5722E1BF391
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 20:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43D7640342
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 20:55:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QnSWl7-NXXY0 for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 20:55:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E7FD401DF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E7FD401DF
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 20:55:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1369F882BD; Sat, 16 Mar 2024 20:55:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Mar 2024 21:14:53 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 7048ad326631e0d66831576a91bcbf27039ac4de
X-Git-Newrev: 25376141ad9348582100314a189bba8d28e8be87
X-Patchwork-Hint: ignore
Message-Id: <20240316205506.1369F882BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/exim: fix
 libressl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=25376141ad9348582100314a189bba8d28e8be87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fix the following libressl build failure raised since bump to version
4.97 in commit faec3ca30e358575f70a036879029f63f7da9b29 and
https://git.exim.org/exim.git/commit/6bf0021993572586f031ac7d973ca33358c2dac8:

In file included from tls.c:473:
tls-openssl.c: In function 'tls_client_stapling_cb':
tls-openssl.c:2652:11: error: invalid use of incomplete typedef 'OCSP_BASICRESP' {aka 'struct ocsp_basic_response_st'}
 2652 |         bs->certs
      |           ^~

Fixes: faec3ca30e358575f70a036879029f63f7da9b29
 - http://autobuild.buildroot.org/results/869fde62128d7b0c65e0ac596a3a3f69b332583d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit dc59cbe4674f9d0f953857edff11cd93d570f360)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exim/0007-typoes.patch                     | 58 ++++++++++++++++++++++
 ...s-openssl.c-fix-build-with-libressl-3.5.0.patch | 43 ++++++++++++++++
 2 files changed, 101 insertions(+)

diff --git a/package/exim/0007-typoes.patch b/package/exim/0007-typoes.patch
new file mode 100644
index 0000000000..6bbfc9eecd
--- /dev/null
+++ b/package/exim/0007-typoes.patch
@@ -0,0 +1,58 @@
+From caf57fe7eb5018b8df196e6d9f99586232798eb3 Mon Sep 17 00:00:00 2001
+From: Jeremy Harris <jgh146exb@wizmail.org>
+Date: Wed, 8 Nov 2023 14:22:37 +0000
+Subject: [PATCH] typoes
+
+Upstream: https://git.exim.org/exim.git/commit/caf57fe7eb5018b8df196e6d9f99586232798eb3
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/src/tls-openssl.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/tls-openssl.c b/src/tls-openssl.c
+index 851ac77c5..237303ba9 100644
+--- a/src/tls-openssl.c
++++ b/src/tls-openssl.c
+@@ -77,9 +77,9 @@ change this guard and punt the issue for a while longer. */
+ #  define EXIM_HAVE_OPENSSL_KEYLOG
+ #  define EXIM_HAVE_OPENSSL_CIPHER_GET_ID
+ #  define EXIM_HAVE_SESSION_TICKET
+-#  define EXIM_HAVE_OPESSL_TRACE
+-#  define EXIM_HAVE_OPESSL_GET0_SERIAL
+-#  define EXIM_HAVE_OPESSL_OCSP_RESP_GET0_CERTS
++#  define EXIM_HAVE_OPENSSL_TRACE
++#  define EXIM_HAVE_OPENSSL_GET0_SERIAL
++#  define EXIM_HAVE_OPENSSL_OCSP_RESP_GET0_CERTS
+ #  define EXIM_HAVE_SSL_GET0_VERIFIED_CHAIN
+ #  ifndef DISABLE_OCSP
+ #   define EXIM_HAVE_OCSP
+@@ -1756,7 +1756,7 @@ level. */
+ DEBUG(D_tls)
+   {
+   SSL_CTX_set_info_callback(ctx, info_callback);
+-#if defined(EXIM_HAVE_OPESSL_TRACE) && !defined(OPENSSL_NO_SSL_TRACE)
++#if defined(EXIM_HAVE_OPENSSL_TRACE) && !defined(OPENSSL_NO_SSL_TRACE)
+   /* this needs a debug build of OpenSSL */
+   SSL_CTX_set_msg_callback(ctx, SSL_trace);
+ #endif
+@@ -2442,7 +2442,7 @@ tls_in.ocsp = OCSP_NOT_RESP;
+ if (!olist)
+   return SSL_TLSEXT_ERR_NOACK;
+ 
+-#ifdef EXIM_HAVE_OPESSL_GET0_SERIAL
++#ifdef EXIM_HAVE_OPENSSL_GET0_SERIAL
+  {
+   const X509 * cert_sent = SSL_get_certificate(s);
+   const ASN1_INTEGER * cert_serial = X509_get0_serialNumber(cert_sent);
+@@ -2646,7 +2646,7 @@ if (!(bs = OCSP_response_get1_basic(rsp)))
+ 
+       debug_printf("certs contained in basicresp:\n");
+       x509_stack_dump_cert_s_names(
+-#ifdef EXIM_HAVE_OPESSL_OCSP_RESP_GET0_CERTS
++#ifdef EXIM_HAVE_OPENSSL_OCSP_RESP_GET0_CERTS
+ 	OCSP_resp_get0_certs(bs)
+ #else
+ 	bs->certs
+-- 
+2.30.2
+
diff --git a/package/exim/0008-src-src-tls-openssl.c-fix-build-with-libressl-3.5.0.patch b/package/exim/0008-src-src-tls-openssl.c-fix-build-with-libressl-3.5.0.patch
new file mode 100644
index 0000000000..67d96fc1af
--- /dev/null
+++ b/package/exim/0008-src-src-tls-openssl.c-fix-build-with-libressl-3.5.0.patch
@@ -0,0 +1,43 @@
+From 88f45502272a9a674948204e460ebe90202827d4 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 11 Feb 2024 21:45:42 +0100
+Subject: [PATCH] src/src/tls-openssl.c: fix build with libressl >= 3.5.0
+
+OCSP_BASICRESP is an opaque structure since libressl 3.5.0 and
+https://github.com/libressl/openbsd/commit/57442b0028fb09287793f279ee57ebb38e9ab954
+resulting in the following build failure since version 4.97 and
+https://git.exim.org/exim.git/commit/6bf0021993572586f031ac7d973ca33358c2dac8:
+
+In file included from tls.c:473:
+tls-openssl.c: In function 'tls_client_stapling_cb':
+tls-openssl.c:2652:11: error: invalid use of incomplete typedef 'OCSP_BASICRESP' {aka 'struct ocsp_basic_response_st'}
+ 2652 |         bs->certs
+      |           ^~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/869fde62128d7b0c65e0ac596a3a3f69b332583d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://bugs.exim.org/show_bug.cgi?id=3074
+---
+ src/src/tls-openssl.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/tls-openssl.c b/src/tls-openssl.c
+index 237303ba9..c7f94c160 100644
+--- a/src/tls-openssl.c
++++ b/src/tls-openssl.c
+@@ -98,6 +98,10 @@ change this guard and punt the issue for a while longer. */
+ # define EXIM_HAVE_OPENSSL_CIPHER_GET_ID
+ #endif
+ 
++#if LIBRESSL_VERSION_NUMBER >= 0x3050000fL
++# define EXIM_HAVE_OPENSSL_OCSP_RESP_GET0_CERTS
++#endif
++
+ #if !defined(LIBRESSL_VERSION_NUMBER) && (OPENSSL_VERSION_NUMBER >= 0x030000000L)
+ # define EXIM_HAVE_EXPORT_CHNL_BNGNG
+ # define EXIM_HAVE_OPENSSL_X509_STORE_GET1_ALL_CERTS
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
