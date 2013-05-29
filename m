From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 29 May 2013 15:40:37 +0200
Subject: [Buildroot] [git commit] gpu-viv-bin-mx6q: new package
Message-ID: <20130602212110.B6ABD9A6D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e1fc11b4fe637aa7ca029447d1963a318d159fb8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds a new package for the OpenGL, OpenVG and EGL
proprietary implementations specific to the Vivante GPU of i.MX6
processors.

[Peter: show comment on uClibc toolchains, tweak help text]
Signed-off-by: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/freescale-imx/Config.in                    |    1 +
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in   |   35 +++++++++
 ...gpu-viv-bin-mx6q-0001-correct-HAL-include.patch |   16 ++++
 .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           |   79 ++++++++++++++++++++
 4 files changed, 131 insertions(+), 0 deletions(-)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 840b83b..7c22f79 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -3,5 +3,6 @@ menu "Freescale i.MX libraries"
 
 source "package/freescale-imx/imx-lib/Config.in"
 source "package/freescale-imx/firmware-imx/Config.in"
+source "package/freescale-imx/gpu-viv-bin-mx6q/Config.in"
 
 endmenu
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
new file mode 100644
index 0000000..06544c4
--- /dev/null
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
@@ -0,0 +1,35 @@
+comment "gpu-viv-bin-mx6q requires a glibc toolchain"
+	depends on !(BR2_TOOLCHAIN_CTNG_glibc || \
+		BR2_TOOLCHAIN_CTNG_eglibc || \
+		BR2_TOOLCHAIN_EXTERNAL_GLIBC)
+
+config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
+	bool "gpu-viv-bin-mx6q"
+	select BR2_PACKAGE_HAS_OPENGL_EGL
+	select BR2_PACKAGE_HAS_OPENGL_ES
+	depends on BR2_arm # Only relevant for i.MX6
+	 # Library binaries are linked against libc.so.6
+	depends on BR2_TOOLCHAIN_CTNG_glibc || \
+		BR2_TOOLCHAIN_CTNG_eglibc || \
+		BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	help
+	  Userspace libraries for Vivante GPU on i.MX6 platforms
+
+	  It contains libraries and headers for GLES, OpenCL, and
+	  OpenVG.  It also contains a DRI plugin for X11. It also
+	  contains a plugin for DirectFB-1.4.0, but that doesn't work
+	  together with buildroot's DirectFB version.
+
+	  This library is provided by Freescale as-is and doesn't have
+	  an upstream.
+
+if BR2_PACKAGE_GPU_VIV_BIN_MX6Q
+
+config BR2_PACKAGE_GPU_VIV_BIN_MX6Q_EXAMPLES
+	bool "install examples"
+	help
+	  Copy the Vivante examples to the target.
+
+	  Warning: examples take approximately 150 MB of disk space.
+
+endif
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q-0001-correct-HAL-include.patch b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q-0001-correct-HAL-include.patch
new file mode 100644
index 0000000..c83cd55
--- /dev/null
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q-0001-correct-HAL-include.patch
@@ -0,0 +1,16 @@
+Correct the directory path for gc_hal_eglplatform_type.h
+
+Signed-off-by: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
+
+diff -rup gpu-viv-bin-mx6q-1.1.0-orig/usr/include/gc_vdk_types.h gpu-viv-bin-mx6q-1.1.0/usr/include/gc_vdk_types.h
+--- gpu-viv-bin-mx6q-1.1.0-orig/usr/include/gc_vdk_types.h	2012-12-18 10:35:55.000000000 +0100
++++ gpu-viv-bin-mx6q-1.1.0/usr/include/gc_vdk_types.h	2013-05-09 21:09:28.080138681 +0200
+@@ -39,7 +39,7 @@ extern "C" {
+ #endif
+ 
+ #include <EGL/egl.h>
+-#include "gc_hal_eglplatform_type.h"
++#include <HAL/gc_hal_eglplatform_type.h>
+ 
+ 
+ /*******************************************************************************
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
new file mode 100644
index 0000000..f988d25
--- /dev/null
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
@@ -0,0 +1,79 @@
+#############################################################
+#
+# gpu-viv-bin-mx6q
+#
+#############################################################
+
+GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)
+GPU_VIV_BIN_MX6Q_SITE    = $(FREESCALE_IMX_MIRROR_SITE)
+GPU_VIV_BIN_MX6Q_SOURCE  = gpu-viv-bin-mx6q-$(GPU_VIV_BIN_MX6Q_VERSION).bin
+
+GPU_VIV_BIN_MX6Q_INSTALL_STAGING = YES
+
+GPU_VIV_BIN_MX6Q_LICENSE = Freescale Semiconductor Software License Agreement
+
+# No license file is included in the archive; we could extract it from
+# the self-extractor, but that's just too much effort.
+# This is a legal minefield: the EULA specifies that
+# the Board Support Package includes software and hardware (sic!)
+# for which a separate license is needed...
+GPU_VIV_BIN_MX6Q_REDISTRIBUTE = NO
+
+# DirectFB is not supported (wrong version)
+ifeq ($(BR2_PACKAGE_XORG7),y)
+GPU_VIV_BIN_MX6Q_LIB_TARGET = x11
+else
+GPU_VIV_BIN_MX6Q_LIB_TARGET = fb
+endif
+
+# The archive is a shell-self-extractor of a bzipped tar. It happens
+# to extract in the correct directory (gpu-viv-bin-mx6q-x.y.z)
+# The --force makes sure it doesn't fail if the source dir already exists.
+# The --auto-accept skips the license check - not needed for us
+# because we have legal-info.
+define GPU_VIV_BIN_MX6Q_EXTRACT_CMDS
+	(cd $(BUILD_DIR); \
+		sh $(DL_DIR)/$(GPU_VIV_BIN_MX6Q_SOURCE) --force --auto-accept)
+endef
+
+# Instead of building, we fix up the inconsistencies that exist
+# in the upstream archive here.
+# Make sure these commands are idempotent.
+define GPU_VIV_BIN_MX6Q_BUILD_CMDS
+	$(SED) 's/defined(LINUX)/defined(__linux__)/g' $(@D)/usr/include/*/*.h
+	for lib in EGL GAL VIVANTE; do \
+		ln -sf lib$${lib}-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so \
+			$(@D)/usr/lib/lib$${lib}.so; \
+	done
+	ln -sf libGL.so.1.2 $(@D)/usr/lib/libGL.so.1
+	ln -sf libGL.so.1.2 $(@D)/usr/lib/libGL.so
+endef
+
+define GPU_VIV_BIN_MX6Q_INSTALL_STAGING_CMDS
+	cp -r $(@D)/usr/* $(STAGING_DIR)/usr
+endef
+
+ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q_EXAMPLES),y)
+define GPU_VIV_BIN_MX6Q_INSTALL_EXAMPLES
+	mkdir -p $(TARGET_DIR)/usr/share/examples/
+	cp -r $(@D)/opt/* $(TARGET_DIR)/usr/share/examples/
+endef
+endif
+
+# On the target, remove the unused libraries.
+# Note that this is _required_, else ldconfig may create symlinks
+# to the wrong library
+define GPU_VIV_BIN_MX6Q_INSTALL_TARGET_CMDS
+	$(GPU_VIV_BIN_MX6Q_INSTALL_EXAMPLES)
+	cp -a $(@D)/usr/lib $(TARGET_DIR)/usr
+	for lib in EGL GAL VIVANTE; do \
+		for f in $(TARGET_DIR)/usr/lib/lib$${lib}-*.so; do \
+			case $$f in \
+				*-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so) : ;; \
+				*) $(RM) $$f ;; \
+			esac; \
+		done; \
+	done
+endef
+
+$(eval $(generic-package))
