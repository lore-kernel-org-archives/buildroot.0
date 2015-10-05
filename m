From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Oct 2015 08:29:25 +0200
Subject: [Buildroot] [git commit] libtorrent: zlib is mandatory
Message-ID: <20151005063006.CE0AE7FA3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f7facd5b091e1110cdb584130e4378a9eebcf652
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zlib isn't optional even though it seems like it, fixes build failure
such as:

log.cc:51:18: fatal error: zlib.h: No such file or directory

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtorrent/Config.in     |    1 +
 package/libtorrent/libtorrent.mk |    9 ++++-----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libtorrent/Config.in b/package/libtorrent/Config.in
index 48e6add..17a1f23 100644
--- a/package/libtorrent/Config.in
+++ b/package/libtorrent/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBTORRENT
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_ARCH_HAS_ATOMICS
+	select BR2_PACKAGE_ZLIB
 	help
 	  BitTorrent library written in C++ for *nix
 
diff --git a/package/libtorrent/libtorrent.mk b/package/libtorrent/libtorrent.mk
index 633b86a..ef1c75f 100644
--- a/package/libtorrent/libtorrent.mk
+++ b/package/libtorrent/libtorrent.mk
@@ -6,13 +6,12 @@
 
 LIBTORRENT_VERSION = 0.13.6
 LIBTORRENT_SITE = http://rtorrent.net/downloads
-LIBTORRENT_DEPENDENCIES = host-pkgconf \
-	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
-	$(if $(BR2_PACKAGE_ZLIB),zlib)
+LIBTORRENT_DEPENDENCIES = host-pkgconf zlib \
+	$(if $(BR2_PACKAGE_OPENSSL),openssl)
 LIBTORRENT_CONF_OPTS = --enable-aligned \
 	--disable-instrumentation \
-	$(if $(BR2_PACKAGE_OPENSSL),--enable-openssl,--disable-openssl) \
-	$(if $(BR2_PACKAGE_ZLIB),--with-zlib=$(STAGING_DIR)/usr,--without-zlib)
+	--with-zlib=$(STAGING_DIR)/usr \
+	$(if $(BR2_PACKAGE_OPENSSL),--enable-openssl,--disable-openssl)
 LIBTORRENT_INSTALL_STAGING = YES
 LIBTORRENT_AUTORECONF = YES
 LIBTORRENT_LICENSE = GPLv2
