From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Thu, 2 Jan 2014 18:59:44 +0100
Subject: [Buildroot] [PATCH v3 1/2] ffmpeg: bump to version 1.2.4
Message-ID: <BLU0-SMTP2638CE0203ADFD44E6B8961D9CB0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Compile tested the following packages which depend on ffmpeg:

freerdp
mpd
gstreamer

For minidlna please see the separate patch for version bump to 1.1.1

Some compile options were taken from OpenELEC:
https://github.com/OpenELEC/OpenELEC.tv/blob/master/packages/multimedia/ffmpeg/build

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
Changes v2 -> v3:
- move sse4 stuff to a separate patch (suggested by Thomas)

Changes v1 -> v2:
- fixed typo regarding --enable-openssl (suggested by Baruch)
- included OpenELEC comment

 package/ffmpeg/ffmpeg-sdlconfig.patch |   17 -----
 package/ffmpeg/ffmpeg.mk              |  118 +++++++++++++++++++++++++++++----
 2 files changed, 106 insertions(+), 29 deletions(-)
 delete mode 100644 package/ffmpeg/ffmpeg-sdlconfig.patch

diff --git a/package/ffmpeg/ffmpeg-sdlconfig.patch b/package/ffmpeg/ffmpeg-sdlconfig.patch
deleted file mode 100644
index 64371b2..0000000
--- a/package/ffmpeg/ffmpeg-sdlconfig.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-We need to pass the location sdl-config so that ffmpeg picks it up.
-So just pass the whole string to make things simpler.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura ffmpeg-0.8.7.orig/configure ffmpeg-0.8.7/configure
---- ffmpeg-0.8.7.orig/configure	2011-11-21 16:49:30.000000000 -0300
-+++ ffmpeg-0.8.7/configure	2011-12-02 08:13:36.746619395 -0300
-@@ -2957,7 +2957,7 @@
- enabled libxvid    && require  libxvid xvid.h xvid_global -lxvidcore
- enabled mlib       && require  mediaLib mlib_types.h mlib_VectorSub_S16_U8_Mod -lmlib
- 
--SDL_CONFIG="${cross_prefix}sdl-config"
-+SDL_CONFIG="${SDL_CONFIG}"
- if check_pkg_config sdl SDL_version.h SDL_Linked_Version; then
-     check_cpp_condition SDL.h "(SDL_MAJOR_VERSION<<16 | SDL_MINOR_VERSION<<8 | SDL_PATCHLEVEL) >= 0x010201" $sdl_cflags &&
-     enable sdl &&
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index f1fc920..ea7b20d 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 0.8.15
+FFMPEG_VERSION = 1.2.4
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
@@ -18,9 +18,61 @@ endif
 
 FFMPEG_CONF_OPT = \
 	--prefix=/usr		\
-	--disable-avfilter	\
+	--enable-avfilter \
+	--disable-debug \
+	--disable-version3 \
+	--enable-logging \
+	--disable-pic \
+	--enable-optimizations \
+	--disable-extra-warnings \
+	--disable-ffprobe \
+	--enable-avdevice \
+	--enable-avcodec \
+	--enable-avformat \
+	--enable-swscale \
+	--enable-postproc \
+	--disable-x11grab \
+	--enable-network \
+	--disable-gray \
+	--enable-swscale-alpha \
+	--disable-small \
+	--enable-dct \
+	--enable-fft \
+	--enable-mdct \
+	--enable-rdft \
+	--disable-crystalhd \
+	--disable-vaapi \
+	--disable-vdpau \
+	--disable-dxva2 \
+	--enable-runtime-cpudetect \
+	--disable-hardcoded-tables \
+	--disable-memalign-hack \
+	--enable-hwaccels \
+	--disable-avisynth \
+	--disable-frei0r \
+	--disable-libopencore-amrnb \
+	--disable-libopencore-amrwb \
+	--disable-libopencv \
+	--disable-libdc1394 \
+	--disable-libfaac \
+	--disable-libfreetype \
+	--disable-libgsm \
+	--disable-libmp3lame \
+	--disable-libnut \
+	--disable-libopenjpeg \
+	--disable-librtmp \
+	--disable-libschroedinger \
+	--disable-libspeex \
+	--disable-libtheora \
+	--disable-libvo-aacenc \
+	--disable-libvo-amrwbenc \
+	--disable-vis \
+	--disable-sram \
+	--disable-symver \
 	$(if $(BR2_HAVE_DOCUMENTATION),,--disable-doc)
 
+FFMPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+
 FFMPEG_CFLAGS = $(TARGET_CFLAGS)
 
 ifeq ($(BR2_xtensa),y)
@@ -100,7 +152,7 @@ endif
 
 ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG_BSFS)),all)
 FFMPEG_CONF_OPT += --disable-bsfs \
-	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG_BSFS)),--enable-bsf=$(x))
+	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG_BSFS)),--enable-bsfs=$(x))
 endif
 
 ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG_PROTOCOLS)),all)
@@ -138,14 +190,58 @@ else
 FFMPEG_CONF_OPT += --disable-zlib
 endif
 
-ifeq ($(BR2_i386)$(BR2_x86_64),y)
-# MMX on is default for x86, disable it for lowly x86-type processors
-ifeq ($(BR2_x86_i386)$(BR2_x86_i486)$(BR2_x86_i586)$(BR2_x86_i686)$(BR2_x86_pentiumpro)$(BR2_x86_geode),y)
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+FFMPEG_CONF_OPT += --enable-bzlib
+FFMPEG_DEPENDENCIES += bzip2
+else
+FFMPEG_CONF_OPT += --disable-bzlib
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+FFMPEG_CONF_OPT += --enable-openssl
+FFMPEG_DEPENDENCIES += openssl
+else
+FFMPEG_CONF_OPT += --disable-openssl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
+FFMPEG_DEPENDENCIES += libvorbis
+FFMPEG_CONF_OPT += \
+	--enable-libvorbis \
+	--enable-muxer=ogg \
+	--enable-encoder=libvorbis
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_MMX),y)
+FFMPEG_CONF_OPT += --enable-yasm
+FFMPEG_DEPENDENCIES += yasm
+else
+FFMPEG_CONF_OPT += --disable-yasm
 FFMPEG_CONF_OPT += --disable-mmx
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSE),y)
+FFMPEG_CONF_OPT += --enable-sse
+else
+FFMPEG_CONF_OPT += --disable-sse
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
+FFMPEG_CONF_OPT += --enable-sse2
+else
+FFMPEG_CONF_OPT += --disable-sse2
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSE3),y)
+FFMPEG_CONF_OPT += --enable-sse3
 else
-# If it is enabled, nasm is required
-FFMPEG_DEPENDENCIES += host-nasm
+FFMPEG_CONF_OPT += --disable-sse3
 endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSSE3),y)
+FFMPEG_CONF_OPT += --enable-ssse3
+else
+FFMPEG_CONF_OPT += --disable-ssse3
 endif
 
 # Explicitly disable everything that doesn't match for ARM
@@ -161,8 +257,6 @@ FFMPEG_CONF_OPT += --disable-armv6 --disable-armv6t2
 endif
 ifeq ($(BR2_arm10)$(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s)$(BR2_cortex_a5)$(BR2_cortex_a8)$(BR2_cortex_a9)$(BR2_cortex_a15),y)
 FFMPEG_CONF_OPT += --enable-armvfp
-else
-FFMPEG_CONF_OPT += --disable-armvfp
 endif
 ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
 FFMPEG_CONF_OPT += --enable-neon
@@ -191,8 +285,8 @@ define FFMPEG_CONFIGURE_CMDS
 		--sysroot=$(STAGING_DIR) \
 		--host-cc="$(HOSTCC)" \
 		--arch=$(BR2_ARCH) \
-		--target-os=linux \
-		--extra-cflags=-fPIC \
+		--target-os="linux" \
+		--cpu=$(BR2_GCC_TARGET_TUNE) \
 		$(SHARED_STATIC_LIBS_OPTS) \
 		$(FFMPEG_CONF_OPT) \
 	)
-- 
1.7.9.5
