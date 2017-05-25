From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 25 May 2017 18:34:43 +0200
Subject: [Buildroot] [PATCH v2] package/gnutls: disable for static build
Message-ID: <20170525163443.5234-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <bernd.kuhls@t-online.de>

The gnutils code use __attribute__((constructor)) and
__attribute__((destructor)) to call constructor/desctructor when a
shared library is loaded.
Constructor/desctructor are not used when a static library is used
(except when if -Wl,--whole-archive -lgnutls -Wno-whole-archive is
used, not tested).

Even if gnutls initialization (_gnutls_global_init()) may be
called manually, the gnutls maintainer said it's not supported [1].

"Note that static linking applications with gnutls is not something
 supported. gnutls relies on library constructors and destructors
 which are not loaded when linking statically."

Now the gnutls script warn about static linking [2].

So disable gnutls statically by adding "depends on !BR2_STATIC_LIBS"
at Kconfig level and --disable-static in GNUTLS_CONF_OPTS.

Fixes:
[taskd] http://autobuild.buildroot.net/results/c2d/c2dd5c1c9dc87d2943c15e58ee56e67d7375368c
[ffmpeg] http://autobuild.buildroot.net/results/892/8926d319d6d1cd1ee72239ad7d9ca869d2355628
[sngrep] http://autobuild.buildroot.net/results/f7f/f7fb42d3742f6f01000a0d181e0c785640284405

[1] https://gitlab.com/gnutls/gnutls/issues/203
[2] https://gitlab.com/gnutls/gnutls/commit/6b748886799f88ddee9721dba4fc4d52854832ae

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Romain: merge our two patches together
    add some option comment
    disable static libgnutls.a
    add sngrep autobuilder reference]
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/aiccu/Config.in           | 6 ++++--
 package/connman/Config.in         | 4 ++++
 package/gnutls/Config.in          | 6 ++++--
 package/gnutls/gnutls.mk          | 2 ++
 package/libmicrohttpd/Config.in   | 5 +++--
 package/libsoup/Config.in         | 4 ++++
 package/network-manager/Config.in | 5 +++--
 package/samba4/Config.in          | 2 +-
 package/taskd/Config.in           | 6 ++++--
 package/vpnc/Config.in            | 5 +++--
 package/webkitgtk/Config.in       | 4 ++++
 11 files changed, 36 insertions(+), 13 deletions(-)

diff --git a/package/aiccu/Config.in b/package/aiccu/Config.in
index b346328..a2d6100 100644
--- a/package/aiccu/Config.in
+++ b/package/aiccu/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_AICCU
 	bool "aiccu"
+	depends on !BR2_STATIC_LIBS # gnutls
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
@@ -18,6 +19,7 @@ config BR2_PACKAGE_AICCU
 
 	  http://www.sixxs.net/tools/aiccu/
 
-comment "aiccu needs a toolchain w/ wchar, threads"
+comment "aiccu needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !(BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_STATIC_LIBS
diff --git a/package/connman/Config.in b/package/connman/Config.in
index 28cf168..253c604 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -33,12 +33,16 @@ config BR2_PACKAGE_CONNMAN_WIFI
 
 config BR2_PACKAGE_CONNMAN_WISPR
 	bool "enable WISPr support"
+	depends on !BR2_STATIC_LIBS # gnutls
 	select BR2_PACKAGE_GNUTLS
 	help
 	  Enable support for Wireless Internet Service Provider
 	  roaming (WISPr). A RADIUS server is used to authenticate the
 	  subscriber's credentials.
 
+comment "connman WISPr needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_CONNMAN_BLUETOOTH
 	bool "enable Bluetooth support"
 	help
diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index 1af00cd..1db069c 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_GNUTLS
 	bool "gnutls"
+	# https://gitlab.com/gnutls/gnutls/issues/203
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBTASN1
 	select BR2_PACKAGE_LIBUNISTRING
@@ -22,5 +24,5 @@ config BR2_PACKAGE_GNUTLS_TOOLS
 
 endif
 
-comment "gnutls needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
+comment "gnutls needs a toolchain w/ wchar, dynamic library"
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index c192469..9fd5a72 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -11,11 +11,13 @@ GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library), GPL-3.0+ (gnutls-openssl library)
 GNUTLS_LICENSE_FILES = doc/COPYING doc/COPYING.LESSER
 GNUTLS_DEPENDENCIES = host-pkgconf libunistring libtasn1 nettle pcre
