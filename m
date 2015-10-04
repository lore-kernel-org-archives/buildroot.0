From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 5 Oct 2015 00:56:15 +0100
Subject: [Buildroot] [PATCH 1/2] libtorrent: bump to version 0.13.6
Message-ID: <1444002976-63670-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump to version 0.13.6.

- Add a hash file.

- Change the website URL to the new official one.

- Help the build system to find the zlib headers, otherwise the
  configure script will fail like this:

    checking if zlib is wanted... yes
    checking for inflateEnd in -lz... no
    checking zlib.h usability... no
    checking zlib.h presence... no
    checking for zlib.h... no
    configure: error: either specify a valid zlib installation with
    --with-zlib=DIR or disable zlib usage with --without-zlib

- Disable instrumentation support by default since it avoids runtime
  failures on rtorrent for some architectures like MIPS, PowerPC or ARM:

    https://github.com/rakshasa/rtorrent/issues/156

- Tweak the 0001-cross_compile.patch for this new version.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libtorrent/0001-cross_compile.patch |   54 ++++++++++++++++++++-------
 package/libtorrent/Config.in                |    2 +-
 package/libtorrent/libtorrent.hash          |    2 +
 package/libtorrent/libtorrent.mk            |   11 +++--
 4 files changed, 50 insertions(+), 19 deletions(-)
 create mode 100644 package/libtorrent/libtorrent.hash

diff --git a/package/libtorrent/0001-cross_compile.patch b/package/libtorrent/0001-cross_compile.patch
index f86f289..abb2438 100644
--- a/package/libtorrent/0001-cross_compile.patch
+++ b/package/libtorrent/0001-cross_compile.patch
@@ -1,22 +1,35 @@
-Fix cross compilation, based on OpenWRT patch.
+From c4cc0ba76c81e1967c648be423f5f0312ac9d87f Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Mon, 5 Oct 2015 00:40:25 +0100
+Subject: [PATCH] Fix cross compilation, based on OpenWRT patch.
+
+[Vincent: tweak the patch for version 0.13.6]
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ configure.ac      |    1 -
+ scripts/checks.m4 |    2 +-
+ scripts/common.m4 |    4 ++--
+ 3 files changed, 3 insertions(+), 4 deletions(-)
 
-diff -Nura libtorrent-0.13.3.orig/configure.ac libtorrent-0.13.3/configure.ac
---- libtorrent-0.13.3.orig/configure.ac	2012-10-31 07:38:59.345752076 -0300
-+++ libtorrent-0.13.3/configure.ac	2012-10-31 07:39:06.454799361 -0300
-@@ -19,7 +19,6 @@
+diff --git a/configure.ac b/configure.ac
+index ba994ee..7696466 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -19,7 +19,6 @@ AC_SUBST(LIBTORRENT_INTERFACE_VERSION_NO)
  
  AM_INIT_AUTOMAKE
- AM_CONFIG_HEADER(config.h)
+ AC_CONFIG_HEADERS(config.h)
 -AM_PATH_CPPUNIT(1.9.6)
  
  AC_PROG_CXX
  
