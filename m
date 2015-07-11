From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 13:00:45 +0200
Subject: [Buildroot] [git commit] gpu-viv-bin-mx6q: rename package to
	imx-gpu-viv
Message-ID: <20150711112619.AD14780831@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4c0613e7de01c9e38d0f9750347937f2dbcf66cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to be in line with new Freescale naming convention:

https://github.com/Freescale/meta-fsl-arm/commit/74c86aa9

"Graphics recipe is renamed from gpu-viv-bin-mx6q to imx-gpu-viv"

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |    9 ++
 package/freescale-imx/Config.in                    |    2 +-
 .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           |   98 --------------------
 .../{gpu-viv-bin-mx6q => imx-gpu-viv}/Config.in    |   26 +++---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   |   98 ++++++++++++++++++++
 package/gstreamer1/gst1-imx/Config.in              |    6 +-
 package/gstreamer1/gst1-imx/gst1-imx.mk            |    2 +-
 package/qt5/qt5base/qt5base.mk                     |    2 +-
 package/x11r7/xdriver_xf86-video-imx-viv/Config.in |    6 +-
 .../xdriver_xf86-video-imx-viv.mk                  |    2 +-
 10 files changed, 130 insertions(+), 121 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 90e1339..edf9912 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,15 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.08"
 
+config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
+	bool "gpu-viv-bin-mx6q"
+	select BR2_LEGACY
+	select BR2_PACKAGE_IMX_GPU_VIV
+	help
+	  Vivante graphics libraries have been renamed to
+	  BR2_PACKAGE_IMX_GPU_VIV to be aligned with upstream package
+	  name.
+
 config BR2_PACKAGE_LIBSEMANAGE_PYTHON_BINDINGS
 	depends on BR2_PACKAGE_PYTHON
 	bool "libsemanage python bindings removed"
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 72d3c59..dffe76f 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -50,7 +50,7 @@ source "package/freescale-imx/gpu-amd-bin-mx51/Config.in"
 source "package/freescale-imx/libz160/Config.in"
 endif
 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
