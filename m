From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 Jun 2013 16:55:03 +0200
Subject: [Buildroot] [git commit] gnutls: bump to version 3.2.1
Message-ID: <20130603152934.44D0F9A891@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e9f3d015c98abfbaed2aad65fbe3331f4576273
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gnutls/Config.in                           |    1 +
 ...gnutls-correct_rpl_gettimeofday_signature.patch |   58 --------------------
 package/gnutls/gnutls.mk                           |   29 ++++++++--
 3 files changed, 24 insertions(+), 64 deletions(-)

diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index 038b3fb..f699af7 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GNUTLS
 	bool "gnutls"
 	select BR2_PACKAGE_NETTLE
+	select BR2_PACKAGE_PCRE
 	depends on BR2_USE_WCHAR
 	help
 	  GnuTLS is a secure communications library implementing the SSL
diff --git a/package/gnutls/gnutls-correct_rpl_gettimeofday_signature.patch b/package/gnutls/gnutls-correct_rpl_gettimeofday_signature.patch
deleted file mode 100644
index 9188708..0000000
--- a/package/gnutls/gnutls-correct_rpl_gettimeofday_signature.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-[PATCH] fix build on uClibc
-
-Currently we fail on uclibc like below
-
-| In file included from /home/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sysroots/qemuarm/usr/include/sys/procfs.h:32:0,
-|                  from /home/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sysroots/qemuarm/usr/include/sys/ucontext.h:26,
-|                  from /home/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sysroots/qemuarm/usr/include/signal.h:392,
-|                  from ../../gl/signal.h:52,
-|                  from ../../gl/sys/select.h:58,
-|                  from /home/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sysroots/qemuarm/usr/include/sys/types.h:220,
-|                  from ../../gl/sys/types.h:28,
-|                  from ../../lib/includes/gnutls/gnutls.h:46,
-|                  from ex-cxx.cpp:3:
-| ../../gl/sys/time.h:396:66: error: conflicting declaration 'void* restrict'
-| ../../gl/sys/time.h:396:50: error: 'restrict' has a previous declaration as 'timeval* restrict'
-| make[4]: *** [ex-cxx.o] Error 1
-| make[4]: *** Waiting for unfinished jobs....
-
-
-GCC detects that we call 'restrict' as param name in function
-signatures and complains since both params are called 'restrict'
-therefore we use __restrict to denote the C99 keywork
-
-This only happens of uclibc since this code is not excercised with
-eglibc otherwise we will have same issue there too
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
-
-Index: gnutls-2.12.14/gl/sys_time.in.h
-===================================================================
---- gnutls-2.12.14.orig/gl/sys_time.in.h	2012-01-15 10:54:39.517285351 -0800
-+++ gnutls-2.12.14/gl/sys_time.in.h	2012-01-15 10:59:23.773299108 -0800
-@@ -82,20 +82,20 @@
- #    define gettimeofday rpl_gettimeofday
- #   endif
- _GL_FUNCDECL_RPL (gettimeofday, int,
--                  (struct timeval *restrict, void *restrict)
-+                  (struct timeval *__restrict, void *__restrict)
-                   _GL_ARG_NONNULL ((1)));
- _GL_CXXALIAS_RPL (gettimeofday, int,
--                  (struct timeval *restrict, void *restrict));
-+                  (struct timeval *__restrict, void *__restrict));
- #  else
- #   if !@HAVE_GETTIMEOFDAY@
- _GL_FUNCDECL_SYS (gettimeofday, int,
--                  (struct timeval *restrict, void *restrict)
-+                  (struct timeval *__restrict, void *__restrict)
-                   _GL_ARG_NONNULL ((1)));
- #   endif
- /* Need to cast, because on glibc systems, by default, the second argument is
-                                                   struct timezone *.  */
- _GL_CXXALIAS_SYS_CAST (gettimeofday, int,
--                       (struct timeval *restrict, void *restrict));
-+                       (struct timeval *__restrict, void *__restrict));
- #  endif
- _GL_CXXALIASWARN (gettimeofday);
- # elif defined GNULIB_POSIXCHECK
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 610a5a2..3089979 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -4,22 +4,39 @@
 #
 #############################################################
 
-GNUTLS_VERSION = 3.1.9
+GNUTLS_VERSION = 3.2.1
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
-GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v3.1
-GNUTLS_LICENSE = GPLv3+ LGPLv3
+GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v3.2
+GNUTLS_LICENSE = GPLv3+ LGPLv2.1+
 GNUTLS_LICENSE_FILES = COPYING COPYING.LESSER
-GNUTLS_DEPENDENCIES = host-pkgconf nettle $(if $(BR2_PACKAGE_ZLIB),zlib)
-GNUTLS_CONF_OPT = --with-libnettle-prefix=$(STAGING_DIR)/usr --disable-rpath
+GNUTLS_DEPENDENCIES = host-pkgconf nettle pcre \
+	$(if $(BR2_PACKAGE_P11_KIT),p11-kit) \
+	$(if $(BR2_PACKAGE_LIBIDN),libidn) \
+	$(if $(BR2_PACKAGE_LIBTASN1),libtasn1) \
+	$(if $(BR2_PACKAGE_ZLIB),zlib)
+GNUTLS_CONF_OPT = --with-libnettle-prefix=$(STAGING_DIR)/usr --disable-rpath \
+	--disable-doc --disable-guile
 GNUTLS_CONF_ENV = gl_cv_socket_ipv6=$(if $(BR2_INET_IPV6),yes,no) \
 	ac_cv_header_wchar_h=$(if $(BR2_USE_WCHAR),yes,no) \
 	gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no) \
-	gt_cv_c_wint_t=$(if $(BR2_USE_WCHAR),yes,no)
+	gt_cv_c_wint_t=$(if $(BR2_USE_WCHAR),yes,no) \
+	gl_cv_func_gettimeofday_clobber=no
 GNUTLS_INSTALL_STAGING = YES
 
 # libpthread autodetection poisons the linkpath
 GNUTLS_CONF_OPT += $(if $(BR2_TOOLCHAIN_HAS_THREADS),--with-libpthread-prefix=$(STAGING_DIR)/usr)
 
+# gnutls needs libregex, but pcre can be used too
+# The check isn't cross-compile friendly
+define GNUTLS_LIBREGEX_CHECK_FIX
+	$(SED) 's/libopts_cv_with_libregex=no/libopts_cv_with_libregex=yes/g;'\
+		$(@D)/configure
+endef
+GNUTLS_PRE_CONFIGURE_HOOKS += GNUTLS_LIBREGEX_CHECK_FIX
+GNUTLS_CONF_OPT += --with-regex-header=pcreposix.h \
+	--with-libregex-cflags="`$(PKG_CONFIG_HOST_BINARY) libpcreposix --cflags`" \
+	--with-libregex-libs="`$(PKG_CONFIG_HOST_BINARY) libpcreposix --libs`"
+
 # libidn support for nommu must exclude the crywrap wrapper (uses fork)
 GNUTLS_CONF_OPT += $(if $(BR2_USE_MMU),,--disable-crywrap)
 GNUTLS_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBIDN),libidn)
