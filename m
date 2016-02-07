From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 18:42:01 +0100
Subject: [Buildroot] [git commit] kbd: bump to 2.0.3 to fix musl build issue
Message-ID: <20160207174236.ADAF481815@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=056c9d28c43c6d665d193635a2f1a03998a852b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

kbd currently doesn't build against musl, due to some issues which
have already been fixed upstream. This commit therefore bumps to the
latest upstream version 2.0.3 to fix the musl build. In order to do
so, this commit also:

 - backports a patch that makes building tests optional, which allows
   to avoid a dependency on the check package

 - updates the libintl patch to work with the latest upstream

Fixes:

  http://autobuild.buildroot.net/results/535/5357953e763a1ac4f17332abac54ce2946629a41/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-add-configure-flag-to-disable-tests.patch | 64 ++++++++++++++++++++++
 package/kbd/0001-link-against-libintl.patch        | 34 ------------
 .../0002-Link-against-libintl-when-needed.patch    | 49 +++++++++++++++++
 package/kbd/kbd.hash                               |  2 +-
 package/kbd/kbd.mk                                 | 11 +++-
 5 files changed, 122 insertions(+), 38 deletions(-)

diff --git a/package/kbd/0001-add-configure-flag-to-disable-tests.patch b/package/kbd/0001-add-configure-flag-to-disable-tests.patch
new file mode 100644
index 0000000..28983e9
--- /dev/null
+++ b/package/kbd/0001-add-configure-flag-to-disable-tests.patch
@@ -0,0 +1,64 @@
+From baeb5aa827d956bd06492775dc5bd9f89d394149 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Mon, 13 Jul 2015 23:38:41 -0400
+Subject: [PATCH] add configure flag to disable tests
+
+The tests require the check package to be installed.  There is a configure
+test for this package (which is good), but it's unconditional (which is
+bad) as it means you can't even build & install kbd w/out the check
+package being installed.
+
+URL: https://bugs.gentoo.org/485116
+Reported-by: Arfrever Frehtes Taifersar Arahesis <arfrever.fta@gmail.com>
+---
+ Makefile.am  |  5 ++++-
+ configure.ac | 17 +++++++++++++++--
+ 2 files changed, 19 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 89c7e83..f855110 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -8,7 +8,10 @@ EXTRA_DIST = \
+ 	CREDITS \
+ 	contrib docs rc
+ 
+-SUBDIRS = src data po tests docs
++SUBDIRS = src data po docs
++if BUILD_TESTS
++SUBDIRS += tests
++endif
+ 
+ kbd-$(VERSION).tar.xz:
+ 	make distcheck
+diff --git a/configure.ac b/configure.ac
+index d0b462b..f659758 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -10,8 +10,21 @@ AC_CONFIG_MACRO_DIR([m4])
+ AM_INIT_AUTOMAKE([1.9 -Wall color-tests dist-xz])
+ AC_CONFIG_SRCDIR([src/loadkeys.c])
+ AC_CONFIG_HEADERS(config.h)
+-
+-PKG_CHECK_MODULES([CHECK], [check >= 0.9.4])
++PKG_PROG_PKG_CONFIG
++
++AC_ARG_ENABLE(tests,
++	[AS_HELP_STRING([--disable-tests], [do not build tests])],
++	[build_tests=$enableval], [build_tests=auto])
++if test "$build_tests" != "no"; then
++	PKG_CHECK_MODULES([CHECK], [check >= 0.9.4],
++		[build_tests="yes"], [
++			if test "$build_tests" = "yes"; then
++				AC_MSG_ERROR([tests requested, but check package is missing])
++			fi
++			build_tests="no"
++		])
++fi
++AM_CONDITIONAL(BUILD_TESTS, test "$build_tests" != "no")
+ 
+ m4_ifndef([AM_SILENT_RULES], [m4_define([AM_SILENT_RULES],[])])
+ AM_SILENT_RULES([yes])
+-- 
+2.6.4
+
diff --git a/package/kbd/0001-link-against-libintl.patch b/package/kbd/0001-link-against-libintl.patch
deleted file mode 100644
index 39fd461..0000000
--- a/package/kbd/0001-link-against-libintl.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Make sure we link against libintl if needed
-
-We modify directly the Makefile.in so that we don't have to
-autoreconfigure the package, which doesn't work because packages using
-gettext need the autopoint tool for their autoregeneration step and
-this thing doesn't work (yet) in Buildroot.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: kbd-1.15.2/src/Makefile.am
-===================================================================
---- kbd-1.15.2.orig/src/Makefile.am	2011-05-22 16:08:51.144530776 +0200
-+++ kbd-1.15.2/src/Makefile.am	2011-05-22 16:09:09.892530778 +0200
-@@ -5,6 +5,8 @@
- AM_CPPFLAGS = -DDATADIR=\"$(datadir)\" -DLOCALEDIR=\"$(localedir)\" $(WARNINGS) \
- 	-funit-at-a-time
- 
-+LDADD = @INTLLIBS@
-+
- OLDPROGS = mapscrn loadunimap
- PROGS = \
- 	dumpkeys loadkeys showkey setfont showconsolefont \
-Index: kbd-1.15.2/src/Makefile.in
-===================================================================
---- kbd-1.15.2.orig/src/Makefile.in	2011-05-22 16:10:27.540530777 +0200
-+++ kbd-1.15.2/src/Makefile.in	2011-05-22 16:10:51.172530778 +0200
-@@ -26,6 +26,7 @@
- install_sh_PROGRAM = $(install_sh) -c
- install_sh_SCRIPT = $(install_sh) -c
- INSTALL_HEADER = $(INSTALL_DATA)
-+LDADD = @INTLLIBS@
- transform = $(program_transform_name)
- NORMAL_INSTALL = :
- PRE_INSTALL = :
diff --git a/package/kbd/0002-Link-against-libintl-when-needed.patch b/package/kbd/0002-Link-against-libintl-when-needed.patch
new file mode 100644
index 0000000..d28f0c8
--- /dev/null
+++ b/package/kbd/0002-Link-against-libintl-when-needed.patch
@@ -0,0 +1,49 @@
+From 008e7dc0ae46281360be62b7d69cd13e0a7f7e14 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 7 Feb 2016 18:24:35 +0100
+Subject: [PATCH] Link against libintl when needed
+
+Since the kbd code uses gettext functionality, it should link with the
+libintl library using the @INTLLIBS@ symbol provided by the gettext m4
+macro. This is necessary on C libraries that don't provide a built-in
+gettext functionality, and rely on the libintl library provided by
+gettext, as is the case with the uClibc C library.
+
+ at INTLLIBS@ is empty when linking a separate library is not needed, as
+is the case with the glibc C library.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/Makefile.am   | 2 +-
+ tests/Makefile.am | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 40e8083..d4e0583 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -80,7 +80,7 @@ mapscrn_CFLAGS = -DMAIN
+ loadunimap_CFLAGS = -DMAIN
+ 
+ noinst_LIBRARIES = libcommon.a libfont.a
+-LDADD = libcommon.a libfont.a libkeymap/libkeymap.la
++LDADD = libcommon.a libfont.a libkeymap/libkeymap.la @INTLLIBS@
+ 
+ install-exec-hook:
+ 	for i in psfaddtable psfgettable psfstriptable; do \
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 1976333..848fd31 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -4,7 +4,7 @@ AM_CPPFLAGS = \
+ 	-DDATADIR=\"$(srcdir)\" -DBUILDDIR=\"$(builddir)\"
+ 
+ AM_CFLAGS = $(CHECK_CFLAGS)
+-LDADD  = $(top_builddir)/src/libkeymap/libkeymap.la $(CHECK_LIBS)
++LDADD  = $(top_builddir)/src/libkeymap/libkeymap.la $(CHECK_LIBS) @INTLLIBS@
+ 
+ EXTRA_DIST = \
+ 	alt-is-meta.in \
+-- 
+2.6.4
+
diff --git a/package/kbd/kbd.hash b/package/kbd/kbd.hash
index c4dfd23..39a4cdd 100644
--- a/package/kbd/kbd.hash
+++ b/package/kbd/kbd.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/kbd/sha256sums.asc
-sha256	400196f5f51f1900ad2df2c02b61945a72e5ccadd7fb7e1f72b3d89bd33debef	kbd-1.15.5.tar.xz
+sha256	7a899de1c0eb75f3aea737095a736f2375e1cbfbe693fc14a3fe0bfb4649fb5e	kbd-2.0.3.tar.xz
diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index dd698a4..8da153f 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -4,12 +4,17 @@
 #
 ################################################################################
 
-KBD_VERSION = 1.15.5
+KBD_VERSION = 2.0.3
 KBD_SOURCE = kbd-$(KBD_VERSION).tar.xz
 KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
-KBD_CONF_OPTS = --disable-vlock
-KBD_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+KBD_CONF_OPTS = \
+	--disable-vlock \
+	--disable-tests
+KBD_DEPENDENCIES = \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
+	host-pkgconf
 KBD_LICENSE = GPLv2+
 KBD_LICENSE_FILES = COPYING
+KBD_AUTORECONF = YES
 
 $(eval $(autotools-package))
