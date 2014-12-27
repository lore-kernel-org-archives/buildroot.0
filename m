From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 21:33:18 +0100
Subject: [Buildroot] [git commit] gpu-viv-bin-mx6q: fix GLESv2 support
Message-ID: <20141227203322.9CFCF8045F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8ec52d57ecdb09ef8330eaf4e84efd41fa5a2fcf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tested with:
    QMX6 board +
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
    BR2_LINUX_KERNEL=y
    BR2_LINUX_KERNEL_CUSTOM_GIT=y
    BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.congatec.com/arm/qmx6_kernel.git"
    BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="9bafbcba67f7bb2a48a5e05998cecb1165aa444f"
    BR2_LINUX_KERNEL_DEFCONFIG="qmx6"
    BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
    BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
    BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-qmx6"
    BR2_PACKAGE_QT5=y
    BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
    BR2_PACKAGE_QT5BASE_EXAMPLES=y
    BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
    BR2_PACKAGE_QT5BASE_EGLFS=y
    BR2_PACKAGE_QT5BASE_DEFAULT_QPA="eglfs"
    BR2_PACKAGE_QT5BASE_GIF=y
    BR2_PACKAGE_QT5BASE_JPEG=y
    BR2_PACKAGE_QT5BASE_PNG=y
    BR2_PACKAGE_QT5QUICKCONTROLS=y
    BR2_PACKAGE_FREESCALE_IMX=y
    BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q=y
    BR2_PACKAGE_GPU_VIV_BIN_MX6Q=y
    BR2_PACKAGE_GPU_VIV_BIN_MX6Q_EXAMPLES=y

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
index bc44e38..79c7a92 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
@@ -37,12 +37,13 @@ endef
 # Make sure these commands are idempotent.
 define GPU_VIV_BIN_MX6Q_BUILD_CMDS
 	$(SED) 's/defined(LINUX)/defined(__linux__)/g' $(@D)/usr/include/*/*.h
-	for lib in EGL GAL VIVANTE; do \
+	for lib in EGL GAL VIVANTE GLESv2; do \
 		ln -sf lib$${lib}-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so \
 			$(@D)/usr/lib/lib$${lib}.so; \
 	done
-	ln -sf libGL.so.1.2 $(@D)/usr/lib/libGL.so.1
 	ln -sf libGL.so.1.2 $(@D)/usr/lib/libGL.so
+	ln -sf libGL.so.1.2 $(@D)/usr/lib/libGL.so.1
+	ln -sf libGL.so.1.2 $(@D)/usr/lib/libGL.so.1.2.0
 endef
 
 define GPU_VIV_BIN_MX6Q_INSTALL_STAGING_CMDS
@@ -71,7 +72,7 @@ endif
 define GPU_VIV_BIN_MX6Q_INSTALL_TARGET_CMDS
 	$(GPU_VIV_BIN_MX6Q_INSTALL_EXAMPLES)
 	cp -a $(@D)/usr/lib $(TARGET_DIR)/usr
-	for lib in EGL GAL VIVANTE; do \
+	for lib in EGL GAL VIVANTE GLESv2; do \
 		for f in $(TARGET_DIR)/usr/lib/lib$${lib}-*.so; do \
 			case $$f in \
 				*-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so) : ;; \
