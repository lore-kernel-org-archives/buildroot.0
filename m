Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D5EC433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 09:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F5D441333;
	Fri, 27 May 2022 09:39:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iCDe-N6M9ZxX; Fri, 27 May 2022 09:39:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A090641328;
	Fri, 27 May 2022 09:39:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 143061BF3B0
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 707DA428B8
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:38:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NawC0OzYsUqf for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 09:38:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A12DD42718
 for <buildroot@buildroot.org>; Fri, 27 May 2022 09:38:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9EA8A8662F; Fri, 27 May 2022 09:27:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 10:52:41 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d6cc9524a44e98f935ae7184a5d21da96f57ba57
X-Git-Newrev: 1e777a9f95b9a349c7d8d428b25b548a84aa3159
X-Patchwork-Hint: ignore
Message-Id: <20220527092724.9EA8A8662F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libeXosip2: fix
 build with libressl
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e777a9f95b9a349c7d8d428b25b548a84aa3159
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure with libressl >= 3.4.1 raised since
commit 25ef2c26dabaf1553f1724214a4fa5e3ce48dfc8:

In file included from eXtl_dtls.c:82:
/home/autobuild/autobuild/instance-4/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/openssl/ssl.h:1272:6: note: previous declaration of 'SSL_set0_rbio' was here
 1272 | void SSL_set0_rbio(SSL *s, BIO *rbio);
      |      ^~~~~~~~~~~~~
eXtl_dtls.c: In function 'SSL_set0_rbio':
eXtl_dtls.c:108:17: error: invalid use of incomplete typedef 'SSL' {aka 'struct ssl_st'}
  108 |   BIO_free_all(s->rbio);
      |                 ^~

Fixes:
 - http://autobuild.buildroot.org/results/dfafdbf71b31fbda1b5ba491ac35239af4a20aa2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 034928ec5c541b7584424d230deefe699f421ce8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...eXtl_dtls.c-fix-build-with-libressl-3.4.1.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/libeXosip2/0001-src-eXtl_dtls.c-fix-build-with-libressl-3.4.1.patch b/package/libeXosip2/0001-src-eXtl_dtls.c-fix-build-with-libressl-3.4.1.patch
new file mode 100644
index 0000000000..0b4be43b6c
--- /dev/null
+++ b/package/libeXosip2/0001-src-eXtl_dtls.c-fix-build-with-libressl-3.4.1.patch
@@ -0,0 +1,43 @@
+From 4201c0ff3fd75e09025d515c427f85f9fec89621 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 5 Apr 2022 22:27:35 +0200
+Subject: [PATCH] src/eXtl_dtls.c: fix build with libressl >= 3.4.1
+
+Fix the following build failure with libressl >= 3.4.1 which provides
+SSL_set0_rbio() since
+https://github.com/libressl-portable/openbsd/commit/c99939f9665a9c3c648682b4987df46600b70efc:
+
+In file included from eXtl_dtls.c:82:
+/home/autobuild/autobuild/instance-4/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/openssl/ssl.h:1272:6: note: previous declaration of 'SSL_set0_rbio' was here
+ 1272 | void SSL_set0_rbio(SSL *s, BIO *rbio);
+      |      ^~~~~~~~~~~~~
+eXtl_dtls.c: In function 'SSL_set0_rbio':
+eXtl_dtls.c:108:17: error: invalid use of incomplete typedef 'SSL' {aka 'struct ssl_st'}
+  108 |   BIO_free_all(s->rbio);
+      |                 ^~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/dfafdbf71b31fbda1b5ba491ac35239af4a20aa2
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to amoizard@antisip.com]
+---
+ src/eXtl_dtls.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/eXtl_dtls.c b/src/eXtl_dtls.c
+index 07c0dc2..d0bd7dc 100644
+--- a/src/eXtl_dtls.c
++++ b/src/eXtl_dtls.c
+@@ -102,7 +102,7 @@
+ #define RANDOM "random.pem"
+ #define DHFILE "dh1024.pem"
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x3040100L)
+ 
+ static void SSL_set0_rbio(SSL *s, BIO *rbio) {
+   BIO_free_all(s->rbio);
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
