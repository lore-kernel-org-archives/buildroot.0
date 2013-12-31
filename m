From: randy <lxr1234@hotmail.com>
Date: Tue, 31 Dec 2013 20:31:33 +0800
Subject: [Buildroot] [PATCH 1/2] Package: add libav 9.10
Message-ID: <BLU0-SMTP195C11FFF022B690AC7A338ADC90@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Signed-off-by: ayaka <ayaka@mail.sumomo.pri>
- ---
 package/libav/Config.in | 152 ++++++++++++++++++++++++++++++++++++++
 package/libav/libav.mk  | 191
++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 343 insertions(+)
 create mode 100644 package/libav/Config.in
 create mode 100644 package/libav/libav.mk

diff --git a/package/libav/Config.in b/package/libav/Config.in
new file mode 100644
index 0000000..b7405b7
- --- /dev/null
+++ b/package/libav/Config.in
@@ -0,0 +1,152 @@
+comment "libav needs a toolchain w/ largefile, IPv6"
+	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
+
+menuconfig BR2_PACKAGE_LIBAV
+	bool "libav"
+	depends on BR2_LARGEFILE
+	depends on BR2_INET_IPV6
+	help
+	  Libav is a complete, cross-platform solution to record, convert
+	  and stream audio and video.
+
+	  http://libav.org
+
+if BR2_PACKAGE_LIBAV
+
+config BR2_PACKAGE_LIBAV_GPL
+	bool "Enable GPL code"
+	help
+	  allow use of GPL code, the resulting libs and binaries will
+	  be under GPL
+
+config BR2_PACKAGE_LIBAV_NONFREE
+	bool "Enable nonfree code"
+	help
+	  allow use of nonfree code, the resulting libs and binaries
+	  will be unredistributable
+
+config BR2_PACKAGE_LIBAV_AVCONV
+	bool "Build avconv (the command line application)"
+	select BR2_PACKAGE_LIBAV_SWSCALE
+	default y
+	help
+	  Libav is a very fast video and audio converter.
+	  It can also grab from a live audio/video source.
+
+	  It is not needed if you want to link the Libav libraries
+	  to your application.
+
+config BR2_PACKAGE_LIBAV_AVPLAY
+	bool "Build avplay"
+	select BR2_PACKAGE_SDL
+	help
+	  FFplay is a very simple and portable media player using the
+	  Libav libraries and the SDL library.
+	  It is mostly used as a testbed for the various Libav APIs.
+
+config BR2_PACKAGE_LIBAV_AVSERVER
+	bool "Build avserver"
+	help
+	  FFserver is a streaming server for both audio and video.
+
+config BR2_PACKAGE_LIBAV_SWSCALE
+	bool "Build libswscale"
+	help
+	  Swscale is a library of video scaling routines.
+
+config BR2_PACKAGE_LIBAV_ENCODERS
+	string "Enabled encoders"
+	default "all"
+	help
+	  Space-separated list of encoders to build in Libav,
+	  or "all" to build all of them.
+
+	  Run ./configure --list-encoders in the ffmpeg sources
+	  directory to know the available options.
+
+config BR2_PACKAGE_LIBAV_DECODERS
+	string "Enabled decoders"
+	default "all"
+	help
+	  Space-separated list of decoders to build in Libav,
+	  or "all" to build all of them.
+
+	  Run ./configure --list-decoders in the ffmpeg sources
+	  directory to know the available options.
+
+config BR2_PACKAGE_LIBAV_MUXERS
+	string "Enabled muxers"
+	default "all"
+	help
+	  Space-separated list of muxers to build in Libav,
+	  or "all" to build all of them.
+
+	  Run ./configure --list-muxers in the ffmpeg sources
+	  directory to know the available options.
+
+config BR2_PACKAGE_LIBAV_DEMUXERS
+	string "Enabled demuxers"
+	default "all"
+	help
+	  Space-separated list of demuxers to build in Libav,
+	  or "all" to build all of them.
+
+	  Run ./configure --list-demuxers in the ffmpeg sources
+	  directory to know the available options.
+
+config BR2_PACKAGE_LIBAV_PARSERS
+	string "Enabled parsers"
+	default "all"
+	help
+	  Space-separated list of parsers to build in Libav,
+	  or "all" to build all of them.
+
+	  Run ./configure --list-parsers in the ffmpeg sources
+	  directory to know the available options.
+
+config BR2_PACKAGE_LIBAV_BSFS
+	string "Enabled bitstreams"
+	default "all"
+	help
+	  Space-separated list of bitstream filters to build in Libav,
+	  or "all" to build all of them.
+
+	  Run ./configure --list-bsfs in the ffmpeg sources
+	  directory to know the available options.
+
+config BR2_PACKAGE_LIBAV_PROTOCOLS
+	string "Enabled protocols"
+	default "all"
+	help
+	  Space-separated list of protocols to build in Libav,
+	  or "all" to build all of them.
+
+	  Run ./configure --list-protocols in the ffmpeg sources
+	  directory to know the available options.
+
+config BR2_PACKAGE_LIBAV_FILTERS
+	string "Enabled filters"
+	default "all"
+	help
+	  Space-separated list of filters to build in Libav,
+	  or "all" to build all of them.
+
+	  Run ./configure --list-filters in the ffmpeg sources
+	  directory to know the available options.
+
+config BR2_PACKAGE_LIBAV_INDEVS
+	bool "Enable input devices"
+	default y
+
+config BR2_PACKAGE_LIBAV_OUTDEVS
+	bool "Enable output devices"
+	default y
+
+config BR2_PACKAGE_LIBAV_EXTRACONF
+	string "Additional parameters for ./configure"
+	default ""
+	help
+	  Extra parameters that will be appended to Libav's
+	  ./configure commandline.
+
+endif
diff --git a/package/libav/libav.mk b/package/libav/libav.mk
new file mode 100644
index 0000000..1450d01
- --- /dev/null
+++ b/package/libav/libav.mk
@@ -0,0 +1,191 @@
+################################################################################
+#
+# ffmpeg
+#
+################################################################################
+
+LIBAV_VERSION = 9.10
+LIBAV_SOURCE = libav-$(LIBAV_VERSION).tar.gz
+LIBAV_SITE = https://libav.org/releases
+LIBAV_INSTALL_STAGING = YES
+
+LIBAV_LICENSE = LGPLv2.1+, libjpeg license
+LIBAV_LICENSE_FILES = LICENSE COPYING.LGPLv2.1
+ifeq ($(BR2_PACKAGE_LIBAV_GPL),y)
+LIBAV_LICENSE += and GPLv2+
+LIBAV_LICENSE_FILES += COPYING.GPLv2
+endif
+
+LIBAV_CONF_OPT = \
+	--prefix=/usr		\
+	--disable-avfilter	\
+	$(if $(BR2_HAVE_DOCUMENTATION),,--disable-doc)
+
+ifeq ($(BR2_PACKAGE_LIBAV_GPL),y)
+LIBAV_CONF_OPT += --enable-gpl
+else
+LIBAV_CONF_OPT += --disable-gpl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBAV_NONFREE),y)
+LIBAV_CONF_OPT += --enable-nonfree
+else
+LIBAV_CONF_OPT += --disable-nonfree
+endif
+
+ifeq ($(BR2_PACKAGE_LIBAV_AVCONV),y)
+LIBAV_CONF_OPT += --enable-avconv
+else
+LIBAV_CONF_OPT += --disable-avconv
+endif
+
+ifeq ($(BR2_PACKAGE_LIBAV_AVLAY),y)
+LIBAV_DEPENDENCIES += sdl
+LIBAV_CONF_OPT += --enable-avplay
+LIBAV_CONF_ENV += SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config
+else
+LIBAV_CONF_OPT += --disable-avplay
+endif
+
+ifeq ($(BR2_PACKAGE_LIBAV_AVSERVER),y)
+LIBAV_CONF_OPT += --enable-avserver
+else
+LIBAV_CONF_OPT += --disable-avserver
+endif
+
+ifeq ($(BR2_PACKAGE_LIBAV_SWSCALE),y)
+LIBAV_CONF_OPT += --enable-swscale
+else
+LIBAV_CONF_OPT += --disable-swscale
+endif
+
+ifneq ($(call qstrip,$(BR2_PACKAGE_LIBAV_ENCODERS)),all)
+LIBAV_CONF_OPT += --disable-encoders \
+	$(foreach x,$(call
qstrip,$(BR2_PACKAGE_LIBAV_ENCODERS)),--enable-encoder=$(x))
+endif
+
+ifneq ($(call qstrip,$(BR2_PACKAGE_LIBAV_DECODERS)),all)
+LIBAV_CONF_OPT += --disable-decoders \
+	$(foreach x,$(call
qstrip,$(BR2_PACKAGE_LIBAV_DECODERS)),--enable-decoder=$(x))
+endif
+
+ifneq ($(call qstrip,$(BR2_PACKAGE_LIBAV_MUXERS)),all)
+LIBAV_CONF_OPT += --disable-muxers \
+	$(foreach x,$(call
qstrip,$(BR2_PACKAGE_LIBAV_MUXERS)),--enable-muxer=$(x))
+endif
+
+ifneq ($(call qstrip,$(BR2_PACKAGE_LIBAV_DEMUXERS)),all)
+LIBAV_CONF_OPT += --disable-demuxers \
+	$(foreach x,$(call
qstrip,$(BR2_PACKAGE_LIBAV_DEMUXERS)),--enable-demuxer=$(x))
+endif
+
+ifneq ($(call qstrip,$(BR2_PACKAGE_LIBAV_PARSERS)),all)
+LIBAV_CONF_OPT += --disable-parsers \
+	$(foreach x,$(call
qstrip,$(BR2_PACKAGE_LIBAV_PARSERS)),--enable-parser=$(x))
+endif
+
+ifneq ($(call qstrip,$(BR2_PACKAGE_LIBAV_BSFS)),all)
+LIBAV_CONF_OPT += --disable-bsfs \
+	$(foreach x,$(call qstrip,$(BR2_PACKAGE_LIBAV_BSFS)),--enable-bsf=$(x))
+endif
+
+ifneq ($(call qstrip,$(BR2_PACKAGE_LIBAV_PROTOCOLS)),all)
+LIBAV_CONF_OPT += --disable-protocols \
+	$(foreach x,$(call
qstrip,$(BR2_PACKAGE_LIBAV_PROTOCOLS)),--enable-protocol=$(x))
+endif
+
+ifneq ($(call qstrip,$(BR2_PACKAGE_LIBAV_FILTERS)),all)
+LIBAV_CONF_OPT += --disable-filters \
+	$(foreach x,$(call
qstrip,$(BR2_PACKAGE_LIBAV_FILTERS)),--enable-filter=$(x))
+endif
+
+ifeq ($(BR2_PACKAGE_LIBAV_INDEVS),y)
+LIBAV_CONF_OPT += --enable-indevs
+else
+LIBAV_CONF_OPT += --disable-indevs
+endif
+
+ifeq ($(BR2_PACKAGE_LIBAV_OUTDEVS),y)
+LIBAV_CONF_OPT += --enable-outdevs
+else
+LIBAV_CONF_OPT += --disable-outdevs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+LIBAV_CONF_OPT += --enable-pthreads
+else
+LIBAV_CONF_OPT += --disable-pthreads
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+LIBAV_CONF_OPT += --enable-zlib
+LIBAV_DEPENDENCIES += zlib
+else
+LIBAV_CONF_OPT += --disable-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_X264),y)
+LIBAV_CONF_OPT += --enable-libx264
+LIBAV_DEPENDENCIES += x264
+endif
+
+ifeq ($(BR2_i386)$(BR2_x86_64),y)
+# MMX on is default for x86, disable it for lowly x86-type processors
+ifeq
($(BR2_x86_i386)$(BR2_x86_i486)$(BR2_x86_i586)$(BR2_x86_i686)$(BR2_x86_pentiumpro)$(BR2_x86_geode),y)
+LIBAV_CONF_OPT += --disable-mmx
+else
+# If it is enabled, nasm is required
+LIBAV_DEPENDENCIES += host-nasm
+endif
+endif
+
+# Explicitly disable everything that doesn't match for ARM
+# LIBAV "autodetects" by compiling an extended instruction via AS
+# This works on compilers that aren't built for generic by default
+ifeq
($(BR2_arm7tdmi)$(BR2_arm720t)$(BR2_arm920t)$(BR2_arm922t)$(BR2_strongarm)$(BR2_fa526),y)
+LIBAV_CONF_OPT += --disable-armv5te
+endif
+ifeq ($(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s),y)
+LIBAV_CONF_OPT += --enable-armv6
+else
+LIBAV_CONF_OPT += --disable-armv6 --disable-armv6t2
+endif
+ifeq
($(BR2_arm10)$(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s)$(BR2_cortex_a5)$(BR2_cortex_a8)$(BR2_cortex_a9)$(BR2_cortex_a15),y)
+else
+LIBAV_CONF_OPT += --disable-vfp
+endif
+ifeq ($(BR2_ARM_CPU_HAS_NEON),n)
+LIBAV_CONF_OPT += --disable-neon
+endif
+
+# Set powerpc altivec appropriately
+ifeq ($(BR2_powerpc),y)
+ifeq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),y)
+LIBAV_CONF_OPT += --enable-altivec
+else
+LIBAV_CONF_OPT += --disable-altivec
+endif
+endif
+
+LIBAV_CONF_OPT += $(call qstrip,$(BR2_PACKAGE_LIBAV_EXTRACONF))
+
+# Override LIBAV_CONFIGURE_CMDS: FFmpeg does not support --target and
others
+define LIBAV_CONFIGURE_CMDS
+	(cd $(LIBAV_SRCDIR) && rm -rf config.cache && \
+	$(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_CONFIGURE_ARGS) \
+	$(LIBAV_CONF_ENV) \
+	./configure \
+		--enable-cross-compile	\
+		--cross-prefix=$(TARGET_CROSS) \
+		--sysroot=$(STAGING_DIR) \
+		--host-cc="$(HOSTCC)" \
+		--arch=$(BR2_ARCH) \
+		--target-os=linux \
+		--extra-cflags=-fPIC \
+		$(SHARED_STATIC_LIBS_OPTS) \
+		$(LIBAV_CONF_OPT) \
+	)
+endef
+
+$(eval $(autotools-package))
- -- 
1.8.5.1
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJSwrkhAAoJEPb4VsMIzTziNBkIAKzQ1/0u/BKv0IMbhHlBqsG0
UGbFt6wwGZoBDEDDhmO6cbYk37Nj5i+CdA9HN0V+GX/rzQX1BmoHCdCtnfEV+uQM
hIKHYsEjHI8uiikL1GOHguapIzU3x0DKAnRZ7F5IH+T74zFEkrwKgKhmQP2rmAfc
AnJnHUTOSx4H7fe/8E/bxQpRLt7DpZgK3gRyTqerLjF2eX70DNApCI0ZEMxxdw7F
uE12EwJO9hfj7ysi+aGK4Nt3o9ct+E4IrgZGRnbazDxhwoiAV8C9jwsvulE/jWUs
+CebUmMWCjFPL9ThRgYK9nLduwHrtms55K7vk9UEHxu/dt5FKNYwttDCwdkCjgk=
=rAHj
-----END PGP SIGNATURE-----
