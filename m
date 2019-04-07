From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Apr 2019 21:58:32 +0200
Subject: [Buildroot] [PATCH 5/6] package/lldpd: bump to version 1.0.3
In-Reply-To: <20190407195833.9275-1-fontaine.fabrice@gmail.com>
References: <20190407195833.9275-1-fontaine.fabrice@gmail.com>
Message-ID: <20190407195833.9275-5-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patch (already in version)
- Drop autoreconf as patch has been removed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...o-disable-libbsd-with-without-libbsd.patch | 106 ------------------
 package/lldpd/lldpd.hash                      |   2 +-
 package/lldpd/lldpd.mk                        |   4 +-
 3 files changed, 2 insertions(+), 110 deletions(-)
 delete mode 100644 package/lldpd/0001-build-ability-to-disable-libbsd-with-without-libbsd.patch

diff --git a/package/lldpd/0001-build-ability-to-disable-libbsd-with-without-libbsd.patch b/package/lldpd/0001-build-ability-to-disable-libbsd-with-without-libbsd.patch
deleted file mode 100644
index 7301ac636b..0000000000
--- a/package/lldpd/0001-build-ability-to-disable-libbsd-with-without-libbsd.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From ff3dcc4ad71c1105bd8ea11afe7e07efd48c038d Mon Sep 17 00:00:00 2001
-From: Vincent Bernat <vincent@bernat.ch>
-Date: Tue, 25 Sep 2018 10:57:49 +0200
-Subject: [PATCH] build: ability to disable libbsd with --without-libbsd
-
-This is useful when user wants to ensure reproducibility of the build
-whatever libbsd is present or not.
-
-Signed-off-by: Trent Piepho <tpiepho@impinj.com>
----
- configure.ac  | 59 +++++++++++++++++++++++++++++++++++++++--------------------
- src/marshal.h |  1 +
- 2 files changed, 40 insertions(+), 20 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9b40473..589cd96 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -173,26 +173,44 @@ AC_FUNC_REALLOC
- AC_FUNC_FORK
- 
- # Some functions can be in libbsd
--PKG_CHECK_MODULES([libbsd], [libbsd-overlay], [
--  _save_CFLAGS="$CFLAGS"
--  _save_LIBS="$LIBS"
--  CFLAGS="$CFLAGS $libbsd_CFLAGS"
--  LIBS="$LIBS $libbsd_LIBS"
--  AC_MSG_CHECKING([if libbsd can be linked correctly])
--  AC_TRY_LINK([
--@%:@include <sys/time.h>
--@%:@include <sys/types.h>
--],[],
--    [
--      AC_MSG_RESULT(yes)
--      LLDP_CFLAGS="$LLDP_CFLAGS $libbsd_CFLAGS"
--      LLDP_LDFLAGS="$LLDP_LDFLAGS $libbsd_LIBS"
--    ],[
--      AC_MSG_RESULT(no)
--      CFLAGS="$_save_CFLAGS"
--      LIBS="$_save_LIBS"
--    ])
--], [:])
-+AC_ARG_WITH([libbsd],
-+  AS_HELP_STRING(
-+    [--with-libbsd],
-+    [Use libbsd @<:@default=auto@:>@]),
-+  [],
-+  [with_libbsd=auto])
-+if test x"$with_libbsd" != x"no"; then
-+  PKG_CHECK_MODULES([libbsd], [libbsd-overlay], [
-+    _save_CFLAGS="$CFLAGS"
-+    _save_LIBS="$LIBS"
-+    CFLAGS="$CFLAGS $libbsd_CFLAGS"
-+    LIBS="$LIBS $libbsd_LIBS"
-+    AC_MSG_CHECKING([if libbsd can be linked correctly])
-+    AC_TRY_LINK([
-+  @%:@include <sys/time.h>
-+  @%:@include <sys/types.h>
-+  ],[],
-+      [
-+        AC_MSG_RESULT(yes)
-+        LLDP_CFLAGS="$LLDP_CFLAGS $libbsd_CFLAGS"
-+        LLDP_LDFLAGS="$LLDP_LDFLAGS $libbsd_LIBS"
-+        with_libbsd=yes
-+      ],[
-+        AC_MSG_RESULT(no)
-+        CFLAGS="$_save_CFLAGS"
-+        LIBS="$_save_LIBS"
-+        if test x"$with_libbsd" = x"yes"; then
-+           AC_MSG_FAILURE([*** no libbsd support found])
-+        fi
-+        with_libbsd=no
-+      ])
-+  ], [
-+    if test x"$with_libbsd" = x"yes"; then
-+       AC_MSG_FAILURE([*** no libbsd support found])
-+    fi
-+    with_libbsd=no
-+  ])
-+fi
- 
- # setproctitle may have an _init function
- AC_REPLACE_FUNCS([setproctitle])
-@@ -412,6 +430,7 @@ cat <<EOF
-   XML output.....: ${with_xml-no}
-   Oldies support.: $enable_oldies
-   seccomp........: ${with_seccomp-no}
-+  libbsd.........: ${with_libbsd-no}
- 
-  Privilege separation:
-   Enabled........: $enable_privsep
-diff --git a/src/marshal.h b/src/marshal.h
-index b0e8032..0a782d5 100644
---- a/src/marshal.h
-+++ b/src/marshal.h
-@@ -19,6 +19,7 @@
- #define _MARSHAL_H
- 
- #include <stddef.h>
-+#include <stdint.h>
- #include <sys/types.h>
- 
- struct marshal_info;
--- 
-2.14.4
-
diff --git a/package/lldpd/lldpd.hash b/package/lldpd/lldpd.hash
index 1c0e380996..6ac11ee38b 100644
--- a/package/lldpd/lldpd.hash
+++ b/package/lldpd/lldpd.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 450b622aac7ae1758f1ef82f3b7b94ec47f2ff33abfb0e6ac82555b9ee55f151  lldpd-1.0.1.tar.gz
+sha256 39fced395168015416bfe78b95414facf066f841f349024433aa20ab54e4c360  lldpd-1.0.3.tar.gz
 sha256 0e96a5aea65f16e2239231ce4ab90497f8bc3bb8fe6abe9299aade4726ff7c8d  LICENSE
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index 050f45491e..99de40d498 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-LLDPD_VERSION = 1.0.1
+LLDPD_VERSION = 1.0.3
 LLDPD_SITE = http://media.luffy.cx/files/lldpd
 LLDPD_DEPENDENCIES = host-pkgconf libevent
 LLDPD_LICENSE = ISC
 LLDPD_LICENSE_FILES = LICENSE
-# 0002-configure-do-not-check-for-libbsd.patch / 0003-configure-remove-check-on-CXX-compiler.patch
-LLDPD_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_CHECK),y)
 LLDPD_DEPENDENCIES += check
-- 
2.20.1
