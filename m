Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7B5C433F5
	for <buildroot@archiver.kernel.org>; Sun,  1 May 2022 19:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4ADCC400B8;
	Sun,  1 May 2022 19:58:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xHPMIaHVTgfI; Sun,  1 May 2022 19:58:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FD164059E;
	Sun,  1 May 2022 19:58:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD8881BF3FB
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 19:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA2B6606F5
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 19:58:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1EN9Z1JI6Bmu for <buildroot@lists.busybox.net>;
 Sun,  1 May 2022 19:58:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1809E60687
 for <buildroot@buildroot.org>; Sun,  1 May 2022 19:58:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 47CEE84D65; Sun,  1 May 2022 19:47:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 May 2022 21:58:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4636ec4369bb319a44d03da3a104e7cd41c86526
X-Git-Newrev: d7280ac83d87b116835307303cca591493b72ef3
X-Patchwork-Hint: ignore
Message-Id: <20220501194748.47CEE84D65@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cryptography: fix symbol
 redeclared error
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

commit: https://git.buildroot.net/buildroot/commit/?id=d7280ac83d87b116835307303cca591493b72ef3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport a patch removing invalid OPENSSL_NO_PSK guard.

Fixes:
 - http://autobuild.buildroot.net/results/1f2/1f2f203ee5130fdfce005281e71bf371699701f3

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...invalid-OPENSSL_NO_PSK-defined-guard-7146.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/python-cryptography/0001-Remove-invalid-OPENSSL_NO_PSK-defined-guard-7146.patch b/package/python-cryptography/0001-Remove-invalid-OPENSSL_NO_PSK-defined-guard-7146.patch
new file mode 100644
index 0000000000..5d953b8931
--- /dev/null
+++ b/package/python-cryptography/0001-Remove-invalid-OPENSSL_NO_PSK-defined-guard-7146.patch
@@ -0,0 +1,56 @@
+From 891a06101d7b48c61d0d3174f79e9962b995770e Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Fri, 29 Apr 2022 16:06:10 -0600
+Subject: [PATCH] Remove invalid OPENSSL_NO_PSK defined guard (#7146)
+
+These symbols are not conditional on OPENSSL_NO_PSK in ssl.h
+
+SSL_CTX_set_psk_find_session_callback:
+https://github.com/openssl/openssl/blob/openssl-3.0.2/include/openssl/ssl.h.in#L847
+
+SSL_CTX_set_psk_use_session_callback:
+https://github.com/openssl/openssl/blob/openssl-3.0.2/include/openssl/ssl.h.in#L850-L851
+
+As such we can not guard the fallback with defined(OPENSSL_NO_PSK)
+as this will result in redeclaration errors.
+
+Fixes:
+build/temp.linux-sparc64-3.10/_openssl.c:2286:8: error: 'SSL_CTX_set_psk_find_session_callback' redeclared as different kind of symbol
+ 2286 | void (*SSL_CTX_set_psk_find_session_callback)(SSL_CTX *,
+      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+In file included from build/temp.linux-sparc64-3.10/_openssl.c:832:
+/home/giuliobenetti/autobuild/run/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/openssl/ssl.h:855:6: note: previous declaration of 'SSL_CTX_set_psk_find_session_callback' was here
+  855 | void SSL_CTX_set_psk_find_session_callback(SSL_CTX *ctx,
+      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+build/temp.linux-sparc64-3.10/_openssl.c:2293:8: error: 'SSL_CTX_set_psk_use_session_callback' redeclared as different kind of symbol
+ 2293 | void (*SSL_CTX_set_psk_use_session_callback)(SSL_CTX *,
+      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+In file included from build/temp.linux-sparc64-3.10/_openssl.c:832:
+/home/giuliobenetti/autobuild/run/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/openssl/ssl.h:858:6: note: previous declaration of 'SSL_CTX_set_psk_use_session_callback' was here
+  858 | void SSL_CTX_set_psk_use_session_callback(SSL_CTX *ctx,
+      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+891a06101d7b48c61d0d3174f79e9962b995770e]
+---
+ src/_cffi_src/openssl/ssl.py | 3 +--
+ 2 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/src/_cffi_src/openssl/ssl.py b/src/_cffi_src/openssl/ssl.py
+index 1314b85b0..d036e4f2d 100644
+--- a/src/_cffi_src/openssl/ssl.py
++++ b/src/_cffi_src/openssl/ssl.py
+@@ -785,8 +785,7 @@ void (*SSL_CTX_set_cookie_verify_cb)(SSL_CTX *,
+ static const long Cryptography_HAS_SSL_COOKIE = 1;
+ #endif
+ #if CRYPTOGRAPHY_OPENSSL_LESS_THAN_111 || \
+-    CRYPTOGRAPHY_IS_LIBRESSL || CRYPTOGRAPHY_IS_BORINGSSL || \
+-    defined(OPENSSL_NO_PSK)
++    CRYPTOGRAPHY_IS_LIBRESSL || CRYPTOGRAPHY_IS_BORINGSSL
+ static const long Cryptography_HAS_PSK_TLSv1_3 = 0;
+ void (*SSL_CTX_set_psk_find_session_callback)(SSL_CTX *,
+                                            int (*)(
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
