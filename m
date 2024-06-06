Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0E3C27C52
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 20:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68CAB849B7;
	Thu,  6 Jun 2024 20:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Urj00eioQ4zR; Thu,  6 Jun 2024 20:07:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 330F48498E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 330F48498E;
	Thu,  6 Jun 2024 20:07:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00A4E1BF577
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 20:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEB6F8498E
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 20:07:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e-5_0XEnbDZN for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 20:07:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 81C0184989
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81C0184989
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81C0184989
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 20:07:27 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-627eb38eb1bso10642277b3.1
 for <buildroot@buildroot.org>; Thu, 06 Jun 2024 13:07:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717704446; x=1718309246;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CxvKYsRsWWlKaJb850D31L4XNEr5tjmYyuIzvi1dP44=;
 b=Fn1v2rsSnDgTGsvMlMXuwrXQGi20f5VZR+iv4sMI3koI/C76vtvG1n/KmCMRjFEudg
 BCaAnI+KeMinD65YhGSTa+ZSbTrjZYSVt3TesbzbosNKeFJqMuwPg+iMfR51LyVo9xgS
 gsdFSJzsMkFcPom+LTcJEs6wv7vfkbP0Cl1efvR3G8YU+1GNLFw5o0+tKOp1x3R5QOPj
 UbpuqJ5wWrgp+WQy7RKVc5P07cC3rVK61RXk4pKruSYc7gvxwdJMTzlrqnwBFx3PYJLw
 ZrTFc4WgxM9ZD1goHUw2hYDnxKHAVwSTIFWPDvnSrb3C5fkCvCvn7/sRD99i/DTI5QYi
 wSBw==
X-Gm-Message-State: AOJu0YylPu78yZ44QR5GkN1L9dgdqlDAV4N5U2+zzIYhsxIs3nIkIBRj
 7aNs6WZikZ2q2K1b+kVoi+pmhy6VvjLXG1HQ8bbB10xeR1KWfKhpG8woqWGtzehn6Flaznkr7fN
 nmpj5Af7L77eByQDG2X0Z16SnTWaNYg==
X-Google-Smtp-Source: AGHT+IH2NqWh94wiHqB10i18GSV1AGXZij2S8unOexVImp2uzT2F898CIg5luUIU/7djkSkIPtWSaWhWa3nOGJ0+0rE=
X-Received: by 2002:a81:5cd7:0:b0:615:1ad2:1102 with SMTP id
 00721157ae682-62cd55715dbmr4321477b3.11.1717704446153; Thu, 06 Jun 2024
 13:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240606185627.F334387C00@busybox.osuosl.org>
In-Reply-To: <20240606185627.F334387C00@busybox.osuosl.org>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Thu, 6 Jun 2024 22:07:14 +0200
Message-ID: <CA+R_deruBAg+M356X420td6qnhewMF5N8dPtjohV4OcQ9hGU8w@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717704446; x=1718309246; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CxvKYsRsWWlKaJb850D31L4XNEr5tjmYyuIzvi1dP44=;
 b=khTKZIRSJh4hS/NQYvlTd1OLAHb/gtWVwh/Rdi/5XtZl2KwVg0LJ9TKGORYejd7LTb
 pkITBnQ3buHnwKr+EYt3MoxwE2zZRYXvkTXl4sMqHaMUmkoyjoLAKUCBe3vmCWhREjw9
 YiVoynQsuUqcP9PMyueDvVBXIhgtsGbjJXa48BjPnTEbrEHCYF1yFJUgfEOaX4AISqhv
 T2xvZt5pmIDpk/Ony4Yj5/audWcgq1q9rMAhE/ReiwPjjs98xOG6MI+loOA5/4BdNLS0
 NioSk2Z62Ts4/vTd9VpeX5yCB0pUNiprdFw3n53A9X4kqSnNsJ11vGFlDf8hQ8n4CRYq
 /MEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=khTKZIRS
Subject: Re: [Buildroot] [git commit] package/qt6base: avoid enabling both
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2275919125051525040=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2275919125051525040==
Content-Type: multipart/alternative; boundary="000000000000579e0c061a3e3b29"

--000000000000579e0c061a3e3b29
Content-Type: text/plain; charset="UTF-8"

Hi Arnout,

Thanks for your feedback. I'lll try to simplify my commit messages.

Best regards,
Roy

