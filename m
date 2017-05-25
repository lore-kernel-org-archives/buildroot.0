From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 25 May 2017 11:01:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/gnutls: disable static build
Message-ID: <20170525090123.4902-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream does not support static linking:
https://gitlab.com/gnutls/gnutls/issues/203

"Note that static linking applications with gnutls is not something
 supported. gnutls relies on library constructors and destructors
 which are not loaded when linking statically."

Fixes
ffmpeg: http://autobuild.buildroot.net/results/f7e/f7e08d06fb75bf2fbb7b9d68b285ec75e7a124ac/
taskd: http://autobuild.buildroot.net/results/3bb/3bb841d4a5d2b6178d8572b987274b55c6b1a200/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/aiccu/Config.in           | 6 ++++--
 package/connman/Config.in         | 1 +
 package/gnutls/Config.in          | 6 ++++--
 package/libmicrohttpd/Config.in   | 5 +++--
 package/libsoup/Config.in         | 1 +
 package/network-manager/Config.in | 5 +++--
 package/taskd/Config.in           | 6 ++++--
 package/vpnc/Config.in            | 5 +++--
 package/webkitgtk/Config.in       | 1 +
 9 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/package/aiccu/Config.in b/package/aiccu/Config.in
index b346328dc..03d926bd2 100644
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
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
diff --git a/package/connman/Config.in b/package/connman/Config.in
index 28cf16861..d6e84e334 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -33,6 +33,7 @@ config BR2_PACKAGE_CONNMAN_WIFI
 
 config BR2_PACKAGE_CONNMAN_WISPR
 	bool "enable WISPr support"
+	depends on !BR2_STATIC_LIBS # gnutls
 	select BR2_PACKAGE_GNUTLS
 	help
 	  Enable support for Wireless Internet Service Provider
diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index 1af00cd71..1db069c65 100644
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
diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
index 302dbb7ac..2a685ca40 100644
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
index bc0ba950a..a7666227f 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -22,6 +22,7 @@ config BR2_PACKAGE_LIBSOUP_GNOME
 
 config BR2_PACKAGE_LIBSOUP_SSL
 	bool "https support"
+	depends on !BR2_STATIC_LIBS # gnutls
 	select BR2_PACKAGE_GLIB_NETWORKING
 	select BR2_PACKAGE_GNUTLS
 	help
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index c9dabfdd4..04bb65132 100644
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
diff --git a/package/taskd/Config.in b/package/taskd/Config.in
index 7d26abaae..19d123fb5 100644
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
index 2049c4573..6455b0d87 100644
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
index 25f6fad49..cebe9a9f2 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -49,6 +49,7 @@ if BR2_PACKAGE_WEBKITGTK
 
 config BR2_PACKAGE_WEBKITGTK_HTTPS
 	bool "HTTPS support"
+	depends on !BR2_STATIC_LIBS # gnutls -> libsoup
 	select BR2_PACKAGE_CA_CERTIFICATES # runtime
 	select BR2_PACKAGE_LIBSOUP_SSL
 	help
-- 
2.11.0
