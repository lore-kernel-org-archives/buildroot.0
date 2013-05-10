From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 May 2013 00:26:11 +0200
Subject: [Buildroot] [PATCH] Add package gpu-viv-bin-mx6q to the
 freescale-imx directory
In-Reply-To: <1368129212-4892-2-git-send-email-h.fijnvandraat@inter.nl.net>
References: <1368129212-4892-1-git-send-email-h.fijnvandraat@inter.nl.net>
 <1368129212-4892-2-git-send-email-h.fijnvandraat@inter.nl.net>
Message-ID: <518D7403.9010300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  We usually give a title like:

gpu-viv-bin-mx6q: new package

  Also, you should probably add this to the series that moves everything 
imx-related into the freescale-imx directory, because it depends on that 
move.

On 09/05/13 21:53, Henk Fijnvandraat wrote:
> Signed-off-by: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
[snip]
> diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
> new file mode 100644
> index 0000000..e09addb
> --- /dev/null
> +++ b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_GPU_VIV_BIN_IMX6Q
> +	bool "gpu-viv-bin-mx6q"
> +	select BR2_PACKAGE_HAS_OPENGL_EGL
> +	select BR2_PACKAGE_HAS_OPENGL_ES
> +	depends on BR2_arm # Only relevant for i.MX6
> +	 # Library binaries are linked against libc.so.6
> +	depends on BR2_TOOLCHAIN_CTNG_glibc || \
> +		BR2_TOOLCHAIN_CTNG_eglibc || \
> +		BR2_TOOLCHAIN_EXTERNAL_GLIBC
> +	help
> +	  Userspace libraries for Vivante GPU on i.MX6 platforms
> +
> +	  It contains libraries and headers for GLES, OpenCL, and OpenVG.
> +	  It also contains a DRI plugin for X11. It also contains a
> +	  plugin for DirectFB-1.4.0, but that doesn't work together with
> +	  buildroot's DirectFB-1.4.16.

  It probably would work with 1.4.16, but buildroot has 1.6.3.

> +
> +	  This library is provided by Freescale as-is and doesn't have
> +	  an upstream.
> +
> +if BR2_PACKAGE_GPU_VIV_BIN_IMX6Q
> +config BR2_PACKAGE_GPU_VIV_BIN_IMX6Q_EXAMPLES
> +	bool "gpu-viv-bin-mx6q-examples"

  This config option should have a more descriptive name, e.g.
	bool "Install examples"

  Note that it is not necessary to repeat the package name, because the 
option will be indented under gpu-viv-bin-mx6q.

