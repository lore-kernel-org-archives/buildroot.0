Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFAEC433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Apr 2022 19:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74386612CD;
	Thu,  7 Apr 2022 19:57:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ae-8M8MZTz1E; Thu,  7 Apr 2022 19:57:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62B06612C7;
	Thu,  7 Apr 2022 19:57:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 76B731BF282
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 19:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 642A141860
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 19:57:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wl6p0KopiIcF for <buildroot@lists.busybox.net>;
 Thu,  7 Apr 2022 19:57:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60490417E5
 for <buildroot@buildroot.org>; Thu,  7 Apr 2022 19:57:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E54ED83700; Thu,  7 Apr 2022 19:48:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 7 Apr 2022 21:54:16 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: ab52b73a66de60c0adc007a032d814c390592799
X-Git-Newrev: cf458ccc3864f975e56a719e01f18d3caf8c2d8d
X-Patchwork-Hint: ignore
Message-Id: <20220407194802.E54ED83700@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libcamera-apps:
 fix X11 preview compile (conversion from Window to EGLNativeWindowType)
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
Content-Type: multipart/mixed; boundary="===============9141465523070725122=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9141465523070725122==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cf458ccc3864f975e56a719e01f18d3caf8c2d8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

- add 002-preview-fix-egl_preview-compile-conversion-from-Wind.patch

Fixes:

  .../build/libcamera-apps-2d1009e3badcc8047361ff81149ad6cba3b911b5/preview/egl_preview.cpp:329:69: error: invalid conversion from ‘Window’ {aka ‘long unsigned int’} to ‘EGLNativeWindowType’ {aka ‘fbdev_window*’} [-fpermissive]
    329 |         egl_surface_ = eglCreateWindowSurface(egl_display_, config, window_, NULL);
        |                                                                     ^~~~~~~
        |                                                                     |
        |                                                                     Window {aka long unsigned int}

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 94b5778c82e4fdaa43ab40102648257330cbda0c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-egl_preview-compile-conversion-from-Wind.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/libcamera-apps/0002-preview-fix-egl_preview-compile-conversion-from-Wind.patch b/package/libcamera-apps/0002-preview-fix-egl_preview-compile-conversion-from-Wind.patch
new file mode 100644
index 0000000000..cc9069aa86
--- /dev/null
+++ b/package/libcamera-apps/0002-preview-fix-egl_preview-compile-conversion-from-Wind.patch
@@ -0,0 +1,39 @@
+From 60715769cd5368a63b2bdc2e6d6bb6df0030a54d Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 31 Mar 2022 21:44:22 +0200
+Subject: [PATCH] preview: fix egl_preview compile (conversion from Window to
+ EGLNativeWindowType)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+  .../build/libcamera-apps-2d1009e3badcc8047361ff81149ad6cba3b911b5/preview/egl_preview.cpp:329:69: error: invalid conversion from ‘Window’ {aka ‘long unsigned int’} to ‘EGLNativeWindowType’ {aka ‘fbdev_window*’} [-fpermissive]
+    329 |         egl_surface_ = eglCreateWindowSurface(egl_display_, config, window_, NULL);
+        |                                                                     ^~~~~~~
+        |                                                                     |
+        |                                                                     Window {aka long unsigned int}
+
+[Upstream: https://github.com/raspberrypi/libcamera-apps/pull/283]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ preview/egl_preview.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/preview/egl_preview.cpp b/preview/egl_preview.cpp
+index b936e57..593583d 100644
+--- a/preview/egl_preview.cpp
++++ b/preview/egl_preview.cpp
+@@ -326,7 +326,7 @@ void EglPreview::makeWindow(char const *name)
+ 	wm_delete_window_ = XInternAtom(display_, "WM_DELETE_WINDOW", False);
+ 	XSetWMProtocols(display_, window_, &wm_delete_window_, 1);
+ 
+-	egl_surface_ = eglCreateWindowSurface(egl_display_, config, window_, NULL);
++	egl_surface_ = eglCreateWindowSurface(egl_display_, config, reinterpret_cast<EGLNativeWindowType>(window_), NULL);
+ 	if (!egl_surface_)
+ 		throw std::runtime_error("eglCreateWindowSurface failed");
+ 
+-- 
+2.35.1
+

--===============9141465523070725122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9141465523070725122==--
