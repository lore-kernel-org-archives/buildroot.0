From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 May 2019 09:15:48 +0200
Subject: [Buildroot] [git commit] package/wpebackend-fdo: package needs
 wayland libegl
Message-ID: <20190516071120.0CCFC8A62A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b3c7a3e7828107eaa9dad49ba2650466277d891
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now wpebackend-fdo depends only on HAS_LIBEGL but if libegl is not of
wayland type, build breaks due to different EGLNativeWindowType types
depending on backends(fb,x11,wl).

Modify:
'depend on BR2_PACKAGE_HAS_LIBEGL'
to:
'depend on BR2_PACKAGE_HAS_LIBEGL_WAYLAND'
in Config.in to avoid building if there is not a wayland egl backend.
Modify also comment in Config.in when package is not selectable
mentioning the need to have an OpenEGL-capable Wayland backend.

Fixes:
http://autobuild.buildroot.net/results/4f02b91f6ffffd194e09ed18c917b4f678b1a52d/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpebackend-fdo/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wpebackend-fdo/Config.in b/package/wpebackend-fdo/Config.in
index 2f5f965403..161e4c9a7e 100644
--- a/package/wpebackend-fdo/Config.in
+++ b/package/wpebackend-fdo/Config.in
@@ -1,5 +1,5 @@
-comment "wpebackend-fdo needs a toolchain w/ C++, wchar, threads, dynamic library and an OpenEGL-capable backend"
-	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
+comment "wpebackend-fdo needs a toolchain w/ C++, wchar, threads, dynamic library and an OpenEGL-capable Wayland backend"
+	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_WPEBACKEND_FDO
@@ -9,7 +9,7 @@ config BR2_PACKAGE_WPEBACKEND_FDO
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, libglib2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_USE_MMU # libglib2
-	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBWPE
 	select BR2_PACKAGE_WAYLAND
