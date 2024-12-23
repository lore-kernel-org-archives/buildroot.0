Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C68E7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 08:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79270607D0;
	Mon, 23 Dec 2024 08:26:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BcDGXCban0SP; Mon, 23 Dec 2024 08:26:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66E3C60AA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66E3C60AA0;
	Mon, 23 Dec 2024 08:26:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 00966D3
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 08:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC034814BA
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 08:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jC5xLpkpm3ob for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 08:26:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBE2C814B3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBE2C814B3
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 08:26:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5BF6873C5; Mon, 23 Dec 2024 08:26:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 23 Dec 2024 09:26:00 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 849306c66d6e39f4251890ec18121f957ed989f1
X-Git-Newrev: 8b4a5da997b86a2a2b1e5b6e6059ff758fd5d6c9
X-Patchwork-Hint: ignore
Message-Id: <20241223082647.B5BF6873C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/cdrkit: fix build
 with gcc 14.x
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: multipart/mixed; boundary="===============4464725234500295037=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4464725234500295037==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8b4a5da997b86a2a2b1e5b6e6059ff758fd5d6c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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

--===============4464725234500295037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4464725234500295037==--
