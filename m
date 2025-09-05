Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8C2CA0FED
	for <buildroot@archiver.kernel.org>; Fri,  5 Sep 2025 07:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BABE8408A6;
	Fri,  5 Sep 2025 07:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LlHqKkUUGyaC; Fri,  5 Sep 2025 07:48:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7CE340850
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7CE340850;
	Fri,  5 Sep 2025 07:48:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A3B52111
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 07:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89ABB407FF
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 07:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rXviiG0tbUWK for <buildroot@buildroot.org>;
 Fri,  5 Sep 2025 07:48:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F92140787
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F92140787
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F92140787
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 07:48:03 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-61cd3748c6dso3617729a12.3
 for <buildroot@buildroot.org>; Fri, 05 Sep 2025 00:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757058481; x=1757663281;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d/+c9alBOC3lgRqs2YRxjYWdGhkxbXULv1V8JnjTZQ8=;
 b=ucn1DYeKYz64jtgzYmMAIiSHOUO03DSp776d19iZwBfVCy7Cuim6kvHnxT8sM2Y9sr
 06cVeXxRxgqhfHxnrXLNGSg451g/SSnisE+mGsbdPV1qw9mj6OmaiX/kKypVYypusxMF
 jfAJkoDpFLUeU4UpZovrAfTPhD9MIYCuAbYDXrtBzEDuNyv32COyv6h9lzjJRYK/pExt
 GLA72JxczcoTmqFPpcrUr4JDM7vY1JdsAANj6Qo9qmqSvM3B5FP00eFg7ROGiRy0fldl
 t9+jt7wB5h6glPROD7xIbE+RYKVvgc3EmLJ5kVpmguBnK7kwlG3zRVUCkunabFrAkSod
 MUew==
X-Gm-Message-State: AOJu0Ywlo86LOxamdhJEo1CiuomLkbANbZffF8RaZu/dBrCo6mwpnVUr
 VJwekpMvPhRJBl0fDcgA9XI9pc8cUZAWk/3Rwf/cWOpab7vSKA3/Nt2nZxT84/H7+0DrXU9cozX
 Ikao+3G0=
X-Gm-Gg: ASbGncubkzZo2myDZDG/b36up2TD2ati144pgQbPnCNirfI2lkD11Tb/ocKQCIYiViF
 UxaopDRQmMW+0Tq+H0Zi36x2bhuesHJIedjr11XfEZGOYnxgs29JsCkt/foCdnHS69ngDLa/1hJ
 yW5z9asZRc+xd3zwUX74JEJ/UyQtFeeE1GGKtZMMOW5ClZ0NBArl4D4HJd51tJ7wIuJ9ypjyi+k
 F/wbPkppdIMvaiwOjxwTxKuc3DbyMaNwiCngru9wGS+rK1yVdYHpOOmHSuPxI5T+idBjiqhQXGP
 I6O62k2iVOP7pQB3jroJiEZGZZR9VQZFKXwSmJRmy/Lp2DI4KJf5wSzEJAnR1IhI5n2LDfNEYnG
 vKnQlazGhZ9rMgzbbgaU9Mew7MQ==
X-Google-Smtp-Source: AGHT+IGHBs+enu0+19ui5PRXO73hV7e1IZtCTvErHWD1338SmYLsAfSvuFHFeQBygRlurpaearBBLw==
X-Received: by 2002:a05:6402:5211:b0:61d:1d16:19b1 with SMTP id
 4fb4d7f45d1cf-61d2699c0bamr19679918a12.14.1757058481457; 
 Fri, 05 Sep 2025 00:48:01 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc1c7dfesm16101925a12.7.2025.09.05.00.48.00
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 00:48:01 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  5 Sep 2025 09:47:59 +0200
Message-ID: <20250905074800.469349-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757058481; x=1757663281; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=d/+c9alBOC3lgRqs2YRxjYWdGhkxbXULv1V8JnjTZQ8=;
 b=KMazVBPlp2FVoo7g6jy4iaRKBDNruv3PvX9gQ453U2JKXeInl3DlyHj+1XAjRlcL7l
 6OohH8fLXJnWcFdfLT6/JeAVRnpPqsBYiIrdEJD1TE+z+yD67/570MONzEJzryHCHUZC
 DcEAx3qtY9GjHBoh8s57sYbabzea/UiJZeRbipl2emDIm+DlJBQx4ZJUTzHO6PABzmuC
 FdPHjsiHYm9CGq028F+R7jTaGuGtdIYNMk7WyQa78fJrHJ2Ln8DJqFv27mIKWTzu4xbD
 lZEQp81CoVp1qrkdEE0+clIt8Ehk8qtHSmYTj6hTJfdq3XdY30D9177ZLjb39RlJ5wgc
 EmMw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KMazVBPl
Subject: [Buildroot] [PATCH 1/2] package/iperf3: add patch to fix
 CVE-2025-54349
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

Fixes the following vulnerability:

- CVE-2025-54349

    In iperf before 3.19.1, iperf_auth.c has an off-by-one error and
    resultant heap-based buffer overflow.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-54349
  - https://github.com/esnet/iperf/commit/4e5313bab0b9b3fe03513ab54f722c8a3e4b7bdf

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...Fix-off-by-one-head-overflow-in-auth.patch | 93 +++++++++++++++++++
 package/iperf3/iperf3.mk                      |  3 +
 2 files changed, 96 insertions(+)
 create mode 100644 package/iperf3/0001-Fix-off-by-one-head-overflow-in-auth.patch

