From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Dec 2020 09:39:36 +0100
Subject: [Buildroot] [RFC v1 0/6] Vulkan support
In-Reply-To: <20201223224553.8570-1-ps.report@gmx.net>
References: <20201223224553.8570-1-ps.report@gmx.net>
Message-ID: <20201230083936.GE1680670@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-12-23 23:45 +0100, Peter Seiderer spake thusly:
> A starting point to add some/more Vulkan support to Buildroot.
> 
> Targeting towards the RPi Vulkan support (as announced e.g. [1]),
> but send as RFC as not (yet) functional:
> 
> - did only try to run standalone and/or with Qt EGLFS, but
>   did not work out as the broadcom vulkan driver is  only
>   functional with X11/XCB
> 
> - the Qt Vulkan support seems only be functional with
>   EGLFS/Vivante and/or X11/XCB

Speaking of which: have you seen this series:
    https://patchwork.ozlabs.org/project/buildroot/list/?series=157522

    package/opengl/libopenvx: new virtual package
    package/opengl/libvulkan: new virtual package
    package/freescale-imx/imx-gpu-viv: add options for new feture

The last one introduces imx-gpu-viv as a provider for libvulkan, so at
least it does not seem to contradict your assumptions that Vulkan is
possible with Vivante.  ;-)

Regards,
Yann E. MORIN.

