Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3279FC4332F
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 18:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE3934087C;
	Sat, 26 Nov 2022 18:29:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE3934087C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sXbx8fJawHcU; Sat, 26 Nov 2022 18:29:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75E1841706;
	Sat, 26 Nov 2022 18:29:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75E1841706
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C59A31BF85D
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADF7781BBD
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADF7781BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1rfeWPph9PpM for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 18:29:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D95AB81B60
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 18:29:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D95AB81B60
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C653A844C9; Sat, 26 Nov 2022 18:29:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 26 Nov 2022 17:55:22 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 75fbc14769b6097e75572008a3dce0dc446c2a7a
X-Git-Newrev: 695c51db81dacc0f06457f011de30bb9a0b7dfc6
X-Patchwork-Hint: ignore
Message-Id: <20221126182902.C653A844C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/sdl2: fix
 sdl_init() error with kernel 5.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=695c51db81dacc0f06457f011de30bb9a0b7dfc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Fixes #6421
Backport from: da9ba3a2a1536017e4ce1ee0f4276578d1ce6e29

Signed-off-by: Michael Fischer <mf@go-sys.de>
[yann.morin.1998@free.fr: make it an actual backport]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7928c51bf625333102358ed1c9d84efe3e6bdc01)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...oesn-t-have-a-mode-configured-use-the-pre.patch | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/package/sdl2/0001-If-a-CRTC-doesn-t-have-a-mode-configured-use-the-pre.patch b/package/sdl2/0001-If-a-CRTC-doesn-t-have-a-mode-configured-use-the-pre.patch
new file mode 100644
index 0000000000..c8be280c56
--- /dev/null
+++ b/package/sdl2/0001-If-a-CRTC-doesn-t-have-a-mode-configured-use-the-pre.patch
@@ -0,0 +1,76 @@
+From da9ba3a2a1536017e4ce1ee0f4276578d1ce6e29 Mon Sep 17 00:00:00 2001
+From: Sam Lantinga <slouken@libsdl.org>
+Date: Fri, 18 Nov 2022 12:17:27 -0800
+Subject: [PATCH] If a CRTC doesn't have a mode configured, use the preferred
+ or largest mode as the default mode
+
+Fixes https://github.com/libsdl-org/SDL/issues/6421
+
+[mf@go-sys.de: backport from upstream]
+Signed-off-by: Michael Fischer <mf@go-sys.de>
+[yann.morin.1998@free.fr: do an actual backport]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ src/video/kmsdrm/SDL_kmsdrmvideo.c | 35 +++++++++++++++++++++++++-----
+ 1 file changed, 29 insertions(+), 6 deletions(-)
+
+diff --git a/src/video/kmsdrm/SDL_kmsdrmvideo.c b/src/video/kmsdrm/SDL_kmsdrmvideo.c
+index eae721455..eeeefef2b 100644
+--- a/src/video/kmsdrm/SDL_kmsdrmvideo.c
++++ b/src/video/kmsdrm/SDL_kmsdrmvideo.c
+@@ -666,8 +666,8 @@ KMSDRM_CrtcGetVrr(uint32_t drm_fd, uint32_t crtc_id)
+ /* Gets a DRM connector, builds an SDL_Display with it, and adds it to the
+    list of SDL Displays in _this->displays[]  */
+ static void
+-KMSDRM_AddDisplay (_THIS, drmModeConnector *connector, drmModeRes *resources) {
+-
++KMSDRM_AddDisplay (_THIS, drmModeConnector *connector, drmModeRes *resources)
++{
+     SDL_VideoData *viddata = ((SDL_VideoData *)_this->driverdata);
+     SDL_DisplayData *dispdata = NULL;
+     SDL_VideoDisplay display = {0};
+@@ -770,14 +770,37 @@ KMSDRM_AddDisplay (_THIS, drmModeConnector *connector, drmModeRes *resources) {
+         drmModeModeInfo *mode = &connector->modes[i];
+ 
+         if (!SDL_memcmp(mode, &crtc->mode, sizeof(crtc->mode))) {
+-          mode_index = i;
+-          break;
++            mode_index = i;
++            break;
+         }
+     }
+ 
+     if (mode_index == -1) {
+-      ret = SDL_SetError("Failed to find index of mode attached to the CRTC.");
+-      goto cleanup;
++        int current_area, largest_area = 0;
++
++        /* Find the preferred mode or the highest resolution mode */
++        for (i = 0; i < connector->count_modes; i++) {
++            drmModeModeInfo *mode = &connector->modes[i];
++
++            if (mode->type & DRM_MODE_TYPE_PREFERRED) {
++                mode_index = i;
++                break;
++            }
++
++            current_area = mode->hdisplay * mode->vdisplay;
++            if (current_area > largest_area) {
++                mode_index = i;
++                largest_area = current_area;
++            }
++        }
++        if (mode_index != -1) {
++            crtc->mode = connector->modes[mode_index];
++        }
++    }
++
++    if (mode_index == -1) {
++        ret = SDL_SetError("Failed to find index of mode attached to the CRTC.");
++        goto cleanup;
+     }
+ 
+     /*********************************************/
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
