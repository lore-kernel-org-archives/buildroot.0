From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 10 Jan 2021 23:28:32 +0100
Subject: [Buildroot] [RFC v2 11/12] package/vulkan-tools: add XCB support
In-Reply-To: <20210110222833.26301-1-ps.report@gmx.net>
References: <20210110222833.26301-1-ps.report@gmx.net>
Message-ID: <20210110222833.26301-12-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - new patch
---
 package/vulkan-tools/Config.in       | 14 ++++++++++++++
 package/vulkan-tools/vulkan-tools.mk |  8 +++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/package/vulkan-tools/Config.in b/package/vulkan-tools/Config.in
index 54fa539dab..14c4059074 100644
--- a/package/vulkan-tools/Config.in
+++ b/package/vulkan-tools/Config.in
@@ -12,6 +12,20 @@ config BR2_PACKAGE_VULKAN_TOOLS
 
 	  https://github.com/KhronosGroup/Vulkan-Tools
 
+if BR2_PACKAGE_VULKAN_TOOLS
+
+config BR2_PACKAGE_VULKAN_TOOLS_XCB
+	bool "X.org XCB support"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_VULKAN_LOADER_XCB
+
+comment "X.org XCB support available if X.org is enabled"
+	depends on !BR2_PACKAGE_XORG7
+
+endif # BR2_PACKAGE_VULKAN_TOOLS
+
 comment "vulkan-tools needs a toolchain w/ C++, dynamic library, threads, gcc >= 4.9"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/vulkan-tools/vulkan-tools.mk b/package/vulkan-tools/vulkan-tools.mk
index 129efddf3b..5b4d761ddb 100644
--- a/package/vulkan-tools/vulkan-tools.mk
+++ b/package/vulkan-tools/vulkan-tools.mk
@@ -16,10 +16,16 @@ VULKAN_TOOLS_CONF_OPTS += \
 	-DBUILD_VULKANINFO=ON \
 	-DBUILD_ICD=OFF \
 	-DINSTALL_ICD=OFF \
-	-DBUILD_WSI_XCB_SUPPORT=OFF \
 	-DBUILD_WSI_XLIB_SUPPORT=OFF \
 	-DBUILD_WSI_WAYLAND_SUPPORT=OFF \
 	-DBUILD_WSI_DIRECTFB_SUPPORT=OFF \
 	-DUSE_CCACHE=OFF
 
+ifeq ($(BR2_PACKAGE_VULKAN_TOOLS_XCB),y)
+VULKAN_TOOLS_DEPENDENCIES += libxcb xlib_libX11
+VULKAN_TOOLS_CONF_OPTS += -DBUILD_WSI_XCB_SUPPORT=ON
+else
+VULKAN_TOOLS_CONF_OPTS += -DBUILD_WSI_XCB_SUPPORT=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.29.2
