From: Louis Rannou <louis.rannou@smile.fr>
Date: Mon, 18 Nov 2019 13:54:34 +0100
Subject: [Buildroot] [PATCH] package/libfcgi: bump to version 2.4.2
Message-ID: <20191118125434.105949-1-louis.rannou@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FCGI is abandonned (https://repo.or.cz/fcgi2.git). Replace it by a maintained
fork (https://github.com/FastCGI-Archives/fcgi2).

Most of the patches are already in the latest version.

Signed-off-by: Louis Rannou <louis.rannou@smile.fr>
---
 package/libfcgi/0001-eof.patch                |  24 ----
 ...ath.patch => 0001-link-against-math.patch} |   8 +-
 ...ples.patch => 0002-disable-examples.patch} |   0
 .../0002-link-against-libfcgi-la.patch        |  20 ----
 .../libfcgi/0004-make-autoreconfable.patch    |  67 -----------
 package/libfcgi/0006-fix-CVE-2012-6687.patch  | 104 ------------------
 package/libfcgi/libfcgi.hash                  |   2 +-
 package/libfcgi/libfcgi.mk                    |   5 +-
 8 files changed, 8 insertions(+), 222 deletions(-)
 delete mode 100644 package/libfcgi/0001-eof.patch
 rename package/libfcgi/{0003-link-against-math.patch => 0001-link-against-math.patch} (74%)
 rename package/libfcgi/{0005-disable-examples.patch => 0002-disable-examples.patch} (100%)
 delete mode 100644 package/libfcgi/0002-link-against-libfcgi-la.patch
 delete mode 100644 package/libfcgi/0004-make-autoreconfable.patch
 delete mode 100644 package/libfcgi/0006-fix-CVE-2012-6687.patch

diff --git a/package/libfcgi/0001-eof.patch b/package/libfcgi/0001-eof.patch
deleted file mode 100644
index e7314265a2..0000000000
--- a/package/libfcgi/0001-eof.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-[PATCH] fix build with C++ support and gcc >= 4.4
-
-EOF is defined in stdio, so ensure it is included.
-
-Based on similar patch by Markus Rothe:
-http://comments.gmane.org/gmane.comp.web.fastcgi.devel/3205
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- libfcgi/fcgio.cpp |    1 +
- 1 file changed, 1 insertion(+)
-
-Index: fcgi-2.4.0/libfcgi/fcgio.cpp
-===================================================================
---- fcgi-2.4.0.orig/libfcgi/fcgio.cpp
-+++ fcgi-2.4.0/libfcgi/fcgio.cpp
-@@ -22,6 +22,7 @@
- #define DLLAPI  __declspec(dllexport)
- #endif
- 
-+#include <cstdio>
- #include <limits.h>
- #include "fcgio.h"
- 
diff --git a/package/libfcgi/0003-link-against-math.patch b/package/libfcgi/0001-link-against-math.patch
similarity index 74%
rename from package/libfcgi/0003-link-against-math.patch
rename to package/libfcgi/0001-link-against-math.patch
index c60c6d50ce..efba67123e 100644
--- a/package/libfcgi/0003-link-against-math.patch
+++ b/package/libfcgi/0001-link-against-math.patch
@@ -1,16 +1,18 @@
 Link libfcgi against the math library.
 
 Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
+[Louis: rebase on top of 2.4.2]
+Signed-off-by: Louis Rannou <louis.rannou@smile.fr>
 
 Index: b/libfcgi/Makefile.am
 ===================================================================
 --- a/libfcgi/Makefile.am
 +++ b/libfcgi/Makefile.am
-@@ -18,6 +18,7 @@
+@@ -18,4 +18,5 @@
                       os_ at SYSTEM@.c
  libfcgi_la_CC      = @PTHREAD_CC@
  libfcgi_la_CFLAGS  = @PTHREAD_CFLAGS@
 +libfcgi_la_LIBADD  = -lm
- 
+ libfcgi_la_LDFLAGS = @EXTRA_LIBS@ -no-undefined
+
  libfcgi___la_SOURCES = $(INCLUDE_FILES)       \
