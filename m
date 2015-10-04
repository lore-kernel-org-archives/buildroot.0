From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 4 Oct 2015 19:04:35 +0200
Subject: [Buildroot] [v4,1/1] package/freeswitch: new package
In-Reply-To: <1443730534-12501-1-git-send-email-bernd.kuhls@t-online.de>
References: <1443730534-12501-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <56115C23.7000501@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd,

this is a large patch. I would prefer a series adding the minimal stuff
initially, then adding extra features in successive steps. This would
make reviewing easier and allow partial merging. But this is a personal
opinion, others might prefer the other way around.

I'll only do a partial review, my heart is not strong enough to do it
all, sorry.

Bernd Kuhls wrote:
[...]
> diff --git a/package/freeswitch/0001-cross_git.patch b/package/freeswitch/0001-cross_git.patch
> new file mode 100644
> index 0000000..f977bb8
> --- /dev/null
> +++ b/package/freeswitch/0001-cross_git.patch
> @@ -0,0 +1,17 @@
> +Fix cross-compilation
> +
> +build breaks with -Werror enabled
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +
> +--- freeswitch.git/configure.ac.orig	2015-02-24 18:15:49.000000000 +0100
> ++++ freeswitch.git/configure.ac	2015-02-24 19:17:15.857077515 +0100
> +@@ -379,7 +379,7 @@
> + elif test "x${ax_cv_c_compiler_vendor}" = "xgnu" ; then
> +     APR_ADDTO(SWITCH_AM_CFLAGS, -fPIC)
> +     APR_ADDTO(SWITCH_AM_CXXFLAGS, -fPIC)
> +-    if test "$ac_cv_gcc_supports_w_no_unused_result" = yes; then
> ++    if test "$ac_cv_gcc_supports_w_no_unused_result" = xyes; then
> +       APR_ADDTO(SWITCH_AM_CFLAGS, -Werror)
> +     fi
> +     if test "${enable_64}" = "yes"; then
> diff --git a/package/freeswitch/0002-jpeg.patch b/package/freeswitch/0002-jpeg.patch
> new file mode 100644
> index 0000000..fc38409
> --- /dev/null
> +++ b/package/freeswitch/0002-jpeg.patch
> @@ -0,0 +1,29 @@
> +Fix jpeg detection
> +
> +libyuv has an optional jpeg dependency, freeswitch configure misses -ljpeg
> +when searching for libyuv and therefore assumes libyuv is missing. When
> +freeswitch first searches for libjpeg, -ljpeg will be added to
> +PKG_CHECK_MODULES([YUV].
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +
> +diff -uNr freeswitch_video2-b8b6acf33efe64aebbd939dd7281d6b6cd8fc2f4.org/configure.ac freeswitch_video2-b8b6acf33efe64aebbd939dd7281d6b6cd8fc2f4/configure.ac
> +--- freeswitch_video2-b8b6acf33efe64aebbd939dd7281d6b6cd8fc2f4.org/configure.ac	2015-05-23 05:18:56.000000000 +0200
> ++++ freeswitch_video2-b8b6acf33efe64aebbd939dd7281d6b6cd8fc2f4/configure.ac	2015-05-25 14:15:20.360156247 +0200
> +@@ -783,6 +783,8 @@
> + APR_ADDTO([PLATFORM_CORE_LIBS], [-lz])
> + fi
> +
> ++AC_CHECK_LIB(jpeg, jpeg_std_error,, AC_MSG_ERROR([no usable libjpeg; please install libjpeg devel package or equivalent]))
> ++
> + PKG_CHECK_MODULES([YUV], [libyuv >= 0.0.1280],
> +	     [AC_MSG_RESULT([yes]);AM_CONDITIONAL([HAVE_YUV],[true])],
> +	     [AC_MSG_RESULT([no]);AM_CONDITIONAL([HAVE_YUV],[false])])
> +@@ -797,7 +799,6 @@
> +
> + save_LIBS="$LIBS"
> + LIBS=
> +-AC_CHECK_LIB(jpeg, jpeg_std_error,, AC_MSG_ERROR([no usable libjpeg; please install libjpeg devel package or equivalent]))
> +
> + AC_CHECK_LIB(jbig, jbg_enc_out, have_libjbig=yes, have_libjbig=no)
> + if test "x$have_libjbig" = "xyes"  ; then
> diff --git a/package/freeswitch/0003-aarch64_zrtp.patch b/package/freeswitch/0003-aarch64_zrtp.patch
> new file mode 100644
> index 0000000..5d78d81
> --- /dev/null
> +++ b/package/freeswitch/0003-aarch64_zrtp.patch
> @@ -0,0 +1,22 @@
> +Add aarch64 support in zrtp.
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +
> +diff -uNr freeswitch-16d600c0350a79c2532c739dd1432f7ed318ea09.org/libs/libzrtp/include/zrtp_config.h freeswitch-16d600c0350a79c2532c739dd1432f7ed318ea09/libs/libzrtp/include/zrtp_config.h
> +--- freeswitch-16d600c0350a79c2532c739dd1432f7ed318ea09.org/libs/libzrtp/include/zrtp_config.h	2015-09-04 23:46:10.000000000 +0200
> ++++ freeswitch-16d600c0350a79c2532c739dd1432f7ed318ea09/libs/libzrtp/include/zrtp_config.h	2015-09-06 15:29:38.642038763 +0200
> +@@ -88,7 +88,13 @@
> +  */
> + #define ZRTP_BYTE_ORDER ZBO_BIG_ENDIAN
> +
> +-#elif defined(ARM) || defined(_ARM_) || defined(ARMV4) || defined(__arm__)
> ++#elif defined(__AARCH64EB__)
> ++/*
> ++ * aarch64, big endian
> ++ */
> ++#define ZRTP_BYTE_ORDER ZBO_BIG_ENDIAN
> ++
> ++#elif defined(ARM) || defined(_ARM_) || defined(ARMV4) || defined(__arm__) || defined(__AARCH64EL__)
> + /*
> +  * ARM, default to little endian
> +  */

Did you try to send these patches upstream?

> diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
> new file mode 100644
> index 0000000..ffb74f5
> --- /dev/null
> +++ b/package/freeswitch/Config.in
> @@ -0,0 +1,300 @@
> +comment "freeswitch needs a toolchain w/ C++, threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
> +
> +menuconfig BR2_PACKAGE_FREESWITCH
> +	bool "freeswitch"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU # apr, included in freeswitch source
> +	depends on !BR2_STATIC_LIBS # apr, included in freeswitch source
> +	# Triggers the _gp link issue in nios2
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_LIBJPEG
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_PCRE
> +	select BR2_PACKAGE_SPEEX
> +	select BR2_PACKAGE_SQLITE
> +	# "libuuid development package highly recommended!"
> +	# https://freeswitch.org/stash/projects/FS/repos/freeswitch/browse/build/config/uuid.m4#9
> +	select BR2_PACKAGE_UTIL_LINUX if BR2_USE_WCHAR
> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID if BR2_USE_WCHAR
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  FreeSWITCH is a scalable open source cross-platform telephony
> +	  platform designed to route and interconnect popular communication
> +	  protocols using audio, video, text or any other form of media.
> +
> +	  https://www.freeswitch.org
> +
> +if BR2_PACKAGE_FREESWITCH
> +
> +config BR2_PACKAGE_FREESWITCH_FREETYPE
> +	bool "freetype"
> +	select BR2_PACKAGE_FREETYPE

Weird, how does freeswitch use freetype? Googling "freeswitch freetype"
lead to no more clues. A couple help lines here would be very useful!

Also, even with BR2_PACKAGE_FREESWITCH_FREETYPE disabled, if
BR2_PACKAGE_FREETYPE is enabled freeswitch will detect it, so this
option is misleading here.

These points are valid for several other config knobs below.

> +
> +config BR2_PACKAGE_FREESWITCH_LIBEDIT
> +	bool "libedit"
> +	depends on BR2_USE_WCHAR
> +	select BR2_PACKAGE_LIBEDIT
> +
> +comment "libedit support needs a toolchain w/ wchar"
> +	depends on !BR2_USE_WCHAR
> +
> +config BR2_PACKAGE_FREESWITCH_LIBPNG
> +	bool "libpng"
> +	select BR2_PACKAGE_LIBPNG
> +
> +config BR2_PACKAGE_FREESWITCH_MYSQL
> +	bool "mysql"
> +	select BR2_PACKAGE_MYSQL
> +
> +config BR2_PACKAGE_FREESWITCH_UNIXODBC
> +	bool "unixodbc"
> +	select BR2_PACKAGE_UNIXODBC
> +
> +config BR2_PACKAGE_FREESWITCH_XML_RPC
> +	bool "xml_rpc"
> +	default y

Is there a specific reason to default to 'y'? I think we should disable
all optional stuff unless there's a good reason.

> +	depends on BR2_USE_WCHAR
> +	help
> +	  mod_xml_rpc allows you to use the webapi - firing any API from
> +	  the web browser just as you would from the FS console!
> +
> +	  https://freeswitch.org/confluence/display/FREESWITCH/mod_xml_rpc

I appreciate very much the help text here. 2~4 lines + URL is ideal.

> +
> +comment "mod_xml_rpc needs a toolchain w/ wchar"
> +	depends on !BR2_USE_WCHAR
> +
> +config BR2_PACKAGE_FREESWITCH_ZRTP
> +	bool "zrtp"
> +	default y

Same here.

> +	depends on !BR2_armeb

Why?

> +config BR2_PACKAGE_FREESWITCH_VIDEO
> +	bool "video conferencing"
> +	depends on (BR2_UCLIBC_VERSION_SNAPSHOT || BR2_UCLIBC_VERSION_NG || BR2_TOOLCHAIN_USES_GLIBC) # vlc
> +	depends on BR2_PACKAGE_LIBOPENH264_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 # vlc
> +	depends on BR2_USE_WCHAR # vlc
> +	select BR2_PACKAGE_FFMPEG
> +	select BR2_PACKAGE_FFMPEG_AVRESAMPLE
> +	select BR2_PACKAGE_FFMPEG_SWSCALE
> +	select BR2_PACKAGE_IMAGEMAGICK
> +	select BR2_PACKAGE_LIBOPENH264
> +	select BR2_PACKAGE_LIBVPX
> +	select BR2_PACKAGE_LIBYUV
> +	select BR2_PACKAGE_VLC

If my understanding is correct, freeswitch only uses vlc and maybe a
few other of these packages directly. For example, configure.ac does not
mention ffmpeg anywhere. So I guess you should do:

	select BR2_PACKAGE_FFMPEG # vlc

and remove the dependency on ffmpeg in FREESWITCH_DEPENDENCIES below.
Similarly for other options.

> +config BR2_PACKAGE_FREESWITCH_AUDIO_CODEC2
> +	bool "codec2"
> +	select BR2_PACKAGE_LIBCODEC2
> +	help
> +	  codec2 is a narrow band codec created by the developer of the
> +	  speex codec.
> +
> +	  https://freeswitch.org/confluence/display/FREESWITCH/mod_codec2
> +
> +config BR2_PACKAGE_FREESWITCH_AUDIO_G7221
> +	bool "g7221"

Nitpicking, but I'd name this option either "G.722.1" like the codec
name or libg722_1 like the library. Yet another spelling is adding
confusion to the already tricky ITU-T standard naming.

> +	default y
> +	select BR2_PACKAGE_LIBG7221
> +	help
> +	  libg722_1 is a library for the ITU G.722.1 and Annex C
> +	  wideband speech codecs.
> +
> +	  http://www.soft-switch.org
> +
> +config BR2_PACKAGE_FREESWITCH_AUDIO_ILBC
> +	bool "ilbc"

Same here.

> +config BR2_PACKAGE_FREESWITCH_ENDPOINT_RTMP
> +	bool "rtmp"
> +	help
> +	  mod_rtmp is an RTMP (Real time media protocol) endpoint for
> +	  FreeSWITCH. The RTMP protocol is primarily used by Flash for
> +	  streaming audio, video, and data over the Internet.
> +
> +	  https://freeswitch.org/confluence/display/FREESWITCH/mod_rtmp

Freeswitch seems to have a _lot_ of modules mentioned in modules.conf,
more than 150, and ~40 are enabled by default. I wonder if it's sound to
expose a bunch of them in the Buildroot defconfig: the list will always
be incomplete, while still being very long. I'd like to have a single
BR2_PACKAGE_FREESWITCH_CUSTOM_MODULES_CONF_FILE so the user can provide
his own list, much like what we have in exim. But I understand some
modules have dependencies, like endpoints/mod_alsa needing alsa-lib.

Or have explicit kconfig options for all modules which have extra
dependencies, and a single BR2_PACKAGE_FREESWITCH_ENABLE_MODULES
that contains a space-separated list of all other modules to enable?

> diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
> new file mode 100644
> index 0000000..cacb5c6
> --- /dev/null
> +++ b/package/freeswitch/freeswitch.mk
> @@ -0,0 +1,313 @@
> +################################################################################
> +#
> +# freeswitch
> +#
> +################################################################################
> +
> +FREESWITCH_VERSION = 1.6.2
> +FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
> +FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
> +FREESWITCH_LICENSE = MPL v1.1
> +FREESWITCH_LICENSE_FILES = docs/COPYING
> +
> +# required dependencies
> +FREESWITCH_DEPENDENCIES = \
> +	host-autoconf host-automake host-libtool host-pkgconf \
> +	libcurl libjpeg openssl pcre sqlite speex zlib
> +
> +define FREESWITCH_BOOTSTRAP
> +	cd $(@D) && $(TARGET_MAKE_ENV) ./rebootstrap.sh
> +endef
> +FREESWITCH_POST_PATCH_HOOKS += FREESWITCH_BOOTSTRAP

This should be in _PRE_PATCH_HOOKS. Not only because it is part of the
configuration step, but also because <pkg>-patch may happen before the
dependencies are built. It's <pkg>-configure that pulls in that
dependency. (this was suggested by Thomas Petazzoni, thanks).

-- 
Luca
