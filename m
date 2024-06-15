Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF19C27C7B
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 19:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8202C40A5E;
	Sat, 15 Jun 2024 19:04:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6_B7Mvd8xnPI; Sat, 15 Jun 2024 19:04:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5BE7408C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5BE7408C4;
	Sat, 15 Jun 2024 19:04:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 07B801BF2FC
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 19:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B4BF40603
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 19:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0fZymGeBx576 for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 19:04:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBCA940593
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBCA940593
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 19:04:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC3D187F13; Sat, 15 Jun 2024 19:04:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 20:35:53 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 276917e32a5df6c483cfb8a1cec4b22e2490f75a
X-Git-Newrev: 15025dbb181cd97da8f668d1ccafc4a46cdb99c5
X-Patchwork-Hint: ignore
Message-Id: <20240615190415.DC3D187F13@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/qt6base: avoid
 enabling both desktop and es2 opengl
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

commit: https://git.buildroot.net/buildroot/commit/?id=15025dbb181cd97da8f668d1ccafc4a46cdb99c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes the following error:

ERROR: Feature "opengles2": Forcing to "ON" breaks its condition:
    NOT WIN32 AND NOT WATCHOS AND NOT QT_FEATURE_opengl_desktop AND GLESv2_FOUND
Condition values dump:
    WIN32 = ""
    WATCHOS = "0"
    QT_FEATURE_opengl_desktop = "ON"
    GLESv2_FOUND = "TRUE"

CMake Error at cmake/QtBuildInformation.cmake:209 (message):
  Check the configuration messages for an error that has occurred.
Call Stack (most recent call first):
  cmake/QtBuildInformation.cmake:39 (qt_configure_print_summary)
  cmake/QtBuildRepoHelpers.cmake:332 (qt_print_feature_summary)
  CMakeLists.txt:208 (qt_build_repo_end)

To recreate the error, use the following defconfig (based on freescale_imx8mmevk_defconfig):

BR2_aarch64=y
BR2_ARM_FPU_VFPV3=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_GLOBAL_PATCH_DIR="board/freescale/common/patches"
BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mm-evk.dtb"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-5.10.y-1.0.0)/linux-imx-lf-5.10.y-1.0.0.tar.gz"
BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-evk freescale/imx8mm-evk-revb-qca-wifi"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_QT6=y
BR2_PACKAGE_QT6BASE_GUI=y
BR2_PACKAGE_QT6BASE_OPENGL=y
BR2_PACKAGE_FREESCALE_IMX=y
BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y
BR2_PACKAGE_FIRMWARE_IMX=y
BR2_PACKAGE_IMX_GPU_VIV=y
BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-5.10.y-1.0.0)/imx-atf-lf-5.10.y-1.0.0.tar.gz"
BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-5.10.y-1.0.0)/uboot-imx-lf-5.10.y-1.0.0.tar.gz"
BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mm_evk"
BR2_TARGET_UBOOT_NEEDS_DTC=y
BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
BR2_TARGET_UBOOT_SPL=y
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_IMX_MKIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y
BR2_PACKAGE_HOST_UBOOT_TOOLS=y
BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y

Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit e4b8380503a4ae78564133d1be94ab54cfe108e4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt6/qt6base/qt6base.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 6857725ef5..211808d2af 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -259,10 +259,15 @@ QT6BASE_CONF_OPTS += -DFEATURE_eglfs=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_QT6BASE_OPENGL_DESKTOP),y)
-QT6BASE_CONF_OPTS += -DFEATURE_opengl=ON -DFEATURE_opengl_desktop=ON
+QT6BASE_CONF_OPTS += \
+	-DFEATURE_opengl=ON \
+	-DFEATURE_opengl_desktop=ON
 QT6BASE_DEPENDENCIES += libgl
 else ifeq ($(BR2_PACKAGE_QT6BASE_OPENGL_ES2),y)
-QT6BASE_CONF_OPTS += -DFEATURE_opengl=ON -DFEATURE_opengles2=ON
+QT6BASE_CONF_OPTS += \
+	-DFEATURE_opengl=ON \
+	-DFEATURE_opengles2=ON \
+	-DFEATURE_opengl_desktop=OFF
 QT6BASE_DEPENDENCIES += libgles
 else
 QT6BASE_CONF_OPTS += -DFEATURE_opengl=OFF -DINPUT_opengl=no
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
