From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 16 May 2019 22:12:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: add
 BR2_PACKAGE_HAS_LIBEGL_WAYLAND dependency
Message-ID: <20190516201220.24893-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 5b3c7a3e7828107eaa9dad49ba2650466277d891 added a
BR2_PACKAGE_HAS_LIBEGL_WAYLAND dependency to wpebackend-fdo but forget
to add it to wpewebkit

Fixes:
 - http://autobuild.buildroot.net/results/49e04166de68358e69bce580b29ba3a25b313acf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wpewebkit/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 04ebe5452b..15db924829 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -35,10 +35,11 @@ comment "wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gc
 		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_HOST_GCC_AT_LEAST_4_8
 
-comment "wpewebkit needs an OpenGL ES w/ EGL backend"
+comment "wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend"
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_PACKAGE_HAS_LIBGLES || !BR2_PACKAGE_HAS_LIBEGL
+	depends on !BR2_PACKAGE_HAS_LIBGLES || !BR2_PACKAGE_HAS_LIBEGL \
+		|| !BR2_PACKAGE_HAS_LIBEGL_WAYLAND
 
 config BR2_PACKAGE_WPEWEBKIT
 	bool "wpewebkit"
@@ -51,6 +52,7 @@ config BR2_PACKAGE_WPEWEBKIT
 	depends on BR2_USE_WCHAR # icu, libsoup
 	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
 	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
+	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # wpebackend-fdo
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
-- 
2.20.1
