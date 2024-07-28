Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEDCC3DA64
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 07:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6651981778;
	Sun, 28 Jul 2024 07:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id seoRH6jaRwQk; Sun, 28 Jul 2024 07:52:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44C0581799
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44C0581799;
	Sun, 28 Jul 2024 07:52:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 32B641BF32E
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 07:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B38781799
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 07:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O3s4_deg3yTI for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 07:52:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C9D9681778
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9D9681778
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9D9681778
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 07:52:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cca8.dip0.t-ipconnect.de [79.214.204.168])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9C663A4C325F;
 Sun, 28 Jul 2024 09:52:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50922)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sXyhz-0000000064v-1zTa;
 Sun, 28 Jul 2024 07:52:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 28 Jul 2024 09:52:47 +0200
Message-Id: <20240728075247.4724-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722153167;
 bh=bxiKv0Cvz3rmpAPLHnM810Kt2yrr9T/mF+uSIPE9LMc=;
 h=From:To:Cc:Subject:Date:From;
 b=jlkDZeXIDZORl5ZN/e25sAO0WU8aXNcgC+VRrriO3RVTkWLlnbDwa2o+pXDpcRajL
 1iK3VDFHKLiUS1UAmiORVfpr1HHrd5QT82Tk2jonRBZwsdoIWaFcrkNK4P3O+fFgrt
 USQitOjNTP3OsOa5N/1aMd28N/OOXkbY1olWwytZBLM87V3q69Q0CUwzybtUs98G91
 8bjLPP9EVq3HNYkb8G1jkHN/uib0vTObuNf5nURHIb7P3HesWohF0ieMAVp0o9MjJf
 1DinV2BXwP/GzDkdejO6NixWckfGP0Fu13sGpUo3wKaN70369bHuplvZRS7OUOQaYe
 k3oINYoAe1/aA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=jlkDZeXI
Subject: [Buildroot] [PATCH 1/1] package/libcurl: security bump to version
 8.9.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch which is included in this release.

Changelog: https://curl.se/changes.html#8_9_0

Fixes
CVE-2024-6197: https://curl.se/docs/CVE-2024-6197.html
CVE-2024-6874 (Apple-only): https://curl.se/docs/CVE-2024-6874.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-mbedtls-check-version-for-cipher-id.patch | 56 -------------------
 package/libcurl/libcurl.hash                  |  4 +-
 package/libcurl/libcurl.mk                    |  2 +-
 3 files changed, 3 insertions(+), 59 deletions(-)
 delete mode 100644 package/libcurl/0001-mbedtls-check-version-for-cipher-id.patch

diff --git a/package/libcurl/0001-mbedtls-check-version-for-cipher-id.patch b/package/libcurl/0001-mbedtls-check-version-for-cipher-id.patch
deleted file mode 100644
index b7d674acfe..0000000000
--- a/package/libcurl/0001-mbedtls-check-version-for-cipher-id.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 0c4b4c1e93c8e869af230090f32346fdfd548f21 Mon Sep 17 00:00:00 2001
-From: Stefan Eissing <stefan@eissing.org>
-Date: Wed, 22 May 2024 14:44:56 +0200
-Subject: [PATCH] mbedtls: check version for cipher id
-
-mbedtls_ssl_get_ciphersuite_id_from_ssl() seems to have been added in
-mbedtls 3.2.0. Check for that version.
-
-Closes #13749
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-Upstream: https://github.com/curl/curl/commit/0c4b4c1e93c8e869af230090f32346fdfd548f21
----
- lib/vtls/mbedtls.c | 19 ++++++++++++-------
- 1 file changed, 12 insertions(+), 7 deletions(-)
-
-diff --git a/lib/vtls/mbedtls.c b/lib/vtls/mbedtls.c
-index ec0b10dd9a9f..98a4ea01b183 100644
---- a/lib/vtls/mbedtls.c
-+++ b/lib/vtls/mbedtls.c
-@@ -902,8 +902,6 @@ mbed_connect_step2(struct Curl_cfilter *cf, struct Curl_easy *data)
-     (struct mbed_ssl_backend_data *)connssl->backend;
-   struct ssl_primary_config *conn_config = Curl_ssl_cf_get_primary_config(cf);
-   const mbedtls_x509_crt *peercert;
--  char cipher_str[64];
--  uint16_t cipher_id;
- #ifndef CURL_DISABLE_PROXY
-   const char * const pinnedpubkey = Curl_ssl_cf_is_proxy(cf)?
-     data->set.str[STRING_SSL_PINNEDPUBLICKEY_PROXY]:
-@@ -932,11 +930,18 @@ mbed_connect_step2(struct Curl_cfilter *cf, struct Curl_easy *data)
-     return CURLE_SSL_CONNECT_ERROR;
-   }
- 
--  cipher_id = (uint16_t)
--              mbedtls_ssl_get_ciphersuite_id_from_ssl(&backend->ssl);
--  mbed_cipher_suite_get_str(cipher_id, cipher_str, sizeof(cipher_str), true);
--  infof(data, "mbedTLS: Handshake complete, cipher is %s", cipher_str);
--
-+#if MBEDTLS_VERSION_NUMBER >= 0x03020000
-+  {
-+    char cipher_str[64];
-+    uint16_t cipher_id;
-+    cipher_id = (uint16_t)
-+                mbedtls_ssl_get_ciphersuite_id_from_ssl(&backend->ssl);
-+    mbed_cipher_suite_get_str(cipher_id, cipher_str, sizeof(cipher_str), true);
-+    infof(data, "mbedTLS: Handshake complete, cipher is %s", cipher_str);
-+  }
-+#else
-+  infof(data, "mbedTLS: Handshake complete");
-+#endif
-   ret = mbedtls_ssl_get_verify_result(&backend->ssl);
- 
-   if(!conn_config->verifyhost)
--- 
-2.43.0
-
diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 7ba45b79d7..fa325efd7d 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-8.8.0.tar.xz.asc
+# https://curl.se/download/curl-8.9.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  0f58bb95fc330c8a46eeb3df5701b0d90c9d9bfcc42bd1cd08791d12551d4400  curl-8.8.0.tar.xz
+sha256  ff09b2791ca56d25fd5c3f3a4927dce7c8a9dc4182200c487ca889fba1fdd412  curl-8.9.0.tar.xz
 sha256  adb1fc06547fd136244179809f7b7c2d2ae6c4534f160aa513af9b6a12866a32  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 172dd22071..966885aeda 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.8.0
+LIBCURL_VERSION = 8.9.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
