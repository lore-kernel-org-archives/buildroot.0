From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 5 Oct 2015 00:56:16 +0100
Subject: [Buildroot] [PATCH 2/2] rtorrent: bump to version 0.9.6
In-Reply-To: <1444002976-63670-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1444002976-63670-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1444002976-63670-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump to version 0.9.6

- Add a hash file.

- Change the website URL to the new official one.

- Tweak the 0001-cross_compile.patch for the new version.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/rtorrent/0001-cross_compile.patch |   58 ++++++++++++++++++++++++-----
 package/rtorrent/Config.in                |    2 +-
 package/rtorrent/rtorrent.hash            |    2 +
 package/rtorrent/rtorrent.mk              |    4 +-
 4 files changed, 53 insertions(+), 13 deletions(-)
 create mode 100644 package/rtorrent/rtorrent.hash

diff --git a/package/rtorrent/0001-cross_compile.patch b/package/rtorrent/0001-cross_compile.patch
index 2be8d06..a8ad696 100644
--- a/package/rtorrent/0001-cross_compile.patch
+++ b/package/rtorrent/0001-cross_compile.patch
@@ -1,22 +1,48 @@
-Fix cross compilation, based on OpenWRT patch.
+From d62f7474289970d5be3fd658dd6ace4489408bdf Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Mon, 5 Oct 2015 00:52:26 +0100
+Subject: [PATCH] Fix cross compilation, based on OpenWRT patch.
+
+[Vincent: tweak the patch for version 0.9.6]
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ configure.ac      |    1 -
+ scripts/checks.m4 |    2 +-
+ scripts/common.m4 |    4 ++--
+ 3 files changed, 3 insertions(+), 4 deletions(-)
 
-diff -Nura rtorrent-0.9.2/configure.ac rtorrent-0.9.2-cross/configure.ac
---- rtorrent-0.9.2/configure.ac	2012-04-20 03:55:30.000000000 -0300
-+++ rtorrent-0.9.2-cross/configure.ac	2012-05-09 11:06:49.436474039 -0300
-@@ -4,7 +4,6 @@
+diff --git a/configure.ac b/configure.ac
+index ba5bbf2..0821d4e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -4,7 +4,6 @@ AC_DEFINE(API_VERSION, 9, api version)
  
  AM_INIT_AUTOMAKE
- AM_CONFIG_HEADER(config.h)
+ AC_CONFIG_HEADERS(config.h)
 -AM_PATH_CPPUNIT(1.9.6)
  
  AC_PROG_CXX
  AC_PROG_LIBTOOL
-diff -Nura rtorrent-0.9.2/scripts/common.m4 rtorrent-0.9.2-cross/scripts/common.m4
---- rtorrent-0.9.2/scripts/common.m4	2012-03-13 09:10:49.000000000 -0300
-+++ rtorrent-0.9.2-cross/scripts/common.m4	2012-05-09 11:05:56.620102678 -0300
-@@ -223,7 +223,7 @@
+diff --git a/scripts/checks.m4 b/scripts/checks.m4
+index 598f39b..0e5abe0 100644
+--- a/scripts/checks.m4
++++ b/scripts/checks.m4
+@@ -96,7 +96,7 @@ AC_DEFUN([TORRENT_CHECK_KQUEUE], [
+ AC_DEFUN([TORRENT_CHECK_KQUEUE_SOCKET_ONLY], [
+   AC_MSG_CHECKING(whether kqueue supports pipes and ptys)
+ 
+-  AC_RUN_IFELSE([AC_LANG_SOURCE([
++  AC_LINK_IFELSE([AC_LANG_SOURCE([
+       #include <fcntl.h>
+       #include <stdlib.h>
+       #include <unistd.h>
+diff --git a/scripts/common.m4 b/scripts/common.m4
+index 5127624..cc68269 100644
+--- a/scripts/common.m4
++++ b/scripts/common.m4
+@@ -223,7 +223,7 @@ dnl   Need to fix this so that it uses the stuff defined by the system.
  AC_DEFUN([TORRENT_CHECK_EXECINFO], [
    AC_MSG_CHECKING(for execinfo.h)
  
@@ -25,3 +51,15 @@ diff -Nura rtorrent-0.9.2/scripts/common.m4 rtorrent-0.9.2-cross/scripts/common.
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
diff --git a/package/rtorrent/Config.in b/package/rtorrent/Config.in
index 1798331..77ab595 100644
--- a/package/rtorrent/Config.in
+++ b/package/rtorrent/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_RTORRENT
 	help
 	  BitTorrent Client using libtorrent
 
-	  http://libtorrent.rakshasa.no/
+	  http://rtorrent.net/downloads/
 
 comment "rtorrent needs a toolchain w/ C++, threads, wchar"
 	depends on BR2_USE_MMU
diff --git a/package/rtorrent/rtorrent.hash b/package/rtorrent/rtorrent.hash
new file mode 100644
index 0000000..15257ac
--- /dev/null
+++ b/package/rtorrent/rtorrent.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 1e69c24f1f26f8f07d58d673480dc392bfc4317818c1115265b08a7813ff5b0e  rtorrent-0.9.6.tar.gz
diff --git a/package/rtorrent/rtorrent.mk b/package/rtorrent/rtorrent.mk
index 77f0e85..bedf404 100644
--- a/package/rtorrent/rtorrent.mk
+++ b/package/rtorrent/rtorrent.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RTORRENT_VERSION = 0.9.3
-RTORRENT_SITE = http://libtorrent.rakshasa.no/downloads
+RTORRENT_VERSION = 0.9.6
+RTORRENT_SITE = http://rtorrent.net/downloads
 RTORRENT_DEPENDENCIES = host-pkgconf libcurl libsigc libtorrent ncurses
 RTORRENT_AUTORECONF = YES
 RTORRENT_LICENSE = GPLv2
-- 
1.7.1
