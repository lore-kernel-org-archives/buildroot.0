From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  1 Aug 2019 12:49:18 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/glib-networking: needs dynamic library
Message-ID: <20190801104918.3731-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

glib-networking uses the meson's shared_module function

This is a partly revert of commit
ed3eef6bb49270de619e5a86a249fdd8724c40cd 'package/glib-networking: bump
to version 2.61.1' re-adding the dynamic library dependency due to the
meson's build system and not from gnutls

Fixes:
 - http://autobuild.buildroot.org/results/60037e37e020404485df9814f3f3ad4e3b2abdb3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Peter Seiderer):
 - Update commit message
 - Update webkitgtk/Config.in

 package/glib-networking/Config.in | 6 ++++--
 package/libsoup/Config.in         | 2 +-
 package/webkitgtk/Config.in       | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
index 004f82222c..e9557309ee 100644
--- a/package/glib-networking/Config.in
+++ b/package/glib-networking/Config.in
@@ -3,11 +3,13 @@ config BR2_PACKAGE_GLIB_NETWORKING
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
 	help
 	  Network-related GIO modules for glib.
 
-comment "glib-networking needs a toolchain w/ wchar, threads"
+comment "glib-networking needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index 599f9594d9..f6f8fde968 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -22,7 +22,7 @@ config BR2_PACKAGE_LIBSOUP_GNOME
 
 config BR2_PACKAGE_LIBSOUP_SSL
 	bool "https support"
-	depends on !BR2_STATIC_LIBS # gnutls
+	depends on !BR2_STATIC_LIBS # glib-networking, gnutls
 	select BR2_PACKAGE_GLIB_NETWORKING
 	select BR2_PACKAGE_GNUTLS
 	help
diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 9f0d4a776c..db67c89042 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -59,7 +59,7 @@ if BR2_PACKAGE_WEBKITGTK
 
 config BR2_PACKAGE_WEBKITGTK_HTTPS
 	bool "HTTPS support"
-	depends on !BR2_STATIC_LIBS # gnutls -> libsoup
+	depends on !BR2_STATIC_LIBS # libsoup -> glib-networking, gnutls
 	select BR2_PACKAGE_CA_CERTIFICATES # runtime
 	select BR2_PACKAGE_LIBSOUP_SSL
 	help
-- 
2.20.1
