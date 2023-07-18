Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E1EEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 21:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB23A417A7;
	Tue, 18 Jul 2023 21:22:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB23A417A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TUfxti69fOZB; Tue, 18 Jul 2023 21:22:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 705BA417A9;
	Tue, 18 Jul 2023 21:22:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 705BA417A9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4769B1BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B1E281DE7
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:22:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B1E281DE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S51W2qwVN_Vh for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 21:22:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18B9981A64
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 21:22:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18B9981A64
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01ED987463; Tue, 18 Jul 2023 21:22:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Jul 2023 23:21:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66d38cfcfdc1b09c7c1e80c71a9f8a7b7558a47b
X-Git-Newrev: 70a40164122050877c59cbbb8f4be389b95e269e
X-Patchwork-Hint: ignore
Message-Id: <20230718212202.01ED987463@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/resiprocate: fix build with
 OpenSSL 3.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=70a40164122050877c59cbbb8f4be389b95e269e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport upstream commits needed for compatibility with OpenSSL 3.x.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...SLInit-disable-use-of-legacy-OpenSSL-memo.patch | 39 ++++++++++++++++++++++
 ...-rutil-fix-typo-in-preprocessor-condition.patch | 26 +++++++++++++++
 ...-ssl-Security-cxx-remove-deprecated-OpenS.patch | 27 +++++++++++++++
 3 files changed, 92 insertions(+)

