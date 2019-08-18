From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 18 Aug 2019 12:14:05 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/ghostscript: fix static build
 errors
Message-ID: <20190818101406.6574-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch 0003 fixes a bug which occured with pkgconfig enabled.
Patch 0004 fixes the linking error with libidn.

Fixes:
http://autobuild.buildroot.net/results/45a/45a94a494eb2b719ac338d2e734753b11a4a0144/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added BUILD_PKGCONFIG=/bin/false (Thomas)
    fixed fontconfig/freetype linking error caused by using pkgconfig
    updated libidn detection (Thomas)

 .../ghostscript/0003-pkgconf-libs-only.patch  | 28 ++++++++++
 .../ghostscript/0004-pkgconfig-libidn.patch   | 53 +++++++++++++++++++
 package/ghostscript/ghostscript.mk            |  3 ++
 3 files changed, 84 insertions(+)
 create mode 100644 package/ghostscript/0003-pkgconf-libs-only.patch
 create mode 100644 package/ghostscript/0004-pkgconfig-libidn.patch

diff --git a/package/ghostscript/0003-pkgconf-libs-only.patch b/package/ghostscript/0003-pkgconf-libs-only.patch
new file mode 100644
index 0000000000..8518c3b1f1
--- /dev/null
+++ b/package/ghostscript/0003-pkgconf-libs-only.patch
@@ -0,0 +1,28 @@
+fix build with pkg-config enabled
+
+Patch sent upstream:
+https://bugs.ghostscript.com/show_bug.cgi?id=701440
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr ghostscript-9.27.old/configure.ac ghostscript-9.27/configure.ac
+--- ghostscript-9.27.old/configure.ac	2019-04-04 09:43:14.000000000 +0200
++++ ghostscript-9.27/configure.ac	2019-08-18 11:32:50.163910476 +0200
+@@ -853,7 +853,7 @@
+                 if $PKGCONFIG --exists fontconfig; then
+                         AC_MSG_RESULT(yes)
+                         FONTCONFIG_CFLAGS="$CFLAGS `$PKGCONFIG --cflags fontconfig`"
+-                        FONTCONFIG_LIBS="`$PKGCONFIG --libs fontconfig`"
++                        FONTCONFIG_LIBS="`$PKGCONFIG --libs-only-l fontconfig`"
+                         HAVE_FONTCONFIG=-DHAVE_FONTCONFIG
+                 else
+                         AC_MSG_RESULT(no)
+@@ -996,7 +996,7 @@
+             if $PKGCONFIG --atleast-version=12.0.6 freetype2; then
+                 AC_MSG_RESULT(yes)
+                 FT_CFLAGS="$CFLAGS `$PKGCONFIG --cflags freetype2`"
+-                FT_LIBS="`$PKGCONFIG --libs freetype2`"
++                FT_LIBS="`$PKGCONFIG --libs-only-l freetype2`"
+                 FT_BRIDGE=1
+                 SHARE_FT=1
+             else
diff --git a/package/ghostscript/0004-pkgconfig-libidn.patch b/package/ghostscript/0004-pkgconfig-libidn.patch
new file mode 100644
index 0000000000..6fcef0f3e5
--- /dev/null
+++ b/package/ghostscript/0004-pkgconfig-libidn.patch
@@ -0,0 +1,53 @@
+fix static build with libidn
+
+Patch sent upstream:
+https://bugs.ghostscript.com/show_bug.cgi?id=701439
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr ghostscript-9.27.old/configure.ac ghostscript-9.27/configure.ac
+--- ghostscript-9.27.old/configure.ac	2019-04-04 09:43:14.000000000 +0200
++++ ghostscript-9.27/configure.ac	2019-08-18 12:01:38.779728836 +0200
+@@ -790,22 +790,31 @@
+                                [Do not use libidn to support Unicode passwords])],,
+             [with_libidn=maybe])
+ if test x$with_libidn != xno; then
+-  AC_CHECK_LIB(idn, stringprep, [
+-    with_libidn=no
+-    AC_CHECK_HEADER([stringprep.h], [with_libidn=yes])
+-    ], [
+-    if test x$with_libidn != xmaybe; then
+-      AC_MSG_ERROR([libidn not found])
++    if test "x$PKGCONFIG" != x; then
++        AC_MSG_CHECKING(for libidn with pkg-config)
++        if $PKGCONFIG --exists libidn; then
++                AC_MSG_RESULT(yes)
++                LIBS="$LIBS `$PKGCONFIG --libs libidn`"
++                HAVE_LIBIDN=-DHAVE_LIBIDN
++        else
++                AC_MSG_RESULT(no)
++        fi
++    fi
++    if test -z "$HAVE_LIBIDN"; then
++        AC_CHECK_LIB(idn, stringprep, [
++            with_libidn=no
++            AC_CHECK_HEADER([stringprep.h], [with_libidn=yes])
++            ], [
++            if test x$with_libidn != xmaybe; then
++              AC_MSG_ERROR([libidn not found])
++            fi
++            with_libidn=no
++        ])
+     fi
+-    with_libidn=no
+-  ])
+ fi
+ HAVE_LIBIDN=''
+ UTF8DEVS=''
+ if test x$with_libidn != xno; then
+-  HAVE_LIBIDN=-DHAVE_LIBIDN
+-  LIBS="$LIBS -lidn"
+-
+   if test x$found_iconv != xno; then
+     UTF8DEVS='$(PSD)utf8.dev'
+   fi
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index fefac2aee3..42af344878 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -10,6 +10,8 @@ GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_LICENSE = AGPL-3.0
 GHOSTSCRIPT_LICENSE_FILES = LICENSE
 # 0001-Fix-cross-compilation-issue.patch
+# 0003-pkgconf-libs-only.patch
+# 0004-pkgconfig-libidn.patch
 GHOSTSCRIPT_AUTORECONF = YES
 GHOSTSCRIPT_DEPENDENCIES = \
 	host-lcms2 \
@@ -33,6 +35,7 @@ endef
 GHOSTSCRIPT_POST_PATCH_HOOKS += GHOSTSCRIPT_REMOVE_LIBS
 
 GHOSTSCRIPT_CONF_ENV = \
+	BUILD_PKGCONFIG=/bin/false \
 	CCAUX="$(HOSTCC)" \
 	CFLAGSAUX="$(HOST_CFLAGS) $(HOST_LDFLAGS)"
 
-- 
2.20.1
