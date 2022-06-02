Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14D4C433EF
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 14:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88E9C40B53;
	Thu,  2 Jun 2022 14:03:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yYEBC4l1CDbc; Thu,  2 Jun 2022 14:03:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0564F40B16;
	Thu,  2 Jun 2022 14:03:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 23BD31C1135
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 14:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10ED0405CB
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 14:03:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ZMsHA474Vnt for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 14:03:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 511FD4057F
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 14:03:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3384786A14; Thu,  2 Jun 2022 13:51:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jun 2022 16:03:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ba2098a2d6f7b90beb4ede5fb2c80cc66a79284d
X-Git-Newrev: a482624320a0f22c4bdc6c3a6ddefc3c75a21339
X-Patchwork-Hint: ignore
Message-Id: <20220602135156.3384786A14@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cpulimit: remove or1k/musl
 limitation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a482624320a0f22c4bdc6c3a6ddefc3c75a21339
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It turns out that we can build cpulimit for or1k using musl-libc if we
remove the inclusion of the problematic procfs.h header file which is
not required at all. This is a backport of the following upstream pull
request:

https://github.com/opsengine/cpulimit/pull/110

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../cpulimit/0004-Remove-procfs.h-inclusion.patch  | 30 ++++++++++++++++++++++
 package/cpulimit/Config.in                         |  5 ++--
 2 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/package/cpulimit/0004-Remove-procfs.h-inclusion.patch b/package/cpulimit/0004-Remove-procfs.h-inclusion.patch
new file mode 100644
index 0000000000..771c2fe12c
--- /dev/null
+++ b/package/cpulimit/0004-Remove-procfs.h-inclusion.patch
@@ -0,0 +1,30 @@
+From 48a88c033c5704d37645051ca51799a8b5a7e059 Mon Sep 17 00:00:00 2001
+From: Florian Fainelli <f.fainelli@gmail.com>
+Date: Thu, 19 May 2022 14:22:40 -0700
+Subject: [PATCH] Remove procfs.h inclusion
+
+We do not use anything from this header
+
+Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
+[Upstream: https://github.com/opsengine/cpulimit/pull/110]
+---
+ src/process_iterator.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/process_iterator.c b/src/process_iterator.c
+index 8b4019d237f2..5b6c651bc5d0 100644
+--- a/src/process_iterator.c
++++ b/src/process_iterator.c
+@@ -22,9 +22,6 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#ifndef __APPLE__
+-#include <sys/procfs.h>
+-#endif
+ #include <time.h>
+ #include "process_iterator.h"
+ 
+-- 
+2.25.1
+
diff --git a/package/cpulimit/Config.in b/package/cpulimit/Config.in
index cca74afc99..11a4f1da01 100644
--- a/package/cpulimit/Config.in
+++ b/package/cpulimit/Config.in
@@ -1,12 +1,11 @@
-comment "cpulimit needs a toolchain w/ threads, does not build open openrisc with musl"
+comment "cpulimit needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || (BR2_or1k && BR2_TOOLCHAIN_USES_MUSL)
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_CPULIMIT
 	bool "cpulimit"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !(BR2_or1k && BR2_TOOLCHAIN_USES_MUSL)
 	help
 	  Cpulimit is a tool which limits the CPU usage of a process
 	  (expressed in percentage, not in CPU time)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
