From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Wed, 19 Jul 2017 21:05:25 -0400
Subject: [Buildroot] [PATCH v4 1/3] rpi-userland: fix opengl library symlinks
In-Reply-To: <20170720010527.5359-1-gael.portay@savoirfairelinux.com>
References: <20170720010527.5359-1-gael.portay@savoirfairelinux.com>
Message-ID: <20170720010527.5359-2-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Qt WebEngine module loads libEGL.so.1 and libGLESv2.so.2 libraries.
Path are hard-coded [1].

This patch sets up cmake to create those library links.

	# ls -l /usr/lib/lib*GL*
	lrwxrwxrwx    1 root     root            11 Mar 21 17:24 /usr/lib/libEGL.so -> libEGL.so.1
	lrwxrwxrwx    1 root     root            15 Mar 21 17:24 /usr/lib/libEGL.so.1 -> libEGL.so.1.0.0
	-rwxr-xr-x    1 root     root        163152 Mar 22 14:56 /usr/lib/libEGL.so.1.0.0
	lrwxrwxrwx    1 root     root            14 Mar 21 17:24 /usr/lib/libGLESv2.so -> libGLESv2.so.2
	lrwxrwxrwx    1 root     root            18 Mar 21 17:24 /usr/lib/libGLESv2.so.2 -> libGLESv2.so.2.0.0
	-rwxr-xr-x    1 root     root         78788 Mar 22 14:56 /usr/lib/libGLESv2.so.2.0.0

A pull request is pending [2].

[1] https://github.com/qt/qtwebengine/blob/5.8.0/src/core/surface_factory_qt.cpp#L76-L86
[2] https://github.com/raspberrypi/userland/pull/379

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 .../0007-Add-OpenGL-library-versioning.patch       | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/rpi-userland/0007-Add-OpenGL-library-versioning.patch

diff --git a/package/rpi-userland/0007-Add-OpenGL-library-versioning.patch b/package/rpi-userland/0007-Add-OpenGL-library-versioning.patch
new file mode 100644
index 000000000..7024a7400
--- /dev/null
+++ b/package/rpi-userland/0007-Add-OpenGL-library-versioning.patch
@@ -0,0 +1,37 @@
+From bf388550943afc70798c497e3fc706303394cfdc Mon Sep 17 00:00:00 2001
+From: =?utf-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
+Date: Fri, 3 Mar 2017 17:28:41 -0500
+Subject: [PATCH] Add OpenGL library versioning
+
+Some applications like QtWebEngine dynamically load libraries using
+dlopen. The library name is hardcoded, and it includes the library
+version [1].
+
+This patch creates symlinks for EGL and GLES libraries.
+
+	libEGL.so.1 -> libEGL.so
+	libGLESv2.so.2 -> libGLESv2.so
+
+[1] https://github.com/qt/qtwebengine/blob/v5.8.0/src/core/surface_factory_qt.cpp#L76-L86
+
+Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
+---
+ host_applications/android/apps/vidtex/CMakeLists.txt | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/host_applications/android/apps/vidtex/CMakeLists.txt b/host_applications/android/apps/vidtex/CMakeLists.txt
+index 1f705ef..d68ae5f 100644
+--- a/host_applications/android/apps/vidtex/CMakeLists.txt
++++ b/host_applications/android/apps/vidtex/CMakeLists.txt
+@@ -10,3 +10,8 @@ set (VIDTEX_SOURCES
+    vidtex.c)
+ add_executable(vidtex ${VIDTEX_SOURCES})
+ target_link_libraries(vidtex GLESv2 EGL m bcm_host mmal_core mmal_components mmal_util mmal_vc_client vcos)
++
++set(DESTDIR \$ENV{DESTDIR})
++include(GNUInstallDirs)
++install(CODE "execute_process(COMMAND ${CMAKE_COMMAND} -E create_symlink libEGL.so ${DESTDIR}/${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/libEGL.so.1)")
++install(CODE "execute_process(COMMAND ${CMAKE_COMMAND} -E create_symlink libGLESv2.so ${DESTDIR}/${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/libGLESv2.so.2)")
+-- 
+2.12.1
+
-- 
2.13.2
