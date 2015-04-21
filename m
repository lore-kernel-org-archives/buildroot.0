From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Apr 2015 19:04:43 +0200
Subject: [Buildroot] [PATCH 7/8 v11] package.nvidia-tegra23-binaries: add
	gstreamer plugins
In-Reply-To: <cover.1429635674.git.yann.morin.1998@free.fr>
References: <cover.1429635674.git.yann.morin.1998@free.fr>
Message-ID: <bffb3274339a54ceb4f7857b849013cb217cf129.1429635674.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Nicolas Serafini <nicolas.serafini@sensefly.com>

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
[yann.morin.1998 at free.fr: split out into their own patch]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 .../nvidia-tegra23-binaries/Config.in              | 15 +++++++++++
 .../nvidia-tegra23-binaries.mk                     | 30 ++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in b/package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in
index 8c384b8..00c35b7 100644
--- a/package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in
+++ b/package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in
@@ -24,4 +24,19 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 config BR2_PACKAGE_PROVIDES_LIBOPENMAX
 	default "nvidia-tegra23-binaries"
 
+config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_GSTREAMER_PLUGINS
+	bool "GStreamer 0.10.x plugins"
+	depends on BR2_PACKAGE_GSTREAMER # Run-time only
+	help
+	  GStreamer 0.10.x plugins
+
+config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_NV_SAMPLE_APPS
+	bool "NVIDIA multimedia sample apps"
+	depends on BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_GSTREAMER_PLUGINS
+	help
+	  nvgstplayer and nvgstcapture multimedia test applications.
+
+comment "GStreamer 0.10.x plugins need GStreamer 0.10"
+	depends on !BR2_PACKAGE_GSTREAMER
+
 endif
diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
index 6e41764..fb27700 100644
--- a/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
+++ b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
@@ -10,6 +10,10 @@ NVIDIA_TEGRA23_BINARIES_SOURCE = $(NVIDIA_TEGRA23_BASE)_R$(NVIDIA_TEGRA23_BINARI
 
 NVIDIA_TEGRA23_BINARIES_LICENSE = License For Customer Use of NVIDIA Software
 NVIDIA_TEGRA23_BINARIES_LICENSE_FILES = nv_tegra/LICENSE
+ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_GSTREAMER_PLUGINS),y)
+NVIDIA_TEGRA23_BINARIES_LICENSE += LGPLv2.1
+NVIDIA_TEGRA23_BINARIES_LICENSE_FILES += nv_tegra/nv_sample_apps/LICENSE.gst-openmax
+endif
 
 NVIDIA_TEGRA23_BINARIES_INSTALL_STAGING = YES
 NVIDIA_TEGRA23_BINARIES_INSTALL_TARGET = YES
@@ -49,6 +53,11 @@ NVIDIA_TEGRA23_BINARIES_LIBRARIES = \
 NVIDIA_TEGRA23_BINARIES_DRV = \
 	nv_tegra/nvidia_drivers/usr/lib/xorg/modules/drivers/tegra_drv.abi$(BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI).so
 
+NVIDIA_TEGRA23_BINARIES_GSTREAMER_PLUGINS = \
+	libgstnv4l2.so libgstnvvidconv.so libgstnvxvimagesink.so libgstomx.so
+
+NVIDIA_TEGRA23_BINARIES_MULTIMEDIA_APPS = nvgstplayer nvgstcapture
+
 NVIDIA_TEGRA23_BINARIES_PKGCONFIG = egl.pc gles.pc glesv2.pc
 
 define NVIDIA_TEGRA23_BINARIES_EXTRACT_FURTHER
@@ -75,12 +84,31 @@ define NVIDIA_TEGRA23_BINARIES_INSTALL_LIBS
 	)
 endef
 
+ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_GSTREAMER_PLUGINS),y)
+define NVIDIA_TEGRA23_BINARIES_INSTALL_GST_PLUGINS
+	$(foreach gst_plug,$(NVIDIA_TEGRA23_BINARIES_GSTREAMER_PLUGINS),
+		$(INSTALL) -D -m 0644 $(@D)/nv_tegra/nv_sample_apps/nvgstapps/usr/lib/gstreamer-0.10/$(gst_plug) \
+			$(1)/usr/lib/gstreamer-0.10/$(gst_plug); \
+	)
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_NV_SAMPLE_APPS),y)
+define NVIDIA_TEGRA23_BINARIES_INSTALL_APPS
+	$(foreach apps,$(NVIDIA_TEGRA23_BINARIES_MULTIMEDIA_APPS),
+		$(INSTALL) -D -m 0755 $(@D)/nv_tegra/nv_sample_apps/nvgstapps/usr/bin/$(apps) \
+			$(TARGET_DIR)/usr/bin/$(apps); \
+	)
+endef
+endif
+
 define NVIDIA_TEGRA23_BINARIES_INSTALL_STAGING_CMDS
 	$(call NVIDIA_TEGRA23_BINARIES_INSTALL_LIBS,$(STAGING_DIR))
 	$(foreach pkgconfig,$(NVIDIA_TEGRA23_BINARIES_PKGCONFIG),
 		$(INSTALL) -D -m 0644 package/nvidia-tegra23/nvidia-tegra23-binaries/$(pkgconfig) \
 			$(STAGING_DIR)/usr/lib/pkgconfig/$(pkgconfig); \
 	)
+	$(call NVIDIA_TEGRA23_BINARIES_INSTALL_GST_PLUGINS,$(STAGING_DIR))
 endef
 
 define NVIDIA_TEGRA23_BINARIES_INSTALL_TARGET_CMDS
@@ -93,6 +121,8 @@ define NVIDIA_TEGRA23_BINARIES_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/etc/nv_tegra_release
 	$(INSTALL) -D -m 0644 $(@D)/$(NVIDIA_TEGRA23_BINARIES_DRV) \
 		$(TARGET_DIR)/usr/lib/xorg/modules/drivers/tegra_drv.so
+	$(call NVIDIA_TEGRA23_BINARIES_INSTALL_GST_PLUGINS,$(TARGET_DIR))
+	$(NVIDIA_TEGRA23_BINARIES_INSTALL_APPS)
 endef
 
 $(eval $(generic-package))
-- 
1.9.1
