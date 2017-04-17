From: Dagg Stompler <daggs@gmx.com>
Date: Mon, 17 Apr 2017 09:56:53 +0300
Subject: [Buildroot] [PATCH 1/2] odroid-mali: rename pkg to odroid-gl
Message-ID: <20170417065654.28313-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this pkg provides the GL implementation for the odroidc2 broad.
mali is the name of the kernel gpu driver, this might cause some
confusion. thus rename it for odroid-gl

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 package/Config.in                                  |  2 +-
 package/{odroid-mali => odroid-gl}/Config.in       | 14 +++---
 .../odroid-mali.hash => odroid-gl/odroid-gl.hash}  |  0
 package/odroid-gl/odroid-gl.mk                     | 52 ++++++++++++++++++++++
 package/odroid-mali/odroid-mali.mk                 | 52 ----------------------
 5 files changed, 60 insertions(+), 60 deletions(-)
 rename package/{odroid-mali => odroid-gl}/Config.in (76%)
 rename package/{odroid-mali/odroid-mali.hash => odroid-gl/odroid-gl.hash} (100%)
 create mode 100644 package/odroid-gl/odroid-gl.mk
 delete mode 100644 package/odroid-mali/odroid-mali.mk

diff --git a/package/Config.in b/package/Config.in
index 4eaa95b1d..a7e0696f8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -435,7 +435,7 @@ endmenu
 	source "package/nvidia-driver/Config.in"
 	source "package/nvidia-tegra23/Config.in"
 	source "package/nvme/Config.in"
-	source "package/odroid-mali/Config.in"
+	source "package/odroid-gl/Config.in"
 	source "package/odroid-scripts/Config.in"
 	source "package/ofono/Config.in"
 	source "package/ola/Config.in"
diff --git a/package/odroid-mali/Config.in b/package/odroid-gl/Config.in
similarity index 76%
rename from package/odroid-mali/Config.in
rename to package/odroid-gl/Config.in
index e5c07f237..9c605f6de 100644
--- a/package/odroid-mali/Config.in
+++ b/package/odroid-gl/Config.in
@@ -1,5 +1,5 @@
-config BR2_PACKAGE_ODROID_MALI
-	bool "odroid-mali"
+config BR2_PACKAGE_ODROID_GL
+	bool "odroid-gl"
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_ODROID_SCRIPTS # runtime
@@ -10,17 +10,17 @@ config BR2_PACKAGE_ODROID_MALI
 
 	  https://github.com/mdrjr/c2_mali
 
-if BR2_PACKAGE_ODROID_MALI
+if BR2_PACKAGE_ODROID_GL
 
 config BR2_PACKAGE_PROVIDES_LIBEGL
-	default "odroid-mali"
+	default "odroid-gl"
 
 config BR2_PACKAGE_PROVIDES_LIBGLES
-	default "odroid-mali"
+	default "odroid-gl"
 
 endif
 
-config BR2_PACKAGE_ODROID_MALI_X11
+config BR2_PACKAGE_ODROID_GL_X11
 	bool
 	depends on BR2_aarch64 # No 32 bit version available
 	select BR2_PACKAGE_LIBDRM
@@ -29,6 +29,6 @@ config BR2_PACKAGE_ODROID_MALI_X11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXFIXES
 
