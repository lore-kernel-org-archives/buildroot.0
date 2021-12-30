Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84A9C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 14:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 541D0400A8;
	Thu, 30 Dec 2021 14:08:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oLbMKPpBjt46; Thu, 30 Dec 2021 14:07:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF51A400F6;
	Thu, 30 Dec 2021 14:07:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 668ED1BF2BC
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 14:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 534AE40494
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 14:07:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DldAkShrl5ij for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 14:07:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AE7C4036F
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 14:07:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B646982DD9; Thu, 30 Dec 2021 14:01:24 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 15:07:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 76c251e943092000fb317997ac83878784c58d09
X-Git-Newrev: 012da8b9fab377a8f0eda3e8da3d8f12bea2a0cc
X-Patchwork-Hint: ignore
Message-Id: <20211230140124.B646982DD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-ati:
 update to the new API/ABI introduced in xserver > 21.0
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
Content-Type: multipart/mixed; boundary="===============2588611678464370207=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2588611678464370207==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=012da8b9fab377a8f0eda3e8da3d8f12bea2a0cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
In file included from radeon_textured_video.c:37:
radeon.h: In function ‘radeon_master_screen’:
radeon.h:187:15: error: ‘struct _Screen’ has no member named ‘current_master’
  187 |     if (screen->current_master)
      |               ^~

The API/ABI have changed in xserver 21.0 due to "some badly named variables/APIs" [1].

[1] https://gitlab.freedesktop.org/xorg/xserver/-/commit/ea47af87f692b291a988834c6f14d73a08cb1d75

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...anup-terminology-to-use-primary-secondary.patch | 371 +++++++++++++++++++++
 1 file changed, 371 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-video-ati/0002-ati-cleanup-terminology-to-use-primary-secondary.patch b/package/x11r7/xdriver_xf86-video-ati/0002-ati-cleanup-terminology-to-use-primary-secondary.patch
