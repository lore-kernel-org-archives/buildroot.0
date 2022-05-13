Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039D5C433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 22:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA7FA4037C;
	Fri, 13 May 2022 22:13:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i1tRxMryLurx; Fri, 13 May 2022 22:13:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C789940207;
	Fri, 13 May 2022 22:13:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 051B61BF868
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1063E40966
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L1iGzi7RgwjE for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 22:11:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 403B3405E0
 for <buildroot@buildroot.org>; Fri, 13 May 2022 22:11:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 075FE85E2B; Fri, 13 May 2022 22:00:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 23:54:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1195486b5828f734424554e62784e0e2d0f776dd
X-Git-Newrev: f7996b6c64aaecd87315cb25cc1805dbc3fb67a4
X-Patchwork-Hint: ignore
Message-Id: <20220513220045.075FE85E2B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sngrep: fix build with libressl >=
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f7996b6c64aaecd87315cb25cc1805dbc3fb67a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

capture_openssl.c: In function 'P_hash':
capture_openssl.c:101:18: error: storage size of 'hm' isn't known
  101 |         HMAC_CTX hm;
      |                  ^~

Fixes:
 - http://autobuild.buildroot.org/results/f1e8cdb3ac35a30055ab79d41e6cc038e5339c37

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...e_openssl.h-fix-build-with-libressl-3.5.0.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/sngrep/0001-src-capture_openssl.h-fix-build-with-libressl-3.5.0.patch b/package/sngrep/0001-src-capture_openssl.h-fix-build-with-libressl-3.5.0.patch
new file mode 100644
index 0000000000..7dbb29ab00
--- /dev/null
+++ b/package/sngrep/0001-src-capture_openssl.h-fix-build-with-libressl-3.5.0.patch
@@ -0,0 +1,40 @@
+From 4e1406ad0df370ff8bf1d3a81aaadbb1cad2d761 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 29 Apr 2022 18:53:45 +0200
+Subject: [PATCH] src/capture_openssl.h: fix build with libressl >= 3.5.0
+
+Fix the following build failure with libressl >= 3.5.0:
+
+capture_openssl.c: In function 'P_hash':
+capture_openssl.c:101:18: error: storage size of 'hm' isn't known
+  101 |         HMAC_CTX hm;
+      |                  ^~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/f1e8cdb3ac35a30055ab79d41e6cc038e5339c37
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/irontec/sngrep/commit/4e1406ad0df370ff8bf1d3a81aaadbb1cad2d761]
+---
+ src/capture_openssl.h | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/capture_openssl.h b/src/capture_openssl.h
+index 780de494..1f87a5cd 100644
+--- a/src/capture_openssl.h
++++ b/src/capture_openssl.h
+@@ -67,10 +67,11 @@
+ #endif
+ 
+ /* LibreSSL declares OPENSSL_VERSION_NUMBER == 2.0 but does not include most
+- * changes from OpenSSL >= 1.1 (new functions, macros, deprecations, ...)
++ * changes from OpenSSL >= 1.1 (new functions, macros, deprecations, ...) until
++ * version 3.5.0
+  */
+ #if defined(LIBRESSL_VERSION_NUMBER)
+-#define MODSSL_USE_OPENSSL_PRE_1_1_API (1)
++#define MODSSL_USE_OPENSSL_PRE_1_1_API (LIBRESSL_VERSION_NUMBER < 0x30500000L)
+ #else
+ #define MODSSL_USE_OPENSSL_PRE_1_1_API (OPENSSL_VERSION_NUMBER < 0x10100000L)
+ #endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
