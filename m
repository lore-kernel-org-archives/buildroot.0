Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089C8C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 18:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC66340148;
	Sat,  8 Jan 2022 18:06:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 64G5WRQ6MfTR; Sat,  8 Jan 2022 18:06:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9A0240127;
	Sat,  8 Jan 2022 18:06:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6136A1BF593
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8690B4012A
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:04:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VmXY8aShwc-A for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 18:04:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E93B40136
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 18:04:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B9354832CE; Sat,  8 Jan 2022 17:58:45 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 19:04:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc715b13b50d2f19c2d534f794a5345e61ee179f
X-Git-Newrev: 627464367ea7a3ea76a25beebed9a8f069b3cfc0
X-Patchwork-Hint: ignore
Message-Id: <20220108175845.B9354832CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-gpu-viv: declare
 as a libgbm provider
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

commit: https://git.buildroot.net/buildroot/commit/?id=627464367ea7a3ea76a25beebed9a8f069b3cfc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Interestingly, only the aarch64 blobs provide libgbm support. This
will help in fixing an issue that exists today, where ARM32 +
imx-gpu-viv + wayland + qt5 fails to build, because qt5 is told that
libgbm is available, i.e the following configuration:

 BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_INIT_NONE=y
 BR2_SYSTEM_BIN_SH_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
 BR2_PACKAGE_QT5=y
 BR2_PACKAGE_QT5BASE_GUI=y
 BR2_PACKAGE_QT5BASE_EGLFS=y
 BR2_PACKAGE_FREESCALE_IMX=y
 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q=y
 BR2_PACKAGE_IMX_GPU_VIV=y
 BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL=y
 # BR2_TARGET_ROOTFS_TAR is not set

fails to build during the qt5base configure step with:

ERROR: Feature 'gbm' was enabled, but the pre-condition 'libs.gbm' failed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-gpu-viv/Config.in      | 11 +++++++++++
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk |  5 +++++
 2 files changed, 16 insertions(+)

diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index f465167acd..9ba3d0428e 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -17,6 +17,10 @@ config BR2_PACKAGE_IMX_GPU_VIV
 	select BR2_PACKAGE_LIBDRM if !(BR2_arm && BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB)
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
+	# gbm is only available in the aarch64 blobs
+	select BR2_PACKAGE_HAS_LIBGBM if BR2_aarch64
+	select BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF if BR2_aarch64
+	select BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT if BR2_aarch64
 	select BR2_PACKAGE_HAS_LIBOPENCL
 	select BR2_PACKAGE_HAS_LIBOPENVG
 	help
@@ -82,6 +86,13 @@ config BR2_PACKAGE_PROVIDES_LIBOPENCL
 config BR2_PACKAGE_PROVIDES_LIBOPENVG
 	default "imx-gpu-viv"
 
+if BR2_aarch64
+
+config BR2_PACKAGE_PROVIDES_LIBGBM
+	default "imx-gpu-viv"
+
+endif
+
 config BR2_PACKAGE_IMX_GPU_VIV_EXAMPLES
 	bool "install examples"
 	# example binaries are linked against libstdc++.so.6
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index ace025c656..1d76d79e2b 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -19,6 +19,11 @@ IMX_GPU_VIV_LICENSE_FILES = EULA COPYING
 IMX_GPU_VIV_REDISTRIBUTE = NO
 
 IMX_GPU_VIV_PROVIDES = libegl libgles libopencl libopenvg
+
+ifeq ($(BR2_aarch64),y)
+IMX_GPU_VIV_PROVIDES += libgbm
+endif
+
 IMX_GPU_VIV_LIB_TARGET = $(call qstrip,$(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT))
 
 ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
