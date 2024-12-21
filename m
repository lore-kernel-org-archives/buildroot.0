Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D43E7718B
	for <buildroot@archiver.kernel.org>; Sat, 21 Dec 2024 17:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC43884B58;
	Sat, 21 Dec 2024 17:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0QN5-4YRXqTi; Sat, 21 Dec 2024 17:21:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A03F8846B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A03F8846B8;
	Sat, 21 Dec 2024 17:21:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 13752757
 for <buildroot@buildroot.org>; Sat, 21 Dec 2024 17:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0086343162
 for <buildroot@buildroot.org>; Sat, 21 Dec 2024 17:21:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Afp5-xlSO92 for <buildroot@buildroot.org>;
 Sat, 21 Dec 2024 17:21:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0F4FC41042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F4FC41042
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F4FC41042
 for <buildroot@buildroot.org>; Sat, 21 Dec 2024 17:21:13 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (unknown [217.70.183.195])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 6102EC15B8
 for <buildroot@buildroot.org>; Sat, 21 Dec 2024 17:19:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A9A960004;
 Sat, 21 Dec 2024 17:19:41 +0000 (UTC)
Date: Sat, 21 Dec 2024 18:19:21 +0100
MIME-Version: 1.0
Message-Id: <20241221-fix_mpv-v1-1-d7ba39606571@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAJj4ZmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIyND3bTMivjcgjLdRINEk7SkRNMkAxMTJaDqgqJUoBTYpOjY2loACAp
 O9lkAAAA=
X-Change-ID: 20241221-fix_mpv-a0a4fba5b044
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1734801582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ioSve0xu7JHVAoZsWZbNn/zmGqGURz1AWXVlkiH3kG4=;
 b=M1J2+Oge9uibwLqhUixrrQ7H11Z9CrC3SbOQ1cAMKBo9yp0FQXlQSiKmvpRHIk3/cd8ZJW
 OgGlQv1cNuA7loueLM6n+ajE6KzjhUaHPW3Bdat6ehY4uIol14IGIQwTzKZu1IIiYfHEf5
 9orz/6fG/umDqS1keZhA/KdGiggaOPDvDEecewsJrPYG5WKMMbglQFpa4hlDwdKTF7C52n
 mLfPNBe846B9nMEZv/xJCJ/9oXgG+g2WzX7FaVvygab25I6lZdVKd7biHuuJiHO5taSQRT
 zG95qeCakaf2QOuQYL+DDGqsp7sEsEgPz7GsXYgx/iVWecupfpp4nu7lTKPCmQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M1J2+Oge
Subject: [Buildroot] [PATCH] package/mpv: use meson instead of waf
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
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Waf has been entirely removed from mpv since commit f2cce5f [1] in favor
of meson.

This commit is a rework of mpv makefile to use meson.

Note that the meson package compilation itself supports the
static/dynamic compilation setting.

Fixes:
    https://autobuild.buildroot.org/results/68d42441fc0da34e1bf2a4247726f5f4ec3b8e77/

[1]: https://github.com/mpv-player/mpv/commit/f2cce5f38f4031bf1a4b4919ec90e4e8f8c66a77

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 package/mpv/mpv.mk | 122 +++++++++++++++++++++++++----------------------------
 1 file changed, 57 insertions(+), 65 deletions(-)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index cf37091186a2ffa67db964cc3d1c9dd7dda05e6e..a91849036299bdbac2a2fcf4fd7e6b7455216999 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -14,197 +14,189 @@ MPV_LICENSE_FILES = LICENSE.GPL
 MPV_CPE_ID_VENDOR = mpv
 MPV_INSTALL_STAGING = YES
 
-MPV_NEEDS_EXTERNAL_WAF = YES
-
 # Some of these options need testing and/or tweaks
 MPV_CONF_OPTS = \
 	--prefix=/usr \
-	--disable-android \
-	--disable-caca \
-	--disable-cocoa \
-	--disable-coreaudio \
-	--disable-cuda-hwaccel \
-	--disable-opensles \
-	--disable-rubberband \
-	--disable-uchardet \
-	--disable-vapoursynth
+	-Dcaca=disabled \
+	-Dcocoa=disabled \
+	-Dcoreaudio=disabled \
+	-Dcuda-hwaccel=disabled \
+	-Dlibmpv=true \
+	-Dopensles=disabled \
+	-Drubberband=disabled \
+	-Duchardet=disabled \
+	-Dvapoursynth=disabled
 
 ifeq ($(BR2_REPRODUCIBLE),y)
-MPV_CONF_OPTS += --disable-build-date
-endif
-
-ifeq ($(BR2_STATIC_LIBS),y)
-MPV_CONF_OPTS += --disable-libmpv-shared --enable-libmpv-static
-else
-MPV_CONF_OPTS += --enable-libmpv-shared --disable-libmpv-static
+MPV_CONF_OPTS += -Dbuild-date=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
-MPV_CONF_OPTS += --enable-alsa
+MPV_CONF_OPTS += -Dalsa=enabled
 MPV_DEPENDENCIES += alsa-lib
 else
