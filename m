From: Refik Tuzakli <tuzakli.refik@gmail.com>
Date: Sun,  9 Feb 2020 16:44:08 +0300
Subject: [Buildroot] [PATCH v1 3/3] package/freescale-imx/imx-gpu-viv: add
 options for new feture
In-Reply-To: <20200209134408.10534-1-tuzakli.refik@gmail.com>
References: <20200209134408.10534-1-tuzakli.refik@gmail.com>
Message-ID: <20200209134408.10534-3-tuzakli.refik@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NXP supply new fetures with new gpu driver. This patch adds options to select
the library needed and saves space on target.

Signed-off-by: Refik Tuzakli <tuzakli.refik@gmail.com>
---
 package/freescale-imx/imx-gpu-viv/Config.in   |  54 +++++++++
 .../freescale-imx/imx-gpu-viv/imx-gpu-viv.mk  | 103 ++++++++++++++++--
 2 files changed, 145 insertions(+), 12 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index a2deaf2e12..d206c04e6e 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -90,4 +90,58 @@ config BR2_PACKAGE_IMX_GPU_VIV_GMEM_INFO
 	  Copy the gmem_info tool to the target which provides
 	  information about GPU memory consumption.
 
+config BR2_PACKAGE_IMX_GPU_VIV_LIBOPENCL
+	bool "install libopencl"
+	select BR2_PACKAGE_HAS_LIBOPENCL
+	help
+	  OpenCL (Open Computing Language) is the open, royalty-free
+	  standard for cross-platform, parallel programming of diverse
+	  processors found in personal computers, servers, mobile
+	  devices and embedded platforms. OpenCL greatly improves the
+	  speed and responsiveness of a wide spectrum of applications in
+	  numerous market categories including gaming and entertainment
+	  titles, scientific and medical software, professional creative
+	  tools, vision processing, and neural network training and
+	  inferencing.
+
+config BR2_PACKAGE_PROVIDES_LIBOPENCL
+	depends on BR2_PACKAGE_IMX_GPU_VIV_LIBOPENCL
+	default "imx-gpu-viv"
+
+config BR2_PACKAGE_IMX_GPU_VIV_LIBOPENVX
+	bool "install libopenvx"
+	select BR2_PACKAGE_HAS_LIBOPENVX
+	help
+	  OpenVX is an open, royalty-free standard for cross platform
+	  acceleration of computer vision applications. OpenVX enables
+	  performance and power-optimized computer vision processing.
+
+config BR2_PACKAGE_PROVIDES_LIBOPENVX
+	depends on BR2_PACKAGE_IMX_GPU_VIV_LIBOPENVX
+	default "imx-gpu-viv"
+
+config BR2_PACKAGE_IMX_GPU_VIV_LIBVULKAN
+	bool "install libvulkan"
+	select BR2_PACKAGE_HAS_LIBVULKAN
+	help
+	  Vulkan is a new generation graphics and compute API that
+	  provides high-efficiency, cross-platform access to modern GPUs
+	  used in a wide variety of devices from PCs and consoles to
+	  mobile phones and embedded platforms.
+
+
+config BR2_PACKAGE_PROVIDES_LIBVULKAN
+	depends on BR2_PACKAGE_IMX_GPU_VIV_LIBVULKAN
+	default "imx-gpu-viv"
+
+config BR2_PACKAGE_IMX_GPU_VIV_LIBNN
+	bool "install libnn (experimental)"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_IMX_GPU_VIV_LIBOPENCL
+	select BR2_PACKAGE_IMX_GPU_VIV_LIBOPENVX
+	select BR2_PACKAGE_IMX_GPU_VIV_LIBVULKAN
+
+comment "libnn needs C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 endif
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 646d4e3673..9e2e9f58e2 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -56,7 +56,62 @@ define IMX_GPU_VIV_BUILD_CMDS
 	ln -sf libGLESv2-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGLESv2.so.2.0.0
 	ln -sf libGAL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGAL.so
 	ln -sf libVDK-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libVDK.so
