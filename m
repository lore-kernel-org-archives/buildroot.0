Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E95C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 16:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 517668121E;
	Sun,  3 Mar 2024 16:55:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HfgKF_wozlYx; Sun,  3 Mar 2024 16:55:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 635448149A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 635448149A;
	Sun,  3 Mar 2024 16:55:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E8BD51BF575
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D695260B03
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:55:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WSdEHD2a3LO8 for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 16:55:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31A9460AF1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31A9460AF1
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 16:55:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CA6087FDD; Sun,  3 Mar 2024 16:55:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 Mar 2024 17:48:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c9de634b082e9d5a8f52f7c983a481105696d347
X-Git-Newrev: 607507dfa91102c42b6b531e8f3a1a133e46e33f
X-Patchwork-Hint: ignore
Message-Id: <20240303165537.1CA6087FDD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liburing: fix uclibc build
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=607507dfa91102c42b6b531e8f3a1a133e46e33f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with uclibc-ng raised since bump to
version 2.4 in commit 3cc1b539e7e9fd49f571441e395e7daa8597dbec and
https://github.com/axboe/liburing/commit/c6bc86e2125bcd6fa10ff2b128cd86486acadff6:

In file included from lib.h:12,
                 from setup.c:4:
arch/aarch64/lib.h:7:10: fatal error: sys/auxv.h: No such file or directory
    7 | #include <sys/auxv.h>
      |          ^~~~~~~~~~~~

Fixes: 3cc1b539e7e9fd49f571441e395e7daa8597dbec
 - http://autobuild.buildroot.org/results/cc44d714c9267dd7a98debeb8c81c4ee1efe4ebb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../0001-src-arch-aarch64-fix-uclibc-build.patch   | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/liburing/0001-src-arch-aarch64-fix-uclibc-build.patch b/package/liburing/0001-src-arch-aarch64-fix-uclibc-build.patch
new file mode 100644
index 0000000000..4468105e4f
--- /dev/null
+++ b/package/liburing/0001-src-arch-aarch64-fix-uclibc-build.patch
@@ -0,0 +1,39 @@
+From f03f8da34fe96ac35a916ca3058b0f41971eae3b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 16 Feb 2024 18:59:42 +0100
+Subject: [PATCH] src/arch/aarch64: fix uclibc build
+
+Fix the following build failure with uclibc-ng raised since version 2.3
+and
+https://github.com/axboe/liburing/commit/c6bc86e2125bcd6fa10ff2b128cd86486acadff6:
+
+In file included from lib.h:12,
+                 from setup.c:4:
+arch/aarch64/lib.h:7:10: fatal error: sys/auxv.h: No such file or directory
+    7 | #include <sys/auxv.h>
+      |          ^~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/cc44d714c9267dd7a98debeb8c81c4ee1efe4ebb
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/axboe/liburing/commit/32f9c27a76c43627f79bb77469d2da8583e4d3df
+---
+ src/arch/aarch64/lib.h | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/arch/aarch64/lib.h b/src/arch/aarch64/lib.h
+index 3b701b1..41bcfc9 100644
+--- a/src/arch/aarch64/lib.h
++++ b/src/arch/aarch64/lib.h
+@@ -4,7 +4,6 @@
+ #define LIBURING_ARCH_AARCH64_LIB_H
+ 
+ #include <elf.h>
+-#include <sys/auxv.h>
+ #include "../../syscall.h"
+ 
+ static inline long __get_page_size(void)
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
