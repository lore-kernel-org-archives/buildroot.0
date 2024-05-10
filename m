Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976EDC25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 06:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D1FC402F2;
	Fri, 10 May 2024 06:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8SPyMth8PY9w; Fri, 10 May 2024 06:32:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2182640B32
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2182640B32;
	Fri, 10 May 2024 06:32:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B3991BF846
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 06:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3848C843FC
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 06:32:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2PtWDIAmZ48F for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 06:32:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2BD00843F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BD00843F7
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BD00843F7
 for <buildroot@buildroot.org>; Fri, 10 May 2024 06:32:42 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2e27277d2c1so20985861fa.2
 for <buildroot@buildroot.org>; Thu, 09 May 2024 23:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715322760; x=1715927560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3woimAAFG94SBQ8JKkZ8xLaSSbHLB+o1/Q1RZXlJLLs=;
 b=JedjyOGaeB9uK6ThJQUrzdePBUS7e3qXvjf+B0DEFeJmJgQUsJf7uTmlJFQHP1JTM3
 TbssV38C7Y97WxKvNgA4OYXbyl1xrKWTf+YS4a5EkibBcW2It62IOFc8X7c/wff+j7bi
 yBIMMH4Na06EOl/bzLFMLdHGm2MaScyIdL+ihKYTJCkJfUZ486hRxMsgPqa5xNqJ294C
 3SYuxV6qyYbk+rNsU+iq8yLk3bImrc+MoUoIPOCxchWe8G482fedZq6oR8npCsjAgc5d
 IUKyaVf4KbtpssIAd1jV4M2UyALtlskzBZS+owZDfn/rZ5pi9TziB0DA3nrPYxlSco8i
 LSLg==
X-Gm-Message-State: AOJu0YyCH9i3FH5P6YkmmGE8A8TFW1GaKSHlcavJ4hhBcD4bM5qyBQAl
 k7LEWuFGRoXccebE+wEK3vOX9okQgZDdyU3GCRZuKU0tcU4oj4keP1mvpQ==
X-Google-Smtp-Source: AGHT+IEVD0oRR4mdWLgBuv/6HRkUT4WrJ7AavxlAjDRzzWzbk+cUjVdSIXoNtYHx5IFYHGS8Pzymsg==
X-Received: by 2002:a2e:9891:0:b0:2da:736d:3cf5 with SMTP id
 38308e7fff4ca-2e5203a467cmr8588901fa.41.1715322759621; 
 Thu, 09 May 2024 23:32:39 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d162058esm4111551fa.124.2024.05.09.23.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 23:32:38 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 08:31:51 +0200
Message-ID: <20240510063152.758956-1-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <1924534>
References: <1924534>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715322760; x=1715927560; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3woimAAFG94SBQ8JKkZ8xLaSSbHLB+o1/Q1RZXlJLLs=;
 b=fRV4mn58twgGDmjy6SvDkOxtVCv32LUbrtT5a/GfsM6xJ6aO9/mDdz4fkkAOP47DuU
 3pX/bM+sN5NBplr66b0HRbhgM0sUU6A6RnjGn+18IjaC8kbQ1Yu5zar1N92st4JD6t+D
 fBDzJPjmw+MoEpbnXPe1dG1onmm1x1xfXiB3ssZMkrplvkSoWKcEwZSqn9wEtVhXq6y6
 Q8NVuwrsw5vlQkUgLM3r8+UZJVlJ4fRErUjrjZrBjf8fz955EUWIwsQCIGnL4h1nJnBq
 IDbdJGypjvh9DD51qJZqEaks3j+9N12dFFkA45B71w+5T68+KxdUzxoBOEzFSziAesDJ
 Hzpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fRV4mn58
Subject: [Buildroot] [PATCH 1/1] package/qt6base: avoid enabling both
 desktop and es2 opengl
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
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
---
Changes:
  - Move this change from series '[v2,01/11] package/qt6: bump version to 6.7.0' 
    into a standalone patch since it also affects the current qt6.4.3.
  - Add a simple defconfig to the commit message for recreating the build error.
    (Suggested by Thomas)

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
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
