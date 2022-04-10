Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BDDC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 15:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F7F260D90;
	Sun, 10 Apr 2022 15:40:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H-ua_Bm-A-ac; Sun, 10 Apr 2022 15:40:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58F9F6058B;
	Sun, 10 Apr 2022 15:40:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 651A11BF995
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 314D282512
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:38:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GR5e8Dl_YM2a for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 15:38:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68CBF825B9
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 15:38:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 92EBD83893; Sun, 10 Apr 2022 15:29:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 17:34:32 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 92da1d43290f88f8067580b985b44531a984f6a2
X-Git-Newrev: 195e1f1383808571aae7541e76419cdaab32e853
X-Patchwork-Hint: ignore
Message-Id: <20220410152900.92EBD83893@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/ace: fix build
 with libressl
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

commit: https://git.buildroot.net/buildroot/commit/?id=195e1f1383808571aae7541e76419cdaab32e853
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure with libressl raised since the addition
of the package in commit 3621918d1bc1ddc9312dd1cc8dec6db61e712fe2:

/home/autobuild/autobuild/instance-10/output-1/build/ace-7.0.6/ace/SSL/SSL_Asynch_BIO.cpp:174:7: error: 'BIO_get_init' was not declared in this scope; did you mean 'BIO_set_init'?
  174 |   if (BIO_get_init(pBIO) == 0 || p_stream == 0 || buf == 0 || len <= 0)
      |       ^~~~~~~~~~~~
      |       BIO_set_init

Fixes:
 - http://autobuild.buildroot.org/results/386afa88ac9e5e3bb65dddeabf610bb1e9bc4285

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 7da45d9b635d93cc7c0339796462a8e401407402)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/package/ace/0001-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch b/package/ace/0001-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch
new file mode 100644
index 0000000000..ad82c10172
--- /dev/null
+++ b/package/ace/0001-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch
@@ -0,0 +1,52 @@
+From e06cadc3b95a577e6a8bbc94f93dd063710c73a1 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 3 Apr 2022 15:25:49 +0200
+Subject: [PATCH] ACE/ace/SSL/SSL_Asynch_BIO.cpp: fix build with libressl
+
+Fix the following build failure with libressl:
+
+/home/autobuild/autobuild/instance-10/output-1/build/ace-7.0.6/ace/SSL/SSL_Asynch_BIO.cpp:174:7: error: 'BIO_get_init' was not declared in this scope; did you mean 'BIO_set_init'?
+  174 |   if (BIO_get_init(pBIO) == 0 || p_stream == 0 || buf == 0 || len <= 0)
+      |       ^~~~~~~~~~~~
+      |       BIO_set_init
+
+Fixes:
+ - http://autobuild.buildroot.org/results/386afa88ac9e5e3bb65dddeabf610bb1e9bc4285
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/DOCGroup/ACE_TAO/commit/e06cadc3b95a577e6a8bbc94f93dd063710c73a1]
+---
+ ACE/ace/SSL/SSL_Asynch_BIO.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/ace/SSL/SSL_Asynch_BIO.cpp b/ace/SSL/SSL_Asynch_BIO.cpp
+index a657d8a14e6f7..64aa14c6ab9a7 100644
+--- a/ace/SSL/SSL_Asynch_BIO.cpp
++++ b/ace/SSL/SSL_Asynch_BIO.cpp
+@@ -41,7 +41,7 @@ extern "C"
+ 
+ #define BIO_TYPE_ACE  ( 21 | BIO_TYPE_SOURCE_SINK )
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ static BIO_METHOD methods_ACE =
+   {
+     BIO_TYPE_ACE, // BIO_TYPE_PROXY_SERVER,
+@@ -68,14 +68,14 @@ static BIO_METHOD methods_ACE =
+ #else
+ static BIO_METHOD* methods_ACE;
+ # define BIO_set_num(b, val)
+-#endif /* OPENSSL_VERSION_NUMBER < 0x10100000L */
++#endif /* OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER) */
+ 
+ ACE_BEGIN_VERSIONED_NAMESPACE_DECL
+ 
+ BIO *
+ ACE_SSL_make_BIO (void * ssl_asynch_stream)
+ {
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+   BIO * const pBIO = BIO_new (&methods_ACE);
+ #else
+   if (!methods_ACE)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
