Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F402E77197
	for <buildroot@archiver.kernel.org>; Sun,  5 Jan 2025 23:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24077810B1;
	Sun,  5 Jan 2025 23:24:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HUl4CLZO0PRQ; Sun,  5 Jan 2025 23:24:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1EC780FAF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1EC780FAF;
	Sun,  5 Jan 2025 23:24:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 27671D92
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 23:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11CD94060C
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 23:24:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-ycccMGqO8f for <buildroot@buildroot.org>;
 Sun,  5 Jan 2025 23:23:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DEA1940024
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEA1940024
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DEA1940024
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 23:23:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9CBA11BF203;
 Sun,  5 Jan 2025 23:23:54 +0000 (UTC)
Date: Mon, 06 Jan 2025 00:23:49 +0100
MIME-Version: 1.0
Message-Id: <20250106-fix_mpv-v2-1-85117ce7b16b@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAIQUe2cC/2WMQQ6CMBBFr0Jm7ZhOLRBdcQ9DTAtFJpGWtKTRk
 N7dytbl+//l7RBtYBvhVu0QbOLI3hWQpwqGWbunRR4LgxRSkZSEE78fy5pQC60mo2sjlIJir8G
 W6yjd+8Izx82HzxFO9Fv/G4mQcGyNvlwb0dQtdcb77cXuPPgF+pzzF8yK3GGgAAAA
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
 d=bootlin.com; s=gm1; t=1736119434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CT8dHbMxrAPq48qPuMdzIach4l4lIRChmvYOrsaWeZY=;
 b=XDSZnNubgpMP2poUGskeMvIfgXvz61SbiT2I2UiaaTWslhWoBj0XW9clinXXwuYKY6/Jr4
 ftG1X703hc2VOiA1mMwhcegV3DcTRjK97/AqFolqSXx1sjTvlvAb/gR8mND5+yweXpRdtj
 uF8b2tZL6VRhiVzYznujru52kNUA8xD8ryiTgOgagmpVyuHb+ZH+E7vmAd5LC7YzwyUVBI
 BBmO6htjz8z7XA3h27snG5UMKwgzPzz3JlDbvJKns5IgAsgAcs5DOFhmIx6DfvckBOsGcN
 R49Ep24kH3AUelcfKfbgX4pF2jQVkoYePC1yvAL86+uCEpLuNCMBOuMdT6NYnQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XDSZnNub
Subject: [Buildroot] [PATCH v2] package/mpv: switch to meson from waf
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

Since commit fd562315, which updated waf to v2.1.1, Buildroot has
encountered issues building mpv, likely due to an outdated version of
the waf build system.

Starting with mpv v0.35, meson was introduced as an alternative to waf,
and in mpv v0.37, waf was completely removed.

This commit updates the mpv makefile to use meson, resolving the build
issues and simplifying future updates to newer versions of mpv.

All options previously used for Waf have been translated to the new
build system by replacing `--disable-feature` with `-Dfeature=disabled`
(and similarly for enabling features). Some features have special
handling:

- The `/usr` prefix is automatically passed to meson packages by
  default.
- The Android feature "has been removed since meson can detect if a
  machine is Android"[1].
- The `libmpv` parameter has been enabled in the makefile as `libmpv`
  must be built by default with mpv.
- Meson packages automatically set whether the library should be built
  statically using the `default_library` meson parameter.
- Meson automatically detects the presence of `libatomic` and passes the
  correct argument to the linker. However, it is possible to set the
  `stdatomic` meson parameter to specify whether `libatomic` must or
  must not be used.

Fixes:
    https://autobuild.buildroot.org/results/68d42441fc0da34e1bf2a4247726f5f4ec3b8e77/

[1]: https://github.com/mpv-player/mpv/blob/140ec21c89d671d392877a7f3b91d67e7d7b9239/DOCS/build-system-differences.md?plain=1#L48

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
Changes in v2:
- Extend commit log
- Remove --prefix=/usr as it is already handled by pkg-meson
- Modify call to libatomic to match meson way of doing things
- Link to v1: https://lore.kernel.org/r/20241221-fix_mpv-v1-1-d7ba39606571@bootlin.com
---
 package/mpv/mpv.mk | 127 +++++++++++++++++++++++++----------------------------
 1 file changed, 60 insertions(+), 67 deletions(-)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index cf37091186a2ffa67db964cc3d1c9dd7dda05e6e..66e5abe49e9fe51be2fb3c1a75064f5fcc57387c 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -14,197 +14,188 @@ MPV_LICENSE_FILES = LICENSE.GPL
 MPV_CPE_ID_VENDOR = mpv
 MPV_INSTALL_STAGING = YES
 
-MPV_NEEDS_EXTERNAL_WAF = YES
-
 # Some of these options need testing and/or tweaks
 MPV_CONF_OPTS = \
-	--prefix=/usr \
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
@@ -214,17 +205,19 @@ MPV_DEPENDENCIES += \
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
-MPV_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -latomic"
+MPV_CONF_OPTS += -Dstdatomic=enabled
+else
+MPV_CONF_OPTS += -Dstdatomic=disabled
 endif
 
-$(eval $(waf-package))
+$(eval $(meson-package))

---
base-commit: 3ba6a848a639f57bba767f357295b8b5d98bfa15
change-id: 20241221-fix_mpv-a0a4fba5b044

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
