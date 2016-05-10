From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 10 May 2016 20:40:22 +0200
Subject: [Buildroot] [PATCH 5/6] package/kodi-visualisation-shadertoy: needs
	libglew for OpenGL build
In-Reply-To: <1462905623-17739-1-git-send-email-bernd.kuhls@t-online.de>
References: <1462905623-17739-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1462905623-17739-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
-- Found OpenGL: /home/bernd/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libGL.so
CMake Error at /home/bernd/buildroot/output/host/usr/share/cmake-3.5/Modules/FindPackageHandleStandardArgs.cmake:148
 (message):
  Could NOT find GLEW (missing: GLEW_INCLUDE_DIRS GLEW_LIBRARIES)

For details have a look at
https://github.com/notspiff/visualization.shadertoy/blob/master/CMakeLists.txt#L21

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-visualisation-shadertoy/Config.in                       | 1 +
 package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/kodi-visualisation-shadertoy/Config.in b/package/kodi-visualisation-shadertoy/Config.in
index 3b981d0..ac17702 100644
--- a/package/kodi-visualisation-shadertoy/Config.in
+++ b/package/kodi-visualisation-shadertoy/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KODI_VISUALISATION_SHADERTOY
 	bool "kodi-visualisation-shadertoy"
+	select BR2_PACKAGE_LIBGLEW if BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_LIBPLATFORM
 	help
 	  Shadertoy visualiser for Kodi
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
index 308016e..e5f2d91 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
@@ -10,4 +10,8 @@ KODI_VISUALISATION_SHADERTOY_LICENSE = GPLv2+
 KODI_VISUALISATION_SHADERTOY_LICENSE_FILES = src/main.cpp
 KODI_VISUALISATION_SHADERTOY_DEPENDENCIES = kodi libplatform
 
+ifeq ($(BR2_PACKAGE_LIBGLEW),y)
+KODI_VISUALISATION_SHADERTOY_DEPENDENCIES += libglew
+endif
+
 $(eval $(cmake-package))
-- 
2.8.1
