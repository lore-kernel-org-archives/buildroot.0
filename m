Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD6DC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2284419D5;
	Mon, 20 Feb 2023 20:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2284419D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UgeEb_-bOkRL; Mon, 20 Feb 2023 20:53:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DD6E41C40;
	Mon, 20 Feb 2023 20:53:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DD6E41C40
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 271231BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB9F961023
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB9F961023
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QriAESwhUMoO for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC30961026
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC30961026
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBB0586491; Mon, 20 Feb 2023 20:51:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 22:38:50 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0ceeb39303267400d6335e3c687ce1f73d9e6dcc
X-Git-Newrev: c07caa732b5c4ca5836ee81ce90f57f967dcc721
X-Patchwork-Hint: ignore
Message-Id: <20230220205145.CBB0586491@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/procps-ng: fix build
 without __NR_pidfd_open
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
