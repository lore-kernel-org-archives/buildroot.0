Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF55FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 19:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAB0840288;
	Thu, 13 Jan 2022 19:38:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jl2kUOBmUlU4; Thu, 13 Jan 2022 19:37:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF13E4090E;
	Thu, 13 Jan 2022 19:37:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 92F0B1C1135
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F4B46FC57
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:37:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z1_XpN5DMnuD for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 19:37:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF77160A91
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 19:37:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9BAAA8356C; Thu, 13 Jan 2022 19:31:19 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 20:37:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 57ea2264d78dcc66dff1e904c538fa8c23ae3a0a
X-Git-Newrev: 495440cf267962501753c19dab8da0714079261f
X-Patchwork-Hint: ignore
Message-Id: <20220113193119.9BAAA8356C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tinyalsa: fix musl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=495440cf267962501753c19dab8da0714079261f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure on musl raised since bump to version
2.0.0 in commit 3b9c8f8cb53e449e39899a40712703c272c5eeff:

In file included from ../src/pcm_hw.c:42:
/home/peko/autobuild/instance-1/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/sound/asound.h:444:18: error: field 'trigger_tstamp' has incomplete type
  444 |  struct timespec trigger_tstamp; /* time when stream was started/stopped/paused */
      |                  ^~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/a75e23dc585bd071f4d65face5489ed6ac22edbe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-include-time.h-before-asound.h.patch      | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/package/tinyalsa/0001-include-time.h-before-asound.h.patch b/package/tinyalsa/0001-include-time.h-before-asound.h.patch
new file mode 100644
index 0000000000..c91213e2eb
--- /dev/null
+++ b/package/tinyalsa/0001-include-time.h-before-asound.h.patch
@@ -0,0 +1,76 @@
+From d91e947bda590765e1c791f40e8ffb4135ab1cd3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 11 Jan 2022 00:01:49 +0100
+Subject: [PATCH] include time.h before asound.h
+
+Include time.h before asound.h to avoid the following build failure on
+musl that was already fixed a long time with
+https://github.com/tinyalsa/tinyalsa/commit/c8333f8c7a4e4b9549abeef7530b2cd20a18e537
+but reappeared on version 2.0.0:
+
+In file included from ../src/pcm_hw.c:42:
+/home/peko/autobuild/instance-1/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/sound/asound.h:444:18: error: field 'trigger_tstamp' has incomplete type
+  444 |  struct timespec trigger_tstamp; /* time when stream was started/stopped/paused */
+      |                  ^~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a75e23dc585bd071f4d65face5489ed6ac22edbe
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/tinyalsa/tinyalsa/commit/c127110249967e0722d80bb41e33713accdcff8f]
+---
+ src/mixer.c      | 1 +
+ src/mixer_hw.c   | 1 +
+ src/pcm_hw.c     | 1 +
+ src/pcm_plugin.c | 1 +
+ 4 files changed, 4 insertions(+)
+
+diff --git a/src/mixer.c b/src/mixer.c
+index afbc015..029fc84 100644
+--- a/src/mixer.c
++++ b/src/mixer.c
+@@ -55,6 +55,7 @@
+ #define __user
+ #endif
+ 
++#include <time.h>
+ #include <sound/asound.h>
+ 
+ #include <tinyalsa/mixer.h>
+diff --git a/src/mixer_hw.c b/src/mixer_hw.c
+index da5a390..50e9d07 100644
+--- a/src/mixer_hw.c
++++ b/src/mixer_hw.c
+@@ -42,6 +42,7 @@
+ #include <sys/ioctl.h>
+ 
+ #include <linux/ioctl.h>
++#include <time.h>
+ #include <sound/asound.h>
+ 
+ #include "mixer_io.h"
+diff --git a/src/pcm_hw.c b/src/pcm_hw.c
+index 5eb53be..2383ae0 100644
+--- a/src/pcm_hw.c
++++ b/src/pcm_hw.c
+@@ -41,6 +41,7 @@
+ #include <sys/ioctl.h>
+ #include <sys/mman.h>
+ #include <linux/ioctl.h>
++#include <time.h>
+ #include <sound/asound.h>
+ #include <tinyalsa/asoundlib.h>
+ 
+diff --git a/src/pcm_plugin.c b/src/pcm_plugin.c
+index 47bf4a5..b6b69aa 100644
+--- a/src/pcm_plugin.c
++++ b/src/pcm_plugin.c
+@@ -40,6 +40,7 @@
+ 
+ #include <sys/ioctl.h>
+ #include <linux/ioctl.h>
++#include <time.h>
+ #include <sound/asound.h>
+ #include <tinyalsa/asoundlib.h>
+ #include <tinyalsa/plugin.h>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
