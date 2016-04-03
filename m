From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  3 Apr 2016 16:18:13 +0200
Subject: [Buildroot] [PATCH v11 01/26] package/freeswitch: new package
In-Reply-To: <1459693118-19072-1-git-send-email-bernd.kuhls@t-online.de>
References: <1459693118-19072-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1459693118-19072-2-git-send-email-bernd.kuhls@t-online.de>
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
 package/Config.in                                  |  1 +
 package/freeswitch/0001-zrtp.patch                 | 33 +++++++++
 .../0002-Makefile.am-fs_cli-needs-libzrtp.a.patch  | 41 +++++++++++
 ...ile.am-modcheck.sh-is-superfluous-when-cr.patch | 26 +++++++
 package/freeswitch/Config.in                       | 24 +++++++
 package/freeswitch/freeswitch.hash                 |  2 +
 package/freeswitch/freeswitch.mk                   | 81 ++++++++++++++++++++++
 7 files changed, 208 insertions(+)
 create mode 100644 package/freeswitch/0001-zrtp.patch
 create mode 100644 package/freeswitch/0002-Makefile.am-fs_cli-needs-libzrtp.a.patch
 create mode 100644 package/freeswitch/0003-build-Makefile.am-modcheck.sh-is-superfluous-when-cr.patch
 create mode 100644 package/freeswitch/Config.in
 create mode 100644 package/freeswitch/freeswitch.hash
 create mode 100644 package/freeswitch/freeswitch.mk

diff --git a/package/Config.in b/package/Config.in
index 64822bf..99f7226 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1376,6 +1376,7 @@ endif
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
diff --git a/package/freeswitch/0002-Makefile.am-fs_cli-needs-libzrtp.a.patch b/package/freeswitch/0002-Makefile.am-fs_cli-needs-libzrtp.a.patch
new file mode 100644
index 0000000..630e02f
--- /dev/null
+++ b/package/freeswitch/0002-Makefile.am-fs_cli-needs-libzrtp.a.patch
@@ -0,0 +1,41 @@
+From 2e53d91ac18f34dd08227c2940d1525da5c6dbd2 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Tue, 1 Mar 2016 21:38:51 +0100
+Subject: [PATCH 1/1] Makefile.am: fs_cli needs libzrtp.a
+
+Compiling freeswitch sometimes shows a strange linking error:
+
+libs/libzrtp/third_party/bnlib/libbn.a(lbnmem.o): In function `lbnMemWipe':
+/home/bernd/buildroot/br7_freeswitch/output/build/freeswitch-1.6.6/libs/libzrtp/third_party/bnlib/lbnmem.c:69: undefined reference to `zrtp_memset'
+libs/libzrtp/third_party/bnlib/libbn.a(lbnmem.o): In function `lbnMemAlloc':
+/home/bernd/buildroot/br7_freeswitch/output/build/freeswitch-1.6.6/libs/libzrtp/third_party/bnlib/lbnmem.c:78: undefined reference to `zrtp_sys_alloc'
+libs/libzrtp/third_party/bnlib/libbn.a(lbnmem.o): In function `lbnMemFree':
+/home/bernd/buildroot/br7_freeswitch/output/build/freeswitch-1.6.6/libs/libzrtp/third_party/bnlib/lbnmem.c:87: undefined reference to `zrtp_sys_free'
+
+Adding libuuid as dependency fixes the problem although there is no
+connection between libzrtp and libuuid.
+
+Apparently bnlib depends on three symbols from libzrtp. Adding libzrtp.a
+to LIBS adds it to the linking command of fs_cli which fixes the bug.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 60746db..2e474fb 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -238,7 +238,7 @@ ZRTP_LIBS = -lbn -lzrtp
+ libfreeswitch_la_LDFLAGS += $(ZRTP_LDFLAGS)
+ libfreeswitch_la_LIBADD += $(ZRTP_LIBS)
+ CORE_LIBS += libs/libzrtp/libzrtp.a
+-LIBS += libs/libzrtp/third_party/bnlib/libbn.a
++LIBS += libs/libzrtp/third_party/bnlib/libbn.a libs/libzrtp/libzrtp.a
+ endif
+ 
+ library_includedir      = $(includedir)
+-- 
+2.7.0
+
diff --git a/package/freeswitch/0003-build-Makefile.am-modcheck.sh-is-superfluous-when-cr.patch b/package/freeswitch/0003-build-Makefile.am-modcheck.sh-is-superfluous-when-cr.patch
new file mode 100644
index 0000000..eb0a8fc
--- /dev/null
+++ b/package/freeswitch/0003-build-Makefile.am-modcheck.sh-is-superfluous-when-cr.patch
@@ -0,0 +1,26 @@
+From d39fa44865110dd6d8ebe914f6fc1f0fa5caf14e Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Tue, 1 Mar 2016 22:14:55 +0100
+Subject: [PATCH 1/1] build/Makefile.am: modcheck.sh is not needed when
+ cross-compiling
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ build/Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/build/Makefile.am b/build/Makefile.am
+index 61ac412..9baa306 100644
+--- a/build/Makefile.am
++++ b/build/Makefile.am
+@@ -71,7 +71,6 @@ install:
+ 	@echo " +                                                 +"
+ 	@echo " +-------------------------------------------------+"
+ 	@cat $(switch_srcdir)/cluecon2.tmpl
+-	@sh $(switch_srcdir)/build/modcheck.sh $(modulesdir)
+ 
+ .PHONY: check dvi html info install-data \
+         install-dvi install-exec install-html install-info install-pdf install-ps installcheck installdirs pdf \
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
index 0000000..31915cd
--- /dev/null
+++ b/package/freeswitch/freeswitch.hash
@@ -0,0 +1,2 @@
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.7.tar.xz.sha256
+sha256	9c7ca2d39985fdc39659054179465540e926880f032f855c0df74d6eec41a794	freeswitch-1.6.7.tar.xz
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
new file mode 100644
index 0000000..eeb6ca2
--- /dev/null
+++ b/package/freeswitch/freeswitch.mk
@@ -0,0 +1,81 @@
+################################################################################
+#
+# freeswitch
+#
+################################################################################
+
+FREESWITCH_VERSION = 1.6.7
+FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
+FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
+FREESWITCH_LICENSE = MPLv1.1
+FREESWITCH_LICENSE_FILES = COPYING
+
+# required dependencies
+FREESWITCH_DEPENDENCIES = \
+	host-autoconf host-automake host-libtool host-pkgconf jpeg \
+	libcurl openssl pcre speex sqlite zlib
+
+# configure.ac and Makefile.am are patched
+# our autoreconf breaks compilation of libs/apr
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
+FREESWITCH_CONF_OPTS += --enable-zrtp
+else
+FREESWITCH_CONF_OPTS += --disable-zrtp
+endif
+
+$(eval $(autotools-package))
-- 
2.8.0.rc3
