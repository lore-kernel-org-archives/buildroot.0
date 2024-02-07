Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FC9C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 15:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F277822F5;
	Wed,  7 Feb 2024 15:19:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n8HnQsNwbCpG; Wed,  7 Feb 2024 15:19:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67C898238A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67C898238A;
	Wed,  7 Feb 2024 15:19:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D4ED1BF471
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89EC8405E2
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:18:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JclDwQ8YRasl for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 15:18:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C256405FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C256405FB
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 15:18:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 933B2875C5; Wed,  7 Feb 2024 15:18:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 16:18:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f1e1b1b171618952725bffdbe73827e062735c4
X-Git-Newrev: 8b114822e9897d33089cd7203edbf3d7cb7dd5d6
X-Patchwork-Hint: ignore
Message-Id: <20240207151854.933B2875C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: fix drisw build without
 dri3
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b114822e9897d33089cd7203edbf3d7cb7dd5d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mesa3d 23.3 added dri3_priv.h header and dri3_check_multibuffer() function in
drisw (part of swrast gallium driver) that can be build without dri3.

  i686-buildroot-linux-gnu/bin/ld: src/glx/libglx.a.p/drisw_glx.c.o: in function `driswCreateScreenDriver':
  drisw_glx.c:(.text.driswCreateScreenDriver+0x3a0): undefined reference to `dri3_check_multibuffer'
  collect2: error: ld returned 1 exit status

Add HAVE_DRI3 guard around dri3_priv.h header and the zink code using
dri3_check_multibuffer().

While testing again the TestGlxinfo runtime test, a new unexpected error line
appeared in the glxinfo log:

  MESA-LOADER: failed to open zink: /usr/lib/dri/zink_dri.so

mesa3d try to load zink gallium driver even if it was not enabled at
build time, indeed there is no such option in Buildroot.

Apply patches sent upstream:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6093854455

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../mesa3d/0006-drisw-fix-build-without-dri3.patch | 58 ++++++++++++++++++++++
 ...ext-don-t-try-zink-if-not-enabled-in-mesa.patch | 42 ++++++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/package/mesa3d/0006-drisw-fix-build-without-dri3.patch b/package/mesa3d/0006-drisw-fix-build-without-dri3.patch
new file mode 100644
index 0000000000..ab27d384cf
--- /dev/null
+++ b/package/mesa3d/0006-drisw-fix-build-without-dri3.patch
@@ -0,0 +1,58 @@
+From 3ab46dcfda9edf5c9bc27c8f5031146d9d9d8ade Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Thu, 18 Jan 2024 22:50:16 +0100
+Subject: [PATCH] drisw: fix build without dri3
+
+commit 1887368df41 ("glx/sw: check for modifier support in the kopper path")
+added dri3_priv.h header and dri3_check_multibuffer() function in drisw that
+can be build without dri3.
+
+  i686-buildroot-linux-gnu/bin/ld: src/glx/libglx.a.p/drisw_glx.c.o: in function `driswCreateScreenDriver':
+  drisw_glx.c:(.text.driswCreateScreenDriver+0x3a0): undefined reference to `dri3_check_multibuffer'
+  collect2: error: ld returned 1 exit status
+
+Add HAVE_DRI3 guard around dri3_priv.h header and the zink code using
+dri3_check_multibuffer().
+
+Fixes: 1887368df41 ("glx/sw: check for modifier support in the kopper path")
+
+Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ src/glx/drisw_glx.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/glx/drisw_glx.c b/src/glx/drisw_glx.c
+index 3d3f75259bc..4b19e2d7707 100644
+--- a/src/glx/drisw_glx.c
++++ b/src/glx/drisw_glx.c
+@@ -32,7 +32,9 @@
+ #include <dlfcn.h>
+ #include "dri_common.h"
+ #include "drisw_priv.h"
++#ifdef HAVE_DRI3
+ #include "dri3_priv.h"
++#endif
+ #include <X11/extensions/shmproto.h>
+ #include <assert.h>
+ #include <vulkan/vulkan_core.h>
+@@ -995,6 +997,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
+        goto handle_error;
+    }
+ 
++#ifdef HAVE_DRI3
+    if (pdpyp->zink) {
+       bool err;
+       psc->has_multibuffer = dri3_check_multibuffer(priv->dpy, &err);
+@@ -1005,6 +1008,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
+          goto handle_error;
+       }
+    }
++#endif
+ 
+    glx_config_destroy_list(psc->base.configs);
+    psc->base.configs = configs;
+-- 
+2.43.0
+
diff --git a/package/mesa3d/0007-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch b/package/mesa3d/0007-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
new file mode 100644
index 0000000000..f9e4d50fd7
--- /dev/null
+++ b/package/mesa3d/0007-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
@@ -0,0 +1,42 @@
+From 83b4ff6616708bd7ba5981d22cd5211ca6787d58 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Wed, 24 Jan 2024 14:28:32 +0100
+Subject: [PATCH] glxext: don't try zink if not enabled in mesa
+
+Commit 7d9ea77b459 ("glx: add automatic zink fallback loading between hw and sw drivers")
+added an automatic zink fallback even when the zink gallium is not
+enabled at build time.
+
+It leads to unexpected error log while loading drisw driver and
+zink is not installed on the rootfs:
+
+  MESA-LOADER: failed to open zink: /usr/lib/dri/zink_dri.so
+
+Fixes: 7d9ea77b459 ("glx: add automatic zink fallback loading between hw and sw drivers")
+
+Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ src/glx/glxext.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/glx/glxext.c b/src/glx/glxext.c
+index 39d5f08bdcf..e106eb40046 100644
+--- a/src/glx/glxext.c
++++ b/src/glx/glxext.c
+@@ -904,9 +904,11 @@ __glXInitialize(Display * dpy)
+ #endif /* HAVE_DRI3 */
+       if (!debug_get_bool_option("LIBGL_DRI2_DISABLE", false))
+          dpyPriv->dri2Display = dri2CreateDisplay(dpy);
++#if defined(HAVE_ZINK)
+       if (!dpyPriv->dri3Display && !dpyPriv->dri2Display)
+          try_zink = !debug_get_bool_option("LIBGL_KOPPER_DISABLE", false) &&
+                     !getenv("GALLIUM_DRIVER");
++#endif /* HAVE_ZINK */
+    }
+ #endif /* GLX_USE_DRM */
+    if (glx_direct)
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
