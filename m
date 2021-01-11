From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 11 Jan 2021 22:28:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/mpv: bump version to 0.33.0
Message-ID: <20210111212828.1685527-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rsound support was removed:
https://github.com/mpv-player/mpv/commit/4583bd8cc7bf538bce424983d49729c934d13a53

libass is now mandatory:
https://github.com/mpv-player/mpv/commit/0b9ed9c2744ada1eefc1f254c5f3ade6c626ed72
Propagate new dependencies to tovid.

libsmbclient support was removed:
https://github.com/mpv-player/mpv/commit/3b8b7cb9d481828953f105f92bacc07a3cb2f332

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mpv/Config.in   |  5 ++++-
 package/mpv/mpv.hash    |  2 +-
 package/mpv/mpv.mk      | 21 ++-------------------
 package/tovid/Config.in |  3 ++-
 4 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index 697ad57ba6..ad64f98791 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -1,12 +1,15 @@
 config BR2_PACKAGE_MPV
 	bool "mpv"
+	depends on BR2_INSTALL_LIBSTDCPP # libass -> harfbuzz
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libass -> harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libass -> harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
+	select BR2_PACKAGE_LIBASS
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
 	# Select xkbcommon for wayland to avoid being mysterious
diff --git a/package/mpv/mpv.hash b/package/mpv/mpv.hash
index 37db771356..548a0f0159 100644
--- a/package/mpv/mpv.hash
+++ b/package/mpv/mpv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9163f64832226d22e24bbc4874ebd6ac02372cd717bef15c28a0aa858c5fe592  mpv-0.32.0.tar.gz
+sha256  f1b9baf5dc2eeaf376597c28a6281facf6ed98ff3d567e3955c95bf2459520b4  mpv-0.33.0.tar.gz
 sha256  a99d7b0625a0566271aad6de694e52eafd566db024f9516720d526c680d3ee30  LICENSE.GPL
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index a7c9f7d74a..18f307d186 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-MPV_VERSION = 0.32.0
+MPV_VERSION = 0.33.0
 MPV_SITE = $(call github,mpv-player,mpv,v$(MPV_VERSION))
 MPV_DEPENDENCIES = \
-	host-pkgconf ffmpeg zlib \
+	host-pkgconf ffmpeg libass zlib \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 MPV_LICENSE = GPL-2.0+
 MPV_LICENSE_FILES = LICENSE.GPL
@@ -23,7 +23,6 @@ MPV_CONF_OPTS = \
 	--disable-coreaudio \
 	--disable-cuda-hwaccel \
 	--disable-opensles \
-	--disable-rsound \
 	--disable-rubberband \
 	--disable-uchardet \
 	--disable-vapoursynth
@@ -77,14 +76,6 @@ else
 MPV_CONF_OPTS += --disable-libarchive
 endif
 
-# libass subtitle support
-ifeq ($(BR2_PACKAGE_LIBASS),y)
-MPV_CONF_OPTS += --enable-libass
-MPV_DEPENDENCIES += libass
-else
-MPV_CONF_OPTS += --disable-libass
-endif
-
 # bluray support
 ifeq ($(BR2_PACKAGE_LIBBLURAY),y)
 MPV_CONF_OPTS += --enable-libbluray
@@ -150,14 +141,6 @@ else
 MPV_CONF_OPTS += --disable-pulse
 endif
 
-# samba support
-ifeq ($(BR2_PACKAGE_SAMBA4),y)
-MPV_CONF_OPTS += --enable-libsmbclient
-MPV_DEPENDENCIES += samba4
-else
-MPV_CONF_OPTS += --disable-libsmbclient
-endif
-
 # SDL support
 # Sdl2 requires 64-bit sync intrinsics
 ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_8)$(BR2_PACKAGE_SDL2),yy)
diff --git a/package/tovid/Config.in b/package/tovid/Config.in
index f4ddcfa4a0..dc4e86c3a0 100644
--- a/package/tovid/Config.in
+++ b/package/tovid/Config.in
@@ -6,8 +6,9 @@ config BR2_PACKAGE_TOVID
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 # mpv
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # mpv -> libass -> harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC # mpv
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mpv -> libass -> harfbuzz
 	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC # mpv
 	# The below dependencies are runtime dependencies only
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps_ng
-- 
2.29.2
