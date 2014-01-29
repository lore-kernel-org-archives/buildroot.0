From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 30 Jan 2014 00:45:39 +0100
Subject: [Buildroot] [PATCH 1/2] package/ffmpeg2: new package
In-Reply-To: <cover.1391039071.git.yann.morin.1998@free.fr>
References: <cover.1391039071.git.yann.morin.1998@free.fr>
Message-ID: <52a28ac64fd90926a1a556937ec7bc0ef3863d72.1391039071.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Instead of bumping ffmpeg, we just add ffmpeg2 as a separate package.

However, the sets of files installed by both versions have a non-empty
intersection, so we can't install both concurrently. Hence, they are
made mutually exclusive in the menuconfig.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/Config.in          |   1 +
 package/ffmpeg2/Config.in  | 235 +++++++++++++++++++++++++++++
 package/ffmpeg2/ffmpeg2.mk | 361 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 597 insertions(+)
 create mode 100644 package/ffmpeg2/Config.in
 create mode 100644 package/ffmpeg2/ffmpeg2.mk

diff --git a/package/Config.in b/package/Config.in
index 631d8b2..37b19ab 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -8,6 +8,7 @@ source "package/aumix/Config.in"
 source "package/bellagio/Config.in"
 source "package/faad2/Config.in"
 source "package/ffmpeg/Config.in"
+source "package/ffmpeg2/Config.in"
 source "package/flac/Config.in"
 source "package/gstreamer/Config.in"
 source "package/gstreamer1/Config.in"
