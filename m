From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  7 Apr 2014 10:17:32 +0300
Subject: [Buildroot] [PATCH] harfbuzz: disable static build
Message-ID: <3efb9030cd296fe5bff851119271dad240900c1d.1396855052.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

harfbuzz doesn't handle static linking against pthread correctly.

Fixes:
http://autobuild.buildroot.net/results/701/701a1a260a58a81f45b3b9eae7eb47b400e05b37/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/harfbuzz/Config.in | 5 +++--
 package/midori/Config.in   | 6 ++++--
 package/webkit/Config.in   | 6 ++++--
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/package/harfbuzz/Config.in b/package/harfbuzz/Config.in
index 7a864e9b7a2e..9f8750ac3acd 100644
--- a/package/harfbuzz/Config.in
+++ b/package/harfbuzz/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HARFBUZZ
 	bool "harfbuzz"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  HarfBuzz is an OpenType text shaping engine
 
@@ -9,5 +10,5 @@ config BR2_PACKAGE_HARFBUZZ
 	  Harfbuzz can make optional use of cairo, freetype,
 	  glib2 and icu packages if they are selected.
 
-comment "harfbuzz needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "harfbuzz needs a toolchain w/ C++, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_PREFER_STATIC_LIB
diff --git a/package/midori/Config.in b/package/midori/Config.in
index c3b5a1bd273d..18d5d170e73f 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -9,12 +9,14 @@ config BR2_PACKAGE_MIDORI
 	depends on BR2_TOOLCHAIN_HAS_THREADS # webkit -> enchant -> libglib2
 	depends on BR2_USE_WCHAR	 # webkit
 	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
+	depends on !BR2_PREFER_STATIC_LIB # webkit -> harfbuzz
 	help
 	  Midori is a lightweight web browser based on WebKit
 
 	  http://software.twotoasts.de/?page=midori
 
-comment "midori needs libgtk2 and a toolchain w/ C++, wchar, threads"
+comment "midori needs libgtk2 and a toolchain w/ C++, wchar, threads, dynamic library"
 	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_LIBGTK2
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_LIBGTK2 || \
+		BR2_PREFER_STATIC_LIB
diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index 5ba2eb3e1fbe..277acb880c9b 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_WEBKIT
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT # icu
+	depends on !BR2_PREFER_STATIC_LIB # harfbuzz
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_ENCHANT
 	select BR2_PACKAGE_HARFBUZZ
@@ -39,7 +40,8 @@ config BR2_PACKAGE_WEBKIT
 
 	  http://webkit.org/
 
-comment "webkit needs libgtk2 and a toolchain w/ C++, wchar, threads"
+comment "webkit needs libgtk2 and a toolchain w/ C++, wchar, threads, dynamic library"
 	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_LIBGTK2 || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_PREFER_STATIC_LIB
-- 
1.9.1
