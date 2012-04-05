From: Markos Chandras <markos.chandras@imgtec.com>
Date: Thu, 5 Apr 2012 13:28:44 +0100
Subject: [Buildroot] [PATCH] gpsd: Add package version to libgpsmm patch
Message-ID: <1333628924-8966-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If the buildroot infrastructure finds a patch file that contains the
$PKG-$VERSION tuple in the filename, it will only apply this kind of
patches, ignoring the rest of the patches in the package directory.
As a result of which, the gpsd-fix-libgpsmm.patch did not apply
because the gpsd-2.95-navcom.patch satisfies the $PKG-$VERSION convention.
The patch was renamed to match the rest of the patches in the gpsd folder.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/gpsd/gpsd-2.95-fix-libgpsmm.patch |   23 +++++++++++++++++++++++
 package/gpsd/gpsd-fix-libgpsmm.patch      |   23 -----------------------
 2 files changed, 23 insertions(+), 23 deletions(-)
 create mode 100644 package/gpsd/gpsd-2.95-fix-libgpsmm.patch
 delete mode 100644 package/gpsd/gpsd-fix-libgpsmm.patch

diff --git a/package/gpsd/gpsd-2.95-fix-libgpsmm.patch b/package/gpsd/gpsd-2.95-fix-libgpsmm.patch
new file mode 100644
index 0000000..893965e
--- /dev/null
+++ b/package/gpsd/gpsd-2.95-fix-libgpsmm.patch
@@ -0,0 +1,23 @@
+diff -Nura gpsd-2.95.orig/Makefile.in gpsd-2.95.x/Makefile.in
+--- gpsd-2.95.orig/Makefile.in	2010-07-13 19:48:24.000000000 -0300
++++ gpsd-2.95.x/Makefile.in	2010-07-27 17:40:28.902568874 -0300
+@@ -546,7 +546,7 @@
+ libgps_VERSION__REVISION = 0
+ libgps_VERSION_AGE = 0
+ libgps_VERSION_NUMBER = $(libgps_VERSION_AGE):$(libgps_VERSION__REVISION):$(libgps_VERSION_AGE)
+-libgps_la_LDFLAGS = -version-number $(libgps_VERSION_CURRENT):$(libgps_VERSION__REVISION):$(libgps_VERSION_AGE)
++libgps_la_LDFLAGS = -version-number $(libgps_VERSION_CURRENT):$(libgps_VERSION__REVISION):$(libgps_VERSION_AGE) $(LDFLAGS)
+ lib_LTLIBRARIES = libgps.la libgpsd.la
+ libgps_SONAME = $(shell expr $(libgps_VERSION_CURRENT) - $(libgps_VERSION_AGE))
+ libgps_VERSION = $(libgps_SONAME).$(libgps_VERSION_AGE).$(libgps_VERSION__REVISION)
+@@ -612,8 +612,8 @@
+ libgpsd_la_SOURCES = $(libgpsd_c_sources) $(libgpsd_h_sources) \
+ 				driver_rtcm2.h packet_states.h
+ 
+- at LIBGPSMM_ENABLE_FALSE@libgps_la_LINK = /bin/sh ./libtool --tag=CC --mode=link gcc $(libgps_la_LDFLAGS) -o $@
+- at LIBGPSMM_ENABLE_TRUE@libgps_la_LINK = /bin/sh ./libtool --tag=CXX --mode=link g++ $(libgps_la_LDFLAGS) -o $@
++ at LIBGPSMM_ENABLE_FALSE@libgps_la_LINK = /bin/sh ./libtool --tag=CC --mode=link $(CC) $(libgps_la_LDFLAGS) -o $@
++ at LIBGPSMM_ENABLE_TRUE@libgps_la_LINK = /bin/sh ./libtool --tag=CXX --mode=link $(CXX) $(libgps_la_LDFLAGS) -o $@
+ nodist_libgpsd_la_SOURCES = packet_names.h ais_json.i
+ libgps_la_LIBADD = $(LIBM) $(LIBC) $(LIBNSL) $(LIBSOCKET) $(LIBPTHREAD)
+ libgpsd_la_LIBADD = $(LIBM) $(LIBC) $(LIBNSL) $(LIBSOCKET) $(LIBPTHREAD) $(BLUEZ_LIBS) libgps.la
diff --git a/package/gpsd/gpsd-fix-libgpsmm.patch b/package/gpsd/gpsd-fix-libgpsmm.patch
deleted file mode 100644
index 893965e..0000000
--- a/package/gpsd/gpsd-fix-libgpsmm.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-diff -Nura gpsd-2.95.orig/Makefile.in gpsd-2.95.x/Makefile.in
---- gpsd-2.95.orig/Makefile.in	2010-07-13 19:48:24.000000000 -0300
-+++ gpsd-2.95.x/Makefile.in	2010-07-27 17:40:28.902568874 -0300
-@@ -546,7 +546,7 @@
- libgps_VERSION__REVISION = 0
- libgps_VERSION_AGE = 0
- libgps_VERSION_NUMBER = $(libgps_VERSION_AGE):$(libgps_VERSION__REVISION):$(libgps_VERSION_AGE)
--libgps_la_LDFLAGS = -version-number $(libgps_VERSION_CURRENT):$(libgps_VERSION__REVISION):$(libgps_VERSION_AGE)
-+libgps_la_LDFLAGS = -version-number $(libgps_VERSION_CURRENT):$(libgps_VERSION__REVISION):$(libgps_VERSION_AGE) $(LDFLAGS)
- lib_LTLIBRARIES = libgps.la libgpsd.la
- libgps_SONAME = $(shell expr $(libgps_VERSION_CURRENT) - $(libgps_VERSION_AGE))
- libgps_VERSION = $(libgps_SONAME).$(libgps_VERSION_AGE).$(libgps_VERSION__REVISION)
-@@ -612,8 +612,8 @@
- libgpsd_la_SOURCES = $(libgpsd_c_sources) $(libgpsd_h_sources) \
- 				driver_rtcm2.h packet_states.h
- 
-- at LIBGPSMM_ENABLE_FALSE@libgps_la_LINK = /bin/sh ./libtool --tag=CC --mode=link gcc $(libgps_la_LDFLAGS) -o $@
-- at LIBGPSMM_ENABLE_TRUE@libgps_la_LINK = /bin/sh ./libtool --tag=CXX --mode=link g++ $(libgps_la_LDFLAGS) -o $@
-+ at LIBGPSMM_ENABLE_FALSE@libgps_la_LINK = /bin/sh ./libtool --tag=CC --mode=link $(CC) $(libgps_la_LDFLAGS) -o $@
-+ at LIBGPSMM_ENABLE_TRUE@libgps_la_LINK = /bin/sh ./libtool --tag=CXX --mode=link $(CXX) $(libgps_la_LDFLAGS) -o $@
- nodist_libgpsd_la_SOURCES = packet_names.h ais_json.i
- libgps_la_LIBADD = $(LIBM) $(LIBC) $(LIBNSL) $(LIBSOCKET) $(LIBPTHREAD)
- libgpsd_la_LIBADD = $(LIBM) $(LIBC) $(LIBNSL) $(LIBSOCKET) $(LIBPTHREAD) $(BLUEZ_LIBS) libgps.la
-- 
1.7.1