> +	help
> +	  Copy the Vivante examples to the Target
> +endif
> diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q-0001-correct-HAL-include.patch b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q-0001-correct-HAL-include.patch
> new file mode 100644
> index 0000000..f63bb9a
> --- /dev/null
> +++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q-0001-correct-HAL-include.patch
> @@ -0,0 +1,18 @@
> +Correct the directory path for gc_hal_eglplatform_type.h
> +
> +Signed-off-by: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
> +
> +Only in gpu-viv-bin-mx6q-1.1.0: etc
> +diff -rup gpu-viv-bin-mx6q-1.1.0-orig/usr/include/gc_vdk_types.h gpu-viv-bin-mx6q-1.1.0/usr/include/gc_vdk_types.h
> +--- gpu-viv-bin-mx6q-1.1.0-orig/usr/include/gc_vdk_types.h	2012-12-18 10:35:55.000000000 +0100
> ++++ gpu-viv-bin-mx6q-1.1.0/usr/include/gc_vdk_types.h	2013-05-09 21:09:28.080138681 +0200
> +@@ -39,7 +39,7 @@ extern "C" {
> + #endif
> +
> + #include <EGL/egl.h>
> +-#include "gc_hal_eglplatform_type.h"
> ++#include <HAL/gc_hal_eglplatform_type.h>
> +
> +
> + /*******************************************************************************
> +Only in gpu-viv-bin-mx6q-1.1.0/usr/include: gc_vdk_types.h~
> diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> new file mode 100644
> index 0000000..d003443
> --- /dev/null
> +++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> @@ -0,0 +1,77 @@
> +#############################################################
> +#
> +# gpu-viv-bin-mx6q
> +#
> +#############################################################
> +
> +GPU_VIV_BIN_MX6Q_VERSION = $(IMX_VERSION_LEVEL)
> +GPU_VIV_BIN_MX6Q_SITE    = $(IMX_MIRROR_SITE)
> +GPU_VIV_BIN_MX6Q_SOURCE  = gpu-viv-bin-mx6q-$(GPU_VIV_BIN_MX6Q_VERSION).bin
> +
> +GPU_VIV_BIN_MX6Q_INSTALL_STAGING = YES
> +
> +# GPU_VIV_BIN_MX6Q_LICENSE = Freescale Semiconductor Software License Agreement
> +# No license file is included in the archive; we could extract it from
> +# the self-extractor, but that's just too much effort.
> +# This is a legal minefield: the EULA specifies that
> +# the Board Support Package includes software and hardware (sic!)
> +# for which a separate license is needed...
> +GPU_VIV_BIN_MX6Q_REDISTRIBUTE = NO
> +
> +# The archive is a shell-self-extractor of a bzipped tar. It happens
> +# to extract in the correct directory (gpu-viv-bin-mx6q-x.y.z)
> +# The --force makes sure it doesn't fail if the source dir already exists.
> +# The --auto-accept skips the license check - not needed for us
> +# because we have legal-info.
> +define GPU_VIV_BIN_MX6Q_EXTRACT_CMDS
> +	cd $(BUILD_DIR); \
> +	sh $(DL_DIR)/$(GPU_VIV_BIN_MX6Q_SOURCE) --force --auto-accept
> +endef
> +
> +define GPU_VIV_BIN_MX6Q_INSTALL_STAGING_CMDS
> +	cp -r $(@D)/usr/* $(STAGING_DIR)/usr
> +endef
> +
> +ifdef $(BR2_PACKAGE_GPU_VIV_BIN_IMX6Q_EXAMPLES)
> +define GPU_VIV_BIN_MX6Q_INSTALL_EXAMPLES
> +	cp -r $(@D)/opt/* $(TARGET_DIR)/opt
> +endef
> +endif
> +
> +ifeq ($(BR2_PACKAGE_XORG7),y)
> +GPU_VIV_BIN_MX6Q_LIB_TARGET = x11

  Actually, I never tested if the x11 version works at all - it may 
depend on a different X11 version than we carry, just like directfb...


  Regards,
  Arnout

> +else
> +# DirectFB is not supported (wrong version)
> +GPU_VIV_BIN_MX6Q_LIB_TARGET = fb
> +endif
> +
> +# Instead of building, we fix up the inconsistencies that exist
> +# in the upstream archive here.
> +# Make sure these commands are idempotent.
> +define GPU_VIV_BIN_MX6Q_BUILD_CMDS
> +	$(SED) 's/defined(LINUX)/defined(__linux__)/g' $(@D)/usr/include/*/*.h
> +	for lib in EGL GAL VIVANTE; do \
> +		ln -sf lib$${lib}-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so \
> +			$(@D)/usr/lib/lib$${lib}.so; \
> +	done
> +	ln -sf libGL.so.1.2 $(@D)/usr/lib/libGL.so.1
> +	ln -sf libGL.so.1.2 $(@D)/usr/lib/libGL.so
> +endef
> +
> +# On the target, remove the unused libraries.
> +# Note that this is _required_, else ldconfig may create symlinks
> +# to the wrong library
> +define GPU_VIV_BIN_MX6Q_INSTALL_TARGET_CMDS
> +	$(GPU_VIV_BIN_MX6Q_INSTALL_EXAMPLES)
> +	cp -a $(@D)/usr/lib $(TARGET_DIR)/usr
> +	for lib in EGL GAL VIVANTE; do \
> +		for f in $(TARGET_DIR)/usr/lib/lib$${lib}-*.so; do \
> +			case $$f in \
> +				*-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so) : ;; \
> +				*) $(RM) $$f ;; \
> +			esac; \
> +		done; \
> +	done
> +endef
> +
> +$(eval $(generic-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
