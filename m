From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 Feb 2016 16:26:51 +0100
Subject: [Buildroot] [PATCH/next v9 01/28] package/freeswitch: new package
In-Reply-To: <1456586838-21197-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456586838-21197-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456586838-21197-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds freeswitch without any configured modules and with a
minimal set of non-optional dependencies. All other dependencies and
modules will be added by further patches in this series.

PLease note that freeswitch source repo bundles some libraries which are
also available as buildroot packages. The freeswitch build system does
not allow to use system libraries in these cases:

apr, apr-util, libsrtp, sofia-sip, tiff

The reason are patches to these packages by the freeswitch project which
are not yet upstream. There is an open JIRA report for this situation:
https://freeswitch.org/jira/si/jira.issueviews:issue-html/FS-353/FS-353.html

More historic infos can be found here:
http://article.gmane.org/gmane.comp.telephony.freeswitch.devel/2715
https://freeswitch.org/the-missing-link/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                                  |  1 +
 package/freeswitch/0001-jpeg.patch                 | 31 ++++++++
 package/freeswitch/0002-zrtp.patch                 | 33 +++++++++
 ...olve-Missing-MEMMOVE-macro-in-spandsp-aut.patch | 71 ++++++++++++++++++
 package/freeswitch/Config.in                       | 24 ++++++
 package/freeswitch/freeswitch.hash                 |  2 +
 package/freeswitch/freeswitch.mk                   | 85 ++++++++++++++++++++++
 7 files changed, 247 insertions(+)
 create mode 100644 package/freeswitch/0001-jpeg.patch
 create mode 100644 package/freeswitch/0002-zrtp.patch
 create mode 100644 package/freeswitch/0003-FS-8736-resolve-Missing-MEMMOVE-macro-in-spandsp-aut.patch
 create mode 100644 package/freeswitch/Config.in
 create mode 100644 package/freeswitch/freeswitch.hash
 create mode 100644 package/freeswitch/freeswitch.mk

diff --git a/package/Config.in b/package/Config.in
index 67a2514..d26e7ba 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1361,6 +1361,7 @@ endif
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
diff --git a/package/freeswitch/0003-FS-8736-resolve-Missing-MEMMOVE-macro-in-spandsp-aut.patch b/package/freeswitch/0003-FS-8736-resolve-Missing-MEMMOVE-macro-in-spandsp-aut.patch
new file mode 100644
index 0000000..88cb390
--- /dev/null
+++ b/package/freeswitch/0003-FS-8736-resolve-Missing-MEMMOVE-macro-in-spandsp-aut.patch
@@ -0,0 +1,71 @@
+From 10df60039322b3903e62b001971c195d5ce48943 Mon Sep 17 00:00:00 2001
+From: Anthony Minessale <anthm@freeswitch.org>
+Date: Fri, 15 Jan 2016 13:14:07 -0600
+Subject: [PATCH 05/99] FS-8736 #resolve [Missing MEMMOVE macro in spandsp
+ autoconf]
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[backported commit from upstream master branch:
+ https://freeswitch.org/stash/projects/FS/repos/freeswitch/commits/10df60039322b3903e62b001971c195d5ce48943]
+---
+ libs/spandsp/configure.ac  |  2 ++
+ libs/spandsp/m4/memmove.m4 | 27 +++++++++++++++++++++++++++
+ 2 files changed, 29 insertions(+)
+ create mode 100644 libs/spandsp/m4/memmove.m4
+
+diff --git a/libs/spandsp/configure.ac b/libs/spandsp/configure.ac
+index 16d6d24..4ec8952 100644
+--- a/libs/spandsp/configure.ac
++++ b/libs/spandsp/configure.ac
+@@ -37,6 +37,7 @@ m4_include(m4/ax_c99_features.m4)
+ m4_include(m4/ax_check_export_capability.m4)
+ m4_include(m4/ax_check_arm_neon.m4)
+ m4_include(m4/ax_func_aligned_alloc.m4)
++m4_include(m4/memmove.m4)
+ 
+ AC_CONFIG_SRCDIR([src/tone_generate.c])
+ AC_CONFIG_AUX_DIR([config])
+@@ -152,6 +153,7 @@ AC_FUNC_ERROR_AT_LINE
+ AC_FUNC_VPRINTF
+ AC_FUNC_MEMCMP
+ AC_FUNC_MEMMOVE
++
+ if test "${ax_cv_c_compiler_vendor}" = "gnu"
+   then
+     AC_FUNC_REALLOC
+diff --git a/libs/spandsp/m4/memmove.m4 b/libs/spandsp/m4/memmove.m4
+new file mode 100644
+index 0000000..f2301a0
+--- /dev/null
++++ b/libs/spandsp/m4/memmove.m4
+@@ -0,0 +1,27 @@
++AC_DEFUN([AC_FUNC_MEMMOVE],
++[AC_CHECK_FUNCS(memmove)
++AC_MSG_CHECKING(for working memmove)
++AC_CACHE_VAL(ac_cv_have_working_memmove,
++[AC_TRY_RUN(
++[#include <stdio.h>
++
++int main(void)
++{
++    char buf[10];
++    strcpy (buf, "01234567");
++    memmove (buf, buf + 2, 3);
++    if (strcmp (buf, "23434567"))
++        exit (1);
++    strcpy (buf, "01234567");
++    memmove (buf + 2, buf, 3);
++    if (strcmp (buf, "01012567"))
++        exit (1);
++    exit (0);
++}], ac_cv_have_working_memmove=yes, ac_cv_have_working_memmove=no, ac_cv_have_working_memmove=cross)])
++AC_MSG_RESULT([$ac_cv_have_working_memmove])
++if test x$ac_cv_have_working_memmove != "xyes"; then
++  AC_LIBOBJ(memmove)
++  AC_MSG_WARN([Replacing missing/broken memmove.])
++  AC_DEFINE(PREFER_PORTABLE_MEMMOVE, 1, "enable replacement memmove if system memmove is broken or missing")
++fi])
++
+-- 
+2.7.0
+
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
index 0000000..3c527fe
--- /dev/null
+++ b/package/freeswitch/freeswitch.mk
@@ -0,0 +1,85 @@
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
+# remove an unneeded script which scans /usr/lib/freeswitch/mod
+define FREESWITCH_REMOVE_MODCHECK
+	$(SED) "/modcheck.sh/d" $(@D)/build/Makefile.am
+endef
+FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_REMOVE_MODCHECK
+
+# autoreconf now is necessary to avoid broken autoreconf after configure
+# we also patch configure.ac twice
+define FREESWITCH_BOOTSTRAP
+	cd $(@D) && $(TARGET_MAKE_ENV) ./rebootstrap.sh
+endef
+FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_BOOTSTRAP
+
+# freeswitch comes with pre-enabled modules, since we want to control
+# the modules ourselves reset the upstream configuration
+define FREESWITCH_RESET_MODULES
+	> $(@D)/modules.conf
+endef
+FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_RESET_MODULES
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
