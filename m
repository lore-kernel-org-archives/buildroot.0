Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E2BC7618A
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 08:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CE70416E5;
	Fri, 17 Mar 2023 08:37:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CE70416E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pcoNK3Fz-Y4O; Fri, 17 Mar 2023 08:37:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10B91416CE;
	Fri, 17 Mar 2023 08:37:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10B91416CE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 05DBE1BF982
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 08:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E234A408BB
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 08:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E234A408BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ui2NSzohd8VS for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 08:36:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09688408BA
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 08:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09688408BA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC1C48747A; Fri, 17 Mar 2023 08:36:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 17 Mar 2023 09:29:24 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 770c8f80adc3aa45c42a30c4bd3cdf79d05ec212
X-Git-Newrev: babb3aca01e0c24149a240a5c4705e3198670fc6
X-Patchwork-Hint: ignore
Message-Id: <20230317083632.EC1C48747A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/ace: fix build
 with libressl >= 3.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=babb3aca01e0c24149a240a5c4705e3198670fc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

/tmp/instance-17/output-1/build/ace-7.0.6/ace/SSL/SSL_Asynch_BIO.cpp:45:19: error: variable 'BIO_METHOD methods_ACE' has initializer but incomplete type
   45 | static BIO_METHOD methods_ACE =
      |                   ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/7f40d6dde03134238151c248fbbd66e4713546cb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 4ec39bad8062878cebd6dc95b712e33209b4e585)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/ace/0002-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch b/package/ace/0002-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch
new file mode 100644
index 0000000000..4f9fde5579
--- /dev/null
+++ b/package/ace/0002-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch
@@ -0,0 +1,56 @@
+From 82b139f921ddb549c1bd236030bbc86e314852b3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 21 Feb 2023 14:20:11 +0100
+Subject: [PATCH] ACE/ace/SSL/SSL_Asynch_BIO.cpp: fix build with libressl >=
+ 3.5.0
+
+Fix the following build failure with libressl >= 3.5.0:
+
+/tmp/instance-17/output-1/build/ace-7.0.6/ace/SSL/SSL_Asynch_BIO.cpp:45:19: error: variable 'BIO_METHOD methods_ACE' has initializer but incomplete type
+   45 | static BIO_METHOD methods_ACE =
+      |                   ^~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/7f40d6dde03134238151c248fbbd66e4713546cb
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/DOCGroup/ACE_TAO/pull/2053]
+---
+ ACE/ace/SSL/SSL_Asynch_BIO.cpp | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/ace/SSL/SSL_Asynch_BIO.cpp b/ace/SSL/SSL_Asynch_BIO.cpp
+index 0faa775fc0..5543598873 100644
+--- a/ace/SSL/SSL_Asynch_BIO.cpp
++++ b/ace/SSL/SSL_Asynch_BIO.cpp
+@@ -41,7 +41,8 @@ extern "C"
+ 
+ #define BIO_TYPE_ACE  ( 21 | BIO_TYPE_SOURCE_SINK )
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
++	(defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L)
+ static BIO_METHOD methods_ACE =
+   {
+     BIO_TYPE_ACE, // BIO_TYPE_PROXY_SERVER,
+@@ -68,14 +69,15 @@ static BIO_METHOD methods_ACE =
+ #else
+ static BIO_METHOD* methods_ACE;
+ # define BIO_set_num(b, val)
+-#endif /* OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER) */
++#endif /* OPENSSL_VERSION_NUMBER < 0x10100000L || (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L) */
+ 
+ ACE_BEGIN_VERSIONED_NAMESPACE_DECL
+ 
+ BIO *
+ ACE_SSL_make_BIO (void * ssl_asynch_stream)
+ {
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
++	(defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L)
+   BIO * const pBIO = BIO_new (&methods_ACE);
+ #else
+   if (!methods_ACE)
+-- 
+2.39.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
