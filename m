From: Spenser Gilliland <spenser@gillilanding.com>
Date: Fri, 28 Jun 2013 15:41:43 -0500
Subject: [Buildroot] [PATCH 1/1] ti-gfx: add new package
Message-ID: <1372452103-14337-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---

This is the first patch for the TI Graphics SDK in Buildroot.  Please review
and try this on your own boards.

v1:
  - Added .pc files
  - all review issues addressed
RFC v3:
  - all reviews addressed
  - added demos
  - added hard float (not runtime tested)
  - added init script
  - added SGX detection script (untested)
  - tested on beaglexm using demos
RFC v2:
  - basic working with minor issues during tests
RFC v1:
  - inital revision

---
 package/Config.in                              |   1 +
 package/opengl/libegl/libegl.mk                |   4 +
 package/opengl/libgles/libgles.mk              |   4 +
 package/opengl/libopenvg/libopenvg.mk          |   4 +
 package/ti-gfx/Config.in                       |  64 +++++++++
 package/ti-gfx/S80ti-gfx                       |  45 +++++++
 package/ti-gfx/egl.pc                          |  10 ++
 package/ti-gfx/esrev.sh                        |  59 ++++++++
 package/ti-gfx/glesv2.pc                       |  10 ++
 package/ti-gfx/powervr.ini                     |   2 +
 package/ti-gfx/ti-gfx-km_install_modules.patch |  19 +++
 package/ti-gfx/ti-gfx-newclkapi.patch          | 138 +++++++++++++++++++
 package/ti-gfx/ti-gfx.mk                       | 178 +++++++++++++++++++++++++
 13 files changed, 538 insertions(+)
 create mode 100644 package/ti-gfx/Config.in
 create mode 100644 package/ti-gfx/S80ti-gfx
 create mode 100644 package/ti-gfx/egl.pc
 create mode 100644 package/ti-gfx/esrev.sh
 create mode 100644 package/ti-gfx/glesv2.pc
 create mode 100644 package/ti-gfx/powervr.ini
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
index 0000000..a35b31a
--- /dev/null
+++ b/package/ti-gfx/Config.in
@@ -0,0 +1,64 @@
+config BR2_PACKAGE_TI_GFX
+	bool "ti-gfx"
+	select BR2_PACKAGE_HAS_OPENGL_EGL
+	select BR2_PACKAGE_HAS_OPENGL_ES
+	depends on BR2_LINUX_KERNEL && (BR2_TOOLCHAIN_EXTERNAL_GLIBC || \
+		BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_glibc)
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
+	  Turns on debugging in the kernel module, install libraries built with
+	  debugging enabled, installs various tests and installs esrev script.
+
+config BR2_PACKAGE_TI_GFX_DEMOS
+	bool "install demos"
+	help
+	  install the OGLES2ChameleonMan and OGLES2MagicLantern demos
+
+config BR2_PACKAGE_TI_GFX_HARD_FLOAT
+	bool "use hard float binaries"
+	help
+	  Install hard float binaries (required if using a hard float toolchain)
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
+	bool "es3.x (OMAP35xx, AM35xx Rev 3.1+)"
+	help
+	 OMAP35xx, AM35xx Rev 3.1+ 
+
+config BR2_PACKAGE_TI_GFX_ES5
+	bool "es5.x (AM37xx, DM37xx)"
+	help
+	  AM37xx, DM37xx
+
+config BR2_PACKAGE_TI_GFX_ES6
+	bool "es6.x (AM387x, C6A814x, AM389x, C6A816x)"
+	help
+	  AM387x, C6A814x, AM389x, C6A816x
+
+config BR2_PACKAGE_TI_GFX_ES8
+	bool "es8.x (AM335x)"
+	help
+	  AM335x
+
+endchoice
+
+endif
+
+comment "requires an eglibc/glibc based toolchain and the linux kernel"
+	depends on !(BR2_LINUX_KERNEL && (BR2_TOOLCHAIN_EXTERNAL_GLIBC || \
+		BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_glibc))
diff --git a/package/ti-gfx/S80ti-gfx b/package/ti-gfx/S80ti-gfx
new file mode 100644
index 0000000..4e0b32b
--- /dev/null
+++ b/package/ti-gfx/S80ti-gfx
@@ -0,0 +1,45 @@
+#!/bin/sh
+
+case "$1" in 
+start)
+	echo "ti-gfx: starting pvr driver"
+
+	BITSPERPIXEL="$(fbset | grep geom | awk '{print $6}')"
+	YRES="$(fbset | grep geom | awk '{print $3}')"
+	# Set RGBA ordering to something the drivers like
+	if [ "$BITSPERPIXEL" = "32" ] ; then
+		fbset -rgba 8/16,8/8,8/0,8/24
+	fi
+	# Try to enable triple buffering when there's enough VRAM
+	fbset -vyres $(expr $YRES \* 3)
+
+	modprobe omaplfb
+	modprobe bufferclass_ti
+
+	pvr_maj=`grep "pvrsrvkm$" /proc/devices | cut -b1,2,3`
+	bc_maj=`grep "bc" /proc/devices | cut -b1,2,3`
+
+	if [ -e /dev/pvrsrvkm ] ; then
+		rm -f /dev/pvrsrvkm
+	fi
+
+	mknod /dev/pvrsrvkm c $pvr_maj 0
+	chmod 666 /dev/pvrsrvkm
+
+	if ! /usr/bin/pvrsrvctl --start --no-module; then
+		echo "ti-gfx: unable to start server"
+	fi
+	;;
+stop)
+	echo "ti-gfx: stopping pvr driver"
+
+	rmmod bufferclass_ti
+	rmmod omaplfb
+	rmmod pvrsrvkm
+	;;
+*)
+	echo "ti-gfx: Please use start, stop, or restart."
+
+	exit 1
+	;;
+esac
diff --git a/package/ti-gfx/egl.pc b/package/ti-gfx/egl.pc
new file mode 100644
index 0000000..79c239a
--- /dev/null
+++ b/package/ti-gfx/egl.pc
@@ -0,0 +1,10 @@
+prefix=/usr/
+exec_prefix=/usr/
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: egl
+Description: TI Graphics SDK implementation of EGL
+Version: 1.9.2188537
+Libs: -L${libdir} -lEGL -lGLESv2
+Cflags: -I{includedir}/EGL/
diff --git a/package/ti-gfx/esrev.sh b/package/ti-gfx/esrev.sh
new file mode 100644
index 0000000..4733ea9
--- /dev/null
+++ b/package/ti-gfx/esrev.sh
@@ -0,0 +1,59 @@
+#!/bin/sh
+
+# Debug script to determine proper ES revision for the current board. The 
+# pvrsrvkm module must be insmoded before attempting to get the es rev.
+
+machine_id() { # return the machine ID
+	awk 'BEGIN { FS=": " } /Hardware/ \
+		{ gsub(" ", "_", $2); print tolower($2) } ' </proc/cpuinfo
+}
+
+if [ "$(machine_id)" = "ti8168evm" ] ; then
+	CPUTYPE=TI816x
+elif [ "$(machine_id)" = "am335xevm" ] ; then
+	CPUTYPE=TI33XX
+else
+	CPUTYPE=$(devmem 0x4800244c | sed -e 's/0x00005C00/OMAP3503/' \
+	                                  -e 's/0x00001C00/OMAP3515/' \
+	                                  -e 's/0x00004C00/OMAP3525/' \
+	                                  -e 's/0x00000C00/OMAP3530/' \
+	                                  -e 's/0x00005E00/OMAP3503/' \
+	                                  -e 's/0x00001E00/OMAP3515/' \
+	                                  -e 's/0x00004E00/OMAP3525/' \
+	                                  -e 's/0x00000E00/OMAP3530/' \
+	                                  -e 's/0x00000CC0/OMAP3530/' )
+	if [[ "$CPUTYPE" != OMAP* ]]; then
+		echo "Unable to determine CPU type"
+		exit 1
+	fi
+fi
+
+case $CPUTYPE in
+"OMAP3530")
+	devmem 0x48004B48 w 0x2
+	devmem 0x48004B10 w 0x1
+	devmem 0x48004B00 w 0x2
+
+	ES_REVISION="$(devmem 0x50000014 | sed -e s:0x00010205:5: \
+		-e s:0x00010201:3: -e s:0x00010003:2:)"
+	;;
+"TI33XX")
+	devmem 0x44e01104 w 0x0
+	devmem 0x44e00904 w 0x2
+
+	ES_REVISION="$(devmem 0x56000014 | sed -e s:0x00010205:8:)"
+	;;
+"TI816x")
+	devmem 0x48180F04 w 0x0
+	devmem 0x48180900 w 0x2
+	devmem 0x48180920 w 0x2
+
+	ES_REVISION="$(devmem2 0x56000014 | sed -e s:0x00010205:6: -e s:0x00010201:3: -e s:0x00010003:2: | tail -n1 | awk -F': ' '{print $2}')"
+	;;
+*)
+	echo Unable to determine SGX hardware
+	exit 2
+	;;
+esac
+
+echo $ES_REVISION
diff --git a/package/ti-gfx/glesv2.pc b/package/ti-gfx/glesv2.pc
new file mode 100644
index 0000000..f49635f
--- /dev/null
+++ b/package/ti-gfx/glesv2.pc
@@ -0,0 +1,10 @@
+prefix=/usr
+exec_prefix=/usr
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: glesv2
+Description: TI Graphics SDK implementation of OpenGL ESv2
+Version: 1.9.2188537
+Libs: -L${libdir} -lGLESv2
+Cflags: -I${includedir}/
diff --git a/package/ti-gfx/powervr.ini b/package/ti-gfx/powervr.ini
new file mode 100644
index 0000000..8d2d853
--- /dev/null
+++ b/package/ti-gfx/powervr.ini
@@ -0,0 +1,2 @@
+[default]
+WindowSystem=libpvrPVR2D_FRONTWSEGL.so
diff --git a/package/ti-gfx/ti-gfx-km_install_modules.patch b/package/ti-gfx/ti-gfx-km_install_modules.patch
new file mode 100644
index 0000000..2cf6e81
--- /dev/null
+++ b/package/ti-gfx/ti-gfx-km_install_modules.patch
@@ -0,0 +1,19 @@
+Patch to add modules_install target to the modules makefile.  This makes
+installation a little easier.
+
+Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
+----
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
index 0000000..6ace119
--- /dev/null
+++ b/package/ti-gfx/ti-gfx-newclkapi.patch
@@ -0,0 +1,138 @@
+Index: ti-gfx-4_09_00_01/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c
+===================================================================
+--- ti-gfx-4_09_00_01.orig/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c	2013-06-28 13:44:06.352701522 -0500
++++ ti-gfx-4_09_00_01/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c	2013-06-28 13:45:12.364702727 -0500
+@@ -153,6 +153,49 @@
+ 	psTimingInfo->ui32ActivePowManLatencyms = SYS_SGX_ACTIVE_POWER_LATENCY_MS;
+ }
+ 
++#if LINUX_VERSION_CODE < KERNEL_VERSION(3,2,0)
++int clk_disable_unprepare(struct clk *clk)
++{
++	return clk_disable(clk);
++}
++#elif LINUX_VERSION_CODE < KERNEL_VERSION(3,3,0)
++int clk_disable_unprepare(struct clk *clk)
++{
++	res = clk_disable(clk);
++	if (res < 0)
++		return res;
++
++	res = clk_unprepare(clk);
++	if (ret < 0)
++		return res;
++
++	return 0;
++}
++#endif
++
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(3,2,0)
++int clk_prepare_enable(struct clk *clk)
++{
++	return clk_enable(clk);
++}
++#elif LINUX_VERSION_CODE < KERNEL_VERSION(3,3,0)
++int clk_prepare_enable(struct clk *clk)
++{
++	res = clk_prepare(clk);
++	if (ret < 0)
++		return res;
++
++	res = clk_enable(clk);
++	if (res < 0) {
++		clk_unprepare(clk);
++		return res;
++	}
++
++	return 0;
++}
++#endif
++
+ PVRSRV_ERROR EnableSGXClocks(SYS_DATA *psSysData)
+ {
+ #if !defined(NO_HARDWARE)
+@@ -167,19 +210,19 @@
+ 
+ 	PVR_DPF((PVR_DBG_MESSAGE, "EnableSGXClocks: Enabling SGX Clocks"));
+ 	
+-	res=clk_enable(psSysSpecData->psSGX_FCK);
++	res=clk_prepare_enable(psSysSpecData->psSGX_FCK);
+ 	if (res < 0)
+         {
+                 PVR_DPF((PVR_DBG_ERROR, "EnableSGXClocks: Couldn't enable SGX functional clock (%d)", res));
+                 return PVRSRV_ERROR_UNABLE_TO_ENABLE_CLOCK;
+         }
+ 
+-	res=clk_enable(psSysSpecData->psSGX_ICK);
++	res=clk_prepare_enable(psSysSpecData->psSGX_ICK);
+         if (res < 0)
+         {
+                 PVR_DPF((PVR_DBG_ERROR, "EnableSGXClocks: Couldn't enable SGX interface clock (%d)", res));
+ 
+-                clk_disable(psSysSpecData->psSGX_FCK);
++                clk_disable_unprepare(psSysSpecData->psSGX_FCK);
+                 return PVRSRV_ERROR_UNABLE_TO_ENABLE_CLOCK;
+         }
+ 
+@@ -233,7 +276,6 @@
+ 	return PVRSRV_OK;
+ }
+ 
+-
+ IMG_VOID DisableSGXClocks(SYS_DATA *psSysData)
+ {
+ #if !defined(NO_HARDWARE)
+@@ -246,9 +288,9 @@
+ 	
+ 	PVR_DPF((PVR_DBG_MESSAGE, "DisableSGXClocks: Disabling SGX Clocks"));
+ 	
+-	clk_disable(psSysSpecData->psSGX_FCK);
++	clk_disable_unprepare(psSysSpecData->psSGX_FCK);
+ 
+-	clk_disable(psSysSpecData->psSGX_ICK);
++	clk_disable_unprepare(psSysSpecData->psSGX_ICK);
+ 
+ //	SysDisableSGXInterrupts(psSysData);
+ 
+@@ -374,14 +416,14 @@
+ 	rate = clk_get_rate(psSysSpecData->psGPT11_FCK);
+ 	PVR_TRACE(("GPTIMER11 clock is %dMHz", HZ_TO_MHZ(rate)));
+ 
+-	res = clk_enable(psSysSpecData->psGPT11_FCK);
++	res = clk_prepare_enable(psSysSpecData->psGPT11_FCK);
+ 	if (res < 0)
+ 	{
+ 		PVR_DPF((PVR_DBG_ERROR, "EnableSystemClocks: Couldn't enable GPTIMER11 functional clock (%d)", res));
+ 		goto ExitError;
+ 	}
+ 
+-	res = clk_enable(psSysSpecData->psGPT11_ICK);
++	res = clk_prepare_enable(psSysSpecData->psGPT11_ICK);
+ 	if (res < 0)
+ 	{
+ 		PVR_DPF((PVR_DBG_ERROR, "EnableSystemClocks: Couldn't enable GPTIMER11 interface clock (%d)", res));
+@@ -444,9 +486,9 @@
+ 
+ ExitDisableGPT11ICK:
+ #if defined(PVR_OMAP3_TIMING_PRCM)
+-	clk_disable(psSysSpecData->psGPT11_ICK);
++	clk_disable_unprepare(psSysSpecData->psGPT11_ICK);
+ ExitDisableGPT11FCK:
+-	clk_disable(psSysSpecData->psGPT11_FCK);
++	clk_disable_unprepare(psSysSpecData->psGPT11_FCK);
+ ExitError:
+ #endif	
+ 	eError = PVRSRV_ERROR_CLOCK_REQUEST_FAILED;
+@@ -490,9 +532,9 @@
+ #endif
+ 
+ #if defined(PVR_OMAP3_TIMING_PRCM)
+-	clk_disable(psSysSpecData->psGPT11_ICK);
++	clk_disable_unprepare(psSysSpecData->psGPT11_ICK);
+ 
+-	clk_disable(psSysSpecData->psGPT11_FCK);
++	clk_disable_unprepare(psSysSpecData->psGPT11_FCK);
+ #endif	
+ }
+ #endif	
diff --git a/package/ti-gfx/ti-gfx.mk b/package/ti-gfx/ti-gfx.mk
new file mode 100644
index 0000000..0697d08
--- /dev/null
+++ b/package/ti-gfx/ti-gfx.mk
@@ -0,0 +1,178 @@
+###############################################################################
+#
+# ti-gfx 
+#
+###############################################################################
+
+TI_GFX_VERSION = 4_09_00_01
+TI_GFX_SO_VERSION = 1.9.2188537
+
+ifeq ($(BR2_PACKAGE_TI_GFX_HARD_FLOAT),y)
+TI_GFX_SOURCE = Graphics_SDK_setuplinux_$(TI_GFX_VERSION)_hardfp_minimal_demos.bin
+else
+TI_GFX_SOURCE = Graphics_SDK_setuplinux_$(TI_GFX_VERSION)_minimal_demos.bin
+endif
+
+TI_GFX_SITE = http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/$(TI_GFX_VERSION)/exports/
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
+TI_GFX_KM_MAKE_OPTS = \
+	$(LINUX_MAKE_FLAGS) \
+	BUILD=$(TI_GFX_DEBUG_KM) \
+	TI_PLATFORM=$(TI_GFX_PLATFORM) \
+	OMAPES=$(TI_GFX_OMAPES) \
+	SUPPORT_XORG=0 \
+	KERNELDIR=$(LINUX_DIR)
+
+TI_GFX_DEMO_MAKE_OPTS = \
+	PLATFORM=LinuxARMV7 \
+	Common=1 \
+	X11BUILD=0
+
+# The only required binary is pvrsrvctl all others are optional
+TI_GFX_BIN = pvrsrvctl
+
+ifeq ($(BR2_PACKAGE_TI_GFX_DEBUG),y)
+TI_GFX_BIN += \
+	eglinfo ews_server ews_server_es2 ews_test_gles1 ews_test_gles2 \
+	ews_test_swrender gles1test1 gles2test1 pvr2d_test services_test \
+	sgx_blit_test sgx_clipblit_test sgx_flip_test sgx_init_test \
+	sgx_render_flip_test xeglinfo xgles1test1 xgles2test1 xmultiegltest
+endif
+
+TI_GFX_LIBS = \
+	libEGL libews libGLES_CM_eglimage libGLES_CM libGLESv2 \
+	libGLESv2_eglimage libglslcompiler_eglimage libglslcompiler \
+	libIMGegl_eglimage libIMGegl libpvr2d libpvrEWS_WSEGL \
+	libpvrPVR2D_BLITWSEGL libpvrPVR2D_DRIWSEGL libpvrPVR2D_FLIPWSEGL \
+	libpvrPVR2D_FRONTWSEGL libpvrPVR2D_LINUXFBWSEGL libpvrPVRScopeServices \
+	libsrv_init libsrv_um libsrv_um_dri libusc pvr_drv
+
+TI_GFX_DEMOS = ChameleonMan MagicLantern
+TI_GFX_DEMOS_LOC = GFX_Linux_SDK/OGLES2/SDKPackage/Demos
+TI_GFX_DEMOS_MAKE_LOC = OGLES2/Build/LinuxGeneric
+TI_GFX_DEMOS_BIN_LOC = OGLES2/Build/LinuxARMV7/ReleaseRaw/
+
+TI_GFX_HDR_DIRS = OGLES2/EGL OGLES2/EWS OGLES2/GLES2 OGLES2/KHR \
+	OGLES/GLES bufferclass_ti pvr2d wsegl
+
+define TI_GFX_EXTRACT_CMDS 
+	$(RM) -rf $(TI_GFX_DIR)
+	chmod +x $(DL_DIR)/$(TI_GFX_SOURCE)
+	printf "Y\nY\n qY\n\n" | $(DL_DIR)/$(TI_GFX_SOURCE) \
+		--prefix $(@D) \
+		--mode console
+endef
+
+define TI_GFX_BUILD_KM_CMDS
+	$(MAKE) $(TI_GFX_KM_MAKE_OPTS) -C $(@D)/GFX_Linux_KM all
+endef
+
+define TI_GFX_BUILD_DEMO_CMDS
+	$(foreach demo, $(TI_GFX_DEMOS), \
+		cd $(@D)/$(TI_GFX_DEMOS_LOC)/$(demo)/$(TI_GFX_DEMOS_MAKE_LOC); \
+		$(TARGET_MAKE_ENV) $(MAKE1) $(TI_GFX_DEMO_MAKE_OPTS) all
+	)
+endef
+
+define TI_GFX_BUILD_CMDS
+	$(TI_GFX_BUILD_KM_CMDS)
+	$(if $(BR2_PACKAGE_TI_GFX_DEMOS),
+		$(TI_GFX_BUILD_DEMO_CMDS)
+	)
+endef
+
+define TI_GFX_INSTALL_STAGING_CMDS
+	$(foreach incdir,$(TI_GFX_HDR_DIRS),
+		$(INSTALL) -d $(STAGING_DIR)/usr/include/$(notdir $(incdir)); \
+		$(INSTALL) -D -m 0644 $(@D)/include/$(incdir)/*.h \
+			$(STAGING_DIR)/usr/include/$(notdir $(incdir))/
+	)
+	$(INSTALL) -D -m 0755 $(@D)/$(TI_GFX_BIN_PATH)/*.so $(STAGING_DIR)/usr/lib/
+	$(INSTALL) -D -m 0644 package/ti-gfx/egl.pc $(STAGING_DIR)/usr/lib/pkgconfig/
+	$(INSTALL) -D -m 0644 package/ti-gfx/glesv2.pc $(STAGING_DIR)/usr/lib/pkgconfig/
+endef
+
+define TI_GFX_INSTALL_KM_CMDS
+	$(MAKE) $(TI_GFX_KM_MAKE_OPTS) -C $(@D)/GFX_Linux_KM install
+endef
+
+define TI_GFX_INSTALL_BINS_CMDS
+	$(foreach bin,$(TI_GFX_BIN),
+		$(INSTALL) -D -m 0755 $(@D)/$(TI_GFX_BIN_PATH)/$(bin) \
+			$(TARGET_DIR)/usr/bin/$(bin)
+	)
+	$(if $(BR2_PACKAGE_TI_GFX_DEBUG),
+		$(INSTALL) -D -m 0755 package/ti-gfx/esrev.sh \
+			$(TARGET_DIR)/usr/bin/esrev)
+endef
+
+define TI_GFX_INSTALL_LIBS_CMDS
+	# create symlinks and install libraries.  these libraries do not have a 
+	# SONAME defined; therefore, they will not be automatically renamed and 
+	# must be renamed manually.
+	$(foreach lib,$(TI_GFX_LIBS),
+		$(INSTALL) -D -m 0755 $(@D)/$(TI_GFX_BIN_PATH)/$(lib).so \
+			$(TARGET_DIR)/usr/lib/$(lib).so.$(TI_GFX_SO_VERSION); \
+		ln -sf $(lib).so.$(TI_GFX_SO_VERSION) \
+			$(TARGET_DIR)/usr/lib/$(lib).so
+	)
+	# libs use the following file for configuration.
+	$(INSTALL) -D -m 0644 package/ti-gfx/powervr.ini \
+		$(TARGET_DIR)/etc/powervr.ini
+endef
+
+define TI_GFX_INSTALL_DEMOS_CMDS
+	$(foreach demo,$(TI_GFX_DEMOS),
+		$(INSTALL) -D -m 0755 \
+		$(@D)/$(TI_GFX_DEMOS_LOC)/$(demo)/$(TI_GFX_DEMOS_BIN_LOC)/OGLES2$(demo) \
+		$(TARGET_DIR)/usr/bin/OGLES2$(demo)
+	)
+endef
+
+define TI_GFX_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/ti-gfx/S80ti-gfx \
+		$(TARGET_DIR)/etc/init.d/S80ti-gfx
+endef
+
+define TI_GFX_INSTALL_TARGET_CMDS
+	$(TI_GFX_INSTALL_KM_CMDS)
+	$(TI_GFX_INSTALL_BINS_CMDS)
+	$(TI_GFX_INSTALL_LIBS_CMDS)
+	$(if $(BR2_PACKAGE_TI_GFX_DEMOS),
+		$(TI_GFX_INSTALL_DEMOS_CMDS)
+	)
+endef
+
+$(eval $(generic-package))
-- 
1.8.1.2
