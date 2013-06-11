From: Charles Krinke <charles.krinke@gmail.com>
Date: Tue, 11 Jun 2013 10:58:53 -0700
Subject: [Buildroot] [RFC] ti-gfx: add new package
In-Reply-To: <1370636307-23089-1-git-send-email-spenser@gillilanding.com>
References: <CALo-6+j77P2RsdYRO9BR04rUX-j0HmxzXtBuHzo_UQ1wDjXbHQ@mail.gmail.com>
 <1370636307-23089-1-git-send-email-spenser@gillilanding.com>
Message-ID: <CALo-6+ihs6caa98RCvZmZKZ5pUsfXjXPPBJn_zG4J6eBBpsuAw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser:

I believe including a kernel compile with this patch is a problem for
several reasons.

The first is that the TI defconfig for AM3517_evm never made it into
the Linux kernel along with all the supporting changes, so the build
fails.

The second is that folks are using various versions of Graphics_SDK
from 4_05_xx through 4_09_xx. These same folks generally build the
Graphics_SDK once externally to buildroot to avoid carrying a 135MB
file in the dl/ directory. This doesnt make sense for buildroot for
two kernel .ko modules where 135MByte is larger then any other
package.

Perhaps you can consider making Graphics_SDK an external reference in
your patch to make things go more smoothly?

