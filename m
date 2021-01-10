From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 10 Jan 2021 23:28:28 +0100
Subject: [Buildroot] [RFC v2 07/12] package/vulkan-tools: new package
In-Reply-To: <20210110222833.26301-1-ps.report@gmx.net>
References: <20210110222833.26301-1-ps.report@gmx.net>
Message-ID: <20210110222833.26301-8-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - fix license SPDX (Yann E. MORIN)
  - disable ICD (as it is only a mock ICD for testing purpouse)
---
 package/Config.in                      |  1 +
 package/vulkan-tools/Config.in         | 17 +++++++++++++++++
 package/vulkan-tools/vulkan-tools.hash |  3 +++
 package/vulkan-tools/vulkan-tools.mk   | 25 +++++++++++++++++++++++++
 4 files changed, 46 insertions(+)
 create mode 100644 package/vulkan-tools/Config.in
 create mode 100644 package/vulkan-tools/vulkan-tools.hash
 create mode 100644 package/vulkan-tools/vulkan-tools.mk

diff --git a/package/Config.in b/package/Config.in
index 86676b57ef..b156d8de1a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -340,6 +340,7 @@ comment "Graphic libraries"
 	source "package/tk/Config.in"
 	source "package/vulkan-headers/Config.in"
 	source "package/vulkan-loader/Config.in"
+	source "package/vulkan-tools/Config.in"
 
 comment "Other GUIs"
 	source "package/qt5/Config.in"
diff --git a/package/vulkan-tools/Config.in b/package/vulkan-tools/Config.in
new file mode 100644
index 0000000000..54fa539dab
--- /dev/null
+++ b/package/vulkan-tools/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_VULKAN_TOOLS
+	bool "vulkan-tools"
+	depends on BR2_INSTALL_LIBSTDCPP # vulkan-loader
+	depends on !BR2_STATIC_LIBS # vullan-loader
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS # vulkan-loader
+	select BR2_PACKAGE_VULKAN_HEADERS
+	select BR2_PACKAGE_VULKAN_LOADER
+
+	help
+	  The Khronos official Vulkan Tools and Utilities.
+
+	  https://github.com/KhronosGroup/Vulkan-Tools
+
+comment "vulkan-tools needs a toolchain w/ C++, dynamic library, threads, gcc >= 4.9"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/vulkan-tools/vulkan-tools.hash b/package/vulkan-tools/vulkan-tools.hash
new file mode 100644
index 0000000000..a4cf97ab34
--- /dev/null
+++ b/package/vulkan-tools/vulkan-tools.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  98a3a00471da65df833b4ffeb1ab29ec1d169d5feab54270cf4cd8f50f82e682  vulkan-tools-1.2.162.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/vulkan-tools/vulkan-tools.mk b/package/vulkan-tools/vulkan-tools.mk
new file mode 100644
index 0000000000..129efddf3b
--- /dev/null
+++ b/package/vulkan-tools/vulkan-tools.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# vulkan-tools
+#
+################################################################################
+
+VULKAN_TOOLS_VERSION = 1.2.162
+VULKAN_TOOLS_SITE = $(call github,KhronosGroup,Vulkan-Tools,v$(VULKAN_TOOLS_VERSION))
+VULKAN_TOOLS_LICENSE = Apache-2.0
+VULKAN_TOOLS_LICENSE_FILES = LICENSE.txt
+
+VULKAN_TOOLS_DEPENDENCIES = vulkan-headers vulkan-loader
+
+VULKAN_TOOLS_CONF_OPTS += \
+	-DBUILD_CUBE=OFF \
+	-DBUILD_VULKANINFO=ON \
+	-DBUILD_ICD=OFF \
+	-DINSTALL_ICD=OFF \
+	-DBUILD_WSI_XCB_SUPPORT=OFF \
+	-DBUILD_WSI_XLIB_SUPPORT=OFF \
+	-DBUILD_WSI_WAYLAND_SUPPORT=OFF \
+	-DBUILD_WSI_DIRECTFB_SUPPORT=OFF \
+	-DUSE_CCACHE=OFF
+
+$(eval $(cmake-package))
-- 
2.29.2
