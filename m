From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jan 2016 20:30:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.2.7.6,
	fix musl build
Message-ID: <1454268652-24630-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to
https://gitweb.torproject.org/tor.git/plain/ReleaseNotes?id=tor-0.2.7.6
"Tor 0.2.7.5 is the first stable release in the Tor 0.2.7 series."
so this patch bumps to the stable 2.7 series.

This patch also fixes a musl build error not yet found by the
autobuilders:

  CC       src/common/workqueue.o
src/common/sandbox.c:51:25: fatal error: bits/signum.h: Datei oder Verzeichnis nicht gefunden
 #include <bits/signum.h>
                         ^

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tor/0001-openssl-libz.patch | 63 ++++++++++++++++++++++---------------
 package/tor/tor.hash                |  2 +-
 package/tor/tor.mk                  |  2 +-
 3 files changed, 39 insertions(+), 28 deletions(-)

diff --git a/package/tor/0001-openssl-libz.patch b/package/tor/0001-openssl-libz.patch
index 2aebbf1..855b1c5 100644
--- a/package/tor/0001-openssl-libz.patch
+++ b/package/tor/0001-openssl-libz.patch
@@ -3,14 +3,15 @@ and remove host paths when looking for openssl.
 
 [Vincent:
  - Adapt the patch to make it apply on the new version.]
+[Bernd: rebased for tor-0.2.7.6]
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 
-diff -uNr a/configure.ac b/configure.ac
---- a/configure.ac	2015-06-10 17:01:31.000000000 +0200
-+++ b/configure.ac	2015-06-18 16:22:27.652903761 +0200
-@@ -604,11 +604,11 @@
+diff -uNr tor-0.2.7.6.org/configure.ac tor-0.2.7.6/configure.ac
+--- tor-0.2.7.6.org/configure.ac	2015-12-10 16:15:25.000000000 +0100
++++ tor-0.2.7.6/configure.ac	2016-01-31 20:21:34.850408145 +0100
+@@ -607,11 +607,11 @@
        fi
    ])
  
@@ -24,24 +25,24 @@ diff -uNr a/configure.ac b/configure.ac
  
  dnl XXXX check for OPENSSL_VERSION_NUMBER == SSLeay()
  
-diff -uNr a/src/or/include.am b/src/or/include.am
---- a/src/or/include.am	2015-02-24 16:33:30.000000000 +0100
-+++ b/src/or/include.am	2015-06-18 16:24:10.042349070 +0200
+diff -uNr tor-0.2.7.6.org/src/or/include.am tor-0.2.7.6/src/or/include.am
+--- tor-0.2.7.6.org/src/or/include.am	2015-12-08 18:35:17.000000000 +0100
++++ tor-0.2.7.6/src/or/include.am	2016-01-31 20:22:09.322777527 +0100
 @@ -110,7 +110,7 @@
  src_or_tor_LDADD = src/or/libtor.a src/common/libor.a \
  	src/common/libor-crypto.a $(LIBDONNA) \
- 	src/common/libor-event.a \
+ 	src/common/libor-event.a src/trunnel/libor-trunnel.a \
 -	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ @TOR_OPENSSL_LIBS@ \
 +	@TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ @TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ \
  	@TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@ @TOR_SYSTEMD_LIBS@
  
  if COVERAGE_ENABLED
-diff -uNr a/src/test/include.am b/src/test/include.am
---- a/src/test/include.am	2015-03-10 15:26:37.000000000 +0100
-+++ b/src/test/include.am	2015-06-18 16:28:06.867732744 +0200
-@@ -91,8 +91,8 @@
+diff -uNr tor-0.2.7.6.org/src/test/include.am tor-0.2.7.6/src/test/include.am
+--- tor-0.2.7.6.org/src/test/include.am	2015-12-08 18:35:17.000000000 +0100
++++ tor-0.2.7.6/src/test/include.am	2016-01-31 20:25:59.673127854 +0100
+@@ -127,8 +127,8 @@
  src_test_test_LDADD = src/or/libtor-testing.a src/common/libor-testing.a \
- 	src/common/libor-crypto-testing.a $(LIBDONNA) \
+ 	src/common/libor-crypto-testing.a $(LIBDONNA) src/common/libor.a \
  	src/common/libor-event-testing.a src/trunnel/libor-trunnel-testing.a \
 -	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
 -	@TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@ \
@@ -50,10 +51,10 @@ diff -uNr a/src/test/include.am b/src/test/include.am
  	@TOR_SYSTEMD_LIBS@
  
  src_test_test_slow_CPPFLAGS = $(src_test_test_CPPFLAGS)
