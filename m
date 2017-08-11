From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Thu, 10 Aug 2017 21:33:58 -0400
Subject: [Buildroot] [PATCH v6 3/3] configs: new raspberrypi3 qt5 config
In-Reply-To: <20170811013358.26864-1-gael.portay@savoirfairelinux.com>
References: <20170811013358.26864-1-gael.portay@savoirfairelinux.com>
Message-ID: <20170811013358.26864-4-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This config sets Qt WebEngine for raspberrypi 3.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 configs/raspberrypi3_qt5_defconfig       | 48 ++++++++++++++++++++++++++++++++
 package/qt5/qt5webengine/qt5webengine.mk |  4 +--
 2 files changed, 50 insertions(+), 2 deletions(-)
 create mode 100644 configs/raspberrypi3_qt5_defconfig

diff --git a/configs/raspberrypi3_qt5_defconfig b/configs/raspberrypi3_qt5_defconfig
new file mode 100644
index 000000000..7cc850d09
--- /dev/null
+++ b/configs/raspberrypi3_qt5_defconfig
@@ -0,0 +1,48 @@
+BR2_arm=y
+BR2_cortex_a53=y
+BR2_ARM_FPU_NEON_VFPV4=y
+
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+BR2_SYSTEM_DHCP="eth0"
+
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="5e4ee836560d4c0371e109bf469e1ad808ae7a44"
+BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
+
+# Build the DTB from the kernel sources
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b bcm2710-rpi-cm3"
+
+# Build Qt5 WebEngine
+BR2_PACKAGE_LIBERATION=y
+BR2_PACKAGE_QT5=y
+BR2_PACKAGE_QT5BASE_EXAMPLES=y
+BR2_PACKAGE_QT5QUICKCONTROLS=y
+BR2_PACKAGE_QT5WEBENGINE=y
+BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS=y
+BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_USERLAND=y
+BR2_PACKAGE_CA_CERTIFICATES=y
+BR2_PACKAGE_NTP=y
+
+# Required tools to create the SD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="360000"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay"
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 89e946d35..f1f9c1294 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -7,8 +7,8 @@
 QT5WEBENGINE_VERSION = $(QT5_VERSION)
 QT5WEBENGINE_SITE = $(QT5_SITE)
 QT5WEBENGINE_SOURCE = qtwebengine-opensource-src-$(QT5WEBENGINE_VERSION).tar.xz
-QT5WEBENGINE_DEPENDENCIES = qt5base qt5declarative qt5webchannel ffmpeg icu \
-	host-gperf host-python
+QT5WEBENGINE_DEPENDENCIES = qt5base ffmpeg libglib2 libvpx opus webp \
+	qt5declarative qt5webchannel host-gperf host-python
 QT5WEBENGINE_INSTALL_STAGING = YES
 
 include package/qt5/qt5webengine/chromium.inc
-- 
2.13.2
