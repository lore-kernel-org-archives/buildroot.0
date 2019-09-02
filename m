From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 17:46:30 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/squid: bump to
 version 4.6
Message-ID: <20190902161353.0F08388EF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a97fc0d06e5623a07d8412abbb0f9688236adf40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

- Remove patch (already in version):
  https://github.com/squid-cache/squid/commit/c34582b9e8c40529db7eb9c490b081a37972f6d4
- Drop autoreconf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 46d76b3b1384d35507541e3b86c46467f0971776)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...nfigure.ac-use-pkg-config-to-find-libxml2.patch | 79 ----------------------
 package/squid/squid.hash                           |  8 +--
 package/squid/squid.mk                             |  4 +-
 3 files changed, 5 insertions(+), 86 deletions(-)

diff --git a/package/squid/0001-configure.ac-use-pkg-config-to-find-libxml2.patch b/package/squid/0001-configure.ac-use-pkg-config-to-find-libxml2.patch
deleted file mode 100644
index cc1a9f0585..0000000000
--- a/package/squid/0001-configure.ac-use-pkg-config-to-find-libxml2.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 39edb8ef08f51ea6a454d286091d78a4514c89e0 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 1 Dec 2018 18:21:55 +0100
-Subject: [PATCH] configure.ac: use pkg-config to find libxml2
-
-Fix static build of squid with libxml2 by using pkg-config to find
-libxml2 dependencies like -lz or -liconv
-
-Fixes:
- - http://autobuild.buildroot.org/results/7f23eb98c311b294c7f0e165279fa26909a5ff93
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/squid-cache/squid/pull/338]
----
- configure.ac | 43 +++++++++++++++++++++++++------------------
- 1 file changed, 25 insertions(+), 18 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index f30d824aa..47553db46 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -900,29 +900,36 @@ fi
- 
- AC_ARG_WITH(libxml2, AS_HELP_STRING([--without-libxml2],[Do not use libxml2 for ESI. Default: auto-detect]))
- if test "x$squid_opt_use_esi" != "xno" -a "x$with_libxml2" != "xno" ; then
--  AC_CHECK_LIB([xml2], [main], [XMLLIB="-lxml2"; HAVE_LIBXML2=1])
--  dnl Find the main header and include path...
--  AC_CACHE_CHECK([location of libxml2 include files], [ac_cv_libxml2_include], [
--    AC_CHECK_HEADERS([libxml/parser.h], [], [
--      AC_MSG_NOTICE([Testing in /usr/include/libxml2])
--      SAVED_CPPFLAGS="$CPPFLAGS"
--      CPPFLAGS="-I/usr/include/libxml2 $CPPFLAGS"
--      unset ac_cv_header_libxml_parser_h
--      AC_CHECK_HEADERS([libxml/parser.h], [ac_cv_libxml2_include="-I/usr/include/libxml2"], [
--        AC_MSG_NOTICE([Testing in /usr/local/include/libxml2])
--        CPPFLAGS="-I/usr/local/include/libxml2 $SAVED_CPPFLAGS"
-+   PKG_CHECK_MODULES([LIBXML2],[libxml-2.0],[
-+    CPPFLAGS="$CPPFLAGS $LIBXML2_CFLAGS";
-+    SQUID_CXXFLAGS="$SQUID_CXXFLAGS $LIBXML2_CFLAGS";
-+    XMLLIB="$LIBXML2_LIBS";
-+    HAVE_LIBXML2=1
-+    ],[
-+    AC_CHECK_LIB([xml2], [main], [XMLLIB="-lxml2"; HAVE_LIBXML2=1])
-+    dnl Find the main header and include path...
-+    AC_CACHE_CHECK([location of libxml2 include files], [ac_cv_libxml2_include], [
-+      AC_CHECK_HEADERS([libxml/parser.h], [], [
-+        AC_MSG_NOTICE([Testing in /usr/include/libxml2])
-+        SAVED_CPPFLAGS="$CPPFLAGS"
-+        CPPFLAGS="-I/usr/include/libxml2 $CPPFLAGS"
-         unset ac_cv_header_libxml_parser_h
--        AC_CHECK_HEADERS([libxml/parser.h], [ac_cv_libxml2_include="-I/usr/local/include/libxml2"], [
--          AC_MSG_NOTICE([Failed to find libxml2 header file libxml/parser.h])
-+        AC_CHECK_HEADERS([libxml/parser.h], [ac_cv_libxml2_include="-I/usr/include/libxml2"], [
-+          AC_MSG_NOTICE([Testing in /usr/local/include/libxml2])
-+          CPPFLAGS="-I/usr/local/include/libxml2 $SAVED_CPPFLAGS"
-+          unset ac_cv_header_libxml_parser_h
-+          AC_CHECK_HEADERS([libxml/parser.h], [ac_cv_libxml2_include="-I/usr/local/include/libxml2"], [
-+            AC_MSG_NOTICE([Failed to find libxml2 header file libxml/parser.h])
-+          ])
-         ])
-+        CPPFLAGS="$SAVED_CPPFLAGS"
-       ])
--      CPPFLAGS="$SAVED_CPPFLAGS"
-     ])
-+    if test "x$ac_cv_libxml2_include" != "x"; then
-+        SQUID_CXXFLAGS="$ac_cv_libxml2_include $SQUID_CXXFLAGS"
-+        CPPFLAGS="$ac_cv_libxml2_include $CPPFLAGS"
-+    fi
-   ])
--  if test "x$ac_cv_libxml2_include" != "x"; then
--      SQUID_CXXFLAGS="$ac_cv_libxml2_include $SQUID_CXXFLAGS"
--      CPPFLAGS="$ac_cv_libxml2_include $CPPFLAGS"
--  fi
-   dnl Now that we know where to look find the headers...
-   AC_CHECK_HEADERS(libxml/parser.h libxml/HTMLparser.h libxml/HTMLtree.h)
-   AC_DEFINE_UNQUOTED(HAVE_LIBXML2, $HAVE_LIBXML2, [Define to 1 if you have the libxml2 library])
--- 
-2.17.1
-
diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 5e872707ce..d69e9b2ab0 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,6 +1,6 @@
-# From http://www.squid-cache.org/Versions/v4/squid-4.4.tar.xz.asc
-md5 892504ca9700e1f139a53f84098613bd squid-4.4.tar.xz
-sha1 0ab6b133f65866d825bf72cbbe8cef209768b2fa squid-4.4.tar.xz
+# From http://www.squid-cache.org/Versions/v4/squid-4.6.tar.xz.asc
+md5 e25e7cc37754ad14d8aa368c0c210e54 squid-4.6.tar.xz
+sha1 0396fe8077049000407d13aca8efdd9228e69d98 squid-4.6.tar.xz
 # Locally calculated
-sha256 4905e6da7f5574d2583ba36f398bb062a12d51e70d67035078b6e85b09e9ee82 squid-4.4.tar.xz
+sha256 015bade5d3a4905142c4c605df5c4216471e3d8338079955e0e44b0ae0303d41 squid-4.6.tar.xz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 5d5ec0c38d..0331b83888 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-SQUID_VERSION = 4.4
+SQUID_VERSION = 4.6
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v4
 SQUID_LICENSE = GPL-2.0+
 SQUID_LICENSE_FILES = COPYING
-# We're patching configure.ac
-SQUID_AUTORECONF = YES
 SQUID_DEPENDENCIES = libcap host-libcap libxml2 host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
 SQUID_CONF_ENV = \
