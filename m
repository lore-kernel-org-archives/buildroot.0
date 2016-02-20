From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 23:23:01 +0100
Subject: [Buildroot] [PATCH v8 01/28] package/freeswitch: new package
In-Reply-To: <1456007008-5200-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456007008-5200-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456007008-5200-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds freeswitch without any configured modules and with a
minimal set of non-optional dependencies. All other dependencies and
modules will be added by further patches in this series.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                  |  1 +
 package/freeswitch/0001-jpeg.patch | 31 +++++++++++++
 package/freeswitch/0002-zrtp.patch | 33 ++++++++++++++
 package/freeswitch/Config.in       | 24 ++++++++++
 package/freeswitch/freeswitch.hash |  2 +
 package/freeswitch/freeswitch.mk   | 89 ++++++++++++++++++++++++++++++++++++++
 6 files changed, 180 insertions(+)
 create mode 100644 package/freeswitch/0001-jpeg.patch
 create mode 100644 package/freeswitch/0002-zrtp.patch
 create mode 100644 package/freeswitch/Config.in
 create mode 100644 package/freeswitch/freeswitch.hash
 create mode 100644 package/freeswitch/freeswitch.mk

diff --git a/package/Config.in b/package/Config.in
index 422978f..28f3b60 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1355,6 +1355,7 @@ endif
 	source "package/fmc/Config.in"
 	source "package/foomatic-filters/Config.in"
 	source "package/fping/Config.in"
+	source "package/freeswitch/Config.in"
 	source "package/gesftpserver/Config.in"
 	source "package/gutenprint/Config.in"
 	source "package/hans/Config.in"
