Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B44C77B71
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 12:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F390940503;
	Sat, 15 Apr 2023 12:49:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F390940503
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P6-oo4v77A3C; Sat, 15 Apr 2023 12:49:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2683240143;
	Sat, 15 Apr 2023 12:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2683240143
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 97D0A1C4017
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 12:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B05841620
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 12:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B05841620
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cC4iblo89jvF for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 12:49:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D80841601
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 12:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D80841601
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5994F8412D; Sat, 15 Apr 2023 12:49:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Apr 2023 14:49:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bfdf8873169c33ebc6e1ce5844fbfe841d97555f
X-Git-Newrev: 8f646eb2a124098bc7c34373a4921a19d436f26e
X-Patchwork-Hint: ignore
Message-Id: <20230415124929.5994F8412D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/eudev: fix compile-time issue with
 very old kernel headers
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f646eb2a124098bc7c34373a4921a19d436f26e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kernel versions prior to 3.4 did not have V4L2_CAP_DEVICE_CAPS and
compiling against such a kernel will fail.

This patch introduces a version check and makes eudev fall back to
v2cap.capabilities on these kernels.

Signed-off-by: Stefan Ott <stefan@ott.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
