Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580ABCA0FED
	for <buildroot@archiver.kernel.org>; Fri,  5 Sep 2025 07:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1297A40A99;
	Fri,  5 Sep 2025 07:48:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFTcdrqbay1G; Fri,  5 Sep 2025 07:48:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FC2A40A4B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FC2A40A4B;
	Fri,  5 Sep 2025 07:48:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D174CB69
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 07:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C366C60BA1
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 07:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lfr3jmyxhDTE for <buildroot@buildroot.org>;
 Fri,  5 Sep 2025 07:48:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9D8C760B9B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D8C760B9B
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D8C760B9B
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 07:48:38 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45b8b2712d8so16815595e9.3
 for <buildroot@buildroot.org>; Fri, 05 Sep 2025 00:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757058516; x=1757663316;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d/+c9alBOC3lgRqs2YRxjYWdGhkxbXULv1V8JnjTZQ8=;
 b=ailgsBtHqEwVa0SR+qPFYwMAzs7gq6mun5V11z1KsEy65b1wJGF5XmRmlRVD1jKgjH
 IrKpsrvq21NY4LjHSuThoaobb27+dxQNOnENc0GdKL1hHgflcOwmfzN0t0Wt9Do1c1pa
 121mfcToDaowJ1ZScQGjmjTxlhnb0l5M/pwJWByMoGFkCdoADdET9gaFLLeNi8pmjAG5
 Qi4T9A4v8K/bDk9cUnFM6jEsScNSGsWvaD67GnymJFjdR4BP6rK8ruWKH7ue20Z+xEWm
 B8lamvClSmrL8eJx5pxhUJa/HnHFFVTGWVxPk2LMrGamlhuDwRl0n14EfFCU/bHEozPP
 aVSg==
X-Gm-Message-State: AOJu0Yz3lpxLC7DeXTy3YptPCyokx1ya4ACpQwrF99afHb2QmX73f8Vo
 wJav39D7iP+qI7Ih3cCwJxGNgXS1d71+5s4E3xFTofwe2leU2O3KFialZUZqCXOrFH3/7cE4b0o
 cQ9ky0yA=
X-Gm-Gg: ASbGncv9di2K/Xtr1P7KXXBtrOgPszy8r7X1ga2teKHcSQBNfDZtG6QaAdZNjbNHeC+
 0/EkJ0+pflnGviqTXE8TOPejIaLCx8XEt7X1OfLHyQQ5WoOERk7EoIPmzcuO1f2Jgm1QtvL73ac
 Rxa2njW0ZXIMm89mY5hW7xXjnVgzfvfFrYQXcrV/0jS9XowYesapx63hD/m8s1vRVAr5SC3qcum
 pUtcBdIAvKiDTTZO8LhBirt9xxG17cfmWsxeWOHIef/6KA1avLgCsfsUTNeUW/r64EVDZTWz0Op
 /cGJrEgbOOdAzd5XimEd2OHoMm0qnQ+GrFnf5ELFFDaRspeM4PetHe+RM/qJ4NMg3yt0NAYgcA8
 iPd+n0SFiH0gew/c=
X-Google-Smtp-Source: AGHT+IEpTGW+jc0FB60fD0INH1PXKH+SMtuNpcD9XV8caL03Ir7+AmOkFwHy65H/HgG68nvo9Og0hA==
X-Received: by 2002:a05:600c:a44:b0:45b:7f72:340 with SMTP id
 5b1f17b1804b1-45b8557c68cmr190225155e9.25.1757058516163; 
 Fri, 05 Sep 2025 00:48:36 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e50e30asm319307115e9.24.2025.09.05.00.48.35
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 00:48:35 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  5 Sep 2025 09:48:33 +0200
Message-ID: <20250905074834.470035-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757058516; x=1757663316; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=d/+c9alBOC3lgRqs2YRxjYWdGhkxbXULv1V8JnjTZQ8=;
 b=gVeLNAJmJnn8SEnD6nOh0cjrDeK8ZeU1AXlX4oPfTYV6BI/Oq57vipNo/bweZ+3LyZ
 c3dJhOYgu/MZ9SMJCBurzxJ8sBhWcLEYebPxFJEdwzGxDuJbf6uapSW1k3gtuv2o7fTa
 IjXjJOaB/3mCEHsf0oRlw00rfUTGjsovI19ZRB6bsZFKfH+Z6ucsRweV2MNR2qWkTaAt
 1jZ82bbasuqdQPU8pajlOfzEtWaDtz5MLd/BwDtQMDxPKPygCyy4mGwRYLun5RIAoM/j
 elDdONbrs9qe7/4Quv+qEv42pXNv5m73p0eYey6JqcolImRTUFo85BV28YR3+c8Czoqg
 hr1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gVeLNAJm
Subject: [Buildroot] [2025.02.x,
 PATCH 1/2] package/iperf3: add patch to fix CVE-2025-54349
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
