From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  7 Sep 2015 21:07:00 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/freeswitch: new package
In-Reply-To: <1441652820-5922-1-git-send-email-bernd.kuhls@t-online.de>
References: <1441652820-5922-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1441652820-5922-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: Addressed various comments (Thomas)

 package/Config.in                          |   1 +
 package/freeswitch/0001-cross_git.patch    |  17 ++
 package/freeswitch/0002-jpeg.patch         |  24 +++
 package/freeswitch/0003-aarch64_zrtp.patch |  22 ++
 package/freeswitch/Config.in               | 311 ++++++++++++++++++++++++++++
 package/freeswitch/freeswitch.mk           | 322 +++++++++++++++++++++++++++++
 6 files changed, 697 insertions(+)
 create mode 100644 package/freeswitch/0001-cross_git.patch
 create mode 100644 package/freeswitch/0002-jpeg.patch
 create mode 100644 package/freeswitch/0003-aarch64_zrtp.patch
 create mode 100644 package/freeswitch/Config.in
 create mode 100644 package/freeswitch/freeswitch.mk

diff --git a/package/Config.in b/package/Config.in
index 9bd4190..a8716b4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1235,6 +1235,7 @@ endif
 	source "package/fmc/Config.in"
 	source "package/foomatic-filters/Config.in"
 	source "package/fping/Config.in"
+	source "package/freeswitch/Config.in"
 	source "package/gesftpserver/Config.in"
 	source "package/gutenprint/Config.in"
 	source "package/hans/Config.in"
