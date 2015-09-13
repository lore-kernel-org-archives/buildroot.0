From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Sep 2015 23:28:42 +0200
Subject: [Buildroot] [git commit] blackbox: remove deprecated package
Message-ID: <20150913212900.93FFC7FA96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a658c4d178d7de77e5c09c14594cbb4005dbb638
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also update legacy as well.
And remove the BR2_DEPRECATED_SINCE_2014_08 symbol since it's unused
now.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in                                          |    4 -
 Config.in.legacy                                   |    7 ++
 package/Config.in                                  |    1 -
 package/blackbox/0001-Fix-configure-ac.patch       |   34 ------
 package/blackbox/0002-gcc43.patch                  |  106 --------------------
 .../blackbox/0003-gcc46-textpropertytostring.patch |   34 ------
 package/blackbox/Config.in                         |   18 ----
 package/blackbox/blackbox.hash                     |    2 -
 package/blackbox/blackbox.mk                       |   23 ----
 9 files changed, 7 insertions(+), 222 deletions(-)

diff --git a/Config.in b/Config.in
index 8b1bd8d..74aeb46 100644
--- a/Config.in
+++ b/Config.in
@@ -296,10 +296,6 @@ config BR2_DEPRECATED
 
 if BR2_DEPRECATED
 
-config BR2_DEPRECATED_SINCE_2014_08
-	bool
-	default y
-
 config BR2_DEPRECATED_SINCE_2015_02
 	bool
 	default y
diff --git a/Config.in.legacy b/Config.in.legacy
index fbe61d8..18231fd 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.11"
 
+config BR2_PACKAGE_BLACKBOX
+	bool "blackbox package has been removed"
+	select BR2_LEGACY
+	help
+	  Upstream is dead and the package has been deprecated for
+	  some time. There are other alternative maintained WMs.
+
 config BR2_KERNEL_HEADERS_3_0
 	bool "kernel headers version 3.0.x are no longer supported"
 	select BR2_KERNEL_HEADERS_3_2
diff --git a/package/Config.in b/package/Config.in
index 030477a..fc35f12 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -296,7 +296,6 @@ comment "X libraries and helper libraries"
 	source "package/x11r7/xkeyboard-config/Config.in"
 
 comment "X window managers"
-	source "package/blackbox/Config.in"
 	source "package/enlightenment/Config.in"
 	source "package/fluxbox/Config.in"
 	source "package/matchbox/Config.in"