diff --git a/package/freeswitch/0001-jpeg.patch b/package/freeswitch/0001-jpeg.patch
new file mode 100644
index 0000000..8fc3052
--- /dev/null
+++ b/package/freeswitch/0001-jpeg.patch
@@ -0,0 +1,31 @@
+Fix jpeg detection
+
+libyuv has an optional jpeg dependency, freeswitch configure misses -ljpeg
+when searching for libyuv and therefore assumes libyuv is missing. When
+freeswitch first searches for libjpeg, -ljpeg will be added to
+PKG_CHECK_MODULES([YUV].
+
+Patch sent upstream: https://freeswitch.org/jira/browse/FS-8745
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
diff --git a/package/freeswitch/0002-zrtp.patch b/package/freeswitch/0002-zrtp.patch
new file mode 100644
index 0000000..c1cdeed
--- /dev/null
+++ b/package/freeswitch/0002-zrtp.patch
@@ -0,0 +1,33 @@
+Fix PowerPC detection (needs __linux__) and add aarch64 support.
+
+Patch sent upstream: https://freeswitch.org/jira/browse/FS-8746
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr freeswitch-1.6.6.org/libs/libzrtp/include/zrtp_config.h freeswitch-1.6.6/libs/libzrtp/include/zrtp_config.h
+--- freeswitch-1.6.6.org/libs/libzrtp/include/zrtp_config.h	2016-01-12 17:32:36.000000000 +0100
++++ freeswitch-1.6.6/libs/libzrtp/include/zrtp_config.h	2016-01-16 14:09:17.830860603 +0100
+@@ -21,7 +21,7 @@
+ #		define ZRTP_PLATFORM ZP_ANDROID
+ #	elif defined(__FreeBSD__)
+ #		define ZRTP_PLATFORM ZP_BSD
+-#	elif defined(linux) || defined(__linux)
++#	elif defined(linux) || defined(__linux__)
+ #		include <linux/version.h>
+ #		define ZRTP_PLATFORM ZP_LINUX
+ #	elif defined(__MACOSX__) || defined (__APPLE__) || defined (__MACH__)
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
index 0000000..b52d469
--- /dev/null
+++ b/package/freeswitch/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_FREESWITCH
+	bool "freeswitch"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # apr, included in freeswitch source
+	depends on !BR2_STATIC_LIBS # apr, included in freeswitch source
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_SPEEX
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_ZLIB
+	help
+	  FreeSWITCH is a scalable open source cross-platform telephony
+	  platform designed to route and interconnect popular communication
+	  protocols using audio, video, text or any other form of media.
+
+	  https://www.freeswitch.org
+
+comment "freeswitch needs a toolchain w/ C++, dynamic library, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_STATIC_LIBS
diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
new file mode 100644
index 0000000..ebee17f
--- /dev/null
+++ b/package/freeswitch/freeswitch.hash
@@ -0,0 +1,2 @@
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.6.tar.xz.sha256
+sha256	397b9c63c2c1f7008a2cc269f2e0e9a935d862b3fb074a6044819bcaea02ebc0	freeswitch-1.6.6.tar.xz
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
new file mode 100644
index 0000000..ba3f2e9
--- /dev/null
+++ b/package/freeswitch/freeswitch.mk
@@ -0,0 +1,89 @@
+################################################################################
+#
+# freeswitch
+#
+################################################################################
+
+FREESWITCH_VERSION = 1.6.6
+FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
+FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
+FREESWITCH_LICENSE = MPL v1.1
+FREESWITCH_LICENSE_FILES = COPYING
+
+# required dependencies
+FREESWITCH_DEPENDENCIES = \
+	host-autoconf host-automake host-libtool host-pkgconf jpeg \
+	libcurl openssl pcre speex sqlite zlib
+
+# needed after
+# https://freeswitch.org/stash/projects/FS/repos/freeswitch/commits/c74237ad3cbd1974ae70f1a8d0d5d2cfe4d7b446
+FREESWITCH_DEPENDENCIES += host-autoconf-archive
+define FREESWITCH_NEEDS_MEMMOVE_M4
+	ln -sfv \
+		$(HOST_DIR)/usr/share/autoconf-archive/ax_func_memmove.m4 \
+		$(@D)/libs/spandsp/m4/ax_func_memmove.m4
+endef
+FREESWITCH_POST_PATCH_HOOKS += FREESWITCH_NEEDS_MEMMOVE_M4
+
+# autoreconf now is necessary to avoid broken autoreconf after configure
+# we also patch configure.ac twice
+define FREESWITCH_BOOTSTRAP
+	cd $(@D) && $(TARGET_MAKE_ENV) ./rebootstrap.sh
+endef
+FREESWITCH_POST_PATCH_HOOKS += FREESWITCH_BOOTSTRAP
+
+# freeswitch comes with pre-enabled modules, since we want to control
+# the modules ourselves reset the upstream configuration
+define FREESWITCH_RESET_MODULES
+	> $(@D)/modules.conf
+endef
+FREESWITCH_POST_PATCH_HOOKS += FREESWITCH_RESET_MODULES
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
+# copied from freeswitch/configure.ac, line 258+
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
+# build breaks with -Werror enabled
+FREESWITCH_CONF_ENV += \
+	ac_cv_gcc_supports_w_no_unused_result=no
+
+FREESWITCH_CONF_OPTS = \
+	--disable-core-libedit-support \
+	--disable-core-odbc-support \
+	--without-erlang \
+	--enable-fhs \
+	--without-python \
+	--disable-system-xmlrpc-c
+
+# zrtp supports a limited set of archs, sparc support is also broken due
+# to a broken ld call by gcc, see libs/libzrtp/include/zrtp_config.h
+ifeq ($(BR2_i386)$(BR2_arm)$(BR2_armeb)$(BR2_aarch64)$(BR2_aarch64_be)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpcle)$(BR2_x86_64),y)
+FREESWITCH_CONF_OPTS += --enable-zrtp
+else
+FREESWITCH_CONF_OPTS += --disable-zrtp
+endif
+
+$(eval $(autotools-package))
-- 
2.7.0
