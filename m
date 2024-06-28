Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FD0C2BBCA
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 10:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68FB280DE8;
	Fri, 28 Jun 2024 10:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZH1SH4gIIsC; Fri, 28 Jun 2024 10:40:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5270D80DD6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5270D80DD6;
	Fri, 28 Jun 2024 10:40:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F1C81BF3A7
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 10:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4499B80DD4
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 10:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfM2DMLQYMzC for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 10:40:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D71680DCB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D71680DCB
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D71680DCB
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 10:40:31 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 2ECF244075D;
 Fri, 28 Jun 2024 13:39:50 +0300 (IDT)
To: buildroot@buildroot.org
Date: Fri, 28 Jun 2024 13:40:16 +0300
Message-ID: <54de20c98ef34388067dc64ec5c4503d37d8825c.1719571216.git.baruchs-c@neureality.ai>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1719571190;
 bh=eoN3ES5QbUo9D7SPN3dTUBfJtRPlu/GWnlAmC6FmHKA=;
 h=From:To:Cc:Subject:Date:From;
 b=M0IIhSlh2ADLeFFfnUgIszHnhh1TrTGELSOzGiKHEC/wMdPxp4fWYJn6oQ7RqrYWt
 2CvkqPfKP3/qtKZI8laqcgaggB9iQTuTf4hViCU2BaUUvoSzXx+cK3PgiO3PYGXWyb
 x6nPFKkQTxBl5UI2w532J3hoIWgPHwLmjCDMGXWIRqakLCHrZRtRASjvkCuyAZyRgc
 vcJGzdp0/TVLlpGsBIANXJWuVo1OkiX94rH+Bi40qI7p7LZ4kprzKsUSDblYBBiwNN
 UKDOYtCx73QKKqq4UwujnH7xkopFS69QNzjQBp0mg4tqWoCz/GPyVIHrnyx0q2Bnnj
 l4AqOXK6tkP7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=M0IIhSlh
Subject: [Buildroot] [PATCH] package/libcurl: fix build with mbedtls
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Baruch Siach <baruchs-c@neureality.ai>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Baruch Siach <baruchs-c@neureality.ai>

Add upstream patch to fix compatibility with mbedtls version 2.28.x.

Fixes:
http://autobuild.buildroot.net/results/66ba878386e4e478645edb6a282e82820b8dad7f
http://autobuild.buildroot.net/results/7a4d9595197cf23080a23dfe9bc0e60b8145af6e
http://autobuild.buildroot.net/results/9add7283813388daa95b16ef76acb3c4e9ea7c2f

Signed-off-by: Baruch Siach <baruchs-c@neureality.ai>
Change-Id: If77ccffb4eb6630ec8c4cde9ed12254d40c01740
---
 ...-mbedtls-check-version-for-cipher-id.patch | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/libcurl/0001-mbedtls-check-version-for-cipher-id.patch

diff --git a/package/libcurl/0001-mbedtls-check-version-for-cipher-id.patch b/package/libcurl/0001-mbedtls-check-version-for-cipher-id.patch
new file mode 100644
index 000000000000..b7d674acfe33
--- /dev/null
+++ b/package/libcurl/0001-mbedtls-check-version-for-cipher-id.patch
@@ -0,0 +1,56 @@
+From 0c4b4c1e93c8e869af230090f32346fdfd548f21 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Wed, 22 May 2024 14:44:56 +0200
+Subject: [PATCH] mbedtls: check version for cipher id
+
+mbedtls_ssl_get_ciphersuite_id_from_ssl() seems to have been added in
+mbedtls 3.2.0. Check for that version.
+
+Closes #13749
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+Upstream: https://github.com/curl/curl/commit/0c4b4c1e93c8e869af230090f32346fdfd548f21
+---
+ lib/vtls/mbedtls.c | 19 ++++++++++++-------
+ 1 file changed, 12 insertions(+), 7 deletions(-)
+
+diff --git a/lib/vtls/mbedtls.c b/lib/vtls/mbedtls.c
+index ec0b10dd9a9f..98a4ea01b183 100644
+--- a/lib/vtls/mbedtls.c
++++ b/lib/vtls/mbedtls.c
+@@ -902,8 +902,6 @@ mbed_connect_step2(struct Curl_cfilter *cf, struct Curl_easy *data)
+     (struct mbed_ssl_backend_data *)connssl->backend;
+   struct ssl_primary_config *conn_config = Curl_ssl_cf_get_primary_config(cf);
+   const mbedtls_x509_crt *peercert;
+-  char cipher_str[64];
+-  uint16_t cipher_id;
+ #ifndef CURL_DISABLE_PROXY
+   const char * const pinnedpubkey = Curl_ssl_cf_is_proxy(cf)?
+     data->set.str[STRING_SSL_PINNEDPUBLICKEY_PROXY]:
+@@ -932,11 +930,18 @@ mbed_connect_step2(struct Curl_cfilter *cf, struct Curl_easy *data)
+     return CURLE_SSL_CONNECT_ERROR;
+   }
+ 
+-  cipher_id = (uint16_t)
+-              mbedtls_ssl_get_ciphersuite_id_from_ssl(&backend->ssl);
+-  mbed_cipher_suite_get_str(cipher_id, cipher_str, sizeof(cipher_str), true);
+-  infof(data, "mbedTLS: Handshake complete, cipher is %s", cipher_str);
+-
++#if MBEDTLS_VERSION_NUMBER >= 0x03020000
++  {
++    char cipher_str[64];
++    uint16_t cipher_id;
++    cipher_id = (uint16_t)
++                mbedtls_ssl_get_ciphersuite_id_from_ssl(&backend->ssl);
++    mbed_cipher_suite_get_str(cipher_id, cipher_str, sizeof(cipher_str), true);
++    infof(data, "mbedTLS: Handshake complete, cipher is %s", cipher_str);
++  }
++#else
++  infof(data, "mbedTLS: Handshake complete");
++#endif
+   ret = mbedtls_ssl_get_verify_result(&backend->ssl);
+ 
+   if(!conn_config->verifyhost)
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