-source "package/freescale-imx/gpu-viv-bin-mx6q/Config.in"
+source "package/freescale-imx/imx-gpu-viv/Config.in"
 endif
 
 endif
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
deleted file mode 100644
index 678bfdf..0000000
--- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
+++ /dev/null
@@ -1,98 +0,0 @@
-################################################################################
-#
-# gpu-viv-bin-mx6q
-#
-################################################################################
-
-GPU_VIV_BIN_MX6Q_BASE_VERSION = 5.0.11.p4.1
-ifeq ($(BR2_ARM_EABIHF),y)
-GPU_VIV_BIN_MX6Q_VERSION = $(GPU_VIV_BIN_MX6Q_BASE_VERSION)-hfp
-else
-GPU_VIV_BIN_MX6Q_VERSION = $(GPU_VIV_BIN_MX6Q_BASE_VERSION)-sfp
-endif
-GPU_VIV_BIN_MX6Q_SITE = $(FREESCALE_IMX_SITE)
-GPU_VIV_BIN_MX6Q_SOURCE = imx-gpu-viv-$(GPU_VIV_BIN_MX6Q_VERSION).bin
-
-GPU_VIV_BIN_MX6Q_INSTALL_STAGING = YES
-
-GPU_VIV_BIN_MX6Q_LICENSE = Freescale Semiconductor Software License Agreement
-GPU_VIV_BIN_MX6Q_LICENSE_FILES = EULA
-GPU_VIV_BIN_MX6Q_REDISTRIBUTE = NO
-
-GPU_VIV_BIN_MX6Q_PROVIDES = libegl libgles libopenvg
-GPU_VIV_BIN_MX6Q_LIB_TARGET = $(call qstrip,$(BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT))
-
-define GPU_VIV_BIN_MX6Q_EXTRACT_CMDS
-	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(GPU_VIV_BIN_MX6Q_SOURCE))
-endef
-
-# For some reason libGAL_egl for x11 is called libGAL_egl.dri.so
-ifeq ($(GPU_VIV_BIN_MX6Q_LIB_TARGET),x11)
-define GPU_VIV_BIN_MX6Q_FIXUP_SYMLINKS
-	ln -sf libGAL_egl.dri.so $(@D)/gpu-core/usr/lib/libGAL_egl.so
-endef
-endif
-
-# Instead of building, we fix up the inconsistencies that exist
-# in the upstream archive here.
-# Make sure these commands are idempotent.
-define GPU_VIV_BIN_MX6Q_BUILD_CMDS
-	$(SED) 's/defined(LINUX)/defined(__linux__)/g' $(@D)/gpu-core/usr/include/*/*.h
-	ln -sf libGL.so.1.2 $(@D)/gpu-core/usr/lib/libGL.so
-	ln -sf libGL.so.1.2 $(@D)/gpu-core/usr/lib/libGL.so.1
-	ln -sf libGL.so.1.2 $(@D)/gpu-core/usr/lib/libGL.so.1.2.0
-	ln -sf libEGL-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libEGL.so
-	ln -sf libEGL-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libEGL.so.1
-	ln -sf libEGL-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libEGL.so.1.0
-	ln -sf libGLESv2-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGLESv2.so
-	ln -sf libGLESv2-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGLESv2.so.2
-	ln -sf libGLESv2-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGLESv2.so.2.0.0
-	ln -sf libVIVANTE-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libVIVANTE.so
-	ln -sf libGAL-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGAL.so
-	ln -sf libGAL_egl.$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGAL_egl.so
-	$(GPU_VIV_BIN_MX6Q_FIXUP_SYMLINKS)
-endef
-
-ifeq ($(GPU_VIV_BIN_MX6Q_LIB_TARGET),fb)
-define GPU_VIV_BIN_MX6Q_FIXUP_FB_HEADERS
-	$(SED) '39i\
-		#if !defined(EGL_API_X11) && !defined(EGL_API_DFB) && !defined(EGL_API_FB) \n\
-		#define EGL_API_FB \n\
-		#endif' $(STAGING_DIR)/usr/include/EGL/eglvivante.h
-endef
-endif
-
-define GPU_VIV_BIN_MX6Q_INSTALL_STAGING_CMDS
-	cp -r $(@D)/gpu-core/usr/* $(STAGING_DIR)/usr
-	$(GPU_VIV_BIN_MX6Q_FIXUP_FB_HEADERS)
-	for lib in egl glesv2 vg; do \
-		$(INSTALL) -m 0644 -D \
-			$(@D)/gpu-core/usr/lib/pkgconfig/$${lib}.pc \
-			$(STAGING_DIR)/usr/lib/pkgconfig/$${lib}.pc; \
-	done
-endef
-
-ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q_EXAMPLES),y)
-define GPU_VIV_BIN_MX6Q_INSTALL_EXAMPLES
-	mkdir -p $(TARGET_DIR)/usr/share/examples/
-	cp -r $(@D)/gpu-demos/opt/* $(TARGET_DIR)/usr/share/examples/
-endef
-endif
-
-# On the target, remove the unused libraries.
-# Note that this is _required_, else ldconfig may create symlinks
-# to the wrong library
-define GPU_VIV_BIN_MX6Q_INSTALL_TARGET_CMDS
-	$(GPU_VIV_BIN_MX6Q_INSTALL_EXAMPLES)
-	cp -a $(@D)/gpu-core/usr/lib $(TARGET_DIR)/usr
-	for lib in EGL GAL VIVANTE GLESv2; do \
-		for f in $(TARGET_DIR)/usr/lib/lib$${lib}-*.so; do \
-			case $$f in \
-				*-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so) : ;; \
-				*) $(RM) $$f ;; \
-			esac; \
-		done; \
-	done
-endef
-
-$(eval $(generic-package))
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
similarity index 72%
rename from package/freescale-imx/gpu-viv-bin-mx6q/Config.in
rename to package/freescale-imx/imx-gpu-viv/Config.in
index db2a10e..2a0cf84 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -1,9 +1,9 @@
-comment "gpu-viv-bin-mx6q needs an (e)glibc toolchain"
+comment "imx-gpu-viv needs an (e)glibc toolchain"
 	depends on BR2_arm
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
 
-config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
-	bool "gpu-viv-bin-mx6q"
+config BR2_PACKAGE_IMX_GPU_VIV
+	bool "imx-gpu-viv"
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_HAS_LIBOPENVG
@@ -21,7 +21,7 @@ config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 	  This library is provided by Freescale as-is and doesn't have
 	  an upstream.
 
-if BR2_PACKAGE_GPU_VIV_BIN_MX6Q
+if BR2_PACKAGE_IMX_GPU_VIV
 
 choice
 	prompt "Output option"
@@ -30,7 +30,7 @@ choice
 	  direct framebuffer access, one for X11 rendering.
 	  Choose here which version to install.
 
-config BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11
+config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
 	bool "X11"
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE # Runtime dependency
@@ -39,26 +39,26 @@ config BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11
 comment "X11 backend needs Xorg package"
 	depends on !BR2_PACKAGE_XORG7
 
-config BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_FB
+config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
 	bool "Framebuffer"
 
 endchoice
 
-config BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT
+config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT
 	string
-	default "x11" if BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11
-	default "fb" if BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_FB
+	default "x11" if BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
+	default "fb" if BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
 
 config BR2_PACKAGE_PROVIDES_LIBEGL
-	default "gpu-viv-bin-mx6q"
+	default "imx-gpu-viv"
 
 config BR2_PACKAGE_PROVIDES_LIBGLES
-	default "gpu-viv-bin-mx6q"
+	default "imx-gpu-viv"
 
 config BR2_PACKAGE_PROVIDES_LIBOPENVG
-	default "gpu-viv-bin-mx6q"
+	default "imx-gpu-viv"
 
-config BR2_PACKAGE_GPU_VIV_BIN_MX6Q_EXAMPLES
+config BR2_PACKAGE_IMX_GPU_VIV_EXAMPLES
 	bool "install examples"
 	help
 	  Copy the Vivante examples to the target.
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
new file mode 100644
index 0000000..ef2399f
--- /dev/null
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -0,0 +1,98 @@
+################################################################################
+#
+# imx-gpu-viv
+#
+################################################################################
+
+IMX_GPU_VIV_BASE_VERSION = 5.0.11.p4.1
+ifeq ($(BR2_ARM_EABIHF),y)
+IMX_GPU_VIV_VERSION = $(IMX_GPU_VIV_BASE_VERSION)-hfp
+else
+IMX_GPU_VIV_VERSION = $(IMX_GPU_VIV_BASE_VERSION)-sfp
+endif
+IMX_GPU_VIV_SITE = $(FREESCALE_IMX_SITE)
+IMX_GPU_VIV_SOURCE = imx-gpu-viv-$(IMX_GPU_VIV_VERSION).bin
+
+IMX_GPU_VIV_INSTALL_STAGING = YES
+
+IMX_GPU_VIV_LICENSE = Freescale Semiconductor Software License Agreement
+IMX_GPU_VIV_LICENSE_FILES = EULA
+IMX_GPU_VIV_REDISTRIBUTE = NO
+
+IMX_GPU_VIV_PROVIDES = libegl libgles libopenvg
+IMX_GPU_VIV_LIB_TARGET = $(call qstrip,$(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT))
+
+define IMX_GPU_VIV_EXTRACT_CMDS
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(IMX_GPU_VIV_SOURCE))
+endef
+
+# For some reason libGAL_egl for x11 is called libGAL_egl.dri.so
+ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
+define IMX_GPU_VIV_FIXUP_SYMLINKS
+	ln -sf libGAL_egl.dri.so $(@D)/gpu-core/usr/lib/libGAL_egl.so
+endef
+endif
+
+# Instead of building, we fix up the inconsistencies that exist
+# in the upstream archive here.
+# Make sure these commands are idempotent.
+define IMX_GPU_VIV_BUILD_CMDS
+	$(SED) 's/defined(LINUX)/defined(__linux__)/g' $(@D)/gpu-core/usr/include/*/*.h
+	ln -sf libGL.so.1.2 $(@D)/gpu-core/usr/lib/libGL.so
+	ln -sf libGL.so.1.2 $(@D)/gpu-core/usr/lib/libGL.so.1
+	ln -sf libGL.so.1.2 $(@D)/gpu-core/usr/lib/libGL.so.1.2.0
+	ln -sf libEGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libEGL.so
+	ln -sf libEGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libEGL.so.1
+	ln -sf libEGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libEGL.so.1.0
+	ln -sf libGLESv2-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGLESv2.so
+	ln -sf libGLESv2-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGLESv2.so.2
+	ln -sf libGLESv2-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGLESv2.so.2.0.0
+	ln -sf libVIVANTE-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libVIVANTE.so
+	ln -sf libGAL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGAL.so
+	ln -sf libGAL_egl.$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGAL_egl.so
+	$(IMX_GPU_VIV_FIXUP_SYMLINKS)
+endef
+
+ifeq ($(IMX_GPU_VIV_LIB_TARGET),fb)
+define IMX_GPU_VIV_FIXUP_FB_HEADERS
+	$(SED) '39i\
+		#if !defined(EGL_API_X11) && !defined(EGL_API_DFB) && !defined(EGL_API_FB) \n\
+		#define EGL_API_FB \n\
+		#endif' $(STAGING_DIR)/usr/include/EGL/eglvivante.h
+endef
+endif
+
+define IMX_GPU_VIV_INSTALL_STAGING_CMDS
+	cp -r $(@D)/gpu-core/usr/* $(STAGING_DIR)/usr
+	$(IMX_GPU_VIV_FIXUP_FB_HEADERS)
+	for lib in egl glesv2 vg; do \
+		$(INSTALL) -m 0644 -D \
+			$(@D)/gpu-core/usr/lib/pkgconfig/$${lib}.pc \
+			$(STAGING_DIR)/usr/lib/pkgconfig/$${lib}.pc; \
+	done
+endef
+
+ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_EXAMPLES),y)
+define IMX_GPU_VIV_INSTALL_EXAMPLES
+	mkdir -p $(TARGET_DIR)/usr/share/examples/
+	cp -r $(@D)/gpu-demos/opt/* $(TARGET_DIR)/usr/share/examples/
+endef
+endif
+
+# On the target, remove the unused libraries.
+# Note that this is _required_, else ldconfig may create symlinks
+# to the wrong library
+define IMX_GPU_VIV_INSTALL_TARGET_CMDS
+	$(IMX_GPU_VIV_INSTALL_EXAMPLES)
+	cp -a $(@D)/gpu-core/usr/lib $(TARGET_DIR)/usr
+	for lib in EGL GAL VIVANTE GLESv2; do \
+		for f in $(TARGET_DIR)/usr/lib/lib$${lib}-*.so; do \
+			case $$f in \
+				*-$(IMX_GPU_VIV_LIB_TARGET).so) : ;; \
+				*) $(RM) $$f ;; \
+			esac; \
+		done; \
+	done
+endef
+
+$(eval $(generic-package))
diff --git a/package/gstreamer1/gst1-imx/Config.in b/package/gstreamer1/gst1-imx/Config.in
index 840c0fb..f7284f4 100644
--- a/package/gstreamer1/gst1-imx/Config.in
+++ b/package/gstreamer1/gst1-imx/Config.in
@@ -1,7 +1,7 @@
 comment "gst1-imx needs an imx-specific Linux kernel to be built"
 	depends on BR2_arm && !BR2_LINUX_KERNEL
 
-# Required by gpu-viv-bin-mx6q
+# Required by imx-gpu-viv
 comment "gst1-imx needs an (e)glibc toolchain"
 	depends on BR2_arm
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
@@ -10,8 +10,8 @@ config BR2_PACKAGE_GST1_IMX
 	bool "gst1-imx"
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_arm # Only relevant for i.MX
-	depends on BR2_TOOLCHAIN_USES_GLIBC # gpu-viv-bin-mx6q
-	depends on BR2_PACKAGE_GPU_VIV_BIN_MX6Q
+	depends on BR2_TOOLCHAIN_USES_GLIBC # imx-gpu-viv
+	depends on BR2_PACKAGE_IMX_GPU_VIV
 	depends on BR2_PACKAGE_LIBFSLVPUWRAP
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	help
diff --git a/package/gstreamer1/gst1-imx/gst1-imx.mk b/package/gstreamer1/gst1-imx/gst1-imx.mk
index 516babf..9ba7550 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.mk
+++ b/package/gstreamer1/gst1-imx/gst1-imx.mk
@@ -13,7 +13,7 @@ GST1_IMX_LICENSE_FILES = LICENSE
 GST1_IMX_INSTALL_STAGING = YES
 
 GST1_IMX_DEPENDENCIES += host-pkgconf host-python \
-	gpu-viv-bin-mx6q gstreamer1 gst1-plugins-base libfslvpuwrap
+	imx-gpu-viv gstreamer1 gst1-plugins-base libfslvpuwrap
 
 # needs access to imx-specific kernel headers
 GST1_IMX_DEPENDENCIES += linux
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index e2db5d1..2eebb5b 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -115,7 +115,7 @@ QT5BASE_CONFIGURE_OPTS += $(if $(QT5BASE_DEFAULT_QPA),-qpa $(QT5BASE_DEFAULT_QPA
 ifeq ($(BR2_PACKAGE_QT5BASE_EGLFS),y)
 QT5BASE_CONFIGURE_OPTS += -eglfs
 QT5BASE_DEPENDENCIES   += libegl
-ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q),y)
+ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
 QT5BASE_EXTRA_CFLAGS = -DENABLE_MX6_WORKAROUND
 QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES = \
 	$(@D)/mkspecs/devices/linux-imx6-g++/qeglfshooks_imx6.cpp
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
index 8926a50..baf7ca4 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV
 	bool "xf86-video-imx-viv"
-	depends on BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11
+	depends on BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
 	select BR2_PACKAGE_MESA3D # Needed in order to compile xorg with glx/dri
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_LIBDRM
@@ -26,6 +26,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV
 	  this driver (else, Xorg will exit with an obscur message like
 	  "Segmentation fault at address 0xc").
 
-comment "xf86-video-imx-viv depends on gpu-viv-bin-mx6q with X11 output"
+comment "xf86-video-imx-viv depends on imx-gpu-viv with X11 output"
 	depends on BR2_arm
-	depends on !BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11
+	depends on !BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
index 1e9a665..fbd7325 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
@@ -7,7 +7,7 @@
 XDRIVER_XF86_VIDEO_IMX_VIV_VERSION = 3.10.17-1.0.1
 XDRIVER_XF86_VIDEO_IMX_VIV_SITE = $(FREESCALE_IMX_SITE)
 XDRIVER_XF86_VIDEO_IMX_VIV_SOURCE = xserver-xorg-video-imx-viv-$(XDRIVER_XF86_VIDEO_IMX_VIV_VERSION).tar.gz
-XDRIVER_XF86_VIDEO_IMX_VIV_DEPENDENCIES = gpu-viv-bin-mx6q xserver_xorg-server \
+XDRIVER_XF86_VIDEO_IMX_VIV_DEPENDENCIES = imx-gpu-viv xserver_xorg-server \
 	xproto_xproto xproto_xf86driproto libdrm
 XDRIVER_XF86_VIDEO_IMX_VIV_LICENSE = GPLv2+
 XDRIVER_XF86_VIDEO_IMX_VIV_INSTALL_STAGING = YES