-                        $(INCLUDEDIR)/fcgio.h  \
diff --git a/package/libfcgi/0005-disable-examples.patch b/package/libfcgi/0002-disable-examples.patch
similarity index 100%
rename from package/libfcgi/0005-disable-examples.patch
rename to package/libfcgi/0002-disable-examples.patch
diff --git a/package/libfcgi/0002-link-against-libfcgi-la.patch b/package/libfcgi/0002-link-against-libfcgi-la.patch
deleted file mode 100644
index 8a5973ac5b..0000000000
--- a/package/libfcgi/0002-link-against-libfcgi-la.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Properly link libfcgi++ against libfcgi
-
-We cannot directly use -lfcgi to link libfcgi++ against libfcgi,
-because libfcgi is not installed at this time. Instead, we should rely
-on libtool doing the right thing, by specifying libfcgi.la in
-libfcgi++ LIBADD variable.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/libfcgi/Makefile.am
-===================================================================
---- a/libfcgi/Makefile.am
-+++ b/libfcgi/Makefile.am
-@@ -23,5 +23,6 @@
-                        $(INCLUDEDIR)/fcgio.h  \
-                        fcgio.cpp
- libfcgi___la_CFLAGS  = @PTHREAD_CFLAGS@
--libfcgi___la_LDFLAGS = -lfcgi -rpath @libdir@
-+libfcgi___la_LIBADD  = libfcgi.la
-+libfcgi___la_LDFLAGS = -rpath @libdir@
diff --git a/package/libfcgi/0004-make-autoreconfable.patch b/package/libfcgi/0004-make-autoreconfable.patch
deleted file mode 100644
index e255fc6d3b..0000000000
--- a/package/libfcgi/0004-make-autoreconfable.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-Make the package autoreconfigurable
-
-Adjust minor details in Makefile.am and configure.in in order to make
-the package compatible with the autoconf/automake versions we are
-using in Buildroot.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/cgi-fcgi/Makefile.am
-===================================================================
---- a/cgi-fcgi/Makefile.am
-+++ b/cgi-fcgi/Makefile.am
-@@ -2,7 +2,7 @@
- bin_PROGRAMS     = cgi-fcgi
- 
- INCLUDEDIR  = ../include
--CPPFLAGS    = @CPPFLAGS@ -I$(top_srcdir)/include
-+AM_CPPFLAGS = @CPPFLAGS@ -I$(top_srcdir)/include
- 
- INCLUDE_FILES   = $(INCLUDEDIR)/fastcgi.h  \
- 		  $(INCLUDEDIR)/fcgiapp.h  \
-Index: b/configure.in
-===================================================================
---- a/configure.in
-+++ b/configure.in
-@@ -4,12 +4,13 @@
- dnl     generate the file "configure", which is run during the build
- dnl     to configure the system for the local environment.
- 
--AC_INIT
--AM_INIT_AUTOMAKE(fcgi, 2.4.0)
-+AC_INIT([fcgi], [2.4.0])
-+AM_INIT_AUTOMAKE([foreign])
- 
- AM_CONFIG_HEADER(fcgi_config.h)
- 
- AC_PROG_CC
-+AC_PROG_CC_C_O
- AC_PROG_CPP 
- AC_PROG_INSTALL 
- AC_PROG_LIBTOOL
-Index: b/examples/Makefile.am
-===================================================================
---- a/examples/Makefile.am
-+++ b/examples/Makefile.am
-@@ -11,7 +11,7 @@
- EXTRA_PROGRAMS = threaded echo-cpp
- 
- INCLUDEDIR  = ../include
--CPPFLAGS    = @CPPFLAGS@ -I$(top_srcdir)/include
-+AM_CPPFLAGS = @CPPFLAGS@ -I$(top_srcdir)/include
- 
- INCLUDE_FILES   = $(INCLUDEDIR)/fastcgi.h    \
-                   $(INCLUDEDIR)/fcgiapp.h    \
-Index: b/libfcgi/Makefile.am
-===================================================================
---- a/libfcgi/Makefile.am
-+++ b/libfcgi/Makefile.am
-@@ -1,7 +1,7 @@
- # $Id: Makefile.am,v 1.9 2001/12/22 03:16:20 robs Exp $
- 
- INCLUDEDIR  = ../include
--CPPFLAGS    = @CPPFLAGS@ -I$(top_srcdir)/include
-+AM_CPPFLAGS = @CPPFLAGS@ -I$(top_srcdir)/include
- 
- INCLUDE_FILES = $(INCLUDEDIR)/fastcgi.h     \
-                 $(INCLUDEDIR)/fcgiapp.h     \
diff --git a/package/libfcgi/0006-fix-CVE-2012-6687.patch b/package/libfcgi/0006-fix-CVE-2012-6687.patch
deleted file mode 100644
index 10d33ed58d..0000000000
--- a/package/libfcgi/0006-fix-CVE-2012-6687.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-libfcgi:add security patch for CVE-2012-6687
-CVE-2012-6687 - remote attackers cause a denial of service (crash) via a large number 
-of connections (http://www.cvedetails.com/cve/CVE-2012-6687/).
-Fix:use poll in os_unix.c instead of select to avoid problem with > 1024 connections.
-This patch libfcgi_2.4.0-8.3.debian.tar.xz is pulled from the below link:
-(https://launchpad.net/ubuntu/+source/libfcgi/2.4.0-8.3)
-The next release of libfcgi is 2.4.1 which may have this fix is yet to be released 
-officially.
-
-Signed-off-by: Anton Kortunov <toshic.toshic@gmail.com>
-Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
-
-Index: b/libfcgi/os_unix.c
-===================================================================
---- a/libfcgi/os_unix.c
-+++ b/libfcgi/os_unix.c
-@@ -42,6 +42,7 @@
- #include <sys/time.h>
- #include <sys/un.h>
- #include <signal.h>
-+#include <poll.h>
- 
- #ifdef HAVE_NETDB_H
- #include <netdb.h>
-@@ -103,6 +104,9 @@
- static int shutdownPending = FALSE;
- static int shutdownNow = FALSE;
- 
-+static int libfcgiOsClosePollTimeout = 2000;
-+static int libfcgiIsAfUnixKeeperPollTimeout = 2000;
-+
- void OS_ShutdownPending()
- {
-     shutdownPending = TRUE;
-@@ -168,6 +172,16 @@
-     if(libInitialized)
-         return 0;
- 
-+    char *libfcgiOsClosePollTimeoutStr = getenv( "LIBFCGI_OS_CLOSE_POLL_TIMEOUT" );
-+    if(libfcgiOsClosePollTimeoutStr) {
-+        libfcgiOsClosePollTimeout = atoi(libfcgiOsClosePollTimeoutStr);
-+    }
-+
-+    char *libfcgiIsAfUnixKeeperPollTimeoutStr = getenv( "LIBFCGI_IS_AF_UNIX_KEEPER_POLL_TIMEOUT" );
-+    if(libfcgiIsAfUnixKeeperPollTimeoutStr) {
-+        libfcgiIsAfUnixKeeperPollTimeout = atoi(libfcgiIsAfUnixKeeperPollTimeoutStr);
-+    }
-+
-     asyncIoTable = (AioInfo *)malloc(asyncIoTableSize * sizeof(AioInfo));
-     if(asyncIoTable == NULL) {
-         errno = ENOMEM;
-@@ -755,19 +769,16 @@
- 
-     if (shutdown(fd, 1) == 0)
-     {
--        struct timeval tv;
--        fd_set rfds;
-+        struct pollfd pfd;
-         int rv;
-         char trash[1024];
- 
--        FD_ZERO(&rfds);
-+        pfd.fd = fd;
-+        pfd.events = POLLIN;
- 
-         do 
-         {
--            FD_SET(fd, &rfds);
--            tv.tv_sec = 2;
--            tv.tv_usec = 0;
--            rv = select(fd + 1, &rfds, NULL, NULL, &tv);
-+            rv = poll(&pfd, 1, libfcgiOsClosePollTimeout);
-         }
-         while (rv > 0 && read(fd, trash, sizeof(trash)) > 0);
-     }
-@@ -1116,13 +1127,11 @@
-  */
- static int is_af_unix_keeper(const int fd)
- {
--    struct timeval tval = { READABLE_UNIX_FD_DROP_DEAD_TIMEVAL };
--    fd_set read_fds;
--
--    FD_ZERO(&read_fds);
--    FD_SET(fd, &read_fds);
-+    struct pollfd pfd;
-+    pfd.fd = fd;
-+    pfd.events = POLLIN;
- 
--    return select(fd + 1, &read_fds, NULL, NULL, &tval) >= 0 && FD_ISSET(fd, &read_fds);
-+    return poll(&pfd, 1, libfcgiIsAfUnixKeeperPollTimeout) >= 0 && (pfd.revents & POLLIN);
- }
- 
- /*
-
-Index: b/examples/Makefile.am
-===================================================================
---- a/examples/Makefile.am
-+++ b/examples/Makefile.am
-@@ -34,5 +34,5 @@ threaded_CFLAGS    = @PTHREAD_CFLAGS@
- threaded_LDFLAGS   = @PTHREAD_CFLAGS@ @PTHREAD_LIBS@
- 
- echo_cpp_SOURCES = $(INCLUDE_FILES) $(INCLUDEDIR)/fcgio.h echo-cpp.cpp
--echo_cpp_LDADD   = $(LIBDIR)/libfcgi++.la
-+echo_cpp_LDADD   = $(LIBDIR)/libfcgi++.la $(LIBDIR)/libfcgi.la
diff --git a/package/libfcgi/libfcgi.hash b/package/libfcgi/libfcgi.hash
index 98aa2ecf8f..9c82bf1085 100644
--- a/package/libfcgi/libfcgi.hash
+++ b/package/libfcgi/libfcgi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	66fc45c6b36a21bf2fbbb68e90f780cc21a9da1fffbae75e76d2b4402d3f05b9	fcgi-2.4.0.tar.gz
+sha256	180ba6148fc56fedf60132600bdc444a5faf0618b1fede4d6462289b5d4cafff	libfcgi-2.4.2.tar.gz
 sha256	f0a8fe4513a43e8eebb24cdcf9d2e7efc52e4d8259178c6d76d3d84418397d81	LICENSE.TERMS
diff --git a/package/libfcgi/libfcgi.mk b/package/libfcgi/libfcgi.mk
index 78da772916..c158df2395 100644
--- a/package/libfcgi/libfcgi.mk
+++ b/package/libfcgi/libfcgi.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBFCGI_VERSION = 2.4.0
-LIBFCGI_SOURCE = fcgi-$(LIBFCGI_VERSION).tar.gz
-LIBFCGI_SITE = http://www.fastcgi.com/dist
+LIBFCGI_VERSION = 2.4.2
+LIBFCGI_SITE = $(call github,FastCGI-Archives,fcgi2,$(LIBFCGI_VERSION))
 LIBFCGI_LICENSE = OML
 LIBFCGI_LICENSE_FILES = LICENSE.TERMS
 LIBFCGI_INSTALL_STAGING = YES
-- 
2.24.0
