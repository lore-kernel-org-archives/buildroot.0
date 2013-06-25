From: Spenser Gilliland <spenser@gillilanding.com>
Date: Tue, 25 Jun 2013 11:29:14 -0500
Subject: [Buildroot] [RFC v2 1/1] ti-gfx: add new package
Message-ID: <1372177754-13431-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is WIP of adding the TI Graphics SDK to Buildroot

Current Status:
   Kernel Drivers load without errror.
   pvrsrvctl starts with no errors.
   Some demos run, others do not.
   gstreamer videotestsrc ! eglglessink does not work.

TODO:
   Install startup files for sgx core. 
   Create .pc files to simplify additional packaging.
   Hard Float Binaries
   Testing, lots of testing.

Additional Info:
   I've been using the 3.9.6-x3 tag of the kernel at 
   https://github.com/RobertCNelson/stable-kernel by use of the
   LINUX_OVERRIDE_SRCDIR option.

   You must use a soft-float toolchain (ie Code Sourcery) as the binaries
   provided by the Graphics SDK are soft-float. (hard float is on the TODO
   list)

   To load the driver manually use the following:
      modprobe omaplfb
      modprobe bufferclass-ti
      pvrsrvctl --start --no-module

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/Config.in                              |    1 +
 package/opengl/libegl/libegl.mk                |    4 +
 package/opengl/libgles/libgles.mk              |    4 +
 package/opengl/libopenvg/libopenvg.mk          |    4 +
 package/ti-gfx/Config.in                       |   54 +++++++++++
 package/ti-gfx/ti-gfx-km_install_modules.patch |   14 +++
 package/ti-gfx/ti-gfx-newclkapi.patch          |   62 +++++++++++++
 package/ti-gfx/ti-gfx.mk                       |  116 ++++++++++++++++++++++++
 8 files changed, 259 insertions(+)
 create mode 100644 package/ti-gfx/Config.in
 create mode 100644 package/ti-gfx/ti-gfx-km_install_modules.patch
 create mode 100644 package/ti-gfx/ti-gfx-newclkapi.patch
 create mode 100644 package/ti-gfx/ti-gfx.mk

diff --git a/package/Config.in b/package/Config.in
index 0eb6a9c..3429c0e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -291,6 +291,7 @@ source "package/snowball-hdmiservice/Config.in"
 source "package/sredird/Config.in"
 source "package/statserial/Config.in"
 source "package/sysstat/Config.in"
+source "package/ti-gfx/Config.in"
 source "package/ti-utils/Config.in"
 source "package/uboot-tools/Config.in"
 source "package/udev/Config.in"
diff --git a/package/opengl/libegl/libegl.mk b/package/opengl/libegl/libegl.mk
index bd8040d..00e1f19 100644
--- a/package/opengl/libegl/libegl.mk
+++ b/package/opengl/libegl/libegl.mk
@@ -10,6 +10,10 @@ ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 LIBEGL_DEPENDENCIES += rpi-userland
 endif
 
+ifeq ($(BR2_PACKAGE_TI_GFX),y)
+LIBEGL_DEPENDENCIES += ti-gfx
+endif
+
 ifeq ($(LIBEGL_DEPENDENCIES),)
 define LIBEGL_CONFIGURE_CMDS
 	echo "No libEGL implementation selected. Configuration error."
diff --git a/package/opengl/libgles/libgles.mk b/package/opengl/libgles/libgles.mk
index a0048a7..d2fe11b 100644
--- a/package/opengl/libgles/libgles.mk
+++ b/package/opengl/libgles/libgles.mk
@@ -10,6 +10,10 @@ ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 LIBGLES_DEPENDENCIES += rpi-userland
 endif
 
+ifeq ($(BR2_PACKAGE_TI_GFX),y)
+LIBGLES_DEPENDENCIES += ti-gfx
+endif
+
 ifeq ($(LIBGLES_DEPENDENCIES),)
 define LIBGLES_CONFIGURE_CMDS
 	echo "No libGLES implementation selected. Configuration error."
diff --git a/package/opengl/libopenvg/libopenvg.mk b/package/opengl/libopenvg/libopenvg.mk
index 03f59ba..118ae7f 100644
--- a/package/opengl/libopenvg/libopenvg.mk
+++ b/package/opengl/libopenvg/libopenvg.mk
@@ -10,6 +10,10 @@ ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 LIBOPENVG_DEPENDENCIES += rpi-userland
 endif
 
