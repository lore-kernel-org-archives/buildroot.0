From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  6 Mar 2013 21:22:49 +0100
Subject: [Buildroot] [PATCH 07/34] rpi-userland: add .pc files for
	OpenGLESv2 and EGL libs
In-Reply-To: <1362601396-32250-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362601396-32250-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362601396-32250-8-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../rpi-userland-add-pkgconfig-files.patch         |   53 ++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 package/rpi-userland/rpi-userland-add-pkgconfig-files.patch

diff --git a/package/rpi-userland/rpi-userland-add-pkgconfig-files.patch b/package/rpi-userland/rpi-userland-add-pkgconfig-files.patch
new file mode 100644
index 0000000..0da9afd
--- /dev/null
+++ b/package/rpi-userland/rpi-userland-add-pkgconfig-files.patch
@@ -0,0 +1,53 @@
+Add .pc files for the OpenGLESv2 and EGL libraries
+
+Those pkg-config files make it easier for Qt5 to find those libraries
+and the appropriate link flags.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/interface/khronos/egl/egl.pc.in
+===================================================================
+--- /dev/null
++++ b/interface/khronos/egl/egl.pc.in
+@@ -0,0 +1,10 @@
++prefix=@CMAKE_INSTALL_PREFIX@
++exec_prefix=${prefix}
++libdir=${exec_prefix}/lib
++includedir=${prefix}/include
++
++Name: egl
++Description: RasberryPi implementation of EGL
++Version: 1.0
++Libs: -L${libdir} -lEGL -lGLESv2
++Cflags: -I${includedir}/ -I${includedir}/interface/vcos/pthreads/
+Index: b/interface/khronos/CMakeLists.txt
+===================================================================
+--- a/interface/khronos/CMakeLists.txt
++++ b/interface/khronos/CMakeLists.txt
+@@ -73,3 +73,11 @@
+ 
+ install(TARGETS EGL GLESv2 OpenVG WFC khrn_client DESTINATION lib)
+ install(TARGETS EGL_static GLESv2_static khrn_static DESTINATION lib)
++configure_file("${CMAKE_CURRENT_SOURCE_DIR}/egl/egl.pc.in"
++  "${CMAKE_CURRENT_BINARY_DIR}/egl/egl.pc" @ONLY)
++install(FILES "${CMAKE_CURRENT_BINARY_DIR}/egl/egl.pc"
++  DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig")
++configure_file("${CMAKE_CURRENT_SOURCE_DIR}/glxx/glesv2.pc.in"
++  "${CMAKE_CURRENT_BINARY_DIR}/glxx/glesv2.pc" @ONLY)
++install(FILES "${CMAKE_CURRENT_BINARY_DIR}/glxx/glesv2.pc"
++  DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig")
+Index: b/interface/khronos/glxx/glesv2.pc.in
+===================================================================
+--- /dev/null
++++ b/interface/khronos/glxx/glesv2.pc.in
+@@ -0,0 +1,10 @@
++prefix=@CMAKE_INSTALL_PREFIX@
++exec_prefix=${prefix}
++libdir=${exec_prefix}/lib
++includedir=${prefix}/include
++
++Name: glesv2
++Description: RasberryPi implementation of OpenGL ESv2
++Version: 2.0
++Libs: -L${libdir} -lGLESv2
++Cflags: -I${includedir}/
-- 
1.7.9.5
