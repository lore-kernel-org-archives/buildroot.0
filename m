Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA22DC4828F
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 18:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45E99401D6;
	Sat,  3 Feb 2024 18:13:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45E99401D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3aRpV-PRwoTR; Sat,  3 Feb 2024 18:13:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E5DE40242;
	Sat,  3 Feb 2024 18:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E5DE40242
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A07F1BF2F8
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 10:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 277CC41FA4
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 10:44:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ACxe80kLpyR7 for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 10:44:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AAFE041F9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAFE041F9F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAFE041F9F
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 10:43:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5251B8679D; Sat,  3 Feb 2024 10:43:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 3 Feb 2024 11:38:11 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: df57de12f9f749c6575db8e05592a334646c2aa6
X-Git-Newrev: 3c2621bb60178904ad7914637743a63104173655
X-Patchwork-Hint: ignore
Message-Id: <20240203104359.5251B8679D@busybox.osuosl.org>
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 spf=fail smtp.mailfrom=osuosl.org
Subject: [Buildroot] [git commit branch/2023.02.x] package/libuwsc: fix
 wolfssl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c2621bb60178904ad7914637743a63104173655
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Commit 1567fbd72d4b547f70a7509247bf9abb73ab58e3 didn't fully fix the
wolfssl build failure because the include on wolfssl/options.h was still
missing:

/home/autobuild/autobuild/instance-6/output-1/build/libuwsc-3.3.5/src/ssl.c:62:5: error: unknown type name 'SSL_CTX'
   62 |     SSL_CTX *ctx;
      |     ^~~~~~~

While at it, add upstream tag to patches

Fixes:
 - http://autobuild.buildroot.org/results/edc49cce5b1f456d980841f4c315e7cd784b1561

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e874fd08e01a8d543520f867d95ae8a6a9fa242e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-CMakeLists.txt-add-BUILD_EXAMPLE.patch    |  2 +-
 package/libuwsc/0002-fix-bad-indentation.patch     |  3 +-
 .../libuwsc/0003-src-ssl.c-fix-wolfssl-build.patch | 37 ++++++++++++++++++++++
 3 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/package/libuwsc/0001-CMakeLists.txt-add-BUILD_EXAMPLE.patch b/package/libuwsc/0001-CMakeLists.txt-add-BUILD_EXAMPLE.patch
index 197dd1de0f..87f343a9d9 100644
--- a/package/libuwsc/0001-CMakeLists.txt-add-BUILD_EXAMPLE.patch
+++ b/package/libuwsc/0001-CMakeLists.txt-add-BUILD_EXAMPLE.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] CMakeLists.txt: add BUILD_EXAMPLE
 Allow the user to disable example
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[yann.morin.1998@free.fr: backport from upstream]
+Upstream: https://github.com/zhaojh329/libuwsc/commit/bb71b21eb9407479ad729b3c858b0fc350fae335
 Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 ---
  CMakeLists.txt | 6 +++++-
diff --git a/package/libuwsc/0002-fix-bad-indentation.patch b/package/libuwsc/0002-fix-bad-indentation.patch
index f33f944d06..77cae92cf2 100644
--- a/package/libuwsc/0002-fix-bad-indentation.patch
+++ b/package/libuwsc/0002-fix-bad-indentation.patch
@@ -5,8 +5,7 @@ Subject: [PATCH] fix bad indentation
 
 Fixes error with GCC11.
 
-[Retrieved from:
-https://github.com/zhaojh329/libuwsc/commit/8cb416140741a596235b8acc46b2b119b13ebfab]
+Upstream: https://github.com/zhaojh329/libuwsc/commit/8cb416140741a596235b8acc46b2b119b13ebfab
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  src/lua/uwsc_lua.c | 2 +-
diff --git a/package/libuwsc/0003-src-ssl.c-fix-wolfssl-build.patch b/package/libuwsc/0003-src-ssl.c-fix-wolfssl-build.patch
new file mode 100644
index 0000000000..4c652a63c2
--- /dev/null
+++ b/package/libuwsc/0003-src-ssl.c-fix-wolfssl-build.patch
@@ -0,0 +1,37 @@
+From 1c3579e99163a13d622c3ef44088c23d5eea306d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 14 Jan 2024 16:44:13 +0100
+Subject: [PATCH] src/ssl.c: fix wolfssl build
+
+wolfssl/options.h must also be included by clients to avoid the
+following build failure because OPENSSL_ALL won't be defined:
+
+/home/autobuild/autobuild/instance-6/output-1/build/libuwsc-3.3.5/src/ssl.c:62:5: error: unknown type name 'SSL_CTX'
+   62 |     SSL_CTX *ctx;
+      |     ^~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/edc49cce5b1f456d980841f4c315e7cd784b1561
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: N/A (already fixed by
+https://github.com/zhaojh329/ssl/commit/c40ebcd7b4277321acbbd4b00b4b10fd363c7a97)
+---
+ src/ssl.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/ssl.c b/src/ssl.c
+index 3640022..6a3d250 100644
+--- a/src/ssl.c
++++ b/src/ssl.c
+@@ -54,6 +54,7 @@ struct uwsc_ssl_ctx {
+ #include <openssl/err.h>
+ #elif UWSC_HAVE_WOLFSSL
+ #define WC_NO_HARDEN
++#include <wolfssl/options.h>
+ #include <wolfssl/openssl/ssl.h>
+ #include <wolfssl/openssl/err.h>
+ #endif
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
