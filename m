Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5B7C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 09:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CD80606F7;
	Sat, 13 Jul 2024 09:41:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AIaX1FWGkFOu; Sat, 13 Jul 2024 09:41:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C67EE608F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C67EE608F2;
	Sat, 13 Jul 2024 09:41:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F9341BF4D6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BE3D41940
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:41:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RbTIq7L1HMpZ for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 09:41:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F149418E9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F149418E9
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 09:41:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18D2A863F0; Sat, 13 Jul 2024 09:41:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 11:39:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 347def2fd1f062be5d335d06aaaec577c5fa1d68
X-Git-Newrev: 0a0de4d86cd1fbeb5ff0439259b297756b3a5d98
X-Patchwork-Hint: ignore
Message-Id: <20240713094126.18D2A863F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cdrkit: fix build with gcc 14.x
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
Content-Type: multipart/mixed; boundary="===============7707921684508897643=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7707921684508897643==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0a0de4d86cd1fbeb5ff0439259b297756b3a5d98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch, which is already in Debian, fixing the build
with gcc 14.x:

/home/autobuild/autobuild/instance-7/output-1/build/host-cdrkit-1.1.11/genisoimage/genisoimage.c:1509:17: error: implicit declaration of function 'parse_checksum_algo' [-Wimplicit-function-declaration]
 1509 |             if (parse_checksum_algo(optarg, &checksum_algo_iso))
      |                 ^~~~~~~~~~~~~~~~~~~
make[3]: *** [genisoimage/CMakeFiles/genisoimage.dir/build.make:76: genisoimage/CMakeFiles/genisoimage.dir/genisoimage.o] Error 1

Fixes:

  http://autobuild.buildroot.net/results/a9cca8da22774ecafdbb382697aae71f78e348f4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

--===============7707921684508897643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7707921684508897643==--
