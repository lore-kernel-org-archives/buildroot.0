From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 29 Sep 2015 17:49:33 +0100
Subject: [Buildroot] [PATCH] glmark2: add missing dependencies
Message-ID: <1443545373-9115-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are some missing dependencies which are in fact stated in the
comment, and due to that you can select the package despite of not
satisfying them.
Also propagate the !STATIC dependency from mesa3d and add some comments.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/glmark2/Config.in |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
index 052e820..6ab4f5b 100644
--- a/package/glmark2/Config.in
+++ b/package/glmark2/Config.in
@@ -15,6 +15,12 @@ comment "glmark2 needs an OpenGL or an openGL ES and EGL backend provided by mes
 config BR2_PACKAGE_GLMARK2
 	bool "glmark2"
 	depends on BR2_PACKAGE_GLMARK2_GL || BR2_PACKAGE_GLMARK2_EGL_GLES
+	# glmark2-gl and glmark2-egl-gles depend on mesa3d, which intruduces
+	# dependencies on NPTL, STDCPP and !STATIC.
+	depends on BR2_INSTALL_LIBSTDCPP # mesa3d
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mesa3d
+	depends on !BR2_STATIC_LIBS # mesa3d
+	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBPNG
 	help
@@ -22,6 +28,6 @@ config BR2_PACKAGE_GLMARK2
 
 	  https://github.com/glmark2/glmark2
 
-comment "glmark2 needs udev /dev management and a toolchain w/ C++, NPTL"
-	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_PACKAGE_HAS_UDEV
+comment "glmark2 needs udev and a toolchain w/ C++, NPTL, shared library"
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
-- 
1.7.1
