Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947E8C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 17:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AE0F84CB2;
	Wed,  1 Nov 2023 17:51:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AE0F84CB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x4ZdtHAtaLse; Wed,  1 Nov 2023 17:51:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C14E984CDB;
	Wed,  1 Nov 2023 17:51:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C14E984CDB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 95D481BF280
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DE8C431BD
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DE8C431BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g9Dk0slkqj2D for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 17:51:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C77F0431D5
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 17:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C77F0431D5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5079863EB; Wed,  1 Nov 2023 17:51:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 18:50:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd4c86806e2c5d1bc57822009000378366a8fdf7
X-Git-Newrev: 5e10a0678196a708eeb99b4a87006798bfab1572
X-Patchwork-Hint: ignore
Message-Id: <20231101175133.B5079863EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/conmon: fix static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=5e10a0678196a708eeb99b4a87006798bfab1572
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following static build failure raised since commit
8144dd1b4cca2d5c89e329b0497f49f512c9caed which fixed dynamic build but
broke static build:

src/seccomp_notify.c:10:10: fatal error: dlfcn.h: No such file or directory
   10 | #include <dlfcn.h>
      |          ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/71b4f35b3150183c7b44bc3897f01b0019e10ebe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...001-src-seccomp_notify.c-fix-static-build.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/conmon/0001-src-seccomp_notify.c-fix-static-build.patch b/package/conmon/0001-src-seccomp_notify.c-fix-static-build.patch
new file mode 100644
index 0000000000..afffa909c8
--- /dev/null
+++ b/package/conmon/0001-src-seccomp_notify.c-fix-static-build.patch
@@ -0,0 +1,44 @@
+From 6cfcea9a16017f2a49cd792d39ebd9c86395946a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 1 Nov 2023 16:45:21 +0100
+Subject: [PATCH] src/seccomp_notify.c: fix static build
+
+Fix the following static build failure raised even when seccomp is
+disabled:
+
+src/seccomp_notify.c:10:10: fatal error: dlfcn.h: No such file or directory
+   10 | #include <dlfcn.h>
+      |          ^~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/71b4f35b3150183c7b44bc3897f01b0019e10ebe
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/containers/conmon/issues/462
+---
+ src/seccomp_notify.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/seccomp_notify.c b/src/seccomp_notify.c
+index 8d34d9d..bf738ea 100644
+--- a/src/seccomp_notify.c
++++ b/src/seccomp_notify.c
+@@ -7,7 +7,6 @@
+ 
+ #include <errno.h>
+ #include <sys/ioctl.h>
+-#include <dlfcn.h>
+ #include <sys/wait.h>
+ #include <sys/mount.h>
+ #include <signal.h>
+@@ -19,6 +18,7 @@
+ 
+ #ifdef USE_SECCOMP
+ 
++#include <dlfcn.h>
+ #include <sys/sysmacros.h>
+ #include <linux/seccomp.h>
+ #include <seccomp.h>
+-- 
+2.42.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
