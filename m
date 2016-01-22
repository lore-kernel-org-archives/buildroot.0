From: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Date: Fri, 22 Jan 2016 12:53:38 -0300
Subject: [Buildroot] [PATCH 1/3] mali-t76x: add new package
In-Reply-To: <1453478020-311-1-git-send-email-ariel@vanguardiasur.com.ar>
References: <1453478020-311-1-git-send-email-ariel@vanguardiasur.com.ar>
Message-ID: <1453478020-311-2-git-send-email-ariel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Package provides the binary user-space components for the ARM Mali
Midgard T76X GPU.

Note that this package requires a kernel with the ARM Mali Midgard GPU
Kernel Drivers enabled.

Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
---
 package/Config.in                                  |  1 +
 ...latform.h-with-framebuffer-instead-of-X11.patch | 39 +++++++++++++
 package/mali-t76x/Config.in                        | 27 +++++++++
 package/mali-t76x/egl.pc                           | 12 ++++
 package/mali-t76x/glesv2.pc                        | 12 ++++
 package/mali-t76x/rockchip-mali.mk                 | 64 ++++++++++++++++++++++
 6 files changed, 155 insertions(+)
 create mode 100644 package/mali-t76x/0001-use-eglplatform.h-with-framebuffer-instead-of-X11.patch
 create mode 100644 package/mali-t76x/Config.in
 create mode 100644 package/mali-t76x/egl.pc
 create mode 100644 package/mali-t76x/glesv2.pc
 create mode 100644 package/mali-t76x/rockchip-mali.mk

diff --git a/package/Config.in b/package/Config.in
index 09c2b40..274c451 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -398,6 +398,7 @@ endif
 	source "package/lshw/Config.in"
 	source "package/lsuio/Config.in"
 	source "package/lvm2/Config.in"
+	source "package/mali-t76x/Config.in"
 	source "package/mdadm/Config.in"
 	source "package/memtest86/Config.in"
 	source "package/memtester/Config.in"
