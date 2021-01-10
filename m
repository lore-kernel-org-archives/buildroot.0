From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 10 Jan 2021 23:28:21 +0100
Subject: [Buildroot] [RFC v2 00/12] Vulkan support
Message-ID: <20210110222833.26301-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to first patch series ([1]) to add ome/more Vulkan support to
Buildroot.

Targeting towards the RPi Vulkan support (as announced e.g. [2]),
but send as RFC as not all previous review comments are handled yet.

This is the first 'running' version, tested on RPi 4 (32-/64-Bit) with
the QT vulkan examples.

Tested with the following defconfig (32-Bit, dtoverlay=vc4-kms-v3d-pi4):

BR2_arm=y
BR2_cortex_a72=y
BR2_ARM_FPU_NEON_VFPV4=y
BR2_OPTIMIZE_3=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_PACKAGE_GLIBC_UTILS=y
BR2_BINUTILS_VERSION_2_35_X=y
BR2_GCC_VERSION_10_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_SYSTEM_DHCP="eth0"
BR2_GENERATE_LOCALE="en_US"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4/post-image.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,7e7689a032a66685b6a045b75265579bae838a00)/linux-7e7689a032a66685b6a045b75265579bae838a00.tar.gz"
BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2711-rpi-4-b"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_STRACE=y
BR2_PACKAGE_DEJAVU=y
BR2_PACKAGE_MESA3D_DEMOS=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4=y
BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_VULKAN_TOOLS=y
BR2_PACKAGE_VULKAN_TOOLS_XCB=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_EXAMPLES=y
BR2_PACKAGE_QT5BASE_GUI=y
BR2_PACKAGE_QT5BASE_OPENGL=y
BR2_PACKAGE_QT5BASE_OPENGL_ES2=y
BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
BR2_PACKAGE_QT5BASE_VULKAN=y
BR2_PACKAGE_QT5BASE_XCB=y
BR2_PACKAGE_QT5BASE_DEFAULT_QPA="xcb"
BR2_PACKAGE_QT5BASE_FONTCONFIG=y
BR2_PACKAGE_QT5BASE_HARFBUZZ=y
BR2_PACKAGE_QT5BASE_GIF=y
BR2_PACKAGE_QT5BASE_JPEG=y
BR2_PACKAGE_QT5BASE_PNG=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XDRIVER_XF86_INPUT_LIBINPUT=y
BR2_PACKAGE_XTERM=y
BR2_PACKAGE_RPI_FIRMWARE=y
BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
BR2_PACKAGE_LIBEPOXY=y
BR2_PACKAGE_OPENSSH=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y

And with the following defconfig (64-Bit, dtoverlay=vc4-kms-v3d-pi4):

BR2_aarch64=y
BR2_cortex_a72=y
BR2_ARM_FPU_VFPV4=y
BR2_OPTIMIZE_3=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_PACKAGE_GLIBC_UTILS=y
BR2_BINUTILS_VERSION_2_35_X=y
BR2_GCC_VERSION_10_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_SYSTEM_DHCP="eth0"
BR2_GENERATE_LOCALE="en_US"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4-64/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4-64/post-image.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay --aarch64"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,967d45b29ca2902f031b867809d72e3b3d623e7a)/linux-967d45b29ca2902f031b867809d72e3b3d623e7a.tar.gz"
BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_STRACE=y
BR2_PACKAGE_DEJAVU=y
BR2_PACKAGE_MESA3D_DEMOS=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4=y
BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_VULKAN_TOOLS=y
BR2_PACKAGE_VULKAN_TOOLS_XCB=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_EXAMPLES=y
BR2_PACKAGE_QT5BASE_GUI=y
BR2_PACKAGE_QT5BASE_OPENGL=y
BR2_PACKAGE_QT5BASE_OPENGL_ES2=y
BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
BR2_PACKAGE_QT5BASE_VULKAN=y
BR2_PACKAGE_QT5BASE_XCB=y
BR2_PACKAGE_QT5BASE_DEFAULT_QPA="xcb"
BR2_PACKAGE_QT5BASE_FONTCONFIG=y
BR2_PACKAGE_QT5BASE_HARFBUZZ=y
BR2_PACKAGE_QT5BASE_GIF=y
BR2_PACKAGE_QT5BASE_JPEG=y
BR2_PACKAGE_QT5BASE_PNG=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XTERM=y
BR2_PACKAGE_RPI_FIRMWARE=y
BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
BR2_PACKAGE_LIBEPOXY=y
BR2_PACKAGE_OPENSSH=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y

