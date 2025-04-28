Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDFBC369D5
	for <buildroot@archiver.kernel.org>; Mon, 28 Apr 2025 19:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 267D260812;
	Mon, 28 Apr 2025 19:52:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D8p1XIsdqPto; Mon, 28 Apr 2025 19:52:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FFFB60B6D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FFFB60B6D;
	Mon, 28 Apr 2025 19:52:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 670FFC5
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 19:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D33F60B6D
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 19:52:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mc0P5lkmJtRU for <buildroot@buildroot.org>;
 Mon, 28 Apr 2025 19:52:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AEA260812
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AEA260812
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 19:52:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 34E1886318; Mon, 28 Apr 2025 19:52:00 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 28 Apr 2025 21:50:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d90ae79a8c2dbe2c1b525876bfdf7f285bb7b0d
X-Git-Newrev: 8f69974c20fbc7dc642be62a0ef3fb2941f5bb35
X-Patchwork-Hint: ignore
Message-Id: <20250428195200.34E1886318@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpv: switch to meson from waf
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
Content-Type: multipart/mixed; boundary="===============4543424404238982010=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4543424404238982010==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8f69974c20fbc7dc642be62a0ef3fb2941f5bb35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Tested-by: J. Neuschäfer <j.ne@posteo.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mpv/mpv.mk | 127 +++++++++++++++++++++++++----------------------------
 1 file changed, 60 insertions(+), 67 deletions(-)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index cf37091186..8832b68ece 100644
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
+MPV_CONF_OPTS += -Dbuild-date=false
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

--===============4543424404238982010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4543424404238982010==--
