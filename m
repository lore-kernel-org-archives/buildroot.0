From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Nov 2020 23:44:11 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/bitcoin: security
 bump to version 0.20.1
Message-ID: <20201113224704.D8C5F81590@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=396ce56ac36431c1dbdf85404b88025fb5b4ae8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

- openssl is not a dependency since version 0.20.0 and
  https://github.com/bitcoin/bitcoin/commit/8983ee3e6dd8ab658bd2caf97c326cc53ea50818
- boost chrono is not needed since version 0.20.0 and
  https://github.com/bitcoin/bitcoin/commit/bd37f2bc26158f85ef1ab73b9ca1fc0da8ea562a
- Update hash of COPYING (update in year:
  https://github.com/bitcoin/bitcoin/commit/8dc9aa90c3c7990dd5b491937ddc0e39bc929d1c)
- Update indentation in hash file (two spaces)
- Tag as a security bump as having an up to date bitcoin is important:
  https://patchwork.ozlabs.org/project/buildroot/patch/20200202085526.35742-1-james.hilliard1 at gmail.com

https://github.com/bitcoin/bitcoin/blob/master/doc/release-notes/release-notes-0.20.1.md
https://github.com/bitcoin/bitcoin/blob/master/doc/release-notes/release-notes-0.20.0.md
https://github.com/bitcoin/bitcoin/blob/master/doc/release-notes/release-notes-0.19.1.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b62e8beea89fc1a2f8b749d5258a3d9984e1da5e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-src-randomenv.cpp-fix-build-on-uclibc.patch | 48 ++++++++++++++++++++++
 package/bitcoin/Config.in                          |  2 -
 package/bitcoin/bitcoin.hash                       |  6 +--
 package/bitcoin/bitcoin.mk                         |  4 +-
 4 files changed, 53 insertions(+), 7 deletions(-)

diff --git a/package/bitcoin/0001-src-randomenv.cpp-fix-build-on-uclibc.patch b/package/bitcoin/0001-src-randomenv.cpp-fix-build-on-uclibc.patch
new file mode 100644
index 0000000000..8038a311d3
--- /dev/null
+++ b/package/bitcoin/0001-src-randomenv.cpp-fix-build-on-uclibc.patch
@@ -0,0 +1,48 @@
+From 330cb33985d0ce97c20f4a0f0bbda0fbffe098d4 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 9 Nov 2020 21:18:40 +0100
+Subject: [PATCH] src/randomenv.cpp: fix build on uclibc
+
+Check for HAVE_STRONG_GETAUXVAL or HAVE_WEAK_GETAUXVAL before using
+getauxval to avoid a build failure on uclibc
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/bitcoin/bitcoin/pull/20358]
+---
+ src/randomenv.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/randomenv.cpp b/src/randomenv.cpp
+index 07122b7f6..5e07c3db4 100644
+--- a/src/randomenv.cpp
++++ b/src/randomenv.cpp
+@@ -53,7 +53,7 @@
+ #include <sys/vmmeter.h>
+ #endif
+ #endif
+-#ifdef __linux__
++#if defined(HAVE_STRONG_GETAUXVAL) || defined(HAVE_WEAK_GETAUXVAL)
+ #include <sys/auxv.h>
+ #endif
+ 
+@@ -326,7 +326,7 @@ void RandAddStaticEnv(CSHA512& hasher)
+     // Bitcoin client version
+     hasher << CLIENT_VERSION;
+ 
+-#ifdef __linux__
++#if defined(HAVE_STRONG_GETAUXVAL) || defined(HAVE_WEAK_GETAUXVAL)
+     // Information available through getauxval()
+ #  ifdef AT_HWCAP
+     hasher << getauxval(AT_HWCAP);
+@@ -346,7 +346,7 @@ void RandAddStaticEnv(CSHA512& hasher)
+     const char* exec_str = (const char*)getauxval(AT_EXECFN);
+     if (exec_str) hasher.Write((const unsigned char*)exec_str, strlen(exec_str) + 1);
+ #  endif
+-#endif // __linux__
++#endif // HAVE_STRONG_GETAUXVAL || HAVE_WEAK_GETAUXVAL
+ 
+ #ifdef HAVE_GETCPUID
+     AddAllCPUID(hasher);
+-- 
+2.28.0
+
diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
index 89ee2e3938..65af15293d 100644
--- a/package/bitcoin/Config.in
+++ b/package/bitcoin/Config.in
@@ -18,8 +18,6 @@ config BR2_PACKAGE_BITCOIN
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
-	select BR2_PACKAGE_BOOST_CHRONO
-	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBEVENT
 	help
 	  Bitcoin Core is an open source project which maintains and
diff --git a/package/bitcoin/bitcoin.hash b/package/bitcoin/bitcoin.hash
index fe7c1562a8..d39eb38e92 100644
--- a/package/bitcoin/bitcoin.hash
+++ b/package/bitcoin/bitcoin.hash
@@ -1,5 +1,5 @@
-# From https://bitcoincore.org/bin/bitcoin-core-0.19.0.1/SHA256SUMS.asc
-sha256 7ac9f972249a0a16ed01352ca2a199a5448fe87a4ea74923404a40b4086de284  bitcoin-0.19.0.1.tar.gz
+# From https://bitcoincore.org/bin/bitcoin-core-0.20.1/SHA256SUMS.asc
+sha256  4bbd62fd6acfa5e9864ebf37a24a04bc2dcfe3e3222f056056288d854c53b978  bitcoin-0.20.1.tar.gz
 
 # Hash for license file
-sha256 9a0f75d688e9cf5c69d3efdaa2a83af496700d252b212ec6a72f7784b47fed0c  COPYING
+sha256  96fe807030b21f88305adc32af62f9aa19915f2783509fd6f52aea02cf83f644  COPYING
diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index 040c55b8a6..d5e3973d9c 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-BITCOIN_VERSION = 0.19.0.1
+BITCOIN_VERSION = 0.20.1
 BITCOIN_SITE = https://bitcoincore.org/bin/bitcoin-core-$(BITCOIN_VERSION)
 BITCOIN_AUTORECONF = YES
 BITCOIN_LICENSE = MIT
 BITCOIN_LICENSE_FILES = COPYING
-BITCOIN_DEPENDENCIES = host-pkgconf boost openssl libevent
+BITCOIN_DEPENDENCIES = host-pkgconf boost libevent
 BITCOIN_CONF_OPTS = \
 	--disable-bench \
 	--disable-wallet \
