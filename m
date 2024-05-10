Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7871C25B4F
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 07:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F777614C9;
	Fri, 10 May 2024 07:34:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ipy8fYIB9JeA; Fri, 10 May 2024 07:34:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A9B7614CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A9B7614CA;
	Fri, 10 May 2024 07:34:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F349D1BF5DC
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 07:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECDAC42327
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 07:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wN_9frKHTkTh for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 07:34:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 848F542323
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 848F542323
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 848F542323
 for <buildroot@buildroot.org>; Fri, 10 May 2024 07:34:44 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-51f3a49ff7dso2210856e87.2
 for <buildroot@buildroot.org>; Fri, 10 May 2024 00:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715326482; x=1715931282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wIwwj1lcln7utDLyR8ETByxTlqG9N1fiEBei5xEiNcI=;
 b=NKCm+jMMSPiwllj+5F1P58U+qoM4UZltw1MowMBtnBq2ncBh+vwMYWD/Ib5xPqocUY
 yF6gN5hwKMrJrvjNEo+aH1iZQIGkdU+RsZsC+eVt/+TWLZWLe1W0kZW/ymI6Eg2Ps3V3
 BX2et9saSpF8G3xEIwbw0pgOEA3XtNBdESYEJ6gqLwHgZeMqVPX5lYZhfzAdlwfMAU5B
 30LRasNY9MnyiC95IUcdvnVkeyGnkMO/NyZ65IKyDj0tBw/tTgZvjhTUCb34NF+NRJOu
 M8C+Y4mW3bR3vO1dbmTUuhMrbb1TPYuFa8mWjbB3oqUoKRhrMHYXTDRXMnfzQOYxDozr
 aqzg==
X-Gm-Message-State: AOJu0Yx4lFk416dZoBHuM8tVwSuCQ49ZIfGxx6xJCprkq21Eyxu7eqwS
 vGtceBil3/FKgfdUURzL5VQOC8sP5tQ2bXat2DZP9UW6vU9L8+9aMbJiwA==
X-Google-Smtp-Source: AGHT+IHF3+q8HX/JLf0wVjP1zwEdFvDi7lb3dnErbYpC3Pj54LsIpAsnk98Nr+zD0DCqJgmBNlhXag==
X-Received: by 2002:ac2:5479:0:b0:51f:4144:98fb with SMTP id
 2adb3069b0e04-5221027bcd2mr1006197e87.67.1715326481619; 
 Fri, 10 May 2024 00:34:41 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ba779sm601293e87.86.2024.05.10.00.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 00:34:41 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 09:32:12 +0200
Message-ID: <20240510073213.806802-1-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <1933723>
References: <1933723>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715326482; x=1715931282; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wIwwj1lcln7utDLyR8ETByxTlqG9N1fiEBei5xEiNcI=;
 b=AMO2OrCtJcb17/mZLLeXZvPxAZi6q66Ivg/J1J09XWnMfYFtw+RVFYtEimMyNWu23t
 gKPtaFKhazW2vPYxivQc4s9ciM9+7yzifXLV4OyReWmOG+nijH4doSLYNGuvNJuIqYBN
 /4rzMzR+kEKk+K9NiCVB28iU2apson06mSdFCmZK18hvleqQu9fYah4okKczUA0rV2yp
 ii1z9iM1sRM5IWcoUcOY+fwyvlS0+ol6OzAfOJy2WHm2N919zy4EwM+qORExBIX+6wSy
 pBh/2zsURcRNzVHNGWpoNaFh/InKjIPu2M9ex9pTpx/lHi0WNRRF59bSOTo+L2Z/kd50
 qaqg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AMO2OrCt
Subject: [Buildroot] [PATCH v2 1/1] package/qt6base: avoid enabling both
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
---
Changes v1 -> v2:
  - Increase BR2_TARGET_ROOTFS_EXT2_SIZE in the defconfig above to make room for
    the qt6.

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
