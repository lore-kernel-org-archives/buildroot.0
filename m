Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44415C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 10:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9F254093F;
	Mon,  7 Mar 2022 10:42:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m6gdpwyyVpZY; Mon,  7 Mar 2022 10:42:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E38F040910;
	Mon,  7 Mar 2022 10:42:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 336AE1BF3A8
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 10:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20DEA40396
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 10:42:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BGOvs_bpN7tf for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 10:42:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04DB24012D
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 10:42:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3E4AD82A91; Mon,  7 Mar 2022 10:33:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 11:35:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5beea70361d08cf737c6be4fafd7f8e32b8434b4
X-Git-Newrev: b78caa449844fa12b5dbc89bde28786999a3b238
X-Patchwork-Hint: ignore
Message-Id: <20220307103351.3E4AD82A91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-nouveau:
 fix build error
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

commit: https://git.buildroot.net/buildroot/commit/?id=b78caa449844fa12b5dbc89bde28786999a3b238
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream commit to fix build with xorg-server 21.1 which was bumped
with commit d9185c6ba38430a017ed996c4180e141881ba570.

No autobuild errors found yet.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...nouveau-fixup-driver-for-new-X-server-ABI.patch | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-video-nouveau/0001-nouveau-fixup-driver-for-new-X-server-ABI.patch b/package/x11r7/xdriver_xf86-video-nouveau/0001-nouveau-fixup-driver-for-new-X-server-ABI.patch
new file mode 100644
index 0000000000..96be4909e7
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-nouveau/0001-nouveau-fixup-driver-for-new-X-server-ABI.patch
@@ -0,0 +1,68 @@
+From e80e73ced69b15662103d0fd6837db4ce6c6eb5b Mon Sep 17 00:00:00 2001
+From: Dave Airlie <airlied@redhat.com>
+Date: Mon, 13 Jul 2020 09:20:15 +1000
+Subject: [PATCH] nouveau: fixup driver for new X server ABI
+
+Downloaded from upstream commit
+https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/-/commit/e80e73ced69b15662103d0fd6837db4ce6c6eb5b
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/compat-api.h  | 4 ++++
+ src/nouveau_exa.c | 2 +-
+ src/nv_driver.c   | 6 +++---
+ 3 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/src/compat-api.h b/src/compat-api.h
+index fde2f4b..8a1fcf9 100644
+--- a/src/compat-api.h
++++ b/src/compat-api.h
+@@ -102,4 +102,8 @@
+ 
+ #endif
+ 
++#if ABI_VIDEODRV_VERSION < SET_ABI_VERSION(25, 2)
++#define secondary_dst slave_dst
++#endif
++
+ #endif
+diff --git a/src/nouveau_exa.c b/src/nouveau_exa.c
+index 55df6f8..db3b112 100644
+--- a/src/nouveau_exa.c
++++ b/src/nouveau_exa.c
+@@ -157,7 +157,7 @@ nouveau_exa_destroy_pixmap(ScreenPtr pScreen, void *priv)
+ 
+ #ifdef NOUVEAU_PIXMAP_SHARING
+ static Bool
+-nouveau_exa_share_pixmap_backing(PixmapPtr ppix, ScreenPtr slave, void **handle_p)
++nouveau_exa_share_pixmap_backing(PixmapPtr ppix, ScreenPtr secondary, void **handle_p)
+ {
+ 	struct nouveau_bo *bo = nouveau_pixmap_bo(ppix);
+ 	struct nouveau_pixmap *nvpix = nouveau_pixmap(ppix);
+diff --git a/src/nv_driver.c b/src/nv_driver.c
+index e72a6b6..f9ab4af 100644
+--- a/src/nv_driver.c
++++ b/src/nv_driver.c
+@@ -559,16 +559,16 @@ redisplay_dirty(ScreenPtr screen, PixmapDirtyUpdatePtr dirty)
+ {
+ 	RegionRec pixregion;
+ 
+-	PixmapRegionInit(&pixregion, dirty->slave_dst);
++	PixmapRegionInit(&pixregion, dirty->secondary_dst);
+ 
+-	DamageRegionAppend(&dirty->slave_dst->drawable, &pixregion);
++	DamageRegionAppend(&dirty->secondary_dst->drawable, &pixregion);
+ #ifdef HAS_DIRTYTRACKING_ROTATION
+ 	PixmapSyncDirtyHelper(dirty);
+ #else
+ 	PixmapSyncDirtyHelper(dirty, &pixregion);
+ #endif
+ 
+-	DamageRegionProcessPending(&dirty->slave_dst->drawable);
++	DamageRegionProcessPending(&dirty->secondary_dst->drawable);
+ 	RegionUninit(&pixregion);
+ }
+ 
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
