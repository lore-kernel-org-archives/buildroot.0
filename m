Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152ECEB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 13:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B87181A73;
	Sun, 16 Jul 2023 13:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B87181A73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8LNliZ-HbLxF; Sun, 16 Jul 2023 13:12:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87EB781992;
	Sun, 16 Jul 2023 13:12:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87EB781992
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B2FAF1BF279
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 13:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C11360812
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 13:12:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C11360812
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C5wedFeY7psk for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 13:12:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AB78606FF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7AB78606FF
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 13:12:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C164DA4C029A
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 15:12:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56006)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qL1Xh-0004sn-1R
 for buildroot@buildroot.org; Sun, 16 Jul 2023 15:12:05 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 15:12:05 +0200
Message-Id: <20230716131205.4009092-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689513125;
 bh=EXDxKdgjKPKVX8J2+2wTHeqb+6S8xdSejGM7Tj7XaHo=;
 h=From:To:Subject:Date:From;
 b=jOpLMzp8+o/XbhPfWUg9iL98CGVfeQocOtJwi0EJLyt4OsboRuk7ecVf9CyyGH9Qs
 exYBE1QGlWP/ukPldeHvngH/v5QPcZminC5tLxuiV01XKH5Ps7puLGPc7bVyVn0vE3
 UcOhJBFhOJajrI6zw+1LOFn6V4VMSNqFqWxUx36Q9AbXsLI+WmzJ0Qv3XZooRhWFOp
 Uf6+2ouD+9fAgiDFKAw/DUhyoZwR9wW9ZZS+fIMe4NtjCk/EIMwu70UI6iQKgwkcIc
 IXey0y7pfDAy/3Nz5hbCWzYkNgLXYZOne6d/Z7V9aU9JktPHDqzy9K7MWlN9SYplEO
 2BXHh+tRRox/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=jOpLMzp8
Subject: [Buildroot] [PATCH 1/1] package/resiprocate: fix build with OpenSSL
 3.x
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport upstream commits needed for compatibility with OpenSSL 3.x.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...t-disable-use-of-legacy-OpenSSL-memo.patch | 39 +++++++++++++++++++
 ...l-fix-typo-in-preprocessor-condition.patch | 26 +++++++++++++
 ...Security-cxx-remove-deprecated-OpenS.patch | 27 +++++++++++++
 3 files changed, 92 insertions(+)
 create mode 100644 package/resiprocate/0002-rutil-OpenSSLInit-disable-use-of-legacy-OpenSSL-memo.patch
 create mode 100644 package/resiprocate/0003-rutil-fix-typo-in-preprocessor-condition.patch
 create mode 100644 package/resiprocate/0004-resip-stack-ssl-Security-cxx-remove-deprecated-OpenS.patch

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
