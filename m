Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BFDC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 07:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83F4060B29;
	Mon,  5 Dec 2022 07:16:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83F4060B29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Oyxl_U7eWRM; Mon,  5 Dec 2022 07:16:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3B6E60B1E;
	Mon,  5 Dec 2022 07:16:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3B6E60B1E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C3BAD1BF8C7
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 07:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F6D081463
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 07:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F6D081463
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U0nvWRFzHAIb for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 07:15:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 927058144B
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 07:15:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 927058144B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 81202856C5; Mon,  5 Dec 2022 07:15:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Dec 2022 08:14:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5c1f67428af623b39312270a490dfc9a6d647773
X-Git-Newrev: 74b1d385b67dc5933eca3ebeb456d400bd5296d9
X-Patchwork-Hint: ignore
Message-Id: <20221205071545.81202856C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lxc: fix build with sys/pidfd.h
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

commit: https://git.buildroot.net/buildroot/commit/?id=74b1d385b67dc5933eca3ebeb456d400bd5296d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with sys/pidfd.h raised since bump to
version 5.0.1 in commit db19998035701d08bf1b5fd366e0b5aa9adb8e57:

In file included from ../src/lxc/utils.h:23,
                 from ../src/lxc/cgroups/cgfsng.c:51:
../src/lxc/process_utils.h:140:17: error: expected identifier before numeric constant
  140 | #define P_PIDFD 3
      |                 ^

Fixes:
 - http://autobuild.buildroot.org/results/c9ff42a921ca47f634f908bab80c80164c227a02

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...003-build-detect-sys-pidfd.h-availability.patch | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/package/lxc/0003-build-detect-sys-pidfd.h-availability.patch b/package/lxc/0003-build-detect-sys-pidfd.h-availability.patch
new file mode 100644
index 0000000000..3aa598407f
--- /dev/null
+++ b/package/lxc/0003-build-detect-sys-pidfd.h-availability.patch
@@ -0,0 +1,55 @@
+From ef1e0607b82e27350c2d677d649c6a0a9693fd40 Mon Sep 17 00:00:00 2001
+From: Christian Brauner <brauner@kernel.org>
+Date: Tue, 9 Aug 2022 16:27:40 +0200
+Subject: [PATCH] build: detect sys/pidfd.h availability
+
+Fixes: #4176
+Signed-off-by: Christian Brauner (Microsoft) <christian.brauner@ubuntu.com>
+
+[Retrieved from:
+https://github.com/lxc/lxc/commit/ef1e0607b82e27350c2d677d649c6a0a9693fd40]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ meson.build             | 1 +
+ src/lxc/process_utils.h | 6 ++++++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/meson.build b/meson.build
+index f679aabbc8..e999542336 100644
+--- a/meson.build
++++ b/meson.build
+@@ -735,6 +735,7 @@ foreach tuple: [
+     ['sys/resource.h'],
+     ['sys/memfd.h'],
+     ['sys/personality.h'],
++    ['sys/pidfd.h'],
+     ['sys/signalfd.h'],
+     ['sys/timerfd.h'],
+     ['pty.h'],
+diff --git a/src/lxc/process_utils.h b/src/lxc/process_utils.h
+index 9c15b15741..ed84741d0e 100644
+--- a/src/lxc/process_utils.h
++++ b/src/lxc/process_utils.h
+@@ -15,6 +15,10 @@
+ #include <sys/syscall.h>
+ #include <unistd.h>
+ 
++#if HAVE_SYS_PIDFD_H
++#include <sys/pidfd.h>
++#endif
++
+ #include "compiler.h"
+ #include "syscall_numbers.h"
+ 
+@@ -136,9 +140,11 @@
+ #endif
+ 
+ /* waitid */
++#if !HAVE_SYS_PIDFD_H
+ #ifndef P_PIDFD
+ #define P_PIDFD 3
+ #endif
++#endif
+ 
+ #ifndef CLONE_ARGS_SIZE_VER0
+ #define CLONE_ARGS_SIZE_VER0 64 /* sizeof first published struct */
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