diff --git a/package/iperf3/0001-Fix-off-by-one-head-overflow-in-auth.patch b/package/iperf3/0001-Fix-off-by-one-head-overflow-in-auth.patch
new file mode 100644
index 0000000000..38fe1327ce
--- /dev/null
+++ b/package/iperf3/0001-Fix-off-by-one-head-overflow-in-auth.patch
@@ -0,0 +1,93 @@
+From 4e5313bab0b9b3fe03513ab54f722c8a3e4b7bdf Mon Sep 17 00:00:00 2001
+From: Sarah Larsen <swlarsen@es.net>
+Date: Wed, 25 Jun 2025 15:11:03 +0000
+Subject: [PATCH] Fix off-by-one heap overflow in auth.
+
+Reported by Han Lee (Apple Information Security)
+
+CVE: CVE-2025-54349
+Upstream: https://github.com/esnet/iperf/commit/4e5313bab0b9b3fe03513ab54f722c8a3e4b7bdf
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/iperf_auth.c | 18 +++++++++++++-----
+ 1 file changed, 13 insertions(+), 5 deletions(-)
+
+diff --git a/src/iperf_auth.c b/src/iperf_auth.c
+index b9f2bc0f2..632f03d24 100644
+--- a/src/iperf_auth.c
++++ b/src/iperf_auth.c
+@@ -288,6 +288,7 @@ int encrypt_rsa_message(const char *plaintext, EVP_PKEY *public_key, unsigned ch
+ }
+ 
+ int decrypt_rsa_message(const unsigned char *encryptedtext, const int encryptedtext_len, EVP_PKEY *private_key, unsigned char **plaintext, int use_pkcs1_padding) {
++    int ret =0;
+ #if OPENSSL_VERSION_MAJOR >= 3
+     EVP_PKEY_CTX *ctx;
+ #else
+@@ -310,7 +311,8 @@ int decrypt_rsa_message(const unsigned char *encryptedtext, const int encryptedt
+     keysize = RSA_size(rsa);
+ #endif
+     rsa_buffer  = OPENSSL_malloc(keysize * 2);
+-    *plaintext = (unsigned char*)OPENSSL_malloc(keysize);
++    // Note: +1 for NULL
++    *plaintext = (unsigned char*)OPENSSL_malloc(keysize + 1);
+ 
+     BIO *bioBuff   = BIO_new_mem_buf((void*)encryptedtext, encryptedtext_len);
+     rsa_buffer_len = BIO_read(bioBuff, rsa_buffer, keysize * 2);
+@@ -320,13 +322,15 @@ int decrypt_rsa_message(const unsigned char *encryptedtext, const int encryptedt
+         padding = RSA_PKCS1_PADDING;
+     }
+ #if OPENSSL_VERSION_MAJOR >= 3
++
+     plaintext_len = keysize;
+     EVP_PKEY_decrypt_init(ctx);
+-    int ret = EVP_PKEY_CTX_set_rsa_padding(ctx, padding);
++
++    ret = EVP_PKEY_CTX_set_rsa_padding(ctx, padding);
+     if (ret < 0){
+         goto errreturn;
+     }
+-    EVP_PKEY_decrypt(ctx, *plaintext, &plaintext_len, rsa_buffer, rsa_buffer_len);
++    ret = EVP_PKEY_decrypt(ctx, *plaintext, &plaintext_len, rsa_buffer, rsa_buffer_len);
+     EVP_PKEY_CTX_free(ctx);
+ #else
+     plaintext_len = RSA_private_decrypt(rsa_buffer_len, rsa_buffer, *plaintext, rsa, padding);
+@@ -337,7 +341,7 @@ int decrypt_rsa_message(const unsigned char *encryptedtext, const int encryptedt
+     BIO_free(bioBuff);
+ 
+     /* Treat a decryption error as an empty string. */
+-    if (plaintext_len < 0) {
++    if (plaintext_len <= 0) {
+         plaintext_len = 0;
+     }
+ 
+@@ -386,24 +390,28 @@ int decode_auth_setting(int enable_debug, const char *authtoken, EVP_PKEY *priva
+     int plaintext_len;
+     plaintext_len = decrypt_rsa_message(encrypted_b64, encrypted_len_b64, private_key, &plaintext, use_pkcs1_padding);
+     free(encrypted_b64);
+-    if (plaintext_len < 0) {
++    if (plaintext_len <= 0) {
+         return -1;
+     }
++
+     plaintext[plaintext_len] = '\0';
+ 
+     char *s_username, *s_password;
+     s_username = (char *) calloc(plaintext_len, sizeof(char));
+     if (s_username == NULL) {
++        OPENSSL_free(plaintext);
+ 	return -1;
+     }
+     s_password = (char *) calloc(plaintext_len, sizeof(char));
+     if (s_password == NULL) {
++        OPENSSL_free(plaintext);
+ 	free(s_username);
+ 	return -1;
+     }
+ 
+     int rc = sscanf((char *) plaintext, auth_text_format, s_username, s_password, &utc_seconds);
+     if (rc != 3) {
++        OPENSSL_free(plaintext);
+ 	free(s_password);
+ 	free(s_username);
+ 	return -1;
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index 744ee070a4..c5efb1d784 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -11,6 +11,9 @@ IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
 IPERF3_LICENSE_FILES = LICENSE
 IPERF3_CPE_ID_VENDOR = es
 
+# 0001-Fix-off-by-one-head-overflow-in-auth.patch
+IPERF3_IGNORE_CVES += CVE-2025-54349
+
 IPERF3_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
