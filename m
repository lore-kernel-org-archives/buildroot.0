From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Jan 2016 21:59:17 +0100
Subject: [Buildroot] [PATCH v5 01/29] package/freeswitch: new package
In-Reply-To: <1452459585-7085-1-git-send-email-bernd.kuhls@t-online.de>
References: <1452459585-7085-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1452459585-7085-2-git-send-email-bernd.kuhls@t-online.de>
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
 package/Config.in                       |  1 +
 package/freeswitch/0001-cross_git.patch | 17 +++++++++
 package/freeswitch/0002-jpeg.patch      | 29 ++++++++++++++
 package/freeswitch/Config.in            | 28 ++++++++++++++
 package/freeswitch/freeswitch.hash      |  2 +
 package/freeswitch/freeswitch.mk        | 68 +++++++++++++++++++++++++++++++++
 6 files changed, 145 insertions(+)
 create mode 100644 package/freeswitch/0001-cross_git.patch
 create mode 100644 package/freeswitch/0002-jpeg.patch
 create mode 100644 package/freeswitch/Config.in
 create mode 100644 package/freeswitch/freeswitch.hash
 create mode 100644 package/freeswitch/freeswitch.mk

diff --git a/package/Config.in b/package/Config.in
index 442021f..c4643d8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1322,6 +1322,7 @@ endif
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
index 0000000..fc38409
--- /dev/null
+++ b/package/freeswitch/0002-jpeg.patch
@@ -0,0 +1,29 @@
+Fix jpeg detection
+
+libyuv has an optional jpeg dependency, freeswitch configure misses -ljpeg
+when searching for libyuv and therefore assumes libyuv is missing. When
+freeswitch first searches for libjpeg, -ljpeg will be added to
+PKG_CHECK_MODULES([YUV].
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
index 0000000..f5c4fbe
--- /dev/null
+++ b/package/freeswitch/Config.in
@@ -0,0 +1,28 @@
+comment "freeswitch needs a toolchain w/ C++, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+
+config BR2_PACKAGE_FREESWITCH
+	bool "freeswitch"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # apr, included in freeswitch source
+	depends on !BR2_STATIC_LIBS # apr, included in freeswitch source
+	# Triggers the _gp link issue in nios2
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBJPEG
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
diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
new file mode 100644
index 0000000..2d1de1c
--- /dev/null
+++ b/package/freeswitch/freeswitch.hash
@@ -0,0 +1,2 @@
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.5.tar.xz.sha256
+sha256	52f3a8fa1dc760908472fa28c5cd6e35d7143274160d60a555b08f7f18f41430	freeswitch-1.6.5.tar.xz
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
new file mode 100644
index 0000000..bf6035d
--- /dev/null
+++ b/package/freeswitch/freeswitch.mk
@@ -0,0 +1,68 @@
+################################################################################
+#
+# freeswitch
+#
+################################################################################
+
+FREESWITCH_VERSION = 1.6.5
+FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
+FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
+FREESWITCH_LICENSE = MPL v1.1
+FREESWITCH_LICENSE_FILES = COPYING
+
+# required dependencies
+FREESWITCH_DEPENDENCIES = \
+	host-autoconf host-automake host-libtool host-pkgconf \
+	libcurl libjpeg openssl pcre speex sqlite zlib
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
+FREESWITCH_CONF_OPTS = \
+	--disable-core-libedit-support \
+	--disable-core-odbc-support \
+	--without-erlang \
+	--enable-fhs \
+	--without-python \
+	--disable-system-xmlrpc-c \
+	--disable-zrtp
+
+$(eval $(autotools-package))
-- 
2.6.4
