Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29531C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 09:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D243184047;
	Mon,  6 Jun 2022 09:15:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sGtdp8P-w1rN; Mon,  6 Jun 2022 09:15:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDC2583FF8;
	Mon,  6 Jun 2022 09:15:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 27A871BF3CE
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 09:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23AE8404EC
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 09:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WAl55cRC7drY for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 09:15:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24D9C4010C
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 09:15:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4B87086C6A; Mon,  6 Jun 2022 09:03:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 11:14:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dec6a0af3f8de27c85fcaf862b16ab04f1a97ecc
X-Git-Newrev: 1fe77cc29c85b3541261c7c08ab82e3789fd1d4e
X-Patchwork-Hint: ignore
Message-Id: <20220606090351.4B87086C6A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xml-security-c: fix build with
 libressl >= 3.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1fe77cc29c85b3541261c7c08ab82e3789fd1d4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

In file included from ../xsec/enc/OpenSSL/OpenSSLCryptoBase64.hpp:36:0,
                 from enc/OpenSSL/OpenSSLCryptoKeyRSA.cpp:35:
../xsec/enc/OpenSSL/OpenSSLSupport.hpp:92:20: error: field 'mp_ctx_store' has incomplete type 'EVP_ENCODE_CTX {aka evp_Encode_Ctx_st}'
     EVP_ENCODE_CTX mp_ctx_store;
                    ^~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/e908e59ec5b8e1ac505c44900dcb39527f0ec1d3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-fix-build-with-libressl-3.5.0.patch       | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/package/xml-security-c/0001-fix-build-with-libressl-3.5.0.patch b/package/xml-security-c/0001-fix-build-with-libressl-3.5.0.patch
new file mode 100644
index 0000000000..1b2591aa36
--- /dev/null
+++ b/package/xml-security-c/0001-fix-build-with-libressl-3.5.0.patch
@@ -0,0 +1,91 @@
+From 66d1d626cf1405119d89c6fd0fb7e9019bd67f6c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 6 Jun 2022 10:24:58 +0200
+Subject: [PATCH] fix build with libressl >= 3.5.0
+
+Fix the following build failure with libressl >= 3.5.0:
+
+In file included from ../xsec/enc/OpenSSL/OpenSSLCryptoBase64.hpp:36:0,
+                 from enc/OpenSSL/OpenSSLCryptoKeyRSA.cpp:35:
+../xsec/enc/OpenSSL/OpenSSLSupport.hpp:92:20: error: field 'mp_ctx_store' has incomplete type 'EVP_ENCODE_CTX {aka evp_Encode_Ctx_st}'
+     EVP_ENCODE_CTX mp_ctx_store;
+                    ^~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e908e59ec5b8e1ac505c44900dcb39527f0ec1d3
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://issues.apache.org/jira/browse/SANTUARIO-588]
+---
+ xsec/enc/OpenSSL/OpenSSLCryptoBase64.cpp | 3 ++-
+ xsec/enc/OpenSSL/OpenSSLCryptoBase64.hpp | 3 ++-
+ xsec/enc/OpenSSL/OpenSSLSupport.cpp      | 5 +++--
+ xsec/enc/OpenSSL/OpenSSLSupport.hpp      | 3 ++-
+ 4 files changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/xsec/enc/OpenSSL/OpenSSLCryptoBase64.cpp b/xsec/enc/OpenSSL/OpenSSLCryptoBase64.cpp
+index a8ea9f1d..a9a84e3f 100644
+--- a/xsec/enc/OpenSSL/OpenSSLCryptoBase64.cpp
++++ b/xsec/enc/OpenSSL/OpenSSLCryptoBase64.cpp
+@@ -48,7 +48,8 @@ XERCES_CPP_NAMESPACE_USE
+ //           Construction/Destruction
+ // --------------------------------------------------------------------------------
+ 
+-#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
++#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || \
++	((defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L))
+ OpenSSLCryptoBase64::OpenSSLCryptoBase64() : mp_ectx(&m_ectx_store), mp_dctx(&m_dctx_store) { }
+ OpenSSLCryptoBase64::~OpenSSLCryptoBase64() { }
+ #else
+diff --git a/xsec/enc/OpenSSL/OpenSSLCryptoBase64.hpp b/xsec/enc/OpenSSL/OpenSSLCryptoBase64.hpp
+index 82aeb0a1..7c947d50 100644
+--- a/xsec/enc/OpenSSL/OpenSSLCryptoBase64.hpp
++++ b/xsec/enc/OpenSSL/OpenSSLCryptoBase64.hpp
+@@ -205,7 +205,8 @@ private :
+     EVP_ENCODE_CTX *mp_ectx;              // Encode context
+     EVP_ENCODE_CTX *mp_dctx;              // Decode context
+ 
+-#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
++#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || \
++	((defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L))
+     EVP_ENCODE_CTX m_ectx_store;
+     EVP_ENCODE_CTX m_dctx_store;
+ #endif 
+diff --git a/xsec/enc/OpenSSL/OpenSSLSupport.cpp b/xsec/enc/OpenSSL/OpenSSLSupport.cpp
+index cf874f82..c4453004 100644
+--- a/xsec/enc/OpenSSL/OpenSSLSupport.cpp
++++ b/xsec/enc/OpenSSL/OpenSSLSupport.cpp
+@@ -273,7 +273,8 @@ int ECDSA_SIG_set0(ECDSA_SIG *sig, BIGNUM *r, BIGNUM *s)
+ 
+ #endif
+ 
+-#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
++#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || \
++	 ((defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L))
+ EvpEncodeCtxRAII::EvpEncodeCtxRAII() : mp_ctx(&mp_ctx_store) { };
+ EvpEncodeCtxRAII::~EvpEncodeCtxRAII() { }
+ #else
+@@ -289,4 +290,4 @@ EVP_ENCODE_CTX
+     return mp_ctx;
+ }
+ 
+-#endif
+\ No newline at end of file
++#endif
+diff --git a/xsec/enc/OpenSSL/OpenSSLSupport.hpp b/xsec/enc/OpenSSL/OpenSSLSupport.hpp
+index b5f67f26..09d50899 100644
+--- a/xsec/enc/OpenSSL/OpenSSLSupport.hpp
++++ b/xsec/enc/OpenSSL/OpenSSLSupport.hpp
+@@ -88,7 +88,8 @@ public:
+ 
+ private:
+     EVP_ENCODE_CTX *mp_ctx;
+-#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
++#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || \
++	((defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L))
+     EVP_ENCODE_CTX mp_ctx_store;
+ #endif    
+ };
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