-@@ -105,8 +105,8 @@
+@@ -146,8 +146,8 @@
  src_test_bench_LDADD = src/or/libtor.a src/common/libor.a \
  	src/common/libor-crypto.a $(LIBDONNA) \
- 	src/common/libor-event.a \
+ 	src/common/libor-event.a src/trunnel/libor-trunnel.a \
 -	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
 -	@TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@ \
 +	@TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
@@ -61,7 +62,7 @@ diff -uNr a/src/test/include.am b/src/test/include.am
  	@TOR_SYSTEMD_LIBS@
  
  src_test_test_workqueue_LDFLAGS = @TOR_LDFLAGS_zlib@ @TOR_LDFLAGS_openssl@ \
-@@ -115,8 +115,8 @@
+@@ -156,8 +156,8 @@
  	src/common/libor-testing.a \
  	src/common/libor-crypto-testing.a $(LIBDONNA) \
  	src/common/libor-event-testing.a \
@@ -72,7 +73,7 @@ diff -uNr a/src/test/include.am b/src/test/include.am
  
  noinst_HEADERS+= \
  	src/test/fakechans.h \
-@@ -133,8 +133,8 @@
+@@ -174,8 +174,8 @@
  src_test_test_ntor_cl_LDFLAGS = @TOR_LDFLAGS_zlib@ @TOR_LDFLAGS_openssl@
  src_test_test_ntor_cl_LDADD = src/or/libtor.a src/common/libor.a \
  	src/common/libor-crypto.a $(LIBDONNA) \
@@ -82,24 +83,34 @@ diff -uNr a/src/test/include.am b/src/test/include.am
 +	@TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
  src_test_test_ntor_cl_AM_CPPFLAGS =	       \
  	-I"$(top_srcdir)/src/or"
- NTOR_TEST_DEPS=src/test/test-ntor-cl
-diff -uNr a/src/tools/include.am b/src/tools/include.am
---- a/src/tools/include.am	2015-02-24 16:33:31.000000000 +0100
-+++ b/src/tools/include.am	2015-06-18 16:29:48.460515701 +0200
-@@ -9,14 +9,14 @@
+ 
+diff -uNr tor-0.2.7.6.org/src/tools/include.am tor-0.2.7.6/src/tools/include.am
+--- tor-0.2.7.6.org/src/tools/include.am	2015-11-13 14:33:26.000000000 +0100
++++ tor-0.2.7.6/src/tools/include.am	2016-01-31 20:27:29.954004495 +0100
+@@ -21,7 +21,7 @@
  src_tools_tor_gencert_LDFLAGS = @TOR_LDFLAGS_zlib@ @TOR_LDFLAGS_openssl@
  src_tools_tor_gencert_LDADD = src/common/libor.a src/common/libor-crypto.a \
- 	$(LIBDONNA) \
+     $(LIBDONNA) \
+-        @TOR_LIB_MATH@ @TOR_ZLIB_LIBS@ @TOR_OPENSSL_LIBS@ \
++        @TOR_LIB_MATH@ @TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ \
+         @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
+ 
+ if COVERAGE_ENABLED
+@@ -32,7 +32,7 @@
+ src_tools_tor_cov_gencert_LDADD = src/common/libor-testing.a \
+     src/common/libor-crypto-testing.a \
+     $(LIBDONNA) \
 -        @TOR_LIB_MATH@ @TOR_ZLIB_LIBS@ @TOR_OPENSSL_LIBS@ \
 +        @TOR_LIB_MATH@ @TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ \
          @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
+ endif
  
- src_tools_tor_checkkey_SOURCES = src/tools/tor-checkkey.c
+@@ -40,7 +40,7 @@
  src_tools_tor_checkkey_LDFLAGS = @TOR_LDFLAGS_zlib@ @TOR_LDFLAGS_openssl@
  src_tools_tor_checkkey_LDADD = src/common/libor.a src/common/libor-crypto.a \
- 	$(LIBDONNA) \
+     $(LIBDONNA) \
 -        @TOR_LIB_MATH@ @TOR_ZLIB_LIBS@ @TOR_OPENSSL_LIBS@ \
 +        @TOR_LIB_MATH@ @TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ \
          @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
  
- include src/tools/tor-fw-helper/include.am
+ EXTRA_DIST += src/tools/tor-fw-helper/README
diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 637efe4..a836476 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	0542c0efe43b86619337862fa7eb02c7a74cb23a79d587090628a5f0f1224b8d	tor-0.2.6.10.tar.gz
+sha256	493a8679f904503048114aca6467faef56861206bab8283d858f37141d95105d	tor-0.2.7.6.tar.gz
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 7db0964..f6874a6 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.2.6.10
+TOR_VERSION = 0.2.7.6
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3c
 TOR_LICENSE_FILES = LICENSE
-- 
2.7.0
