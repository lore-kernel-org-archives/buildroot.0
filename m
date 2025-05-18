Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A333C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 20:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F288A4052A;
	Sun, 18 May 2025 20:42:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9UW8AZ48egNs; Sun, 18 May 2025 20:42:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FF234055C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FF234055C;
	Sun, 18 May 2025 20:42:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BF8C11BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B087160E44
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:41:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iWxlNX5-Ox9Y for <buildroot@buildroot.org>;
 Sun, 18 May 2025 20:41:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE0F060B61
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE0F060B61
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:41:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB4A887320; Sun, 18 May 2025 20:41:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 22:41:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8adccf8df811b850c718c7659b26af420207bb9
X-Git-Newrev: faf2b8a6277c1a10ca08e5ad8ecb488d70a03de4
X-Patchwork-Hint: ignore
Message-Id: <20250518204156.BB4A887320@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-gpu-viv: enable
 aarch64 framebuffer support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=faf2b8a6277c1a10ca08e5ad8ecb488d70a03de4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Back when the imx-gpu-viv package was enabled on AArch64 in commit
84afda9ca6dad5fd828ba94fa60df52c81cc7814, the fb output option was not
enabled.

However, according to meta-freescale [0] the framebuffer output can be
enabled on IMX8 by using the wayland libraries together with egl.pc.

[0] https://git.yoctoproject.org/meta-freescale/tree/recipes-graphics/imx-gpu-viv/imx-gpu-viv-6.inc

This commit does enable fb output on AArch64, which requires a few
precautions as the imx-gpu-viv logic is a bit convoluted:

- FB on ARM is supported using "pure" framebuffer libraries. However,
  a specific egl.pc is needed: egl_linuxfb.pc. The supporting
  libraries are found in the fb/ subdirectory in imx-gpu-viv "code".

- FB on AArch64 is supported using libraries that are linked with
  wayland and libdrm, even though wayland/libdrm is obviously not used
  for framebuffer output. pkg-config wise, this configuration can use
  the default egl.pc. The supporting libraries are found in the
  wayland/ subdirectory in imx-gpu-viv "code", as oddly as it seems.

- Wayland on ARM on AArch64 is supported using libraries that are
  obviously linked against wayland and libdrm. pkg-config wise, egl.pc
  needs to be symlinked to egl_wayland.pc.

This patch solves this situation by introducing a hidden boolean
option BR2_PACKAGE_IMX_GPU_VIV_USES_WAYLAND that indicates whether
wayland/libdrm is used by the currently selected output. This is of
course true when BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL, but also when
BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB on AArch64.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
[Thomas: quite significant rework compared to the submission from
Daniel Lang, so we didn't keep the Reviewed-by from Gary Bisson]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-gpu-viv/Config.in      | 17 +++++++++++------
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 22 +++++++++++++---------
 2 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index 0a1be6ec13..392f004787 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -12,9 +12,6 @@ config BR2_PACKAGE_IMX_GPU_VIV
 	depends on (BR2_arm && BR2_ARM_EABIHF) || BR2_aarch64
 	# Library binaries are linked against libc.so.6
 	depends on BR2_TOOLCHAIN_USES_GLIBC
-	# Library binaries are linked against libdrm.so.2, except framebuffer
-	# output on ARM
-	select BR2_PACKAGE_LIBDRM if !(BR2_arm && BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB)
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
 	# gbm is only available in the aarch64 blobs
@@ -34,6 +31,13 @@ config BR2_PACKAGE_IMX_GPU_VIV
 	  This library is provided by Freescale as-is and doesn't have
 	  an upstream.
 
+# Library binaries are linked against libdrm.so.2 and libwayland,
+# except framebuffer output on ARM
+config BR2_PACKAGE_IMX_GPU_VIV_USES_WAYLAND
+	bool
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_WAYLAND
+
 if BR2_PACKAGE_IMX_GPU_VIV
 
 choice
@@ -45,12 +49,13 @@ choice
 
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
 	bool "Framebuffer"
-	# The i.MX8 aarch64 blob doesn't support FB output
-	depends on BR2_arm
+	# Yes, the ARM64 framebuffer libraries link against
+	# libdrm/libwayland.
+	select BR2_PACKAGE_IMX_GPU_VIV_USES_WAYLAND if BR2_aarch64
 
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
 	bool "Wayland"
-	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_IMX_GPU_VIV_USES_WAYLAND
 
 endchoice
 
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 14bcbb99d3..8494e875e2 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -27,20 +27,24 @@ endif
 
 IMX_GPU_VIV_OUTPUT = $(call qstrip,$(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT))
 
-# Libraries are linked against libdrm, except framebuffer output on ARM
-ifneq ($(IMX_GPU_VIV_OUTPUT)$(BR2_arm),fby)
-IMX_GPU_VIV_DEPENDENCIES += libdrm
-endif
-
-ifeq ($(IMX_GPU_VIV_OUTPUT),wayland)
-IMX_GPU_VIV_DEPENDENCIES += wayland
+ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_USES_WAYLAND),y)
+IMX_GPU_VIV_DEPENDENCIES += libdrm wayland
+IMX_GPU_VIV_LIBDIR = wayland
+else
+IMX_GPU_VIV_LIBDIR = fb
 endif
 
 define IMX_GPU_VIV_EXTRACT_CMDS
 	$(call NXP_EXTRACT_HELPER,$(IMX_GPU_VIV_DL_DIR)/$(IMX_GPU_VIV_SOURCE))
 endef
 
-ifeq ($(IMX_GPU_VIV_OUTPUT),fb)
+# The package comes with multiple versions of egl.pc,
+# depending on the output the original egl.pc is replaced
+# with a symlink:
+# - arm/frambuffer: symlink to egl_linuxfb.pc
+# - aarch64/framebuffer: original egl.pc without a symlink
+# - wayland: symblink to egl_wayland.pc
+ifeq ($(IMX_GPU_VIV_OUTPUT):$(BR2_arm),fb:y)
 define IMX_GPU_VIV_FIXUP_PKGCONFIG
 	ln -sf egl_linuxfb.pc $(@D)/gpu-core/usr/lib/pkgconfig/egl.pc
 endef
@@ -61,7 +65,7 @@ endif
 # in the upstream archive here. We also remove unused backend files.
 # Make sure these commands are idempotent.
 define IMX_GPU_VIV_BUILD_CMDS
-	cp -dpfr $(@D)/gpu-core/usr/lib/$(IMX_GPU_VIV_OUTPUT)/* $(@D)/gpu-core/usr/lib/
+	cp -dpfr $(@D)/gpu-core/usr/lib/$(IMX_GPU_VIV_LIBDIR)/* $(@D)/gpu-core/usr/lib/
 	$(foreach backend,fb wayland, \
 		$(RM) -r $(@D)/gpu-core/usr/lib/$(backend)
 	)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
