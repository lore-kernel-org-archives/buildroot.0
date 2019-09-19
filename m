From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 19 Sep 2019 17:27:52 +0300
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: bump to version 2.26.0
Message-ID: <20190919142752.1728803-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a new major release which brings in many improvements and new
features. For a complete list, please refer to the release notes:

  https://webkitgtk.org/2019/09/09/webkitgtk2.26.0-released.html

A small patch is added which fixes a build failure when X11 headers
are no available (for example, when building a Wayland-only system)

The new support for the WPE renderer on Wayland and the new Bubblewrap
sandbox need additional dependencies and therefore are explicitly
disabled at the moment.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...latform.h-is-build-broken-with-DENAB.patch | 40 +++++++++++++++++++
 package/webkitgtk/webkitgtk.hash              |  8 ++--
 package/webkitgtk/webkitgtk.mk                |  6 ++-
 3 files changed, 48 insertions(+), 6 deletions(-)
 create mode 100644 package/webkitgtk/0001-GTK-ANGLE-s-eglplatform.h-is-build-broken-with-DENAB.patch

diff --git a/package/webkitgtk/0001-GTK-ANGLE-s-eglplatform.h-is-build-broken-with-DENAB.patch b/package/webkitgtk/0001-GTK-ANGLE-s-eglplatform.h-is-build-broken-with-DENAB.patch
new file mode 100644
index 0000000000..1da78f2bf9
--- /dev/null
+++ b/package/webkitgtk/0001-GTK-ANGLE-s-eglplatform.h-is-build-broken-with-DENAB.patch
@@ -0,0 +1,40 @@
+From d1697f868e047f1355fed7b44dbcd6dda897c234 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Thu, 19 Sep 2019 17:13:19 +0300
+Subject: [PATCH xserver 1/1] [GTK] ANGLE's eglplatform.h is build broken with
+ -DENABLE_X11_PLATFORM=OFF https://bugs.webkit.org/show_bug.cgi?id=198621
+
+Reviewed by NOBODY (OOPS!).
+
+* PlatformGTK.cmake: Use WL_EGL_PLATFORM to prefer Wayland type
+definitions with ENABLE_WAYLAND_TARGET, and USE_SYSTEM_EGL otherwise
+when ENABLE_X11_TARGET is not enabled.
+
+Fetch from: https://bugs.webkit.org/show_bug.cgi?id=198621
+Upstream-Status: Pending
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+
+---
+ Source/ThirdParty/ANGLE/ChangeLog         | 11 +++++++++++
+ Source/ThirdParty/ANGLE/PlatformGTK.cmake |  9 +++++++++
+ 2 files changed, 20 insertions(+)
+
+diff --git a/Source/ThirdParty/ANGLE/PlatformGTK.cmake b/Source/ThirdParty/ANGLE/PlatformGTK.cmake
+index 74f35e29234..7229b0e09cc 100644
+--- a/Source/ThirdParty/ANGLE/PlatformGTK.cmake
++++ b/Source/ThirdParty/ANGLE/PlatformGTK.cmake
+@@ -1,2 +1,11 @@
+ # Enable GLSL compiler output.
+ list(APPEND ANGLE_DEFINITIONS ANGLE_ENABLE_GLSL)
++
++if (ENABLE_WAYLAND_TARGET)
++    # Explicitly prefer the Wayland platform, otherwise if we are building
++    # in a system without X11 ANGLE will still try to use the X11 headers.
++    list(APPEND ANGLE_DEFINITIONS WL_EGL_PLATFORM)
++elseif (NOT ENABLE_X11_TARGET)
++    # Allow building ANGLE on platforms which may not provide X11 headers.
++    list(APPEND ANGLE_DEFINITIONS USE_SYSTEM_EGL)
++endif ()
+-- 
+2.23.0
+
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 8653369aa0..941e25a3bb 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.24.4.tar.xz.sums
-md5 c214963d8c0e7d83460da04a0d8dda87 webkitgtk-2.24.4.tar.xz
-sha1 f978b967422c6b423b11062375bab6506243388c webkitgtk-2.24.4.tar.xz
-sha256 8668b129c026624ec226a4cccf4995f9d26f3e88fc28ab75b0e965f3c32b7dd8 webkitgtk-2.24.4.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.26.0.tar.xz.sums
+md5 3a7054843cf9decbf824b8ffae794e65 webkitgtk-2.26.0.tar.xz
+sha1 e0c6f707bdf9edf3d444117736cb3c040eca78e7 webkitgtk-2.26.0.tar.xz
+sha256 d210c0ecd1a89a22c9f8f1f450334f3489c5c50159b3a5e14dd93d5f349dcced webkitgtk-2.26.0.tar.xz
 
 # Hashes for license files:
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 97e3311654..0eef7cafcd 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.24.4
+WEBKITGTK_VERSION = 2.26.0
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
@@ -17,6 +17,7 @@ WEBKITGTK_DEPENDENCIES = host-ruby host-python host-gperf \
 	libtasn1 libxml2 libxslt openjpeg sqlite webp woff2
 WEBKITGTK_CONF_OPTS = \
 	-DENABLE_API_TESTS=OFF \
+	-DENABLE_BUBBLEWRAP_SANDBOX=OFF \
 	-DENABLE_GEOLOCATION=OFF \
 	-DENABLE_GTKDOC=OFF \
 	-DENABLE_INTROSPECTION=OFF \
@@ -26,7 +27,8 @@ WEBKITGTK_CONF_OPTS = \
 	-DUSE_LIBNOTIFY=OFF \
 	-DUSE_LIBHYPHEN=OFF \
 	-DUSE_OPENJPEG=ON \
-	-DUSE_WOFF2=ON
+	-DUSE_WOFF2=ON \
+	-DUSE_WPE_RENDERER=OFF
 
 ifeq ($(BR2_PACKAGE_WEBKITGTK_MULTIMEDIA),y)
 WEBKITGTK_CONF_OPTS += \
-- 
2.23.0
