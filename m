Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F58C77B6C
	for <buildroot@archiver.kernel.org>; Wed, 12 Apr 2023 22:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F362783D20;
	Wed, 12 Apr 2023 22:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F362783D20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JNUiltjvurH3; Wed, 12 Apr 2023 22:46:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3419C83D1D;
	Wed, 12 Apr 2023 22:46:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3419C83D1D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8EA8E1BF410
 for <buildroot@lists.busybox.net>; Wed, 12 Apr 2023 22:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67C5B60AFF
 for <buildroot@lists.busybox.net>; Wed, 12 Apr 2023 22:46:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67C5B60AFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vmY_DLgffWj7 for <buildroot@lists.busybox.net>;
 Wed, 12 Apr 2023 22:46:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 491D160AF1
Received: from mail.ott.net (mail.ott.net [77.109.144.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 491D160AF1
 for <buildroot@buildroot.org>; Wed, 12 Apr 2023 22:46:32 +0000 (UTC)
Received: from relay.zh.ott.net (relay.zh.ott.net [IPv6:fd53:c48b:8ee5::17:1])
 by mail.ott.net (Postfix) with ESMTPS id CB16C4801005;
 Thu, 13 Apr 2023 00:40:46 +0200 (CEST)
Received: by relay.zh.ott.net (OpenSMTPD) with ESMTPS id 66d7074c
 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:YES); 
 Thu, 13 Apr 2023 00:40:46 +0200 (CEST)
Received: from localhost (mort [local])
 by mort (OpenSMTPD) with ESMTPA id 3644f798;
 Wed, 12 Apr 2023 22:40:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Apr 2023 00:40:39 +0200
Message-Id: <20230412224038.109749-1-stefan@ott.net>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ott.net; s=onbz5; 
 t=1681339246; bh=+s5HMMxULf0KvNPb1A1Cv8W1nJHvdjUKvDRKAeoAdrE=;
 h=From:To:Cc:Subject:Date:From;
 b=j4/dcOpELDPECkq0ZYn96PZS/e3N5hgFg74d3JbFIYJvoixb33D+sLOOoPRx/OSnP
 Vqj76022YWg7vjf5n21zHvB44CoWq+u6hh026YFDpZ1I7M5EN5QYYIrCco/zEc+Qyw
 aHrowbx/BOy6K6V/NepxC7hs82y6MhUv0Pwi4vt+FPdZsZDYn2k+UunMFgt6hnbmmb
 QaEnEA+Kp86JUjgPFKe/wJRk6MahjrJmMZdn0gDh3rruniaOE/EQoPxAT5Otsrr4gM
 Ac2dvpfu6ysYfhUX+JxcPgUJIfHbzh0tgk5zE8D711sTjBztX7dyl5PQTc1o0CDcs5
 /FdaDV6DtTWKg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=ott.net header.i=@ott.net
 header.a=rsa-sha256 header.s=onbz5 header.b=j4/dcOpE
Subject: [Buildroot] [PATCH v2 1/1] package/eudev: fix compile-time issue
 with very old kernel headers
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
From: Stefan Ott via buildroot <buildroot@buildroot.org>
Reply-To: Stefan Ott <stefan@ott.net>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Bernd Kuhls <bernd.kuhls@t-online.de>, Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Kernel versions prior to 3.4 did not have V4L2_CAP_DEVICE_CAPS and
compiling against such a kernel will fail.

This patch introduces a version check and makes eudev fall back to
v2cap.capabilities on these kernels.

Upstream: https://github.com/eudev-project/eudev/pull/247
Signed-off-by: Stefan Ott <stefan@ott.net>
---
Changes v1 -> v2 (suggested by Arnout Vandecappelle):
- Clarified description to talk about kernel *headers*
- Use a git-formatted patch instead
- Added a Signed-off-by line
- Added upstream reference

 ...mpile-time-issue-on-very-old-kernels.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/eudev/0002-Fix-compile-time-issue-on-very-old-kernels.patch

diff --git a/package/eudev/0002-Fix-compile-time-issue-on-very-old-kernels.patch b/package/eudev/0002-Fix-compile-time-issue-on-very-old-kernels.patch
new file mode 100644
index 0000000000..c18ce2ad5a
--- /dev/null
+++ b/package/eudev/0002-Fix-compile-time-issue-on-very-old-kernels.patch
@@ -0,0 +1,43 @@
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
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