new file mode 100644
index 0000000000..ed8413b0cd
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-ati/0002-ati-cleanup-terminology-to-use-primary-secondary.patch
@@ -0,0 +1,371 @@
+From d96815a32431e0f434964a786013083bc0d835fc Mon Sep 17 00:00:00 2001
+From: Dave Airlie <airlied@redhat.com>
+Date: Mon, 13 Jul 2020 09:11:28 +1000
+Subject: [PATCH] ati: cleanup terminology to use primary/secondary
+
+The X server changed some API/ABIs here.
+
+Based on amdgpu patch by Michel
+
+(cherry picked from commit 8da3e4561ef82bb78c9a17b8cd8bf139b9cfd680)
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ man/radeon.man        |  2 +-
+ src/compat-api.h      |  6 ++++
+ src/drmmode_display.c |  4 +--
+ src/evergreen_state.h |  2 +-
+ src/r600_state.h      |  2 +-
+ src/radeon.h          | 10 +++---
+ src/radeon_exa.c      |  2 +-
+ src/radeon_glamor.c   |  2 +-
+ src/radeon_kms.c      | 74 +++++++++++++++++++++----------------------
+ 9 files changed, 55 insertions(+), 49 deletions(-)
+
+diff --git a/man/radeon.man b/man/radeon.man
+index dcebf537..247dcdb7 100644
+--- a/man/radeon.man
++++ b/man/radeon.man
+@@ -290,7 +290,7 @@ on. If this option is set, the default value of the property is 'on' or 'off'
+ accordingly. If this option isn't set, the default value of the property is
+ .B auto,
+ which means that TearFree is on for rotated outputs, outputs with RandR
+-transforms applied and for RandR 1.4 slave outputs, otherwise off.
++transforms applied and for RandR 1.4 secondary outputs, otherwise off.
+ .TP
+ .BI "Option \*qAccelMethod\*q \*q" "string" \*q
+ Chooses between available acceleration architectures.  Valid values are
+diff --git a/src/compat-api.h b/src/compat-api.h
+index f4e7524f..def6d3e4 100644
+--- a/src/compat-api.h
++++ b/src/compat-api.h
+@@ -34,4 +34,10 @@
+ #define BLOCKHANDLER_ARGS pScreen, pTimeout, pReadmask
+ #endif
+ 
++#if ABI_VIDEODRV_VERSION < SET_ABI_VERSION(25, 2)
++#define current_primary current_master
++#define primary_pixmap master_pixmap
++#define secondary_dst slave_dst
++#endif
++
+ #endif
+diff --git a/src/drmmode_display.c b/src/drmmode_display.c
+index 0e9e2474..3dec91e8 100644
+--- a/src/drmmode_display.c
++++ b/src/drmmode_display.c
+@@ -720,7 +720,7 @@ drmmode_crtc_prime_scanout_update(xf86CrtcPtr crtc, DisplayModePtr mode,
+ 		xorg_list_for_each_entry(dirty, &screen->pixmap_dirty_list,
+ 					 ent) {
+ 			if (radeon_dirty_src_equals(dirty, drmmode_crtc->prime_scanout_pixmap)) {
+-				dirty->slave_dst =
++				dirty->secondary_dst =
+ 					drmmode_crtc->scanout[scanout_id].pixmap;
+ 				break;
+ 			}
+@@ -1356,7 +1356,7 @@ drmmode_set_scanout_pixmap(xf86CrtcPtr crtc, PixmapPtr ppix)
+ 
+ 	xorg_list_for_each_entry(dirty, &screen->pixmap_dirty_list, ent) {
+ 		if (radeon_dirty_src_equals(dirty, drmmode_crtc->prime_scanout_pixmap)) {
+-			PixmapStopDirtyTracking(dirty->src, dirty->slave_dst);
++			PixmapStopDirtyTracking(dirty->src, dirty->secondary_dst);
+ 			break;
+ 		}
+ 	}
+diff --git a/src/evergreen_state.h b/src/evergreen_state.h
+index 7e54e1c7..34ba87b6 100644
+--- a/src/evergreen_state.h
++++ b/src/evergreen_state.h
+@@ -350,7 +350,7 @@ extern void *RADEONEXACreatePixmap2(ScreenPtr pScreen, int width, int height,
+ 				    int *new_pitch);
+ extern void RADEONEXADestroyPixmap(ScreenPtr pScreen, void *driverPriv);
+ extern Bool RADEONEXAPixmapIsOffscreen(PixmapPtr pPix);
+-extern Bool RADEONEXASharePixmapBacking(PixmapPtr ppix, ScreenPtr slave, void **handle_p);
++extern Bool RADEONEXASharePixmapBacking(PixmapPtr ppix, ScreenPtr secondary, void **handle_p);
+ extern Bool RADEONEXASetSharedPixmapBacking(PixmapPtr ppix, void *handle);
+ 
+ #endif
+diff --git a/src/r600_state.h b/src/r600_state.h
+index 34345996..567c3ca2 100644
+--- a/src/r600_state.h
++++ b/src/r600_state.h
+@@ -321,6 +321,6 @@ extern void *RADEONEXACreatePixmap2(ScreenPtr pScreen, int width, int height,
+ 				    int *new_pitch);
+ extern void RADEONEXADestroyPixmap(ScreenPtr pScreen, void *driverPriv);
+ extern Bool RADEONEXAPixmapIsOffscreen(PixmapPtr pPix);
+-extern Bool RADEONEXASharePixmapBacking(PixmapPtr ppix, ScreenPtr slave, void **handle_p);
++extern Bool RADEONEXASharePixmapBacking(PixmapPtr ppix, ScreenPtr secondary, void **handle_p);
+ extern Bool RADEONEXASetSharedPixmapBacking(PixmapPtr ppix, void *handle);
+ #endif
+diff --git a/src/radeon.h b/src/radeon.h
+index 2c913466..85fd0217 100644
+--- a/src/radeon.h
++++ b/src/radeon.h
+@@ -182,18 +182,18 @@ typedef enum {
+ 
+ 
+ static inline ScreenPtr
+-radeon_master_screen(ScreenPtr screen)
++radeon_primary_screen(ScreenPtr screen)
+ {
+-    if (screen->current_master)
+-	return screen->current_master;
++    if (screen->current_primary)
++	return screen->current_primary;
+ 
+     return screen;
+ }
+ 
+ static inline ScreenPtr
+-radeon_dirty_master(PixmapDirtyUpdatePtr dirty)
++radeon_dirty_primary(PixmapDirtyUpdatePtr dirty)
+ {
+-    return radeon_master_screen(dirty->slave_dst->drawable.pScreen);
++    return radeon_primary_screen(dirty->secondary_dst->drawable.pScreen);
+ }
+ 
+ static inline DrawablePtr
+diff --git a/src/radeon_exa.c b/src/radeon_exa.c
+index 268155ed..320ff992 100644
+--- a/src/radeon_exa.c
++++ b/src/radeon_exa.c
+@@ -282,7 +282,7 @@ void RADEONEXADestroyPixmap(ScreenPtr pScreen, void *driverPriv)
+     free(driverPriv);
+ }
+ 
+-Bool RADEONEXASharePixmapBacking(PixmapPtr ppix, ScreenPtr slave, void **fd_handle)
++Bool RADEONEXASharePixmapBacking(PixmapPtr ppix, ScreenPtr seconndary, void **fd_handle)
+ {
+     struct radeon_exa_pixmap_priv *driver_priv = exaGetPixmapDriverPrivate(ppix);
+ 
+diff --git a/src/radeon_glamor.c b/src/radeon_glamor.c
+index f1098381..ccf99941 100644
+--- a/src/radeon_glamor.c
++++ b/src/radeon_glamor.c
+@@ -366,7 +366,7 @@ radeon_glamor_set_pixmap_bo(DrawablePtr drawable, PixmapPtr pixmap)
+ 
+ 
+ static Bool
+-radeon_glamor_share_pixmap_backing(PixmapPtr pixmap, ScreenPtr slave,
++radeon_glamor_share_pixmap_backing(PixmapPtr pixmap, ScreenPtr secondary,
+ 				   void **handle_p)
+ {
+ 	ScreenPtr screen = pixmap->drawable.pScreen;
+diff --git a/src/radeon_kms.c b/src/radeon_kms.c
+index b3db7c41..62962d61 100644
+--- a/src/radeon_kms.c
++++ b/src/radeon_kms.c
+@@ -559,8 +559,8 @@ dirty_region(PixmapDirtyUpdatePtr dirty)
+ 	if (dirty->rotation != RR_Rotate_0) {
+ 		dstregion = transform_region(damageregion,
+ 					     &dirty->f_inverse,
+-					     dirty->slave_dst->drawable.width,
+-					     dirty->slave_dst->drawable.height);
++					     dirty->secondary_dst->drawable.width,
++					     dirty->secondary_dst->drawable.height);
+ 	} else
+ #endif
+ 	{
+@@ -568,7 +568,7 @@ dirty_region(PixmapDirtyUpdatePtr dirty)
+ 
+ 	    dstregion = RegionDuplicate(damageregion);
+ 	    RegionTranslate(dstregion, -dirty->x, -dirty->y);
+-	    PixmapRegionInit(&pixregion, dirty->slave_dst);
++	    PixmapRegionInit(&pixregion, dirty->secondary_dst);
+ 	    RegionIntersect(dstregion, dstregion, &pixregion);
+ 	    RegionUninit(&pixregion);
+ 	}
+@@ -585,8 +585,8 @@ redisplay_dirty(PixmapDirtyUpdatePtr dirty, RegionPtr region)
+ 	if (RegionNil(region))
+ 		goto out;
+ 
+-	if (dirty->slave_dst->master_pixmap)
+-	    DamageRegionAppend(&dirty->slave_dst->drawable, region);
++	if (dirty->secondary_dst->primary_pixmap)
++	    DamageRegionAppend(&dirty->secondary_dst->drawable, region);
+ 
+ #ifdef HAS_DIRTYTRACKING_ROTATION
+ 	PixmapSyncDirtyHelper(dirty);
+@@ -595,8 +595,8 @@ redisplay_dirty(PixmapDirtyUpdatePtr dirty, RegionPtr region)
+ #endif
+ 
+ 	radeon_cs_flush_indirect(src_scrn);
+-	if (dirty->slave_dst->master_pixmap)
+-	    DamageRegionProcessPending(&dirty->slave_dst->drawable);
++	if (dirty->secondary_dst->primary_pixmap)
++	    DamageRegionProcessPending(&dirty->secondary_dst->drawable);
+ 
+ out:
+ 	DamageEmpty(dirty->damage);
+@@ -613,12 +613,12 @@ radeon_prime_scanout_update_abort(xf86CrtcPtr crtc, void *event_data)
+ void
+ radeon_sync_shared_pixmap(PixmapDirtyUpdatePtr dirty)
+ {
+-    ScreenPtr master_screen = radeon_dirty_master(dirty);
++    ScreenPtr primary_screen = radeon_dirty_primary(dirty);
+     PixmapDirtyUpdatePtr ent;
+     RegionPtr region;
+ 
+-    xorg_list_for_each_entry(ent, &master_screen->pixmap_dirty_list, ent) {
+-	if (!radeon_dirty_src_equals(dirty, ent->slave_dst))
++    xorg_list_for_each_entry(ent, &primary_screen->pixmap_dirty_list, ent) {
++	if (!radeon_dirty_src_equals(dirty, ent->secondary_dst))
+ 	    continue;
+ 
+ 	region = dirty_region(ent);
+@@ -631,45 +631,45 @@ radeon_sync_shared_pixmap(PixmapDirtyUpdatePtr dirty)
+ #if HAS_SYNC_SHARED_PIXMAP
+ 
+ static Bool
+-master_has_sync_shared_pixmap(ScrnInfoPtr scrn, PixmapDirtyUpdatePtr dirty)
++primary_has_sync_shared_pixmap(ScrnInfoPtr scrn, PixmapDirtyUpdatePtr dirty)
+ {
+-    ScreenPtr master_screen = radeon_dirty_master(dirty);
++    ScreenPtr primary_screen = radeon_dirty_primary(dirty);
+ 
+-    return !!master_screen->SyncSharedPixmap;
++    return !!primary_screen->SyncSharedPixmap;
+ }
+ 
+ static Bool
+-slave_has_sync_shared_pixmap(ScrnInfoPtr scrn, PixmapDirtyUpdatePtr dirty)
++secondary_has_sync_shared_pixmap(ScrnInfoPtr scrn, PixmapDirtyUpdatePtr dirty)
+ {
+-    ScreenPtr slave_screen = dirty->slave_dst->drawable.pScreen;
++    ScreenPtr secondary_screen = dirty->secondary_dst->drawable.pScreen;
+ 
+-    return !!slave_screen->SyncSharedPixmap;
++    return !!secondary_screen->SyncSharedPixmap;
+ }
+ 
+ static void
+ call_sync_shared_pixmap(PixmapDirtyUpdatePtr dirty)
+ {
+-    ScreenPtr master_screen = radeon_dirty_master(dirty);
++    ScreenPtr primary_screen = radeon_dirty_primary(dirty);
+ 
+-    master_screen->SyncSharedPixmap(dirty);
++    primary_screen->SyncSharedPixmap(dirty);
+ }
+ 
+ #else /* !HAS_SYNC_SHARED_PIXMAP */
+ 
+ static Bool
+-master_has_sync_shared_pixmap(ScrnInfoPtr scrn, PixmapDirtyUpdatePtr dirty)
++primary_has_sync_shared_pixmap(ScrnInfoPtr scrn, PixmapDirtyUpdatePtr dirty)
+ {
+-    ScrnInfoPtr master_scrn = xf86ScreenToScrn(radeon_dirty_master(dirty));
++    ScrnInfoPtr primary_scrn = xf86ScreenToScrn(radeon_dirty_primary(dirty));
+ 
+-    return master_scrn->driverName == scrn->driverName;
++    return primary_scrn->driverName == scrn->driverName;
+ }
+ 
+ static Bool
+-slave_has_sync_shared_pixmap(ScrnInfoPtr scrn, PixmapDirtyUpdatePtr dirty)
++secondary_has_sync_shared_pixmap(ScrnInfoPtr scrn, PixmapDirtyUpdatePtr dirty)
+ {
+-    ScrnInfoPtr slave_scrn = xf86ScreenToScrn(dirty->slave_dst->drawable.pScreen);
++    ScrnInfoPtr secondary_scrn = xf86ScreenToScrn(dirty->secondary_dst->drawable.pScreen);
+ 
+-    return slave_scrn->driverName == scrn->driverName;
++    return secondary_scrn->driverName == scrn->driverName;
+ }
+ 
+ static void
+@@ -684,12 +684,12 @@ call_sync_shared_pixmap(PixmapDirtyUpdatePtr dirty)
+ static xf86CrtcPtr
+ radeon_prime_dirty_to_crtc(PixmapDirtyUpdatePtr dirty)
+ {
+-    ScreenPtr screen = dirty->slave_dst->drawable.pScreen;
++    ScreenPtr screen = dirty->secondary_dst->drawable.pScreen;
+     ScrnInfoPtr scrn = xf86ScreenToScrn(screen);
+     xf86CrtcConfigPtr xf86_config = XF86_CRTC_CONFIG_PTR(scrn);
+     int c;
+ 
+-    /* Find the CRTC which is scanning out from this slave pixmap */
++    /* Find the CRTC which is scanning out from this secondary pixmap */
+     for (c = 0; c < xf86_config->num_crtc; c++) {
+ 	xf86CrtcPtr xf86_crtc = xf86_config->crtc[c];
+ 	drmmode_crtc_private_ptr drmmode_crtc = xf86_crtc->driver_private;
+@@ -714,7 +714,7 @@ radeon_prime_scanout_do_update(xf86CrtcPtr crtc, unsigned scanout_id)
+ 	if (radeon_dirty_src_equals(dirty, drmmode_crtc->prime_scanout_pixmap)) {
+ 	    RegionPtr region;
+ 
+-	    if (master_has_sync_shared_pixmap(scrn, dirty))
++	    if (primary_has_sync_shared_pixmap(scrn, dirty))
+ 		call_sync_shared_pixmap(dirty);
+ 
+ 	    region = dirty_region(dirty);
+@@ -727,7 +727,7 @@ radeon_prime_scanout_do_update(xf86CrtcPtr crtc, unsigned scanout_id)
+ 		radeon_cs_flush_indirect(scrn);
+ 		RegionCopy(&drmmode_crtc->scanout_last_region, region);
+ 		RegionTranslate(region, -crtc->x, -crtc->y);
+-		dirty->slave_dst = drmmode_crtc->scanout[scanout_id].pixmap;
++		dirty->secondary_dst = drmmode_crtc->scanout[scanout_id].pixmap;
+ 	    }
+ 
+ 	    redisplay_dirty(dirty, region);
+@@ -754,7 +754,7 @@ radeon_prime_scanout_update_handler(xf86CrtcPtr crtc, uint32_t frame, uint64_t u
+ static void
+ radeon_prime_scanout_update(PixmapDirtyUpdatePtr dirty)
+ {
+-    ScreenPtr screen = dirty->slave_dst->drawable.pScreen;
++    ScreenPtr screen = dirty->secondary_dst->drawable.pScreen;
+     ScrnInfoPtr scrn = xf86ScreenToScrn(screen);
+     RADEONEntPtr pRADEONEnt = RADEONEntPriv(scrn);
+     xf86CrtcPtr xf86_crtc = radeon_prime_dirty_to_crtc(dirty);
+@@ -818,7 +818,7 @@ radeon_prime_scanout_update(PixmapDirtyUpdatePtr dirty)
+ static void
+ radeon_prime_scanout_flip(PixmapDirtyUpdatePtr ent)
+ {
+-    ScreenPtr screen = ent->slave_dst->drawable.pScreen;
++    ScreenPtr screen = ent->secondary_dst->drawable.pScreen;
+     ScrnInfoPtr scrn = xf86ScreenToScrn(screen);
+     RADEONEntPtr pRADEONEnt = RADEONEntPriv(scrn);
+     xf86CrtcPtr crtc = radeon_prime_dirty_to_crtc(ent);
+@@ -893,11 +893,11 @@ radeon_dirty_update(ScrnInfoPtr scrn)
+ 		if (screen->isGPU) {
+ 			PixmapDirtyUpdatePtr region_ent = ent;
+ 
+-			if (master_has_sync_shared_pixmap(scrn, ent)) {
+-				ScreenPtr master_screen = radeon_dirty_master(ent);
++			if (primary_has_sync_shared_pixmap(scrn, ent)) {
++				ScreenPtr primary_screen = radeon_dirty_primary(ent);
+ 
+-				xorg_list_for_each_entry(region_ent, &master_screen->pixmap_dirty_list, ent) {
+-					if (radeon_dirty_src_equals(ent, region_ent->slave_dst))
++				xorg_list_for_each_entry(region_ent, &primary_screen->pixmap_dirty_list, ent) {
++					if (radeon_dirty_src_equals(ent, region_ent->secondary_dst))
+ 						break;
+ 				}
+ 			}
+@@ -921,7 +921,7 @@ radeon_dirty_update(ScrnInfoPtr scrn)
+ 
+ 			RegionDestroy(region);
+ 		} else {
+-			if (slave_has_sync_shared_pixmap(scrn, ent))
++			if (secondary_has_sync_shared_pixmap(scrn, ent))
+ 				continue;
+ 
+ 			region = dirty_region(ent);
+@@ -1216,7 +1216,7 @@ static void RADEONBlockHandler_KMS(BLOCKHANDLER_ARGS_DECL)
+     (*pScreen->BlockHandler) (BLOCKHANDLER_ARGS);
+     pScreen->BlockHandler = RADEONBlockHandler_KMS;
+ 
+-    if (!xf86ScreenToScrn(radeon_master_screen(pScreen))->vtSema)
++    if (!xf86ScreenToScrn(radeon_primary_screen(pScreen))->vtSema)
+ 	return;
+ 
+     if (!pScreen->isGPU)
+@@ -2584,7 +2584,7 @@ CARD32 cleanup_black_fb(OsTimerPtr timer, CARD32 now, pointer data)
+     xf86CrtcConfigPtr xf86_config = XF86_CRTC_CONFIG_PTR(scrn);
+     int c;
+ 
+-    if (xf86ScreenToScrn(radeon_master_screen(screen))->vtSema)
++    if (xf86ScreenToScrn(radeon_primary_screen(screen))->vtSema)
+ 	return 0;
+ 
+     /* Unreference the all-black FB created by RADEONLeaveVT_KMS. After
+-- 
+2.31.1
+

--===============2588611678464370207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2588611678464370207==--
