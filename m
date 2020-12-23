From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 23 Dec 2020 23:45:53 +0100
Subject: [Buildroot] [RFC v1 6/6] package/qt5base: add vulkan option
In-Reply-To: <20201223224553.8570-1-ps.report@gmx.net>
References: <20201223224553.8570-1-ps.report@gmx.net>
Message-ID: <20201223224553.8570-7-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:
  - eglfs/vulkan is only implemented for eglfs_viv
    (see stub implementation for QEglFSDeviceIntegration::createPlatformVulkanInstance()
    in src/plugins/platforms/eglfs/api/qeglfsdeviceintegration.cpp and
    real implementation for QEglFSVivIntegration::createPlatformVulkanInstance()
    in src/plugins/platforms/eglfs/deviceintegration/eglfs_viv/qeglfsvivintegration.cpp)
  - or for xcb (see QXcbIntegration::createPlatformVulkanInstance()
    in src/plugins/platforms/xcb/qxcbintegration.cpp)
---
 package/qt5/qt5base/Config.in  | 11 +++++++++++
 package/qt5/qt5base/qt5base.mk |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index ee7c757c60..377a754f37 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -175,6 +175,17 @@ config BR2_PACKAGE_QT5BASE_OPENGL_LIB
 
 endif
 
+config BR2_PACKAGE_QT5BASE_VULKAN
+	bool "Vulkan support"
+	# all vulkan-loader introduced dependencies superseeded by qt5 own ones
+	# depends on BR2_INSTALL_LIBSTDCPP # vulkan-loader
+	# depends on !BR2_STATIC_LIBS # vulkan-loader
+	# depends on BR2_TOOLCHAIN_HAS_THREADS # vulkan-loader
+	select BR2_PACKAGE_VULKAN_HEADERS
+	select BR2_PACKAGE_VULKAN_LOADER
+	help
+	  This option enables Vulkan support.
+
 config BR2_PACKAGE_QT5BASE_LINUXFB
 	bool "linuxfb support"
 
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 84e9fa4edb..3755e306d1 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -196,6 +196,13 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-opengl
 endif
 
+ifeq ($(BR2_PACKAGE_QT5BASE_VULKAN),y)
+QT5BASE_CONFIGURE_OPTS += -feature-vulkan
+QT5BASE_DEPENDENCIES   += vulkan-headers vulkan-loader
+else
+QT5BASE_CONFIGURE_OPTS += -no-feature-vulkan
+endif
+
 QT5BASE_DEFAULT_QPA = $(call qstrip,$(BR2_PACKAGE_QT5BASE_DEFAULT_QPA))
 QT5BASE_CONFIGURE_OPTS += $(if $(QT5BASE_DEFAULT_QPA),-qpa $(QT5BASE_DEFAULT_QPA))
 
-- 
2.29.2
