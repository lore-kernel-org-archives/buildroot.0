Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C228C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25E3D4EFD7;
	Tue, 21 Feb 2023 00:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25E3D4EFD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yfkXmgv2ASmT; Tue, 21 Feb 2023 00:07:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D68AD4EFCB;
	Tue, 21 Feb 2023 00:07:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D68AD4EFCB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 822DB1BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F6DA417B8
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F6DA417B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lEYlNWAQCKmU for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC6E4417AE
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC6E4417AE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3E9A81979; Mon, 20 Feb 2023 20:52:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 10:14:11 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 80d98cd2a1c0eeb5c3083b3265c4f3221d1cb3c5
X-Git-Newrev: bbf8d89810479d2cc4777b84f3cc49bc3548d868
X-Patchwork-Hint: ignore
Message-Id: <20230220205247.A3E9A81979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libcamera-apps: fix
 overflow conversion error
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

commit: https://git.buildroot.net/buildroot/commit/?id=bbf8d89810479d2cc4777b84f3cc49bc3548d868
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Upstream commit:
https://github.com/raspberrypi/libcamera-apps/commit/a65682a97e19f96b86aeceb3ca3befb1687e3861

Fixes:
- http://autobuild.buildroot.net/results/758631a9fcd62835844f78914a36dfb579e7beba/

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ore-pass-VIDIOC_QUERYCAP-as-unsigned-long.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/libcamera-apps/0001-core-pass-VIDIOC_QUERYCAP-as-unsigned-long.patch b/package/libcamera-apps/0001-core-pass-VIDIOC_QUERYCAP-as-unsigned-long.patch
new file mode 100644
index 0000000000..fbd1d2d4ba
--- /dev/null
+++ b/package/libcamera-apps/0001-core-pass-VIDIOC_QUERYCAP-as-unsigned-long.patch
@@ -0,0 +1,35 @@
+From a65682a97e19f96b86aeceb3ca3befb1687e3861 Mon Sep 17 00:00:00 2001
+From: Marcus Folkesson <marcus.folkesson@gmail.com>
+Date: Tue, 31 Jan 2023 09:14:15 +0100
+Subject: [PATCH] core: pass VIDIOC_QUERYCAP as unsigned long
+
+VIDIOC_QUARYCAP is an unsigned long and should be passed as one.
+
+Get rid of the following error:
+core/libcamera_app.cpp:33:22: error: overflow in conversion from 'long unsigned int' to 'int' changes value from '2154321408' to '-2140645888' [-Werror=overflow]
+   33 |  int ret = ioctl(fd, VIDIOC_QUERYCAP, &caps);
+
+Upstream: https://github.com/raspberrypi/libcamera-apps/commit/a65682a97e19f96b86aeceb3ca3befb1687e3861
+Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
+---
+ core/libcamera_app.cpp | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/core/libcamera_app.cpp b/core/libcamera_app.cpp
+index 04696fb..8cb6563 100644
+--- a/core/libcamera_app.cpp
++++ b/core/libcamera_app.cpp
+@@ -30,7 +30,9 @@ static void check_camera_stack()
+ 		return;
+ 
+ 	v4l2_capability caps;
+-	int ret = ioctl(fd, VIDIOC_QUERYCAP, &caps);
++	unsigned long request = VIDIOC_QUERYCAP;
++
++	int ret = ioctl(fd, request, &caps);
+ 	close(fd);
+ 
+ 	if (ret < 0 || strcmp((char *)caps.driver, "bm2835 mmal"))
+-- 
+2.38.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
