Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDACC4332F
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 12:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DECC40910;
	Mon, 21 Nov 2022 12:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DECC40910
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bQycslWX-yno; Mon, 21 Nov 2022 12:40:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59753408BE;
	Mon, 21 Nov 2022 12:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59753408BE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D79D1BF399
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 12:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79556813CB
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 12:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79556813CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tnyPoILdVebJ for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 12:40:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DC1781391
Received: from smtprelay03.ispgateway.de (smtprelay03.ispgateway.de
 [80.67.18.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0DC1781391
 for <buildroot@busybox.net>; Mon, 21 Nov 2022 12:40:19 +0000 (UTC)
Received: from [91.21.124.120] (helo=exchange.go-sys.de)
 by smtprelay03.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (Exim 4.94.2)
 (envelope-from <mf@go-sys.de>) id 1ox66j-0007Xq-Ai
 for buildroot@busybox.net; Mon, 21 Nov 2022 13:41:05 +0100
Received: from exchange.go-sys.local (192.168.1.17) by exchange.go-sys.local
 (192.168.1.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.2507.16; Mon, 21
 Nov 2022 13:40:15 +0100
Received: from go-sys.de (192.168.1.127) by exchange.go-sys.de (192.168.1.17)
 with Microsoft SMTP Server id 15.1.2507.16 via Frontend Transport;
 Mon, 21 Nov 2022 13:40:15 +0100
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
Date: Mon, 21 Nov 2022 13:40:01 +0100
Message-ID: <20221121124001.24170-1-mf@go-sys.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-C2ProcessedOrg: 77b28032-c882-4527-ad15-de6c89cb71cd
X-CrossPremisesHeadersFilteredBySendConnector: exchange.go-sys.local
X-OrganizationHeadersPreserved: exchange.go-sys.local
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
Subject: [Buildroot] [PATCH 1/1] package/sdl2: fix sdl_init() error with
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
Cc: Michael Fischer <mf@go-sys.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes #6421
Backport from: da9ba3a2a1536017e4ce1ee0f4276578d1ce6e29

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 package/sdl2/0001-fix-CRTC-default-mode.patch | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 package/sdl2/0001-fix-CRTC-default-mode.patch

diff --git a/package/sdl2/0001-fix-CRTC-default-mode.patch b/package/sdl2/0001-fix-CRTC-default-mode.patch
new file mode 100644
index 0000000000..5efc3f55c2
--- /dev/null
+++ b/package/sdl2/0001-fix-CRTC-default-mode.patch
@@ -0,0 +1,66 @@
+Patch to fix SDL_Init() error with kernel 5.15.x
+Thanks to Sam Lantinga <slouken@libsdl.org> for his help.
+Fix: #6421
+
+Backported from: da9ba3a2a1536017e4ce1ee0f4276578d1ce6e29
+
+Signed-off-by: Michael Fischer <mf@go-sys.de>
+
+
+diff --git a/src/video/kmsdrm/SDL_kmsdrmvideo.c b/src/video/kmsdrm/SDL_kmsdrmvideo.c
+index eae7214551a9..eeeefef2b2c1 100644
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
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