diff --git a/package/freeswitch/0001-cross_git.patch b/package/freeswitch/0001-cross_git.patch
new file mode 100644
index 0000000..f977bb8
--- /dev/null
+++ b/package/freeswitch/0001-cross_git.patch
@@ -0,0 +1,17 @@
+Fix cross-compilation
+
+build breaks with -Werror enabled
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- freeswitch.git/configure.ac.orig	2015-02-24 18:15:49.000000000 +0100
++++ freeswitch.git/configure.ac	2015-02-24 19:17:15.857077515 +0100
+@@ -379,7 +379,7 @@
+ elif test "x${ax_cv_c_compiler_vendor}" = "xgnu" ; then
+     APR_ADDTO(SWITCH_AM_CFLAGS, -fPIC)
+     APR_ADDTO(SWITCH_AM_CXXFLAGS, -fPIC)
+-    if test "$ac_cv_gcc_supports_w_no_unused_result" = yes; then
++    if test "$ac_cv_gcc_supports_w_no_unused_result" = xyes; then
+       APR_ADDTO(SWITCH_AM_CFLAGS, -Werror)
+     fi
+     if test "${enable_64}" = "yes"; then
diff --git a/package/freeswitch/0002-jpeg.patch b/package/freeswitch/0002-jpeg.patch
new file mode 100644
index 0000000..26094a0
--- /dev/null
+++ b/package/freeswitch/0002-jpeg.patch
@@ -0,0 +1,24 @@
+Fix jpeg detection
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr freeswitch_video2-b8b6acf33efe64aebbd939dd7281d6b6cd8fc2f4.org/configure.ac freeswitch_video2-b8b6acf33efe64aebbd939dd7281d6b6cd8fc2f4/configure.ac
+--- freeswitch_video2-b8b6acf33efe64aebbd939dd7281d6b6cd8fc2f4.org/configure.ac	2015-05-23 05:18:56.000000000 +0200
++++ freeswitch_video2-b8b6acf33efe64aebbd939dd7281d6b6cd8fc2f4/configure.ac	2015-05-25 14:15:20.360156247 +0200
+@@ -783,6 +783,8 @@
+ APR_ADDTO([PLATFORM_CORE_LIBS], [-lz])
+ fi
+ 
++AC_CHECK_LIB(jpeg, jpeg_std_error,, AC_MSG_ERROR([no usable libjpeg; please install libjpeg devel package or equivalent]))
++
+ PKG_CHECK_MODULES([YUV], [libyuv >= 0.0.1280],
+	     [AC_MSG_RESULT([yes]);AM_CONDITIONAL([HAVE_YUV],[true])],
+	     [AC_MSG_RESULT([no]);AM_CONDITIONAL([HAVE_YUV],[false])])
+@@ -797,7 +799,6 @@
+ 
+ save_LIBS="$LIBS"
+ LIBS=
+-AC_CHECK_LIB(jpeg, jpeg_std_error,, AC_MSG_ERROR([no usable libjpeg; please install libjpeg devel package or equivalent]))
+ 
+ AC_CHECK_LIB(jbig, jbg_enc_out, have_libjbig=yes, have_libjbig=no)
+ if test "x$have_libjbig" = "xyes"  ; then
diff --git a/package/freeswitch/0003-aarch64_zrtp.patch b/package/freeswitch/0003-aarch64_zrtp.patch
new file mode 100644
index 0000000..5d78d81
--- /dev/null
+++ b/package/freeswitch/0003-aarch64_zrtp.patch
@@ -0,0 +1,22 @@
+Add aarch64 support in zrtp.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr freeswitch-16d600c0350a79c2532c739dd1432f7ed318ea09.org/libs/libzrtp/include/zrtp_config.h freeswitch-16d600c0350a79c2532c739dd1432f7ed318ea09/libs/libzrtp/include/zrtp_config.h
+--- freeswitch-16d600c0350a79c2532c739dd1432f7ed318ea09.org/libs/libzrtp/include/zrtp_config.h	2015-09-04 23:46:10.000000000 +0200
++++ freeswitch-16d600c0350a79c2532c739dd1432f7ed318ea09/libs/libzrtp/include/zrtp_config.h	2015-09-06 15:29:38.642038763 +0200
+@@ -88,7 +88,13 @@
+  */
+ #define ZRTP_BYTE_ORDER ZBO_BIG_ENDIAN
+ 
+-#elif defined(ARM) || defined(_ARM_) || defined(ARMV4) || defined(__arm__)
++#elif defined(__AARCH64EB__)
++/*
++ * aarch64, big endian
++ */
++#define ZRTP_BYTE_ORDER ZBO_BIG_ENDIAN
++
++#elif defined(ARM) || defined(_ARM_) || defined(ARMV4) || defined(__arm__) || defined(__AARCH64EL__)
+ /*
+  * ARM, default to little endian
+  */
diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
new file mode 100644
index 0000000..22a85ee
--- /dev/null
+++ b/package/freeswitch/Config.in
@@ -0,0 +1,311 @@
+comment "freeswitch needs a toolchain w/ C++, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	depends on !BR2_UCLIBC_VERSION_NG
+
+menuconfig BR2_PACKAGE_FREESWITCH
+	bool "freeswitch"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # apr, included in freeswitch source
+	depends on !BR2_STATIC_LIBS # apr, included in freeswitch source
+	# Triggers the _gp link issue in nios2
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	depends on !BR2_UCLIBC_VERSION_NG
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBJPEG
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_SPEEX
+	select BR2_PACKAGE_SQLITE
+	# "libuuid development package highly recommended!"
+	# https://freeswitch.org/stash/projects/FS/repos/freeswitch/browse/build/config/uuid.m4#9
+	select BR2_PACKAGE_UTIL_LINUX if BR2_USE_WCHAR
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID if BR2_USE_WCHAR
+	select BR2_PACKAGE_ZLIB
+	help
+	  FreeSWITCH is a scalable open source cross-platform telephony
+	  platform designed to route and interconnect popular communication
+	  protocols using audio, video, text or any other form of media.
+
+	  https://www.freeswitch.org
+
+if BR2_PACKAGE_FREESWITCH
+
+config BR2_PACKAGE_FREESWITCH_FREETYPE
+	bool "freetype"
+	select BR2_PACKAGE_FREETYPE
+
+config BR2_PACKAGE_FREESWITCH_LIBEDIT
+	bool "libedit"
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBEDIT
+
+comment "libedit support needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
+config BR2_PACKAGE_FREESWITCH_LIBPNG
+	bool "libpng"
+	select BR2_PACKAGE_LIBPNG
+
+config BR2_PACKAGE_FREESWITCH_MYSQL
+	bool "mysql"
+	select BR2_PACKAGE_MYSQL
+
+config BR2_PACKAGE_FREESWITCH_UNIXODBC
+	bool "unixodbc"
+	select BR2_PACKAGE_UNIXODBC
+
+config BR2_PACKAGE_FREESWITCH_XML_RPC
+	bool "xml_rpc"
+	default y
+	depends on BR2_USE_WCHAR
+	help
+	  mod_xml_rpc allows you to use the webapi - firing any API from
+	  the web browser just as you would from the FS console!
+
+	  https://freeswitch.org/confluence/display/FREESWITCH/mod_xml_rpc
+
+comment "mod_xml_rpc needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
+config BR2_PACKAGE_FREESWITCH_ZRTP
+	bool "zrtp"
+	default y
+	depends on !BR2_armeb
+	help
+	  ZRTP is SRTP based, but instead of using SIP to exchange keys,
+	  it exchanges keys within the media stream itself making it more
+	  secure.
+
+	  https://freeswitch.org/confluence/display/FREESWITCH/ZRTP
+
+menu "Applications"
+
+config BR2_PACKAGE_FREESWITCH_AVMD
+	bool "avmd"
+	help
+	  AVMD stands for "Advanced Voice Mail Detection" and mod_avmd
+	  is designed to detect the beep sound at the end of voicemail
+	  or answering machine greetings.
+
+	  https://freeswitch.org/confluence/display/FREESWITCH/mod_avmd
+
+config BR2_PACKAGE_FREESWITCH_BLACKLIST
+	bool "blacklist"
+	help
+	  The blacklist module is a tool designed to be called from a
+	  dialplan or script which returns a boolean value of 'true' or
+	  'false'.
+
+	  https://freeswitch.org/confluence/display/FREESWITCH/mod_blacklist
+
+config BR2_PACKAGE_FREESWITCH_CALLCENTER
+	bool "callcenter"
+	help
+	  mod_callcenter is an inbound call queuing application that can
+	  be used for call center needs.
+
+	  https://freeswitch.org/confluence/display/FREESWITCH/mod_callcenter
+
+config BR2_PACKAGE_FREESWITCH_DPTOOLS
+	bool "dptools"
+	default y
+	help
+	  Dialplan tools provide the apps (commands) to process call
+	  sessions in XML dialplans.
+
+	  https://freeswitch.org/confluence/display/FREESWITCH/mod_dptools
+
+config BR2_PACKAGE_FREESWITCH_EASYROUTE
+	bool "easyroute"
+	select BR2_PACKAGE_FREESWITCH_UNIXODBC
+	help
+	  Easyroute is a simple DID routing engine that uses a database
+	  lookup to determine how to route an incoming call. It uses a
+	  simple principle of numbers and gateways, with a many-to-one
+	  relationship.
+
+	  https://freeswitch.org/confluence/display/FREESWITCH/mod_easyroute
+
+config BR2_PACKAGE_FREESWITCH_ENUM
+	bool "enum"
+	select BR2_PACKAGE_LIBLDNS
+	help
+	  ENUM (Electronic Number Mapping System) is a system that uses
+	  standard phone numbers as a key to lookup addressing and
+	  identification information that can potentially let Freeswitch
+	  servers communicate directly, thus bypassing the PSTN, reducing
+	  cost, and improving audio quality.
+
+	  https://freeswitch.org/confluence/display/FREESWITCH/mod_enum
+
+config BR2_PACKAGE_FREESWITCH_VIDEO
+	bool "video conferencing"
+	depends on BR2_PACKAGE_LIBOPENH264_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_FFMPEG_AVRESAMPLE
+	select BR2_PACKAGE_FFMPEG_SWSCALE
+	select BR2_PACKAGE_IMAGEMAGICK
+	select BR2_PACKAGE_LIBOPENH264
+	select BR2_PACKAGE_LIBVPX
+	select BR2_PACKAGE_LIBYUV
+	select BR2_PACKAGE_VLC
+	help
+	  Video conferencing support
+
+	  https://freeswitch.org/confluence/display/FREESWITCH/FreeSWITCH+1.6+Video
+
+comment "video conferencing support needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
+endmenu # Applications
+
+menu "Audio codecs"
+
+config BR2_PACKAGE_FREESWITCH_AUDIO_BROADVOICE
+	bool "broadvoice"
+	select BR2_PACKAGE_LIBBROADVOICE
+	help
+	  BroadVoice16 and BroadVoice32 audio codecs (Broadcom codecs).
+
+	  https://www.broadcom.com/support/broadvoice
+
+config BR2_PACKAGE_FREESWITCH_AUDIO_CODEC2
+	bool "codec2"
+	select BR2_PACKAGE_LIBCODEC2
+	help
+	  codec2 is a narrow band codec created by the developer of the
+	  speex codec.
+
+	  https://freeswitch.org/confluence/display/FREESWITCH/mod_codec2
+
+config BR2_PACKAGE_FREESWITCH_AUDIO_G7221
+	bool "g7221"
+	default y
+	select BR2_PACKAGE_LIBG7221
+	help
+	  libg722_1 is a library for the ITU G.722.1 and Annex C
+	  wideband speech codecs.
+
+	  http://www.soft-switch.org
+
+config BR2_PACKAGE_FREESWITCH_AUDIO_ILBC
+	bool "ilbc"
+	select BR2_PACKAGE_LIBILBC
+	help
+	  iLBC is a good low bitrate codec, offering compression similar
+	  to G.729 however the MOS is higher when there are some lost
+	  packets.
+
+	  https://freeswitch.org/confluence/display/FREESWITCH/mod_iLBC
+
+config BR2_PACKAGE_FREESWITCH_AUDIO_ISAC
+	bool "isac"
+	# no aarch64/armeb support in src/mod/codecs/mod_isac/typedefs.h
+	depends on !BR2_aarch64 && !BR2_armeb
+	help
+	  iSAC is a HD codec kit similar to G.722 anthony extracted iSAC
+	  codec from WebRTC project and built mod_iSAC on top of it.
+
+	  https://freeswitch.org/confluence/display/FREESWITCH/mod_isac
+
+config BR2_PACKAGE_FREESWITCH_AUDIO_OPUS
+	bool "opus"
+	default y
+	select BR2_PACKAGE_OPUS
+	help
+	  Opus codec implementation in Freeswitch.
+
+	  https://freeswitch.org/confluence/display/FREESWITCH/mod_opus
+
+config BR2_PACKAGE_FREESWITCH_AUDIO_PORTAUDIO
+	bool "portaudio"
+	select BR2_PACKAGE_PORTAUDIO
+
+config BR2_PACKAGE_FREESWITCH_AUDIO_SILK
+	bool "silk"
+	select BR2_PACKAGE_LIBSILK
+
+config BR2_PACKAGE_FREESWITCH_AUDIO_SNDFILE
+	bool "sndfile"
+	select BR2_PACKAGE_LIBSNDFILE
+
+config BR2_PACKAGE_FREESWITCH_AUDIO_SOUNDTOUCH
+	bool "soundtouch"
+	select BR2_PACKAGE_LIBSOUNDTOUCH
+
+endmenu # Audio codecs
+
+menu "Endpoints"
+
+config BR2_PACKAGE_FREESWITCH_ENDPOINT_ALSA
+	bool "alsa"
+	select BR2_PACKAGE_ALSA_LIB
+
+config BR2_PACKAGE_FREESWITCH_ENDPOINT_RTMP
+	bool "rtmp"
+	help
+	  mod_rtmp is an RTMP (Real time media protocol) endpoint for
+	  FreeSWITCH. The RTMP protocol is primarily used by Flash for
+	  streaming audio, video, and data over the Internet.
+
+	  https://freeswitch.org/confluence/display/FREESWITCH/mod_rtmp
+
+config BR2_PACKAGE_FREESWITCH_ENDPOINT_SOFIA
+	bool "sofia"
+	default y
+	help
+	  mod_sofia is the SIP endpoint implemented by FreeSWITCH.
+
+	  https://freeswitch.org/confluence/display/FREESWITCH/mod_sofia
+
+config BR2_PACKAGE_FREESWITCH_ENDPOINT_VERTO
+	bool "verto"
+	help
+	  Verto (VER-to) RTC is a FreeSWITCH endpoint that implements a
+	  subset of a JSON-RPC connection designed for use over secure
+	  websockets.
+
+	  https://freeswitch.org/confluence/display/FREESWITCH/mod_verto
+
+endmenu # Endpoints
+
+menu "Script Languages"
+
+config BR2_PACKAGE_FREESWITCH_LIBYAML
+	bool "libyaml"
+	select BR2_PACKAGE_LIBYAML
+
+config BR2_PACKAGE_FREESWITCH_LUA
+	bool "lua"
+	depends on BR2_PACKAGE_LUA_5_2
+	help
+	  Lua is the preferred scripting language for custom applications
+	  based on FreeSWITCH.
+
+	  https://freeswitch.org/confluence/display/FREESWITCH/mod_lua
+
+comment "freeswitch needs a Lua 5.2 interpreter"
+	depends on !BR2_PACKAGE_LUA_5_2
+
+config BR2_PACKAGE_FREESWITCH_PYTHON
+	bool "python"
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_PYTHON
+	help
+	  This module allows one to write FreeSWITCH applications using
+	  Python.
+
+	  https://freeswitch.org/confluence/display/FREESWITCH/mod_python
+
+comment "python support needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
+endmenu # Script Languages
+
+endif # BR2_PACKAGE_FREESWITCH
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
new file mode 100644
index 0000000..3534771
--- /dev/null
+++ b/package/freeswitch/freeswitch.mk
@@ -0,0 +1,322 @@
+################################################################################
+#
+# freeswitch
+#
+################################################################################
+
+FREESWITCH_VERSION = 16d600c0350a79c2532c739dd1432f7ed318ea09
+FREESWITCH_SITE = https://freeswitch.org/stash/scm/fs/freeswitch.git
+FREESWITCH_SITE_METHOD = git
+FREESWITCH_LICENSE = MPL v1.1
+FREESWITCH_LICENSE_FILES = docs/COPYING
+
+# required dependencies
+FREESWITCH_DEPENDENCIES = \
+	host-autoconf host-automake host-libtool host-pkgconf \
+	libcurl libjpeg openssl pcre sqlite speex zlib
+
+define FREESWITCH_BOOTSTRAP
+	cd $(@D) && $(TARGET_MAKE_ENV) ./bootstrap.sh
+endef
+FREESWITCH_POST_PATCH_HOOKS += FREESWITCH_BOOTSTRAP
+
+# we neither need host-perl nor host-php
+FREESWITCH_CONF_ENV += \
+	ac_cv_prog_PERL=false \
+	ac_cv_have_perl=no \
+	ac_cv_prog_PHP=false \
+	ac_cv_have_php=no \
+	ac_cv_prog_PHP_CONFIG=false \
+	ac_cv_have_php_config=no
+
+# copied from configure.ac, line 233+
+FREESWITCH_CONF_ENV += \
+	ac_cv_file__dev_ptmx=yes \
+	ac_cv_va_copy=yes \
+	ac_cv_file__dev_urandom=yes \
+	ac_cv_func_realloc_0_nonnull=yes \
+	ac_cv_func_malloc_0_nonnull=yes \
+	ac_cv_func_setpgrp_void=yes \
+	ac_cv_file__dev_zero=yes \
+	apr_cv_tcp_nodelay_with_cork=yes \
+	ac_cv_file_dbd_apr_dbd_mysql_c=no \
+	ac_cv_sizeof_ssize_t=4 \
+	apr_cv_mutex_recursive=yes \
+	ac_cv_func_pthread_rwlock_init=yes \
+	apr_cv_type_rwlock_t=yes \
+	apr_cv_process_shared_works=yes \
+	apr_cv_mutex_robust_shared=yes
+
+FREESWITCH_CONF_OPTS = --without-erlang --enable-fhs
+
+FREESWITCH_ENABLED_MODULES = \
+	applications\/mod_curl \
+	applications\/mod_directory \
+	applications\/mod_esl \
+	applications\/mod_fsk \
+	applications\/mod_lcr \
+	applications\/mod_snom \
+	applications\/mod_spy \
+	loggers\/mod_console \
+	say\/mod_say_de
+
+# amr/amrwb are copyrighted codecs, not included in freeswitch source
+# mod_b64 is a joke:
+# http://lists.freeswitch.org/pipermail/freeswitch-users/2013-April/094377.html
+FREESWITCH_DISABLED_MODULES = \
+	codecs\/mod_amr \
+	codecs\/mod_amrwb \
+	codecs\/mod_b64
+
+# Core features
+
+FREESWITCH_DEPENDENCIES += \
+	$(if $(BR2_PACKAGE_FREESWITCH_FREETYPE),freetype) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBUUID),util-linux) \
+	$(if $(BR2_PACKAGE_FREESWITCH_MYSQL),mysql)
+
+ifeq ($(BR2_PACKAGE_FREESWITCH_LIBEDIT),y)
+FREESWITCH_DEPENDENCIES += libedit
+FREESWITCH_CONF_OPTS += --enable-core-libedit-support
+else
+FREESWITCH_CONF_OPTS += --disable-core-libedit-support
+endif
+
+ifeq ($(BR2_PACKAGE_FREESWITCH_LIBPNG),y)
+FREESWITCH_DEPENDENCIES += libpng
+FREESWITCH_ENABLED_MODULES += formats\/mod_png
+else
+FREESWITCH_DISABLED_MODULES += formats\/mod_png
+endif
+
+ifeq ($(BR2_PACKAGE_FREESWITCH_UNIXODBC),y)
+FREESWITCH_DEPENDENCIES += unixodbc
+FREESWITCH_CONF_OPTS += \
+	--enable-core-odbc-support \
+	--with-odbc=$(STAGING_DIR)/usr
+else
+FREESWITCH_CONF_OPTS += --disable-core-odbc-support
+endif
+
+ifeq ($(BR2_PACKAGE_FREESWITCH_XML_RPC),y)
+FREESWITCH_ENABLED_MODULES += xml_int\/mod_xml_rpc
+else
+FREESWITCH_DISABLED_MODULES += xml_int\/mod_xml_rpc
+endif
+
+ifeq ($(BR2_PACKAGE_FREESWITCH_ZRTP),y)
+FREESWITCH_CONF_OPTS += --enable-zrtp
+else
+FREESWITCH_CONF_OPTS += --disable-zrtp
+endif
+
+# Applications
+
+ifeq ($(BR2_PACKAGE_FREESWITCH_AVMD),y)
+FREESWITCH_ENABLED_MODULES += applications\/mod_avmd
+else
+FREESWITCH_DISABLED_MODULES += applications\/mod_avmd
+endif
+
+ifeq ($(BR2_PACKAGE_FREESWITCH_BLACKLIST),y)
+FREESWITCH_ENABLED_MODULES += applications\/mod_blacklist
+else
+FREESWITCH_DISABLED_MODULES += applications\/mod_blacklist
+endif
+
+ifeq ($(BR2_PACKAGE_FREESWITCH_CALLCENTER),y)
+FREESWITCH_ENABLED_MODULES += applications\/mod_callcenter
+else
+FREESWITCH_DISABLED_MODULES += applications\/mod_callcenter
+endif
+
+ifeq ($(BR2_PACKAGE_FREESWITCH_DPTOOLS),y)
+FREESWITCH_ENABLED_MODULES += applications\/mod_dptools
+else
+FREESWITCH_DISABLED_MODULES += applications\/mod_dptools
+endif
+
+ifeq ($(BR2_PACKAGE_FREESWITCH_ENUM),y)
+FREESWITCH_DEPENDENCIES += libldns
+FREESWITCH_ENABLED_MODULES += applications\/mod_enum
+else
+FREESWITCH_DISABLED_MODULES += applications\/mod_enum
+endif
+
+ifeq ($(BR2_PACKAGE_FREESWITCH_EASYROUTE),y)
+FREESWITCH_ENABLED_MODULES += applications\/mod_easyroute
+else
+FREESWITCH_DISABLED_MODULES += applications\/mod_easyroute
+endif
+
+ifeq ($(BR2_PACKAGE_FREESWITCH_VIDEO),y)
+FREESWITCH_DEPENDENCIES += \
+	ffmpeg \
+	imagemagick \
+	libopenh264 \
+	libvpx \
+	libyuv \
+	vlc
+FREESWITCH_ENABLED_MODULES += \
+	applications\/mod_av \
+	applications\/mod_fsv \
+	formats\/mod_imagick \
+	codecs\/mod_openh264 \
+	formats\/mod_vlc \
+	codecs\/mod_vpx
+else
+FREESWITCH_DISABLED_MODULES += \
+	applications\/mod_av \
+	applications\/mod_fsv \
+	formats\/mod_imagick \
+	codecs\/mod_openh264 \
+	formats\/mod_vlc \
+	codecs\/mod_vpx
+endif
+
+# Audio codecs
+
+ifeq ($(BR2_PACKAGE_FREESWITCH_AUDIO_BROADVOICE),y)
+FREESWITCH_DEPENDENCIES += libbroadvoice
+FREESWITCH_ENABLED_MODULES += codecs\/mod_bv
+else
+FREESWITCH_DISABLED_MODULES += codecs\/mod_bv
+endif
+
+ifeq ($(BR2_PACKAGE_FREESWITCH_AUDIO_CODEC2),y)
+FREESWITCH_DEPENDENCIES += libcodec2
+FREESWITCH_ENABLED_MODULES += codecs\/mod_codec2
+else
+FREESWITCH_DISABLED_MODULES += codecs\/mod_codec2
+endif
+
+ifeq ($(BR2_PACKAGE_FREESWITCH_AUDIO_G7221),y)
+FREESWITCH_DEPENDENCIES += libg7221
+endif
+
+ifeq ($(BR2_PACKAGE_FREESWITCH_AUDIO_ILBC),y)
+FREESWITCH_DEPENDENCIES += libilbc
+FREESWITCH_ENABLED_MODULES += codecs\/mod_ilbc
+else
+FREESWITCH_DISABLED_MODULES += codecs\/mod_ilbc
+endif
+
+ifeq ($(BR2_PACKAGE_FREESWITCH_AUDIO_ISAC),y)
+FREESWITCH_ENABLED_MODULES += codecs\/mod_isac
+else
+FREESWITCH_DISABLED_MODULES += codecs\/mod_isac
+endif
+
+ifeq ($(BR2_PACKAGE_FREESWITCH_AUDIO_OPUS),y)
+FREESWITCH_DEPENDENCIES += opus
+FREESWITCH_ENABLED_MODULES += codecs\/mod_opus
+else
+FREESWITCH_DISABLED_MODULES += codecs\/mod_opus
+endif
+
+ifeq ($(BR2_PACKAGE_FREESWITCH_AUDIO_PORTAUDIO),y)
+FREESWITCH_DEPENDENCIES += portaudio
+FREESWITCH_ENABLED_MODULES += codecs\/mod_portaudio
+else
+FREESWITCH_DISABLED_MODULES += codecs\/mod_portaudio
+endif
+
+ifeq ($(BR2_PACKAGE_FREESWITCH_AUDIO_SILK),y)
+FREESWITCH_DEPENDENCIES += libsilk
+FREESWITCH_ENABLED_MODULES += codecs\/mod_silk
+else
+FREESWITCH_DISABLED_MODULES += codecs\/mod_silk
+endif
+
+ifeq ($(BR2_PACKAGE_FREESWITCH_AUDIO_SNDFILE),y)
+FREESWITCH_DEPENDENCIES += libsndfile
+FREESWITCH_ENABLED_MODULES += formats\/mod_sndfile
+else
+FREESWITCH_DISABLED_MODULES += formats\/mod_sndfile
+endif
+
+ifeq ($(BR2_PACKAGE_FREESWITCH_AUDIO_SOUNDTOUCH),y)
+FREESWITCH_DEPENDENCIES += libsoundtouch
+FREESWITCH_ENABLED_MODULES += applications\/mod_soundtouch
+else
+FREESWITCH_DISABLED_MODULES += applications\/mod_soundtouch
+endif
+
+# Endpoints
+
+ifeq ($(BR2_PACKAGE_FREESWITCH_ENDPOINT_ALSA),y)
+FREESWITCH_DEPENDENCIES += alsa-lib
+FREESWITCH_ENABLED_MODULES += endpoints\/mod_alsa
+else
+FREESWITCH_DISABLED_MODULES += endpoints\/mod_alsa
+endif
+
+ifeq ($(BR2_PACKAGE_FREESWITCH_ENDPOINT_RTMP),y)
+FREESWITCH_ENABLED_MODULES += endpoints\/mod_rtmp
+else
+FREESWITCH_DISABLED_MODULES += endpoints\/mod_rtmp
+endif
+
+ifeq ($(BR2_PACKAGE_FREESWITCH_ENDPOINT_SOFIA),y)
+FREESWITCH_ENABLED_MODULES += endpoints\/mod_sofia
+else
+FREESWITCH_DISABLED_MODULES += endpoints\/mod_sofia
+endif
+
+ifeq ($(BR2_PACKAGE_FREESWITCH_ENDPOINT_VERTO),y)
+FREESWITCH_ENABLED_MODULES += endpoints\/mod_rtc endpoints\/mod_verto
+else
+FREESWITCH_DISABLED_MODULES += endpoints\/mod_rtc endpoints\/mod_verto
+endif
+
+# Script Languages
+
+ifeq ($(BR2_PACKAGE_FREESWITCH_LIBYAML),y)
+FREESWITCH_DEPENDENCIES += libyaml
+FREESWITCH_ENABLED_MODULES += languages\/mod_yaml
+else
+FREESWITCH_DISABLED_MODULES += languages\/mod_yaml
+endif
+
+ifeq ($(BR2_PACKAGE_FREESWITCH_LUA),y)
+FREESWITCH_DEPENDENCIES += lua
+FREESWITCH_ENABLED_MODULES += languages\/mod_lua
+else
+FREESWITCH_DISABLED_MODULES += languages\/mod_lua
+endif
+
+ifeq ($(BR2_PACKAGE_FREESWITCH_PYTHON),y)
+FREESWITCH_DEPENDENCIES += python
+FREESWITCH_CONF_OPTS += --with-python
+FREESWITCH_ENABLED_MODULES += languages\/mod_python
+else
+FREESWITCH_CONF_OPTS += --without-python
+FREESWITCH_DISABLED_MODULES += languages\/mod_python
+endif
+
+# Setup modules.conf
+
+define FREESWITCH_ENABLE_OPT # (option, file)
+	$(SED) "/\\<$(1)\\>/d" $(2)
+	echo '$(1)' | sed 's/\\//' >> $(2)
+endef
+
+define FREESWITCH_DISABLE_OPT # (option, file)
+	$(SED) "/\\<$(1)\\>/d" $(2)
+endef
+
+define FREESWITCH_ENABLE_MODULES
+	$(foreach mod,$(FREESWITCH_ENABLED_MODULES),\
+		$(call FREESWITCH_ENABLE_OPT,$(mod),$(@D)/modules.conf)$(sep))
+endef
+
+FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_ENABLE_MODULES
+
+define FREESWITCH_DISABLE_MODULES
+	$(foreach mod,$(FREESWITCH_DISABLED_MODULES),\
+		$(call FREESWITCH_DISABLE_OPT,$(mod),$(@D)/modules.conf)$(sep))
+endef
+
+FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_DISABLE_MODULES
+
+$(eval $(autotools-package))
-- 
2.1.4