-diff -Nura libtorrent-0.13.3.orig/scripts/checks.m4 libtorrent-0.13.3/scripts/checks.m4
---- libtorrent-0.13.3.orig/scripts/checks.m4	2012-10-31 07:38:59.342752057 -0300
-+++ libtorrent-0.13.3/scripts/checks.m4	2012-10-31 07:39:06.454799361 -0300
-@@ -96,7 +96,7 @@
+diff --git a/scripts/checks.m4 b/scripts/checks.m4
+index 598f39b..0e5abe0 100644
+--- a/scripts/checks.m4
++++ b/scripts/checks.m4
+@@ -96,7 +96,7 @@ AC_DEFUN([TORRENT_CHECK_KQUEUE], [
  AC_DEFUN([TORRENT_CHECK_KQUEUE_SOCKET_ONLY], [
    AC_MSG_CHECKING(whether kqueue supports pipes and ptys)
  
@@ -25,10 +38,11 @@ diff -Nura libtorrent-0.13.3.orig/scripts/checks.m4 libtorrent-0.13.3/scripts/ch
        #include <fcntl.h>
        #include <stdlib.h>
        #include <unistd.h>
-diff -Nura libtorrent-0.13.3.orig/scripts/common.m4 libtorrent-0.13.3/scripts/common.m4
---- libtorrent-0.13.3.orig/scripts/common.m4	2012-10-31 07:38:59.342752057 -0300
-+++ libtorrent-0.13.3/scripts/common.m4	2012-10-31 07:39:32.550972826 -0300
-@@ -223,7 +223,7 @@
+diff --git a/scripts/common.m4 b/scripts/common.m4
+index 5127624..cc68269 100644
+--- a/scripts/common.m4
++++ b/scripts/common.m4
+@@ -223,7 +223,7 @@ dnl   Need to fix this so that it uses the stuff defined by the system.
  AC_DEFUN([TORRENT_CHECK_EXECINFO], [
    AC_MSG_CHECKING(for execinfo.h)
  
@@ -37,3 +51,15 @@ diff -Nura libtorrent-0.13.3.orig/scripts/common.m4 libtorrent-0.13.3/scripts/co
        #include <execinfo.h>
        int main() { backtrace((void**)0, 0); backtrace_symbols((char**)0, 0); return 0;}
        ])],
+@@ -238,7 +238,7 @@ AC_DEFUN([TORRENT_CHECK_EXECINFO], [
+ AC_DEFUN([TORRENT_CHECK_ALIGNED], [
+   AC_MSG_CHECKING(the byte alignment)
+ 
+-  AC_RUN_IFELSE([AC_LANG_SOURCE([
++  AC_LINK_IFELSE([AC_LANG_SOURCE([
+       #include <inttypes.h>
+       int main() {
+         char buf@<:@8@:>@ = { 0, 0, 0, 0, 1, 0, 0, 0 };
+-- 
+1.7.1
+
diff --git a/package/libtorrent/Config.in b/package/libtorrent/Config.in
index aac71fa..02ed73a 100644
--- a/package/libtorrent/Config.in
+++ b/package/libtorrent/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_LIBTORRENT
 	help
 	  BitTorrent library written in C++ for *nix
 
-	  http://libtorrent.rakshasa.no/
+	  http://rtorrent.net/downloads/
 
 comment "libtorrent needs a toolchain w/ C++, threads"
 	depends on BR2_ARCH_HAS_ATOMICS
diff --git a/package/libtorrent/libtorrent.hash b/package/libtorrent/libtorrent.hash
new file mode 100644
index 0000000..73753e9
--- /dev/null
+++ b/package/libtorrent/libtorrent.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 2838a08c96edfd936aff8fbf99ecbb930c2bfca3337dd1482eb5fccdb80d5a04  libtorrent-0.13.6.tar.gz
diff --git a/package/libtorrent/libtorrent.mk b/package/libtorrent/libtorrent.mk
index 5f3920d..9690acb 100644
--- a/package/libtorrent/libtorrent.mk
+++ b/package/libtorrent/libtorrent.mk
@@ -4,12 +4,15 @@
 #
 ################################################################################
 
-LIBTORRENT_VERSION = 0.13.3
-LIBTORRENT_SITE = http://libtorrent.rakshasa.no/downloads
+LIBTORRENT_VERSION = 0.13.6
+LIBTORRENT_SITE = http://rtorrent.net/downloads
 LIBTORRENT_DEPENDENCIES = host-pkgconf libsigc \
-	$(if $(BR2_PACKAGE_OPENSSL),openssl)
+	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
+	$(if $(BR2_PACKAGE_ZLIB),zlib)
 LIBTORRENT_CONF_OPTS = --enable-aligned \
-	$(if $(BR2_PACKAGE_OPENSSL),--enable-openssl,--disable-openssl)
+	--disable-instrumentation \
+	$(if $(BR2_PACKAGE_OPENSSL),--enable-openssl,--disable-openssl) \
+	$(if $(BR2_PACKAGE_ZLIB),--with-zlib=$(STAGING_DIR)/usr,--without-zlib)
 LIBTORRENT_INSTALL_STAGING = YES
 LIBTORRENT_AUTORECONF = YES
 LIBTORRENT_LICENSE = GPLv2
-- 
1.7.1