On 6/7/13, Spenser Gilliland <spenser@gillilanding.com> wrote:
> This is WIP of adding the TI Graphics SDK to buildroot.
>
> TODO:
>    Install startup files for sgx core.
>    Install khronos gles/egl/vg libraries.
>    Create .pc files to simplfy additional packaging.
>    Testing, lots of testing.
>
> ---
>  package/Config.in                              |    1 +
>  package/opengl/libegl/libegl.mk                |    4 +
>  package/opengl/libgles/libgles.mk              |    4 +
>  package/opengl/libopenvg/libopenvg.mk          |    4 +
>  package/ti-gfx/Config.in                       |   54 ++++++++++++++++++
>  package/ti-gfx/ti-gfx-km_install_modules.patch |   14 +++++
>  package/ti-gfx/ti-gfx-newclkapi.patch          |   55 ++++++++++++++++++
>  package/ti-gfx/ti-gfx.mk                       |   71
> ++++++++++++++++++++++++
>  8 files changed, 207 insertions(+), 0 deletions(-)
>  create mode 100644 package/ti-gfx/Config.in
>  create mode 100644 package/ti-gfx/ti-gfx-km_install_modules.patch
>  create mode 100644 package/ti-gfx/ti-gfx-newclkapi.patch
>  create mode 100644 package/ti-gfx/ti-gfx.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index ce82e99..8c40b56 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -290,6 +290,7 @@ source "package/snowball-hdmiservice/Config.in"
>  source "package/sredird/Config.in"
>  source "package/statserial/Config.in"
>  source "package/sysstat/Config.in"
> +source "package/ti-gfx/Config.in"
>  source "package/ti-utils/Config.in"
>  source "package/uboot-tools/Config.in"
>  source "package/udev/Config.in"
> diff --git a/package/opengl/libegl/libegl.mk
> b/package/opengl/libegl/libegl.mk
> index bd8040d..00e1f19 100644
> --- a/package/opengl/libegl/libegl.mk
> +++ b/package/opengl/libegl/libegl.mk
> @@ -10,6 +10,10 @@ ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
>  LIBEGL_DEPENDENCIES += rpi-userland
>  endif
>
> +ifeq ($(BR2_PACKAGE_TI_GFX),y)
> +LIBEGL_DEPENDENCIES += ti-gfx
> +endif
> +
>  ifeq ($(LIBEGL_DEPENDENCIES),)
>  define LIBEGL_CONFIGURE_CMDS
>  	echo "No libEGL implementation selected. Configuration error."
> diff --git a/package/opengl/libgles/libgles.mk
> b/package/opengl/libgles/libgles.mk
> index a0048a7..d2fe11b 100644
> --- a/package/opengl/libgles/libgles.mk
> +++ b/package/opengl/libgles/libgles.mk
> @@ -10,6 +10,10 @@ ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
>  LIBGLES_DEPENDENCIES += rpi-userland
>  endif
>
> +ifeq ($(BR2_PACKAGE_TI_GFX),y)
> +LIBGLES_DEPENDENCIES += ti-gfx
> +endif
> +
>  ifeq ($(LIBGLES_DEPENDENCIES),)
>  define LIBGLES_CONFIGURE_CMDS
>  	echo "No libGLES implementation selected. Configuration error."
> diff --git a/package/opengl/libopenvg/libopenvg.mk
> b/package/opengl/libopenvg/libopenvg.mk
> index 03f59ba..118ae7f 100644
> --- a/package/opengl/libopenvg/libopenvg.mk
> +++ b/package/opengl/libopenvg/libopenvg.mk
> @@ -10,6 +10,10 @@ ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
>  LIBOPENVG_DEPENDENCIES += rpi-userland
>  endif
>
> +ifeq ($(BR2_PACKAGE_TI_GFX),y)
> +LIBOPENVG_DEPENDENCIES += ti-gfx
> +endif
> +
>  ifeq ($(LIBOPENVG_DEPENDENCIES),)
>  define LIBOPENVG_CONFIGURE_CMDS
>  	echo "No libOpenVG implementation selected. Configuration error."
> diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
> new file mode 100644
> index 0000000..c3ac984
> --- /dev/null
> +++ b/package/ti-gfx/Config.in
> @@ -0,0 +1,54 @@
> +config BR2_PACKAGE_TI_GFX
> +	bool "ti-gfx"
> +	select BR2_LINUX_KERNEL
> +	select BR2_PACKAGE_DEVMEM2
> +	select BR2_PACKAGE_HAS_OPENGL_EGL
> +	select BR2_PACKAGE_HAS_OPENGL_ES
> +	depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc ||
> BR2_TOOLCHAIN_CTNG_glibc
> +	help
> +	  Graphics libraries for TI boards.
> +
> +	  http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk/
> +
> +if BR2_PACKAGE_TI_GFX
> +
> +config BR2_PACKAGE_TI_GFX_DEBUG
> +	bool "enable debug support"
> +	help
> +	  Turn on debugging in kernel module and install libraries built with
> +	  debugging enabled
> +
> +choice
> +	prompt "Target"
> +	default BR2_PACKAGE_TI_GFX_OMAP3
> +	help
> +	  Select the SOC for which you would like to install drivers. Please
> +	  use the chart at
> +	
> http://processors.wiki.ti.com/index.php/OMAP35x_Graphics_SDK_Getting_Started_Guide
> +
> +config BR2_PACKAGE_TI_GFX_ES3
> +	bool "es3.x"
> +	help
> +	 OMAP35xx, AM35xx Rev 3.1+
> +
> +config BR2_PACKAGE_TI_GFX_ES5
> +	bool "es5.x"
> +	help
> +	  AM37xx, DM37xx
> +
> +config BR2_PACKAGE_TI_GFX_ES6
> +	bool "es6.x"
> +	help
> +	  AM387x, C6A814x, AM389x, C6A816x
> +
> +config BR2_PACKAGE_TI_GFX_ES8
> +	bool "es8.x"
> +	help
> +	  AM335x
> +
> +endchoice
> +
> +endif
> +
> +comment "requires an external eglibc/glibc based toolchain"
> +	depends on !(BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc ||
> BR2_TOOLCHAIN_CTNG_glibc)
> diff --git a/package/ti-gfx/ti-gfx-km_install_modules.patch
> b/package/ti-gfx/ti-gfx-km_install_modules.patch
> new file mode 100644
> index 0000000..63bfd19
> --- /dev/null
> +++ b/package/ti-gfx/ti-gfx-km_install_modules.patch
> @@ -0,0 +1,14 @@
> +Index: ti-gfx-4_09_00_01/GFX_Linux_KM/Makefile
> +===================================================================
> +--- ti-gfx-4_09_00_01.orig/GFX_Linux_KM/Makefile	2013-03-07
> 11:00:11.000000000 -0600
> ++++ ti-gfx-4_09_00_01/GFX_Linux_KM/Makefile	2013-05-23 01:36:29.356676281
> -0500
> +@@ -479,6 +479,9 @@
> + all:
> + 	$(MAKE) -C $(KERNELDIR) M=`pwd` $*
> +
> ++install:
> ++	$(MAKE) -C $(KERNELDIR) M=`pwd` modules_install
> ++
> + clean:
> + 	@find . -name "*.o" -exec rm -r {} \;
> + 	@find . -name "*.ko" -exec rm -r {} \;
> diff --git a/package/ti-gfx/ti-gfx-newclkapi.patch
> b/package/ti-gfx/ti-gfx-newclkapi.patch
> new file mode 100644
> index 0000000..b35ac31
> --- /dev/null
> +++ b/package/ti-gfx/ti-gfx-newclkapi.patch
> @@ -0,0 +1,55 @@
> +Index:
> ti-gfx-4_09_00_01/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c
> +===================================================================
> +---
> ti-gfx-4_09_00_01.orig/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c	2013-03-04
> 08:41:35.000000000 -0600
> ++++
> ti-gfx-4_09_00_01/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c	2013-06-05
> 12:00:08.778605221 -0500
> +@@ -166,11 +166,27 @@
> + 	}
> +
> + 	PVR_DPF((PVR_DBG_MESSAGE, "EnableSGXClocks: Enabling SGX Clocks"));
> +-	
> ++   res=clk_prepare(psSysSpecData->psSGX_FCK);
> ++	if (res < 0)
> ++        {
> ++                PVR_DPF((PVR_DBG_ERROR, "EnableSGXClocks: Couldn't enable
> SGX functional clock (%d)", res));
> ++                clk_unprepare(psSysSpecData->psSGX_FCK);
> ++                return PVRSRV_ERROR_UNABLE_TO_ENABLE_CLOCK;
> ++        }
> ++
> + 	res=clk_enable(psSysSpecData->psSGX_FCK);
> + 	if (res < 0)
> +         {
> +                 PVR_DPF((PVR_DBG_ERROR, "EnableSGXClocks: Couldn't enable
> SGX functional clock (%d)", res));
> ++                clk_unprepare(psSysSpecData->psSGX_FCK);
> ++                return PVRSRV_ERROR_UNABLE_TO_ENABLE_CLOCK;
> ++        }
> ++
> ++	res=clk_prepare(psSysSpecData->psSGX_ICK);
> ++	if(res < 0)
> ++        {
> ++                PVR_DPF((PVR_DBG_ERROR, "EnableSGXClocks: Couldn't enable
> SGX functional clock (%d)", res));
> ++                clk_unprepare(psSysSpecData->psSGX_FCK);
> +                 return PVRSRV_ERROR_UNABLE_TO_ENABLE_CLOCK;
> +         }
> +
> +@@ -178,8 +194,9 @@
> +         if (res < 0)
> +         {
> +                 PVR_DPF((PVR_DBG_ERROR, "EnableSGXClocks: Couldn't enable
> SGX interface clock (%d)", res));
> +-
> ++                clk_unprepare(psSysSpecData->psSGX_ICK);
> +                 clk_disable(psSysSpecData->psSGX_FCK);
> ++                clk_unprepare(psSysSpecData->psSGX_FCK);
> +                 return PVRSRV_ERROR_UNABLE_TO_ENABLE_CLOCK;
> +         }
> +
> +@@ -247,8 +264,9 @@
> + 	PVR_DPF((PVR_DBG_MESSAGE, "DisableSGXClocks: Disabling SGX Clocks"));
> + 	
> + 	clk_disable(psSysSpecData->psSGX_FCK);
> +-
> ++	clk_unprepare(psSysSpecData->psSGX_FCK);
> + 	clk_disable(psSysSpecData->psSGX_ICK);
> ++	clk_unprepare(psSysSpecData->psSGX_ICK);
> +
> + //	SysDisableSGXInterrupts(psSysData);
> +
> diff --git a/package/ti-gfx/ti-gfx.mk b/package/ti-gfx/ti-gfx.mk
> new file mode 100644
> index 0000000..154c792
> --- /dev/null
> +++ b/package/ti-gfx/ti-gfx.mk
> @@ -0,0 +1,71 @@
> +###############################################################################
> +#
> +# ti-gfx
> +#
> +###############################################################################
> +
> +TI_GFX_VERSION = 4_09_00_01
> +TI_GFX_SOURCE =
> Graphics_SDK_setuplinux_$(TI_GFX_VERSION)_minimal_demos.bin
> +TI_GFX_SITE =
> http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/$(TI_GFX_VERSION)/exports/
> +TI_GFX_LICENSE = TSPA
> +TI_GFX_LICENSE_FILES = TSPA.txt
> +TI_GFX_INSTALL_STAGING = YES
> +
> +TI_GFX_DEPENDENCIES = linux
> +
> +ifeq ($(BR2_PACKAGE_TI_GFX_ES3),y)
> +TI_GFX_OMAPES = 3.x
> +TI_GFX_PLATFORM = omap3
> +endif
> +ifeq ($(BR2_PACKAGE_TI_GFX_ES5),y)
> +TI_GFX_OMAPES = 5.x
> +TI_GFX_PLATFORM = omap3630
> +endif
> +ifeq ($(BR2_PACKAGE_TI_GFX_ES6),y)
> +TI_GFX_OMPAES = 6.x
> +TI_GFX_PLATFORM = ti81xx
> +endif
> +ifeq ($(BR2_PACKAGE_TI_GFX_ES8),y)
> +TI_GFX_OMAPES = 8.x
> +TI_GFX_PLATFORM = ti335x
> +endif
> +
> +define TI_GFX_EXTRACT_CMDS
> +	$(RM) -rf $(TI_GFX_DIR)
> +	chmod +x $(DL_DIR)/$(TI_GFX_SOURCE)
> +	printf "Y\nY\n qY\n\n" | $(DL_DIR)/$(TI_GFX_SOURCE) \
> +		--prefix $(TI_GFX_DIR) \
> +		--mode console
> +endef
> +
> +define TI_GFX_CONFIGURE_CMDS
> +	echo "no configure required binary only package"
> +endef
> +
> +TI_GFX_MAKE_CMD = cd $(TI_GFX_SRCDIR)/GFX_Linux_KM && \
> +		$(MAKE) $(LINUX_MAKE_FLAGS) \
> +			BUILD=$(BR2_PACKAGE_TI_GFX_DEBUG) \
> +			TI_PLATFORM=$(TI_GFX_PLATFORM) \
> +			OMAPES=$(TI_GFX_OMAPES) \
> +			SUPPORT_XORG=0 \
> +			KERNELDIR=$(LINUX_DIR)
> +
> +define TI_GFX_BUILD_CMDS
> +	( $(TI_GFX_MAKE_CMD) clean && \
> +	  $(TI_GFX_MAKE_CMD) all )
> +endef
> +
> +define TI_GFX_INSTALL_STAGING_CMDS
> +	
> +endef
> +
> +define TI_GFX_INSTALL_TARGET_CMDS
> +	( $(TI_GFX_MAKE_CMD) install ) || \
> +		echo "Your kernel configuration must include FB_DA8XX"
> +endef
> +
> +define TI_GFX_CLEAN_CMDS
> +	( $(TI_GFX_MAKE_CMD) clean )
> +endef
> +
> +$(eval $(generic-package))
> --
> 1.7.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Charles Krinke
