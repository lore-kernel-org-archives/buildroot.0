From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 23:26:25 +0200
Subject: [Buildroot] [git commit] package/dropwatch: remove binutils
 dependency
Message-ID: <20190801212343.2A233813FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=332c7b19927871edfbcedb449b4a4003e52bb34c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to make binutils optional and disable it in the context of
buildroot as suggested by Thomas in
https://patchwork.ozlabs.org/patch/1134299

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../dropwatch/0002-Make-binutils-optional.patch    | 146 +++++++++++++++++++++
 package/dropwatch/Config.in                        |   8 +-
 package/dropwatch/dropwatch.mk                     |   4 +-
 3 files changed, 150 insertions(+), 8 deletions(-)

diff --git a/package/dropwatch/0002-Make-binutils-optional.patch b/package/dropwatch/0002-Make-binutils-optional.patch
new file mode 100644
index 0000000000..2694e99b63
--- /dev/null
+++ b/package/dropwatch/0002-Make-binutils-optional.patch
@@ -0,0 +1,146 @@
+From a9d1b6adb4e47ae89d55274ff3f7121122e15975 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 1 Aug 2019 17:42:16 +0200
+Subject: [PATCH] Make binutils optional
+
+Add an option to enable or disable bfd support to allow the user to use
+dropwatch without binutils
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/nhorman/dropwatch/pull/10]
+---
+ configure.ac     | 10 ++++++++++
+ src/Makefile.am  |  9 +++++++--
+ src/lookup.c     |  8 ++++++++
+ src/lookup.h     |  4 ++++
+ src/lookup_kas.c |  1 -
+ 5 files changed, 29 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 97e21fe..c01a9f4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -17,6 +17,15 @@ PKG_CHECK_MODULES([LIBNL3], [libnl-3.0], [], [AC_MSG_ERROR([libnl-3.0 is require
+ # Fallback on using -lreadline as readline.pc is only available since version 8.0
+ PKG_CHECK_MODULES([READLINE], [readline], [], [READLINE_LIBS=-lreadline])
+ 
++AC_ARG_WITH([bfd],
++	[AS_HELP_STRING([--without-bfd], [Build without bfd library (default: yes)])],
++	[with_bfd=$withval],
++	[with_bfd=yes])
++AS_IF([test "x$with_bfd" != "xno"], [
++	AC_CHECK_HEADERS([bfd.h], [], [AC_MSG_ERROR([Couldn't find or include bfd.h])])
++])
++AM_CONDITIONAL(USE_BFD, test "x$with_bfd" != "xno")
++
+ AC_OUTPUT(Makefile src/Makefile doc/Makefile tests/Makefile)
+ 
+ AC_MSG_NOTICE()
+@@ -25,3 +34,4 @@ AC_MSG_NOTICE([Target:                 $target])
+ AC_MSG_NOTICE([Installation prefix:    $prefix])
+ AC_MSG_NOTICE([Compiler:               $CC])
+ AC_MSG_NOTICE([Compiler flags: $CFLAGS])
++AC_MSG_NOTICE([BFD library support: $with_bfd])
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 16db0b4..994fbd8 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -2,7 +2,12 @@
+ bin_PROGRAMS = dropwatch
+ 
+ AM_CFLAGS = -g -Wall -Werror $(LIBNL3_CFLAGS) $(READLINE_CFLAGS)
+-AM_LDFLAGS = $(LIBNL3_LIBS) -lnl-genl-3 -lbfd $(READLINE_LIBS)
++AM_LDFLAGS = $(LIBNL3_LIBS) -lnl-genl-3 $(READLINE_LIBS)
+ AM_CPPFLAGS = -D_GNU_SOURCE
+ 
+-dropwatch_SOURCES = main.c lookup_bfd.c lookup.c lookup_kas.c
++dropwatch_SOURCES = main.c lookup.c lookup_kas.c
++
++if USE_BFD
++dropwatch_SOURCES += lookup_bfd.c
++AM_LDFLAGS += -lbfd
++endif
+diff --git a/src/lookup.c b/src/lookup.c
+index 521e292..ec5e847 100644
+--- a/src/lookup.c
++++ b/src/lookup.c
+@@ -30,7 +30,9 @@
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <sys/utsname.h>
++#ifdef HAVE_BFD_H
+ #include <bfd.h>
++#endif
+ #include <string.h>
+ #include <unistd.h>
+ #include <sys/types.h>
+@@ -38,7 +40,9 @@
+ 
+ #include "lookup.h"
+ 
++#ifdef HAVE_BFD_H
+ extern struct lookup_methods bfd_methods;
++#endif
+ extern struct lookup_methods kallsym_methods;
+ 
+ static int lookup_null_init(void)
+@@ -75,17 +79,21 @@ int init_lookup(lookup_init_method_t method)
+ 		methods = &null_methods;
+ 		break;
+ 	case METHOD_AUTO:
++#ifdef HAVE_BFD_H
+ 		methods = &bfd_methods;
+ 		if (methods->lookup_init() == 0)
+ 			return 0;
++#endif
+ 		methods = &kallsym_methods;
+ 		if (methods->lookup_init() == 0)
+ 			return 0;
+ 		methods = NULL;
+ 		return -1;
++#ifdef HAVE_BFD_H
+ 	case METHOD_DEBUGINFO:
+ 		methods = &bfd_methods;
+ 		break;
++#endif
+ 	case METHOD_KALLSYMS:
+ 		methods = &kallsym_methods;
+ 		break;
+diff --git a/src/lookup.h b/src/lookup.h
+index e6568d8..2c56a92 100644
+--- a/src/lookup.h
++++ b/src/lookup.h
+@@ -25,6 +25,8 @@
+  * 2) /proc/kallsyms
+  */
+ 
++#include "config.h"
++
+ #include <stdlib.h>
+ #include <asm/types.h>
+ 
+@@ -44,7 +46,9 @@
+ typedef enum {
+ 	METHOD_NULL = 0,
+ 	METHOD_AUTO,
++#ifdef HAVE_BFD_H
+ 	METHOD_DEBUGINFO,
++#endif
+ 	METHOD_KALLSYMS
+ } lookup_init_method_t;
+ 
+diff --git a/src/lookup_kas.c b/src/lookup_kas.c
+index 2300220..9a1a148 100644
+--- a/src/lookup_kas.c
++++ b/src/lookup_kas.c
+@@ -28,7 +28,6 @@
+ #include <stdio.h>
+ #include <stdint.h>
+ #include <sys/utsname.h>
+-#include <bfd.h>
+ #include <string.h>
+ #include <unistd.h>
+ #include <sys/types.h>
+-- 
+2.20.1
+
diff --git a/package/dropwatch/Config.in b/package/dropwatch/Config.in
index 6d021756ee..cf11a03d43 100644
--- a/package/dropwatch/Config.in
+++ b/package/dropwatch/Config.in
@@ -1,9 +1,6 @@
 config BR2_PACKAGE_DROPWATCH
 	bool "dropwatch"
-	depends on !BR2_nios2 # binutils
-	depends on BR2_USE_WCHAR # binutils
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
-	select BR2_PACKAGE_BINUTILS
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_LIBNL
 	help
@@ -12,6 +9,5 @@ config BR2_PACKAGE_DROPWATCH
 
 	  https://github.com/nhorman/dropwatch
 
-comment "dropwatch needs a toolchain w/ threads, wchar"
-	depends on !BR2_nios2
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+comment "dropwatch needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
index bda25dd326..1af61458e0 100644
--- a/package/dropwatch/dropwatch.mk
+++ b/package/dropwatch/dropwatch.mk
@@ -6,8 +6,7 @@
 
 DROPWATCH_VERSION = 1.5.1
 DROPWATCH_SITE = $(call github,nhorman,dropwatch,v$(DROPWATCH_VERSION))
-DROPWATCH_DEPENDENCIES = binutils libnl readline host-pkgconf \
-	$(TARGET_NLS_DEPENDENCIES)
+DROPWATCH_DEPENDENCIES = libnl readline host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 DROPWATCH_LICENSE = GPL-2.0
 DROPWATCH_LICENSE_FILES = COPYING
 # From git
@@ -19,6 +18,7 @@ define DROPWATCH_CREATE_M4_DIR
 endef
 DROPWATCH_PRE_CONFIGURE_HOOKS += DROPWATCH_CREATE_M4_DIR
 
+DROPWATCH_CONF_OPTS = --without-bfd
 DROPWATCH_MAKE_OPTS = LIBS=$(TARGET_NLS_LIBS)
 
 $(eval $(autotools-package))
