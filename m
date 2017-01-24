From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 24 Jan 2017 18:14:02 +0000
Subject: [Buildroot] [PATCH v2] util-linux: bump version to 2.29.1
Message-ID: <20170124181402.37530-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

0001-build-sys-prefer-pkg-config-for-ncurses.patch already included:
  http://git.kernel.org/cgit/utils/util-linux/util-linux.git/commit/?id=3f7429fd2d539c7f948f72bd829404b55ac19d9f
0002-build-sys-cleanup-UL_NCURSES_CHECK.patch already included:
  http://git.kernel.org/cgit/utils/util-linux/util-linux.git/commit/?id=862326451184bb0fe9c2b2b110fcfc986f9b1734
0003-build-sys-fix-compilation-with-ncurses-and-uClibc-or.patch already
included:
  http://git.kernel.org/cgit/utils/util-linux/util-linux.git/commit/?id=9ea8ded37b648bbd538cbf9c4d144b8b1a93c1b5

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2:
 - Removed autoreconf.
 - Removed MKINSTALLDIRS workaround since it was there due to
   autoreconf.
---
 ...1-build-sys-prefer-pkg-config-for-ncurses.patch | 76 ------------------
 .../0002-build-sys-cleanup-UL_NCURSES_CHECK.patch  | 91 ---------------------
 ...ix-compilation-with-ncurses-and-uClibc-or.patch | 92 ----------------------
 package/util-linux/util-linux.hash                 |  2 +-
 package/util-linux/util-linux.mk                   | 12 +--
 5 files changed, 2 insertions(+), 271 deletions(-)
 delete mode 100644 package/util-linux/0001-build-sys-prefer-pkg-config-for-ncurses.patch
 delete mode 100644 package/util-linux/0002-build-sys-cleanup-UL_NCURSES_CHECK.patch
 delete mode 100644 package/util-linux/0003-build-sys-fix-compilation-with-ncurses-and-uClibc-or.patch