+ifeq ($(BR2_PACKAGE_TI_GFX),y)
+LIBOPENVG_DEPENDENCIES += ti-gfx
+endif
+
 ifeq ($(LIBOPENVG_DEPENDENCIES),)
 define LIBOPENVG_CONFIGURE_CMDS
 	echo "No libOpenVG implementation selected. Configuration error."
diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
new file mode 100644
index 0000000..79116a2
--- /dev/null
+++ b/package/ti-gfx/Config.in
@@ -0,0 +1,54 @@
+config BR2_PACKAGE_TI_GFX
+	bool "ti-gfx"
+	select BR2_LINUX_KERNEL
+	select BR2_PACKAGE_DEVMEM2 # Runtime dependency
+	select BR2_PACKAGE_HAS_OPENGL_EGL
+	select BR2_PACKAGE_HAS_OPENGL_ES
+	depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_glibc
+	help
+	  Graphics libraries for TI boards.
+
+	  http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk/
+
+if BR2_PACKAGE_TI_GFX
+
+config BR2_PACKAGE_TI_GFX_DEBUG
+	bool "enable debug support"
+	help
+	  Turn on debugging in kernel module and install libraries built with
+	  debugging enabled
+
+choice
+	prompt "Target"
+	default BR2_PACKAGE_TI_GFX_ES3
+	help
+	  Select the SOC for which you would like to install drivers. Please 
+	  use the chart at
+	  http://processors.wiki.ti.com/index.php/OMAP35x_Graphics_SDK_Getting_Started_Guide
+
+config BR2_PACKAGE_TI_GFX_ES3
+	bool "es3.x"
+	help
+	 OMAP35xx, AM35xx Rev 3.1+ 
+
+config BR2_PACKAGE_TI_GFX_ES5
+	bool "es5.x"
+	help
+	  AM37xx, DM37xx
+
+config BR2_PACKAGE_TI_GFX_ES6
+	bool "es6.x"
+	help
+	  AM387x, C6A814x, AM389x, C6A816x
+
+config BR2_PACKAGE_TI_GFX_ES8
+	bool "es8.x"
+	help
+	  AM335x
+
+endchoice
+
+endif
+
+comment "requires an external eglibc/glibc based toolchain"
+	depends on !(BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_glibc)
diff --git a/package/ti-gfx/ti-gfx-km_install_modules.patch b/package/ti-gfx/ti-gfx-km_install_modules.patch
new file mode 100644
index 0000000..63bfd19
--- /dev/null
+++ b/package/ti-gfx/ti-gfx-km_install_modules.patch
@@ -0,0 +1,14 @@
+Index: ti-gfx-4_09_00_01/GFX_Linux_KM/Makefile
+===================================================================
+--- ti-gfx-4_09_00_01.orig/GFX_Linux_KM/Makefile	2013-03-07 11:00:11.000000000 -0600
++++ ti-gfx-4_09_00_01/GFX_Linux_KM/Makefile	2013-05-23 01:36:29.356676281 -0500
+@@ -479,6 +479,9 @@
+ all:
+ 	$(MAKE) -C $(KERNELDIR) M=`pwd` $*
+ 
++install:
++	$(MAKE) -C $(KERNELDIR) M=`pwd` modules_install
++
+ clean:
+ 	@find . -name "*.o" -exec rm -r {} \;
+ 	@find . -name "*.ko" -exec rm -r {} \;
diff --git a/package/ti-gfx/ti-gfx-newclkapi.patch b/package/ti-gfx/ti-gfx-newclkapi.patch
new file mode 100644
index 0000000..6337496
--- /dev/null
+++ b/package/ti-gfx/ti-gfx-newclkapi.patch
@@ -0,0 +1,62 @@
+Index: ti-gfx-4_09_00_01/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c
+===================================================================
+--- ti-gfx-4_09_00_01.orig/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c	2013-06-18 11:03:06.606245728 -0500
++++ ti-gfx-4_09_00_01/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c	2013-06-18 11:11:17.908972042 -0500
+@@ -166,11 +166,30 @@
+ 	}
+ 
+ 	PVR_DPF((PVR_DBG_MESSAGE, "EnableSGXClocks: Enabling SGX Clocks"));
+-	
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0)
++	res=clk_prepare(psSysSpecData->psSGX_FCK);
++	if (res < 0)
++        {
++                PVR_DPF((PVR_DBG_ERROR, "EnableSGXClocks: Couldn't enable SGX functional clock (%d)", res));
++                clk_unprepare(psSysSpecData->psSGX_FCK);
++                return PVRSRV_ERROR_UNABLE_TO_ENABLE_CLOCK;
++        }
++#endif 
+ 	res=clk_enable(psSysSpecData->psSGX_FCK);
+ 	if (res < 0)
+         {
+                 PVR_DPF((PVR_DBG_ERROR, "EnableSGXClocks: Couldn't enable SGX functional clock (%d)", res));
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0)
++                clk_unprepare(psSysSpecData->psSGX_FCK);
++                return PVRSRV_ERROR_UNABLE_TO_ENABLE_CLOCK;
++        }
++
++	res=clk_prepare(psSysSpecData->psSGX_ICK);
++	if(res < 0)
++        {
++                PVR_DPF((PVR_DBG_ERROR, "EnableSGXClocks: Couldn't enable SGX functional clock (%d)", res));
++                clk_unprepare(psSysSpecData->psSGX_FCK);
++#endif
+                 return PVRSRV_ERROR_UNABLE_TO_ENABLE_CLOCK;
+         }
+ 
+@@ -178,8 +197,13 @@
+         if (res < 0)
+         {
+                 PVR_DPF((PVR_DBG_ERROR, "EnableSGXClocks: Couldn't enable SGX interface clock (%d)", res));
+-
++#if KERNEL_VERSION_CODE >= KERNEL_VERSION(3,2,0)
++                clk_unprepare(psSysSpecData->psSGX_ICK);
++#endif
+                 clk_disable(psSysSpecData->psSGX_FCK);
++#if KERNEL_VERSION_CODE >= KERNEL_VERSION(3,2,0)
++                clk_unprepare(psSysSpecData->psSGX_FCK);
++#endif
+                 return PVRSRV_ERROR_UNABLE_TO_ENABLE_CLOCK;
+         }
+ 
+@@ -247,8 +271,9 @@
+ 	PVR_DPF((PVR_DBG_MESSAGE, "DisableSGXClocks: Disabling SGX Clocks"));
+ 	
+ 	clk_disable(psSysSpecData->psSGX_FCK);
+-
++	clk_unprepare(psSysSpecData->psSGX_FCK);
+ 	clk_disable(psSysSpecData->psSGX_ICK);
++	clk_unprepare(psSysSpecData->psSGX_ICK);
+ 
+ //	SysDisableSGXInterrupts(psSysData);
+ 
diff --git a/package/ti-gfx/ti-gfx.mk b/package/ti-gfx/ti-gfx.mk
new file mode 100644
index 0000000..670ba50
--- /dev/null
+++ b/package/ti-gfx/ti-gfx.mk
@@ -0,0 +1,116 @@
+###############################################################################
+#
+# ti-gfx 
+#
+###############################################################################
+
+TI_GFX_VERSION = 4_09_00_01
+TI_GFX_SOURCE = Graphics_SDK_setuplinux_$(TI_GFX_VERSION)_minimal_demos.bin
+TI_GFX_SITE = http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/$(TI_GFX_VERSION)/exports/
+TI_GFX_LICENSE = Technology / Software Publicly Available
+TI_GFX_LICENSE_FILES = TSPA.txt
+TI_GFX_INSTALL_STAGING = YES
+
+TI_GFX_DEPENDENCIES = linux
+
+ifeq ($(BR2_PACKAGE_TI_GFX_ES3),y)
+TI_GFX_OMAPES = 3.x
+TI_GFX_PLATFORM = omap3
+endif
+ifeq ($(BR2_PACKAGE_TI_GFX_ES5),y)
+TI_GFX_OMAPES = 5.x
+TI_GFX_PLATFORM = omap3630 
+endif
+ifeq ($(BR2_PACKAGE_TI_GFX_ES6),y)
+TI_GFX_OMPAES = 6.x
+TI_GFX_PLATFORM = ti81xx 
+endif
+ifeq ($(BR2_PACKAGE_TI_GFX_ES8),y)
+TI_GFX_OMAPES = 8.x
+TI_GFX_PLATFORM = ti335x
+endif
+
+ifeq ($(BR2_PACKAGE_TI_GFX_DEBUG),y)
+TI_GFX_DEBUG_LIB = dbg
+TI_GFX_DEBUG_KM = debug
+else
+TI_GFX_DEBUG_LIB = rel
+TI_GFX_DEBUG_KM = release
+endif
+
+TI_GFX_BIN_PATH = gfx_$(TI_GFX_DEBUG_LIB)_es$(TI_GFX_OMAPES)
+
+define TI_GFX_EXTRACT_CMDS 
+	$(RM) -rf $(TI_GFX_DIR)
+	chmod +x $(DL_DIR)/$(TI_GFX_SOURCE)
+	printf "Y\nY\n qY\n\n" | $(DL_DIR)/$(TI_GFX_SOURCE) \
+		--prefix $(@D) \
+		--mode console
+endef
+
+TI_GFX_MAKE_CMD = cd $(@D)/GFX_Linux_KM && \
+		$(MAKE) $(LINUX_MAKE_FLAGS) \
+			BUILD=$(TI_GFX_DEBUG_KM) \
+			TI_PLATFORM=$(TI_GFX_PLATFORM) \
+			OMAPES=$(TI_GFX_OMAPES) \
+			SUPPORT_XORG=0 \
+			KERNELDIR=$(LINUX_DIR)
+
+define TI_GFX_BUILD_CMDS
+	( $(TI_GFX_MAKE_CMD) all )
+endef
+
+define TI_GFX_INSTALL_STAGING_CMDS
+	for incdir in EGL EWS GLES2 KHR; do \
+		$(INSTALL) -d $(STAGING_DIR)/usr/include/$$incdir; \
+		$(INSTALL) -D -m 0644 $(@D)/include/OGLES2/$$incdir/*.h $(STAGING_DIR)/usr/include/$$incdir; \
+	done
+	$(INSTALL) -D -m 0755 $(@D)/$(TI_GFX_BIN_PATH)/*.so $(STAGING_DIR)/usr/lib
+endef
+
+TI_GFX_TARGET_BIN = \
+	pvrsrvctl \
+
+ifeq ($(BR2_PACKAGE_TI_GFX_DEBUG),y)
+TI_GFX_TARGET_BIN += \
+	eglinfo \
+	ews_server \
+	ews_server_es2 \
+	ews_test_gles1 \
+	ews_test_gles2 \
+	ews_test_swrender \
+	gles1test1 \
+	gles2test1 \
+	pvr2d_test \
+	services_test \
+	sgx_blit_test \
+	sgx_clipblit_test \
+	sgx_flip_test \
+	sgx_init_test \
+	sgx_render_flip_test
+endif
+
+TI_GFX_IMGPV = "1.9.2188537"
+
+define TI_GFX_INSTALL_TARGET_CMDS
+	( $(TI_GFX_MAKE_CMD) install ) || \
+		echo "Your kernel configuration must include FB_DA8XX"
+	for file in $(TI_GFX_TARGET_BIN); do \
+		$(INSTALL) -D -m 0755 $(@D)/$(TI_GFX_BIN_PATH)/$$file  $(TARGET_DIR)/usr/bin/$$file; \
+	done
+	for sofile in $$(find $(@D)/$(TI_GFX_BIN_PATH) -name "lib*Open*.so") $$(find $(@D)/$(TI_GFX_BIN_PATH) -name "lib*srv*.so") $$(find $(@D)/$(TI_GFX_BIN_PATH) -name "lib*gl*.so") $$(find $(@D)/$(TI_GFX_BIN_PATH) -name "libpvr*.so") $$(find $(@D)/$(TI_GFX_BIN_PATH) -name "lib*GL*.so") $$(find $(@D)/$(TI_GFX_BIN_PATH) -name "libusc.so"); do \
+		if [ "$$(readlink -n $${sofile})" = "" ] ; then \
+			sobase=$$(basename $${sofile}); \
+			$(INSTALL) -D -m 0755 $$sofile $(TARGET_DIR)/usr/lib/$${sobase}.$(TI_GFX_IMGPV); \
+			ln -sf $${sobase}.$(TI_GFX_IMGPV) $(TARGET_DIR)/usr/lib/$${sobase}; \
+			ln -sf $${sobase}.$(TI_GFX_IMGPV) $(TARGET_DIR)/usr/lib/$${sobase}$$(echo $(TI_GFX_IMGPV) | awk -F. '{print "." $$1}'); \
+			ln -sf $${sobase}.$(TI_GFX_IMGPV) $(TARGET_DIR)/usr/lib/$${sobase}$$(echo $(TI_GFX_IMGPV) | awk -F. '{print "." $$1 "." $$2}'); \
+		fi; \
+	done
+endef
+
+define TI_GFX_CLEAN_CMDS
+	( $(TI_GFX_MAKE_CMD) clean )
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