-MPV_CONF_OPTS += --disable-alsa
+MPV_CONF_OPTS += -Dalsa=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_GBM),y)
-MPV_CONF_OPTS += --enable-gbm
+MPV_CONF_OPTS += -Dgbm=enabled
 MPV_DEPENDENCIES += mesa3d
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
-MPV_CONF_OPTS += --enable-egl-drm
+MPV_CONF_OPTS += -Degl-drm=enabled
 else
-MPV_CONF_OPTS += --disable-egl-drm
+MPV_CONF_OPTS += -Degl-drm=disabled
 endif
 else
-MPV_CONF_OPTS += --disable-gbm --disable-egl-drm
+MPV_CONF_OPTS += -Dgbm=disabled -Degl-drm=disabled
 endif
 
 # jack support
 # It also requires 64-bit sync intrinsics
 ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_8)$(BR2_PACKAGE_JACK2),yy)
-MPV_CONF_OPTS += --enable-jack
+MPV_CONF_OPTS += -Djack=enabled
 MPV_DEPENDENCIES += jack2
 else
-MPV_CONF_OPTS += --disable-jack
+MPV_CONF_OPTS += -Djack=disabled
 endif
 
 # jpeg support
 ifeq ($(BR2_PACKAGE_JPEG),y)
-MPV_CONF_OPTS += --enable-jpeg
+MPV_CONF_OPTS += -Djpeg=enabled
 MPV_DEPENDENCIES += jpeg
 else
-MPV_CONF_OPTS += --disable-jpeg
+MPV_CONF_OPTS += -Djpeg=disabled
 endif
 
 # lcms2 support
 ifeq ($(BR2_PACKAGE_LCMS2),y)
-MPV_CONF_OPTS += --enable-lcms2
+MPV_CONF_OPTS += -Dlcms2=enabled
 MPV_DEPENDENCIES += lcms2
 else
-MPV_CONF_OPTS += --disable-lcms2
+MPV_CONF_OPTS += -Dlcms2=disabled
 endif
 
 # libarchive support
 ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
-MPV_CONF_OPTS += --enable-libarchive
+MPV_CONF_OPTS += -Dlibarchive=enabled
 MPV_DEPENDENCIES += libarchive
 else
-MPV_CONF_OPTS += --disable-libarchive
+MPV_CONF_OPTS += -Dlibarchive=disabled
 endif
 
 # bluray support
 ifeq ($(BR2_PACKAGE_LIBBLURAY),y)
-MPV_CONF_OPTS += --enable-libbluray
+MPV_CONF_OPTS += -Dlibbluray=enabled
 MPV_DEPENDENCIES += libbluray
 else
-MPV_CONF_OPTS += --disable-libbluray
+MPV_CONF_OPTS += -Dlibbluray=disabled
 endif
 
 # libcdio-paranoia
 ifeq ($(BR2_PACKAGE_LIBCDIO_PARANOIA),y)
-MPV_CONF_OPTS += --enable-cdda
+MPV_CONF_OPTS += -Dcdda=enabled
 MPV_DEPENDENCIES += libcdio-paranoia
 else
-MPV_CONF_OPTS += --disable-cdda
+MPV_CONF_OPTS += -Dcdda=disabled
 endif
 
 # libdvdnav
 ifeq ($(BR2_PACKAGE_LIBDVDNAV),y)
-MPV_CONF_OPTS += --enable-dvdnav
+MPV_CONF_OPTS += -Ddvdnav=enabled
 MPV_DEPENDENCIES += libdvdnav
 else
-MPV_CONF_OPTS += --disable-dvdnav
+MPV_CONF_OPTS += -Ddvdnav=disabled
 endif
 
 # libdrm
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
-MPV_CONF_OPTS += --enable-drm
+MPV_CONF_OPTS += -Ddrm=enabled
 MPV_DEPENDENCIES += libdrm
 else
-MPV_CONF_OPTS += --disable-drm
+MPV_CONF_OPTS += -Ddrm=disabled
 endif
 
 # libvdpau
 ifeq ($(BR2_PACKAGE_LIBVDPAU),y)
-MPV_CONF_OPTS += --enable-vdpau
+MPV_CONF_OPTS += -Dvdpau=enabled
 MPV_DEPENDENCIES += libvdpau
 else
-MPV_CONF_OPTS += --disable-vdpau
+MPV_CONF_OPTS += -Dvdpau=disabled
 endif
 
 # LUA support, only for lua51/lua52/luajit
 # This enables the controller (OSD) together with libass
 ifeq ($(BR2_PACKAGE_LUA_5_1)$(BR2_PACKAGE_LUAJIT),y)
