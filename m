From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri,  3 Oct 2014 14:43:26 +0200
Subject: [Buildroot] [PATCH 05/11] gpu-viv-bin-mx6q: fix GLESv2 support
In-Reply-To: <1412340212-3089-1-git-send-email-jezz@sysmic.org>
References: <1412340212-3089-1-git-send-email-jezz@sysmic.org>
Message-ID: <1412340212-3089-6-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
index 2076ad4..c04ba29 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
@@ -48,12 +48,13 @@ endef
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
@@ -84,7 +85,7 @@ endif
 define GPU_VIV_BIN_MX6Q_INSTALL_TARGET_CMDS
 	$(GPU_VIV_BIN_MX6Q_INSTALL_EXAMPLES)
 	cp -a $(@D)/usr/lib $(TARGET_DIR)/usr
-	for lib in EGL GAL VIVANTE; do \
+	for lib in EGL GAL VIVANTE GLESv2; do \
 		for f in $(TARGET_DIR)/usr/lib/lib$${lib}-*.so; do \
 			case $$f in \
 				*-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so) : ;; \
-- 
2.1.0
