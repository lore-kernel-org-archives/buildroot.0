Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0516CCA0EE4
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 20:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34BC140752;
	Mon, 18 Aug 2025 20:20:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IhLjubc3SJOj; Mon, 18 Aug 2025 20:20:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC1B1406E1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC1B1406E1;
	Mon, 18 Aug 2025 20:20:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A729160
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 205EE40253
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:20:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zzLraP2dbQBY for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 20:20:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F1E9740240
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1E9740240
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F1E9740240
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:20:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 5B2B3C6B3B0
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:20:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B5654606A6
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:20:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D31551C22A17A; 
 Mon, 18 Aug 2025 22:20:16 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Aug 2025 22:20:14 +0200
Message-ID: <20250818202015.3213119-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755548417; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=pLN0kiLPpPuPe6fRn1JvZ+ikZuEe1nkM+4ktEHFsjHU=;
 b=ep8k70vD1zItVFxy0zKZajeB118YnhyORBJIqMCAOHx5yMnaAXk3g91hsh0fny/wL3YXzz
 dvgdtasxaGM35iPWFeA5xrBht0cgR7ntCvynT8T55z1sjSUfyB0emKMvRw+cDt17DNV1rA
 pyaa+9hHeHvkDt6uwCqhLAPgyZdFJNqjb+dQCWOLhe2Jiy5aYGBk+XnE/U3vCEBg/uSQEx
 rKJ4iyS0xZYSexilsXaV+b/JsX+VntS/HqJyiIKwf77yWxKyGYeh07HFcRqZ2TJiq9hnve
 ZqCW7gMseO1oXsD+Mu5QcxaLyDakkz5uQA8vt2Td3QhK/D3bHuwLsaq4YiG4+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ep8k70vD
Subject: [Buildroot] [PATCH] package/liboauth: remove package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package fails to build in the autobuilders:

  https://autobuild.buildroot.net/?reason=liboauth%

The last upstream release, 1.0.3, was done 11 years ago:

  https://sourceforge.net/projects/liboauth/

There is a Github repo at:

  https://github.com/x42/liboauth

with commits from 3 years ago, but no release.

We already carry a patch fixing the build with OpenSSL 1.1.x, which
has been submitted at https://github.com/x42/liboauth/issues/9 but
never merged, despite being opened since 2017.

This package also has no maintainer in DEVELOPERS, and it has no
reverse dependency in Buildroot, so let's get rid of it.

Fixes:

  https://autobuild.buildroot.net/results/8694ece6874a5fe297e707b12af85eeaef227675/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                           |   1 -
 package/Config.in                             |   1 -
 ...Fixes-build-issue-with-OpenSSL-1.1.0.patch | 156 ------------------
 package/liboauth/Config.in                    |  11 --
 package/liboauth/liboauth.hash                |   3 -
 package/liboauth/liboauth.mk                  |  20 ---
 6 files changed, 192 deletions(-)
 delete mode 100644 package/liboauth/0001-Fixes-build-issue-with-OpenSSL-1.1.0.patch
 delete mode 100644 package/liboauth/Config.in
 delete mode 100644 package/liboauth/liboauth.hash
 delete mode 100644 package/liboauth/liboauth.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index 554c05ef70..37470d6297 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -664,7 +664,6 @@ package/libnetfilter_conntrack/0001-conntrack-fix-build-with-kernel-5-15-and-mus
 package/libnfc/0001-autotools-make-example-build-optional.patch lib_patch.Upstream
 package/libnids/0001-libpcap-use-pkg-config.patch lib_patch.Upstream
 package/libnss/0001-Bug-1801182-Allow-overriding-OS_ARCH-OS_TEST-and-OS_.patch lib_patch.Upstream
-package/liboauth/0001-Fixes-build-issue-with-OpenSSL-1.1.0.patch lib_patch.Upstream
 package/libodb-mysql/0001-fix-syntax-issue-while-checking-ldflags.patch lib_patch.Upstream
 package/libodb-mysql/0002-mariadb-FTBFS-fix.patch lib_patch.Upstream
 package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch lib_patch.Upstream
diff --git a/package/Config.in b/package/Config.in
index 137f74ed82..899301078e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2093,7 +2093,6 @@ menu "Networking"
 	source "package/libnids/Config.in"
 	source "package/libnl/Config.in"
 	source "package/libnpupnp/Config.in"
-	source "package/liboauth/Config.in"
 	source "package/liboping/Config.in"
 	source "package/libosip2/Config.in"
 	source "package/libpagekite/Config.in"
