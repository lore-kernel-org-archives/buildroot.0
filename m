From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 31 Mar 2014 22:06:27 +0200
Subject: [Buildroot] [PATCH 14/16] opengl: New virtual package
In-Reply-To: <1396296389-28821-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396296389-28821-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396296389-28821-15-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in       |    4 ++++
 package/opengl/Config.in       |    1 +
 package/opengl/libgl/Config.in |    6 ++++++
 package/opengl/libgl/libgl.mk  |   16 ++++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/opengl/libgl/Config.in
 create mode 100644 package/opengl/libgl/libgl.mk

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 8ed0c07..d735e76 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -34,6 +34,7 @@ comment "DRI drivers need shared libdrm"
 
 config BR2_PACKAGE_MESA3D_DRIVER
 	bool
+	select BR2_PACKAGE_HAS_OPENGL_GL
 
 menu "Drivers"
 
@@ -106,6 +107,9 @@ config BR2_PACKAGE_MESA3D_OPENGL_ES
 
 endmenu
 
+config BR2_PACKAGE_PROVIDES_OPENGL_GL
+	default "mesa3d" if BR2_PACKAGE_MESA3D_DRIVER
+
 config BR2_PACKAGE_PROVIDES_OPENGL_EGL
 	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_EGL
 
diff --git a/package/opengl/Config.in b/package/opengl/Config.in
index ed81835..02010a9 100644
--- a/package/opengl/Config.in
+++ b/package/opengl/Config.in
@@ -1,4 +1,5 @@
 source "package/opengl/libegl/Config.in"
+source "package/opengl/libgl/Config.in"
 source "package/opengl/libgles/Config.in"
 source "package/opengl/libopenvg/Config.in"
 source "package/opengl/libopenmax/Config.in"
diff --git a/package/opengl/libgl/Config.in b/package/opengl/libgl/Config.in
new file mode 100644
index 0000000..5421c86
--- /dev/null
+++ b/package/opengl/libgl/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HAS_OPENGL_GL
+	bool
+
+config BR2_PACKAGE_PROVIDES_OPENGL_GL
+	depends on BR2_PACKAGE_HAS_OPENGL_GL
+	string
diff --git a/package/opengl/libgl/libgl.mk b/package/opengl/libgl/libgl.mk
new file mode 100644
index 0000000..66346d6
--- /dev/null
+++ b/package/opengl/libgl/libgl.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libgl
+#
+################################################################################
+
+LIBGL_SOURCE =
+LIBGL_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_OPENGL_GL))
+
+ifeq ($(BR2_PACKAGE_HAS_OPENGL_GL),y)
+ifeq ($(LIBGL_DEPENDENCIES),)
+$(error No libGL implementation selected. Configuration error.)
+endif
+endif
+
+$(eval $(generic-package))
-- 
1.7.10.4
