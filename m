From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  7 Nov 2015 11:33:36 +0100
Subject: [Buildroot] [PATCH 1/3] package/libglfw: new package
In-Reply-To: <1446892418-6932-1-git-send-email-bernd.kuhls@t-online.de>
References: <1446892418-6932-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1446892418-6932-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in            |  1 +
 package/libglfw/Config.in    | 16 ++++++++++++++++
 package/libglfw/libglfw.hash |  2 ++
 package/libglfw/libglfw.mk   | 15 +++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 package/libglfw/Config.in
 create mode 100644 package/libglfw/libglfw.hash
 create mode 100644 package/libglfw/libglfw.mk

diff --git a/package/Config.in b/package/Config.in
index a6d1f38..d278e64 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -827,6 +827,7 @@ menu "Graphics"
 	source "package/libgeotiff/Config.in"
 	source "package/libglade/Config.in"
 	source "package/libglew/Config.in"
+	source "package/libglfw/Config.in"
 	source "package/libglu/Config.in"
 	source "package/libgtk2/Config.in"
 	source "package/libgtk3/Config.in"
diff --git a/package/libglfw/Config.in b/package/libglfw/Config.in
new file mode 100644
index 0000000..045bd26
--- /dev/null
+++ b/package/libglfw/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_LIBGLFW
+	bool "libglfw"
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_XLIB_LIBXCURSOR
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXINERAMA
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+	help
+	  GLFW is an Open Source, multi-platform library for creating
+	  windows with OpenGL contexts and receiving input and events.
+
+	  http://www.glfw.org
+
+comment "libglfw depends on X.org and needs an OpenGL backend"
+	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/libglfw/libglfw.hash b/package/libglfw/libglfw.hash
new file mode 100644
index 0000000..3226aad
--- /dev/null
+++ b/package/libglfw/libglfw.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	6ac642087682aaf7f8397761a41a99042b2c656498217a1c63ba9706d1eef122	libglfw-3.1.2.tar.gz
diff --git a/package/libglfw/libglfw.mk b/package/libglfw/libglfw.mk
new file mode 100644
index 0000000..2a0d494
--- /dev/null
+++ b/package/libglfw/libglfw.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libglfw
+#
+################################################################################
+
+LIBGLFW_VERSION = 3.1.2
+LIBGLFW_SITE = $(call github,glfw,glfw,$(LIBGLFW_VERSION))
+LIBGLFW_INSTALL_STAGING = YES
+LIBGLFW_DEPENDENCIES = libgl xlib_libXcursor xlib_libXext \
+	xlib_libXinerama xlib_libXrandr
+LIBGLEW_LICENSE = zlib
+LIBGLEW_LICENSE_FILES = COPYING.txt
+
+$(eval $(cmake-package))
-- 
2.6.2