diff --git a/package/util-linux/0001-build-sys-prefer-pkg-config-for-ncurses.patch b/package/util-linux/0001-build-sys-prefer-pkg-config-for-ncurses.patch
deleted file mode 100644
index ca22ee2..0000000
--- a/package/util-linux/0001-build-sys-prefer-pkg-config-for-ncurses.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 3f7429fd2d539c7f948f72bd829404b55ac19d9f Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Mon, 12 Dec 2016 15:23:53 +0100
-Subject: [PATCH] build-sys: prefer pkg-config for ncurses
-
-and use ncurses{5,6}-config as fallback only.
-
-Signed-off-by: Karel Zak <kzak@redhat.com>
----
- m4/ul.m4 | 48 ++++++++++++++++++++++++++++--------------------
- 1 file changed, 28 insertions(+), 20 deletions(-)
-
-diff --git a/m4/ul.m4 b/m4/ul.m4
-index c569c36..44c721e 100644
---- a/m4/ul.m4
-+++ b/m4/ul.m4
-@@ -438,28 +438,36 @@ dnl The expected <name> is ncurses or ncursesw.
- dnl
- AC_DEFUN([UL_NCURSES_CHECK], [
-   m4_define([suffix], $1)
-+  m4_define([suffixup], m4_toupper($1))
-+
-+  # pkg-config
-+  PKG_CHECK_MODULES(suffixup, [$1], [
-+    have_[]suffix=yes
-+    NCURSES_LIBS=${suffixup[]_LIBS}
-+    NCURSES_CFLAGS=${suffixup[]_CFLAGS}
-+  ],[have_[]suffix=no])
- 
-   # ncurses-config should be everywhere, pkg-config is not supported by default
-   # by ncurses upstream
-   #
--  AC_MSG_CHECKING([$1])
--  if AC_RUN_LOG([suffix[]6-config --version >/dev/null]); then
--    have_[]suffix=yes
--    NCURSES_LIBS=`suffix[]6-config --libs`
--    NCURSES_CFLAGS=`suffix[]6-config --cflags`
--    AC_MSG_RESULT([(v6) yes])
--  elif AC_RUN_LOG([suffix[]5-config --version >/dev/null]); then
--    have_[]suffix=yes
--    NCURSES_LIBS=`suffix[]5-config --libs`
--    NCURSES_CFLAGS=`suffix[]5-config --cflags`
--    AC_MSG_RESULT([(v5) yes])
--  else
--    AC_MSG_RESULT([no])
--
--    # fallback
--    AC_CHECK_LIB([$1], [initscr], [have_[]suffix=yes], [have_[]suffix=no])
--    AS_IF([test "x$have_[]suffix" = xyes], [
--      NCURSES_LIBS="-l[]suffix"
--    ])
--  fi
-+  AS_IF([test "x$have_[]suffix" = xno], [
-+    AC_MSG_CHECKING([$1 config])
-+    if AC_RUN_LOG([suffix[]6-config --version >/dev/null]); then
-+      have_[]suffix=yes
-+      NCURSES_LIBS=`suffix[]6-config --libs`
-+      NCURSES_CFLAGS=`suffix[]6-config --cflags`
-+      AC_MSG_RESULT([(v6) yes])
-+    elif AC_RUN_LOG([suffix[]5-config --version >/dev/null]); then
-+      have_[]suffix=yes
-+      NCURSES_LIBS=`suffix[]5-config --libs`
-+      NCURSES_CFLAGS=`suffix[]5-config --cflags`
-+      AC_MSG_RESULT([(v5) yes])
-+    else
-+      AC_MSG_RESULT([no])
-+      AS_IF([test "x$have_[]suffix" = xno], [
-+        AC_CHECK_LIB([$1], [initscr], [have_[]suffix=yes], [have_[]suffix=no])
-+        AS_IF([test "x$have_[]suffix" = xyes], [NCURSES_LIBS="-l[]suffix"])
-+      ])
-+    fi
-+  ])
- ])
--- 
-2.6.2
-
diff --git a/package/util-linux/0002-build-sys-cleanup-UL_NCURSES_CHECK.patch b/package/util-linux/0002-build-sys-cleanup-UL_NCURSES_CHECK.patch
deleted file mode 100644
index 40810b2..0000000
--- a/package/util-linux/0002-build-sys-cleanup-UL_NCURSES_CHECK.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 862326451184bb0fe9c2b2b110fcfc986f9b1734 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Tue, 13 Dec 2016 12:41:18 +0100
-Subject: [PATCH] build-sys: cleanup UL_NCURSES_CHECK
-
-* use SUFFIX for upper-case suffix
-* use AC_CHECK_TOOL() to search for ncurses-config (thanks to Mike Frysinger)
-* separate checks by AS_IF()
-
-Signed-off-by: Karel Zak <kzak@redhat.com>
----
- m4/ul.m4 | 54 +++++++++++++++++++++++++++++++++---------------------
- 1 file changed, 33 insertions(+), 21 deletions(-)
-
-diff --git a/m4/ul.m4 b/m4/ul.m4
-index 44c721e..f8a0dd7 100644
---- a/m4/ul.m4
-+++ b/m4/ul.m4
-@@ -438,36 +438,48 @@ dnl The expected <name> is ncurses or ncursesw.
- dnl
- AC_DEFUN([UL_NCURSES_CHECK], [
-   m4_define([suffix], $1)
--  m4_define([suffixup], m4_toupper($1))
-+  m4_define([SUFFIX], m4_toupper($1))
- 
--  # pkg-config
--  PKG_CHECK_MODULES(suffixup, [$1], [
-+  # pkg-config (not supported by ncurses upstream by default)
-+  #
-+  PKG_CHECK_MODULES(SUFFIX, [$1], [
-     have_[]suffix=yes
--    NCURSES_LIBS=${suffixup[]_LIBS}
--    NCURSES_CFLAGS=${suffixup[]_CFLAGS}
-+    NCURSES_LIBS=${SUFFIX[]_LIBS}
-+    NCURSES_CFLAGS=${SUFFIX[]_CFLAGS}
-   ],[have_[]suffix=no])
- 
--  # ncurses-config should be everywhere, pkg-config is not supported by default
--  # by ncurses upstream
-+  # ncurses6-config
-   #
-   AS_IF([test "x$have_[]suffix" = xno], [
--    AC_MSG_CHECKING([$1 config])
--    if AC_RUN_LOG([suffix[]6-config --version >/dev/null]); then
-+    AC_CHECK_TOOL(SUFFIX[]6_CONFIG, suffix[]6-config)
-+    if AC_RUN_LOG([$SUFFIX[]6_CONFIG --version >/dev/null]); then
-       have_[]suffix=yes
--      NCURSES_LIBS=`suffix[]6-config --libs`
--      NCURSES_CFLAGS=`suffix[]6-config --cflags`
--      AC_MSG_RESULT([(v6) yes])
--    elif AC_RUN_LOG([suffix[]5-config --version >/dev/null]); then
-+      NCURSES_LIBS=`$SUFFIX[]6_CONFIG --libs`
-+      NCURSES_CFLAGS=`$SUFFIX[]6_CONFIG --cflags`
-+    else
-+      have_[]suffix=no
-+    fi
-+  ])
-+
-+  # ncurses5-config
-+  #
-+  AS_IF([test "x$have_[]suffix" = xno], [
-+    AC_CHECK_TOOL(SUFFIX[]5_CONFIG, suffix[]5-config)
-+    if AC_RUN_LOG([$SUFFIX[]5_CONFIG --version >/dev/null]); then
-       have_[]suffix=yes
--      NCURSES_LIBS=`suffix[]5-config --libs`
--      NCURSES_CFLAGS=`suffix[]5-config --cflags`
--      AC_MSG_RESULT([(v5) yes])
-+      NCURSES_LIBS=`$SUFFIX[]5_CONFIG --libs`
-+      NCURSES_CFLAGS=`$SUFFIX[]5_CONFIG --cflags`
-     else
--      AC_MSG_RESULT([no])
--      AS_IF([test "x$have_[]suffix" = xno], [
--        AC_CHECK_LIB([$1], [initscr], [have_[]suffix=yes], [have_[]suffix=no])
--        AS_IF([test "x$have_[]suffix" = xyes], [NCURSES_LIBS="-l[]suffix"])
--      ])
-+      have_[]suffix=no
-     fi
-   ])
-+
-+  # classic autoconf way
-+  #
-+  AS_IF([test "x$have_[]suffix" = xno], [
-+    AS_IF([test "x$have_[]suffix" = xno], [
-+      AC_CHECK_LIB([$1], [initscr], [have_[]suffix=yes], [have_[]suffix=no])
-+      AS_IF([test "x$have_[]suffix" = xyes], [NCURSES_LIBS="-l[]suffix"])
-+    ])
-+  ])
- ])
--- 
-2.6.2
-
diff --git a/package/util-linux/0003-build-sys-fix-compilation-with-ncurses-and-uClibc-or.patch b/package/util-linux/0003-build-sys-fix-compilation-with-ncurses-and-uClibc-or.patch
deleted file mode 100644
index 2a1e56d..0000000
--- a/package/util-linux/0003-build-sys-fix-compilation-with-ncurses-and-uClibc-or.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 9ea8ded37b648bbd538cbf9c4d144b8b1a93c1b5 Mon Sep 17 00:00:00 2001
-From: Carlos Santos <casantos@datacom.ind.br>
-Date: Thu, 19 Jan 2017 17:27:37 -0200
-Subject: [PATCH] build-sys: fix compilation with ncurses and uClibc or musl
- libc
-
-Compiling util-linux with musl and uClibc-ng toolchains when wide-char
-support is not enabled in ncurses results in compilation failures with
-the following message:
-
-    error: two or more data types in declaration specifiers
-    #define
-     wchar_t char
-
-The problem occurs because util-linux #defines its own wchar_t (as char)
-when configured without widechar support. This conflicts with definition
-of wchar_t contained in stddef.h.
-
-This error can be reproduced running "<toolchain-cc -o test test.c" with
-the following test program:
-
-    #include <ctype.h>
-    #define wchar_t char
-    #include <stddef.h>
-
-    int main()
-    {
-        return 0;
-    }
-
-The only way to avoid the problem it to reorder the inclusion of headers
-in some files under the text-utils directory.
-
-Addresses:
-  http://autobuild.buildroot.net/results/3a2f228e0fa7b5cc28a13d49f48f1a6aef8d9d7a
-  http://autobuild.buildroot.net/results/99e96069f652d511c6212a5bb6be29e68fb1747c
-  http://autobuild.buildroot.net/results/2dc5721aef93b7b410153bafad78248fac3db941
-  http://autobuild.buildroot.net/results/8a9e197ba7a292b18f8c0c36dca974685556a38a
-
-Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
----
- text-utils/colcrt.c | 2 +-
- text-utils/colrm.c  | 2 +-
- text-utils/column.c | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/text-utils/colcrt.c b/text-utils/colcrt.c
-index c6bba4b..346a10f 100644
---- a/text-utils/colcrt.c
-+++ b/text-utils/colcrt.c
-@@ -46,8 +46,8 @@
- #include <getopt.h>
- 
- #include "nls.h"
--#include "widechar.h"
- #include "c.h"
-+#include "widechar.h"
- #include "closestream.h"
- 
- /*
-diff --git a/text-utils/colrm.c b/text-utils/colrm.c
-index 9510b72..d474696 100644
---- a/text-utils/colrm.c
-+++ b/text-utils/colrm.c
-@@ -44,9 +44,9 @@
- #include <unistd.h>
- 
- #include "nls.h"
--#include "widechar.h"
- #include "strutils.h"
- #include "c.h"
-+#include "widechar.h"
- #include "closestream.h"
- 
- /*
-diff --git a/text-utils/column.c b/text-utils/column.c
-index 43b3af5..2eb47a3 100644
---- a/text-utils/column.c
-+++ b/text-utils/column.c
-@@ -50,8 +50,8 @@
- #include <getopt.h>
- 
- #include "nls.h"
--#include "widechar.h"
- #include "c.h"
-+#include "widechar.h"
- #include "xalloc.h"
- #include "strutils.h"
- #include "closestream.h"
--- 
-2.7.4
-
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index 4f19851..ec6cc8e 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/util-linux/v2.29/sha256sums.asc
-sha256 2c59ea67cc7b564104f60532f6e0a95fe17a91acb870ba8fd7e986f273abf9e7  util-linux-2.29.tar.xz
+sha256 0ce40600b934ec2fecfa6bfc4efe6982d051ba96c2832b05201347aec582f54f  util-linux-2.29.1.tar.xz
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 51ece90..53a6d9b 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -5,14 +5,10 @@
 ################################################################################
 
 UTIL_LINUX_VERSION_MAJOR = 2.29
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
-# For 0001-build-sys-prefer-pkg-config-for-ncurses.patch and
-# 0002-build-sys-cleanup-UL_NCURSES_CHECK.patch
-UTIL_LINUX_AUTORECONF = YES
-
 # README.licensing claims that some files are GPLv2-only, but this is not true.
 # Some files are GPLv3+ but only in tests.
 UTIL_LINUX_LICENSE = GPLv2+, BSD-4c, LGPLv2.1+ (libblkid, libfdisk, libmount), BSD-3c (libuuid)
@@ -222,9 +218,3 @@ endif
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-
-# MKINSTALLDIRS comes from tweaked m4/nls.m4, but autoreconf uses staging
-# one, so it disappears
-UTIL_LINUX_INSTALL_STAGING_OPTS += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
-UTIL_LINUX_INSTALL_TARGET_OPTS += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
-HOST_UTIL_LINUX_INSTALL_OPTS += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
-- 
2.10.2
