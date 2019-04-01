From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon,  1 Apr 2019 11:26:12 +0200
Subject: [Buildroot] [PATCH] package/wpebackend-fdo: package needs wayland
 libegl
Message-ID: <20190401092612.4614-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now wpebackend-fdo depends only on HAS_LIBEGL but if libegl is not of
wayland type, build breaks due to different EGLNativeWindowType types
depending on backends(fb,x11,wl).

Add 'depend on BR2_PACKAGE_HAS_LIBEGL_WAYLAND' to Config.in to avoid
building if there is not a wayland egl backend.

Fixes:
http://autobuild.buildroot.net/results/4f02b91f6ffffd194e09ed18c917b4f678b1a52d/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/wpebackend-fdo/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/wpebackend-fdo/Config.in b/package/wpebackend-fdo/Config.in
index 2f5f965403..7d5ffb1fe0 100644
--- a/package/wpebackend-fdo/Config.in
+++ b/package/wpebackend-fdo/Config.in
@@ -1,6 +1,6 @@
 comment "wpebackend-fdo needs a toolchain w/ C++, wchar, threads, dynamic library and an OpenEGL-capable backend"
 	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
-		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || !BR2_PACKAGE_HAS_LIBEGL_WAYLAND
 
 config BR2_PACKAGE_WPEBACKEND_FDO
 	bool "wpebackend-fdo"
@@ -10,6 +10,7 @@ config BR2_PACKAGE_WPEBACKEND_FDO
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBWPE
 	select BR2_PACKAGE_WAYLAND
-- 
2.17.1
