Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F9FC83F03
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 20:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 977504130E;
	Sun,  6 Jul 2025 20:18:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfK683G7FU0e; Sun,  6 Jul 2025 20:18:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA2CC4130C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA2CC4130C;
	Sun,  6 Jul 2025 20:18:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8334212E
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 20:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69A6361107
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 20:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsTP0kqG-2vg for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 20:18:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87139611D5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87139611D5
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 20:18:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 750A686073; Sun,  6 Jul 2025 20:18:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Jul 2025 22:08:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 95985d3524d5d767dd30cdf2308278cfcbbc7cb1
X-Git-Newrev: 1a8e8686235657b71819003ebef7c8dcaf8daf1c
X-Patchwork-Hint: ignore
Message-Id: <20250706201837.750A686073@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libuhttpd: fix build w/ mbedtls
 v3.6
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1a8e8686235657b71819003ebef7c8dcaf8daf1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the mbedtls bump to v3.6 [1] the libuhttpd fails to build with the
following error:

```
[  8%] Building C object src/ssl/CMakeFiles/xssl.dir/mbedtls.c.o
.../buildroot/output/build/libuhttpd-3.14.1/src/ssl/mbedtls.c:52:10: fatal error: mbedtls/certs.h: No such file or directory
   52 | #include <mbedtls/certs.h>
      |          ^~~~~~~~~~~~~~~~~
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
BR2_PACKAGE_LIBUHTTPD=y
EOF
make olddefconfig
make
```

The compatibility with mbedtls v3 has been addressed upstream in the
zhaojh329/ssl project included as a submodule of libuhttpd [2].

This patch backport this upstream commit to be applied on the submodule
directory. This required adaptation of the line numbers (see [3]) and
renaming a function reference passed as parameter of
'mbedtls_pk_parse_keyfile' caused by the commit [4].

[1] 3481a9643f package/mbedtls: bump to version 3.6.3.1
[2] https://github.com/zhaojh329/ssl/commit/28cc9b5d98179d161673d20e79333ae5a4864228
[3] https://github.com/zhaojh329/ssl/commit/8092b5a490eedeb042cc1036ebeab6442624cf4c#diff-fbc46fa2db83f8649ccf1f46c6a044473b7b228edc7d4c0f7cc04b5a879f6fb7
[4] https://github.com/zhaojh329/ssl/commit/0e7d2f73d769cc4ddb350381cebb5ef6f27ab653#diff-fbc46fa2db83f8649ccf1f46c6a044473b7b228edc7d4c0f7cc04b5a879f6fb7R92

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...004-add-compatibility-with-mbed-tls-3-0-0.patch | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/package/libuhttpd/0004-add-compatibility-with-mbed-tls-3-0-0.patch b/package/libuhttpd/0004-add-compatibility-with-mbed-tls-3-0-0.patch
new file mode 100644
index 0000000000..1f45d4634c
--- /dev/null
+++ b/package/libuhttpd/0004-add-compatibility-with-mbed-tls-3-0-0.patch
@@ -0,0 +1,64 @@
+From 28cc9b5d98179d161673d20e79333ae5a4864228 Mon Sep 17 00:00:00 2001
+From: Jianhui Zhao <zhaojh329@gmail.com>
+Date: Sat, 4 May 2024 19:40:07 +0800
+Subject: [PATCH] Add compatibility with Mbed TLS 3.0.0
+
+Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
+Upstream: https://github.com/zhaojh329/ssl/commit/28cc9b5d98179d161673d20e79333ae5a4864228
+[thomas: 
+  - Apply to submodule directory
+  - Rename 'urandom' to '_urandom'
+  - Adapt line numbers
+]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/ssl/mbedtls.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/src/ssl/mbedtls.c b/src/ssl/mbedtls.c
+index 2e02e1c..cad7e00 100644
+--- a/src/ssl/mbedtls.c
++++ b/src/ssl/mbedtls.c
+@@ -49,7 +49,6 @@
+ #include "ssl.h"
+ 
+ #include <mbedtls/ssl.h>
+-#include <mbedtls/certs.h>
+ #include <mbedtls/x509.h>
+ #include <mbedtls/rsa.h>
+ #include <mbedtls/error.h>
+@@ -136,9 +135,13 @@ static const int default_ciphersuites_client[] =
+     AES_CBC_CIPHERS(ECDHE_ECDSA),
+     AES_CBC_CIPHERS(ECDHE_RSA),
+     AES_CBC_CIPHERS(DHE_RSA),
++#ifdef MBEDTLS_TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA
+     MBEDTLS_TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA,
++#endif
+     AES_CIPHERS(RSA),
++#ifdef MBEDTLS_TLS_RSA_WITH_3DES_EDE_CBC_SHA
+     MBEDTLS_TLS_RSA_WITH_3DES_EDE_CBC_SHA,
++#endif
+     0
+ };
+ 
+@@ -221,7 +224,7 @@ static void ssl_update_own_cert(struct ssl_context *ctx)
+     if (!ctx->cert.version)
+         return;
+ 
+-    if (!ctx->key.pk_info)
++    if (mbedtls_pk_get_type(&ctx->key) == MBEDTLS_PK_NONE)
+         return;
+ 
+     mbedtls_ssl_conf_own_cert(&ctx->conf, &ctx->cert, &ctx->key);
+@@ -258,7 +261,11 @@ int ssl_load_key_file(struct ssl_context *ctx, const char *file)
+ {
+     int ret;
+ 
++#if (MBEDTLS_VERSION_NUMBER >= 0x03000000)
++    ret = mbedtls_pk_parse_keyfile(&ctx->key, file, NULL, _urandom, NULL);
++#else
+     ret = mbedtls_pk_parse_keyfile(&ctx->key, file, NULL);
++#endif
+     if (ret)
+         return -1;
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
