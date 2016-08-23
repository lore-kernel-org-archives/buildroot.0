From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 22:01:08 +0200
Subject: [Buildroot] [git commit branch/next] package/libgtk3: needs
	OpenGL-EGL/wayland
Message-ID: <20160823200112.D71D78211A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=427fcaa52379a16483e74a40f2d6a592f5d0bdee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Currently, libgtk3 depends on either a full OpenGL stack, or on a
OpenGL-EGL stack provided by mesa3d.

This is because, when using the wayland backend, libgtk3 needs an
OpenGL-EGL stack tht provides the wayland extensions. So far, only
mesa3d would provide those extensions.

But now, those extensions are trickling down to other implementations,
like the Nvidia driver or other (even non-public) implementations.

Change the condition to be on the recently introduced libegl-wayland
option.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgtk3/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index 39105ac..2dd6dfa 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -4,10 +4,10 @@ comment "libgtk3 needs a toolchain w/ wchar, threads, C++"
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS
 
-comment "libgtk3 needs an OpenGL or OpenGL EGL backend provided by mesa3d"
+comment "libgtk3 needs an OpenGL or an OpenGL-EGL/wayland backend"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL && \
+	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND && \
 		!BR2_PACKAGE_HAS_LIBGL
 
 config BR2_PACKAGE_LIBGTK3
@@ -29,7 +29,7 @@ config BR2_PACKAGE_LIBGTK3
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
-	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL || \
+	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLANDD || \
 		BR2_PACKAGE_HAS_LIBGL
 	help
 	  The GTK+ version 3 graphical user interface library
@@ -65,7 +65,7 @@ comment "Wayland GDK backend needs an OpenGL EGL backend provided by mesa3d w/ h
 config BR2_PACKAGE_LIBGTK3_WAYLAND
 	bool "Wayland GDK backend"
 	default y
-	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
+	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 	select BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
