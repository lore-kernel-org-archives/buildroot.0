Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7098FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 14:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2948440270;
	Thu, 30 Dec 2021 14:07:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R3AJCOm0C6RF; Thu, 30 Dec 2021 14:07:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7088C401FF;
	Thu, 30 Dec 2021 14:07:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD4C51C113E
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 14:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AADB40494
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 14:07:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G2Llzz-72GtF for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 14:07:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A33FF40378
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 14:07:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BF13682DB5; Thu, 30 Dec 2021 14:01:24 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 15:07:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 012da8b9fab377a8f0eda3e8da3d8f12bea2a0cc
X-Git-Newrev: d12925603417c99bbeab693734b208a8dfbff26b
X-Patchwork-Hint: ignore
Message-Id: <20211230140124.BF13682DB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-ati:
 Guard local variable priv only used with glamor
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
Content-Type: multipart/mixed; boundary="===============6214534477653261937=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6214534477653261937==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d12925603417c99bbeab693734b208a8dfbff26b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
radeon_present.c: In function ‘radeon_present_check_flip’:
radeon_present.c:281:21: error: invalid use of undefined type ‘struct radeon_pixmap’
  281 |     if (priv && priv->fb_failed)
      |                     ^~

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...local-variable-priv-only-used-with-glamor.patch | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-video-ati/0003-Guard-local-variable-priv-only-used-with-glamor.patch b/package/x11r7/xdriver_xf86-video-ati/0003-Guard-local-variable-priv-only-used-with-glamor.patch
new file mode 100644
index 0000000000..0a23c54cce
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-ati/0003-Guard-local-variable-priv-only-used-with-glamor.patch
@@ -0,0 +1,66 @@
+From a78e31b5fffadd73b00483f21e54bd144f1b439a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>
+Date: Fri, 26 Mar 2021 17:42:10 +0100
+Subject: [PATCH] Guard local variable priv only used with glamor
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes compile errors with glamor disabled:
+
+../../src/radeon_present.c: In function ‘radeon_present_check_flip’:
+../../src/radeon_present.c:281:21: error: invalid use of undefined type ‘struct radeon_pixmap’
+  281 |     if (priv && priv->fb_failed)
+      |                     ^~
+../../src/radeon_present.c:288:19: error: invalid use of undefined type ‘struct radeon_pixmap’
+  288 |  if (priv && !priv->fb_failed) {
+      |                   ^~
+../../src/radeon_present.c:292:10: error: invalid use of undefined type ‘struct radeon_pixmap’
+  292 |      priv->fb_failed = TRUE;
+      |          ^~
+
+(cherry picked from commit 3c7c84ed49564907a148ae99b03200e0be350060)
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/radeon_present.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/radeon_present.c b/src/radeon_present.c
+index 494655c9..d010aa19 100644
+--- a/src/radeon_present.c
++++ b/src/radeon_present.c
+@@ -254,7 +254,9 @@ radeon_present_check_flip(RRCrtcPtr crtc, WindowPtr window, PixmapPtr pixmap,
+     xf86CrtcPtr xf86_crtc = crtc->devPrivate;
+     ScreenPtr screen = window->drawable.pScreen;
+     ScrnInfoPtr scrn = xf86_crtc->scrn;
++#ifdef USE_GLAMOR
+     struct radeon_pixmap *priv = radeon_get_pixmap_private(pixmap);
++#endif
+     xf86CrtcConfigPtr config = XF86_CRTC_CONFIG_PTR(scrn);
+     RADEONInfoPtr info = RADEONPTR(scrn);
+     PixmapPtr screen_pixmap = screen->GetScreenPixmap(screen);
+@@ -278,10 +280,13 @@ radeon_present_check_flip(RRCrtcPtr crtc, WindowPtr window, PixmapPtr pixmap,
+ 	return FALSE;
+ #endif
+ 
++#ifdef USE_GLAMOR
+     if (priv && priv->fb_failed)
+ 	return FALSE;
++#endif
+ 
+     if (!radeon_pixmap_get_fb(pixmap)) {
++#ifdef USE_GLAMOR
+ 	if (!priv)
+ 	    priv = radeon_get_pixmap_private(pixmap);
+ 
+@@ -291,6 +296,7 @@ radeon_present_check_flip(RRCrtcPtr crtc, WindowPtr window, PixmapPtr pixmap,
+ 		       "normal if using PRIME render offloading)\n");
+ 	    priv->fb_failed = TRUE;
+ 	}
++#endif
+ 
+ 	return FALSE;
+     }
+-- 
+2.31.1
+

--===============6214534477653261937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6214534477653261937==--
