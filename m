Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C387CA1013
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 529AC40413;
	Thu,  4 Sep 2025 16:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ZEzQPuyvp0Q; Thu,  4 Sep 2025 16:14:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5025540460
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5025540460;
	Thu,  4 Sep 2025 16:14:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18FAD106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CBA7807A3
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kwm7QXzzohBx for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:13:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B63DF8078A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B63DF8078A
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B26ED87F44; Thu,  4 Sep 2025 16:13:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 13:57:24 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e02167acf57e52717441d6bbd954bdbd0153a07b
X-Git-Newrev: 202bec53f1f0f860ab4db7ba3915712aea9be408
X-Patchwork-Hint: ignore
Message-Id: <20250904161348.B26ED87F44@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/lirc-tools: fix
 build with GCC 14.x
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=202bec53f1f0f860ab4db7ba3915712aea9be408
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since glibc 2.28, <sys/sysmacros.h> is no longer implicitly included
by <sys/types.h>, which means major() is only defined if you include
<sys/sysmacros.h>.

This wasn't really visible for a while in loadable plugins built by
lirc-tools as they could happily be built with undefined
symbols... except they would fail to load at runtime.

But then GCC 14.x brought more strict checking of having the function
prototype around, which now detects this issue at build time.

So the actual issue has been around since we switched to glibc 2.28,
but it only started failing to build since gcc 14.x. The first failure
is on August 2024, so this patch should be backported to our stable
branches.

The fix is backport from an upstream commit, post 0.10.2.

Fixes:

  https://autobuild.buildroot.net/results/2f64accd430d9467add3f1195f3f59eff8e99a4d/

Minimal reproducer:

 BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_INIT_NONE=y
 BR2_SYSTEM_BIN_SH_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
 BR2_PACKAGE_LIRC_TOOLS=y
 # BR2_TARGET_ROOTFS_TAR is not set

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2313c2324207a36415e1163bddda175b717ce8a7)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .../0003-Fix-default.so-plugin-not-loading.patch   | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/lirc-tools/0003-Fix-default.so-plugin-not-loading.patch b/package/lirc-tools/0003-Fix-default.so-plugin-not-loading.patch
new file mode 100644
index 0000000000..3b2d536055
--- /dev/null
+++ b/package/lirc-tools/0003-Fix-default.so-plugin-not-loading.patch
@@ -0,0 +1,39 @@
+From 515325a90a9007fa12737c93c5c47ffaf6fea983 Mon Sep 17 00:00:00 2001
+From: Milan Vit <milanvit@milanvit.net>
+Date: Fri, 24 May 2024 18:34:26 +0900
+Subject: [PATCH] Fix default.so plugin not loading
+
+Upstream: 5d9e0f17436a98aedd0da885bd0096e147e54423
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ lib/drv_enum.c    | 1 +
+ plugins/default.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/lib/drv_enum.c b/lib/drv_enum.c
+index 5fd74d0c..45abaa19 100644
+--- a/lib/drv_enum.c
++++ b/lib/drv_enum.c
+@@ -14,6 +14,7 @@
+ #include <stdbool.h>
+ #include <sys/stat.h>
+ #include <sys/types.h>
++#include <sys/sysmacros.h>
+ #include <dirent.h>
+ #include <errno.h>
+ 
+diff --git a/plugins/default.c b/plugins/default.c
+index 79c942d6..37cba788 100644
+--- a/plugins/default.c
++++ b/plugins/default.c
+@@ -26,6 +26,7 @@
+ #include <stdint.h>
+ #include <stdlib.h>
+ #include <sys/stat.h>
++#include <sys/sysmacros.h>
+ #include <sys/types.h>
+ #include <sys/ioctl.h>
+ #include <sys/socket.h>
+-- 
+2.50.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
