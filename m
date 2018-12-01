From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Dec 2018 21:52:53 +0100
Subject: [Buildroot] [git commit] squid: fix static build with libxml2
Message-ID: <20181201204943.3C82D89073@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7893eff22a0d5a37e5321e9510e2a38a52bd999
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use pkg-config to find libxml2 to fix static build of squid
Add SQUID_AUTORECONF = YES and remove ac_cv_libxml2_include (not needed
anymore)

Fixes:
 - http://autobuild.buildroot.org/results/7f23eb98c311b294c7f0e165279fa26909a5ff93

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...nfigure.ac-use-pkg-config-to-find-libxml2.patch | 79 ++++++++++++++++++++++
 package/squid/squid.mk                             |  3 +-
 2 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/package/squid/0001-configure.ac-use-pkg-config-to-find-libxml2.patch b/package/squid/0001-configure.ac-use-pkg-config-to-find-libxml2.patch
new file mode 100644
index 0000000000..cc1a9f0585
--- /dev/null
+++ b/package/squid/0001-configure.ac-use-pkg-config-to-find-libxml2.patch
@@ -0,0 +1,79 @@
+From 39edb8ef08f51ea6a454d286091d78a4514c89e0 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 1 Dec 2018 18:21:55 +0100
+Subject: [PATCH] configure.ac: use pkg-config to find libxml2
+
+Fix static build of squid with libxml2 by using pkg-config to find
+libxml2 dependencies like -lz or -liconv
+
+Fixes:
+ - http://autobuild.buildroot.org/results/7f23eb98c311b294c7f0e165279fa26909a5ff93
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/squid-cache/squid/pull/338]
+---
+ configure.ac | 43 +++++++++++++++++++++++++------------------
+ 1 file changed, 25 insertions(+), 18 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index f30d824aa..47553db46 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -900,29 +900,36 @@ fi
+ 
+ AC_ARG_WITH(libxml2, AS_HELP_STRING([--without-libxml2],[Do not use libxml2 for ESI. Default: auto-detect]))
+ if test "x$squid_opt_use_esi" != "xno" -a "x$with_libxml2" != "xno" ; then
+-  AC_CHECK_LIB([xml2], [main], [XMLLIB="-lxml2"; HAVE_LIBXML2=1])
+-  dnl Find the main header and include path...
+-  AC_CACHE_CHECK([location of libxml2 include files], [ac_cv_libxml2_include], [
+-    AC_CHECK_HEADERS([libxml/parser.h], [], [
+-      AC_MSG_NOTICE([Testing in /usr/include/libxml2])
+-      SAVED_CPPFLAGS="$CPPFLAGS"
+-      CPPFLAGS="-I/usr/include/libxml2 $CPPFLAGS"
+-      unset ac_cv_header_libxml_parser_h
+-      AC_CHECK_HEADERS([libxml/parser.h], [ac_cv_libxml2_include="-I/usr/include/libxml2"], [
+-        AC_MSG_NOTICE([Testing in /usr/local/include/libxml2])
+-        CPPFLAGS="-I/usr/local/include/libxml2 $SAVED_CPPFLAGS"
++   PKG_CHECK_MODULES([LIBXML2],[libxml-2.0],[
++    CPPFLAGS="$CPPFLAGS $LIBXML2_CFLAGS";
++    SQUID_CXXFLAGS="$SQUID_CXXFLAGS $LIBXML2_CFLAGS";
++    XMLLIB="$LIBXML2_LIBS";
++    HAVE_LIBXML2=1
++    ],[
++    AC_CHECK_LIB([xml2], [main], [XMLLIB="-lxml2"; HAVE_LIBXML2=1])
++    dnl Find the main header and include path...
++    AC_CACHE_CHECK([location of libxml2 include files], [ac_cv_libxml2_include], [
++      AC_CHECK_HEADERS([libxml/parser.h], [], [
++        AC_MSG_NOTICE([Testing in /usr/include/libxml2])
++        SAVED_CPPFLAGS="$CPPFLAGS"
++        CPPFLAGS="-I/usr/include/libxml2 $CPPFLAGS"
+         unset ac_cv_header_libxml_parser_h
+-        AC_CHECK_HEADERS([libxml/parser.h], [ac_cv_libxml2_include="-I/usr/local/include/libxml2"], [
+-          AC_MSG_NOTICE([Failed to find libxml2 header file libxml/parser.h])
++        AC_CHECK_HEADERS([libxml/parser.h], [ac_cv_libxml2_include="-I/usr/include/libxml2"], [
++          AC_MSG_NOTICE([Testing in /usr/local/include/libxml2])
++          CPPFLAGS="-I/usr/local/include/libxml2 $SAVED_CPPFLAGS"
++          unset ac_cv_header_libxml_parser_h
++          AC_CHECK_HEADERS([libxml/parser.h], [ac_cv_libxml2_include="-I/usr/local/include/libxml2"], [
++            AC_MSG_NOTICE([Failed to find libxml2 header file libxml/parser.h])
++          ])
+         ])
++        CPPFLAGS="$SAVED_CPPFLAGS"
+       ])
+-      CPPFLAGS="$SAVED_CPPFLAGS"
+     ])
++    if test "x$ac_cv_libxml2_include" != "x"; then
++        SQUID_CXXFLAGS="$ac_cv_libxml2_include $SQUID_CXXFLAGS"
++        CPPFLAGS="$ac_cv_libxml2_include $CPPFLAGS"
++    fi
+   ])
+-  if test "x$ac_cv_libxml2_include" != "x"; then
+-      SQUID_CXXFLAGS="$ac_cv_libxml2_include $SQUID_CXXFLAGS"
+-      CPPFLAGS="$ac_cv_libxml2_include $CPPFLAGS"
+-  fi
+   dnl Now that we know where to look find the headers...
+   AC_CHECK_HEADERS(libxml/parser.h libxml/HTMLparser.h libxml/HTMLtree.h)
+   AC_DEFINE_UNQUOTED(HAVE_LIBXML2, $HAVE_LIBXML2, [Define to 1 if you have the libxml2 library])
+-- 
+2.17.1
+
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index b661d5d133..d6f186d97b 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -9,6 +9,8 @@ SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v4
 SQUID_LICENSE = GPL-2.0+
 SQUID_LICENSE_FILES = COPYING
+# We're patching configure.ac
+SQUID_AUTORECONF = YES
 SQUID_DEPENDENCIES = libcap host-libcap libxml2 host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
 SQUID_CONF_ENV = \
@@ -18,7 +20,6 @@ SQUID_CONF_ENV = \
 	ac_cv_func___va_copy=yes \
 	ac_cv_func_strnstr=no \
 	ac_cv_have_squid=yes \
-	ac_cv_libxml2_include="-I$(STAGING_DIR)/usr/include/libxml2" \
 	BUILDCXX="$(HOSTCXX)" \
 	BUILDCXXFLAGS="$(HOST_CXXFLAGS)"
 SQUID_CONF_OPTS = \
