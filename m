Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30880C3ABDD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 14:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE27340BF6;
	Sat, 17 May 2025 14:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vh5FMCn6-McH; Sat, 17 May 2025 14:35:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 152C840BB1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 152C840BB1;
	Sat, 17 May 2025 14:35:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EF42D89
 for <buildroot@buildroot.org>; Sat, 17 May 2025 14:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9032D82257
 for <buildroot@buildroot.org>; Sat, 17 May 2025 14:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SPQ_E16Mp36V for <buildroot@buildroot.org>;
 Sat, 17 May 2025 14:35:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7E4D82553
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7E4D82553
 for <buildroot@buildroot.org>; Sat, 17 May 2025 14:35:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A879E82884; Sat, 17 May 2025 14:35:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 16:34:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 67e10ac8988b2b7217f424dc56f5128fb627a37d
X-Git-Newrev: 745aa4d06067ca3f6ac6f90ec995b57c704c536a
X-Patchwork-Hint: ignore
Message-Id: <20250517143508.A879E82884@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpm: fix build issue with musl
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6014883946134719162=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6014883946134719162==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=745aa4d06067ca3f6ac6f90ec995b57c704c536a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump of rpm from 4.17.0 to 4.18.0 in Buildroot commit
4b4046e919b99c61b545396149bf1dcbcf7e9e41, tools/rpmuncompress.c uses
basename() without including <libgen.h> which causes a build failure
with the musl C library:

tools/rpmuncompress.c: In function ‘doUntar’:
tools/rpmuncompress.c:100:30: error: implicit declaration of function ‘basename’ [-Wimplicit-function-declaration]
  100 |             const char *bn = basename(fn);
      |                              ^~~~~~~~
tools/rpmuncompress.c:100:30: error: initialization of ‘const char *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
make[4]: *** [Makefile:1082: tools/rpmuncompress.o] Error 1

This issue was not found by the autobuilders, but it can be reproduced
with:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE=y
BR2_PACKAGE_LUA=y
BR2_PACKAGE_RPM=y

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...003-Fix-missing-basename-include-on-macOS.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/rpm/0003-Fix-missing-basename-include-on-macOS.patch b/package/rpm/0003-Fix-missing-basename-include-on-macOS.patch
new file mode 100644
index 0000000000..ec920612e2
--- /dev/null
+++ b/package/rpm/0003-Fix-missing-basename-include-on-macOS.patch
@@ -0,0 +1,26 @@
+From f510770a214bd2e8144a39868c34cd568179599e Mon Sep 17 00:00:00 2001
+From: Calvin Buckley <calvin@cmpct.info>
+Date: Tue, 11 Jul 2023 19:22:41 -0300
+Subject: [PATCH] Fix missing basename include on macOS
+
+Upstream: b2e67642fd8cb64d8cb1cca9e759396c1c10807d
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ tools/rpmuncompress.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/rpmuncompress.c b/tools/rpmuncompress.c
+index bd4146d54..58ddf5683 100644
+--- a/tools/rpmuncompress.c
++++ b/tools/rpmuncompress.c
+@@ -1,6 +1,7 @@
+ #include "system.h"
+ 
+ #include <popt.h>
++#include <libgen.h>
+ #include <errno.h>
+ #include <stdio.h>
+ #include <string.h>
+-- 
+2.49.0
+

--===============6014883946134719162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6014883946134719162==--