diff --git a/package/mali-t76x/0001-use-eglplatform.h-with-framebuffer-instead-of-X11.patch b/package/mali-t76x/0001-use-eglplatform.h-with-framebuffer-instead-of-X11.patch
new file mode 100644
index 0000000..9311f18
--- /dev/null
+++ b/package/mali-t76x/0001-use-eglplatform.h-with-framebuffer-instead-of-X11.patch
@@ -0,0 +1,39 @@
+From 90a1279f7d7bf4a584124cf4c20fbd6e0eee0396 Mon Sep 17 00:00:00 2001
+From: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
+Date: Thu, 17 Dec 2015 04:26:05 -0300
+Subject: [PATCH] use eglplatform.h with framebuffer instead of X11
+
+Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
+---
+ eglplatform.h | 15 ++++++++-------
+ 1 file changed, 8 insertions(+), 7 deletions(-)
+
+diff --git a/eglplatform.h b/eglplatform.h
+index 1284089..762fc57 100644
+--- a/eglplatform.h
++++ b/eglplatform.h
+@@ -95,13 +95,14 @@ typedef void*                           EGLNativeDisplayType;
+ 
+ #elif defined(__unix__)
+ 
+-/* X11 (tentative)  */
+-#include <X11/Xlib.h>
+-#include <X11/Xutil.h>
+-
+-typedef Display *EGLNativeDisplayType;
+-typedef Pixmap   EGLNativePixmapType;
+-typedef Window   EGLNativeWindowType;
++struct mali_native_window {
++	unsigned short width;
++	unsigned short height;
++};
++
++typedef void*         EGLNativeDisplayType;
++typedef void*         EGLNativePixmapType;
++typedef struct mali_native_window *EGLNativeWindowType;
+ 
+ #else
+ #error "Platform not recognized"
+-- 
+2.6.4
+
diff --git a/package/mali-t76x/Config.in b/package/mali-t76x/Config.in
new file mode 100644
index 0000000..b87622a
--- /dev/null
+++ b/package/mali-t76x/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_MALI_T76X
+	bool "mali-t76x"
+	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_ARM_EABIHF
+	depends on BR2_arm
+	help
+	  Install the binary user-space components for the ARM Mali Midgard
+	  T76X GPU. This package requires a kernel with the ARM Mali Midgard
+	  GPU Kernel Drivers enabled.
+
+	  Source: http://malideveloper.arm.com/resources/drivers/
+
+if BR2_PACKAGE_MALI_T76X
+
+config BR2_PACKAGE_PROVIDES_LIBEGL
+	default "mali-t76x"
+
+config BR2_PACKAGE_PROVIDES_LIBGLES
+	default "mali-t76x"
+
+endif
+
+comment "mali-t76x needs an (e)glibc toolchain with armhf enabled"
+	depends on BR2_arm
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_ARM_EABIHF
diff --git a/package/mali-t76x/egl.pc b/package/mali-t76x/egl.pc
new file mode 100644
index 0000000..f9ccf07
--- /dev/null
+++ b/package/mali-t76x/egl.pc
@@ -0,0 +1,12 @@
+prefix=/usr/
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: egl
+Description: ARM Mali implementation of EGL
+Version: 1.5
+Requires:
+Libs: -L${libdir} -lEGL -lGLESv2
+Cflags: -I${includedir}
+
diff --git a/package/mali-t76x/glesv2.pc b/package/mali-t76x/glesv2.pc
new file mode 100644
index 0000000..6910b46
--- /dev/null
+++ b/package/mali-t76x/glesv2.pc
@@ -0,0 +1,12 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: glesv2
+Description: ARM Mali implementation of OpenGL ESv2
+Version: 2.0
+Requires:
+Libs: -L${libdir} -lGLESv2 -lGLESv1_CM
+Cflags: -I${includedir}
+
diff --git a/package/mali-t76x/rockchip-mali.mk b/package/mali-t76x/rockchip-mali.mk
new file mode 100644
index 0000000..3117864
--- /dev/null
+++ b/package/mali-t76x/rockchip-mali.mk
@@ -0,0 +1,64 @@
+################################################################################
+#
+# mali-t76x
+#
+################################################################################
+
+MALI_T76X_VERSION = r5p0-06rel0
+MALI_T76X_SOURCE = mali-t76x_$(MALI_T76X_VERSION)_linux_1+fbdev.tar.gz
+MALI_T76X_SITE = http://malideveloper.arm.com/downloads/drivers/binary/$(MALI_T76X_VERSION)
+
+MALI_T76X_EXTRA_SITE = https://www.khronos.org/registry
+MALI_T76X_EXTRA_DOWNLOADS = \
+	$(MALI_T76X_EXTRA_SITE)/egl/api/EGL/egl.h \
+	$(MALI_T76X_EXTRA_SITE)/egl/api/EGL/eglext.h \
+	$(MALI_T76X_EXTRA_SITE)/egl/api/EGL/eglplatform.h \
+	$(MALI_T76X_EXTRA_SITE)/gles/api/GLES/gl.h \
+	$(MALI_T76X_EXTRA_SITE)/gles/api/GLES/glext.h \
+	$(MALI_T76X_EXTRA_SITE)/gles/api/GLES/glplatform.h \
+	$(MALI_T76X_EXTRA_SITE)/gles/api/old/2.0/gl2.h \
+	$(MALI_T76X_EXTRA_SITE)/gles/api/old/2.0/gl2ext.h \
+	$(MALI_T76X_EXTRA_SITE)/gles/api/old/2.0/gl2platform.h \
+	$(MALI_T76X_EXTRA_SITE)/egl/api/KHR/khrplatform.h
+
+MALI_T76X_INSTALL_STAGING = YES
+MALI_T76X_PROVIDES = libegl libgles
+
+define MALI_T76X_PRE_PATCH
+	cp $(BR2_DL_DIR)/eglplatform.h $(@D)/eglplatform.h
+endef
+
+MALI_T76X_PRE_PATCH_HOOKS += MALI_T76X_PRE_PATCH
+
+define MALI_T76X_INSTALL_STAGING_CMDS
+	$(INSTALL) -m 755 $(@D)/*.so $(STAGING_DIR)/usr/lib/
+
+	$(INSTALL) -D -m 0644 package/mali-t76x/egl.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
+	$(INSTALL) -D -m 0644 package/mali-t76x/glesv2.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
+
+	$(INSTALL) -m 755 -d $(STAGING_DIR)/usr/include/EGL
+	$(INSTALL) -D -m 0644 $(BR2_DL_DIR)/egl.h $(STAGING_DIR)/usr/include/EGL
+	$(INSTALL) -D -m 0644 $(BR2_DL_DIR)/eglext.h $(STAGING_DIR)/usr/include/EGL
+	$(INSTALL) -D -m 0644 $(@D)/eglplatform.h $(STAGING_DIR)/usr/include/EGL
+
+	$(INSTALL) -m 755 -d $(STAGING_DIR)/usr/include/GLES
+	$(INSTALL) -D -m 0644 $(BR2_DL_DIR)/gl.h $(STAGING_DIR)/usr/include/GLES
+	$(INSTALL) -D -m 0644 $(BR2_DL_DIR)/glext.h $(STAGING_DIR)/usr/include/GLES
+	$(INSTALL) -D -m 0644 $(BR2_DL_DIR)/glplatform.h $(STAGING_DIR)/usr/include/GLES
+
+	$(INSTALL) -m 755 -d $(STAGING_DIR)/usr/include/GLES2
+	$(INSTALL) -D -m 0644 $(BR2_DL_DIR)/gl2.h $(STAGING_DIR)/usr/include/GLES2
+	$(INSTALL) -D -m 0644 $(BR2_DL_DIR)/gl2ext.h $(STAGING_DIR)/usr/include/GLES2
+	$(INSTALL) -D -m 0644 $(BR2_DL_DIR)/gl2platform.h $(STAGING_DIR)/usr/include/GLES2
+
+	$(INSTALL) -m 755 -d $(STAGING_DIR)/usr/include/KHR
+	$(INSTALL) -D -m 0644 $(BR2_DL_DIR)/khrplatform.h $(STAGING_DIR)/usr/include/KHR
+endef
+
+define MALI_T76X_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 755 $(@D)/*.so $(TARGET_DIR)/usr/lib/
+endef
+
+$(eval $(generic-package))
-- 
2.7.0
