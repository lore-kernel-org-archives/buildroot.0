Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D30CC83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41E2360825;
	Thu, 17 Jul 2025 20:22:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1dwHHyHB9-Y3; Thu, 17 Jul 2025 20:22:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E59460835
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E59460835;
	Thu, 17 Jul 2025 20:22:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1677F226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 551A660AD5
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IlHxkDpfcR_E for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:22:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38520607DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38520607DC
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29276865B2; Thu, 17 Jul 2025 20:22:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 18:33:14 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 06c832c76794545fb0a9140e4c54b7b9748e68b5
X-Git-Newrev: a4c97ab343d1c5ad05b62dd5b92a61e95dd4b60d
X-Patchwork-Hint: ignore
Message-Id: <20250717202236.29276865B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ustream-ssl: fix
 build w/ mbedtls v3.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=a4c97ab343d1c5ad05b62dd5b92a61e95dd4b60d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since the mbedtls bump to v3.6 [1] the ustream-ssl package is failling
on the autobuilder with the following error:

```
In file included from /home/buildroot/instance-0/output-1/build/ustream-ssl-68d09243b6fd4473004b27ff6483352e76e6af1a/ustream-internal.h:25,
                 from /home/buildroot/instance-0/output-1/build/ustream-ssl-68d09243b6fd4473004b27ff6483352e76e6af1a/ustream-ssl.c:25:
/home/buildroot/instance-0/output-1/build/ustream-ssl-68d09243b6fd4473004b27ff6483352e76e6af1a/ustream-mbedtls.h:24:10: fatal error: mbedtls/certs.h: No such file or directory
   24 | #include <mbedtls/certs.h>
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
BR2_PACKAGE_USTREAM_SSL=y
EOF
make olddefconfig
make
```

This patch backport upstream commit that address the compatibility with
mbedtls v3.6.

 - [2] rename the `_random` function used by the mbedtls functions
 - [3] update `mbedtls_pk_parse_keyfile` function to support new mbedtls
     definition and use `mbedtls_pk_get_type`.

[1] 3481a9643f package/mbedtls: bump to version 3.6.3.1
[2] 0001-ustream-mbedtls-use-getrandom-instead-of-dev-urandom.patch
[3] 0002-ustream-mbedtls-add-compatibility-with-mbed-tls-3-0-0.patch

Fixes: https://autobuild.buildroot.org/results/c20/c20dac7cbe5def2c6036d2e1d06de0bfea68b57c
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d28ae8b00b7aa5018ec24809ecc393e7420bc292)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...dtls-use-getrandom-instead-of-dev-urandom.patch | 88 ++++++++++++++++++++++
 ...tls-add-compatibility-with-mbed-tls-3-0-0.patch | 79 +++++++++++++++++++
 2 files changed, 167 insertions(+)