+	$(if $(BR2_PACKAGE_IMX_GPU_VIV_VULKAN),
+		ln -sf libvulkan-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libvulkan.so
+	)
+endef
+
+ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_LIBOPENCL),y)
+IMX_GPU_VIV_PROVIDES += libopencl
+define IMX_GPU_VIV_INSTALL_TARGET_LIBOPENCL
+	cp -dpfr $(@D)/gpu-core/usr/lib/libOpenCL* $(TARGET_DIR)/usr/lib
+	cp -dpfr $(@D)/gpu-core/usr/lib/libVivanteOpenCL* $(TARGET_DIR)/usr/lib
+endef
+define IMX_GPU_VIV_INSTALL_STAGING_LIBOPENCL
+	cp -dpfr $(@D)/gpu-core/usr/include/CL $(STAGING_DIR)/usr/include/
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_LIBOPENVX),y)
+IMX_GPU_VIV_PROVIDES += libopenvx
+define IMX_GPU_VIV_INSTALL_TARGET_LIBOPENVX
+	for lib in ovxlib OpenVX OpenVXU Ovx12VXCBinary-evis Ovx12VXCBinary-evis2 CLC; do \
+		cp -dpfr $(@D)/gpu-core/usr/lib/lib$${lib}.so $(TARGET_DIR)/usr/lib ; \
+	done
+endef
+define IMX_GPU_VIV_INSTALL_STAGING_LIBOPENVX
+	cp -dpfr $(@D)/gpu-core/usr/include/VX $(STAGING_DIR)/usr/include/
+	cp -dpfr $(@D)/gpu-core/usr/include/OVXLIB $(STAGING_DIR)/usr/include/
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_LIBVULKAN),y)
+IMX_GPU_VIV_PROVIDES += libvulkan
+define IMX_GPU_VIV_INSTALL_TARGET_LIBVULKAN
+	cp -dpfr $(@D)/gpu-core/usr/lib/libvulkan-$(IMX_GPU_VIV_LIB_TARGET).so $(TARGET_DIR)/usr/lib
+	cp -dpfr $(@D)/gpu-core/usr/lib/libGLSLC.so $(TARGET_DIR)/usr/lib
+	cp -dpfr $(@D)/gpu-core/usr/lib/libSPIRV_viv.so $(TARGET_DIR)/usr/lib
+endef
+define IMX_GPU_VIV_INSTALL_STAGING_LIBVULKAN
+	cp -dpfr $(@D)/gpu-core/usr/include/vulkan $(STAGING_DIR)/usr/include/
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_LIBNN),y)
+IMX_GPU_VIV_PROVIDES += libnn
+define IMX_GPU_VIV_INSTALL_TARGET_LIBNN
+	cp -dpfr $(@D)/gpu-core/usr/lib/libnnrt.so $(TARGET_DIR)/usr/lib
+	cp -dpfr $(@D)/gpu-core/usr/lib/libneuralnetworks.so $(TARGET_DIR)/usr/lib
+	cp -dpfr $(@D)/gpu-core/usr/lib/libNNGPUBinary-lite.so $(TARGET_DIR)/usr/lib
+	cp -dpfr $(@D)/gpu-core/usr/lib/libNNGPUBinary-xsvx.so $(TARGET_DIR)/usr/lib
+	cp -dpfr $(@D)/gpu-core/usr/lib/libNNVXCBinary-evis.so $(TARGET_DIR)/usr/lib
+	cp -dpfr $(@D)/gpu-core/usr/lib/libNNGPUBinary-ulite.so $(TARGET_DIR)/usr/lib
+	cp -dpfr $(@D)/gpu-core/usr/lib/libNNVXCBinary-evis2.so $(TARGET_DIR)/usr/lib
 endef
+define IMX_GPU_VIV_INSTALL_STAGING_LIBVULKAN
+	cp -dpfr $(@D)/gpu-core/usr/include/nnrt $(STAGING_DIR)/usr/include/
+endef
+endif
 
 ifeq ($(IMX_GPU_VIV_LIB_TARGET),fb)
 define IMX_GPU_VIV_FIXUP_FB_HEADERS
@@ -88,7 +143,10 @@ endef
 endif
 
 define IMX_GPU_VIV_INSTALL_STAGING_CMDS
