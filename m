From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 30 Jan 2021 00:04:16 +0100
Subject: [Buildroot] [PATCH v1 0/2] package/libcamera-apps: new package
Message-ID: <20210129230418.26359-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested on RPi4 with the following defconfig:

BR2_aarch64=y
BR2_cortex_a72=y
BR2_ARM_FPU_VFPV4=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_PACKAGE_GLIBC_UTILS=y
BR2_BINUTILS_VERSION_2_35_X=y
BR2_GCC_VERSION_10_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_HOST_GDB=y
BR2_GDB_VERSION_10=y
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
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_RPI_FIRMWARE=y
BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI=y
BR2_PACKAGE_LIBCAMERA_APPS=y
BR2_PACKAGE_DROPBEAR=y
BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y

and the customized config.txt:

dtoverlay=miniuart-bt
dtoverlay=vc4-kms-v3d-pi4
dtoverlay=imx219

Still needs a patch to disable the signature check (see [1]),
tried as alternative a late signing via _TARGET_FINALIZE_HOOKS:

define LIBCAMERA_IPA_SIGN
	$(BUILD_DIR)/libcamera-$(LIBCAMERA_VERSION)/src/ipa/ipa-sign-install.sh \
		$(BUILD_DIR)/libcamera-$(LIBCAMERA_VERSION)/build/src/ipa-priv-key.pem \
		$(TARGET_DIR)/usr/lib/libcamera/ipa_*.so
endef
LIBCAMERA_TARGET_FINALIZE_HOOKS += LIBCAMERA_IPA_SIGN

The signing runs while finalize target directory, but before the strip
calls...

With patch applied the following commands run with expected output:

	$ libcamera-jpeg -o still-image.jpg
	$ libcamera-hello --verbose --fullscreen --timeout 300000

Libcamera-apps patches suggested upstream (see [2])

Regards,
Peter

[1] http://lists.buildroot.org/pipermail/buildroot/2020-June/284963.html
[2] https://github.com/raspberrypi/libcamera-apps/pull/1

Peter Seiderer (2):
  package/libcamera: bump version to ab72e66
  package/libcamera-apps: new package

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...afe-host-include-path-for-libdrm-use.patch | 29 ++++++++++
 ...unrecognized-gcc-command-line-option.patch | 32 ++++++++++
 ...ra_vid-fix-getline-call-needs-size_t.patch | 37 ++++++++++++
 ..._still-fix-getline-call-needs-size_t.patch | 35 +++++++++++
 ...-libcamera_app-fix-int64_t-constants.patch | 38 ++++++++++++
 ...006-cmake-fix-linking-with-exif-jpeg.patch | 47 +++++++++++++++
 .../0007-cmake-add-install-target.patch       | 24 ++++++++
 ...e-no-need-to-link-against-ipa_rpi.so.patch | 58 +++++++++++++++++++
 package/libcamera-apps/Config.in              | 33 +++++++++++
 package/libcamera-apps/libcamera-apps.hash    |  2 +
 package/libcamera-apps/libcamera-apps.mk      | 24 ++++++++
 package/libcamera/libcamera.hash              |  2 +-
 package/libcamera/libcamera.mk                |  2 +-
 15 files changed, 363 insertions(+), 2 deletions(-)
 create mode 100644 package/libcamera-apps/0001-cmake-remove-unsafe-host-include-path-for-libdrm-use.patch
 create mode 100644 package/libcamera-apps/0002-cmake-remove-unrecognized-gcc-command-line-option.patch
 create mode 100644 package/libcamera-apps/0003-libcamera_vid-fix-getline-call-needs-size_t.patch
 create mode 100644 package/libcamera-apps/0004-libcamera_still-fix-getline-call-needs-size_t.patch
 create mode 100644 package/libcamera-apps/0005-libcamera_app-fix-int64_t-constants.patch
 create mode 100644 package/libcamera-apps/0006-cmake-fix-linking-with-exif-jpeg.patch
 create mode 100644 package/libcamera-apps/0007-cmake-add-install-target.patch
 create mode 100644 package/libcamera-apps/0008-cmake-no-need-to-link-against-ipa_rpi.so.patch
 create mode 100644 package/libcamera-apps/Config.in
 create mode 100644 package/libcamera-apps/libcamera-apps.hash
 create mode 100644 package/libcamera-apps/libcamera-apps.mk

-- 
2.30.0
