From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 25 May 2017 10:47:49 -0400
Subject: [Buildroot] [PATCH 01/01] sngrep: fix wchar detection.
Message-ID: <20170525144749.19333-1-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ncurses detection is currently broken in buildroot.

This patch does the following:
 - Add SNGREP_CHECK_SCRIPT to configure.ac which checks for a
   libname, a function in that library, sets a define if found, and
   if not found, moves on to the next part. This is taken from the
   htop configure.ac.

 - Adds SNGREP_CHECK_LIB to configure.ac which checks for a
   library, a function within that library, sets a define if that function
   is found, and if not found, moves on to the next part.
   This is taken from the htop configure.ac

 - Modifies scrollbar.h and ui_panel.h to include <wctypes.h> instead of
   <ncursesw/ncurses.h> if unicode is supported.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 .../sngrep/0001-fix-ncurses-wchar-detection.patch  | 119 +++++++++++++++++++++
 package/sngrep/sngrep.mk                           |   5 +-
 2 files changed, 123 insertions(+), 1 deletion(-)
 create mode 100644 package/sngrep/0001-fix-ncurses-wchar-detection.patch

diff --git a/package/sngrep/0001-fix-ncurses-wchar-detection.patch b/package/sngrep/0001-fix-ncurses-wchar-detection.patch
new file mode 100644
index 0000000..b387ac5
--- /dev/null
+++ b/package/sngrep/0001-fix-ncurses-wchar-detection.patch
@@ -0,0 +1,119 @@
+From f812ceb065536697b238227b6a1fd432700f4ea9 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@codeblue.com>
+Date: Thu, 25 May 2017 10:13:12 -0400
+Subject: [PATCH] Fix ncurses wchar detection.
+
+Currently ncurses wchar detection relies on the ncurses header
+to be located at wncurses/ncurses.h.  This currently doesn't work
+with buildroot.  This patch fixes detection of the ncurses header
+and the ifdef's in the relevant header files.
+
+Signed-off-by: Adam Duskett <aduskett@codeblue.com>
+---
+ configure.ac           | 47 ++++++++++++++++++++++++++++++++++++++++-------
+ src/curses/scrollbar.h |  5 ++---
+ src/curses/ui_panel.h  |  5 ++---
+ 3 files changed, 44 insertions(+), 13 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0255ad2..7a7f0ab 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -40,6 +40,39 @@ AC_CHECK_HEADER([pcap.h], [], [
+     AC_MSG_ERROR([ You need to have libpcap development files installed to compile sngrep.])
+ ])
+ 
++# SNGREP_CHECK_SCRIPT(LIBNAME, FUNCTION, DEFINE, CONFIG_SCRIPT, ELSE_PART)
++m4_define([SNGREP_CHECK_SCRIPT],
++[
++   if test ! -z "m4_toupper($SNGREP_[$1]_CONFIG_SCRIPT)"; then
++      # to be used to set the path to ncurses*-config when cross-compiling
++      sngrep_config_script=$(m4_toupper($SNGREP_[$1]_CONFIG_SCRIPT) --libs 2> /dev/null)
++   else
++      sngrep_config_script=$([$4] --libs 2> /dev/null)
++   fi
++   sngrep_script_success=no
++   sngrep_save_LDFLAGS="$LDFLAGS"
++   if test ! "x$sngrep_config_script" = x; then
++      LDFLAGS="$sngrep_config_script $LDFLAGS"
++      AC_CHECK_LIB([$1], [$2], [
++         AC_DEFINE([$3], 1, [The library is present.])
++         LIBS="$sngrep_config_script $LIBS "
++         sngrep_script_success=yes
++      ], [])
++      LDFLAGS="$save_LDFLAGS"
++   fi
++   if test "x$sngrep_script_success" = xno; then
++      [$5]
++   fi
++])
++
++# SNGREP_CHECK_LIB(LIBNAME, FUNCTION, DEFINE, ELSE_PART)
++m4_define([SNGREP_CHECK_LIB],
++[
++   AC_CHECK_LIB([$1], [$2], [
++      AC_DEFINE([$3], 1, [The library is present.])
++      LIBS="-l[$1] $LIBS "
++   ], [$4])
++])
+ ####
+ #### Ncurses Wide character support
+ ####
+@@ -53,13 +86,13 @@ AS_IF([test "x$enable_unicode" == "xyes"], [
+ 	# Ncurses with wide-character support
+ 	AC_DEFINE([WITH_UNICODE], [], [Compile With Unicode compatibility])
+ 
+-	AC_CHECK_HEADER([ncursesw/ncurses.h], [], [
+-	    AC_MSG_ERROR([ You need to have ncurses development files installed to compile sngrep.])
+-	])
+-
+-	AC_CHECK_LIB([ncursesw], [initscr], [], [
+-	    AC_MSG_ERROR([ You need to have libncursesw installed to compile sngrep.])
+-	])
++   SNGREP_CHECK_SCRIPT([ncursesw6], [addnwstr], [WITH_UNICODE], "ncursesw6-config",
++    SNGREP_CHECK_SCRIPT([ncursesw], [addnwstr], [WITH_UNICODE], "ncursesw5-config",
++     SNGREP_CHECK_SCRIPT([ncurses], [addnwstr], [WITH_UNICODE], "ncurses5-config",
++      SNGREP_CHECK_LIB([ncursesw6], [addnwstr], [WITH_UNICODE],
++       SNGREP_CHECK_LIB([ncursesw], [addnwstr], [WITH_UNICODE],
++        SNGREP_CHECK_LIB([ncurses], [addnwstr], [WITH_UNICODE],
++	))))))
+ 
+ 	AC_CHECK_LIB([panelw], [new_panel], [], [
+ 	    AC_MSG_ERROR([ You need to have ncurses panelw library installed to compile sngrep.])
+diff --git a/src/curses/scrollbar.h b/src/curses/scrollbar.h
+index 960b936..c9fbfdc 100644
+--- a/src/curses/scrollbar.h
++++ b/src/curses/scrollbar.h
+@@ -32,10 +32,9 @@
+ 
+ #ifdef WITH_UNICODE
+ #define _X_OPEN_SOURCE_EXTENDED
+-#include <ncursesw/ncurses.h>
+-#else
+-#include <ncurses.h>
++#include <wctype.h>
+ #endif
++#include <ncurses.h>
+ 
+ //! Shorter declaration of scrollbar
+ typedef struct scrollbar scrollbar_t;
+diff --git a/src/curses/ui_panel.h b/src/curses/ui_panel.h
+index 9a4082a..549b593 100644
+--- a/src/curses/ui_panel.h
++++ b/src/curses/ui_panel.h
+@@ -33,10 +33,9 @@
+ 
+ #ifdef WITH_UNICODE
+ #define _X_OPEN_SOURCE_EXTENDED
+-#include <ncursesw/ncurses.h>
+-#else
+-#include <ncurses.h>
++#include <wctype.h>
+ #endif
++#include <ncurses.h>
+ #include <panel.h>
+ #include <form.h>
+ #include <stdbool.h>
+-- 
+2.9.4
+
diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index 560872f..9b62408 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -14,8 +14,11 @@ SNGREP_DEPENDENCIES = libpcap ncurses host-pkgconf
 SNGREP_CONF_ENV += \
 	$(if $(BR2_STATIC_LIBS),LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --libs`")
 
-# our ncurses wchar support is not properly detected
+ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
+SNGREP_CONF_OPTS += --enable-unicode
+else
 SNGREP_CONF_OPTS += --disable-unicode
+endif
 
 # openssl and gnutls can't be enabled at the same time.
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.9.4
