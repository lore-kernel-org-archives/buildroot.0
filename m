From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Jun 2015 06:40:09 +0200
Subject: [Buildroot] [git commit] tor: bump to version 0.2.6.9
Message-ID: <20150621044031.0C79E80648@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1a68d105f58ed812b790058616356d8911b96830
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump to version 0.2.6.9
- Update hash file
- Adapt patch to new version

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tor/0001-openssl-libz.patch |   62 ++++++++++++++++++++++-------------
 package/tor/tor.hash                |    2 +-
 package/tor/tor.mk                  |    2 +-
 3 files changed, 41 insertions(+), 25 deletions(-)

diff --git a/package/tor/0001-openssl-libz.patch b/package/tor/0001-openssl-libz.patch
index 802555e..2aebbf1 100644
--- a/package/tor/0001-openssl-libz.patch
+++ b/package/tor/0001-openssl-libz.patch
@@ -1,12 +1,16 @@
 Adjust link order of libz to solve bug with static linking
 and remove host paths when looking for openssl.
 
+[Vincent:
+ - Adapt the patch to make it apply on the new version.]
+
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 
-diff -uNr tor-0.2.5.11.org/configure.ac tor-0.2.5.11/configure.ac
---- tor-0.2.5.11.org/configure.ac	2015-03-12 17:49:50.000000000 +0100
-+++ tor-0.2.5.11/configure.ac	2015-03-29 14:32:05.058142751 +0200
-@@ -559,11 +559,11 @@
+diff -uNr a/configure.ac b/configure.ac
+--- a/configure.ac	2015-06-10 17:01:31.000000000 +0200
++++ b/configure.ac	2015-06-18 16:22:27.652903761 +0200
+@@ -604,11 +604,11 @@
        fi
    ])
  
@@ -20,43 +24,55 @@ diff -uNr tor-0.2.5.11.org/configure.ac tor-0.2.5.11/configure.ac
  
  dnl XXXX check for OPENSSL_VERSION_NUMBER == SSLeay()
  
-diff -uNr tor-0.2.5.11.org/src/or/include.am tor-0.2.5.11/src/or/include.am
---- tor-0.2.5.11.org/src/or/include.am	2015-03-12 17:49:50.000000000 +0100
-+++ tor-0.2.5.11/src/or/include.am	2015-03-29 14:37:35.409997674 +0200
-@@ -115,7 +115,7 @@
+diff -uNr a/src/or/include.am b/src/or/include.am
+--- a/src/or/include.am	2015-02-24 16:33:30.000000000 +0100
++++ b/src/or/include.am	2015-06-18 16:24:10.042349070 +0200
+@@ -110,7 +110,7 @@
  src_or_tor_LDADD = src/or/libtor.a src/common/libor.a \
  	src/common/libor-crypto.a $(LIBDONNA) \
  	src/common/libor-event.a \
 -	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ @TOR_OPENSSL_LIBS@ \
 +	@TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ @TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ \
- 	@TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
+ 	@TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@ @TOR_SYSTEMD_LIBS@
  
  if COVERAGE_ENABLED
-diff -uNr tor-0.2.5.11.org/src/test/include.am tor-0.2.5.11/src/test/include.am
---- tor-0.2.5.11.org/src/test/include.am	2015-03-12 17:49:50.000000000 +0100
-+++ tor-0.2.5.11/src/test/include.am	2015-03-29 14:39:53.264265077 +0200
-@@ -59,16 +59,16 @@
+diff -uNr a/src/test/include.am b/src/test/include.am
+--- a/src/test/include.am	2015-03-10 15:26:37.000000000 +0100
++++ b/src/test/include.am	2015-06-18 16:28:06.867732744 +0200
+@@ -91,8 +91,8 @@
  src_test_test_LDADD = src/or/libtor-testing.a src/common/libor-testing.a \
  	src/common/libor-crypto-testing.a $(LIBDONNA) \
- 	src/common/libor-event-testing.a \
+ 	src/common/libor-event-testing.a src/trunnel/libor-trunnel-testing.a \
 -	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
--	@TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
+-	@TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@ \
 +	@TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
-+	@TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
++	@TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@ \
+ 	@TOR_SYSTEMD_LIBS@
  
- src_test_bench_LDFLAGS = @TOR_LDFLAGS_zlib@ @TOR_LDFLAGS_openssl@ \
-         @TOR_LDFLAGS_libevent@
+ src_test_test_slow_CPPFLAGS = $(src_test_test_CPPFLAGS)
+@@ -105,8 +105,8 @@
  src_test_bench_LDADD = src/or/libtor.a src/common/libor.a \
  	src/common/libor-crypto.a $(LIBDONNA) \
  	src/common/libor-event.a \
 -	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
+-	@TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@ \
++	@TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
++	@TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@ \
+ 	@TOR_SYSTEMD_LIBS@
+ 
+ src_test_test_workqueue_LDFLAGS = @TOR_LDFLAGS_zlib@ @TOR_LDFLAGS_openssl@ \
+@@ -115,8 +115,8 @@
+ 	src/common/libor-testing.a \
+ 	src/common/libor-crypto-testing.a $(LIBDONNA) \
+ 	src/common/libor-event-testing.a \
+-	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
 -	@TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
 +	@TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
 +	@TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
  
  noinst_HEADERS+= \
- 	src/test/test.h
-@@ -79,8 +79,8 @@
+ 	src/test/fakechans.h \
+@@ -133,8 +133,8 @@
  src_test_test_ntor_cl_LDFLAGS = @TOR_LDFLAGS_zlib@ @TOR_LDFLAGS_openssl@
  src_test_test_ntor_cl_LDADD = src/or/libtor.a src/common/libor.a \
  	src/common/libor-crypto.a $(LIBDONNA) \
@@ -67,9 +83,9 @@ diff -uNr tor-0.2.5.11.org/src/test/include.am tor-0.2.5.11/src/test/include.am
  src_test_test_ntor_cl_AM_CPPFLAGS =	       \
  	-I"$(top_srcdir)/src/or"
  NTOR_TEST_DEPS=src/test/test-ntor-cl
-diff -uNr tor-0.2.5.11.org/src/tools/include.am tor-0.2.5.11/src/tools/include.am
---- tor-0.2.5.11.org/src/tools/include.am	2014-06-18 21:11:45.000000000 +0200
-+++ tor-0.2.5.11/src/tools/include.am	2015-03-29 14:41:29.143058949 +0200
+diff -uNr a/src/tools/include.am b/src/tools/include.am
+--- a/src/tools/include.am	2015-02-24 16:33:31.000000000 +0100
++++ b/src/tools/include.am	2015-06-18 16:29:48.460515701 +0200
 @@ -9,14 +9,14 @@
  src_tools_tor_gencert_LDFLAGS = @TOR_LDFLAGS_zlib@ @TOR_LDFLAGS_openssl@
  src_tools_tor_gencert_LDADD = src/common/libor.a src/common/libor-crypto.a \
diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 5cd523f..341a611 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	550fdafffeb4c1e3035bb8cc42e6e49d5af17ad79563bd118af22c1107f72b49	tor-0.2.5.12.tar.gz
+sha256	4a6c29ad89a98d7832c599d9480d6d8e55355fb3b8f4b506c5df557f15942f9c  tor-0.2.6.9.tar.gz
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 2c671ba..9cca011 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.2.5.12
+TOR_VERSION = 0.2.6.9
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3c
 TOR_LICENSE_FILES = LICENSE