-comment "odroid-mali needs a glibc toolchain"
+comment "odroid-gl needs a glibc toolchain"
 	depends on BR2_aarch64 || BR2_ARM_EABIHF
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/odroid-mali/odroid-mali.hash b/package/odroid-gl/odroid-gl.hash
similarity index 100%
rename from package/odroid-mali/odroid-mali.hash
rename to package/odroid-gl/odroid-gl.hash
diff --git a/package/odroid-gl/odroid-gl.mk b/package/odroid-gl/odroid-gl.mk
new file mode 100644
index 000000000..0591497ca
--- /dev/null
+++ b/package/odroid-gl/odroid-gl.mk
@@ -0,0 +1,52 @@
+################################################################################
+#
+# odroid-gl
+#
+################################################################################
+
+ODROID_GL_VERSION = 4f8a541693fee5fdcaa162a7fd8922861a4ba0a9
+ODROID_GL_SITE = $(call github,mdrjr,c2_mali,$(ODROID_GL_VERSION))
+ODROID_GL_LICENSE = Hardkernel EULA
+ODROID_GL_LICENSE_FILES = README.md
+
+ODROID_GL_INSTALL_STAGING = YES
+ODROID_GL_PROVIDES = libegl libgles
+
+ifeq ($(BR2_PACKAGE_ODROID_GL_X11),y)
+ODROID_GL_HEADERS_SUBDIR = x11/mali_headers/
+ODROID_GL_LIBS_SUBDIR = x11/mali_libs/
+# The X11 blobs are linked against those libraries, and the headers
+# include headers from those libraries
+ODROID_GL_DEPENDENCIES += \
+	libdrm xlib_libX11 xlib_libXdamage \
+	xlib_libXext xlib_libXfixes
+else
+define ODROID_GL_FIX_EGL_PC
+	$(SED) "s/Cflags: /Cflags: -DMESA_EGL_NO_X11_HEADERS /" \
+		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
+endef
+ODROID_GL_HEADERS_SUBDIR = fbdev/mali_headers/
+ifeq ($(BR2_aarch64),y)
+ODROID_GL_LIBS_SUBDIR = fbdev/mali_libs/
+else
+ODROID_GL_LIBS_SUBDIR = fbdev/32bit_libs/
+endif
+endif
+
+define ODROID_GL_INSTALL_LIBS
+	cp -dpfr $(@D)/$(ODROID_GL_LIBS_SUBDIR)/lib* $(1)/usr/lib/
+endef
+
+define ODROID_GL_INSTALL_STAGING_CMDS
+	$(call ODROID_GL_INSTALL_LIBS,$(STAGING_DIR))
+	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
+	cp -dpfr $(@D)/pkgconfig/*.pc $(STAGING_DIR)/usr/lib/pkgconfig/
+	cp -dpfr $(@D)/$(ODROID_GL_HEADERS_SUBDIR)/* $(STAGING_DIR)/usr/include
+	$(ODROID_GL_FIX_EGL_PC)
+endef
+
+define ODROID_GL_INSTALL_TARGET_CMDS
+	$(call ODROID_GL_INSTALL_LIBS,$(TARGET_DIR))
+endef
+
+$(eval $(generic-package))
diff --git a/package/odroid-mali/odroid-mali.mk b/package/odroid-mali/odroid-mali.mk
deleted file mode 100644
index 86215a1d5..000000000
--- a/package/odroid-mali/odroid-mali.mk
+++ /dev/null
@@ -1,52 +0,0 @@
-################################################################################
-#
-# odroid-mali
-#
-################################################################################
-
-ODROID_MALI_VERSION = 4f8a541693fee5fdcaa162a7fd8922861a4ba0a9
-ODROID_MALI_SITE = $(call github,mdrjr,c2_mali,$(ODROID_MALI_VERSION))
-ODROID_MALI_LICENSE = Hardkernel EULA
-ODROID_MALI_LICENSE_FILES = README.md
-
-ODROID_MALI_INSTALL_STAGING = YES
-ODROID_MALI_PROVIDES = libegl libgles
-
-ifeq ($(BR2_PACKAGE_ODROID_MALI_X11),y)
-ODROID_MALI_HEADERS_SUBDIR = x11/mali_headers/
-ODROID_MALI_LIBS_SUBDIR = x11/mali_libs/
-# The X11 blobs are linked against those libraries, and the headers
-# include headers from those libraries
-ODROID_MALI_DEPENDENCIES += \
-	libdrm xlib_libX11 xlib_libXdamage \
-	xlib_libXext xlib_libXfixes
-else
-define ODROID_MALI_FIX_EGL_PC
-	$(SED) "s/Cflags: /Cflags: -DMESA_EGL_NO_X11_HEADERS /" \
-		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
-endef
-ODROID_MALI_HEADERS_SUBDIR = fbdev/mali_headers/
-ifeq ($(BR2_aarch64),y)
-ODROID_MALI_LIBS_SUBDIR = fbdev/mali_libs/
-else
-ODROID_MALI_LIBS_SUBDIR = fbdev/32bit_libs/
-endif
-endif
-
-define ODROID_MALI_INSTALL_LIBS
-	cp -dpfr $(@D)/$(ODROID_MALI_LIBS_SUBDIR)/lib* $(1)/usr/lib/
-endef
-
-define ODROID_MALI_INSTALL_STAGING_CMDS
-	$(call ODROID_MALI_INSTALL_LIBS,$(STAGING_DIR))
-	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
-	cp -dpfr $(@D)/pkgconfig/*.pc $(STAGING_DIR)/usr/lib/pkgconfig/
-	cp -dpfr $(@D)/$(ODROID_MALI_HEADERS_SUBDIR)/* $(STAGING_DIR)/usr/include
-	$(ODROID_MALI_FIX_EGL_PC)
-endef
-
-define ODROID_MALI_INSTALL_TARGET_CMDS
-	$(call ODROID_MALI_INSTALL_LIBS,$(TARGET_DIR))
-endef
-
-$(eval $(generic-package))
-- 
2.12.2
