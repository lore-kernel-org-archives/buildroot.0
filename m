Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DCCC433EF
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 18:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 360DC40AEC;
	Sun, 15 May 2022 18:22:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P9JxPFIVTvDw; Sun, 15 May 2022 18:22:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AD2440AA6;
	Sun, 15 May 2022 18:22:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D3C321BF424
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 18:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C223A4099A
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 18:22:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bg1gOHiQqCT8 for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 18:22:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0AFD40611
 for <buildroot@buildroot.org>; Sun, 15 May 2022 18:22:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7328A85E9F; Sun, 15 May 2022 18:11:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 May 2022 20:19:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1dcf18c8d227067bea58e12d30324515e29193b
X-Git-Newrev: 5bd97b1c6d6f446a3ed621fd1d8a2fc6179ab696
X-Patchwork-Hint: ignore
Message-Id: <20220515181104.7328A85E9F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/git-crypt: fix build with libressl
 >= 3.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=5bd97b1c6d6f446a3ed621fd1d8a2fc6179ab696
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

crypto-openssl-10.cpp:78:18: error: field 'ctx' has incomplete type 'HMAC_CTX' {aka 'hmac_ctx_st'}
   78 |         HMAC_CTX ctx;
      |                  ^~~

Fixes:
 - http://autobuild.buildroot.org/results/98747d470c2ad59280934e160d24bd3fdad1503c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-fix-build-with-libressl-3.5.0.patch       | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/git-crypt/0001-fix-build-with-libressl-3.5.0.patch b/package/git-crypt/0001-fix-build-with-libressl-3.5.0.patch
new file mode 100644
index 0000000000..7daaf9c8fc
--- /dev/null
+++ b/package/git-crypt/0001-fix-build-with-libressl-3.5.0.patch
@@ -0,0 +1,56 @@
+From c21cde9010175e2355df17d4e81fedd6020603f8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 14 May 2022 00:03:51 +0200
+Subject: [PATCH] fix build with libressl >= 3.5.0
+
+Fix the following build failure with libressl >= 3.5.0:
+
+crypto-openssl-10.cpp:78:18: error: field 'ctx' has incomplete type 'HMAC_CTX' {aka 'hmac_ctx_st'}
+   78 |         HMAC_CTX ctx;
+      |                  ^~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/98747d470c2ad59280934e160d24bd3fdad1503c
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/AGWA/git-crypt/pull/249]
+---
+ crypto-openssl-10.cpp | 4 +++-
+ crypto-openssl-11.cpp | 4 +++-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/crypto-openssl-10.cpp b/crypto-openssl-10.cpp
+index f0f2c53..a7a5d52 100644
+--- a/crypto-openssl-10.cpp
++++ b/crypto-openssl-10.cpp
+@@ -29,8 +29,10 @@
+  */
+ 
+ #include <openssl/opensslconf.h>
++#include <openssl/opensslv.h>
+ 
+-#if !defined(OPENSSL_API_COMPAT)
++#if !defined(OPENSSL_API_COMPAT) && \
++	!(defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER >= 0x30500000L)
+ 
+ #include "crypto.hpp"
+ #include "key.hpp"
+diff --git a/crypto-openssl-11.cpp b/crypto-openssl-11.cpp
+index adf03bb..32c2483 100644
+--- a/crypto-openssl-11.cpp
++++ b/crypto-openssl-11.cpp
+@@ -29,8 +29,10 @@
+  */
+ 
+ #include <openssl/opensslconf.h>
++#include <openssl/opensslv.h>
+ 
+-#if defined(OPENSSL_API_COMPAT)
++#if defined(OPENSSL_API_COMPAT) || \
++	(defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER >= 0x30500000L)
+ 
+ #include "crypto.hpp"
+ #include "key.hpp"
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
