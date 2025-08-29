Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F098CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 15:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25445844FF;
	Fri, 29 Aug 2025 15:36:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hXvdH3689beq; Fri, 29 Aug 2025 15:36:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43E92844F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43E92844F4;
	Fri, 29 Aug 2025 15:36:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 09BC2D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F008340319
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 18lyswsG7w5k for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 15:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CD574003D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CD574003D
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:36:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BFB887DB8; Fri, 29 Aug 2025 15:36:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 17:34:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7aa0802a7364f9559401c8c9214ca58514483ac
X-Git-Newrev: d5a45fd4436714dfef1afedc90b0522117b25356
X-Patchwork-Hint: ignore
Message-Id: <20250829153619.3BFB887DB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webrtc-audio-processing: fix build
 with GCC 15.x
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5a45fd4436714dfef1afedc90b0522117b25356
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A missing include causes a build failure with GCC 15.x. There are no
known autobuilder failures for this issue, but the following defconfig
allows to reproduce the issue:

 BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_INIT_NONE=y
 BR2_SYSTEM_BIN_SH_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
 BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING=y
 # BR2_TARGET_ROOTFS_TAR is not set

The affected code has completely changed in newer versions of
webrtc-audio-processing, so we add a non-upstream patch, which can be
dropped once we upgrade to a newer release.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...task_queue-task_queue_base.h-include-cstd.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/webrtc-audio-processing/0001-webrtc-api-task_queue-task_queue_base.h-include-cstd.patch b/package/webrtc-audio-processing/0001-webrtc-api-task_queue-task_queue_base.h-include-cstd.patch
new file mode 100644
index 0000000000..db253d1dd8
--- /dev/null
+++ b/package/webrtc-audio-processing/0001-webrtc-api-task_queue-task_queue_base.h-include-cstd.patch
@@ -0,0 +1,29 @@
+From 9b59846b4f9a723743532f26c344d84084b7af96 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Fri, 29 Aug 2025 07:31:50 +0200
+Subject: [PATCH] webrtc/api/task_queue/task_queue_base.h: include <cstdint>
+ for uint32_t
+
+This is needed since GCC 15.x.
+
+Upstream: not applicable, code has completely changed in latest versions
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ webrtc/api/task_queue/task_queue_base.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/webrtc/api/task_queue/task_queue_base.h b/webrtc/api/task_queue/task_queue_base.h
+index 90b1efd..7403ee9 100644
+--- a/webrtc/api/task_queue/task_queue_base.h
++++ b/webrtc/api/task_queue/task_queue_base.h
+@@ -11,6 +11,7 @@
+ #define API_TASK_QUEUE_TASK_QUEUE_BASE_H_
+ 
+ #include <memory>
++#include <cstdint>
+ 
+ #include "api/task_queue/queued_task.h"
+ #include "rtc_base/system/rtc_export.h"
+-- 
+2.50.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