diff --git a/package/ustream-ssl/0001-ustream-mbedtls-use-getrandom-instead-of-dev-urandom.patch b/package/ustream-ssl/0001-ustream-mbedtls-use-getrandom-instead-of-dev-urandom.patch
new file mode 100644
index 0000000000..2abb7ce3a1
--- /dev/null
+++ b/package/ustream-ssl/0001-ustream-mbedtls-use-getrandom-instead-of-dev-urandom.patch
@@ -0,0 +1,88 @@
+From 498f6e268d4d2b0ad33b430f4ba1abe397d31496 Mon Sep 17 00:00:00 2001
+From: Hauke Mehrtens <hauke@hauke-m.de>
+Date: Sun, 19 Feb 2023 21:11:12 +0100
+Subject: [PATCH] ustream-mbedtls: Use getrandom() instead of /dev/urandom
+
+Instead of keeping a file descriptor open just use the getrandom syscall
+to get random data. This is supported by musl libc, glibc and Linux for
+some time now.
+
+This also improves the error handling in case this function returns not
+as many bytes as expected.
+
+Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
+Reviewed-by: Torsten Duwe <duwe@lst.de>
+Upstream: https://git.openwrt.org/?p=project/ustream-ssl.git;a=commit;h=498f6e268d4d2b0ad33b430f4ba1abe397d31496
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ ustream-mbedtls.c | 25 ++++++-------------------
+ 1 file changed, 6 insertions(+), 19 deletions(-)
+
+diff --git a/ustream-mbedtls.c b/ustream-mbedtls.c
+index e79e37b..7fc7874 100644
+--- a/ustream-mbedtls.c
++++ b/ustream-mbedtls.c
+@@ -17,6 +17,7 @@
+  */
+ 
+ #include <sys/types.h>
++#include <sys/random.h>
+ #include <fcntl.h>
+ #include <unistd.h>
+ #include <stdlib.h>
+@@ -25,8 +26,6 @@
+ #include "ustream-ssl.h"
+ #include "ustream-internal.h"
+ 
+-static int urandom_fd = -1;
+-
+ static int s_ustream_read(void *ctx, unsigned char *buf, size_t len)
+ {
+ 	struct ustream *s = ctx;
+@@ -66,21 +65,12 @@ __hidden void ustream_set_io(struct ustream_ssl_ctx *ctx, void *ssl, struct ustr
+ 	mbedtls_ssl_set_bio(ssl, conn, s_ustream_write, s_ustream_read, NULL);
+ }
+ 
+-static bool urandom_init(void)
++static int _random(void *ctx, unsigned char *out, size_t len)
+ {
+-	if (urandom_fd > -1)
+-		return true;
++	ssize_t ret;
+ 
+-	urandom_fd = open("/dev/urandom", O_RDONLY);
+-	if (urandom_fd < 0)
+-		return false;
+-
+-	return true;
+-}
+-
+-static int _urandom(void *ctx, unsigned char *out, size_t len)
+-{
+-	if (read(urandom_fd, out, len) < 0)
++	ret = getrandom(out, len, 0);
++	if (ret < 0 || (size_t)ret != len)
+ 		return MBEDTLS_ERR_ENTROPY_SOURCE_FAILED;
+ 
+ 	return 0;
+@@ -134,9 +124,6 @@ __ustream_ssl_context_new(bool server)
+ 	mbedtls_ssl_config *conf;
+ 	int ep;
+ 
+-	if (!urandom_init())
+-		return NULL;
+-
+ 	ctx = calloc(1, sizeof(*ctx));
+ 	if (!ctx)
+ 		return NULL;
+@@ -159,7 +146,7 @@ __ustream_ssl_context_new(bool server)
+ 
+ 	mbedtls_ssl_config_defaults(conf, ep, MBEDTLS_SSL_TRANSPORT_STREAM,
+ 				    MBEDTLS_SSL_PRESET_DEFAULT);
+-	mbedtls_ssl_conf_rng(conf, _urandom, NULL);
++	mbedtls_ssl_conf_rng(conf, _random, NULL);
+ 
+ 	if (server) {
+ 		mbedtls_ssl_conf_authmode(conf, MBEDTLS_SSL_VERIFY_NONE);
+-- 
+2.30.2
diff --git a/package/ustream-ssl/0002-ustream-mbedtls-add-compatibility-with-mbed-tls-3-0-0.patch b/package/ustream-ssl/0002-ustream-mbedtls-add-compatibility-with-mbed-tls-3-0-0.patch
new file mode 100644
index 0000000000..b9fa4be1a5
--- /dev/null
+++ b/package/ustream-ssl/0002-ustream-mbedtls-add-compatibility-with-mbed-tls-3-0-0.patch
@@ -0,0 +1,79 @@
+From 91666a38b7bd4bd353394986d8343a33ba61d8e2 Mon Sep 17 00:00:00 2001
+From: Hauke Mehrtens <hauke@hauke-m.de>
+Date: Sat, 11 Nov 2023 22:13:24 +0100
+Subject: [PATCH] ustream-mbedtls: Add compatibility with Mbed TLS 3.0.0
+
+This adds support for compiling the code against Mbed TLS 3.0.0.
+It still compiles against Mbed TLS 2.28.
+
+The following changes were needed:
+ * DES and 3DES was removed
+ * mbedtls_pk_context->pk_info is private, use mbedtls_pk_get_type()
+   to check if it was initialized
+ * mbedtls_pk_parse_keyfile() now gets a random callback
+ * mbedtls/certs.h contains test data and is not installed any more and
+   not needed.
+
+Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
+Upstream: https://git.openwrt.org/?p=project/ustream-ssl.git;a=commit;h=91666a38b7bd4bd353394986d8343a33ba61d8e2
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ ustream-mbedtls.c | 12 +++++++++++-
+ ustream-mbedtls.h |  1 -
+ 2 files changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/ustream-mbedtls.c b/ustream-mbedtls.c
+index 7fc7874..1c70cac 100644
+--- a/ustream-mbedtls.c
++++ b/ustream-mbedtls.c
+@@ -110,9 +110,15 @@ static const int default_ciphersuites_client[] =
+ 	AES_CBC_CIPHERS(ECDHE_ECDSA),
+ 	AES_CBC_CIPHERS(ECDHE_RSA),
+ 	AES_CBC_CIPHERS(DHE_RSA),
++/* Removed in Mbed TLS 3.0.0 */
++#ifdef MBEDTLS_TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA
+ 	MBEDTLS_TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA,
++#endif
+ 	AES_CIPHERS(RSA),
++/* Removed in Mbed TLS 3.0.0 */
++#ifdef MBEDTLS_TLS_RSA_WITH_3DES_EDE_CBC_SHA
+ 	MBEDTLS_TLS_RSA_WITH_3DES_EDE_CBC_SHA,
++#endif
+ 	0
+ };
+ 
+@@ -171,7 +177,7 @@ static void ustream_ssl_update_own_cert(struct ustream_ssl_ctx *ctx)
+ 	if (!ctx->cert.version)
+ 		return;
+ 
+-	if (!ctx->key.pk_info)
++	if (mbedtls_pk_get_type(&ctx->key) == MBEDTLS_PK_NONE)
+ 		return;
+ 
+ 	mbedtls_ssl_conf_own_cert(&ctx->conf, &ctx->cert, &ctx->key);
+@@ -206,7 +212,11 @@ __hidden int __ustream_ssl_set_key_file(struct ustream_ssl_ctx *ctx, const char
+ {
+ 	int ret;
+ 
++#if (MBEDTLS_VERSION_NUMBER >= 0x03000000)
++	ret = mbedtls_pk_parse_keyfile(&ctx->key, file, NULL, _random, NULL);
++#else
+ 	ret = mbedtls_pk_parse_keyfile(&ctx->key, file, NULL);
++#endif
+ 	if (ret)
+ 		return -1;
+ 
+diff --git a/ustream-mbedtls.h b/ustream-mbedtls.h
+index e622e5e..7e7c699 100644
+--- a/ustream-mbedtls.h
++++ b/ustream-mbedtls.h
+@@ -21,7 +21,6 @@
+ 
+ #include <mbedtls/net_sockets.h>
+ #include <mbedtls/ssl.h>
+-#include <mbedtls/certs.h>
+ #include <mbedtls/x509.h>
+ #include <mbedtls/rsa.h>
+ #include <mbedtls/error.h>
+-- 
+2.30.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
