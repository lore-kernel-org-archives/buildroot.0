Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BA6C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5D8E42CC7;
	Mon, 20 Feb 2023 21:17:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5D8E42CC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2zRpU_71RdAG; Mon, 20 Feb 2023 21:17:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 759F942CD5;
	Mon, 20 Feb 2023 21:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 759F942CD5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 298DA1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E208941593
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E208941593
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lD-SlQM2iQUD for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 118AB40C19
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 118AB40C19
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F2A986495; Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 21 Nov 2022 21:04:59 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b91eb32120d5a810a7f5a8bb2ad17baf16eedd6a
X-Git-Newrev: 7928c51bf625333102358ed1c9d84efe3e6bdc01
X-Patchwork-Hint: ignore
Message-Id: <20230220205152.0F2A986495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sdl2: fix sdl_init()
 error with kernel 5.15
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
