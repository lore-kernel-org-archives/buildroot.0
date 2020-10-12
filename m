From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Oct 2020 22:31:57 +0200
Subject: [Buildroot] [git commit] configs/chromebook_elm: bump to Linux v5.9
Message-ID: <20201012202105.EB0B78F5C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=537e237608079a50a8f72c777c2fd5c9be82b227
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the chromebook elm configuration to use v5.9 instead of an
intermediate release candidate.

At the latter stages of the v5.9 release, a patch was added which
broke the Chromebook Elm HDMI. Therefore add a revert patch to get rid
of this problem. The fix (and the revert) are already on the mailing
list (https://lkml.org/lkml/2020/10/10/32) and should become available
with v5.10

Signed-off-by: Bilal Wasim <bilal.wasim@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...mediatek-dsi-Fix-scrolling-of-panel-with-.patch | 41 ++++++++++++++++++++++
 configs/chromebook_elm_defconfig                   |  2 +-
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/board/chromebook/elm/patches/linux/0006-Revert-drm-mediatek-dsi-Fix-scrolling-of-panel-with-.patch b/board/chromebook/elm/patches/linux/0006-Revert-drm-mediatek-dsi-Fix-scrolling-of-panel-with-.patch
new file mode 100644
index 0000000000..43bffe5261
--- /dev/null
+++ b/board/chromebook/elm/patches/linux/0006-Revert-drm-mediatek-dsi-Fix-scrolling-of-panel-with-.patch
@@ -0,0 +1,41 @@
+From 51109530891c981b681816152bd205724deabcca Mon Sep 17 00:00:00 2001
+From: Jitao Shi <jitao.shi@mediatek.com>
+Date: Sat, 10 Oct 2020 15:09:09 +0800
+Subject: [PATCH] Revert "drm/mediatek: dsi: Fix scrolling of panel with small
+ hfp or hbp"
+
+This reverts commit 35bf948f1edbf507f6e57e0879fa6ea36d2d2930.
+
+Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
+Reviewed-by: Bilal Wasim <bilal.wasim@imgtec.com>
+Tested-by: Bilal Wasim <bilal.wasim@imgtec.com>
+---
+ drivers/gpu/drm/mediatek/mtk_dsi.c | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
+index 80b7a082e874..16fd99dcdacf 100644
+--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
++++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
+@@ -466,13 +466,14 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
+ 	horizontal_sync_active_byte = (vm->hsync_len * dsi_tmp_buf_bpp - 10);
+ 
+ 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
+-		horizontal_backporch_byte = vm->hback_porch * dsi_tmp_buf_bpp;
++		horizontal_backporch_byte =
++			(vm->hback_porch * dsi_tmp_buf_bpp - 10);
+ 	else
+-		horizontal_backporch_byte = (vm->hback_porch + vm->hsync_len) *
+-					    dsi_tmp_buf_bpp;
++		horizontal_backporch_byte = ((vm->hback_porch + vm->hsync_len) *
++			dsi_tmp_buf_bpp - 10);
+ 
+ 	data_phy_cycles = timing->lpx + timing->da_hs_prepare +
+-			  timing->da_hs_zero + timing->da_hs_exit;
++			  timing->da_hs_zero + timing->da_hs_exit + 3;
+ 
+ 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
+ 		if ((vm->hfront_porch + vm->hback_porch) * dsi_tmp_buf_bpp >
+-- 
+2.25.1
+
diff --git a/configs/chromebook_elm_defconfig b/configs/chromebook_elm_defconfig
index 0c8e0a42bf..05e82ffc31 100644
--- a/configs/chromebook_elm_defconfig
+++ b/configs/chromebook_elm_defconfig
@@ -12,7 +12,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.9-rc5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.9"
 
 # Build Kernel with a Custom config.
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
