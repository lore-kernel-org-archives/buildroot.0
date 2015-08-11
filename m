From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 11 Aug 2015 20:16:55 +0200
Subject: [Buildroot] [PATCH/next 10/10] package/freeswitch: new package
In-Reply-To: <1439317015-8031-1-git-send-email-bernd.kuhls@t-online.de>
References: <1439317015-8031-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1439317015-8031-11-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                       |   1 +
 package/freeswitch/0001-cross_git.patch |  11 +++
 package/freeswitch/0002-jpeg.patch      |  24 ++++++
 package/freeswitch/Config.in            |  58 ++++++++++++++
 package/freeswitch/freeswitch.mk        | 133 ++++++++++++++++++++++++++++++++
 5 files changed, 227 insertions(+)
 create mode 100644 package/freeswitch/0001-cross_git.patch
 create mode 100644 package/freeswitch/0002-jpeg.patch
 create mode 100644 package/freeswitch/Config.in
 create mode 100644 package/freeswitch/freeswitch.mk

diff --git a/package/Config.in b/package/Config.in
index 627c5b1..ac10e84 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1223,6 +1223,7 @@ endif
 	source "package/fmc/Config.in"
 	source "package/foomatic-filters/Config.in"
 	source "package/fping/Config.in"
+	source "package/freeswitch/Config.in"
 	source "package/gesftpserver/Config.in"
 	source "package/gutenprint/Config.in"
 	source "package/hans/Config.in"