diff --git a/package/liboauth/0001-Fixes-build-issue-with-OpenSSL-1.1.0.patch b/package/liboauth/0001-Fixes-build-issue-with-OpenSSL-1.1.0.patch
deleted file mode 100644
index 945307bba8..0000000000
--- a/package/liboauth/0001-Fixes-build-issue-with-OpenSSL-1.1.0.patch
+++ /dev/null
@@ -1,156 +0,0 @@
-From 5f1c949b1703367f7f06454fcff650bdb7bac840 Mon Sep 17 00:00:00 2001
-From: DJ Lucas <dj@linuxfromscratch.org>
-Date: Sun, 9 Sep 2018 15:46:15 +0200
-Subject: [PATCH] Fixes build issue with OpenSSL-1.1.0
-
-Downloaded from
-http://www.linuxfromscratch.org/patches/blfs/svn/liboauth-1.0.3-openssl-1.1.0-2.patch
-
-Patch was sent upstream: https://github.com/x42/liboauth/issues/9
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/hash.c | 65 ++++++++++++++++++++++++++++++++++++++++++--------------------
- 1 file changed, 44 insertions(+), 21 deletions(-)
-
-diff --git a/src/hash.c b/src/hash.c
-index 17ff5c8..b7958f7 100644
---- a/src/hash.c
-+++ b/src/hash.c
-@@ -362,6 +362,11 @@ looser:
- #include "oauth.h" // base64 encode fn's.
- #include <openssl/hmac.h>
- 
-+#if OPENSSL_VERSION_NUMBER < 0x10100000
-+#define EVP_MD_CTX_new EVP_MD_CTX_create
-+#define EVP_MD_CTX_free EVP_MD_CTX_destroy
-+#endif
-+
- char *oauth_sign_hmac_sha1 (const char *m, const char *k) {
-   return(oauth_sign_hmac_sha1_raw (m, strlen(m), k, strlen(k)));
- }
-@@ -386,7 +391,7 @@ char *oauth_sign_rsa_sha1 (const char *m, const char *k) {
-   unsigned char *sig = NULL;
-   unsigned char *passphrase = NULL;
-   unsigned int len=0;
--  EVP_MD_CTX md_ctx;
-+  EVP_MD_CTX *md_ctx;
- 
-   EVP_PKEY *pkey;
-   BIO *in;
-@@ -399,24 +404,31 @@ char *oauth_sign_rsa_sha1 (const char *m, const char *k) {
-     return xstrdup("liboauth/OpenSSL: can not read private key");
-   }
- 
-+  md_ctx = EVP_MD_CTX_new();
-+  if (md_ctx == NULL) {
-+          return xstrdup("liboauth/OpenSSL: failed to allocate EVP_MD_CTX");
-+  }
-+
-   len = EVP_PKEY_size(pkey);
-   sig = (unsigned char*)xmalloc((len+1)*sizeof(char));
- 
--  EVP_SignInit(&md_ctx, EVP_sha1());
--  EVP_SignUpdate(&md_ctx, m, strlen(m));
--  if (EVP_SignFinal (&md_ctx, sig, &len, pkey)) {
-+  EVP_SignInit(md_ctx, EVP_sha1());
-+  EVP_SignUpdate(md_ctx, m, strlen(m));
-+  if (EVP_SignFinal (md_ctx, sig, &len, pkey)) {
-     char *tmp;
-     sig[len] = '\0';
-     tmp = oauth_encode_base64(len,sig);
-     OPENSSL_free(sig);
-     EVP_PKEY_free(pkey);
-+    EVP_MD_CTX_free(md_ctx);
-     return tmp;
-   }
-+  EVP_MD_CTX_free(md_ctx);
-   return xstrdup("liboauth/OpenSSL: rsa-sha1 signing failed");
- }
- 
- int oauth_verify_rsa_sha1 (const char *m, const char *c, const char *s) {
--  EVP_MD_CTX md_ctx;
-+  EVP_MD_CTX *md_ctx;
-   EVP_PKEY *pkey;
-   BIO *in;
-   X509 *cert = NULL;
-@@ -437,13 +449,18 @@ int oauth_verify_rsa_sha1 (const char *m, const char *c, const char *s) {
-     return -2;
-   }
- 
-+	md_ctx = EVP_MD_CTX_new();
-+	if (md_ctx == NULL) {
-+		return -2;
-+	}
-+
-   b64d= (unsigned char*) xmalloc(sizeof(char)*strlen(s));
-   slen = oauth_decode_base64(b64d, s);
- 
--  EVP_VerifyInit(&md_ctx, EVP_sha1());
--  EVP_VerifyUpdate(&md_ctx, m, strlen(m));
--  err = EVP_VerifyFinal(&md_ctx, b64d, slen, pkey);
--  EVP_MD_CTX_cleanup(&md_ctx);
-+  EVP_VerifyInit(md_ctx, EVP_sha1());
-+  EVP_VerifyUpdate(md_ctx, m, strlen(m));
-+  err = EVP_VerifyFinal(md_ctx, b64d, slen, pkey);
-+  EVP_MD_CTX_free(pkey);
-   EVP_PKEY_free(pkey);
-   xfree(b64d);
-   return (err);
-@@ -455,35 +472,41 @@ int oauth_verify_rsa_sha1 (const char *m, const char *c, const char *s) {
-  */
- char *oauth_body_hash_file(char *filename) {
-   unsigned char fb[BUFSIZ];
--  EVP_MD_CTX ctx;
-+  EVP_MD_CTX *ctx;
-   size_t len=0;
-   unsigned char *md;
-   FILE *F= fopen(filename, "r");
-   if (!F) return NULL;
- 
--  EVP_MD_CTX_init(&ctx);
--  EVP_DigestInit(&ctx,EVP_sha1());
-+  ctx = EVP_MD_CTX_new();
-+  if (ctx == NULL) {
-+          return xstrdup("liboauth/OpenSSL: failed to allocate EVP_MD_CTX");
-+  }
-+  EVP_DigestInit(ctx,EVP_sha1());
-   while (!feof(F) && (len=fread(fb,sizeof(char),BUFSIZ, F))>0) {
--    EVP_DigestUpdate(&ctx, fb, len);
-+    EVP_DigestUpdate(ctx, fb, len);
-   }
-   fclose(F);
-   len=0;
-   md=(unsigned char*) xcalloc(EVP_MD_size(EVP_sha1()),sizeof(unsigned char));
--  EVP_DigestFinal(&ctx, md,(unsigned int*) &len);
--  EVP_MD_CTX_cleanup(&ctx);
-+  EVP_DigestFinal(ctx, md,(unsigned int*) &len);
-+  EVP_MD_CTX_free(ctx);
-   return oauth_body_hash_encode(len, md);
- }
- 
- char *oauth_body_hash_data(size_t length, const char *data) {
--  EVP_MD_CTX ctx;
-+  EVP_MD_CTX *ctx;
-   size_t len=0;
-   unsigned char *md;
-   md=(unsigned char*) xcalloc(EVP_MD_size(EVP_sha1()),sizeof(unsigned char));
--  EVP_MD_CTX_init(&ctx);
--  EVP_DigestInit(&ctx,EVP_sha1());
--  EVP_DigestUpdate(&ctx, data, length);
--  EVP_DigestFinal(&ctx, md,(unsigned int*) &len);
--  EVP_MD_CTX_cleanup(&ctx);
-+  ctx = EVP_MD_CTX_new();
-+  if (ctx == NULL) {
-+          return xstrdup("liboauth/OpenSSL: failed to allocate EVP_MD_CTX");
-+  }
-+  EVP_DigestInit(ctx,EVP_sha1());
-+  EVP_DigestUpdate(ctx, data, length);
-+  EVP_DigestFinal(ctx, md,(unsigned int*) &len);
-+  EVP_MD_CTX_free(ctx);
-   return oauth_body_hash_encode(len, md);
- }
- 
--- 
-2.14.4
-
diff --git a/package/liboauth/Config.in b/package/liboauth/Config.in
deleted file mode 100644
index 4ed0efa6b1..0000000000
--- a/package/liboauth/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_LIBOAUTH
-	bool "liboauth"
-	select BR2_PACKAGE_OPENSSL
-	help
-	  liboauth is a collection of c functions implementing the oAuth
-	  Core 1.0 Rev A standard API. liboauth provides basic functions
-	  to escape and encode parameters according to oAuth specs and
-	  offers high-level functions to sign requests or verify
-	  signatures.
-
-	  http://liboauth.sourceforge.net/
diff --git a/package/liboauth/liboauth.hash b/package/liboauth/liboauth.hash
deleted file mode 100644
index 5fa0353d50..0000000000
--- a/package/liboauth/liboauth.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  0df60157b052f0e774ade8a8bac59d6e8d4b464058cc55f9208d72e41156811f  liboauth-1.0.3.tar.gz
-sha256  c30608672733bf3abd2ccf6f3206be8d91b7ee58b007b2fdbcfbc61c655e7fb7  COPYING.MIT
diff --git a/package/liboauth/liboauth.mk b/package/liboauth/liboauth.mk
deleted file mode 100644
index bd54330ddf..0000000000
--- a/package/liboauth/liboauth.mk
+++ /dev/null
@@ -1,20 +0,0 @@
-################################################################################
-#
-# liboauth
-#
-################################################################################
-
-LIBOAUTH_VERSION = 1.0.3
-LIBOAUTH_SITE = http://downloads.sourceforge.net/project/liboauth
-LIBOAUTH_INSTALL_STAGING = YES
-LIBOAUTH_DEPENDENCIES += host-pkgconf openssl
-LIBOAUTH_LICENSE = MIT
-LIBOAUTH_LICENSE_FILES = COPYING.MIT
-
-ifeq ($(BR2_PACKAGE_LIBCURL),y)
-LIBOAUTH_DEPENDENCIES += libcurl
-else
-LIBOAUTH_CONF_OPTS += --disable-libcurl
-endif
-
-$(eval $(autotools-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
