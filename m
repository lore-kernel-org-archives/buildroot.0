Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0871FCAC581
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1F0584625;
	Mon,  8 Sep 2025 10:39:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ur0svI90h6Bb; Mon,  8 Sep 2025 10:39:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D70A6846F1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D70A6846F1;
	Mon,  8 Sep 2025 10:39:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B32B1D9
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 307AD42B83
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 692w_BCE0XmR for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:39:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8481942B9F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8481942B9F
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82C0083A90; Mon,  8 Sep 2025 10:39:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Sep 2025 12:37:31 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 633f0731e11ca87a141469aae28262046156980c
X-Git-Newrev: 7172f0642c10b79ec3fd250c9311b69e7abc03e4
X-Patchwork-Hint: ignore
Message-Id: <20250908103908.82C0083A90@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/iperf3: add patch
 to fix CVE-2025-54349
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7172f0642c10b79ec3fd250c9311b69e7abc03e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes the following vulnerability:

- CVE-2025-54349

    In iperf before 3.19.1, iperf_auth.c has an off-by-one error and
    resultant heap-based buffer overflow.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-54349
  - https://github.com/esnet/iperf/commit/4e5313bab0b9b3fe03513ab54f722c8a3e4b7bdf

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 ...0001-Fix-off-by-one-head-overflow-in-auth.patch | 93 ++++++++++++++++++++++
 package/iperf3/iperf3.mk                           |  3 +
 2 files changed, 96 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
