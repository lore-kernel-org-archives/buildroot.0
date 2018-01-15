From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 15 Jan 2018 22:34:51 +0100
Subject: [Buildroot] [PATCH v1] qt5: enable jscore/qt5declarative support
 for aarch64
Message-ID: <20180115213451.10981-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1] (as suggested by JD Conley <jd.conley@gmail.com>).

[1] https://bugs.busybox.net/show_bug.cgi?id=10541

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Compile testes for BR2_PACKAGE_QT5_VERSION_LATEST and qt5declarative/qtquick
with the following defconfig:

BR2_aarch64=y
BR2_ARM_FPU_VFPV4=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
BR2_BINUTILS_VERSION_2_29_X=y
BR2_GCC_VERSION_7_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_INIT_SYSTEMD=y
BR2_SYSTEM_DHCP="eth0"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3-64/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3-64/post-image.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="--aarch64"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="240d0482ad9341f7d98b06705d0a55e298034121"
BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2837-rpi-3-b"
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5DECLARATIVE=y
BR2_PACKAGE_QT5DECLARATIVE_QUICK=y
BR2_PACKAGE_RPI_FIRMWARE=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y

Compile testes for BR2_PACKAGE_QT5_VERSION_5_6 and qt5declarative
with the following defconfig:

BR2_aarch64=y
BR2_ARM_FPU_VFPV4=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
BR2_BINUTILS_VERSION_2_29_X=y
BR2_GCC_VERSION_7_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_INIT_SYSTEMD=y
BR2_SYSTEM_DHCP="eth0"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3-64/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3-64/post-image.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="--aarch64"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="240d0482ad9341f7d98b06705d0a55e298034121"
BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2837-rpi-3-b"
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5_VERSION_5_6=y
BR2_PACKAGE_QT5DECLARATIVE=y
BR2_PACKAGE_RPI_FIRMWARE=y
BR2_PACKAGE_PCRE2=y
BR2_PACKAGE_PCRE2_16=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y
---
 package/qt5/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 8eb00ca780..a9ee44c11f 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	bool
 	default y
 	# Javascript engine is only available on certain architectures
-	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
+	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_mipsel
 	# ARM needs BLX, so v5t+
 	depends on !BR2_ARM_CPU_ARMV4
 
-- 
2.15.1
