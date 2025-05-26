Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B2EC5B552
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 17:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1D9A83BE4;
	Sat, 31 May 2025 17:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1O2Kk9fpoAc3; Sat, 31 May 2025 17:06:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7297F83C03
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7297F83C03;
	Sat, 31 May 2025 17:06:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D6E6117
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DC4E83BA7
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9fA1Uvk6HIbP for <buildroot@buildroot.org>;
 Sat, 31 May 2025 17:06:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5660F83BAF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5660F83BAF
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53A9A87804; Sat, 31 May 2025 17:06:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 May 2025 17:50:27 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2d0c186d8278750670f5fb474bf61ef6f3bef250
X-Git-Newrev: 1a8ed4da70bb795b4a35f774f65321bf4a943b05
X-Patchwork-Hint: ignore
Message-Id: <20250531170619.53A9A87804@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/rpm: fix build
 issue with musl
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6341877082377800103=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6341877082377800103==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1a8ed4da70bb795b4a35f774f65321bf4a943b05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
(cherry picked from commit 745aa4d06067ca3f6ac6f90ec995b57c704c536a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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

--===============6341877082377800103==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6341877082377800103==--
