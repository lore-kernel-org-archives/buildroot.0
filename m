From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 15 Feb 2015 22:33:00 +0100
Subject: [Buildroot] [PATCH] package/libevent: fix static build
Message-ID: <1424035980-17049-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some reason, libevent silently fail to enable openssl support
even when it's explicitly requested.

Somes flags are missing when checking for zlib and openssl.

Fixes:
http://autobuild.buildroot.net/results/713/71362af474461e99b7c188a316aa644a0faaad2e

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 .../0002-Fix-openssl-check-for-static-build.patch  | 93 ++++++++++++++++++++++
 package/libevent/libevent.mk                       |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 package/libevent/0002-Fix-openssl-check-for-static-build.patch

diff --git a/package/libevent/0002-Fix-openssl-check-for-static-build.patch b/package/libevent/0002-Fix-openssl-check-for-static-build.patch
new file mode 100644
index 0000000..6db0c4d
--- /dev/null
+++ b/package/libevent/0002-Fix-openssl-check-for-static-build.patch
@@ -0,0 +1,93 @@
+From 17e7b2bca663d0f434d35ecc3b3ecead49669ecf Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sun, 15 Feb 2015 19:43:11 +0100
+Subject: [PATCH] Fix openssl check for static build
+
+For some reason, AC_SEARCH_LIBS([inflateEnd], [z] forget to link with -lz
+
+config.log:
+configure:12914: checking for library containing inflateEnd
+configure:12945: Path/to/usr/bin/arm-linux-gcc -o conftest    -Os -g2 -static -Wall -fno-strict-aliasing   -static conftest.c  >&5
+/tmp/cc4iscfI.o: In function `main':
+Path/to/libevent-2.0.22-stable/conftest.c:36: undefined reference to `inflateEnd'
+collect2: error: ld returned 1 exit status
+
+Ditto for AC_SEARCH_LIBS([SSL_new], [ssl] (forget to link with -lssl -lcrypto
+and -lz)
+
+config.log:
+configure:13015: checking for library containing SSL_new
+configure:13046: Path/to/usr/bin/arm-linux-gcc -o conftest    -Os -g2 -static -Wall -fno-strict-aliasing   -static conftest.c  >&5
+/tmp/cc65AA50.o: In function `main':
+Path/to/libevent-2.0.22-stable/conftest.c:38: undefined reference to `SSL_new'
+collect2: error: ld returned 1 exit status
+
+Also add $(ZLIB_LIBS) when linking with ../libevent_openssl.la.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ configure.ac       | 6 +++---
+ sample/Makefile.am | 2 +-
+ test/Makefile.am   | 2 +-
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d42edd8..814bd01 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -147,7 +147,7 @@ if test "x$ac_cv_header_zlib_h" = "xyes"; then
+ dnl Determine if we have zlib for regression tests
+ dnl Don't put this one in LIBS
+ save_LIBS="$LIBS"
+-LIBS=""
++LIBS="-lz"
+ ZLIB_LIBS=""
+ have_zlib=no
+ AC_SEARCH_LIBS([inflateEnd], [z],
+@@ -175,7 +175,7 @@ AC_CHECK_HEADERS([openssl/bio.h])
+ 
+ if test "$enable_openssl" = "yes"; then
+ save_LIBS="$LIBS"
+-LIBS=""
++LIBS="-lssl -lcrypto $ZLIB_LIBS"
+ OPENSSL_LIBS=""
+ have_openssl=no
+ AC_SEARCH_LIBS([SSL_new], [ssl],
+@@ -183,7 +183,7 @@ AC_SEARCH_LIBS([SSL_new], [ssl],
+ 	OPENSSL_LIBS="$LIBS -lcrypto $EV_LIB_GDI $EV_LIB_WS32 $OPENSSL_LIBADD"
+ 	AC_DEFINE(HAVE_OPENSSL, 1, [Define if the system has openssl])],
+ 	[have_openssl=no],
+-	[-lcrypto $EV_LIB_GDI $EV_LIB_WS32 $OPENSSL_LIBADD])
++	[$ZLIB_LIBS -lcrypto $EV_LIB_GDI $EV_LIB_WS32 $OPENSSL_LIBADD])
+ LIBS="$save_LIBS"
+ AC_SUBST(OPENSSL_LIBS)
+ fi
+diff --git a/sample/Makefile.am b/sample/Makefile.am
+index c926f4e..37329ef 100644
+--- a/sample/Makefile.am
++++ b/sample/Makefile.am
+@@ -21,7 +21,7 @@ http_server_SOURCES = http-server.c
+ if OPENSSL
+ noinst_PROGRAMS += le-proxy
+ le_proxy_SOURCES = le-proxy.c
+-le_proxy_LDADD = $(LDADD) ../libevent_openssl.la -lssl -lcrypto ${OPENSSL_LIBADD}
++le_proxy_LDADD = $(LDADD) ../libevent_openssl.la -lssl -lcrypto ${OPENSSL_LIBADD} $(ZLIB_LIBS)
+ endif
+ 
+ verify:
+diff --git a/test/Makefile.am b/test/Makefile.am
+index 0253a49..5b1998e 100644
+--- a/test/Makefile.am
++++ b/test/Makefile.am
+@@ -72,7 +72,7 @@ regress_LDFLAGS = $(PTHREAD_CFLAGS)
+ 
+ if OPENSSL
+ regress_SOURCES += regress_ssl.c
+-regress_LDADD += ../libevent_openssl.la -lssl -lcrypto ${OPENSSL_LIBADD}
++regress_LDADD += ../libevent_openssl.la -lssl -lcrypto ${OPENSSL_LIBADD} $(ZLIB_LIBS)
+ endif
+ 
+ bench_SOURCES = bench.c
+-- 
+1.9.3
+
diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index c50b1d2..d469bd2 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -11,6 +11,7 @@ LIBEVENT_INSTALL_STAGING = YES
 LIBEVENT_LICENSE = BSD-3c, OpenBSD
 LIBEVENT_LICENSE_FILES = LICENSE
 # For 0001-Disable-building-test-programs.patch
+# and 0002-Fix-openssl-check-for-static-build.patch
 LIBEVENT_AUTORECONF = YES
 
 define LIBEVENT_REMOVE_PYSCRIPT
-- 
1.9.3
