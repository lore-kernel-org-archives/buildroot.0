From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 31 May 2012 11:33:00 -0000
Subject: [Buildroot] [git commit] rtorrent: new package
Message-ID: <20120531113257.5380196E2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=54366d812d860aa7de776f14b00d52f89bb52371
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                             |    1 +
 package/rtorrent/Config.in                    |   16 ++++++++++++++
 package/rtorrent/rtorrent-cross_compile.patch |   27 +++++++++++++++++++++++++
 package/rtorrent/rtorrent.mk                  |   12 +++++++++++
 4 files changed, 56 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c3dc715..8cb3b22 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -564,6 +564,7 @@ source "package/radvd/Config.in"
 source "package/rp-pppoe/Config.in"
 source "package/rsh-redone/Config.in"
 source "package/rsync/Config.in"
+source "package/rtorrent/Config.in"
 source "package/samba/Config.in"
 source "package/ser2net/Config.in"
 source "package/socat/Config.in"
diff --git a/package/rtorrent/Config.in b/package/rtorrent/Config.in
new file mode 100644
index 0000000..142ff8b
--- /dev/null
+++ b/package/rtorrent/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_RTORRENT
+	bool "rtorrent"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBSIGC
+	select BR2_PACKAGE_LIBTORRENT
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_OPENSSL
+	help
+	  BitTorrent Client using libtorrent
+
+	  http://libtorrent.rakshasa.no/
+
+comment "rtorrent requires a toolchain with C++ and WCHAR support"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
diff --git a/package/rtorrent/rtorrent-cross_compile.patch b/package/rtorrent/rtorrent-cross_compile.patch
new file mode 100644
index 0000000..2be8d06
--- /dev/null
+++ b/package/rtorrent/rtorrent-cross_compile.patch
@@ -0,0 +1,27 @@
+Fix cross compilation, based on OpenWRT patch.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura rtorrent-0.9.2/configure.ac rtorrent-0.9.2-cross/configure.ac
+--- rtorrent-0.9.2/configure.ac	2012-04-20 03:55:30.000000000 -0300
++++ rtorrent-0.9.2-cross/configure.ac	2012-05-09 11:06:49.436474039 -0300
+@@ -4,7 +4,6 @@
+ 
+ AM_INIT_AUTOMAKE
+ AM_CONFIG_HEADER(config.h)
+-AM_PATH_CPPUNIT(1.9.6)
+ 
+ AC_PROG_CXX
+ AC_PROG_LIBTOOL
+diff -Nura rtorrent-0.9.2/scripts/common.m4 rtorrent-0.9.2-cross/scripts/common.m4
+--- rtorrent-0.9.2/scripts/common.m4	2012-03-13 09:10:49.000000000 -0300
++++ rtorrent-0.9.2-cross/scripts/common.m4	2012-05-09 11:05:56.620102678 -0300
+@@ -223,7 +223,7 @@
+ AC_DEFUN([TORRENT_CHECK_EXECINFO], [
+   AC_MSG_CHECKING(for execinfo.h)
+ 
+-  AC_RUN_IFELSE([AC_LANG_SOURCE([
++  AC_LINK_IFELSE([AC_LANG_SOURCE([
+       #include <execinfo.h>
+       int main() { backtrace((void**)0, 0); backtrace_symbols((char**)0, 0); return 0;}
+       ])],
diff --git a/package/rtorrent/rtorrent.mk b/package/rtorrent/rtorrent.mk
new file mode 100644
index 0000000..f60bd40
--- /dev/null
+++ b/package/rtorrent/rtorrent.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# rtorrent
+#
+#############################################################
+
+RTORRENT_VERSION = 0.9.2
+RTORRENT_SITE = http://libtorrent.rakshasa.no/downloads
+RTORRENT_DEPENDENCIES = host-pkg-config libcurl libsigc libtorrent ncurses
+RTORRENT_AUTORECONF = YES
+
+$(eval $(call AUTOTARGETS))