> Tested with the following defconfig (and dtoverlay=vc4-kms-v3d-pi4):
> 
>   BR2_aarch64=y
>   BR2_cortex_a72=y
>   BR2_ARM_FPU_VFPV4=y
>   BR2_ENABLE_DEBUG=y
>   BR2_OPTIMIZE_3=y
>   BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
>   BR2_PACKAGE_GLIBC_UTILS=y
>   BR2_BINUTILS_VERSION_2_35_X=y
>   BR2_GCC_VERSION_10_X=y
>   BR2_TOOLCHAIN_BUILDROOT_CXX=y
>   BR2_INIT_SYSV=y
>   BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>   BR2_SYSTEM_DHCP="eth0"
>   BR2_GENERATE_LOCALE="en_US"
>   BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4-64/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4-64/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay --aarch64"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,967d45b29ca2902f031b867809d72e3b3d623e7a)/linux-967d45b29ca2902f031b867809d72e3b3d623e7a.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b"
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>   BR2_PACKAGE_DEJAVU=y
>   BR2_PACKAGE_MESA3D=y
>   BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
>   BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D=y
>   BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4=y
>   BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM=y
>   BR2_PACKAGE_MESA3D_VULKAN_DRIVER_SWRAST=y
>   BR2_PACKAGE_MESA3D_OPENGL_ES=y
>   BR2_PACKAGE_VULKAN_TOOLS=y
>   BR2_PACKAGE_QT5=y
>   BR2_PACKAGE_QT5BASE_EXAMPLES=y
>   BR2_PACKAGE_QT5BASE_GUI=y
>   BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
>   BR2_PACKAGE_QT5BASE_VULKAN=y
>   BR2_PACKAGE_QT5BASE_EGLFS=y
>   BR2_PACKAGE_QT5BASE_FONTCONFIG=y
>   BR2_PACKAGE_QT5BASE_HARFBUZZ=y
>   BR2_PACKAGE_QT5BASE_GIF=y
>   BR2_PACKAGE_QT5BASE_JPEG=y
>   BR2_PACKAGE_QT5BASE_PNG=y
>   BR2_PACKAGE_RPI_FIRMWARE=y
>   BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
>   BR2_TARGET_ROOTFS_EXT2_SIZE="384M"
>   # BR2_TARGET_ROOTFS_TAR is not set
>   BR2_PACKAGE_HOST_DOSFSTOOLS=y
>   BR2_PACKAGE_HOST_GENIMAGE=y
>   BR2_PACKAGE_HOST_MTOOLS=y
> 
> There are three vulkan ICDs installed
>   - /usr/lib/libvulkan_lvp.so: mesa3d/swrast
>   - /usr/lib/libvulkan_broadcom.so: mesa3d/broadcom
>   - /usr/lib/libVkICD_mock_icd.so: vulkan-tools/moc-ICD
> 
> Runtime test done:
> 
>   - vulkan-tools/moc-ICD (works):
> 	$ VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/VkICD_mock_icd.json vulkaninfo
> ==========
> VULKANINFO
> ==========
> 
> Vulkan Instance Version: 1.2.165
> 
> 
> Instance Extensions: count = 19
> ===============================
> 	VK_EXT_debug_report                    : extension revision 9
> 	VK_EXT_debug_utils                     : extension revision 2
> 	VK_EXT_direct_mode_display             : extension revision 1
> 	VK_EXT_display_surface_counter         : extension revision 1
> 	VK_EXT_headless_surface                : extension revision 1
> 	VK_EXT_swapchain_colorspace            : extension revision 4
> 	VK_EXT_validation_features             : extension revision 4
> 	VK_EXT_validation_flags                : extension revision 2
> 	VK_KHR_device_group_creation           : extension revision 1
> 	VK_KHR_display                         : extension revision 23
> 	VK_KHR_external_fence_capabilities     : extension revision 1
> 	VK_KHR_external_memory_capabilities    : extension revision 1
> 	VK_KHR_external_semaphore_capabilities : extension revision 1
> 	VK_KHR_get_display_properties2         : extension revision 1
> 	VK_KHR_get_physical_device_properties2 : extension revision 2
> 	VK_KHR_get_surface_capabilities2       : extension revision 1
> 	VK_KHR_surface                         : extension revision 25
> 	VK_KHR_surface_protected_capabilities  : extension revision 1
> 	VK_NV_external_memory_capabilities     : extension revision 1
> 
> Layers: count = 0
> =================
> Groups:
> =======
> 	No Device Groups Found
> 
> Device Properties and Extensions:
> =================================
> GPU0:
> VkPhysicalDeviceProperties:
> ---------------------------
> 	apiVersion     = 4198400 (1.1.0)
> 	driverVersion  = 1 (0x0001)
> 	vendorID       = 0xba5eba11
> 	deviceID       = 0xf005ba11
> 	deviceType     = PHYSICAL_DEVICE_TYPE_VIRTUAL_GPU
> 	deviceName     = Vulkan Mock Device
> [...]
> 
>   - mesa3d/swrast:
> 	$ VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/lvp_icd.cortex-a72.json vulkaninfo
> 	WARNING: lavapipe is not a conformant vulkan implementation, testing use only.
> 	Segmentation fault
> 
>   - mesa3d/broadcom:
> 	$ VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/broadcom_icd.cortex-a72.json vulkaninfo
> 	ERROR at /home/seiderer/Work/Buildroot/build_rpi4_mesa_vc4_001/build/vulkan-tools-1.2.162/vulkaninfo/vulkaninfo.h:248:vkEnumerateInstanceExtensionProperties failed with ERROR_INITIALIZATION_FAILED
> 
> Next steps:
>   - enable Vulkan/X11/XCB support
>   - fix mesa3d/swrast stand-alone link failure
> 
> Regards,
> Peter
> 
> [1] https://www.raspberrypi.org/blog/vulkan-update-were-conformant/
> 
> Peter Seiderer (6):
>   package/vulkan-headers: new package
>   package/vulkan-loader: new package
>   package/vulkan-tools: new package
>   package/mesa3d: add vulkan broadcom driver support
>   package/mesa3d: add vulkan swrast driver support
>   package/qt5base: add vulkan option
> 
>  package/Config.in                             |  3 ++
>  package/mesa3d/Config.in                      | 21 ++++++++++++
>  package/mesa3d/mesa3d.mk                      |  6 +++-
>  package/qt5/qt5base/Config.in                 | 11 +++++++
>  package/qt5/qt5base/qt5base.mk                |  7 ++++
>  package/vulkan-headers/Config.in              |  7 ++++
>  package/vulkan-headers/vulkan-headers.hash    |  3 ++
>  package/vulkan-headers/vulkan-headers.mk      | 13 ++++++++
>  .../0001-loader-fix-asm_offset-call.patch     | 32 +++++++++++++++++++
>  package/vulkan-loader/Config.in               | 14 ++++++++
>  package/vulkan-loader/vulkan-loader.hash      |  3 ++
>  package/vulkan-loader/vulkan-loader.mk        | 22 +++++++++++++
>  package/vulkan-tools/Config.in                | 17 ++++++++++
>  package/vulkan-tools/vulkan-tools.hash        |  3 ++
>  package/vulkan-tools/vulkan-tools.mk          | 25 +++++++++++++++
>  15 files changed, 186 insertions(+), 1 deletion(-)
>  create mode 100644 package/vulkan-headers/Config.in
>  create mode 100644 package/vulkan-headers/vulkan-headers.hash
>  create mode 100644 package/vulkan-headers/vulkan-headers.mk
>  create mode 100644 package/vulkan-loader/0001-loader-fix-asm_offset-call.patch
>  create mode 100644 package/vulkan-loader/Config.in
>  create mode 100644 package/vulkan-loader/vulkan-loader.hash
>  create mode 100644 package/vulkan-loader/vulkan-loader.mk
>  create mode 100644 package/vulkan-tools/Config.in
>  create mode 100644 package/vulkan-tools/vulkan-tools.hash
>  create mode 100644 package/vulkan-tools/vulkan-tools.mk
> 
> -- 
> 2.29.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
