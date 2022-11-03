Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45842C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E35CC40C17;
	Thu,  3 Nov 2022 21:39:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E35CC40C17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gLm2IhIWzf9H; Thu,  3 Nov 2022 21:39:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1CB540BF7;
	Thu,  3 Nov 2022 21:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1CB540BF7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F7C01BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7889281FC5
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7889281FC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eqs72HpeaNaY for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:39:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9841981FC2
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9841981FC2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85E7A87C6F; Thu,  3 Nov 2022 21:39:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 22:38:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ceeb39303267400d6335e3c687ce1f73d9e6dcc
X-Git-Newrev: c07caa732b5c4ca5836ee81ce90f57f967dcc721
X-Patchwork-Hint: ignore
Message-Id: <20221103213907.85E7A87C6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/procps-ng: fix build without
 __NR_pidfd_open
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

commit: https://git.buildroot.net/buildroot/commit/?id=c07caa732b5c4ca5836ee81ce90f57f967dcc721
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without __NR_pidfd_open raised since
bump to version 3.3.17 in commit
cc28c7aa6df7798ce5ca79d6d1c7c2eb115ba220 and
https://gitlab.com/procps-ng/procps/-/commit/c8384e682c1cfb3b2dc797e0f8a3cbaaccf7a3da:

pgrep.c: In function 'pidfd_open':
pgrep.c:748:17: error: '__NR_pidfd_open' undeclared (first use in this function); did you mean 'pidfd_open'?
  748 |  return syscall(__NR_pidfd_open, pid, flags);
      |                 ^~~~~~~~~~~~~~~
      |                 pidfd_open

Fixes:
 - http://autobuild.buildroot.org/results/f23a5156e641b2ebdd673973dec0f9c87760c688

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/procps-ng/0003-fix-pifd_open-check.patch | 59 ++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/package/procps-ng/0003-fix-pifd_open-check.patch b/package/procps-ng/0003-fix-pifd_open-check.patch
new file mode 100644
index 0000000000..7152901e70
--- /dev/null
+++ b/package/procps-ng/0003-fix-pifd_open-check.patch
@@ -0,0 +1,59 @@
+From 0cce3e981540c28d2f703b9ab16c04d0df8fa03d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 3 Nov 2022 18:24:53 +0100
+Subject: [PATCH] fix pifd_open check
+
+Replace AC_CHECK_FUNC by AC_CHECK_FUNCS otherwise HAVE_PIDFD_OPEN will
+never be defined resulting in the following build failure if pidfd_open
+is available but __NR_pidfd_open is not available:
+
+pgrep.c: In function 'pidfd_open':
+pgrep.c:748:17: error: '__NR_pidfd_open' undeclared (first use in this function); did you mean 'pidfd_open'?
+  748 |  return syscall(__NR_pidfd_open, pid, flags);
+      |                 ^~~~~~~~~~~~~~~
+      |                 pidfd_open
+
+This build failure is raised since the addition of pwait in version
+3.3.17 and
+https://gitlab.com/procps-ng/procps/-/commit/c8384e682c1cfb3b2dc797e0f8a3cbaaccf7a3da
+
+Fixes:
+ - http://autobuild.buildroot.org/results/f23a5156e641b2ebdd673973dec0f9c87760c688
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.com/procps-ng/procps/-/merge_requests/166]
+---
+ configure.ac | 2 +-
+ src/pgrep.c  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 629881a6..1a3ccdb8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -160,7 +160,7 @@ AC_TRY_COMPILE([#include <errno.h>],
+ 		AC_MSG_RESULT(yes),
+ 		AC_MSG_RESULT(no))
+ 
+-AC_CHECK_FUNC([pidfd_open], [enable_pwait=yes], [
++AC_CHECK_FUNCS([pidfd_open], [enable_pwait=yes], [
+   AC_MSG_CHECKING([for __NR_pidfd_open])
+   AC_COMPILE_IFELSE([AC_LANG_SOURCE([
+ #include <sys/syscall.h>
+diff --git a/pgrep.c b/pgrep.c
+index c4ad5da3..29cfedf7 100644
+--- a/pgrep.c
++++ b/pgrep.c
+@@ -38,7 +38,7 @@
+ #include <stdbool.h>
+ #include <time.h>
+ 
+-#if defined(ENABLE_PWAIT) && !defined(HAVE_PIDFD_OPEN)
++#if defined(ENABLE_PWAIT)
+ #include <sys/epoll.h>
+ #include <sys/syscall.h>
+ #endif
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
