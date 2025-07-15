Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F881C83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB38D41722;
	Thu, 17 Jul 2025 20:22:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W07FlcAXyIvE; Thu, 17 Jul 2025 20:22:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFB064171F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFB064171F;
	Thu, 17 Jul 2025 20:22:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E2871A6
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C0E3607EE
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MO6M4Kd23bLQ for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:22:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ABD6607E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3ABD6607E3
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37A2D8670B; Thu, 17 Jul 2025 20:22:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 18:33:24 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a4c97ab343d1c5ad05b62dd5b92a61e95dd4b60d
X-Git-Newrev: af3bf0e15ef098faa7403e726a17eb10e61d22d4
X-Patchwork-Hint: ignore
Message-Id: <20250717202236.37A2D8670B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/shairport-sync:
 fix build w/ mbedtls v3.6
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=af3bf0e15ef098faa7403e726a17eb10e61d22d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since [1] when trying to build this package with mbedtls v3.6 the
following error is happening:

```
player.h:12:10: fatal error: mbedtls/havege.h: No such file or directory
   12 | #include <mbedtls/havege.h>
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.
```

This error can be reproduced with the following config:

```
cat <<EOF >.config
BR2_arm=y
BR2_cortex_a7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_MBEDTLS=y
BR2_PACKAGE_SHAIRPORT_SYNC=y
EOF
make olddefconfig
make
```

This patch backport the upstream commit [2] that add support for
mbedtls v3.

[1] 3481a9643f package/mbedtls: bump to version 3.6.3.1
[2] https://github.com/mikebrady/shairport-sync/commit/d73b585c6f6d9136ae7a04243a54d734fa57d779

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d53f8f26910df2f75e0f4a053fd6ef0c65e639c1)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .../0002-mbedtls-add-support-to-mbedtls3.patch     | 105 +++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/package/shairport-sync/0002-mbedtls-add-support-to-mbedtls3.patch b/package/shairport-sync/0002-mbedtls-add-support-to-mbedtls3.patch
new file mode 100644
index 0000000000..e0e8ea53de
--- /dev/null
+++ b/package/shairport-sync/0002-mbedtls-add-support-to-mbedtls3.patch
@@ -0,0 +1,105 @@
+From d73b585c6f6d9136ae7a04243a54d734fa57d779 Mon Sep 17 00:00:00 2001
+From: Seo Suchan <tjtncks@gmail.com>
+Date: Thu, 9 May 2024 19:10:59 +0900
+Subject: [PATCH] mbedtls: add support to mbedtls3
+
+Signed-off-by: Seo Suchan <tjtncks@gmail.com>
+Upstream: https://github.com/mikebrady/shairport-sync/commit/d73b585c6f6d9136ae7a04243a54d734fa57d779
+[thomas: backport the line numbers]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ common.c | 30 ++++++++++++++++++++++++++----
+ player.c |  1 -
+ player.h |  1 -
+ 3 files changed, 26 insertions(+), 6 deletions(-)
+
+diff --git a/common.c b/common.c
+index 4dc75bc7f..0e2a07243 100644
+--- a/common.c
++++ b/common.c
+@@ -77,6 +77,12 @@
+ #include <mbedtls/md.h>
+ #include <mbedtls/version.h>
+ #include <mbedtls/x509.h>
++
++#if MBEDTLS_VERSION_MAJOR == 3
++#define MBEDTLS_PRIVATE_V3_ONLY(_q) MBEDTLS_PRIVATE(_q)
++#else
++#define MBEDTLS_PRIVATE_V3_ONLY(_q) _q
++#endif
+ #endif
+ 
+ #ifdef CONFIG_LIBDAEMON
+@@ -691,8 +697,14 @@ uint8_t *rsa_apply(uint8_t *input, int inlen, int *outlen, int mode) {
+ 
+   mbedtls_pk_init(&pkctx);
+ 
++#if MBEDTLS_VERSION_MAJOR == 3
+   rc = mbedtls_pk_parse_key(&pkctx, (unsigned char *)super_secret_key, sizeof(super_secret_key),
++                            NULL, 0, mbedtls_ctr_drbg_random, &ctr_drbg);
++#else
++  rc = mbedtls_pk_parse_key(&pkctx, (unsigned char *)super_secret_key, sizeof(super_secret_key), 
+                             NULL, 0);
++
++#endif
+   if (rc != 0)
+     debug(1, "Error %d reading the private key.", rc);
+ 
+@@ -701,19 +713,29 @@ uint8_t *rsa_apply(uint8_t *input, int inlen, int *outlen, int mode) {
+ 
+   switch (mode) {
+   case RSA_MODE_AUTH:
+-    mbedtls_rsa_set_padding(trsa, MBEDTLS_RSA_PKCS_V15, MBEDTLS_MD_NONE);
+-    outbuf = malloc(trsa->len);
++    mbedtls_rsa_set_padding(trsa, MBEDTLS_RSA_PKCS_V15, MBEDTLS_MD_NONE);    
++    outbuf = malloc(trsa->MBEDTLS_PRIVATE_V3_ONLY(len));
++#if MBEDTLS_VERSION_MAJOR == 3
++    rc = mbedtls_rsa_pkcs1_encrypt(trsa, mbedtls_ctr_drbg_random, &ctr_drbg,
++                                   inlen, input, outbuf);
++#else
+     rc = mbedtls_rsa_pkcs1_encrypt(trsa, mbedtls_ctr_drbg_random, &ctr_drbg, MBEDTLS_RSA_PRIVATE,
+                                    inlen, input, outbuf);
++#endif
+     if (rc != 0)
+       debug(1, "mbedtls_pk_encrypt error %d.", rc);
+-    *outlen = trsa->len;
++    *outlen = trsa->MBEDTLS_PRIVATE_V3_ONLY(len);
+     break;
+   case RSA_MODE_KEY:
+     mbedtls_rsa_set_padding(trsa, MBEDTLS_RSA_PKCS_V21, MBEDTLS_MD_SHA1);
+-    outbuf = malloc(trsa->len);
++    outbuf = malloc(trsa->MBEDTLS_PRIVATE_V3_ONLY(len));
++#if MBEDTLS_VERSION_MAJOR == 3
++    rc = mbedtls_rsa_pkcs1_decrypt(trsa, mbedtls_ctr_drbg_random, &ctr_drbg,
++                                   &olen, input, outbuf, trsa->MBEDTLS_PRIVATE_V3_ONLY(len));
++#else
+     rc = mbedtls_rsa_pkcs1_decrypt(trsa, mbedtls_ctr_drbg_random, &ctr_drbg, MBEDTLS_RSA_PRIVATE,
+                                    &olen, input, outbuf, trsa->len);
++#endif
+     if (rc != 0)
+       debug(1, "mbedtls_pk_decrypt error %d.", rc);
+     *outlen = olen;
+diff --git a/player.c b/player.c
+index 8c1752722..d023d269c 100644
+--- a/player.c
++++ b/player.c
+@@ -47,7 +47,6 @@
+ 
+ #ifdef CONFIG_MBEDTLS
+ #include <mbedtls/aes.h>
+-#include <mbedtls/havege.h>
+ #endif
+ 
+ #ifdef CONFIG_POLARSSL
+diff --git a/player.h b/player.h
+index 11435bf91..b35eb7652 100644
+--- a/player.h
++++ b/player.h
+@@ -9,7 +9,6 @@
+ 
+ #ifdef CONFIG_MBEDTLS
+ #include <mbedtls/aes.h>
+-#include <mbedtls/havege.h>
+ #endif
+ 
+ #ifdef CONFIG_POLARSSL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
