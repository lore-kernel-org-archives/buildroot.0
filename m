From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 14 Mar 2017 11:46:27 +0000
Subject: [Buildroot] [PATCH 2/3] libgtk3: gdk-wayland backend depends on
	libX11
In-Reply-To: <20170314114628.10147-1-Vincent.Riera@imgtec.com>
References: <20170314114628.10147-1-Vincent.Riera@imgtec.com>
Message-ID: <20170314114628.10147-2-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise it will fail to compile with an error like this one:

[Vincent: paths shortened for readability]

  CC       gdkglcontext-wayland.lo
In file included from /usr/include/epoxy/egl_generated.h:11:0,
                 from /usr/include/epoxy/egl.h:44,
                 from gdkglcontext-wayland.h:32,
                 from gdkglcontext-wayland.c:24:
/usr/include/EGL/eglplatform.h:119:22: fatal error: X11/Xlib.h: No such
file or directory
 #include <X11/Xlib.h>
                      ^
compilation terminated.
make[6]: *** [Makefile:682: gdkglcontext-wayland.lo] Error 1

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libgtk3/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index 738f865..9e0721d 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -62,11 +62,15 @@ comment "Wayland GDK backend needs an OpenGL EGL backend provided by mesa3d w/ h
 	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 
+comment "Wayland GDK backend needs libX11 support"
+	depends on !BR2_PACKAGE_XLIB_LIBX11
+
 config BR2_PACKAGE_LIBGTK3_WAYLAND
 	bool "Wayland GDK backend"
 	default y
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
+	depends on BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 	select BR2_PACKAGE_LIBXKBCOMMON
-- 
2.10.2
