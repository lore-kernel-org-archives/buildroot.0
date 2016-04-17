From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Apr 2016 17:24:23 +0200
Subject: [Buildroot] [PATCH v15 01/27] package/freeswitch: new package
In-Reply-To: <1460906689-29900-1-git-send-email-bernd.kuhls@t-online.de>
References: <1460906689-29900-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1460906689-29900-2-git-send-email-bernd.kuhls@t-online.de>
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

apr, apr-util, libsrtp, libvpx, libyuv, sofia-sip, tiff

The reason are patches to these packages by the freeswitch project which
are not yet upstream. There is an open JIRA report for this situation:
https://freeswitch.org/jira/si/jira.issueviews:issue-html/FS-353/FS-353.html

More historic infos can be found here:
http://article.gmane.org/gmane.comp.telephony.freeswitch.devel/2715
https://freeswitch.org/the-missing-link/

In the 1.6.7 version bump libvpx & libyuv were also moved in-tree:
https://freeswitch.org/stash/projects/FS/repos/freeswitch/commits/febe0f8dacea2d2a31902b3dc469be757f8c3c4d
https://freeswitch.org/stash/projects/FS/repos/freeswitch/commits/44da905b4f6b3b35e94b4948fb70dec7b5071ded

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                  |  1 +
 package/freeswitch/0001-zrtp.patch | 33 +++++++++++++
 package/freeswitch/Config.in       | 27 +++++++++++
 package/freeswitch/freeswitch.hash |  2 +
 package/freeswitch/freeswitch.mk   | 97 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 160 insertions(+)
 create mode 100644 package/freeswitch/0001-zrtp.patch
 create mode 100644 package/freeswitch/Config.in
 create mode 100644 package/freeswitch/freeswitch.hash
 create mode 100644 package/freeswitch/freeswitch.mk

diff --git a/package/Config.in b/package/Config.in
index bcfe13b..3ed5d1d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1381,6 +1381,7 @@ endif
 	source "package/fcgiwrap/Config.in"
 	source "package/fmc/Config.in"
 	source "package/fping/Config.in"
+	source "package/freeswitch/Config.in"
 	source "package/gesftpserver/Config.in"
 	source "package/gutenprint/Config.in"
 	source "package/hans/Config.in"
diff --git a/package/freeswitch/0001-zrtp.patch b/package/freeswitch/0001-zrtp.patch
new file mode 100644
index 0000000..c1cdeed
--- /dev/null
+++ b/package/freeswitch/0001-zrtp.patch
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
index 0000000..3824a09
--- /dev/null
+++ b/package/freeswitch/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_FREESWITCH
+	bool "freeswitch"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # apr, included in freeswitch source
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # apr, included in freeswitch source
+	depends on BR2_USE_WCHAR # libuuid
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_SPEEX
+	select BR2_PACKAGE_SQLITE
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
+comment "freeswitch needs a toolchain w/ C++, dynamic library, threads, wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
new file mode 100644
index 0000000..31915cd
--- /dev/null
+++ b/package/freeswitch/freeswitch.hash
@@ -0,0 +1,2 @@
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.7.tar.xz.sha256
+sha256	9c7ca2d39985fdc39659054179465540e926880f032f855c0df74d6eec41a794	freeswitch-1.6.7.tar.xz
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
new file mode 100644
index 0000000..4b9e956
--- /dev/null
+++ b/package/freeswitch/freeswitch.mk
@@ -0,0 +1,97 @@
+################################################################################
+#
+# freeswitch
+#
+################################################################################
+
+FREESWITCH_VERSION = 1.6.7
+FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
+FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
+FREESWITCH_LICENSE = MPLv1.1, \
+	GPLv3+ with font exception (fonts), \
+	Apache-2.0 (apr, apr-util) \
+	LGPLv2+ (sofia-sip), \
+	LGPLv2.1, GPLv2 (spandsp), \
+	BSD-3c (libsrtp), \
+	tiff license
+
+FREESWITCH_LICENSE_FILES = \
+	COPYING \
+	libs/apr/LICENSE \
+	libs/apr-util/LICENSE \
+	libs/sofia-sip/COPYING \
+	libs/sofia-sip/COPYRIGHTS \
+	libs/spandsp/COPYING \
+	libs/srtp/LICENSE \
+	libs/tiff-4.0.2/COPYRIGHT
+
+# required dependencies
+FREESWITCH_DEPENDENCIES = \
+	host-pkgconf \
+	jpeg \
+	libcurl \
+	openssl \
+	pcre \
+	speex \
+	sqlite \
+	util-linux \
+	zlib
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
+	--disable-libvpx \
+	--disable-libyuv \
+	--without-erlang \
+	--enable-fhs \
+	--without-python \
+	--disable-system-xmlrpc-c
+
+# zrtp supports a limited set of archs, sparc support is also broken due
+# to a broken ld call by gcc, see libs/libzrtp/include/zrtp_config.h
+ifeq ($(BR2_i386)$(BR2_arm)$(BR2_armeb)$(BR2_aarch64)$(BR2_aarch64_be)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpcle)$(BR2_x86_64),y)
+FREESWITCH_LICENSE_FILES += libs/libzrtp/src/zrtp_legal.c
+FREESWITCH_CONF_OPTS += --enable-zrtp
+else
+FREESWITCH_CONF_OPTS += --disable-zrtp
+endif
+
+$(eval $(autotools-package))
-- 
2.8.0.rc3
