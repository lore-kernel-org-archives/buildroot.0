Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF807C38147
	for <buildroot@archiver.kernel.org>; Sat, 16 Dec 2023 09:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B5CF4216B;
	Sat, 16 Dec 2023 09:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B5CF4216B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tVwtFdXTUQmS; Sat, 16 Dec 2023 09:59:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9767E42163;
	Sat, 16 Dec 2023 09:59:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9767E42163
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 361AB1BF28A
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 09:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FC6583E6F
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 09:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FC6583E6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fzee9-RP4HbH for <buildroot@lists.busybox.net>;
 Sat, 16 Dec 2023 09:59:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2064C83D9D
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 09:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2064C83D9D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CD4C87A94; Sat, 16 Dec 2023 09:59:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Dec 2023 10:57:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e6ae6771287fdf1df2368230264a10f3763139f9
X-Git-Newrev: ea59fd8827d93689dfc418a8d6413bbc4aad7890
X-Patchwork-Hint: ignore
Message-Id: <20231216095902.0CD4C87A94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/crun: bump to version 1.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea59fd8827d93689dfc418a8d6413bbc4aad7890
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes:
https://github.com/containers/crun/releases/tag/1.12

Also add a patch to fix crun compile without libseccomp libcap issue

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-compile-error-without-libseccomp-and-lib.patch | 59 ++++++++++++++++++++++
 package/crun/crun.hash                             |  2 +-
 package/crun/crun.mk                               |  2 +-
 3 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/package/crun/0001-libcrun-fix-compile-error-without-libseccomp-and-lib.patch b/package/crun/0001-libcrun-fix-compile-error-without-libseccomp-and-lib.patch
new file mode 100644
index 0000000000..81b08d34b7
--- /dev/null
+++ b/package/crun/0001-libcrun-fix-compile-error-without-libseccomp-and-lib.patch
@@ -0,0 +1,59 @@
+From ea27b1363ef709ce4b169138017b67ef624b127b Mon Sep 17 00:00:00 2001
+From: Xiangyu Chen <xiangyu.chen@windriver.com>
+Date: Tue, 12 Dec 2023 10:47:42 +0800
+Subject: [PATCH] libcrun: fix compile error without libseccomp and libcap
+
+Fixed compile error without libseccomp and libcap, running
+clang-format to format the code style.
+
+Upstream: https://github.com/containers/crun/commit/ea27b1363ef709ce4b169138017b67ef624b127b
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ src/libcrun/container.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/libcrun/container.c b/src/libcrun/container.c
+index 34649f8..ffcdb24 100644
+--- a/src/libcrun/container.c
++++ b/src/libcrun/container.c
+@@ -23,7 +23,9 @@
+ #include "container.h"
+ #include "utils.h"
+ #include "seccomp.h"
+-#include <seccomp.h>
++#ifdef HAVE_SECCOMP
++#  include <seccomp.h>
++#endif
+ #include "scheduler.h"
+ #include "seccomp_notify.h"
+ #include "custom-handler.h"
+@@ -47,7 +49,9 @@
+ #include <sys/signalfd.h>
+ #include <sys/epoll.h>
+ #include <sys/socket.h>
+-#include <sys/capability.h>
++#ifdef HAVE_CAP
++#  include <sys/capability.h>
++#endif
+ #include <sys/ioctl.h>
+ #include <termios.h>
+ #include <grp.h>
+@@ -3829,6 +3833,7 @@ populate_array_field (char ***field, char *array[], size_t num_elements)
+   (*field)[i] = NULL;
+ }
+ 
++#ifdef HAVE_CAP
+ static void
+ populate_capabilities (struct features_info_s *info, char ***capabilities, size_t *num_capabilities)
+ {
+@@ -3876,6 +3881,7 @@ populate_capabilities (struct features_info_s *info, char ***capabilities, size_
+   (*capabilities)[index] = NULL; // Terminate the array with NULL
+   populate_array_field (&(info->linux.capabilities), *capabilities, *num_capabilities);
+ }
++#endif
+ 
+ static void
+ retrieve_mount_options (struct features_info_s **info)
+-- 
+2.34.1
+
diff --git a/package/crun/crun.hash b/package/crun/crun.hash
index bdffb0c6aa..c461d78d97 100644
--- a/package/crun/crun.hash
+++ b/package/crun/crun.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  5b8b5adb1dff7af768b69d2b0b4f2cd785ec931e7aa10138aa29812c46ee09ff  crun-1.8.4.tar.gz
+sha256  a76982ac076a5c9bf9f85bd8d25b1dc6344e252399a7e9231504357fc019f7cc  crun-1.12.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.libcrun
diff --git a/package/crun/crun.mk b/package/crun/crun.mk
index 15438a44b3..a6088c13a0 100644
--- a/package/crun/crun.mk
+++ b/package/crun/crun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRUN_VERSION = 1.8.4
+CRUN_VERSION = 1.12
 CRUN_SITE = https://github.com/containers/crun/releases/download/$(CRUN_VERSION)
 CRUN_DEPENDENCIES = host-pkgconf yajl
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
