Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0793BC83F22
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 10:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB28660B8F;
	Sun, 20 Jul 2025 10:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tiG7ePwIs_Fo; Sun, 20 Jul 2025 10:59:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E72BE60BB8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E72BE60BB8;
	Sun, 20 Jul 2025 10:59:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A416DA
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 10:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97DD260BB8
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 10:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XWano-5Iwpr4 for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 10:59:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E08B160B8F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E08B160B8F
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 10:59:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFA3A867C9; Sun, 20 Jul 2025 10:59:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Jul 2025 12:43:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c72557eaf8b4fd4c1899e90c16323d7d52e0200b
X-Git-Newrev: ea797e760bc1d30ca5d8db042528bf3d1042a0f9
X-Patchwork-Hint: ignore
Message-Id: <20250720105936.CFA3A867C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/watchdog: do not guard shutdown
 __GLIBC__
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ea797e760bc1d30ca5d8db042528bf3d1042a0f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These headers are provided by uclibc/musl/glibc and bionic so we can
assume they are not needed to be glibc specific includes. This also
ensures that we get proper declaration of reboot() API.

Upstream:
https://sourceforge.net/p/watchdog/code/ci/aa371bf201b1d59c595a1ad7b3464ae544ed142f/

Fixes:
https://autobuild.buildroot.org/results/3e67d5b3b89d794e3f6c510803368f8b100b07a7/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Julien: reformat Upstream: tag in patch to fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-Do-not-guard-shutdown-__GLIBC__.patch     | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/watchdog/0001-Do-not-guard-shutdown-__GLIBC__.patch b/package/watchdog/0001-Do-not-guard-shutdown-__GLIBC__.patch
new file mode 100644
index 0000000000..7140888753
--- /dev/null
+++ b/package/watchdog/0001-Do-not-guard-shutdown-__GLIBC__.patch
@@ -0,0 +1,39 @@
+From aa371bf201b1d59c595a1ad7b3464ae544ed142f Mon Sep 17 00:00:00 2001
+From: Paul Crawford <psc@sat.dundee.ac.uk>
+Date: Thu, 16 Mar 2023 11:42:34 +0000
+Subject: [PATCH] Do not guard shutdown __GLIBC__
+
+- Patch by Khem Raj <raj.khem@gmail.com>
+
+- These headers are provided by uclibc/musl/glibc and bionic so we can
+  assume they are not needed to be glibc specific includes. This also
+  ensures that we get proper declaration of reboot() API
+
+Upstream: https://sourceforge.net/p/watchdog/code/ci/aa371bf201b1d59c595a1ad7b3464ae544ed142f/
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ src/shutdown.c | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/src/shutdown.c b/src/shutdown.c
+index 1d9a857..6aea0d0 100644
+--- a/src/shutdown.c
++++ b/src/shutdown.c
+@@ -29,13 +29,9 @@
+ #include "extern.h"
+ #include "ext2_mnt.h"
+ 
+-#if defined __GLIBC__
+ #include <sys/quota.h>
+ #include <sys/swap.h>
+ #include <sys/reboot.h>
+-#else				/* __GLIBC__ */
+-#include <linux/quota.h>
+-#endif				/* __GLIBC__ */
+ 
+ #include <unistd.h>
+ 
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
