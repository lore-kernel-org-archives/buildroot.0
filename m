From: unixmania at gmail.com <unixmania@gmail.com>
Date: Thu, 14 Nov 2019 09:42:14 -0300
Subject: [Buildroot] [PATCH/next v2 4/5] configs/beaglebone_qt5: bump kernel
 and U-Boot, add weston
In-Reply-To: <20191114124215.12985-1-unixmania@gmail.com>
References: <20191114124215.12985-1-unixmania@gmail.com>
Message-ID: <20191114124215.12985-5-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lothar Felten <lothar.felten@gmail.com>

- Use the same kernel repository and version as configs/beaglebone
- Rename kernel fragment file
- Update U-Boot to 2019.07
- Select weston and qt5wayland
- Select host-uboot-tools with FIT support, required to create the
  images.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
Changes v1->v2:
- Switch kernel source URL to BeagleBoard repository
- Select host-uboot-tools
- Update commit message
---
 ...ux-4.1-sgx.fragment => linux-sgx.fragment} |  1 +
 configs/beaglebone_qt5_defconfig              | 23 +++++++++++--------
 2 files changed, 14 insertions(+), 10 deletions(-)
 rename board/beaglebone/{linux-4.1-sgx.fragment => linux-sgx.fragment} (92%)

diff --git a/board/beaglebone/linux-4.1-sgx.fragment b/board/beaglebone/linux-sgx.fragment
similarity index 92%
rename from board/beaglebone/linux-4.1-sgx.fragment
rename to board/beaglebone/linux-sgx.fragment
index c0d2e7b28a..58d46f588b 100644
--- a/board/beaglebone/linux-4.1-sgx.fragment
+++ b/board/beaglebone/linux-sgx.fragment
@@ -10,3 +10,4 @@ CONFIG_DRM_OMAP_WB_M2M=y
 CONFIG_DRM_TILCDC=y
 CONFIG_DRM_I2C_NXP_TDA998X=y
 CONFIG_DRM=y
+CONFIG_DRM_LEGACY=y
diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
index fb61bf54df..4a558c9ad4 100644
--- a/configs/beaglebone_qt5_defconfig
+++ b/configs/beaglebone_qt5_defconfig
@@ -1,36 +1,37 @@
 BR2_arm=y
 BR2_cortex_a8=y
 BR2_GLOBAL_PATCH_DIR="board/beaglebone/patches"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
-BR2_GCC_VERSION_5_X=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beaglebone/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/processor-sdk/processor-sdk-linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="52c4aa7cdb93d61f8008f380135beaf7b8fa6593"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,4.19.79-ti-r30)/linux-4.19.79-ti-r30.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/beaglebone/linux-4.1-sgx.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/beaglebone/linux-sgx.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-evmsk"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue"
 BR2_PACKAGE_FBV=y
 BR2_PACKAGE_QT5=y
 BR2_PACKAGE_QT5BASE_EXAMPLES=y
 BR2_PACKAGE_QT5BASE_EGLFS=y
+BR2_PACKAGE_QT5BASE_DEFAULT_QPA="wayland"
 BR2_PACKAGE_QT5QUICKCONTROLS=y
+BR2_PACKAGE_QT5WAYLAND=y
+BR2_PACKAGE_QT5WAYLAND_COMPOSITOR=y
+BR2_PACKAGE_WESTON=y
 BR2_PACKAGE_TI_SGX_DEMOS=y
 BR2_PACKAGE_TI_SGX_KM=y
 BR2_PACKAGE_TI_SGX_UM=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="124M"
+BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
@@ -42,3 +43,5 @@ BR2_TARGET_UBOOT_SPL_NAME="MLO"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
-- 
2.18.1
