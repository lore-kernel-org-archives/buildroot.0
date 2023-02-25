Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22825C64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 09:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C018D40BA6;
	Sat, 25 Feb 2023 09:40:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C018D40BA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T-fzBwfw56UI; Sat, 25 Feb 2023 09:40:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C70F140914;
	Sat, 25 Feb 2023 09:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C70F140914
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 92AC61BF5DF
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69E7241634
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:39:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69E7241634
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oLvdVKbFTAZ0 for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 09:39:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEF3441626
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 09:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEF3441626
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95C5F8690E; Sat, 25 Feb 2023 09:39:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 10:37:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b911c8e8fe52914c1578b846914d7399450067b
X-Git-Newrev: 7edb4a6a4db7d864c6c1560f3fdc1ef4fbd7f0fd
X-Patchwork-Hint: ignore
Message-Id: <20230225093924.95C5F8690E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zabbix: fix build with libressl >=
 3.5.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7edb4a6a4db7d864c6c1560f3fdc1ef4fbd7f0fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libressl >= 3.5.0 raised since bump
to version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

tls.c:113:17: error: static declaration of 'OPENSSL_cleanup' follows non-static declaration
  113 | static void     OPENSSL_cleanup(void)
      |                 ^~~~~~~~~~~~~~~
In file included from /home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/bio.h:69,
                 from /home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/evp.h:67,
                 from /home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/hmac.h:67,
                 from /home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/ssl.h:150,
                 from ../../../include/zbxcomms.h:65,
                 from tls.c:20:
/home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/crypto.h:565:6: note: previous declaration of 'OPENSSL_cleanup' with type 'void(void)'
  565 | void OPENSSL_cleanup(void);
      |      ^~~~~~~~~~~~~~~
In file included from tls.c:20:
tls.c: In function 'zbx_log_ciphersuites':
../../../include/zbxcomms.h:222:75: error: invalid use of incomplete typedef 'SSL_CTX' {aka 'struct ssl_ctx_st'}
  222 | #       define SSL_CTX_get_ciphers(ciphers)                     ((ciphers)->cipher_list)
      |                                                                           ^~
tls.c:1415:31: note: in expansion of macro 'SSL_CTX_get_ciphers'
 1415 |                 cipher_list = SSL_CTX_get_ciphers(ciphers);
      |                               ^~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/acdfcb17b39d438ccf5e4621707a10f60577d233

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-fix-build-with-libressl-3.5.0.patch       | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/package/zabbix/0002-fix-build-with-libressl-3.5.0.patch b/package/zabbix/0002-fix-build-with-libressl-3.5.0.patch
new file mode 100644
index 0000000000..7e32ad5745
--- /dev/null
+++ b/package/zabbix/0002-fix-build-with-libressl-3.5.0.patch
@@ -0,0 +1,71 @@
+From 5c8511384f1d41f9c2a131604d5cb2dbc1c0aec9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 24 Feb 2023 12:23:56 +0100
+Subject: [PATCH] fix build with libressl >= 3.5.0
+
+Fix the following build failure with libressl >= 3.5.0:
+
+tls.c:113:17: error: static declaration of 'OPENSSL_cleanup' follows non-static declaration
+  113 | static void     OPENSSL_cleanup(void)
+      |                 ^~~~~~~~~~~~~~~
+In file included from /home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/bio.h:69,
+                 from /home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/evp.h:67,
+                 from /home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/hmac.h:67,
+                 from /home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/ssl.h:150,
+                 from ../../../include/zbxcomms.h:65,
+                 from tls.c:20:
+/home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/crypto.h:565:6: note: previous declaration of 'OPENSSL_cleanup' with type 'void(void)'
+  565 | void OPENSSL_cleanup(void);
+      |      ^~~~~~~~~~~~~~~
+In file included from tls.c:20:
+tls.c: In function 'zbx_log_ciphersuites':
+../../../include/zbxcomms.h:222:75: error: invalid use of incomplete typedef 'SSL_CTX' {aka 'struct ssl_ctx_st'}
+  222 | #       define SSL_CTX_get_ciphers(ciphers)                     ((ciphers)->cipher_list)
+      |                                                                           ^~
+tls.c:1415:31: note: in expansion of macro 'SSL_CTX_get_ciphers'
+ 1415 |                 cipher_list = SSL_CTX_get_ciphers(ciphers);
+      |                               ^~~~~~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/acdfcb17b39d438ccf5e4621707a10f60577d233
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent (no feedback on first patch)]
+---
+ include/zbxcomms.h      | 3 ++-
+ src/libs/zbxcomms/tls.c | 5 +++--
+ 2 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/include/zbxcomms.h b/include/zbxcomms.h
+index e7d74dbd0f..d6efa358fe 100644
+--- a/include/zbxcomms.h
++++ b/include/zbxcomms.h
+@@ -253,7 +253,8 @@ int	zbx_telnet_execute(ZBX_SOCKET socket_fd, const char *command, AGENT_RESULT *
+ /* TLS BLOCK */
+ #if defined(HAVE_GNUTLS) || defined(HAVE_OPENSSL)
+ 
+-#if defined(HAVE_OPENSSL) && OPENSSL_VERSION_NUMBER < 0x1010000fL || defined(LIBRESSL_VERSION_NUMBER)
++#if defined(HAVE_OPENSSL) && OPENSSL_VERSION_NUMBER < 0x1010000fL || \
++	defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x3050000fL
+ #	if !defined(LIBRESSL_VERSION_NUMBER)
+ #		define OPENSSL_INIT_LOAD_SSL_STRINGS			0
+ #		define OPENSSL_INIT_LOAD_CRYPTO_STRINGS		0
+diff --git a/src/libs/zbxcomms/tls.c b/src/libs/zbxcomms/tls.c
+index 54ab0a6ef4..bd4075b3e4 100644
+--- a/src/libs/zbxcomms/tls.c
++++ b/src/libs/zbxcomms/tls.c
+@@ -30,8 +30,9 @@
+ #include "zbxstr.h"
+ #include "zbxtime.h"
+ 
+-#if defined(HAVE_OPENSSL) && OPENSSL_VERSION_NUMBER < 0x1010000fL || defined(LIBRESSL_VERSION_NUMBER)
+-/* for OpenSSL 1.0.1/1.0.2 (before 1.1.0) or LibreSSL */
++#if defined(HAVE_OPENSSL) && OPENSSL_VERSION_NUMBER < 0x1010000fL || \
++	defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x300000fL
++/* for OpenSSL 1.0.1/1.0.2 (before 1.1.0) or LibreSSL (before 3.5.0) */
+ 
+ /* mutexes for multi-threaded OpenSSL (see "man 3ssl threads" and example in crypto/threads/mttest.c) */
+ 
+-- 
+2.39.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
