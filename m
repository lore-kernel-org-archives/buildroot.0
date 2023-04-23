Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F97C77B73
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 09:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C162417FB;
	Sun, 23 Apr 2023 09:50:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C162417FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B4W3ijAO7GjV; Sun, 23 Apr 2023 09:50:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E8F441811;
	Sun, 23 Apr 2023 09:50:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E8F441811
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 077D71BF369
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 09:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4B6D60D88
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 09:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4B6D60D88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c1rLlmTncT6a for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 09:50:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06D0360B58
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 09:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06D0360B58
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFEF5843A6; Sun, 23 Apr 2023 09:50:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Apr 2023 11:21:59 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 02b2c66ffcd48efa87c0503449d3ed18e32f3860
X-Git-Newrev: 6b82c00c5d7f2a7c1b8d91b4e16efbd45ee27745
X-Patchwork-Hint: ignore
Message-Id: <20230423095040.DFEF5843A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/eudev: fix
 compile-time issue with very old kernel headers
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b82c00c5d7f2a7c1b8d91b4e16efbd45ee27745
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Kernel versions prior to 3.4 did not have V4L2_CAP_DEVICE_CAPS and
compiling against such a kernel will fail.

This patch introduces a version check and makes eudev fall back to
v2cap.capabilities on these kernels.

Signed-off-by: Stefan Ott <stefan@ott.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8f646eb2a124098bc7c34373a4921a19d436f26e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ix-compile-time-issue-on-very-old-kernels.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/eudev/0002-Fix-compile-time-issue-on-very-old-kernels.patch b/package/eudev/0002-Fix-compile-time-issue-on-very-old-kernels.patch
new file mode 100644
index 0000000000..46961cc9d1
--- /dev/null
+++ b/package/eudev/0002-Fix-compile-time-issue-on-very-old-kernels.patch
@@ -0,0 +1,44 @@
+From 09b536e0b9d0964674936901ab9d2954f935c8b4 Mon Sep 17 00:00:00 2001
+From: Stefan Ott <stefan@ott.net>
+Date: Wed, 5 Apr 2023 18:20:37 +0200
+Subject: [PATCH] Fix compile-time issue on very old kernels
+
+Kernel versions prior to 3.4 did not have V4L2_CAP_DEVICE_CAPS and
+compiling against such a kernel will fail.
+
+This patch introduces a version check and makes eudev fall back to
+v2cap.capabilities on these kernels.
+
+Upstream: https://github.com/eudev-project/eudev/commit/09b536e0b9d0964674936901ab9d2954f935c8b4
+Signed-off-by: Stefan Ott <stefan@ott.net>
+---
+ src/v4l_id/v4l_id.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/v4l_id/v4l_id.c b/src/v4l_id/v4l_id.c
+index 6bf45effe..702d5b687 100644
+--- a/src/v4l_id/v4l_id.c
++++ b/src/v4l_id/v4l_id.c
+@@ -28,6 +28,7 @@
+ #include <sys/types.h>
+ #include <sys/time.h>
+ #include <sys/ioctl.h>
++#include <linux/version.h>
+ #include <linux/videodev2.h>
+ 
+ #include "util.h"
+@@ -71,9 +72,11 @@ int main(int argc, char *argv[]) {
+                 printf("ID_V4L_VERSION=2\n");
+                 printf("ID_V4L_PRODUCT=%s\n", v2cap.card);
+                 printf("ID_V4L_CAPABILITIES=:");
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3,4,0)
+                 if (v2cap.capabilities & V4L2_CAP_DEVICE_CAPS)
+                         capabilities = v2cap.device_caps;
+                 else
++#endif
+                         capabilities = v2cap.capabilities;
+                 if ((capabilities & V4L2_CAP_VIDEO_CAPTURE) > 0 ||
+                     (capabilities & V4L2_CAP_VIDEO_CAPTURE_MPLANE) > 0)
+-- 
+2.40.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
