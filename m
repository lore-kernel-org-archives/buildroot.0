From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 10 Jan 2021 23:28:31 +0100
Subject: [Buildroot] [RFC v2 10/12] package/vulkan-loader: add XCB support
In-Reply-To: <20210110222833.26301-1-ps.report@gmx.net>
References: <20210110222833.26301-1-ps.report@gmx.net>
Message-ID: <20210110222833.26301-11-ps.report@gmx.net>
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
 package/vulkan-loader/Config.in        | 12 ++++++++++++
 package/vulkan-loader/vulkan-loader.mk |  8 +++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/package/vulkan-loader/Config.in b/package/vulkan-loader/Config.in
index 9c215dc9ce..6ec4b13030 100644
--- a/package/vulkan-loader/Config.in
+++ b/package/vulkan-loader/Config.in
@@ -9,6 +9,18 @@ config BR2_PACKAGE_VULKAN_LOADER
 
 	  https://github.com/KhronosGroup/Vulkan-Loader
 
+if BR2_PACKAGE_VULKAN_LOADER
+
+config BR2_PACKAGE_VULKAN_LOADER_XCB
+	bool "X.org XCB support"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBXCB
+
+comment "X.org XCB support available if X.org is enabled"
+	depends on !BR2_PACKAGE_XORG7
+
+endif # BR2_PACKAGE_VULKAN_LOADER
+
 comment "vulkan-loader needs a toolchain w/ C++, dynamic library, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/vulkan-loader/vulkan-loader.mk b/package/vulkan-loader/vulkan-loader.mk
index 9c9ccb2458..f0c20f5687 100644
--- a/package/vulkan-loader/vulkan-loader.mk
+++ b/package/vulkan-loader/vulkan-loader.mk
@@ -13,10 +13,16 @@ VULKAN_LOADER_INSTALL_STAGING = YES
 VULKAN_LOADER_DEPENDENCIES = vulkan-headers
 
 VULKAN_LOADER_CONF_OPTS += \
-	-DBUILD_WSI_XCB_SUPPORT=OFF \
 	-DBUILD_WSI_XLIB_SUPPORT=OFF \
 	-DBUILD_WSI_WAYLAND_SUPPORT=OFF \
 	-DBUILD_WSI_DIRECTFB_SUPPORT=OFF \
 	-DUSE_CCACHE=OFF
 
+ifeq ($(BR2_PACKAGE_VULKAN_LOADER_XCB),y)
+VULKAN_LOADER_DEPENDENCIES += libxcb
+VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XCB_SUPPORT=ON
+else
+VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XCB_SUPPORT=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.29.2