-	cp -r $(@D)/gpu-core/usr/* $(STAGING_DIR)/usr
+	cp -dpfr $(@D)/gpu-core/usr/lib $(STAGING_DIR)/usr
+	for lib in EGL GL GLES GLES2 GLES3 HAL KHR VG gbm.h gc_vdk.h gc_vdk_types.h vdk.h; do \
+		cp -dpfr $(@D)/gpu-core/usr/include/$${lib} $(STAGING_DIR)/usr/include/ ; \
+	done
 	$(IMX_GPU_VIV_FIXUP_FB_HEADERS)
 	$(IMX_GPU_VIV_FIXUP_PKGCONFIG)
 	for lib in egl gbm glesv1_cm glesv2 vg; do \
@@ -96,12 +154,21 @@ define IMX_GPU_VIV_INSTALL_STAGING_CMDS
 			$(@D)/gpu-core/usr/lib/pkgconfig/$${lib}.pc \
 			$(STAGING_DIR)/usr/lib/pkgconfig/$${lib}.pc; \
 	done
+	$(IMX_GPU_VIV_INSTALL_STAGING_LIBOPENCL)
+	$(IMX_GPU_VIV_INSTALL_STAGING_LIBOPENVX)
+	$(IMX_GPU_VIV_INSTALL_STAGING_LIBVULKAN)
+	$(IMX_GPU_VIV_INSTALL_STAGING_LIBNN)
 endef
 
 ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_EXAMPLES),y)
 define IMX_GPU_VIV_INSTALL_EXAMPLES
-	mkdir -p $(TARGET_DIR)/usr/share/examples/
-	cp -r $(@D)/gpu-demos/opt/* $(TARGET_DIR)/usr/share/examples/
+	mkdir -p $(TARGET_DIR)/usr/share/examples/viv_samples
+	cp -dpfr $(@D)/gpu-demos/opt/es20 $(TARGET_DIR)/usr/share/examples/viv_samples/
+	cp -dpfr $(@D)/gpu-demos/opt/tiger $(TARGET_DIR)/usr/share/examples/viv_samples/
+	cp -dpfr $(@D)/gpu-demos/opt/vdk $(TARGET_DIR)/usr/share/examples/viv_samples/
+ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_LIBOPENCL),y)
+	cp -dpfr $(@D)/gpu-demos/opt/cl11 $(TARGET_DIR)/usr/share/examples/viv_samples/
+endif
 endef
 endif
 
@@ -115,17 +182,29 @@ endif
 # Note that this is _required_, else ldconfig may create symlinks
 # to the wrong library
 define IMX_GPU_VIV_INSTALL_TARGET_CMDS
-	$(IMX_GPU_VIV_INSTALL_EXAMPLES)
-	$(IMX_GPU_VIV_INSTALL_GMEM_INFO)
-	cp -a $(@D)/gpu-core/usr/lib $(TARGET_DIR)/usr
+	cp -dpfr $(@D)/gpu-core/etc $(TARGET_DIR)/ 
+	for lib in dri pkgconfig libgbm.so libgbm_viv.so libVSC.so libOpenVG.so  libOpenVG.3d.so; do \
+		cp -dpfr $(@D)/gpu-core/usr/lib/$${lib} $(TARGET_DIR)/usr/lib ; \
+	done
 	for lib in EGL GAL GLESv2 VDK; do \
-		for f in $(TARGET_DIR)/usr/lib/lib$${lib}-*.so; do \
-			case $$f in \
-				*-$(IMX_GPU_VIV_LIB_TARGET).so) : ;; \
-				*) $(RM) $$f ;; \
-			esac; \
-		done; \
+		cp -dpfr $(@D)/gpu-core/usr/lib/lib$${lib}.so* $(TARGET_DIR)/usr/lib ; \
+		cp -dpfr $(@D)/gpu-core/usr/lib/lib$${lib}-$(IMX_GPU_VIV_LIB_TARGET).so $(TARGET_DIR)/usr/lib ; \
 	done
+	$(if $(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11)$(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL),
+		cp -dpfr $(@D)/gpu-core/usr/lib/libGL.so* $(TARGET_DIR)/usr/lib ; \
+		cp -dpfr $(@D)/gpu-core/usr/lib/libGL-$(IMX_GPU_VIV_LIB_TARGET).so $(TARGET_DIR)/usr/lib ; \
+	)
+	cp -dpfr $(@D)/gpu-core/usr/lib/libGLES_C* $(TARGET_DIR)/usr/lib
+	cp -dpfr $(@D)/gpu-core/usr/lib/libGLESv1_C* $(TARGET_DIR)/usr/lib
+	
+	$(IMX_GPU_VIV_INSTALL_EXAMPLES)
+	$(IMX_GPU_VIV_INSTALL_GMEM_INFO)
+	
+	$(IMX_GPU_VIV_INSTALL_TARGET_LIBOPENCL)
+	$(IMX_GPU_VIV_INSTALL_TARGET_LIBOPENVX)
+	$(IMX_GPU_VIV_INSTALL_TARGET_LIBVULKAN)
+	$(IMX_GPU_VIV_INSTALL_TARGET_LIBNN)
+
 endef
 
 $(eval $(generic-package))
-- 
2.17.1
