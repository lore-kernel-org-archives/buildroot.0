Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F34C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 07:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9C4B83323;
	Mon, 11 Apr 2022 07:11:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id URezZfLcqidv; Mon, 11 Apr 2022 07:11:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBBC882F76;
	Mon, 11 Apr 2022 07:11:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E21051BF2B9
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 07:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEF6F409B1
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 07:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wx03hiYU707N for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 07:11:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8143C4157C
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 07:11:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 35B7A83931; Mon, 11 Apr 2022 07:01:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Apr 2022 09:10:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2364dafa70245a838f6bfbb95dfc2992e0750a01
X-Git-Newrev: 2d4a9308d7b16e4fd613a9070a97c9effa055b4b
X-Patchwork-Hint: ignore
Message-Id: <20220411070158.35B7A83931@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/trousers: fix build with libressl
 >= 2.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d4a9308d7b16e4fd613a9070a97c9effa055b4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libressl >= 2.7.0:

crypto/openssl/rsa.c:43:1: error: static declaration of 'RSA_set0_key' follows non-static declaration
   43 | RSA_set0_key(RSA *r, BIGNUM *n, BIGNUM *e, BIGNUM *d)
      | ^~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/607131255453da2dc0dab20a24264b3e74001525

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0003-Fix-build-with-LibreSSL-2-7.patch         | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/trousers/0003-Fix-build-with-LibreSSL-2-7.patch b/package/trousers/0003-Fix-build-with-LibreSSL-2-7.patch
new file mode 100644
index 0000000000..65da979f22
--- /dev/null
+++ b/package/trousers/0003-Fix-build-with-LibreSSL-2-7.patch
@@ -0,0 +1,24 @@
+Fix build with LibreSSL 2.7 
+
+LibreSSL 2.7 implemented OpenSSL 1.1 API
+
+See also: https://reviews.freebsd.org/D14849#change-KhYbRXBMIBod
+
+Cheers,
+Bernard Spil (brnrd@FreeBSD.org)
+
+[Retrieved (and backported) from:
+https://sourceforge.net/p/trousers/bugs/234]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+--- ./src/trspi/crypto/openssl/rsa.c.orig	2016-11-23 12:26:19 UTC
++++ ./src/trspi/crypto/openssl/rsa.c
+@@ -38,7 +38,7 @@
+ #define DEBUG_print_openssl_errors()
+ #endif
+ 
+-#if (OPENSSL_VERSION_NUMBER < 0x10100001L) || defined(LIBRESSL_VERSION_NUMBER)
++#if (OPENSSL_VERSION_NUMBER < 0x10100001L) || (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x20700000L)
+ static int
+ RSA_set0_key(RSA *r, BIGNUM *n, BIGNUM *e, BIGNUM *d)
+ {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
