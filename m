From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 18 Jul 2019 23:49:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/glib-networking: needs dynamic
 library
Message-ID: <20190718214952.20763-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

glib-networking uses the meson's shared_module function

Fixes:
 - http://autobuild.buildroot.org/results/60037e37e020404485df9814f3f3ad4e3b2abdb3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/glib-networking/Config.in | 6 ++++--
 package/libsoup/Config.in         | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
index ec2962392c..339eee1139 100644
--- a/package/glib-networking/Config.in
+++ b/package/glib-networking/Config.in
@@ -3,10 +3,12 @@ config BR2_PACKAGE_GLIB_NETWORKING
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBGLIB2
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
-- 
2.20.1