diff --git a/package/blackbox/0001-Fix-configure-ac.patch b/package/blackbox/0001-Fix-configure-ac.patch
deleted file mode 100644
index 1804473..0000000
--- a/package/blackbox/0001-Fix-configure-ac.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-blackbox: merge existing patch and fix lpthread
-
-Merge the current configure patch into this one so it will patch 
-configure.ac instead. Also add pthread to libs to fix a linkage problem.
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---- blackbox-0.70.1/configure.ac.orig	2013-12-17 11:02:38.799055141 +0000
-+++ blackbox-0.70.1/configure.ac	2013-12-17 11:09:08.421204545 +0000
-@@ -8,14 +8,6 @@ AC_CONFIG_SRCDIR([src/blackbox.cc])
- dnl Determine default prefix
- test "x$prefix" = "xNONE" && prefix="$ac_default_prefix"
- 
--dnl Look in the most logical places for external libraries
--CPPFLAGS="$CPPFLAGS -I$prefix/include"
--LDFLAGS="$LDFLAGS -L$prefix/lib"
--if test "x$prefix" != "x/usr/local"; then
--  CPPFLAGS="$CPPFLAGS -I/usr/local/include"
--  LDFLAGS="$LDFLAGS -L/usr/local/lib"
--fi
--
- dnl Locate required external software
- AC_PROG_CC
- 
-@@ -128,6 +120,10 @@ int main(int, char **)
-                   [AC_MSG_RESULT([no])]
-                  )
- 
-+dnl required pthread
-+AC_CHECK_LIB([pthread],
-+	     [pthread_cancel],
-+	     [LIBS="$LIBS -lpthread"])
- dnl needed for some X11 libs
- AC_CHECK_LIB([nsl],
-              [t_open],
diff --git a/package/blackbox/0002-gcc43.patch b/package/blackbox/0002-gcc43.patch
deleted file mode 100644
index 1026bd5..0000000
--- a/package/blackbox/0002-gcc43.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-diff -Naupr blackbox-0.70.1.orig/lib/Image.cc blackbox-0.70.1/lib/Image.cc
---- blackbox-0.70.1.orig/lib/Image.cc	2005-04-08 17:41:09.000000000 +0200
-+++ blackbox-0.70.1/lib/Image.cc	2008-02-24 08:31:28.000000000 +0100
-@@ -42,8 +42,9 @@
- 
- #include <assert.h>
- #include <math.h>
--#include <stdio.h>
--#include <stdlib.h>
-+#include <cstdio>
-+#include <cstdlib>
-+#include <cstring>
- 
- // #define COLORTABLE_DEBUG
- // #define MITSHM_DEBUG
-diff -Naupr blackbox-0.70.1.orig/lib/Resource.cc blackbox-0.70.1/lib/Resource.cc
---- blackbox-0.70.1.orig/lib/Resource.cc	2005-04-06 23:16:50.000000000 +0200
-+++ blackbox-0.70.1/lib/Resource.cc	2008-02-24 08:33:11.000000000 +0100
-@@ -28,7 +28,8 @@
- #include <X11/Xlib.h>
- #include <X11/Xresource.h>
- 
--#include <stdio.h>
-+#include <cstdio>
-+#include <cstring>
- 
- 
- bt::Resource::Resource(void)
-diff -Naupr blackbox-0.70.1.orig/lib/XDG.cc blackbox-0.70.1/lib/XDG.cc
---- blackbox-0.70.1.orig/lib/XDG.cc	2005-04-06 16:04:38.000000000 +0200
-+++ blackbox-0.70.1/lib/XDG.cc	2008-02-24 08:34:11.000000000 +0100
-@@ -25,7 +25,8 @@
- #include "Util.hh"
- #include "XDG.hh"
- 
--#include <stdlib.h>
-+#include <cstdlib>
-+#include <algorithm>
- 
- 
- // make sure directory names end with a slash
-diff -Naupr blackbox-0.70.1.orig/src/BlackboxResource.cc blackbox-0.70.1/src/BlackboxResource.cc
---- blackbox-0.70.1.orig/src/BlackboxResource.cc	2005-10-18 09:34:46.000000000 +0200
-+++ blackbox-0.70.1/src/BlackboxResource.cc	2008-02-24 08:34:49.000000000 +0100
-@@ -33,6 +33,8 @@
- #include <X11/Xutil.h>
- #include <X11/cursorfont.h>
- 
-+#include <cstring>
-+
- 
- BlackboxResource::BlackboxResource(const std::string& rc): rc_file(rc) {
-   screen_resources = 0;
-diff -Naupr blackbox-0.70.1.orig/src/main.cc blackbox-0.70.1/src/main.cc
---- blackbox-0.70.1.orig/src/main.cc	2005-01-03 10:42:57.000000000 +0100
-+++ blackbox-0.70.1/src/main.cc	2008-02-24 08:37:16.000000000 +0100
-@@ -34,7 +34,8 @@
- #include "blackbox.hh"
- #include "../version.h"
- 
--#include <stdio.h>
-+#include <cstdio>
-+#include <cstring>
- 
- 
- static void showHelp(int exitval) {
-diff -Naupr blackbox-0.70.1.orig/src/Screen.cc blackbox-0.70.1/src/Screen.cc
---- blackbox-0.70.1.orig/src/Screen.cc	2005-10-18 10:07:22.000000000 +0200
-+++ blackbox-0.70.1/src/Screen.cc	2008-02-24 08:35:46.000000000 +0100
-@@ -45,8 +45,9 @@
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <assert.h>
--#include <ctype.h>
- #include <dirent.h>
-+#include <cctype>
-+#include <cstring>
- 
- 
- static bool running = true;
-diff -Naupr blackbox-0.70.1.orig/src/ScreenResource.cc blackbox-0.70.1/src/ScreenResource.cc
---- blackbox-0.70.1.orig/src/ScreenResource.cc	2005-04-13 07:54:08.000000000 +0200
-+++ blackbox-0.70.1/src/ScreenResource.cc	2008-02-24 08:36:31.000000000 +0100
-@@ -33,6 +33,8 @@
- 
- #include <assert.h>
- 
-+#include <cstring>
-+
- 
- static const int iconify_width  = 9;
- static const int iconify_height = 9;
-diff -Naupr blackbox-0.70.1.orig/util/bsetroot.cc blackbox-0.70.1/util/bsetroot.cc
---- blackbox-0.70.1.orig/util/bsetroot.cc	2005-03-15 08:01:37.000000000 +0100
-+++ blackbox-0.70.1/util/bsetroot.cc	2008-02-24 08:38:41.000000000 +0100
-@@ -30,7 +30,9 @@
- #include <cctype>
- 
- #include <X11/Xatom.h>
--#include <stdio.h>
-+#include <cstdio>
-+#include <cstdlib>
-+#include <cstring>
- 
- 
- // ignore all X errors
diff --git a/package/blackbox/0003-gcc46-textpropertytostring.patch b/package/blackbox/0003-gcc46-textpropertytostring.patch
deleted file mode 100644
index af03be4..0000000
--- a/package/blackbox/0003-gcc46-textpropertytostring.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-[PATCH] fix build issue with gcc 4.6+
-
-Debian patch from http://patch-tracker.debian.org/patch/series/dl/blackbox/0.70.1-13/textpropertytostring-unconditional.diff
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
-
-Description: Declare bt::textPropertyToString unconditionally.
-Author: Jakub Wilk <jwilk@debian.org>
-Forwarded: no
-Bug-Debian: http://bugs.debian.org/614468
-Last-Update: 2011-03-12
-
---- a/lib/Util.hh
-+++ b/lib/Util.hh
-@@ -25,6 +25,8 @@
- #ifndef __Util_hh
- #define __Util_hh
- 
-+#include <X11/Xutil.h>
-+
- #include <limits.h>
- #include <string>
- 
-@@ -94,10 +96,8 @@
- 
-   std::string tolower(const std::string &string);
- 
--#ifdef _XUTIL_H_
-   std::string textPropertyToString(::Display *display,
-                                    ::XTextProperty& text_prop);
--#endif
- 
- } // namespace bt
- 
diff --git a/package/blackbox/Config.in b/package/blackbox/Config.in
deleted file mode 100644
index 8b61c73..0000000
--- a/package/blackbox/Config.in
+++ /dev/null
@@ -1,18 +0,0 @@
-config BR2_PACKAGE_BLACKBOX
-	bool "blackbox"
-	depends on BR2_PACKAGE_XORG7
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_MMU # fork()
-	# upstream dead since 2005
-	depends on BR2_DEPRECATED_SINCE_2014_08
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	select BR2_PACKAGE_XLIB_LIBX11
-	help
-	  Blackbox is a fast, lightweight window manager for the X
-	  Window System.
-
-	  http://blackboxwm.sourceforge.net/
-
-comment "blackbox needs a toolchain w/ C++"
-	depends on BR2_PACKAGE_XORG7 && BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/blackbox/blackbox.hash b/package/blackbox/blackbox.hash
deleted file mode 100644
index 5aae1a9..0000000
--- a/package/blackbox/blackbox.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed:
-sha256  92c2be347253f29b10063d579b4267a21516cb322a41b5e83d770fa6d44afd21  blackbox-0.70.1.tar.bz2
diff --git a/package/blackbox/blackbox.mk b/package/blackbox/blackbox.mk
deleted file mode 100644
index a73bc5b..0000000
--- a/package/blackbox/blackbox.mk
+++ /dev/null
@@ -1,23 +0,0 @@
-################################################################################
-#
-# blackbox
-#
-################################################################################
-
-BLACKBOX_VERSION = 0.70.1
-BLACKBOX_SOURCE = blackbox-$(BLACKBOX_VERSION).tar.bz2
-BLACKBOX_SITE = http://downloads.sourceforge.net/project/blackboxwm/blackboxwm/Blackbox%20$(BLACKBOX_VERSION)
-BLACKBOX_CONF_OPTS = \
-	--x-includes=$(STAGING_DIR)/usr/include/X11 \
-	--x-libraries=$(STAGING_DIR)/usr/lib
-BLACKBOX_DEPENDENCIES = xlib_libX11
-BLACKBOX_LICENSE = MIT
-BLACKBOX_LICENSE_FILES = LICENSE
-
-ifneq ($(BR2_ENABLE_LOCALE),y)
-BLACKBOX_DEPENDENCIES += libiconv
-endif
-
-BLACKBOX_AUTORECONF = YES
-
-$(eval $(autotools-package))