tor. 6. juni 2024 kl. 20:56 skrev Arnout Vandecappelle via buildroot <
buildroot@buildroot.org>:

> commit:
> https://git.buildroot.net/buildroot/commit/?id=e4b8380503a4ae78564133d1be94ab54cfe108e4
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Fixes the following error:
>
> ERROR: Feature "opengles2": Forcing to "ON" breaks its condition:
>     NOT WIN32 AND NOT WATCHOS AND NOT QT_FEATURE_opengl_desktop AND
> GLESv2_FOUND
> Condition values dump:
>     WIN32 = ""
>     WATCHOS = "0"
>     QT_FEATURE_opengl_desktop = "ON"
>     GLESv2_FOUND = "TRUE"
>
> CMake Error at cmake/QtBuildInformation.cmake:209 (message):
>   Check the configuration messages for an error that has occurred.
> Call Stack (most recent call first):
>   cmake/QtBuildInformation.cmake:39 (qt_configure_print_summary)
>   cmake/QtBuildRepoHelpers.cmake:332 (qt_print_feature_summary)
>   CMakeLists.txt:208 (qt_build_repo_end)
>
> To recreate the error, use the following defconfig (based on
> freescale_imx8mmevk_defconfig):
>
> BR2_aarch64=y
> BR2_ARM_FPU_VFPV3=y
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_GLOBAL_PATCH_DIR="board/freescale/common/patches"
> BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
> BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh
> board/freescale/common/imx/post-image.sh"
> BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mm-evk.dtb"
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call
> github,nxp-imx,linux-imx,lf-5.10.y-1.0.0)/linux-imx-lf-5.10.y-1.0.0.tar.gz"
> BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
> BR2_LINUX_KERNEL_DTS_SUPPORT=y
> BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-evk
> freescale/imx8mm-evk-revb-qca-wifi"
> BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> BR2_PACKAGE_QT6=y
> BR2_PACKAGE_QT6BASE_GUI=y
> BR2_PACKAGE_QT6BASE_OPENGL=y
> BR2_PACKAGE_FREESCALE_IMX=y
> BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y
> BR2_PACKAGE_FIRMWARE_IMX=y
> BR2_PACKAGE_IMX_GPU_VIV=y
> BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV=y
> BR2_TARGET_ROOTFS_EXT2=y
> BR2_TARGET_ROOTFS_EXT2_4=y
> BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
> BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call
> github,nxp-imx,imx-atf,lf-5.10.y-1.0.0)/imx-atf-lf-5.10.y-1.0.0.tar.gz"
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
> BR2_TARGET_UBOOT=y
> BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call
> github,nxp-imx,uboot-imx,lf-5.10.y-1.0.0)/uboot-imx-lf-5.10.y-1.0.0.tar.gz"
> BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mm_evk"
> BR2_TARGET_UBOOT_NEEDS_DTC=y
> BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
> BR2_TARGET_UBOOT_SPL=y
> BR2_PACKAGE_HOST_DOSFSTOOLS=y
> BR2_PACKAGE_HOST_GENIMAGE=y
> BR2_PACKAGE_HOST_IMX_MKIMAGE=y
> BR2_PACKAGE_HOST_MTOOLS=y
> BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
>
> Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
> Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
> ---
>  package/qt6/qt6base/qt6base.mk | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/
> qt6base.mk
> index 6857725ef5..211808d2af 100644
> --- a/package/qt6/qt6base/qt6base.mk
> +++ b/package/qt6/qt6base/qt6base.mk
> @@ -259,10 +259,15 @@ QT6BASE_CONF_OPTS += -DFEATURE_eglfs=OFF
>  endif
>
>  ifeq ($(BR2_PACKAGE_QT6BASE_OPENGL_DESKTOP),y)
> -QT6BASE_CONF_OPTS += -DFEATURE_opengl=ON -DFEATURE_opengl_desktop=ON
> +QT6BASE_CONF_OPTS += \
> +       -DFEATURE_opengl=ON \
> +       -DFEATURE_opengl_desktop=ON
>  QT6BASE_DEPENDENCIES += libgl
>  else ifeq ($(BR2_PACKAGE_QT6BASE_OPENGL_ES2),y)
> -QT6BASE_CONF_OPTS += -DFEATURE_opengl=ON -DFEATURE_opengles2=ON
> +QT6BASE_CONF_OPTS += \
> +       -DFEATURE_opengl=ON \
> +       -DFEATURE_opengles2=ON \
> +       -DFEATURE_opengl_desktop=OFF
>  QT6BASE_DEPENDENCIES += libgles
>  else
>  QT6BASE_CONF_OPTS += -DFEATURE_opengl=OFF -DINPUT_opengl=no
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000579e0c061a3e3b29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Arnout,</div><div><br></div><div>Thanks for your f=
eedback. I&#39;lll try to simplify my commit messages.<br></div><div><br></=
div><div>Best regards,</div><div>Roy<br></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">tor. 6. juni 2024 kl. 20:56 s=
krev Arnout Vandecappelle via buildroot &lt;<a href=3D"mailto:buildroot@bui=
ldroot.org">buildroot@buildroot.org</a>&gt;:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">commit: <a href=3D"https://git.buildroot.net/b=
uildroot/commit/?id=3De4b8380503a4ae78564133d1be94ab54cfe108e4" rel=3D"nore=
ferrer" target=3D"_blank">https://git.buildroot.net/buildroot/commit/?id=3D=
e4b8380503a4ae78564133d1be94ab54cfe108e4</a><br>
branch: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3Drefs/he=
ads/master" rel=3D"noreferrer" target=3D"_blank">https://git.buildroot.net/=
buildroot/commit/?id=3Drefs/heads/master</a><br>
<br>
Fixes the following error:<br>
<br>
ERROR: Feature &quot;opengles2&quot;: Forcing to &quot;ON&quot; breaks its =
condition:<br>
=C2=A0 =C2=A0 NOT WIN32 AND NOT WATCHOS AND NOT QT_FEATURE_opengl_desktop A=
ND GLESv2_FOUND<br>
Condition values dump:<br>
=C2=A0 =C2=A0 WIN32 =3D &quot;&quot;<br>
=C2=A0 =C2=A0 WATCHOS =3D &quot;0&quot;<br>
=C2=A0 =C2=A0 QT_FEATURE_opengl_desktop =3D &quot;ON&quot;<br>
=C2=A0 =C2=A0 GLESv2_FOUND =3D &quot;TRUE&quot;<br>
<br>
CMake Error at cmake/QtBuildInformation.cmake:209 (message):<br>
=C2=A0 Check the configuration messages for an error that has occurred.<br>
Call Stack (most recent call first):<br>
=C2=A0 cmake/QtBuildInformation.cmake:39 (qt_configure_print_summary)<br>
=C2=A0 cmake/QtBuildRepoHelpers.cmake:332 (qt_print_feature_summary)<br>
=C2=A0 CMakeLists.txt:208 (qt_build_repo_end)<br>
<br>
To recreate the error, use the following defconfig (based on freescale_imx8=
mmevk_defconfig):<br>
<br>
BR2_aarch64=3Dy<br>
BR2_ARM_FPU_VFPV3=3Dy<br>
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=3Dy<br>
BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy<br>
BR2_GLOBAL_PATCH_DIR=3D&quot;board/freescale/common/patches&quot;<br>
BR2_TARGET_GENERIC_GETTY_PORT=3D&quot;ttymxc1&quot;<br>
BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/freescale/common/imx/imx8-bootlo=
ader-prepare.sh board/freescale/common/imx/post-image.sh&quot;<br>
BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;${UBOOT_DIR}/arch/arm/dts/imx8mm-evk.dt=
b&quot;<br>
BR2_LINUX_KERNEL=3Dy<br>
BR2_LINUX_KERNEL_CUSTOM_TARBALL=3Dy<br>
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D&quot;$(call github,nxp-imx,linu=
x-imx,lf-5.10.y-1.0.0)/linux-imx-lf-5.10.y-1.0.0.tar.gz&quot;<br>
BR2_LINUX_KERNEL_DEFCONFIG=3D&quot;imx_v8&quot;<br>
BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy<br>
BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D&quot;freescale/imx8mm-evk freescale/imx=
8mm-evk-revb-qca-wifi&quot;<br>
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy<br>
BR2_PACKAGE_QT6=3Dy<br>
BR2_PACKAGE_QT6BASE_GUI=3Dy<br>
BR2_PACKAGE_QT6BASE_OPENGL=3Dy<br>
BR2_PACKAGE_FREESCALE_IMX=3Dy<br>
BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=3Dy<br>
BR2_PACKAGE_FIRMWARE_IMX=3Dy<br>
BR2_PACKAGE_IMX_GPU_VIV=3Dy<br>
BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV=3Dy<br>
BR2_TARGET_ROOTFS_EXT2=3Dy<br>
BR2_TARGET_ROOTFS_EXT2_4=3Dy<br>
BR2_TARGET_ROOTFS_EXT2_SIZE=3D&quot;256M&quot;<br>
BR2_TARGET_ARM_TRUSTED_FIRMWARE=3Dy<br>
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=3Dy<br>
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION=3D&quot;$(call gith=
ub,nxp-imx,imx-atf,lf-5.10.y-1.0.0)/imx-atf-lf-5.10.y-1.0.0.tar.gz&quot;<br=
>
BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=3D&quot;imx8mm&quot;<br>
BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=3Dy<br>
BR2_TARGET_UBOOT=3Dy<br>
BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy<br>
BR2_TARGET_UBOOT_CUSTOM_TARBALL=3Dy<br>
BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION=3D&quot;$(call github,nxp-imx,uboo=
t-imx,lf-5.10.y-1.0.0)/uboot-imx-lf-5.10.y-1.0.0.tar.gz&quot;<br>
BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D&quot;imx8mm_evk&quot;<br>
BR2_TARGET_UBOOT_NEEDS_DTC=3Dy<br>
BR2_TARGET_UBOOT_FORMAT_CUSTOM=3Dy<br>
BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME=3D&quot;u-boot-nodtb.bin&quot;<br>
BR2_TARGET_UBOOT_SPL=3Dy<br>
BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy<br>
BR2_PACKAGE_HOST_GENIMAGE=3Dy<br>
BR2_PACKAGE_HOST_IMX_MKIMAGE=3Dy<br>
BR2_PACKAGE_HOST_MTOOLS=3Dy<br>
BR2_PACKAGE_HOST_UBOOT_TOOLS=3Dy<br>
BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=3Dy<br>
<br>
Signed-off-by: Roy Kollen Svendsen &lt;<a href=3D"mailto:roy.kollen.svendse=
n@akersolutions.com" target=3D"_blank">roy.kollen.svendsen@akersolutions.co=
m</a>&gt;<br>
Signed-off-by: Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be" t=
arget=3D"_blank">arnout@mind.be</a>&gt;<br>
---<br>
=C2=A0package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"noreferrer" =
target=3D"_blank">qt6base.mk</a> | 9 +++++++--<br>
=C2=A01 file changed, 7 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"noref=
errer" target=3D"_blank">qt6base.mk</a> b/package/qt6/qt6base/<a href=3D"ht=
tp://qt6base.mk" rel=3D"noreferrer" target=3D"_blank">qt6base.mk</a><br>
index 6857725ef5..211808d2af 100644<br>
--- a/package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"noreferrer" =
target=3D"_blank">qt6base.mk</a><br>
+++ b/package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"noreferrer" =
target=3D"_blank">qt6base.mk</a><br>
@@ -259,10 +259,15 @@ QT6BASE_CONF_OPTS +=3D -DFEATURE_eglfs=3DOFF<br>
=C2=A0endif<br>
<br>
=C2=A0ifeq ($(BR2_PACKAGE_QT6BASE_OPENGL_DESKTOP),y)<br>
-QT6BASE_CONF_OPTS +=3D -DFEATURE_opengl=3DON -DFEATURE_opengl_desktop=3DON=
<br>
+QT6BASE_CONF_OPTS +=3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DFEATURE_opengl=3DON \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DFEATURE_opengl_desktop=3DON<br>
=C2=A0QT6BASE_DEPENDENCIES +=3D libgl<br>
=C2=A0else ifeq ($(BR2_PACKAGE_QT6BASE_OPENGL_ES2),y)<br>
-QT6BASE_CONF_OPTS +=3D -DFEATURE_opengl=3DON -DFEATURE_opengles2=3DON<br>
+QT6BASE_CONF_OPTS +=3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DFEATURE_opengl=3DON \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DFEATURE_opengles2=3DON \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DFEATURE_opengl_desktop=3DOFF<br>
=C2=A0QT6BASE_DEPENDENCIES +=3D libgles<br>
=C2=A0else<br>
=C2=A0QT6BASE_CONF_OPTS +=3D -DFEATURE_opengl=3DOFF -DINPUT_opengl=3Dno<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>

--000000000000579e0c061a3e3b29--

--===============2275919125051525040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2275919125051525040==--
