Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3DCC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 20:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6C4E40393;
	Mon,  4 Apr 2022 20:20:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LSfR8U3nPMJp; Mon,  4 Apr 2022 20:20:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB7E840204;
	Mon,  4 Apr 2022 20:20:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4070E1BF232
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 291FF40299
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:19:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3iJkiU2azItr for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 20:19:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07B314028D
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 20:19:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 422A182DFC; Mon,  4 Apr 2022 20:09:48 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 21:47:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 581d397ec0c437aac06a9eaeca01de4ed9249faf
X-Git-Newrev: 7da45d9b635d93cc7c0339796462a8e401407402
X-Patchwork-Hint: ignore
Message-Id: <20220404200948.422A182DFC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ace: fix build with libressl
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

commit: https://git.buildroot.net/buildroot/commit/?id=7da45d9b635d93cc7c0339796462a8e401407402
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