diff --git a/package/resiprocate/0002-rutil-OpenSSLInit-disable-use-of-legacy-OpenSSL-memo.patch b/package/resiprocate/0002-rutil-OpenSSLInit-disable-use-of-legacy-OpenSSL-memo.patch
new file mode 100644
index 0000000000..fad1c2ef29
--- /dev/null
+++ b/package/resiprocate/0002-rutil-OpenSSLInit-disable-use-of-legacy-OpenSSL-memo.patch
@@ -0,0 +1,39 @@
+From e7c33f4e078e6e5dfa7dea796fa4ffb88f48a37a Mon Sep 17 00:00:00 2001
+From: Daniel Pocock <daniel@pocock.pro>
+Date: Thu, 4 Aug 2022 10:55:30 +0200
+Subject: [PATCH] rutil: OpenSSLInit: disable use of legacy OpenSSL memory leak
+ checking with OpenSSL 3.0 and later
+
+Upstream:
+https://github.com/resiprocate/resiprocate/commit/e7c33f4e078e6e5dfa7dea796fa4ffb88f48a37a
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ rutil/ssl/OpenSSLInit.cxx | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/rutil/ssl/OpenSSLInit.cxx b/rutil/ssl/OpenSSLInit.cxx
+index d42486f96b..65afed09fe 100644
+--- a/rutil/ssl/OpenSSLInit.cxx
++++ b/rutil/ssl/OpenSSLInit.cxx
+@@ -69,14 +69,19 @@ OpenSSLInit::OpenSSLInit()
+ 	CRYPTO_set_dynlock_lock_callback(::resip_OpenSSLInit_dynLockFunction);
+ #endif
+ 
++/* The OpenSSL memory leak checking has been deprecated since
++   OpenSSL v3.0.  OpenSSL developers recommend that we rely
++   on modern compilers to provide the same functionality. */
+ #if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
+ 	CRYPTO_malloc_debug_init();
+ 	CRYPTO_set_mem_debug_options(V_CRYPTO_MDEBUG_ALL);
+-#else
++#elsif (OPENSSL_VERSION_NUMBER < 0x30000000L)
+ 	CRYPTO_set_mem_debug(1);
+ #endif
+ 
++#if (OPENSSL_VERSION_NUMBER < 0x30000000L) || defined(LIBRESSL_VERSION_NUMBER)
+ 	CRYPTO_mem_ctrl(CRYPTO_MEM_CHECK_ON);
++#endif
+ 
+ 	SSL_library_init();
+ 	SSL_load_error_strings();
diff --git a/package/resiprocate/0003-rutil-fix-typo-in-preprocessor-condition.patch b/package/resiprocate/0003-rutil-fix-typo-in-preprocessor-condition.patch
new file mode 100644
index 0000000000..f7ff4d2a57
--- /dev/null
+++ b/package/resiprocate/0003-rutil-fix-typo-in-preprocessor-condition.patch
@@ -0,0 +1,26 @@
+From 53302195c339dfaa104788a50aa900a48dbff777 Mon Sep 17 00:00:00 2001
+From: Andrey Semashev <andrey.semashev@gmail.com>
+Date: Sat, 10 Sep 2022 12:15:06 +0200
+Subject: [PATCH] rutil: fix typo in preprocessor condition
+
+Upstream:
+https://github.com/resiprocate/resiprocate/commit/53302195c339dfaa104788a50aa900a48dbff777
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ rutil/ssl/OpenSSLInit.cxx | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/rutil/ssl/OpenSSLInit.cxx b/rutil/ssl/OpenSSLInit.cxx
+index 65afed09fe..0d87a9f9d8 100644
+--- a/rutil/ssl/OpenSSLInit.cxx
++++ b/rutil/ssl/OpenSSLInit.cxx
+@@ -75,7 +75,7 @@ OpenSSLInit::OpenSSLInit()
+ #if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
+ 	CRYPTO_malloc_debug_init();
+ 	CRYPTO_set_mem_debug_options(V_CRYPTO_MDEBUG_ALL);
+-#elsif (OPENSSL_VERSION_NUMBER < 0x30000000L)
++#elif (OPENSSL_VERSION_NUMBER < 0x30000000L)
+ 	CRYPTO_set_mem_debug(1);
+ #endif
+ 
diff --git a/package/resiprocate/0004-resip-stack-ssl-Security-cxx-remove-deprecated-OpenS.patch b/package/resiprocate/0004-resip-stack-ssl-Security-cxx-remove-deprecated-OpenS.patch
new file mode 100644
index 0000000000..eaa5ae87cf
--- /dev/null
+++ b/package/resiprocate/0004-resip-stack-ssl-Security-cxx-remove-deprecated-OpenS.patch
@@ -0,0 +1,27 @@
+From 88f98702d908549d888aa7f0ee1b0763e09662b1 Mon Sep 17 00:00:00 2001
+From: Daniel Pocock <daniel@pocock.pro>
+Date: Thu, 4 Aug 2022 11:09:43 +0200
+Subject: [PATCH] resip/stack: ssl/Security.cxx: remove deprecated OpenSSL
+ ERR_GET_FUNC, not required
+
+Upstream:
+https://github.com/resiprocate/resiprocate/commit/88f98702d908549d888aa7f0ee1b0763e09662b1
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ resip/stack/ssl/Security.cxx | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/resip/stack/ssl/Security.cxx b/resip/stack/ssl/Security.cxx
+index 75dc6d838a..23c2ebbf09 100644
+--- a/resip/stack/ssl/Security.cxx
++++ b/resip/stack/ssl/Security.cxx
+@@ -967,7 +967,7 @@ BaseSecurity::addPrivateKeyPEM( PEMType type,
+          char buffer[120];
+          unsigned long err = ERR_get_error();
+          ERR_error_string(err, buffer);
+-         if(ERR_GET_LIB(err) == ERR_LIB_EVP && ERR_GET_FUNC(err) == EVP_F_EVP_DECRYPTFINAL_EX && ERR_GET_REASON(err) == EVP_R_BAD_DECRYPT)
++         if(ERR_GET_LIB(err) == ERR_LIB_EVP && ERR_GET_REASON(err) == EVP_R_BAD_DECRYPT)
+          {
+             ErrLog(<< "Could not read private key (error=" << buffer << ") - likely incorrect password provided, may load correctly when transports are added with appropriate password");
+          }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