Next steps:
 - fix mesa3d/swrast stand-alone link failure
 - sync with freescale-imx libvulkan patches (see [3], [4])
 - take a look at (and fix) the remaining review comments from Yann

Runtime tests done:

  - glxinfo

	$ glxinfo
name of display: :0
display: :0  screen: 0
direct rendering: Yes
server glx vendor string: SGI
server glx version string: 1.4
[...]
Extended renderer info (GLX_MESA_query_renderer):
    Vendor: Broadcom (0x14e4)
    Device: V3D 4.2 (0xffffffff)
    Version: 20.3.2
    Accelerated: yes
    Video memory: 830MB
    Unified memory: yes
    Preferred profile: compat (0x2)
    Max core profile version: 0.0
    Max compat profile version: 2.1
    Max GLES1 profile version: 1.1
    Max GLES[23] profile version: 3.1
OpenGL vendor string: Broadcom
OpenGL renderer string: V3D 4.2
OpenGL version string: 2.1 Mesa 20.3.2
OpenGL shading language version string: 1.20
[...]

  - vulkaninfo

	$ vulkaninfo 
WARNING: v3dv is neither a complete nor a conformant Vulkan implementation. Testing use only.
==========
VULKANINFO
==========

Vulkan Instance Version: 1.2.165


Instance Extensions: count = 7
==============================
	VK_EXT_debug_report                    : extension revision 9
	VK_EXT_debug_utils                     : extension revision 2
	VK_KHR_external_memory_capabilities    : extension revision 1
	VK_KHR_get_physical_device_properties2 : extension revision 1
	VK_KHR_get_surface_capabilities2       : extension revision 1
	VK_KHR_surface                         : extension revision 25
	VK_KHR_xcb_surface                     : extension revision 6

Layers: count = 0
=================
Presentable Surfaces:
=====================
GPU id : 0 (V3D 4.2):
	Surface type = VK_KHR_xcb_surface
	Formats: count = 2
		SurfaceFormat[0]:
			format = FORMAT_B8G8R8A8_SRGB
			colorSpace = COLOR_SPACE_SRGB_NONLINEAR_KHR
		SurfaceFormat[1]:
			format = FORMAT_B8G8R8A8_UNORM
			colorSpace = COLOR_SPACE_SRGB_NONLINEAR_KHR
	Present Modes: count = 4
		PRESENT_MODE_IMMEDIATE_KHR
		PRESENT_MODE_MAILBOX_KHR
		PRESENT_MODE_FIFO_KHR
		PRESENT_MODE_FIFO_RELAXED_KHR
	VkSurfaceCapabilitiesKHR:
	-------------------------
		minImageCount       = 3
		maxImageCount       = 0
		currentExtent:
			width  = 256
			height = 256
		minImageExtent:
			width  = 256
			height = 256
		maxImageExtent:
			width  = 256
			height = 256
		maxImageArrayLayers = 1
		supportedTransforms: count = 1
			SURFACE_TRANSFORM_IDENTITY_BIT_KHR
		currentTransform    = SURFACE_TRANSFORM_IDENTITY_BIT_KHR
		supportedCompositeAlpha: count = 2
			COMPOSITE_ALPHA_OPAQUE_BIT_KHR
			COMPOSITE_ALPHA_INHERIT_BIT_KHR
		supportedUsageFlags: count = 4
			IMAGE_USAGE_TRANSFER_SRC_BIT
			IMAGE_USAGE_TRANSFER_DST_BIT
			IMAGE_USAGE_STORAGE_BIT
			IMAGE_USAGE_COLOR_ATTACHMENT_BIT