+# Disable static library: https://gitlab.com/gnutls/gnutls/issues/203
 GNUTLS_CONF_OPTS = \
 	--disable-doc \
 	--disable-guile \
 	--disable-libdane \
 	--disable-rpath \
+	--disable-static \
 	--enable-local-libopts \
 	--enable-openssl-compatibility \
 	--with-libnettle-prefix=$(STAGING_DIR)/usr \
diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
index 302dbb7..2a685ca 100644
--- a/package/libmicrohttpd/Config.in
+++ b/package/libmicrohttpd/Config.in
@@ -12,14 +12,15 @@ if BR2_PACKAGE_LIBMICROHTTPD
 config BR2_PACKAGE_LIBMICROHTTPD_SSL
 	bool "https support"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
+	depends on !BR2_STATIC_LIBS # gnutls
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBGCRYPT
 	help
 	  Enable HTTPS (SSL) support.
 
-comment "libmicrohttpd https support needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
+comment "libmicrohttpd https support needs a toolchain w/ wchar, dynamic library"
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
 
 endif
 
diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index bc0ba95..236d3c4 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -22,11 +22,15 @@ config BR2_PACKAGE_LIBSOUP_GNOME
 
 config BR2_PACKAGE_LIBSOUP_SSL
 	bool "https support"
+	depends on !BR2_STATIC_LIBS # gnutls
 	select BR2_PACKAGE_GLIB_NETWORKING
 	select BR2_PACKAGE_GNUTLS
 	help
 	  Enable HTTPS (SSL) support.
 
+comment "libsoup https support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 endif
 
 comment "libsoup needs a toolchain w/ wchar, threads"
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index c9dabfd..04bb651 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NETWORK_MANAGER
 	bool "networkmanager"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
+	depends on !BR2_STATIC_LIBS # gnutls
 	depends on BR2_USE_MMU # dbus
 	depends on BR2_PACKAGE_HAS_UDEV
 	# Tested with 3.2, but may even work with earlier versions
@@ -57,8 +58,8 @@ comment "pppd support needs a glibc or uClibc toolchain"
 
 endif
 
-comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 3.7"
+comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 3.7, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 || \
-		!BR2_TOOLCHAIN_USES_GLIBC
+		!BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS
diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index 4474185..ba48b8a 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_SAMBA4
 	depends on BR2_USE_WCHAR # python
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # python -> libffi
-	depends on !BR2_STATIC_LIBS # python
+	depends on !BR2_STATIC_LIBS # python, gnutls
 	depends on !BR2_nios2 # binary too large, relocations don't fit
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_E2FSPROGS
diff --git a/package/taskd/Config.in b/package/taskd/Config.in
index 7d26aba..19d123f 100644
--- a/package/taskd/Config.in
+++ b/package/taskd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TASKD
 	bool "taskd"
+	depends on !BR2_STATIC_LIBS # gnutls
 	depends on BR2_USE_WCHAR # gnutls
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -11,6 +12,7 @@ config BR2_PACKAGE_TASKD
 
 	  http://taskwarrior.org/
 
-comment "taskd needs a toolchain w/ C++, wchar"
+comment "taskd needs a toolchain w/ C++, wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+		BR2_STATIC_LIBS
diff --git a/package/vpnc/Config.in b/package/vpnc/Config.in
index 2049c45..6455b0d 100644
--- a/package/vpnc/Config.in
+++ b/package/vpnc/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_VPNC
 	bool "vpnc"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
+	depends on !BR2_STATIC_LIBS # gnutls
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR # gnutls
 	select BR2_PACKAGE_LIBGCRYPT
@@ -15,6 +16,6 @@ config BR2_PACKAGE_VPNC
 
 	  http://www.unix-ag.uni-kl.de/~massar/vpnc
 
-comment "vpnc needs a toolchain w/ wchar"
+comment "vpnc needs a toolchain w/ wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 25f6fad..0e53d06 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -49,11 +49,15 @@ if BR2_PACKAGE_WEBKITGTK
 
 config BR2_PACKAGE_WEBKITGTK_HTTPS
 	bool "HTTPS support"
+	depends on !BR2_STATIC_LIBS # gnutls -> libsoup
 	select BR2_PACKAGE_CA_CERTIFICATES # runtime
 	select BR2_PACKAGE_LIBSOUP_SSL
 	help
 	  Enable HTTPS protocol support.
 
+comment "webkitgtk https support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
 	bool "multimedia support"
 	select BR2_PACKAGE_GSTREAMER1
-- 
2.9.4
