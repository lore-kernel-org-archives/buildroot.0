Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD5FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 09:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B560409B4;
	Mon, 11 Apr 2022 09:48:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PwdPbH47ViGH; Mon, 11 Apr 2022 09:48:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D4234098A;
	Mon, 11 Apr 2022 09:48:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 18B611BF44A
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 09:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA946606BF
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 09:46:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oBTXujOzGGpa for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 09:46:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB14460C2D
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 09:46:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4AB4A83984; Mon, 11 Apr 2022 09:36:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Apr 2022 11:45:25 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 117b6c1161ffff1574691bf0ff8b9e79e397c080
X-Git-Newrev: c60a3579855b31718e6bd2717754d4aa869ae009
X-Patchwork-Hint: ignore
Message-Id: <20220411093637.4AB4A83984@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/trousers: fix
 build with libressl >= 2.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c60a3579855b31718e6bd2717754d4aa869ae009
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure with libressl >= 2.7.0:

crypto/openssl/rsa.c:43:1: error: static declaration of 'RSA_set0_key' follows non-static declaration
   43 | RSA_set0_key(RSA *r, BIGNUM *n, BIGNUM *e, BIGNUM *d)
      | ^~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/607131255453da2dc0dab20a24264b3e74001525

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2d4a9308d7b16e4fd613a9070a97c9effa055b4b)
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
