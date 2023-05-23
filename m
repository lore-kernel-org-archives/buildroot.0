Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72383C7EE2D
	for <buildroot@archiver.kernel.org>; Tue, 23 May 2023 16:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA6F481EB6;
	Tue, 23 May 2023 16:04:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA6F481EB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t3Uam1FUy7tQ; Tue, 23 May 2023 16:04:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16B7A81E1F;
	Tue, 23 May 2023 16:04:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16B7A81E1F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A71A1BF398
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 16:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7B4C61042
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 16:04:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7B4C61042
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GaBbVBQN2A77 for <buildroot@lists.busybox.net>;
 Tue, 23 May 2023 16:04:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB71D60FD9
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB71D60FD9
 for <buildroot@buildroot.org>; Tue, 23 May 2023 16:04:01 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout02.t-online.de (Postfix) with SMTP id CF6784B1D;
 Tue, 23 May 2023 18:03:58 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd80.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q1UUQ-2qwQ9x0; Tue, 23 May 2023 18:03:58 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:50628)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q1UUQ-0005oc-15;
 Tue, 23 May 2023 18:03:58 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 23 May 2023 18:03:58 +0200
Message-Id: <20230523160358.1270868-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1684857838-FAFFF4D3-40FAC9A1/0/0 CLEAN NORMAL
X-TOI-MSGID: 3e6c702c-a34d-4455-956c-214ef4362208
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: fix build error with the
 i915 Gallium driver
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The error was introduced by mesa3d commit
https://cgit.freedesktop.org/mesa/mesa/commit/?id=dfd20f002f388be3f168938bc1f25e91bb08bf98
which was first introduced in mesa3d 23.0.0, added with buildroot commit
89944e2c459d45dd4271c49e35dd4a13dfd850a4

Fixes:
http://autobuild.buildroot.net/results/9c1/9c1407ca5be221dbb3ee03d2a95ada65bb7eb36b/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...5-Gallium-driver-includes-Intel-sour.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/mesa3d/0005-meson-ensure-i915-Gallium-driver-includes-Intel-sour.patch

diff --git a/package/mesa3d/0005-meson-ensure-i915-Gallium-driver-includes-Intel-sour.patch b/package/mesa3d/0005-meson-ensure-i915-Gallium-driver-includes-Intel-sour.patch
new file mode 100644
index 0000000000..1f57702eb6
--- /dev/null
+++ b/package/mesa3d/0005-meson-ensure-i915-Gallium-driver-includes-Intel-sour.patch
@@ -0,0 +1,46 @@
+From cd861b7f38e448822ce765aee61304d1e0a3a8b5 Mon Sep 17 00:00:00 2001
+From: James Knight <james.d.knight@live.com>
+Date: Thu, 13 Apr 2023 16:38:51 -0400
+Subject: meson: ensure i915 Gallium driver includes Intel sources
+
+Ensure builds flag the use of Intel sources when the i915 Gallium driver
+is configured (`-Dgallium-drivers=i915`). Otherwise, a build may fail if
+other Intel-based configuration options are not enabled:
+
+    ./src/gallium/winsys/i915/drm/meson.build:21:0: ERROR: Unknown variable "libintel_common".
+
+Signed-off-by: James Knight <james.d.knight@live.com>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22490>
+
+Upstream: https://cgit.freedesktop.org/mesa/mesa/commit/?id=cd861b7f38e448822ce765aee61304d1e0a3a8b5
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ meson.build | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+(limited to 'meson.build')
+
+diff --git a/meson.build b/meson.build
+index 23d2d965b37..a3e3c5478a8 100644
+--- a/meson.build
++++ b/meson.build
+@@ -245,7 +245,14 @@ with_microsoft_vk = _vulkan_drivers.contains('microsoft-experimental')
+ with_any_vk = _vulkan_drivers.length() != 0
+ 
+ with_any_broadcom = with_gallium_vc4 or with_gallium_v3d or with_broadcom_vk
+-with_any_intel = with_intel_vk or with_intel_hasvk or with_gallium_iris or with_gallium_crocus or with_intel_tools
++with_any_intel = [
++  with_gallium_crocus,
++  with_gallium_i915,
++  with_gallium_iris,
++  with_intel_hasvk,
++  with_intel_tools,
++  with_intel_vk,
++].contains(true)
+ 
+ if with_swrast_vk and not with_gallium_softpipe
+   error('swrast vulkan requires gallium swrast')
+-- 
+cgit v1.2.1
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
