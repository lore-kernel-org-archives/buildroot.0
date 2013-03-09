From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 9 Mar 2013 21:15:55 +0100
Subject: [Buildroot] [git commit] libglib2: don't build tests
Message-ID: <20130309201910.059FF9AF33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2d9c65f63f8e5ede6a080d5f2e1a10908d9b2a7e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch that provides an additional --disable-tests option to the
configure script.

Disabling the build of tests has two benefits:
 * Prevents the build of a lot of code that doesn't build on noMMU
   platforms.
 * Reduces the build time.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libglib2/libglib2-no-tests.patch |  117 ++++++++++++++++++++++++++++++
 package/libglib2/libglib2.mk             |    7 ++-
 2 files changed, 123 insertions(+), 1 deletions(-)

diff --git a/package/libglib2/libglib2-no-tests.patch b/package/libglib2/libglib2-no-tests.patch
new file mode 100644
index 0000000..81b5af2
--- /dev/null
+++ b/package/libglib2/libglib2-no-tests.patch
@@ -0,0 +1,117 @@
+Add a --disable-tests option to the configure script
+
+Disabling the build of tests has two benefits:
+ * Prevents the build of a lot of code that doesn't build on noMMU
+   platforms.
+ * Reduces the build time.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: libglib2-2.30.3/Makefile.am
+===================================================================
+--- libglib2-2.30.3.orig/Makefile.am	2012-03-11 22:43:28.000000000 +0100
++++ libglib2-2.30.3/Makefile.am	2013-03-09 17:32:01.000000000 +0100
+@@ -6,7 +6,11 @@
+ 
+ ACLOCAL_AMFLAGS = -I m4macros ${ACLOCAL_FLAGS}
+ 
+-SUBDIRS = . m4macros glib gmodule gthread gobject gio tests po docs
++if BUILD_TESTS
++TEST_SUBDIR = tests
++endif
++
++SUBDIRS = . m4macros glib gmodule gthread gobject gio $(TEST_SUBDIR) po docs
+ DIST_SUBDIRS = $(SUBDIRS) build
+ 
+ bin_SCRIPTS = glib-gettextize
+Index: libglib2-2.30.3/gio/Makefile.am
+===================================================================
+--- libglib2-2.30.3.orig/gio/Makefile.am	2012-03-11 22:44:19.000000000 +0100
++++ libglib2-2.30.3/gio/Makefile.am	2013-03-09 17:32:38.000000000 +0100
+@@ -282,7 +282,11 @@
+ 
+ endif
+ 
+-SUBDIRS += tests
++if BUILD_TESTS
++TEST_SUBDIR = tests
++endif
++
++SUBDIRS += $(TEST_SUBDIR)
+ 
+ libgio_2_0_la_SOURCES =		\
+ 	gappinfo.c 		\
+Index: libglib2-2.30.3/configure.ac
+===================================================================
+--- libglib2-2.30.3.orig/configure.ac	2013-03-09 17:30:55.000000000 +0100
++++ libglib2-2.30.3/configure.ac	2013-03-09 17:37:27.000000000 +0100
+@@ -234,11 +234,18 @@
+               [AC_HELP_STRING([--disable-rebuilds],
+                               [disable all source autogeneration rules])],,
+               [enable_rebuilds=yes])
++AC_ARG_ENABLE(tests,
++		[AC_HELP_STRING([--disable-tests],
++				[disable all tests])],
++		enable_tests=${enableval},
++		enable_tests=yes)
+ 
+ if test "x$enable_threads" != "xyes"; then
+   enable_threads=no
+ fi
+ 
++AM_CONDITIONAL(BUILD_TESTS, [test x$enable_tests = xyes])
++
+ AC_MSG_CHECKING([whether to enable garbage collector friendliness])
+ if test "x$enable_gc_friendly" = "xyes"; then
+   AC_DEFINE(ENABLE_GC_FRIENDLY_DEFAULT, 1, [Whether to enable GC friendliness by default])
+Index: libglib2-2.30.3/glib/Makefile.am
+===================================================================
+--- libglib2-2.30.3.orig/glib/Makefile.am	2012-03-11 22:43:28.000000000 +0100
++++ libglib2-2.30.3/glib/Makefile.am	2013-03-09 18:02:59.000000000 +0100
+@@ -42,7 +42,11 @@
+ gregex_h =
+ endif
+ 
+-SUBDIRS = libcharset $(PRINTF_SUBDIR) $(MAYBE_PCRE) update-pcre . tests
++if BUILD_TESTS
++TEST_SUBDIR = tests
++endif
++
++SUBDIRS = libcharset $(PRINTF_SUBDIR) $(MAYBE_PCRE) update-pcre . $(TEST_SUBDIR)
+ 
+ DIST_SUBDIRS = libcharset gnulib pcre update-pcre tests
+ 
+Index: libglib2-2.30.3/gobject/Makefile.am
+===================================================================
+--- libglib2-2.30.3.orig/gobject/Makefile.am	2012-03-11 22:43:29.000000000 +0100
++++ libglib2-2.30.3/gobject/Makefile.am	2013-03-09 18:03:40.000000000 +0100
+@@ -4,7 +4,11 @@
+ ## Process this file with automake to produce Makefile.in
+ include $(top_srcdir)/Makefile.decl
+ 
+-SUBDIRS = . tests
++if BUILD_TESTS
++TEST_SUBDIR = tests
++endif
++
++SUBDIRS = . $(TEST_SUBDIR)
+ 
+ BUILT_SOURCES=
+ CLEANFILES=
+Index: libglib2-2.30.3/gthread/Makefile.am
+===================================================================
+--- libglib2-2.30.3.orig/gthread/Makefile.am	2012-03-11 22:43:29.000000000 +0100
++++ libglib2-2.30.3/gthread/Makefile.am	2013-03-09 18:04:16.000000000 +0100
+@@ -1,7 +1,11 @@
+ ## Process this file with automake to produce Makefile.in
+ include $(top_srcdir)/Makefile.decl
+ 
+-SUBDIRS = . tests
++if BUILD_TESTS
++TEST_SUBDIR = tests
++endif
++
++SUBDIRS = . $(TEST_SUBDIR)
+ DIST_SUBDIRS = tests
+ 
+ AM_CPPFLAGS = 				\
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 278e635..b108b89 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -9,6 +9,8 @@ LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 
+LIBGLIB2_AUTORECONF = YES
+HOST_LIBGLIB2_AUTORECONF = YES
 LIBGLIB2_INSTALL_STAGING = YES
 LIBGLIB2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
@@ -61,7 +63,10 @@ HOST_LIBGLIB2_CONF_OPT = \
 		--enable-debug=no \
 		--disable-dtrace \
 		--disable-systemtap \
-		--disable-gcov
+		--disable-gcov \
+		--disable-tests
+
+LIBGLIB2_CONF_OPT += --disable-tests
 
 LIBGLIB2_DEPENDENCIES = host-pkgconf host-libglib2 libffi zlib $(if $(BR2_NEEDS_GETTEXT),gettext)
 
