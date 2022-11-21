Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820E4C4332F
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 20:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C728840255;
	Mon, 21 Nov 2022 20:05:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C728840255
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5makoU-Fj7YM; Mon, 21 Nov 2022 20:05:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C21D6402DC;
	Mon, 21 Nov 2022 20:05:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C21D6402DC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 33E791BF34D
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 20:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1523060B69
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 20:05:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1523060B69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qlN2LjohnkJP for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 20:05:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AFE9607B0
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 20:05:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AFE9607B0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 166568405E; Mon, 21 Nov 2022 20:05:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 21 Nov 2022 21:04:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b91eb32120d5a810a7f5a8bb2ad17baf16eedd6a
X-Git-Newrev: 7928c51bf625333102358ed1c9d84efe3e6bdc01
X-Patchwork-Hint: ignore
Message-Id: <20221121200535.166568405E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl2: fix sdl_init() error with
 kernel 5.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=7928c51bf625333102358ed1c9d84efe3e6bdc01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes #6421
Backport from: da9ba3a2a1536017e4ce1ee0f4276578d1ce6e29

Signed-off-by: Michael Fischer <mf@go-sys.de>
[yann.morin.1998@free.fr: make it an actual backport]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
