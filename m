From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Jan 2014 20:56:22 +0100
Subject: [Buildroot] [PATCH 2/3] package/ffmpeg2: new package
In-Reply-To: <cover.1390593263.git.yann.morin.1998@free.fr>
References: <cover.1390593263.git.yann.morin.1998@free.fr>
Message-ID: <c75d8d16e4e22ab1a7a4490473dc41f27f51394a.1390593263.git.yann.morin.1998@free.fr>
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
Note: I prefered to provide a separate package, rather than bumping,
since I am not comfortable to say that all users of ffmpeg will indeed
want to switch, or that existing ffmpeg-based packages will continue
to build (and run!) with ffmpeg2 (eg. the upcoming xbmc).
---
 package/Config.in          |   1 +
 package/ffmpeg2/Config.in  | 235 ++++++++++++++++++++++++++++++++++++++
 package/ffmpeg2/ffmpeg2.mk | 274 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 510 insertions(+)
 create mode 100644 package/ffmpeg2/Config.in
 create mode 100644 package/ffmpeg2/ffmpeg2.mk

diff --git a/package/Config.in b/package/Config.in
index 397cc11..6d3b9c0 100644
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
index 0000000..ce61900
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
+	  upgrade (L)GPL to version 3
+
+config BR2_PACKAGE_FFMPEG2_NONFREE
+	bool "Enable nonfree code"
+	help
+	  allow use of nonfree code, the resulting libs and binaries
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
index 0000000..0bca20f
--- /dev/null
+++ b/package/ffmpeg2/ffmpeg2.mk
@@ -0,0 +1,274 @@
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
+	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG2_BSFS)),--enable-bsf=$(x))
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
+ifeq ($(BR2_i386)$(BR2_x86_64),y)
+# MMX on is default for x86, disable it for lowly x86-type processors
+ifeq ($(BR2_x86_i386)$(BR2_x86_i486)$(BR2_x86_i586)$(BR2_x86_i686)$(BR2_x86_pentiumpro)$(BR2_x86_geode),y)
+FFMPEG2_CONF_OPTS += --disable-mmx
+else
+# If it is enabled, nasm is required
+FFMPEG2_DEPENDENCIES += host-nasm
+endif
+endif
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
+# Set powerpc altivec appropriately
+ifeq ($(BR2_powerpc),y)
+ifeq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),y)
+FFMPEG2_CONF_OPTS += --enable-altivec
+else
+FFMPEG2_CONF_OPTS += --disable-altivec
+endif
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
+		--extra-cflags=-fPIC \
+		$(SHARED_STATIC_LIBS_OPTS) \
+		$(FFMPEG2_CONF_OPTS) \
+	)
+endef
+
+$(eval $(autotools-package))
-- 
1.8.1.2