Device Properties and Extensions:
=================================
GPU0:
-----
VkPhysicalDeviceProperties:
---------------------------
	apiVersion     = 4194459 (1.0.155)
	driverVersion  = 83898370 (0x5003002)
	vendorID       = 0x14e4
	deviceID       = 0x002a
	deviceType     = PHYSICAL_DEVICE_TYPE_INTEGRATED_GPU
	deviceName     = V3D 4.2
[...]


  - QT examples

	$ /usr/lib/qt/examples/opengl/hellogl2/hellogl2
	$ /usr/lib/qt/examples/vulkan/hellovulkancubes/hellovulkancubes
 
Regards,
Peter

[1] http://lists.busybox.net/pipermail/buildroot/2020-December/299219.html
[2] https://www.raspberrypi.org/blog/vulkan-update-were-conformant/
[3] http://lists.busybox.net/pipermail/buildroot/2020-December/299716.html
[4] http://lists.busybox.net/pipermail/buildroot/2020-December/299717.html

Peter Seiderer (12):
  package/mesa3d: add config option for DRI3 support
  package/mesa3d: fix vulkan/intel dependencies
  package/mesa3d: fix gbm config warning
  package/mesa3d: DRI3 with GLX needs xshmfence
  package/vulkan-headers: new package
  package/vulkan-loader: new package
  package/vulkan-tools: new package
  package/mesa3d: add vulkan broadcom driver support
  package/qt5base: add vulkan option
  package/vulkan-loader: add XCB support
  package/vulkan-tools: add XCB support
  WIP: package/mesa3d: add vulkan swrast driver support

 package/Config.in                             |  3 ++
 package/mesa3d/Config.in                      | 44 +++++++++++++++++--
 package/mesa3d/mesa3d.mk                      | 18 +++++---
 package/qt5/qt5base/Config.in                 | 11 +++++
 package/qt5/qt5base/qt5base.mk                |  7 +++
 package/vulkan-headers/Config.in              |  7 +++
 package/vulkan-headers/vulkan-headers.hash    |  3 ++
 package/vulkan-headers/vulkan-headers.mk      | 13 ++++++
 .../0001-loader-fix-asm_offset-call.patch     | 32 ++++++++++++++
 package/vulkan-loader/Config.in               | 26 +++++++++++
 package/vulkan-loader/vulkan-loader.hash      |  3 ++
 package/vulkan-loader/vulkan-loader.mk        | 28 ++++++++++++
 package/vulkan-tools/Config.in                | 31 +++++++++++++
 package/vulkan-tools/vulkan-tools.hash        |  3 ++
 package/vulkan-tools/vulkan-tools.mk          | 31 +++++++++++++
 15 files changed, 251 insertions(+), 9 deletions(-)
 create mode 100644 package/vulkan-headers/Config.in
 create mode 100644 package/vulkan-headers/vulkan-headers.hash
 create mode 100644 package/vulkan-headers/vulkan-headers.mk
 create mode 100644 package/vulkan-loader/0001-loader-fix-asm_offset-call.patch
 create mode 100644 package/vulkan-loader/Config.in
 create mode 100644 package/vulkan-loader/vulkan-loader.hash
 create mode 100644 package/vulkan-loader/vulkan-loader.mk
 create mode 100644 package/vulkan-tools/Config.in
 create mode 100644 package/vulkan-tools/vulkan-tools.hash
 create mode 100644 package/vulkan-tools/vulkan-tools.mk

-- 
2.29.2
