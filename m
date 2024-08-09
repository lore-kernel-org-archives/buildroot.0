Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BE3C52D7C
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 19:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FA4E8448C;
	Fri,  9 Aug 2024 19:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PPTT3S8v58EK; Fri,  9 Aug 2024 19:37:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8573844E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8573844E2;
	Fri,  9 Aug 2024 19:37:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A8031BF990
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 19:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D07918448D
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 19:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39yTnc9uxWpI for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 19:37:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46A558448C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46A558448C
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 19:37:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 30B1F84E1A; Fri,  9 Aug 2024 19:37:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 9 Aug 2024 21:35:01 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: be5c48e20cb5022ae38c404906587cc54e85e25b
X-Git-Newrev: a3ec7bb68fd0f650f4c8aa2d78ad67d0592d66f6
X-Patchwork-Hint: ignore
Message-Id: <20240809193706.30B1F84E1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/cdrkit: fix build
 with gcc 14.x
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
Content-Type: multipart/mixed; boundary="===============1060214793891122075=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1060214793891122075==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a3ec7bb68fd0f650f4c8aa2d78ad67d0592d66f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

This commit adds a patch, which is already in Debian, fixing the build
with gcc 14.x:

/home/autobuild/autobuild/instance-7/output-1/build/host-cdrkit-1.1.11/genisoimage/genisoimage.c:1509:17: error: implicit declaration of function 'parse_checksum_algo' [-Wimplicit-function-declaration]
 1509 |             if (parse_checksum_algo(optarg, &checksum_algo_iso))
      |                 ^~~~~~~~~~~~~~~~~~~
make[3]: *** [genisoimage/CMakeFiles/genisoimage.dir/build.make:76: genisoimage/CMakeFiles/genisoimage.dir/genisoimage.o] Error 1

Fixes:

  http://autobuild.buildroot.net/results/a9cca8da22774ecafdbb382697aae71f78e348f4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0a0de4d86cd1fbeb5ff0439259b297756b3a5d98)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../cdrkit/0004-Add-missing-header-includes.patch  | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/cdrkit/0004-Add-missing-header-includes.patch b/package/cdrkit/0004-Add-missing-header-includes.patch
new file mode 100644
index 0000000000..d2a93fe5a7
--- /dev/null
+++ b/package/cdrkit/0004-Add-missing-header-includes.patch
@@ -0,0 +1,48 @@
+From 8b7852149c45c8a837a9f5124e91812dd475a270 Mon Sep 17 00:00:00 2001
+From: Andrey Rakhmatullin <wrar@debian.org>
+Date: Sat, 13 Jul 2024 11:37:07 +0200
+Subject: [PATCH] Add missing header includes
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Bug-Debian: https://bugs.debian.org/1066264
+
+Fixes:
+
+genisoimage/genisoimage.c:1509:17: error: implicit declaration of function ‘parse_checksum_algo’ [-Wimplicit-function-declaration]
+
+Upstream: https://sources.debian.org/patches/cdrkit/9:1.1.11-3.5/fix-implicit-function-declaration.patch/
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ genisoimage/genisoimage.c | 1 +
+ genisoimage/jte.c         | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/genisoimage/genisoimage.c b/genisoimage/genisoimage.c
+index 46f0cb7..fa2f8bd 100644
+--- a/genisoimage/genisoimage.c
++++ b/genisoimage/genisoimage.c
+@@ -53,6 +53,7 @@
+ #include <ctype.h>
+ #include "match.h"
+ #include "exclude.h"
++#include "checksum.h"
+ #include <unls.h>	/* For UNICODE translation */
+ #include <schily.h>
+ #ifdef UDF
+diff --git a/genisoimage/jte.c b/genisoimage/jte.c
+index 0dff289..4c4d986 100644
+--- a/genisoimage/jte.c
++++ b/genisoimage/jte.c
+@@ -27,6 +27,7 @@
+ #include "ifo_read.h"
+ #include "endianconv.h"
+ #include "checksum.h"
++#include "md5.h"
+ #endif
+ #ifdef APPLE_HYB
+ #include <ctype.h>
+-- 
+2.45.2
+

--===============1060214793891122075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1060214793891122075==--