diff --git a/package/freeswitch/0001-cross_git.patch b/package/freeswitch/0001-cross_git.patch
new file mode 100644
index 0000000..3ef1be7
--- /dev/null
+++ b/package/freeswitch/0001-cross_git.patch
@@ -0,0 +1,11 @@
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
diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
new file mode 100644
index 0000000..35aa5f9
--- /dev/null
+++ b/package/freeswitch/Config.in
@@ -0,0 +1,58 @@
+config BR2_PACKAGE_FREESWITCH
+	bool "freeswitch"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # apr, included in freeswitch source
+	depends on BR2_USE_WCHAR # util-linux
+	depends on !BR2_STATIC_LIBS # apr, included in freeswitch source
+	depends on !BR2_aarch64
+	# Triggers the _gp link issue in nios2
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	select BR2_PACKAGE_LIBBROADVOICE
+	select BR2_PACKAGE_LIBCODEC2
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_FFMPEG_AVRESAMPLE
+	select BR2_PACKAGE_FFMPEG_SWSCALE
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_IMAGEMAGICK
+	select BR2_PACKAGE_LIBBROADVOICE
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBEDIT
+	select BR2_PACKAGE_LIBG7221
+	select BR2_PACKAGE_LIBILBC
+	select BR2_PACKAGE_LIBJPEG
+	select BR2_PACKAGE_LIBLDNS
+	select BR2_PACKAGE_LIBOPENH264 if BR2_PACKAGE_LIBOPENH264_ARCH_SUPPORTS
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_LIBSILK
+	select BR2_PACKAGE_LIBSNDFILE
+	select BR2_PACKAGE_LIBSOUNDTOUCH
+	select BR2_PACKAGE_LIBVPX
+	select BR2_PACKAGE_LIBYAML
+	select BR2_PACKAGE_LIBYUV
+	select BR2_PACKAGE_LUA
+	select BR2_PACKAGE_OPENCV
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPUS
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PORTAUDIO
+	select BR2_PACKAGE_SPEEX
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_UNIXODBC
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_ZLIB
+	help
+	  FreeSWITCH is a scalable open source cross-platform telephony
+	  platform designed to route and interconnect popular communication
+	  protocols using audio, video, text or any other form of media.
+
+	  https://www.freeswitch.org
+
+comment "freeswitch needs a toolchain w/ C++, wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	depends on !BR2_aarch64
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
new file mode 100644
index 0000000..cb6e881
--- /dev/null
+++ b/package/freeswitch/freeswitch.mk
@@ -0,0 +1,133 @@
+################################################################################
+#
+# freeswitch
+#
+################################################################################
+
+FREESWITCH_VERSION = 7cf1238137d8876a1a34d28a54d60d328c44d895
+FREESWITCH_SITE = https://freeswitch.org/stash/scm/fs/freeswitch.git
+FREESWITCH_SITE_METHOD = git
+FREESWITCH_LICENSE = MPL v1.1
+FREESWITCH_LICENSE_FILES = COPYING
+
+FREESWITCH_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_ALSA_LIB),alsa-lib) \
+	ffmpeg \
+	freetype \
+	host-pkgconf \
+	imagemagick \
+	libbroadvoice \
+	libcodec2 \
+	libcurl \
+	libedit \
+	libg7221 \
+	libilbc \
+	libjpeg \
+	libldns \
+	libopenh264 \
+	libpng \
+	libsilk \
+	libsndfile \
+	libsoundtouch \
+	libvpx \
+	libyaml \
+	libyuv \
+	lua \
+	$(if $(BR2_PACKAGE_MYSQL),mysql) \
+	opencv \
+	openssl \
+	opus \
+	pcre \
+	portaudio \
+	speex \
+	sqlite \
+	unixodbc \
+	util-linux \
+	zlib
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+FREESWITCH_DEPENDENCIES += python
+else
+FREESWITCH_CONF_OPTS += --without-python
+endif
+
+define FREESWITCH_BOOTSTRAP
+	cd $(@D) && $(TARGET_MAKE_ENV) ./bootstrap.sh
+endef
+FREESWITCH_POST_PATCH_HOOKS += FREESWITCH_BOOTSTRAP
+
+# Deactivate a module. Has no effect if it does not exits.
+define freeswitch-module-deactivate # module-name
+	$(SED) '/$1/s/^/#/' $(@D)/modules.conf
+endef
+
+# Activate a module. Has no effect if it does not exits.
+define freeswitch-module-activate # module-name
+	$(SED) '/$1/s/^#//' $(@D)/modules.conf
+endef
+
+define FREESWITCH_ENABLE_MODULES
+	$(call freeswitch-module-activate,mod_av)
+	$(call freeswitch-module-activate,mod_avmd)
+	$(call freeswitch-module-activate,mod_blacklist)
+	$(call freeswitch-module-activate,mod_bv)
+	$(call freeswitch-module-activate,mod_callcenter)
+	$(call freeswitch-module-activate,mod_cidlookup)
+	$(call freeswitch-module-activate,mod_codec2)
+	$(call freeswitch-module-activate,mod_curl)
+	$(call freeswitch-module-activate,mod_directory)
+	$(call freeswitch-module-activate,mod_easyroute)
+	$(call freeswitch-module-activate,mod_esl)
+	$(call freeswitch-module-activate,mod_fsk)
+	$(call freeswitch-module-activate,mod_ilbc)
+	$(call freeswitch-module-activate,mod_imagick)
+	$(call freeswitch-module-activate,mod_isac)
+	$(call freeswitch-module-activate,mod_lcr)
+	$(call freeswitch-module-activate,mod_portaudio)
+	$(call freeswitch-module-activate,mod_rtc)
+	$(call freeswitch-module-activate,mod_say_de)
+	$(call freeswitch-module-activate,mod_silk)
+	$(call freeswitch-module-activate,mod_snom)
+	$(call freeswitch-module-activate,mod_soundtouch)
+	$(call freeswitch-module-activate,mod_spy)
+	$(call freeswitch-module-activate,mod_stress)
+	$(call freeswitch-module-activate,mod_verto)
+	$(call freeswitch-module-activate,mod_vpx)
+	echo "codecs/mod_openh264" >> $(@D)/modules.conf
+endef
+FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_ENABLE_MODULES
+
+FREESWITCH_CONF_OPTS += \
+	--without-erlang \
+	--enable-fhs \
+	--with-odbc=$(STAGING_DIR)/usr \
+	--enable-zrtp
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
+$(eval $(autotools-package))
-- 
2.1.4
