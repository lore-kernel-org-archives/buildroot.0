Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D8BC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B26942EA5;
	Fri, 28 Feb 2025 16:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mFa3K-gHOcqW; Fri, 28 Feb 2025 16:41:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A97C4F753
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A97C4F753;
	Fri, 28 Feb 2025 16:41:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10EBA711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83894419D4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BMMxZliCj4md for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6AEB419B6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6AEB419B6
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2EED820F8; Fri, 28 Feb 2025 16:29:42 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 19:35:11 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b0207c1f15c12011782e46233effa61f5acbfcad
X-Git-Newrev: edffcbcee95b3e25aca2d7a158311df609c8328d
X-Patchwork-Hint: ignore
Message-Id: <20250228162942.C2EED820F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/zynqmp_kria*: fix
 u-boot boot hang
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=edffcbcee95b3e25aca2d7a158311df609c8328d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

If the u-boot DP driver attempts to configure the Kria SOM DP before it is
released from reset, it will cause a boot hang.  Since the KV260 uses the DP
by default, this patch needs to be included with buildroot until it is part
of a u-boot-xlnx release tag.

While only the KV260 is directly affected, there is no issue with applying
this patch to all 3 zynqmp_kria defconfigs.

This patch has also been committed to u-boot upstream.

Upstream: https://github.com/u-boot/u-boot/commit/8b81010a2fe385524b58bea9116f1b6954c3d2bd

Signed-off-by: Neal Frager <neal.frager@amd.com>
[Julien: fix check-package error by adding Upstream tag in patch]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-video-zynqmp-add-support-for-reset.patch  | 42 ++++++++++++++++++++++
 configs/zynqmp_kria_kd240_defconfig                |  2 +-
 configs/zynqmp_kria_kr260_defconfig                |  2 +-
 configs/zynqmp_kria_kv260_defconfig                |  2 +-
 4 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/board/zynqmp/kria/patches/uboot/0001-video-zynqmp-add-support-for-reset.patch b/board/zynqmp/kria/patches/uboot/0001-video-zynqmp-add-support-for-reset.patch
new file mode 100644
index 0000000000..ded030b3b2
--- /dev/null
+++ b/board/zynqmp/kria/patches/uboot/0001-video-zynqmp-add-support-for-reset.patch
@@ -0,0 +1,42 @@
+From: Michal Simek <michal.simek@amd.com>
+Date: Mon, 9 Dec 2024 12:11:50 +0100
+Subject: [PATCH] video: zynqmp: Add support for reset
+
+In Kria SOM configuration DP is under reset and access to DP is causing
+hang that's why call reset at probe to avoid this situation.
+
+Signed-off-by: Michal Simek <michal.simek@amd.com>
+Link: https://lore.kernel.org/r/0504474a91a9839828aecd37f8855fd154cdf2e1.1733742708.git.michal.simek@amd.com
+Upstream: https://github.com/u-boot/u-boot/commit/8b81010a2fe385524b58bea9116f1b6954c3d2bd
+---
+ drivers/video/zynqmp/zynqmp_dpsub.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/drivers/video/zynqmp/zynqmp_dpsub.c b/drivers/video/zynqmp/zynqmp_dpsub.c
+index 76abfeac4433..52af23c3c835 100644
+--- a/drivers/video/zynqmp/zynqmp_dpsub.c
++++ b/drivers/video/zynqmp/zynqmp_dpsub.c
+@@ -11,6 +11,7 @@
+ #include <dm.h>
+ #include <errno.h>
+ #include <generic-phy.h>
++#include <reset.h>
+ #include <stdlib.h>
+ #include <video.h>
+ #include <wait_bit.h>
+@@ -2093,10 +2094,15 @@ static int zynqmp_dpsub_probe(struct udevice *dev)
+ {
+ 	struct video_priv *uc_priv = dev_get_uclass_priv(dev);
+ 	struct zynqmp_dpsub_priv *priv = dev_get_priv(dev);
++	struct reset_ctl_bulk resets;
+ 	struct clk clk;
+ 	int ret;
+ 	int mode = RGBA8888;
+ 
++	ret = reset_get_bulk(dev, &resets);
++	if (!ret)
++		reset_deassert_bulk(&resets);
++
+ 	ret = clk_get_by_name(dev, "dp_apb_clk", &clk);
+ 	if (ret < 0) {
+ 		dev_err(dev, "failed to get clock\n");
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index d47c3e27e5..8e841df2e8 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kd240/kd240.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index 6f2e88b47e..809cdd0dde 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kr260/kr260.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 9aed096e5d..92d44c2b64 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kv260/kv260.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
