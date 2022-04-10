Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79269C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 20:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D79382A6C;
	Sun, 10 Apr 2022 20:53:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ji95xYWfICtX; Sun, 10 Apr 2022 20:53:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C28E82730;
	Sun, 10 Apr 2022 20:53:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BD97E1BF3E1
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 20:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABF57415A7
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 20:53:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hoq811SJ2UPK for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 20:53:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4006409BA
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 20:53:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 72B0283914; Sun, 10 Apr 2022 20:43:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 22:51:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 73dc2eef2dc40b78e732872b26eee0bcea1087d1
X-Git-Newrev: 04164b81e76e29fb9482245e808b46af2aa67bc6
X-Patchwork-Hint: ignore
Message-Id: <20220410204351.72B0283914@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tvheadend: fix build with libressl
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
Content-Type: multipart/mixed; boundary="===============6693498224240225407=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6693498224240225407==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=04164b81e76e29fb9482245e808b46af2aa67bc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libressl:

utils.c:(.text+0x1614): undefined reference to `EVP_sha512_256'

Fixes:
 - http://autobuild.buildroot.org/results/cb18f6533806f3729f9718bdcc719384be375b66

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../tvheadend/0002-fix-build-with-libressl.patch   | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/tvheadend/0002-fix-build-with-libressl.patch b/package/tvheadend/0002-fix-build-with-libressl.patch
new file mode 100644
index 0000000000..c99dacdbeb
--- /dev/null
+++ b/package/tvheadend/0002-fix-build-with-libressl.patch
@@ -0,0 +1,47 @@
+From ea65f8025a9124cd7353b21f167968bdb897306f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 6 Apr 2022 21:54:25 +0200
+Subject: [PATCH] fix build with libressl
+
+Fix the following build failure with libressl raised since
+https://github.com/tvheadend/tvheadend/commit/e61acb8ad4a3411f4e7acfd8133d222299f6d47e:
+
+utils.c:(.text+0x1614): undefined reference to `EVP_sha512_256'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/cb18f6533806f3729f9718bdcc719384be375b66
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/tvheadend/tvheadend/commit/ea65f8025a9124cd7353b21f167968bdb897306f]
+---
+ src/http.c  | 2 +-
+ src/utils.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/http.c b/src/http.c
+index 06d5e76172..72a498317c 100644
+--- a/src/http.c
++++ b/src/http.c
+@@ -412,7 +412,7 @@ http_send_header(http_connection_t *hc, int rc, const char *content,
+         http_auth_header(&hdrs, realm,
+                          config.http_auth_algo == HTTP_AUTH_ALGO_SHA256 ?
+                            "SHA-256" :
+-#if OPENSSL_VERSION_NUMBER >= 0x1010101fL
++#if OPENSSL_VERSION_NUMBER >= 0x1010101fL && !defined(LIBRESSL_VERSION_NUMBER)
+                              "SHA-512-256",
+ #else
+                              "SHA-256",
+diff --git a/src/utils.c b/src/utils.c
+index d8ffe4ad5c..eecb10e116 100644
+--- a/src/utils.c
++++ b/src/utils.c
+@@ -616,7 +616,7 @@ sha256sum ( const char *str, int lowercase )
+ char *
+ sha512sum256 ( const char *str, int lowercase )
+ {
+-#if OPENSSL_VERSION_NUMBER >= 0x1010101fL
++#if OPENSSL_VERSION_NUMBER >= 0x1010101fL && !defined(LIBRESSL_VERSION_NUMBER)
+   return openssl_hash_hexstr(str, lowercase, EVP_sha512_256(), 32);
+ #else
+   return NULL;

--===============6693498224240225407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6693498224240225407==--