diff --git a/package/ffmpeg2/Config.in b/package/ffmpeg2/Config.in
new file mode 100644
index 0000000..2442e69
--- /dev/null
+++ b/package/ffmpeg2/Config.in
@@ -0,0 +1,235 @@
+comment "ffmpeg2 needs a toolchain w/ largefile, IPv6"
+	depends on !(BR2_LARGEFILE && BR2_INET_IPV6) && !BR2_PACKAGE_FFMPEG2
+
+# Warning! Moving this comment to the top of the file will make it
+# appear in the ffmpeg sub-menu, dues to its dependency on ffmpeg.
+# Be sure to keep it here, below the other comment above, which breaks
+# the dependency chain, and thus breaks the adherence to the ffmpeg
+# sub-menu.
+comment "ffmpeg2 conflicts with ffmpeg"
+	depends on BR2_PACKAGE_FFMPEG
+
+menuconfig BR2_PACKAGE_FFMPEG2
+	bool "ffmpeg2"
+	depends on !BR2_PACKAGE_FFMPEG
+	depends on BR2_LARGEFILE
+	depends on BR2_INET_IPV6
+	help
+	  FFmpeg is a complete, cross-platform solution to record, convert
+	  and stream audio and video.
+
+	  http://www.ffmpeg.org
+
+	  Note: the help texts of the FFmpeg2 options, below, are scrapped
+	  directly from FFMpeg2's ./configure --help. Refer to the project's
+	  documentation for the actual meaning of the help texts.
+
+if BR2_PACKAGE_FFMPEG2
+
+config BR2_PACKAGE_FFMPEG2_GPL
+	bool "Enable GPL code"
+	help
+	  Allow use of GPL code, the resulting libs and binaries will
+	  be under GPL
+
+config BR2_PACKAGE_FFMPEG2_GPL3
+	bool "Use (L)GPLv3 instead of v2"
+	depends on BR2_PACKAGE_FFMPEG2_GPL
+	help
+	  Upgrade (L)GPL to version 3
+
+config BR2_PACKAGE_FFMPEG2_NONFREE
+	bool "Enable nonfree code"
+	help
+	  Allow use of nonfree code, the resulting libs and binaries
+	  will be unredistributable
+
+comment "Programs"
+
+config BR2_PACKAGE_FFMPEG2_FFMPEG
+	bool "ffmpeg"
+	select BR2_PACKAGE_FFMPEG2_SWSCALE
+	default y
+	help
+	  FFmpeg is a very fast video and audio converter.
+	  It can also grab from a live audio/video source.
+
+	  It is not needed if you want to link the FFmpeg libraries
+	  to your application.
+
+config BR2_PACKAGE_FFMPEG2_FFPLAY
+	bool "ffplay"
+	select BR2_PACKAGE_SDL
+	help
+	  FFplay is a very simple and portable media player using the
+	  FFmpeg libraries and the SDL library.
+	  It is mostly used as a testbed for the various FFmpeg APIs.
+
+config BR2_PACKAGE_FFMPEG2_FFPROBE
+	bool "ffprobe"
+	help
+	  ffprobe gathers information from multimedia streams and prints
+	  it in human- and machine-readable fashion.
+
+config BR2_PACKAGE_FFMPEG2_FFSERVER
+	bool "ffserver"
+	help
+	  FFserver is a streaming server for both audio and video.
+
+comment "Libraries"
+
+config BR2_PACKAGE_FFMPEG2_AVCODEC
+	bool "libavcodec"
+
+config BR2_PACKAGE_FFMPEG2_AVDEVICE
+	bool "libavdevice"
+
+config BR2_PACKAGE_FFMPEG2_AVFILTER
+	bool "libavfilter"
+	select BR2_PACKAGE_FFMPEG2_AVUTIL
+	select BR2_PACKAGE_FFMPEG2_AVFORMAT
+	select BR2_PACKAGE_FFMPEG2_AVCODEC
+
+config BR2_PACKAGE_FFMPEG2_AVFORMAT
+	bool "libavformat"
+
+config BR2_PACKAGE_FFMPEG2_AVRESAMPLE
+	bool "libavresample"
+
+config BR2_PACKAGE_FFMPEG2_AVUTIL
+	bool "libavutil"
+
+config BR2_PACKAGE_FFMPEG2_POSTPROC
+	bool "libpostproc"
+	depends on BR2_PACKAGE_FFMPEG2_GPL
+
+config BR2_PACKAGE_FFMPEG2_SWRESAMPLE
+	bool "libswresample"
+
+config BR2_PACKAGE_FFMPEG2_SWSCALE
+	bool "libswscale"
+
+comment "Hardware acceleration"
+
+config BR2_PACKAGE_FFMPEG2_DXVA2
+	bool "dxva2"
+
+config BR2_PACKAGE_FFMPEG2_VAAPI
+	bool "vaapi"
+
+config BR2_PACKAGE_FFMPEG2_VDA
+	bool "vda"
+
+config BR2_PACKAGE_FFMPEG2_VDPAU
+	bool "vdpau"
+
+comment "Components options"
+
+config BR2_PACKAGE_FFMPEG2_ENCODERS
+	string "Enabled encoders"
+	default "all"
+	help
+	  Space-separated list of encoders to build in FFmpeg,
+	  or "all" to build all of them.
+
+	  Run ./configure --list-encoders in the ffmpeg sources
+	  directory to know the available options.
+
+config BR2_PACKAGE_FFMPEG2_DECODERS
+	string "Enabled decoders"
+	default "all"
+	help
+	  Space-separated list of decoders to build in FFmpeg,
+	  or "all" to build all of them.
+
+	  Run ./configure --list-decoders in the ffmpeg sources
+	  directory to know the available options.
+
+config BR2_PACKAGE_FFMPEG2_MUXERS
+	string "Enabled muxers"
+	default "all"
+	help
+	  Space-separated list of muxers to build in FFmpeg,
+	  or "all" to build all of them.
+
+	  Run ./configure --list-muxers in the ffmpeg sources
+	  directory to know the available options.
+
+config BR2_PACKAGE_FFMPEG2_DEMUXERS
+	string "Enabled demuxers"
+	default "all"
+	help
+	  Space-separated list of demuxers to build in FFmpeg,
+	  or "all" to build all of them.
+
+	  Run ./configure --list-demuxers in the ffmpeg sources
+	  directory to know the available options.
+
+config BR2_PACKAGE_FFMPEG2_PARSERS
+	string "Enabled parsers"
+	default "all"
+	help
+	  Space-separated list of parsers to build in FFmpeg,
+	  or "all" to build all of them.
+
+	  Run ./configure --list-parsers in the ffmpeg sources
+	  directory to know the available options.
+
+config BR2_PACKAGE_FFMPEG2_BSFS
+	string "Enabled bitstreams"
+	default "all"
+	help
+	  Space-separated list of bitstream filters to build in FFmpeg,
+	  or "all" to build all of them.
+
+	  Run ./configure --list-bsfs in the ffmpeg sources
+	  directory to know the available options.
+
+config BR2_PACKAGE_FFMPEG2_PROTOCOLS
+	string "Enabled protocols"
+	default "all"
+	help
+	  Space-separated list of protocols to build in FFmpeg,
+	  or "all" to build all of them.
+
+	  Run ./configure --list-protocols in the ffmpeg sources
+	  directory to know the available options.
+
+config BR2_PACKAGE_FFMPEG2_FILTERS
+	string "Enabled filters"
+	default "all"
+	help
+	  Space-separated list of filters to build in FFmpeg,
+	  or "all" to build all of them.
+
+	  Run ./configure --list-filters in the ffmpeg sources
+	  directory to know the available options.
+
+config BR2_PACKAGE_FFMPEG2_INDEVS
+	string "Enabled input devices"
+	default "all"
+	help
+	  Space-separated list of input devices to build into FFMpeg,
+	  or "all" to build all of them.
+
+	  Run ./configure --list-indevs in the ffmpeg sources
+	  directory to know the available options.
+
+config BR2_PACKAGE_FFMPEG2_OUTDEVS
+	string "Enabled output devices"
+	default "all"
+	help
+	  Space-separated list of output devices to build into FFMpeg,
+	  or "all" to build all of them.
+
+	  Run ./configure --list-outdevs in the ffmpeg sources
+	  directory to know the available options.
+
+config BR2_PACKAGE_FFMPEG2_EXTRACONF
+	string "Additional parameters for ./configure"
+	default ""
+	help
+	  Extra parameters that will be appended to FFmpeg's
+	  ./configure commandline.
+
+endif
diff --git a/package/ffmpeg2/ffmpeg2.mk b/package/ffmpeg2/ffmpeg2.mk
new file mode 100644
index 0000000..a321208
--- /dev/null
+++ b/package/ffmpeg2/ffmpeg2.mk
@@ -0,0 +1,361 @@
+################################################################################
+#
+# ffmpeg
+#
+################################################################################
+
+FFMPEG2_VERSION = 2.1.3
+FFMPEG2_SOURCE = ffmpeg-$(FFMPEG2_VERSION).tar.bz2
+FFMPEG2_SITE = http://ffmpeg.org/releases
+FFMPEG2_INSTALL_STAGING = YES
+
+FFMPEG2_LICENSE = LGPLv2.1+, libjpeg license
+FFMPEG2_LICENSE_FILES = LICENSE COPYING.LGPLv2.1
+ifeq ($(BR2_PACKAGE_FFMPEG2_GPL),y)
+FFMPEG2_LICENSE += and GPLv2+
+FFMPEG2_LICENSE_FILES += COPYING.GPLv2
+endif
+
+FFMPEG2_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_xtensa),y)
+FFMPEG2_CFLAGS += -mtext-section-literals
+endif
+
+FFMPEG2_CONF_ENV = CFLAGS="$(FFMPEG2_CFLAGS)"
+
+FFMPEG2_CONF_OPTS = \
+	--prefix=/usr		\
+	$(if $(BR2_HAVE_DOCUMENTATION),,--disable-doc)
+
+ifeq ($(BR2_PACKAGE_FFMPEG2_GPL),y)
+FFMPEG2_CONF_OPTS += --enable-gpl
+else
+FFMPEG2_CONF_OPTS += --disable-gpl
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG2_NONFREE),y)
+FFMPEG2_CONF_OPTS += --enable-nonfree
+else
+FFMPEG2_CONF_OPTS += --disable-nonfree
+endif
+
+#------------------
+# Programs
+ifeq ($(BR2_PACKAGE_FFMPEG2_FFMPEG),y)
+FFMPEG2_CONF_OPTS += --enable-ffmpeg
+else
+FFMPEG2_CONF_OPTS += --disable-ffmpeg
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG2_FFPLAY),y)
+FFMPEG2_DEPENDENCIES += sdl
+FFMPEG2_CONF_OPTS += --enable-ffplay
+FFMPEG2_CONF_ENV += SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config
+else
+FFMPEG2_CONF_OPTS += --disable-ffplay
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG2_FFPROBE),y)
+FFMPEG2_CONF_OPTS += --enable-ffprobe
+else
+FFMPEG2_CONF_OPTS += --disable-ffprobe
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG2_FFSERVER),y)
+FFMPEG2_CONF_OPTS += --enable-ffserver
+else
+FFMPEG2_CONF_OPTS += --disable-ffserver
+endif
+
+#------------------
+# Libraries
+ifeq ($(BR2_PACKAGE_FFMPEG2_AVCODEC),y)
+FFMPEG2_CONF_OPTS += --enable-avcodec
+else
+FFMPEG2_CONF_OPTS += --disable-avcodec
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG2_AVDEVICE),y)
+FFMPEG2_CONF_OPTS += --enable-avdevice
+else
+FFMPEG2_CONF_OPTS += --disable-avdevice
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG2_AVFILTER),y)
+FFMPEG2_CONF_OPTS += --enable-avfilter
+else
+FFMPEG2_CONF_OPTS += --disable-avfilter
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG2_AVFORMAT),y)
+FFMPEG2_CONF_OPTS += --enable-avformat
+else
+FFMPEG2_CONF_OPTS += --disable-avformat
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG2_AVRESAMPLE),y)
+FFMPEG2_CONF_OPTS += --enable-avresample
+else
+FFMPEG2_CONF_OPTS += --disable-avresample
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG2_AVUTIL),y)
+FFMPEG2_CONF_OPTS += --enable-avutil
+else
+FFMPEG2_CONF_OPTS += --disable-avutil
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG2_POSTPROC),y)
+FFMPEG2_CONF_OPTS += --enable-postproc
+else
+FFMPEG2_CONF_OPTS += --disable-postproc
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG2_SWRESAMPLE),y)
+FFMPEG2_CONF_OPTS += --enable-swresample
+else
+FFMPEG2_CONF_OPTS += --disable-swresample
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG2_SWSCALE),y)
+FFMPEG2_CONF_OPTS += --enable-swscale
+else
+FFMPEG2_CONF_OPTS += --disable-swscale
+endif
+
+#------------------
+# Hardware acceleration
+ifeq ($(BR2_PACKAGE_FFMPEG2_DXVA2),y)
+FFMPEG2_CONF_OPTS += --enable-dxva2
+else
+FFMPEG2_CONF_OPTS += --disable-dxva2
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG2_VAAPI),y)
+FFMPEG2_CONF_OPTS += --enable-vaapi
+else
+FFMPEG2_CONF_OPTS += --disable-vaapi
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG2_VDA),y)
+FFMPEG2_CONF_OPTS += --enable-vda
+else
+FFMPEG2_CONF_OPTS += --disable-vda
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG2_VDPAU),y)
+FFMPEG2_CONF_OPTS += --enable-vdpau
+else
+FFMPEG2_CONF_OPTS += --disable-vdpau
+endif
+
+#------------------
+# Components options
+ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG2_ENCODERS)),all)
+FFMPEG2_CONF_OPTS += --disable-encoders \
+	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG2_ENCODERS)),--enable-encoder=$(x))
+endif
+
+ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG2_DECODERS)),all)
+FFMPEG2_CONF_OPTS += --disable-decoders \
+	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG2_DECODERS)),--enable-decoder=$(x))
+endif
+
+ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG2_MUXERS)),all)
+FFMPEG2_CONF_OPTS += --disable-muxers \
+	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG2_MUXERS)),--enable-muxer=$(x))
+endif
+
+ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG2_DEMUXERS)),all)
+FFMPEG2_CONF_OPTS += --disable-demuxers \
+	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG2_DEMUXERS)),--enable-demuxer=$(x))
+endif
+
+ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG2_PARSERS)),all)
+FFMPEG2_CONF_OPTS += --disable-parsers \
+	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG2_PARSERS)),--enable-parser=$(x))
+endif
+
+ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG2_BSFS)),all)
+FFMPEG2_CONF_OPTS += --disable-bsfs \
+	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG2_BSFS)),--enable-bsfs=$(x))
+endif
+
+ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG2_PROTOCOLS)),all)
+FFMPEG2_CONF_OPTS += --disable-protocols \
+	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG2_PROTOCOLS)),--enable-protocol=$(x))
+endif
+
+ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG2_FILTERS)),all)
+FFMPEG2_CONF_OPTS += --disable-filters \
+	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG2_FILTERS)),--enable-filter=$(x))
+endif
+
+ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG2_INDEVS)),all)
+FFMPEG2_CONF_OPTS += --disable-indevs \
+	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG2_INDEVS)),--enable-indevs=$(x))
+endif
+
+ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG2_OUTDEVS)),all)
+FFMPEG2_CONF_OPTS += --disable-indevs \
+	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG2_OUTDEVS)),--enable-outdevs=$(x))
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+FFMPEG2_CONF_OPTS += --enable-pthreads
+else
+FFMPEG2_CONF_OPTS += --disable-pthreads
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+FFMPEG2_CONF_OPTS += --enable-zlib
+FFMPEG2_DEPENDENCIES += zlib
+else
+FFMPEG2_CONF_OPTS += --disable-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+FFMPEG2_CONF_OPTS += --enable-bzlib
+FFMPEG2_DEPENDENCIES += bzip2
+else
+FFMPEG2_CONF_OPTS += --disable-bzlib
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+# openssl isn't license compatible with GPL
+ifeq ($(BR2_PACKAGE_FFMPEG2_GPL)x$(BR2_PACKAGE_FFMPEG2_NONFREE),yx)
+FFMPEG_CONF_OPT += --disable-openssl
+else
+FFMPEG2_CONF_OPTS += --enable-openssl
+FFMPEG2_DEPENDENCIES += openssl
+endif
+else
+FFMPEG2_CONF_OPTS += --disable-openssl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
+FFMPEG2_CONF_OPTS += --enable-libvorbis \
+		     --enable-muxer=ogg \
+		     --enable-encoder=libvorbis
+FFMPEG2_DEPENDENCIES += libvorbis
+else
+FFMPEG2_CONF_OPTS += --disable-libvorbis
+endif
+
+ifeq ($(BR2_i386)$(BR2_x86_64),y)
+ifeq ($(BR2_X86_CPU_HAS_MMX),y)
+FFMPEG2_CONF_OPTS += --enable-yasm
+FFMPEG2_DEPENDENCIES += host-yasm
+else
+FFMPEG2_CONF_OPTS += --disable-yasm --disable-mmx
+endif
+ifeq ($(BR2_X86_CPU_HAS_SSE),y)
+FFMPEG2_CONF_OPTS += --enable-sse
+else
+FFMPEG2_CONF_OPTS += --disable-sse
+endif
+ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
+FFMPEG2_CONF_OPTS += --enable-sse2
+else
+FFMPEG2_CONF_OPTS += --disable-sse2
+endif
+ifeq ($(BR2_X86_CPU_HAS_SSE3),y)
+FFMPEG2_CONF_OPTS += --enable-sse3
+else
+FFMPEG2_CONF_OPTS += --disable-sse3
+endif
+ifeq ($(BR2_X86_CPU_HAS_SSSE3),y)
+FFMPEG2_CONF_OPTS += --enable-ssse3
+else
+FFMPEG2_CONF_OPTS += --disable-ssse3
+endif
+ifeq ($(BR2_X86_CPU_HAS_SSE4),y)
+FFMPEG2_CONF_OPTS += --enable-sse4
+else
+FFMPEG2_CONF_OPTS += --disable-sse4
+endif
+ifeq ($(BR2_X86_CPU_HAS_SSE42),y)
+FFMPEG2_CONF_OPTS += --enable-sse42
+else
+FFMPEG2_CONF_OPTS += --disable-sse42
+endif
+endif # i386 || x86_64
+
+# Explicitly disable everything that doesn't match for ARM
+# FFMPEG "autodetects" by compiling an extended instruction via AS
+# This works on compilers that aren't built for generic by default
+ifeq ($(BR2_arm)$(BR2_armeb),y)
+ifeq ($(BR2_arm7tdmi)$(BR2_arm720t)$(BR2_arm920t)$(BR2_arm922t)$(BR2_strongarm)$(BR2_fa526),y)
+FFMPEG2_CONF_OPTS += --disable-armv5te
+endif
+ifeq ($(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s),y)
+FFMPEG2_CONF_OPTS += --enable-armv6
+else
+FFMPEG2_CONF_OPTS += --disable-armv6 --disable-armv6t2
+endif
+# Note: VFPV(n+1) always selects VFPV(n),
+# so we just need to depend on VFPV2 here.
+ifeq ($(BR2_ARM_CPU_HAS_VFPV2),y)
+FFMPEG2_CONF_OPTS += --enable-vfp
+else
+FFMPEG2_CONF_OPTS += --disable-vfp
+endif
+ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
+FFMPEG2_CONF_OPTS += --enable-neon
+endif
+endif # BR2_arm || BR2_armeb
+
+ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)),y)
+ifeq ($(BR2_MIPS_SOFT_FLOAT),y)
+FFMPEG2_CONF_OPTS += --disable-mipsfpu
+else
+FFMPEG2_CONF_OPTS += --enable-mipsfpu
+endif
+ifeq ($(BR2_mips_32r2),y)
+FFMPEG2_CONF_OPTS += --enable-mips32r2
+else
+FFMPEG2_CONF_OPTS += --disable-mips32r2
+endif
+ifeq ($(BR2_mips_64r2),y)
+FFMPEG2_CONF_OPTS += --enable-mipsdspr1 --enable-mipsdspr2
+else
+FFMPEG2_CONF_OPTS += --disable-mipsdspr1 --disable-mipsdspr2
+endif
+endif # Anything-MIPS
+
+# Set powerpc altivec appropriately
+ifeq ($(BR2_powerpc),y)
+ifeq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),y)
+FFMPEG2_CONF_OPTS += --enable-altivec
+else
+FFMPEG2_CONF_OPTS += --disable-altivec
+endif
+endif
+
+ifeq ($(BR2_PREFER_STATIC_LIB),)
+FFMPEG2_CONF_OPTS += --enable-pic
+endif
+
+FFMPEG2_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_FFMPEG2_EXTRACONF))
+
+# Override FFMPEG2_CONFIGURE_CMDS: FFmpeg does not support --target and others
+define FFMPEG2_CONFIGURE_CMDS
+	(cd $(FFMPEG2_SRCDIR) && rm -rf config.cache && \
+	$(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_CONFIGURE_ARGS) \
+	$(FFMPEG2_CONF_ENV) \
+	./configure \
+		--enable-cross-compile	\
+		--cross-prefix=$(TARGET_CROSS) \
+		--sysroot=$(STAGING_DIR) \
+		--host-cc="$(HOSTCC)" \
+		--arch=$(BR2_ARCH) \
+		--target-os=linux \
+		$(if $(BR2_GCC_TARGET_TUNE),--cpu=$(BR2_GCC_TARGET_TUNE)) \
+		$(SHARED_STATIC_LIBS_OPTS) \
+		$(FFMPEG2_CONF_OPTS) \
+	)
+endef
+
+$(eval $(autotools-package))
-- 
1.8.1.2
