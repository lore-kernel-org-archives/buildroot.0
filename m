Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6697EC433F5
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 15:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F8A261210;
	Tue, 24 May 2022 15:07:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5HQ3gFuDmcYa; Tue, 24 May 2022 15:07:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10BFA60E05;
	Tue, 24 May 2022 15:07:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C31731BF395
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 15:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9F3260E28
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 15:07:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CzaALMOwSuZA for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 15:07:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 008D060E13
 for <buildroot@buildroot.org>; Tue, 24 May 2022 15:07:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5B9E08648E; Tue, 24 May 2022 14:56:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 24 May 2022 17:04:08 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 672ce3571d4f744a903dd5061719385c394c4754
X-Git-Newrev: a60117068b9d4fc3583ba68a9be87aa31b93b806
X-Patchwork-Hint: ignore
Message-Id: <20220524145615.5B9E08648E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/trinity: fix musl
 build
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
Content-Type: multipart/mixed; boundary="===============8100981735256363800=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8100981735256363800==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a60117068b9d4fc3583ba68a9be87aa31b93b806
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure on musl:

In file included from /nvmedata/autobuild/instance-17/output-1/host/powerpc64-buildroot-linux-musl/sysroot/usr/include/asm/ioctl.h:12,
                 from /nvmedata/autobuild/instance-17/output-1/host/powerpc64-buildroot-linux-musl/sysroot/usr/include/linux/ioctl.h:5,
                 from /nvmedata/autobuild/instance-17/output-1/host/powerpc64-buildroot-linux-musl/sysroot/usr/include/linux/fs.h:14,
                 from ioctls/vfs.c:3:
ioctls/vfs.c:109:35: error: 'loff_t' undeclared here (not in a function); did you mean 'off_t'?
  109 |  { .name = "FIOQSIZE", .request = FIOQSIZE, },
      |                                   ^~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/b7f46072751a8d70fa02f1c625c5279f70bec853

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit a8614ffc07993feca1a3094c1488a11913cb4e87)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0003-Use-fcntl-h-for-dev_t-mode_t.patch        | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/trinity/0003-Use-fcntl-h-for-dev_t-mode_t.patch b/package/trinity/0003-Use-fcntl-h-for-dev_t-mode_t.patch
new file mode 100644
index 0000000000..c4d9811b8a
--- /dev/null
+++ b/package/trinity/0003-Use-fcntl-h-for-dev_t-mode_t.patch
@@ -0,0 +1,46 @@
+From b1a0aef9978d4a41e7e601c277d4fb1b0cfbed89 Mon Sep 17 00:00:00 2001
+From: Dave Jones <davej@codemonkey.org.uk>
+Date: Thu, 26 Aug 2021 11:17:34 -0400
+Subject: [PATCH] Use fcntl.h for dev_t & mode_t
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Should fix:
+
+In file included from /usr/include/bits/statx.h:31,
+                 from /usr/include/sys/stat.h:446,
+                 from include/files.h:3,
+                 from include/shm.h:6,
+                 from syscalls/x86/modify_ldt.c:12:
+/usr/include/linux/stat.h:57:2: error: unknown type name ‘__s64’
+  __s64 tv_sec;
+  ^~~~~
+/usr/include/linux/stat.h:58:2: error: unknown type name ‘__u32’
+  __u32 tv_nsec;
+  ^~~~~
+/usr/include/linux/stat.h:59:2: error: unknown type name ‘__s32’
+  __s32 __reserved;
+  ^~~~~
+/usr/include/linux/stat.h:101:2: error: unknown type name ‘__u32’
+  __u32 stx_mask; /* What results were written [uncond] */
+
+[Retrieved from:
+https://github.com/kernelslacker/trinity/commit/b1a0aef9978d4a41e7e601c277d4fb1b0cfbed89]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/files.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/files.h b/include/files.h
+index 2a8e0e2d..ba3cc98f 100644
+--- a/include/files.h
++++ b/include/files.h
+@@ -1,6 +1,6 @@
+ #pragma once
+ 
+-#include <sys/stat.h>
++#include <fcntl.h>
+ #include "fd.h"
+ 
+ unsigned long get_o_flags(void);

--===============8100981735256363800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8100981735256363800==--
