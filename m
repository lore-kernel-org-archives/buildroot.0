From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 31 May 2012 11:33:00 -0000
Subject: [Buildroot] [git commit] libtorrent: new package
Message-ID: <20120531113257.4197796E2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be26c3e760d86dbcc45ce6edd9e266a623c0430d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                 |    1 +
 package/libtorrent/Config.in                      |   11 ++++++++
 package/libtorrent/libtorrent-cross_compile.patch |   27 +++++++++++++++++++++
 package/libtorrent/libtorrent.mk                  |   16 ++++++++++++
 4 files changed, 55 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 9a854f1..c3dc715 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -411,6 +411,7 @@ source "package/libpcap/Config.in"
 source "package/libosip2/Config.in"
 source "package/librsync/Config.in"
 source "package/libsoup/Config.in"
+source "package/libtorrent/Config.in"
 source "package/libupnp/Config.in"
 source "package/libvncserver/Config.in"
 source "package/zeromq/Config.in"
diff --git a/package/libtorrent/Config.in b/package/libtorrent/Config.in
new file mode 100644
index 0000000..f0315a4
--- /dev/null
+++ b/package/libtorrent/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBTORRENT
+	bool "libtorrent"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LIBSIGC
+	help
+	  BitTorrent library written in C++ for *nix
+
+	  http://libtorrent.rakshasa.no/
+
+comment "libtorrent requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libtorrent/libtorrent-cross_compile.patch b/package/libtorrent/libtorrent-cross_compile.patch
new file mode 100644
index 0000000..39fe700
--- /dev/null
+++ b/package/libtorrent/libtorrent-cross_compile.patch
@@ -0,0 +1,27 @@
+Fix cross compilation, based on OpenWRT patch.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura libtorrent-0.13.2/configure.ac libtorrent-0.13.2-cross/configure.ac
+--- libtorrent-0.13.2/configure.ac	2012-04-20 03:55:10.000000000 -0300
++++ libtorrent-0.13.2-cross/configure.ac	2012-05-09 10:57:49.671175421 -0300
+@@ -17,7 +17,6 @@
+ 
+ AM_INIT_AUTOMAKE
+ AM_CONFIG_HEADER(config.h)
+-AM_PATH_CPPUNIT(1.9.6)
+ AC_DISABLE_STATIC
+ 
+ AM_DISABLE_STATIC
+diff -Nura libtorrent-0.13.2/scripts/checks.m4 libtorrent-0.13.2-cross/scripts/checks.m4
+--- libtorrent-0.13.2/scripts/checks.m4	2012-04-12 06:44:23.000000000 -0300
++++ libtorrent-0.13.2-cross/scripts/checks.m4	2012-05-09 10:42:32.642728917 -0300
+@@ -96,7 +96,7 @@
+ AC_DEFUN([TORRENT_CHECK_KQUEUE_SOCKET_ONLY], [
+   AC_MSG_CHECKING(whether kqueue supports pipes and ptys)
+ 
+-  AC_RUN_IFELSE([AC_LANG_SOURCE([
++  AC_LINK_IFELSE([AC_LANG_SOURCE([
+       #include <fcntl.h>
+       #include <stdlib.h>
+       #include <unistd.h>
diff --git a/package/libtorrent/libtorrent.mk b/package/libtorrent/libtorrent.mk
new file mode 100644
index 0000000..100e684
--- /dev/null
+++ b/package/libtorrent/libtorrent.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# libtorrent
+#
+#############################################################
+
+LIBTORRENT_VERSION = 0.13.2
+LIBTORRENT_SITE = http://libtorrent.rakshasa.no/downloads
+LIBTORRENT_DEPENDENCIES = host-pkg-config libsigc \
+	$(if $(BR2_PACKAGE_OPENSSL),openssl)
+LIBTORRENT_CONF_OPT = --enable-aligned \
+	$(if $(BR2_PACKAGE_OPENSSL),--enable-openssl,--disable-openssl)
+LIBTORRENT_INSTALL_STAGING = YES
+LIBTORRENT_AUTORECONF = YES
+
+$(eval $(call AUTOTARGETS))
