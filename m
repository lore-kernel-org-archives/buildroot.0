From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 28 Oct 2020 09:45:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/wavemon: bump to version 0.9.2
Message-ID: <20201028084530.53208-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add two upstream patches and don't autoreconf as the second patch is
also updating configure

https://github.com/uoaerg/wavemon/releases/tag/v0.9.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ....h-add-a-check-for-ncursesw-curses.h.patch | 42 +++++++++++
 ...ude-condition-for-ncursesw-ncurses-h.patch | 73 +++++++++++++++++++
 package/wavemon/wavemon.hash                  |  2 +-
 package/wavemon/wavemon.mk                    |  2 +-
 4 files changed, 117 insertions(+), 2 deletions(-)
 create mode 100644 package/wavemon/0001-wavemon.h-add-a-check-for-ncursesw-curses.h.patch
 create mode 100644 package/wavemon/0002-Build-clarify-include-condition-for-ncursesw-ncurses-h.patch

diff --git a/package/wavemon/0001-wavemon.h-add-a-check-for-ncursesw-curses.h.patch b/package/wavemon/0001-wavemon.h-add-a-check-for-ncursesw-curses.h.patch
new file mode 100644
index 0000000000..4a7ec8e38e
--- /dev/null
+++ b/package/wavemon/0001-wavemon.h-add-a-check-for-ncursesw-curses.h.patch
@@ -0,0 +1,42 @@
+From ce7f9c4da90767bb50e4b80cdb3cee61264d8d12 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 27 Oct 2020 00:18:52 +0100
+Subject: [PATCH] wavemon.h: add a check for <ncursesw/curses.h>
+
+Add a check for <ncursesw/curses.h> before using it to fix a build
+failaure on buildroot where curses.h is not installed under ncursesw
+even when libncursesw is enabled/installed.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/uoaerg/wavemon/commit/ce7f9c4da90767bb50e4b80cdb3cee61264d8d12]
+---
+ configure.ac | 1 +
+ wavemon.h    | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5ad562f..c2a6c76 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -52,6 +52,7 @@ AC_HEADER_STDBOOL
+ 
+ # Tests involving libraries
+ AC_CHECK_LIB([m], [pow], [],              [AC_MSG_ERROR(math library not found)])
++AC_CHECK_HEADERS([ncursesw/curses.h])
+ AC_CHECK_LIB([ncursesw], [waddstr],
+ 	     [],
+ 	     [AC_CHECK_LIB([ncurses], [waddstr], [], [AC_MSG_ERROR(ncurses library not found)])])
+diff --git a/wavemon.h b/wavemon.h
+index baf9dba..e263fef 100644
+--- a/wavemon.h
++++ b/wavemon.h
+@@ -34,7 +34,7 @@
+ #include <ctype.h>
+ #include <math.h>
+ #include <stdbool.h>
+-#ifdef HAVE_LIBNCURSESW
++#ifdef HAVE_NCURSESW_CURSES_H
+ #define _XOPEN_SOURCE_EXTENDED
+ #include <ncursesw/curses.h>
+ #else
diff --git a/package/wavemon/0002-Build-clarify-include-condition-for-ncursesw-ncurses-h.patch b/package/wavemon/0002-Build-clarify-include-condition-for-ncursesw-ncurses-h.patch
new file mode 100644
index 0000000000..20da98645b
--- /dev/null
+++ b/package/wavemon/0002-Build-clarify-include-condition-for-ncursesw-ncurses-h.patch
@@ -0,0 +1,73 @@
+From 31e3def1c7332ad830bd966e7d21b343b4f2da54 Mon Sep 17 00:00:00 2001
+From: Gerrit Renker <gerrit@erg.abdn.ac.uk>
+Date: Tue, 27 Oct 2020 18:18:23 -0400
+Subject: [PATCH] Build: clarify include condition for ncursesw/ncurses.h (#79)
+
+[Retrieved from:
+https://github.com/uoaerg/wavemon/commit/31e3def1c7332ad830bd966e7d21b343b4f2da54]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure    | 12 ++++++++++++
+ configure.ac |  2 +-
+ wavemon.h    |  4 +++-
+ 3 files changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index d16f86a..3ab5115 100755
+--- a/configure
++++ b/configure
+@@ -3644,6 +3644,18 @@ fi
+ 
+ done
+ 
++for ac_header in ncursesw/curses.h
++do :
++  ac_fn_c_check_header_mongrel "$LINENO" "ncursesw/curses.h" "ac_cv_header_ncursesw_curses_h" "$ac_includes_default"
++if test "x$ac_cv_header_ncursesw_curses_h" = xyes; then :
++  cat >>confdefs.h <<_ACEOF
++#define HAVE_NCURSESW_CURSES_H 1
++_ACEOF
++
++fi
++
++done
++
+ 
+ # linux/if.h needs 'struct sockaddr'
+ # linux/wireless.h in turn depends on linux/if.h
+diff --git a/configure.ac b/configure.ac
+index c2a6c76..809596e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -28,6 +28,7 @@ AC_HEADER_TIME
+ AC_CHECK_HEADERS([ncurses.h fcntl.h netdb.h sys/ioctl.h sys/time.h unistd.h\
+ 		  net/if_arp.h netinet/ether.h net/ethernet.h pthread.h],
+ 		 [], [AC_MSG_ERROR($ac_header not found)])
++AC_CHECK_HEADERS([ncursesw/curses.h])
+ 
+ # linux/if.h needs 'struct sockaddr'
+ # linux/wireless.h in turn depends on linux/if.h
+@@ -52,7 +53,6 @@ AC_HEADER_STDBOOL
+ 
+ # Tests involving libraries
+ AC_CHECK_LIB([m], [pow], [],              [AC_MSG_ERROR(math library not found)])
+-AC_CHECK_HEADERS([ncursesw/curses.h])
+ AC_CHECK_LIB([ncursesw], [waddstr],
+ 	     [],
+ 	     [AC_CHECK_LIB([ncurses], [waddstr], [], [AC_MSG_ERROR(ncurses library not found)])])
+diff --git a/wavemon.h b/wavemon.h
+index e263fef..ea2f2f7 100644
+--- a/wavemon.h
++++ b/wavemon.h
+@@ -34,8 +34,10 @@
+ #include <ctype.h>
+ #include <math.h>
+ #include <stdbool.h>
+-#ifdef HAVE_NCURSESW_CURSES_H
++#ifdef HAVE_LIBNCURSESW
+ #define _XOPEN_SOURCE_EXTENDED
++#endif
++#if defined(HAVE_LIBNCURSESW) && defined(HAVE_NCURSESW_CURSES_H)
+ #include <ncursesw/curses.h>
+ #else
+ #include <ncurses.h>
diff --git a/package/wavemon/wavemon.hash b/package/wavemon/wavemon.hash
index 455e64cba8..2533fe2955 100644
--- a/package/wavemon/wavemon.hash
+++ b/package/wavemon/wavemon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5ebd5b79d3b7c546bc16b95161872c699a75e9acdfc6e3f02ec48dad10802067  wavemon-0.9.1.tar.gz
+sha256  13334ff17720ba4d17f4658dd2b93a50a6b5bc0583dedd72b88fd0cb90db686a  wavemon-0.9.2.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/wavemon/wavemon.mk b/package/wavemon/wavemon.mk
index 3ae1141ec4..a27e83c0b5 100644
--- a/package/wavemon/wavemon.mk
+++ b/package/wavemon/wavemon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAVEMON_VERSION = 0.9.1
+WAVEMON_VERSION = 0.9.2
 WAVEMON_SITE = $(call github,uoaerg,wavemon,v$(WAVEMON_VERSION))
 WAVEMON_LICENSE = GPL-3.0+
 WAVEMON_LICENSE_FILES = COPYING
-- 
2.28.0
