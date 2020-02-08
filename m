From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Feb 2020 22:42:59 +0100
Subject: [Buildroot] [git commit] package/nvidia-tegra23-binaries: drop
 gstreamer 0.10.x support
Message-ID: <20200208214332.30C018D665@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=602e96801082263c185fc45696ccd6d4f6134274
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the upcoming removal of gstreamer 0.10, the logic for installing
binaries using gstreamer 0.10.x in nvidia-tegra23-binaries must go as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                                   | 14 ++++++++++
 .../nvidia-tegra23-binaries/Config.in              | 16 -----------
 .../nvidia-tegra23-binaries.mk                     | 31 ----------------------
 3 files changed, 14 insertions(+), 47 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 96848f7f06..e9725d30b3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,20 @@ endif
 
 comment "Legacy options removed in 2020.02"
 
+config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_GSTREAMER_PLUGINS
+	bool "nvidia-tegra23 binaries gstreamer 0.10.x support removed"
+	select BR2_LEGACY
+	help
+	  Gstreamer 0.10.x is no longer available in Buildroot, so
+	  neither is the support in nvidia-tegra23 binaries.
+
+config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_NV_SAMPLE_APPS
+	bool "nvidia-tegra23 binaries sample apps removed"
+	select BR2_LEGACY
+	help
+	  Gstreamer 0.10.x is no longer available in Buildroot, so
+	  neither is the support in nvidia-tegra23 binaries.
+
 config BR2_PACKAGE_FREERDP_GSTREAMER
 	bool "freerdp gstreamer 0.10.x support removed"
 	select BR2_LEGACY
diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in b/package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in
index 3494c5b9a8..0c09051b6a 100644
--- a/package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in
+++ b/package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in
@@ -23,20 +23,4 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 config BR2_PACKAGE_PROVIDES_LIBOPENMAX
 	default "nvidia-tegra23-binaries"
 
-config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_GSTREAMER_PLUGINS
-	bool "GStreamer 0.10.x plugins"
-	depends on BR2_PACKAGE_GSTREAMER # Run-time only
-	select BR2_PACKAGE_XLIB_LIBXV
-	help
-	  GStreamer 0.10.x plugins
-
-config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_NV_SAMPLE_APPS
-	bool "NVIDIA multimedia sample apps"
-	depends on BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_GSTREAMER_PLUGINS
-	help
-	  nvgstplayer and nvgstcapture multimedia test applications.
-
-comment "GStreamer 0.10.x plugins need GStreamer 0.10"
-	depends on !BR2_PACKAGE_GSTREAMER
-
 endif
diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
index 9b153b0250..ed3c5a78b4 100644
--- a/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
+++ b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
@@ -10,10 +10,6 @@ NVIDIA_TEGRA23_BINARIES_SOURCE = $(NVIDIA_TEGRA23_BASE)_R$(NVIDIA_TEGRA23_BINARI
 
 NVIDIA_TEGRA23_BINARIES_LICENSE = License For Customer Use of NVIDIA Software
 NVIDIA_TEGRA23_BINARIES_LICENSE_FILES = nv_tegra/LICENSE
-ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_GSTREAMER_PLUGINS),y)
-NVIDIA_TEGRA23_BINARIES_LICENSE += LGPL-2.1
-NVIDIA_TEGRA23_BINARIES_LICENSE_FILES += nv_tegra/nv_sample_apps/LICENSE.gst-openmax
-endif
 
 NVIDIA_TEGRA23_BINARIES_INSTALL_STAGING = YES
 
@@ -24,10 +20,6 @@ NVIDIA_TEGRA23_BINARIES_INSTALL_STAGING = YES
 NVIDIA_TEGRA23_BINARIES_DEPENDENCIES = mesa3d-headers \
 	xlib_libX11 xlib_libXext
 
-ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_GSTREAMER_PLUGINS),y)
-NVIDIA_TEGRA23_BINARIES_DEPENDENCIES += xlib_libXv
-endif
-
 NVIDIA_TEGRA23_BINARIES_PROVIDES = libegl libgles libopenmax
 
 NVIDIA_TEGRA23_BINARIES_DRV = \
@@ -38,10 +30,6 @@ define NVIDIA_TEGRA23_BINARIES_EXTRACT_FURTHER
 	$(call suitable-extractor,$(@D)/nv_tegra/nvidia_drivers.tbz2) \
 		$(@D)/nv_tegra/nvidia_drivers.tbz2 | \
 	$(TAR) --strip-components=0 -C $(@D)/nv_tegra/nvidia_drivers/ $(TAR_OPTIONS) -
-	$(INSTALL) -d $(@D)/nv_tegra/nv_sample_apps/nvgstapps
-	$(call suitable-extractor,$(@D)/nv_tegra/nv_sample_apps/nvgstapps.tbz2) \
-		$(@D)/nv_tegra/nv_sample_apps/nvgstapps.tbz2 | \
-	$(TAR) --strip-components=0 -C $(@D)/nv_tegra/nv_sample_apps/nvgstapps/ $(TAR_OPTIONS) -
 endef
 NVIDIA_TEGRA23_BINARIES_POST_EXTRACT_HOOKS += NVIDIA_TEGRA23_BINARIES_EXTRACT_FURTHER
 
@@ -55,28 +43,11 @@ define NVIDIA_TEGRA23_BINARIES_INSTALL_LIBS
 	)
 endef
 
-ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_GSTREAMER_PLUGINS),y)
-define NVIDIA_TEGRA23_BINARIES_INSTALL_GST_PLUGINS
-	mkdir -p $(1)/usr/lib/gstreamer-0.10/
-	cp -dpfr $(@D)/nv_tegra/nv_sample_apps/nvgstapps/usr/lib/gstreamer-0.10/*.so \
-		$(1)/usr/lib/gstreamer-0.10/
-endef
-endif
-
-ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_NV_SAMPLE_APPS),y)
-define NVIDIA_TEGRA23_BINARIES_INSTALL_APPS
-	mkdir -p $(TARGET_DIR)/usr/bin/
-	cp -dpfr $(@D)/nv_tegra/nv_sample_apps/nvgstapps/usr/bin/* \
-		$(TARGET_DIR)/usr/bin/
-endef
-endif
-
 define NVIDIA_TEGRA23_BINARIES_INSTALL_STAGING_CMDS
 	$(call NVIDIA_TEGRA23_BINARIES_INSTALL_LIBS,$(STAGING_DIR))
 	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig/
 	cp -dpfr package/nvidia-tegra23/nvidia-tegra23-binaries/*.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/
-	$(call NVIDIA_TEGRA23_BINARIES_INSTALL_GST_PLUGINS,$(STAGING_DIR))
 endef
 
 define NVIDIA_TEGRA23_BINARIES_INSTALL_TARGET_CMDS
@@ -88,8 +59,6 @@ define NVIDIA_TEGRA23_BINARIES_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/etc/nv_tegra_release
 	$(INSTALL) -D -m 0644 $(@D)/$(NVIDIA_TEGRA23_BINARIES_DRV) \
 		$(TARGET_DIR)/usr/lib/xorg/modules/drivers/tegra_drv.so
-	$(call NVIDIA_TEGRA23_BINARIES_INSTALL_GST_PLUGINS,$(TARGET_DIR))
-	$(NVIDIA_TEGRA23_BINARIES_INSTALL_APPS)
 endef
 
 $(eval $(generic-package))
