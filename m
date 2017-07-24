From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 24 Jul 2017 20:36:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/kbd: bump version to 2.0.4
Message-ID: <20170724183621.28461-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patches applied upstream

0001-add-configure-flag-to-disable-tests.patch
https://git.kernel.org/pub/scm/linux/kernel/git/legion/kbd.git/commit/?id=baeb5aa827d956bd06492775dc5bd9f89d394149

0002-Link-against-libintl-when-needed.patch
https://git.kernel.org/pub/scm/linux/kernel/git/legion/kbd.git/commit/?id=b08caa2e3db53ea4263d0236c83a0df11a40a569

Autoreconf is not necessary anymore.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-add-configure-flag-to-disable-tests.patch | 64 ----------------------
 .../0002-Link-against-libintl-when-needed.patch    | 49 -----------------
 package/kbd/kbd.hash                               |  2 +-
 package/kbd/kbd.mk                                 |  3 +-
 4 files changed, 2 insertions(+), 116 deletions(-)
 delete mode 100644 package/kbd/0001-add-configure-flag-to-disable-tests.patch
 delete mode 100644 package/kbd/0002-Link-against-libintl-when-needed.patch

diff --git a/package/kbd/0001-add-configure-flag-to-disable-tests.patch b/package/kbd/0001-add-configure-flag-to-disable-tests.patch
deleted file mode 100644
index 28983e97a..000000000
--- a/package/kbd/0001-add-configure-flag-to-disable-tests.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From baeb5aa827d956bd06492775dc5bd9f89d394149 Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier@gentoo.org>
-Date: Mon, 13 Jul 2015 23:38:41 -0400
-Subject: [PATCH] add configure flag to disable tests
-
-The tests require the check package to be installed.  There is a configure
-test for this package (which is good), but it's unconditional (which is
-bad) as it means you can't even build & install kbd w/out the check
-package being installed.
-
-URL: https://bugs.gentoo.org/485116
-Reported-by: Arfrever Frehtes Taifersar Arahesis <arfrever.fta@gmail.com>
----
- Makefile.am  |  5 ++++-
- configure.ac | 17 +++++++++++++++--
- 2 files changed, 19 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 89c7e83..f855110 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -8,7 +8,10 @@ EXTRA_DIST = \
- 	CREDITS \
- 	contrib docs rc
- 
--SUBDIRS = src data po tests docs
-+SUBDIRS = src data po docs
-+if BUILD_TESTS
-+SUBDIRS += tests
-+endif
- 
- kbd-$(VERSION).tar.xz:
- 	make distcheck
-diff --git a/configure.ac b/configure.ac
-index d0b462b..f659758 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -10,8 +10,21 @@ AC_CONFIG_MACRO_DIR([m4])
- AM_INIT_AUTOMAKE([1.9 -Wall color-tests dist-xz])
- AC_CONFIG_SRCDIR([src/loadkeys.c])
- AC_CONFIG_HEADERS(config.h)
--
--PKG_CHECK_MODULES([CHECK], [check >= 0.9.4])
-+PKG_PROG_PKG_CONFIG
-+
-+AC_ARG_ENABLE(tests,
-+	[AS_HELP_STRING([--disable-tests], [do not build tests])],
-+	[build_tests=$enableval], [build_tests=auto])
-+if test "$build_tests" != "no"; then
-+	PKG_CHECK_MODULES([CHECK], [check >= 0.9.4],
-+		[build_tests="yes"], [
-+			if test "$build_tests" = "yes"; then
-+				AC_MSG_ERROR([tests requested, but check package is missing])
-+			fi
-+			build_tests="no"
-+		])
-+fi
-+AM_CONDITIONAL(BUILD_TESTS, test "$build_tests" != "no")
- 
- m4_ifndef([AM_SILENT_RULES], [m4_define([AM_SILENT_RULES],[])])
- AM_SILENT_RULES([yes])
--- 
-2.6.4
-
diff --git a/package/kbd/0002-Link-against-libintl-when-needed.patch b/package/kbd/0002-Link-against-libintl-when-needed.patch
deleted file mode 100644
index d28f0c809..000000000
--- a/package/kbd/0002-Link-against-libintl-when-needed.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 008e7dc0ae46281360be62b7d69cd13e0a7f7e14 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 7 Feb 2016 18:24:35 +0100
-Subject: [PATCH] Link against libintl when needed
-
-Since the kbd code uses gettext functionality, it should link with the
-libintl library using the @INTLLIBS@ symbol provided by the gettext m4
-macro. This is necessary on C libraries that don't provide a built-in
-gettext functionality, and rely on the libintl library provided by
-gettext, as is the case with the uClibc C library.
-
- at INTLLIBS@ is empty when linking a separate library is not needed, as
-is the case with the glibc C library.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/Makefile.am   | 2 +-
- tests/Makefile.am | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 40e8083..d4e0583 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -80,7 +80,7 @@ mapscrn_CFLAGS = -DMAIN
- loadunimap_CFLAGS = -DMAIN
- 
- noinst_LIBRARIES = libcommon.a libfont.a
--LDADD = libcommon.a libfont.a libkeymap/libkeymap.la
-+LDADD = libcommon.a libfont.a libkeymap/libkeymap.la @INTLLIBS@
- 
- install-exec-hook:
- 	for i in psfaddtable psfgettable psfstriptable; do \
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 1976333..848fd31 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -4,7 +4,7 @@ AM_CPPFLAGS = \
- 	-DDATADIR=\"$(srcdir)\" -DBUILDDIR=\"$(builddir)\"
- 
- AM_CFLAGS = $(CHECK_CFLAGS)
--LDADD  = $(top_builddir)/src/libkeymap/libkeymap.la $(CHECK_LIBS)
-+LDADD  = $(top_builddir)/src/libkeymap/libkeymap.la $(CHECK_LIBS) @INTLLIBS@
- 
- EXTRA_DIST = \
- 	alt-is-meta.in \
--- 
-2.6.4
-
diff --git a/package/kbd/kbd.hash b/package/kbd/kbd.hash
index 39a4cddb6..3fed6ace0 100644
--- a/package/kbd/kbd.hash
+++ b/package/kbd/kbd.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/kbd/sha256sums.asc
-sha256	7a899de1c0eb75f3aea737095a736f2375e1cbfbe693fc14a3fe0bfb4649fb5e	kbd-2.0.3.tar.xz
+sha256 5fd90af6beb225a9bb9b9fb414c090fba53c9a55793e172f508cd43652e59a88  kbd-2.0.4.tar.xz
diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index a4873f3a0..c32d82a3e 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KBD_VERSION = 2.0.3
+KBD_VERSION = 2.0.4
 KBD_SOURCE = kbd-$(KBD_VERSION).tar.xz
 KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
 KBD_CONF_OPTS = \
@@ -15,7 +15,6 @@ KBD_DEPENDENCIES = \
 	host-pkgconf
 KBD_LICENSE = GPL-2.0+
 KBD_LICENSE_FILES = COPYING
-KBD_AUTORECONF = YES
 
 KBD_INSTALL_TARGET_OPTS = MKINSTALLDIRS=$(@D)/config/mkinstalldirs DESTDIR=$(TARGET_DIR) install
 
-- 
2.11.0
