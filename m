From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 22:24:10 +0200
Subject: [Buildroot] [git commit] package.nvidia-tegra23-binaries: add
	gstreamer plugins
Message-ID: <20150426202425.1FB63818C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f2c2bd0b7a1f8d08ed88c35dc6b736d522ba1e02
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - add missing libXv dependency.
  - remove the NVIDIA_TEGRA23_BINARIES_GSTREAMER_PLUGINS and
    NVIDIA_TEGRA23_BINARIES_MULTIMEDIA_APPS, and use simple 'cp -dpfr'
    calls to copy the plugins and sample applications.]

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
[yann.morin.1998 at free.fr: split out into their own patch]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../nvidia-tegra23-binaries/Config.in              |   16 +++++++++++
 .../nvidia-tegra23-binaries.mk                     |   27 ++++++++++++++++++++
 2 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in b/package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in
index d2b6223..573ab90 100644
--- a/package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in
+++ b/package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in
@@ -23,4 +23,20 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 config BR2_PACKAGE_PROVIDES_LIBOPENMAX
 	default "nvidia-tegra23-binaries"
 
+config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_GSTREAMER_PLUGINS
+	bool "GStreamer 0.10.x plugins"
+	depends on BR2_PACKAGE_GSTREAMER # Run-time only
+	select BR2_PACKAGE_XLIB_LIBXV
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
index 1d6c0f8..7b6029e 100644
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
 
@@ -20,6 +24,10 @@ NVIDIA_TEGRA23_BINARIES_INSTALL_STAGING = YES
 NVIDIA_TEGRA23_BINARIES_DEPENDENCIES = mesa3d-headers \
 	xlib_libX11 xlib_libXext
 
+ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_GSTREAMER_PLUGINS),y)
+NVIDIA_TEGRA23_BINARIES_DEPENDENCIES += xlib_libXv
+endif
+
 NVIDIA_TEGRA23_BINARIES_PROVIDES = libegl libgles libopenmax
 
 NVIDIA_TEGRA23_BINARIES_DRV = \
@@ -47,11 +55,28 @@ define NVIDIA_TEGRA23_BINARIES_INSTALL_LIBS
 	)
 endef
 
+ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_GSTREAMER_PLUGINS),y)
+define NVIDIA_TEGRA23_BINARIES_INSTALL_GST_PLUGINS
+	mkdir -p $(1)/usr/lib/gstreamer-0.10/
+	cp -dpfr $(@D)/nv_tegra/nv_sample_apps/nvgstapps/usr/lib/gstreamer-0.10/*.so \
+		$(1)/usr/lib/gstreamer-0.10/
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_NV_SAMPLE_APPS),y)
+define NVIDIA_TEGRA23_BINARIES_INSTALL_APPS
+	mkdir -p $(TARGET_DIR)/usr/bin/
+	cp -dpfr $(@D)/nv_tegra/nv_sample_apps/nvgstapps/usr/bin/* \
+		$(TARGET_DIR)/usr/bin/
+endef
+endif
+
 define NVIDIA_TEGRA23_BINARIES_INSTALL_STAGING_CMDS
 	$(call NVIDIA_TEGRA23_BINARIES_INSTALL_LIBS,$(STAGING_DIR))
 	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig/
 	cp -dpfr package/nvidia-tegra23/nvidia-tegra23-binaries/*.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/
+	$(call NVIDIA_TEGRA23_BINARIES_INSTALL_GST_PLUGINS,$(STAGING_DIR))
 endef
 
 define NVIDIA_TEGRA23_BINARIES_INSTALL_TARGET_CMDS
@@ -63,6 +88,8 @@ define NVIDIA_TEGRA23_BINARIES_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/etc/nv_tegra_release
 	$(INSTALL) -D -m 0644 $(@D)/$(NVIDIA_TEGRA23_BINARIES_DRV) \
 		$(TARGET_DIR)/usr/lib/xorg/modules/drivers/tegra_drv.so
+	$(call NVIDIA_TEGRA23_BINARIES_INSTALL_GST_PLUGINS,$(TARGET_DIR))
+	$(NVIDIA_TEGRA23_BINARIES_INSTALL_APPS)
 endef
 
 $(eval $(generic-package))
