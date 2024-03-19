Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCE3C54E60
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 12:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF828406FF;
	Tue, 19 Mar 2024 12:22:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M32srexjt2z7; Tue, 19 Mar 2024 12:22:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4320A406F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4320A406F3;
	Tue, 19 Mar 2024 12:22:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 470041BF406
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 12:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 326FB60AA8
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 12:22:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YioVLXRUmvBD for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 12:22:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7314860AC3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7314860AC3
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 12:22:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6EAF88354C; Tue, 19 Mar 2024 12:22:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Mar 2024 13:17:50 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 2828004f2514f45bb9a9c39135ac57beea81837f
X-Git-Newrev: 7d54815f236396c689a7aad0aff413a6f05d05d1
X-Patchwork-Hint: ignore
Message-Id: <20240319122222.6EAF88354C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/liburing: fix
 uclibc build
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d54815f236396c689a7aad0aff413a6f05d05d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
(cherry picked from commit 607507dfa91102c42b6b531e8f3a1a133e46e33f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
