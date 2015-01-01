From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 22:35:20 +0100
Subject: [Buildroot] [git commit] bluez5_utils: improved version of the
	mcaptest patch
Message-ID: <20150101213726.8D72780797@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9cfe8ffe2fd565110b193d870060c6a783f81854
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As suggested by bluez5_utils upstream developers, use an improved
version of the mcaptest patch that only conditionally links on librt
instead of unconditionally linking against it (glibc after 2.17 have
clock_getres() in libc and not in librt).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ... 0001-Link-mcaptest-with-lrt-when-needed.patch} |   33 +++++++++++++++-----
 1 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/package/bluez5_utils/0001-Link-mcaptest-with-lrt.patch b/package/bluez5_utils/0001-Link-mcaptest-with-lrt-when-needed.patch
similarity index 54%
rename from package/bluez5_utils/0001-Link-mcaptest-with-lrt.patch
rename to package/bluez5_utils/0001-Link-mcaptest-with-lrt-when-needed.patch
index 9933a08..a36e285 100644
--- a/package/bluez5_utils/0001-Link-mcaptest-with-lrt.patch
+++ b/package/bluez5_utils/0001-Link-mcaptest-with-lrt-when-needed.patch
@@ -1,12 +1,12 @@
-From 2d965dce71df18221e625efbfe380b54e6441d64 Mon Sep 17 00:00:00 2001
+From 54b8977c2f854d04f9c6383e2cac76ea4cde3eaa Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Mon, 29 Dec 2014 12:23:41 +0100
-Subject: [PATCH] Link mcaptest with -lrt
+Subject: [PATCH] Link mcaptest with -lrt when needed
 
 The mcaptest tool uses the profiles/health/mcap.c source file, which
-calls clock_getres(). This function is defined in librt, so mcaptest
-should be linked against librt, otherwise one gets link failures such
-as:
+calls clock_getres(). This function is defined in librt in some C
+libraries, so mcaptest should be linked against librt when needed,
+otherwise one gets link failures such as:
 
 ld: profiles/health/mcap.o: undefined reference to symbol 'clock_getres@@GLIBC_2.2.5'
 ld: note: 'clock_getres@@GLIBC_2.2.5' is defined in DSO [...]/sysroot/lib64/librt.so.1 so try adding it to the linker command line
@@ -17,10 +17,11 @@ Makefile:4184: recipe for target 'tools/mcaptest' failed
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
  Makefile.tools | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ configure.ac   | 5 +++++
+ 2 files changed, 6 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.tools b/Makefile.tools
-index bc827fe..178b773 100644
+index bc827fe..fef3db5 100644
 --- a/Makefile.tools
 +++ b/Makefile.tools
 @@ -195,7 +195,7 @@ tools_mcaptest_SOURCES = tools/mcaptest.c \
@@ -28,10 +29,26 @@ index bc827fe..178b773 100644
  				src/log.c src/log.h \
  				profiles/health/mcap.h profiles/health/mcap.c
 -tools_mcaptest_LDADD = lib/libbluetooth-internal.la @GLIB_LIBS@
-+tools_mcaptest_LDADD = lib/libbluetooth-internal.la @GLIB_LIBS@ -lrt
++tools_mcaptest_LDADD = lib/libbluetooth-internal.la @GLIB_LIBS@ @RT_LIBS@
  
  dist_man_MANS += tools/hciattach.1 tools/hciconfig.1 \
  			tools/hcitool.1 tools/hcidump.1 \
+diff --git a/configure.ac b/configure.ac
+index 4739c10..b0afba6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -54,6 +54,11 @@ AC_CHECK_LIB(pthread, pthread_create, dummy=yes,
+ AC_CHECK_LIB(dl, dlopen, dummy=yes,
+ 			AC_MSG_ERROR(dynamic linking loader is required))
+ 
++AC_SEARCH_LIBS([clock_getres], [rt],
++			[test "$ac_cv_search_clock_getres" = "none required" ||
++			RT_LIBS=$ac_cv_search_clock_getres])
++AC_SUBST([RT_LIBS])
++
+ PKG_CHECK_MODULES(GLIB, glib-2.0 >= 2.28, dummy=yes,
+ 				AC_MSG_ERROR(GLib >= 2.28 is required))
+ AC_SUBST(GLIB_CFLAGS)
 -- 
 2.1.0
 
