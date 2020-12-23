From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 23 Dec 2020 23:45:49 +0100
Subject: [Buildroot] [RFC v1 2/6] package/vulkan-loader: new package
In-Reply-To: <20201223224553.8570-1-ps.report@gmx.net>
References: <20201223224553.8570-1-ps.report@gmx.net>
Message-ID: <20201223224553.8570-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in                             |  1 +
 .../0001-loader-fix-asm_offset-call.patch     | 32 +++++++++++++++++++
 package/vulkan-loader/Config.in               | 14 ++++++++
 package/vulkan-loader/vulkan-loader.hash      |  3 ++
 package/vulkan-loader/vulkan-loader.mk        | 22 +++++++++++++
 5 files changed, 72 insertions(+)
 create mode 100644 package/vulkan-loader/0001-loader-fix-asm_offset-call.patch
 create mode 100644 package/vulkan-loader/Config.in
 create mode 100644 package/vulkan-loader/vulkan-loader.hash
 create mode 100644 package/vulkan-loader/vulkan-loader.mk

diff --git a/package/Config.in b/package/Config.in
index 9ede3b770f..8b96a61e33 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -335,6 +335,7 @@ comment "Graphic libraries"
 	source "package/sdl2_ttf/Config.in"
 	source "package/tk/Config.in"
 	source "package/vulkan-headers/Config.in"
+	source "package/vulkan-loader/Config.in"
 
 comment "Other GUIs"
 	source "package/qt5/Config.in"
diff --git a/package/vulkan-loader/0001-loader-fix-asm_offset-call.patch b/package/vulkan-loader/0001-loader-fix-asm_offset-call.patch
new file mode 100644
index 0000000000..d62b9390d8
--- /dev/null
+++ b/package/vulkan-loader/0001-loader-fix-asm_offset-call.patch
@@ -0,0 +1,32 @@
+From 45098898f7fa25dfd12d2c4f1aed889f678aa870 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Wed, 23 Dec 2020 14:46:02 +0100
+Subject: [PATCH] loader: fix asm_offset call
+
+Disable assembler usage (not cross compile capable):
+
+  [ 21%] Generating gen_defines.asm
+  /bin/sh: asm_offset: command not found
+  make[3]: *** [loader/CMakeFiles/loader_asm_gen_files.dir/build.make:80: loader/gen_defines.asm] Error 127
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ loader/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/loader/CMakeLists.txt b/loader/CMakeLists.txt
+index ba9f460f1..dbebfb058 100644
+--- a/loader/CMakeLists.txt
++++ b/loader/CMakeLists.txt
+@@ -187,7 +187,7 @@ else(UNIX AND NOT APPLE) # i.e.: Linux
+     endif()
+     set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
+     try_compile(ASSEMBLER_WORKS ${CMAKE_CURRENT_BINARY_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/asm_test.S)
+-    if(ASSEMBLER_WORKS)
++    if(FALSE)
+         set(OPT_LOADER_SRCS ${OPT_LOADER_SRCS} unknown_ext_chain_gas.S)
+         add_executable(asm_offset asm_offset.c)
+         target_link_libraries(asm_offset Vulkan::Headers)
+-- 
+2.29.2
+
diff --git a/package/vulkan-loader/Config.in b/package/vulkan-loader/Config.in
new file mode 100644
index 0000000000..9c215dc9ce
--- /dev/null
+++ b/package/vulkan-loader/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_VULKAN_LOADER
+	bool "vulkan-loader"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_VULKAN_HEADERS
+	help
+	  The Khronos official Vulkan ICD desktop loader.
+
+	  https://github.com/KhronosGroup/Vulkan-Loader
+
+comment "vulkan-loader needs a toolchain w/ C++, dynamic library, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/vulkan-loader/vulkan-loader.hash b/package/vulkan-loader/vulkan-loader.hash
new file mode 100644
index 0000000000..c70ed90be6
--- /dev/null
+++ b/package/vulkan-loader/vulkan-loader.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  e582dce35051a34af82db2a8fcd38fbc5837b4506e76e6cda685dca02dee01c7  vulkan-loader-1.2.162.tar.gz
+sha256  43c0a37e6a0fa7ff3c843b3ec5a4fac84b712558ddac103fbd4c1649662a9ece  LICENSE.txt
diff --git a/package/vulkan-loader/vulkan-loader.mk b/package/vulkan-loader/vulkan-loader.mk
new file mode 100644
index 0000000000..ff6c0f869b
--- /dev/null
+++ b/package/vulkan-loader/vulkan-loader.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# vulkan-loader
+#
+################################################################################
+
+VULKAN_LOADER_VERSION = 1.2.162
+VULKAN_LOADER_SITE = $(call github,KhronosGroup,Vulkan-Loader,v$(VULKAN_LOADER_VERSION))
+VULKAN_LOADER_LICENSE = Apache-2.0 License
+VULKAN_LOADER_LICENSE_FILES = LICENSE.txt
+VULKAN_LOADER_INSTALL_STAGING = YES
+
+VULKAN_LOADER_DEPENDENCIES = vulkan-headers
+
+VULKAN_LOADER_CONF_OPTS += \
+	-DBUILD_WSI_XCB_SUPPORT=OFF \
+	-DBUILD_WSI_XLIB_SUPPORT=OFF \
+	-DBUILD_WSI_WAYLAND_SUPPORT=OFF \
+	-DBUILD_WSI_DIRECTFB_SUPPORT=OFF \
+	-DUSE_CCACHE=OFF
+
+$(eval $(cmake-package))
-- 
2.29.2
