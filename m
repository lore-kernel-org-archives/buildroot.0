From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Wed, 22 Mar 2017 14:13:30 -0400
Subject: [Buildroot] [RFC 2/3] rpi-userland: fix opengl library symlinks
In-Reply-To: <20170322181331.23500-1-gael.portay@savoirfairelinux.com>
References: <20170322181331.23500-1-gael.portay@savoirfairelinux.com>
Message-ID: <20170322181331.23500-3-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt WebEngine module is linked against libEGL.so.1 and libGLESv2.so.2.

This patch sets up cmake to create those library links.

	# ls -l /usr/lib/lib*GL*
	lrwxrwxrwx    1 root     root            11 Mar 21 17:24 /usr/lib/libEGL.so -> libEGL.so.1
	lrwxrwxrwx    1 root     root            15 Mar 21 17:24 /usr/lib/libEGL.so.1 -> libEGL.so.1.0.0
	-rwxr-xr-x    1 root     root        163152 Mar 22 14:56 /usr/lib/libEGL.so.1.0.0
	lrwxrwxrwx    1 root     root            14 Mar 21 17:24 /usr/lib/libGLESv2.so -> libGLESv2.so.2
	lrwxrwxrwx    1 root     root            18 Mar 21 17:24 /usr/lib/libGLESv2.so.2 -> libGLESv2.so.2.0.0
	-rwxr-xr-x    1 root     root         78788 Mar 22 14:56 /usr/lib/libGLESv2.so.2.0.0

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 .../0001-Add-OpenGL-library-versioning.patch       | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/rpi-userland/0001-Add-OpenGL-library-versioning.patch

diff --git a/package/rpi-userland/0001-Add-OpenGL-library-versioning.patch b/package/rpi-userland/0001-Add-OpenGL-library-versioning.patch
new file mode 100644
index 000000000..0de7b8a72
--- /dev/null
+++ b/package/rpi-userland/0001-Add-OpenGL-library-versioning.patch
@@ -0,0 +1,36 @@
+From c0b5fce145b8b7aec42510d9759d100e92630c74 Mon Sep 17 00:00:00 2001
+From: =?utf-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
+Date: Fri, 3 Mar 2017 17:28:41 -0500
+Subject: [PATCH] Add OpenGL library versioning
+
+Some applications like QtWebEngine require specific library versions.
+Make them happy by providing that.
+
+https://wiki.qt.io/RaspberryPi2EGLFS
+---
+ host_applications/android/apps/vidtex/CMakeLists.txt | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/host_applications/android/apps/vidtex/CMakeLists.txt b/host_applications/android/apps/vidtex/CMakeLists.txt
+index 1f705ef..c91032a 100644
+--- a/host_applications/android/apps/vidtex/CMakeLists.txt
++++ b/host_applications/android/apps/vidtex/CMakeLists.txt
+@@ -10,3 +10,15 @@ set (VIDTEX_SOURCES
+    vidtex.c)
+ add_executable(vidtex ${VIDTEX_SOURCES})
+ target_link_libraries(vidtex GLESv2 EGL m bcm_host mmal_core mmal_components mmal_util mmal_vc_client vcos)
++
++set_target_properties(
++	GLESv2 PROPERTIES
++	VERSION "2.0.0"
++	SOVERSION "2"
++)
++
++set_target_properties(
++	EGL PROPERTIES
++	VERSION "1.0.0"
++	SOVERSION "1"
++)
+-- 
+2.10.2
+
-- 
2.12.0
