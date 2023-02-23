Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8199C64ED6
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 22:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57AB2405A0;
	Thu, 23 Feb 2023 22:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57AB2405A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H1MzfGcOKUqy; Thu, 23 Feb 2023 22:46:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98D8E4058E;
	Thu, 23 Feb 2023 22:46:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98D8E4058E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7ADD31BF338
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5640E4058E
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:46:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5640E4058E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UgHPsZscDymr for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 22:46:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89084403A4
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 22:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89084403A4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 777A3869F5; Thu, 23 Feb 2023 22:46:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 23:44:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6455558f6202663f21d8d72e430d73b13d5339cd
X-Git-Newrev: 26254066439596b88783b80a3a87f67570c0b0b5
X-Patchwork-Hint: ignore
Message-Id: <20230223224636.777A3869F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang: fix build with libressl >=
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

commit: https://git.buildroot.net/buildroot/commit/?id=26254066439596b88783b80a3a87f67570c0b0b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libressl >= 3.5.0 raised since bump
to version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

api_ng.c: In function 'EVP_CIPHER_CTX_copy':
api_ng.c:392:28: error: invalid use of incomplete typedef 'EVP_CIPHER_CTX' {aka 'const struct evp_cipher_ctx_st'}
  392 |     if ((in == NULL) || (in->cipher == NULL))
      |                            ^~

Fixes:
 - http://autobuild.buildroot.org/results/90f7365d8477d35fca452b7b3f38babba086375e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0003-crypto-Fixes-for-LibreSSL-3-5-0.patch     | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/erlang/0003-crypto-Fixes-for-LibreSSL-3-5-0.patch b/package/erlang/0003-crypto-Fixes-for-LibreSSL-3-5-0.patch
new file mode 100644
index 0000000000..84c75fef83
--- /dev/null
+++ b/package/erlang/0003-crypto-Fixes-for-LibreSSL-3-5-0.patch
@@ -0,0 +1,30 @@
+From 8e5170d79e387d7e898d948a78e0c70407a4030c Mon Sep 17 00:00:00 2001
+From: Hans Nilsson <hans@erlang.org>
+Date: Mon, 14 Feb 2022 15:51:35 +0100
+Subject: [PATCH] crypto: Fixes for LibreSSL 3.5.0
+
+[Retrieved (and backported) from:
+https://github.com/erlang/otp/commit/8e5170d79e387d7e898d948a78e0c70407a4030c]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/crypto/c_src/openssl_config.h | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/lib/crypto/c_src/openssl_config.h b/lib/crypto/c_src/openssl_config.h
+index 6fdd049fb30a..39e4b2d9d7c0 100644
+--- a/lib/crypto/c_src/openssl_config.h
++++ b/lib/crypto/c_src/openssl_config.h
+@@ -122,7 +122,14 @@
+ # endif
+ #endif
+ 
++#ifdef HAS_LIBRESSL
++# if LIBRESSL_VERSION_NUMBER >= 0x3050000fL
++#  define HAS_EVP_PKEY_CTX
++#  define HAVE_EVP_CIPHER_CTX_COPY
++# endif
++#endif
++
+ #ifndef HAS_LIBRESSL
+ # if OPENSSL_VERSION_NUMBER >= PACKED_OPENSSL_VERSION_PLAIN(1,0,0)
+ #  define HAS_EVP_PKEY_CTX
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
