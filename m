From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 May 2012 17:39:15 +0200
Subject: [Buildroot] [git commit] libfcgi: fix build problem of libfcgi++
Message-ID: <20120506153931.44BE696BEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4326f0020d31e17ccdc1ef991bbc50bdddc47abf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the way libfcgi++ is linked against libfcgi to solve the
http://autobuild.buildroot.org/results/f8e88e93f32e4e94ac9aef5a3f3f2826f1970453/build-end.log
build problem.

Since we're fixing Makefile.am, take that opportunity to add -lm where
needed, to avoid the need of using custom LDFLAGS in libfcgi.mk.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../libfcgi/libfcgi-link-against-libfcgi-la.patch  |   20 ++++++
 package/libfcgi/libfcgi-link-against-math.patch    |   28 ++++++++
 package/libfcgi/libfcgi-make-autoreconfable.patch  |   67 ++++++++++++++++++++
 package/libfcgi/libfcgi.mk                         |    2 +-
 4 files changed, 116 insertions(+), 1 deletions(-)

diff --git a/package/libfcgi/libfcgi-link-against-libfcgi-la.patch b/package/libfcgi/libfcgi-link-against-libfcgi-la.patch
new file mode 100644
index 0000000..8a5973a
--- /dev/null
+++ b/package/libfcgi/libfcgi-link-against-libfcgi-la.patch
@@ -0,0 +1,20 @@
+Properly link libfcgi++ against libfcgi
+
+We cannot directly use -lfcgi to link libfcgi++ against libfcgi,
+because libfcgi is not installed at this time. Instead, we should rely
+on libtool doing the right thing, by specifying libfcgi.la in
+libfcgi++ LIBADD variable.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/libfcgi/Makefile.am
+===================================================================
+--- a/libfcgi/Makefile.am
++++ b/libfcgi/Makefile.am
+@@ -23,5 +23,6 @@
+                        $(INCLUDEDIR)/fcgio.h  \
+                        fcgio.cpp
+ libfcgi___la_CFLAGS  = @PTHREAD_CFLAGS@
+-libfcgi___la_LDFLAGS = -lfcgi -rpath @libdir@
++libfcgi___la_LIBADD  = libfcgi.la
++libfcgi___la_LDFLAGS = -rpath @libdir@
diff --git a/package/libfcgi/libfcgi-link-against-math.patch b/package/libfcgi/libfcgi-link-against-math.patch
new file mode 100644
index 0000000..4c87ea6
--- /dev/null
+++ b/package/libfcgi/libfcgi-link-against-math.patch
@@ -0,0 +1,28 @@
+Link against math libraries when needed
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/cgi-fcgi/Makefile.am
+===================================================================
+--- a/cgi-fcgi/Makefile.am
++++ b/cgi-fcgi/Makefile.am
+@@ -11,5 +11,5 @@
+ LIBDIR      = ../libfcgi
+ LIBFCGI     = $(LIBDIR)/libfcgi.la
+ 
+-LDADD = $(LIBFCGI)
++LDADD = $(LIBFCGI) -lm
+ cgi_fcgi_SOURCES = $(INCLUDE_FILES) cgi-fcgi.c
+Index: b/examples/Makefile.am
+===================================================================
+--- a/examples/Makefile.am
++++ b/examples/Makefile.am
+@@ -21,7 +21,7 @@
+ LIBDIR      = ../libfcgi
+ LIBFCGI     = $(LIBDIR)/libfcgi.la
+ 
+-LDADD = $(LIBFCGI)
++LDADD = $(LIBFCGI) -lm
+ 
+ echo_SOURCES       = $(INCLUDE_FILES) echo.c
+ echo_x_SOURCES     = $(INCLUDE_FILES) echo-x.c
diff --git a/package/libfcgi/libfcgi-make-autoreconfable.patch b/package/libfcgi/libfcgi-make-autoreconfable.patch
new file mode 100644
index 0000000..e255fc6
--- /dev/null
+++ b/package/libfcgi/libfcgi-make-autoreconfable.patch
@@ -0,0 +1,67 @@
+Make the package autoreconfigurable
+
+Adjust minor details in Makefile.am and configure.in in order to make
+the package compatible with the autoconf/automake versions we are
+using in Buildroot.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/cgi-fcgi/Makefile.am
+===================================================================
+--- a/cgi-fcgi/Makefile.am
++++ b/cgi-fcgi/Makefile.am
+@@ -2,7 +2,7 @@
+ bin_PROGRAMS     = cgi-fcgi
+ 
+ INCLUDEDIR  = ../include
+-CPPFLAGS    = @CPPFLAGS@ -I$(top_srcdir)/include
++AM_CPPFLAGS = @CPPFLAGS@ -I$(top_srcdir)/include
+ 
+ INCLUDE_FILES   = $(INCLUDEDIR)/fastcgi.h  \
+ 		  $(INCLUDEDIR)/fcgiapp.h  \
+Index: b/configure.in
+===================================================================
+--- a/configure.in
++++ b/configure.in
+@@ -4,12 +4,13 @@
+ dnl     generate the file "configure", which is run during the build
+ dnl     to configure the system for the local environment.
+ 
+-AC_INIT
+-AM_INIT_AUTOMAKE(fcgi, 2.4.0)
++AC_INIT([fcgi], [2.4.0])
++AM_INIT_AUTOMAKE([foreign])
+ 
+ AM_CONFIG_HEADER(fcgi_config.h)
+ 
+ AC_PROG_CC
++AC_PROG_CC_C_O
+ AC_PROG_CPP 
+ AC_PROG_INSTALL 
+ AC_PROG_LIBTOOL
+Index: b/examples/Makefile.am
+===================================================================
+--- a/examples/Makefile.am
++++ b/examples/Makefile.am
+@@ -11,7 +11,7 @@
+ EXTRA_PROGRAMS = threaded echo-cpp
+ 
+ INCLUDEDIR  = ../include
+-CPPFLAGS    = @CPPFLAGS@ -I$(top_srcdir)/include
++AM_CPPFLAGS = @CPPFLAGS@ -I$(top_srcdir)/include
+ 
+ INCLUDE_FILES   = $(INCLUDEDIR)/fastcgi.h    \
+                   $(INCLUDEDIR)/fcgiapp.h    \
+Index: b/libfcgi/Makefile.am
+===================================================================
+--- a/libfcgi/Makefile.am
++++ b/libfcgi/Makefile.am
+@@ -1,7 +1,7 @@
+ # $Id: Makefile.am,v 1.9 2001/12/22 03:16:20 robs Exp $
+ 
+ INCLUDEDIR  = ../include
+-CPPFLAGS    = @CPPFLAGS@ -I$(top_srcdir)/include
++AM_CPPFLAGS = @CPPFLAGS@ -I$(top_srcdir)/include
+ 
+ INCLUDE_FILES = $(INCLUDEDIR)/fastcgi.h     \
+                 $(INCLUDEDIR)/fcgiapp.h     \
diff --git a/package/libfcgi/libfcgi.mk b/package/libfcgi/libfcgi.mk
index 4625165..22ac2f1 100644
--- a/package/libfcgi/libfcgi.mk
+++ b/package/libfcgi/libfcgi.mk
@@ -7,6 +7,6 @@ LIBFCGI_VERSION = 2.4.0
 LIBFCGI_SOURCE = fcgi-$(LIBFCGI_VERSION).tar.gz
 LIBFCGI_SITE = http://www.fastcgi.com/dist
 LIBFCGI_INSTALL_STAGING = YES
-LIBFCGI_CONF_ENV = LDFLAGS="$(TARGET_LDFLAGS) -lm"
+LIBFCGI_AUTORECONF = YES
 
 $(eval $(call AUTOTARGETS))
