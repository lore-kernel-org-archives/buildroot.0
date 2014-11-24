From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Nov 2014 22:04:06 +0100
Subject: [Buildroot] [git commit] mpdecimal: fix build on pure static
	library configurations
Message-ID: <20141124211427.DAB427FED1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4f7249b28172e7687696d8480013714168240cfa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch to mpdecimal that makes it understand
--enable-shared/--disable-shared and --enable-static/--disable-static,
even if mpdecimal isn't using automake/libtool. It allows to build
only the static variant of the mpdecimal library when needed.

Fixes:

  http://autobuild.buildroot.org/results/276/2764bd8c42ba659682760ffc6afa933b7530d06c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 ...-support-for-enable-disable-shared-static.patch |  101 ++++++++++++++++++++
 package/mpdecimal/mpdecimal.mk                     |    1 +
 2 files changed, 102 insertions(+), 0 deletions(-)

diff --git a/package/mpdecimal/0001-Add-minimal-support-for-enable-disable-shared-static.patch b/package/mpdecimal/0001-Add-minimal-support-for-enable-disable-shared-static.patch
new file mode 100644
index 0000000..630bbd6
--- /dev/null
+++ b/package/mpdecimal/0001-Add-minimal-support-for-enable-disable-shared-static.patch
@@ -0,0 +1,101 @@
+From c349964887901848fb4cd5db53a5bcb6dae27aaa Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 23 Nov 2014 10:16:33 +0100
+Subject: [PATCH] Add minimal support for --{enable,disable}-{shared,static}
+
+mpdecimal uses autoconf, but not automake or libtool, so this commit
+adds some basic handling of --{enable,disable}-{shared,static}, so
+that building the shared library can be disabled in pure static
+library contexts.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile.in          |  6 ++++++
+ configure.ac         | 13 +++++++++++++
+ libmpdec/Makefile.in | 11 ++++++++++-
+ 3 files changed, 29 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 2c91891..0c44f36 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -9,6 +9,8 @@ LIBSTATIC = @LIBSTATIC@
+ LIBSONAME = @LIBSONAME@
+ LIBSHARED = @LIBSHARED@
+ INSTALL = @INSTALL@
++BUILD_SHARED = @BUILD_SHARED@
++BUILD_STATIC = @BUILD_STATIC@
+ 
+ prefix = @prefix@
+ exec_prefix = @exec_prefix@
+@@ -32,9 +34,13 @@ install: FORCE
+ 	$(INSTALL) -d -m 755 $(DESTDIR)$(includedir)
+ 	$(INSTALL) -m 644 libmpdec/mpdecimal.h $(DESTDIR)$(includedir)
+ 	$(INSTALL) -d -m 755 $(DESTDIR)$(libdir)
++ifeq ($(BUILD_STATIC),yes)
+ 	$(INSTALL) -m 644 libmpdec/$(LIBSTATIC) $(DESTDIR)$(libdir)
++endif
++ifeq ($(BUILD_SHARED),yes)
+ 	$(INSTALL) -m 755 libmpdec/$(LIBSHARED) $(DESTDIR)$(libdir)
+ 	cd $(DESTDIR)$(libdir) && ln -sf $(LIBSHARED) $(LIBSONAME) && ln -sf $(LIBSHARED) libmpdec.so
++endif
+ 	$(INSTALL) -d -m 755 $(DESTDIR)$(docdir)
+ 	cp -R doc/* $(DESTDIR)$(docdir)
+ 
+diff --git a/configure.ac b/configure.ac
+index 7ee8f86..2b3e505 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -88,6 +88,19 @@ CFLAGS="$saved_cflags"
+ AC_PROG_INSTALL
+ AC_SUBST(INSTALL)
+ 
++AC_ARG_ENABLE([shared],
++	[AS_HELP_STRING([--enable-shared], [build shared library])],
++	[BUILD_SHARED=$enableval],
++	[BUILD_SHARED=yes])
++
++AC_ARG_ENABLE([static],
++	[AS_HELP_STRING([--enable-static], [build static library])],
++	[BUILD_STATIC=$enableval],
++	[BUILD_STATIC=yes])
++
++AC_SUBST(BUILD_SHARED)
++AC_SUBST(BUILD_STATIC)
++
+ # _FORTIFY_SOURCE wrappers for memmove and bcopy are incorrect:
+ # http://sourceware.org/ml/libc-alpha/2010-12/msg00009.html
+ AC_MSG_CHECKING(for glibc _FORTIFY_SOURCE/memmove bug)
+diff --git a/libmpdec/Makefile.in b/libmpdec/Makefile.in
+index d9619a3..985c73c 100644
+--- a/libmpdec/Makefile.in
++++ b/libmpdec/Makefile.in
+@@ -7,6 +7,8 @@
+ LIBSTATIC = @LIBSTATIC@
+ LIBSONAME = @LIBSONAME@
+ LIBSHARED = @LIBSHARED@
++BUILD_SHARED = @BUILD_SHARED@
++BUILD_STATIC = @BUILD_STATIC@
+ 
+ CC = @CC@
+ LD = @LD@
+@@ -32,8 +34,15 @@ ifeq ($(MAKECMDGOALS), profile_use)
+   MPD_LDFLAGS += $(MPD_PUSE)
+ endif
+ 
++ifeq ($(BUILD_SHARED),yes)
++TARGETS += $(LIBSHARED)
++endif
++
++ifeq ($(BUILD_STATIC),yes)
++TARGETS += $(LIBSTATIC)
++endif
+ 
+-default: $(LIBSTATIC) $(LIBSHARED)
++default: $(TARGETS)
+ 
+ 
+ OBJS := basearith.o context.o constants.o convolute.o crt.o mpdecimal.o \
+-- 
+2.1.0
+
diff --git a/package/mpdecimal/mpdecimal.mk b/package/mpdecimal/mpdecimal.mk
index fc5f855..8257c8d 100644
--- a/package/mpdecimal/mpdecimal.mk
+++ b/package/mpdecimal/mpdecimal.mk
@@ -10,6 +10,7 @@ MPDECIMAL_INSTALL_STAGING = YES
 MPDECIMAL_LICENSE = BSD-2c
 MPDECIMAL_LICENSE_FILES = LICENSE.txt
 MPDECIMAL_CONF_OPTS = LD="$(TARGET_CC)"
+MPDECIMAL_AUTORECONF = YES
 
 # On i386, by default, mpdecimal tries to uses <fenv.h> which is not
 # available in musl/glibc. So in this case, we tell mpdecimal to use