-MPV_CONF_OPTS += --enable-lua
+MPV_CONF_OPTS += -Dlua=enabled
 MPV_DEPENDENCIES += luainterpreter
 else
-MPV_CONF_OPTS += --disable-lua
+MPV_CONF_OPTS += -Dlua=disabled
 endif
 
 # OpenGL support
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
-MPV_CONF_OPTS += --enable-gl
+MPV_CONF_OPTS += -Dgl=enabled
 MPV_DEPENDENCIES += libgl
 else ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
-MPV_CONF_OPTS += --enable-gl
+MPV_CONF_OPTS += -Dgl=enabled
 MPV_DEPENDENCIES += libgles
 else ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
-MPV_CONF_OPTS += --enable-gl
+MPV_CONF_OPTS += -Dgl=enabled
 MPV_DEPENDENCIES += libegl
 else
-MPV_CONF_OPTS += --disable-gl
+MPV_CONF_OPTS += -Dgl=disabled
 endif
 
 # pulseaudio support
 ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
-MPV_CONF_OPTS += --enable-pulse
+MPV_CONF_OPTS += -Dpulse=enabled
 MPV_DEPENDENCIES += pulseaudio
 else
-MPV_CONF_OPTS += --disable-pulse
+MPV_CONF_OPTS += -Dpulse=disabled
 endif
 
 # SDL support
 # Sdl2 requires 64-bit sync intrinsics
 ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_8)$(BR2_PACKAGE_SDL2),yy)
-MPV_CONF_OPTS += --enable-sdl2
+MPV_CONF_OPTS += -Dsdl2=enabled
 MPV_DEPENDENCIES += sdl2
 else
-MPV_CONF_OPTS += --disable-sdl2
+MPV_CONF_OPTS += -Dsdl2=disabled
 endif
 
 # Raspberry Pi support
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-MPV_CONF_OPTS += --enable-rpi --enable-gl
+MPV_CONF_OPTS += -Drpi=enabled -Dgl=enabled
 MPV_DEPENDENCIES += rpi-userland
 else
-MPV_CONF_OPTS += --disable-rpi
+MPV_CONF_OPTS += -Drpi=disabled
 endif
 
 # va-api support
 ifeq ($(BR2_PACKAGE_LIBVA)$(BR2_PACKAGE_MPV_SUPPORTS_VAAPI),yy)
-MPV_CONF_OPTS += --enable-vaapi
+MPV_CONF_OPTS += -Dvaapi=enabled
 MPV_DEPENDENCIES += libva
 ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_MESA3D_OPENGL_EGL),yy)
-MPV_CONF_OPTS += --enable-vaapi-drm
+MPV_CONF_OPTS += -Dvaapi-drm=enabled
 else
-MPV_CONF_OPTS += --disable-vaapi-drm
+MPV_CONF_OPTS += -Dvaapi-drm=disabled
 endif
 else
-MPV_CONF_OPTS += --disable-vaapi --disable-vaapi-drm
+MPV_CONF_OPTS += -Dvaapi=disabled -Dvaapi-drm=disabled
 endif
 
 # wayland support
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
-MPV_CONF_OPTS += --enable-wayland
+MPV_CONF_OPTS += -Dwayland=enabled
 MPV_DEPENDENCIES += libxkbcommon wayland wayland-protocols
 else
-MPV_CONF_OPTS += --disable-wayland
+MPV_CONF_OPTS += -Dwayland=disabled
 endif
 
 # Base X11 support. Config.in ensures that if BR2_PACKAGE_XORG7 is
 # enabled, xlib_libX11, xlib_libXext, xlib_libXinerama,
 # xlib_libXrandr, xlib_libXScrnSaver.
 ifeq ($(BR2_PACKAGE_XORG7),y)
-MPV_CONF_OPTS += --enable-x11
+MPV_CONF_OPTS += -Dx11=enabled
 MPV_DEPENDENCIES += \
 	xlib_libX11 \
 	xlib_libXext \
@@ -214,17 +206,17 @@ MPV_DEPENDENCIES += \
 	xlib_libXScrnSaver
 # XVideo
 ifeq ($(BR2_PACKAGE_XLIB_LIBXV),y)
-MPV_CONF_OPTS += --enable-xv
+MPV_CONF_OPTS += -Dxv=enabled
 MPV_DEPENDENCIES += xlib_libXv
 else
-MPV_CONF_OPTS += --disable-xv
+MPV_CONF_OPTS += -Dxv=disabled
 endif
 else
-MPV_CONF_OPTS += --disable-x11
+MPV_CONF_OPTS += -Dx11=disabled
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 MPV_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -latomic"
 endif
 
-$(eval $(waf-package))
+$(eval $(meson-package))

---
base-commit: 15dbc33be847c9b4d137e6311bb8ba68a51a3c27
change-id: 20241221-fix_mpv-a0a4fba5b044

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
