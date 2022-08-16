Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CD9C2BB41
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 08:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A54FD81D4F;
	Tue, 16 Aug 2022 08:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A54FD81D4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4sm-tho1IJbq; Tue, 16 Aug 2022 08:36:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE869823CF;
	Tue, 16 Aug 2022 08:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE869823CF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E8FE11BF2A4
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 08:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F355401F2
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 08:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F355401F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e0xt8Qm1F-gr for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 08:35:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 321A840635
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 08:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 321A840635
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 078378773F; Tue, 16 Aug 2022 08:20:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 10:24:15 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 138d70995fe31967422aa6b87cee2e55ab431213
X-Git-Newrev: 77c68719b7c02c7d49ce903c595baa20611a9a49
X-Patchwork-Hint: ignore
Message-Id: <20220816082039.078378773F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/powerpc-utils:
 fix build with musl
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

commit: https://git.buildroot.net/buildroot/commit/?id=77c68719b7c02c7d49ce903c595baa20611a9a49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Backport an upstream patch that fixes the build with musl.

Fixes:

  http://autobuild.buildroot.net/results/631e74e6f7b7bc216800203acc99b6a53af266b6/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f1fabe7461fc0e1483deb150d2e35c88715e2b24)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...dd-includes-defines-for-musl-libc-support.patch | 101 +++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/package/powerpc-utils/0001-add-includes-defines-for-musl-libc-support.patch b/package/powerpc-utils/0001-add-includes-defines-for-musl-libc-support.patch
new file mode 100644
index 0000000000..b0206c6e6c
--- /dev/null
+++ b/package/powerpc-utils/0001-add-includes-defines-for-musl-libc-support.patch
@@ -0,0 +1,101 @@
+From 2efa853ef04c331444c9014af108d17544d5ed1b Mon Sep 17 00:00:00 2001
+From: Fabian Groffen <grobian@gentoo.org>
+Date: Fri, 21 May 2021 11:25:21 +0200
+Subject: [PATCH] add includes/defines for musl libc support
+
+- add some missing includes to get proper definitions for beXXtoh and
+  PATH_MAX
+- guard backtrace() from execinfo.h usage for it is glibc only
+
+Signed-off-by: Fabian Groffen <grobian@gentoo.org>
+Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>
+Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
+Upstream: c73206b62d6d827cbc37a10f0195b5d2cf3f2fbb
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/common/cpu_info_helpers.c | 1 +
+ src/drmgr/common.c            | 6 ++++++
+ src/drmgr/dr.h                | 1 +
+ src/rtas_dbg.c                | 1 +
+ 4 files changed, 9 insertions(+)
+
+diff --git a/src/common/cpu_info_helpers.c b/src/common/cpu_info_helpers.c
+index 3d08ff7..925f220 100644
+--- a/src/common/cpu_info_helpers.c
++++ b/src/common/cpu_info_helpers.c
+@@ -29,6 +29,7 @@
+ #include <errno.h>
+ #include <stdbool.h>
+ #include <dirent.h>
++#include <limits.h>
+ #include <sys/stat.h>
+ #include <sys/types.h>
+ #include "cpu_info_helpers.h"
+diff --git a/src/drmgr/common.c b/src/drmgr/common.c
+index 5e8135b..32cf805 100644
+--- a/src/drmgr/common.c
++++ b/src/drmgr/common.c
+@@ -28,7 +28,9 @@
+ #include <signal.h>
+ #include <errno.h>
+ #include <dirent.h>
++#ifdef __GLIBC__
+ #include <execinfo.h>
++#endif
+ #include <ctype.h>
+ #include <sys/wait.h>
+ #include <endian.h>
+@@ -853,6 +855,7 @@ sighandler(int signo)
+ 	say(ERROR, "Received signal %d, attempting to cleanup and exit\n",
+ 	    signo);
+ 
++#ifdef __GLIBC__
+ 	if (log_fd) {
+ 		void *callstack[128];
+ 		int sz;
+@@ -860,6 +863,7 @@ sighandler(int signo)
+ 		sz = backtrace(callstack, 128);
+ 		backtrace_symbols_fd(callstack, sz, log_fd);
+ 	}
++#endif
+ 
+ 	dr_fini();
+ 	exit(-1);
+@@ -925,8 +929,10 @@ sig_setup(void)
+ 	if (sigaction(SIGBUS, &sigact, NULL))
+ 		return -1;
+ 
++#ifdef __GLIBC__
+ 	/* dummy call to backtrace to get symbol loaded */
+ 	backtrace(callstack, 128);
++#endif
+ 	return 0;
+ }
+ 
+diff --git a/src/drmgr/dr.h b/src/drmgr/dr.h
+index f171bfe..b32d49a 100644
+--- a/src/drmgr/dr.h
++++ b/src/drmgr/dr.h
+@@ -26,6 +26,7 @@
+ #include <nl_types.h>
+ #include <unistd.h>
+ #include <stdarg.h>
++#include <limits.h>
+ #include "rtas_calls.h"
+ #include "drpci.h"
+ 
+diff --git a/src/rtas_dbg.c b/src/rtas_dbg.c
+index 526e78b..ebc7474 100644
+--- a/src/rtas_dbg.c
++++ b/src/rtas_dbg.c
+@@ -32,6 +32,7 @@
+ #include <getopt.h>
+ #include <dirent.h>
+ #include <string.h>
++#include <endian.h>
+ #include <sys/syscall.h>
+ #include <unistd.h>
+ #include <linux/unistd.h>
+-- 
+2.37.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
