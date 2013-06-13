From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 13 Jun 2013 18:49:47 +0200
Subject: [Buildroot] [RFC] ti-gfx: add new package
In-Reply-To: <1370636307-23089-1-git-send-email-spenser@gillilanding.com>
References: <CALo-6+j77P2RsdYRO9BR04rUX-j0HmxzXtBuHzo_UQ1wDjXbHQ@mail.gmail.com>
 <1370636307-23089-1-git-send-email-spenser@gillilanding.com>
Message-ID: <51B9F82B.8030203@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Spenser,

On 07/06/13 22:18, Spenser Gilliland wrote:
> This is WIP of adding the TI Graphics SDK to buildroot.
>
> TODO:
>     Install startup files for sgx core.
>     Install khronos gles/egl/vg libraries.
>     Create .pc files to simplfy additional packaging.
>     Testing, lots of testing.
>
> ---
>   package/Config.in                              |    1 +
>   package/opengl/libegl/libegl.mk                |    4 +
>   package/opengl/libgles/libgles.mk              |    4 +
>   package/opengl/libopenvg/libopenvg.mk          |    4 +
>   package/ti-gfx/Config.in                       |   54 ++++++++++++++++++
>   package/ti-gfx/ti-gfx-km_install_modules.patch |   14 +++++
>   package/ti-gfx/ti-gfx-newclkapi.patch          |   55 ++++++++++++++++++
>   package/ti-gfx/ti-gfx.mk                       |   71 ++++++++++++++++++++++++
>   8 files changed, 207 insertions(+), 0 deletions(-)
>   create mode 100644 package/ti-gfx/Config.in
>   create mode 100644 package/ti-gfx/ti-gfx-km_install_modules.patch
>   create mode 100644 package/ti-gfx/ti-gfx-newclkapi.patch
>   create mode 100644 package/ti-gfx/ti-gfx.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index ce82e99..8c40b56 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -290,6 +290,7 @@ source "package/snowball-hdmiservice/Config.in"
>   source "package/sredird/Config.in"
>   source "package/statserial/Config.in"
>   source "package/sysstat/Config.in"
> +source "package/ti-gfx/Config.in"

  Don't we usually put this kind of stuff under Libraries / Graphics?

>   source "package/ti-utils/Config.in"
>   source "package/uboot-tools/Config.in"
>   source "package/udev/Config.in"
[snip]
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

  Why is this needed?

> +	select BR2_PACKAGE_HAS_OPENGL_EGL
> +	select BR2_PACKAGE_HAS_OPENGL_ES
> +	depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_glibc
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

  I guess you mean _ES3

> +	help
> +	  Select the SOC for which you would like to install drivers. Please
> +	  use the chart at
> +	  http://processors.wiki.ti.com/index.php/OMAP35x_Graphics_SDK_Getting_Started_Guide
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
  You must say that ti-gfx requires it, because the config option is not 
visible when there's no glibc.

> +	depends on !(BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_glibc)

  We really should refactor this into a single symbol...


> diff --git a/package/ti-gfx/ti-gfx-km_install_modules.patch b/package/ti-gfx/ti-gfx-km_install_modules.patch
> new file mode 100644
> index 0000000..63bfd19
> --- /dev/null
> +++ b/package/ti-gfx/ti-gfx-km_install_modules.patch
> @@ -0,0 +1,14 @@
> +Index: ti-gfx-4_09_00_01/GFX_Linux_KM/Makefile
> +===================================================================
> +--- ti-gfx-4_09_00_01.orig/GFX_Linux_KM/Makefile	2013-03-07 11:00:11.000000000 -0600
> ++++ ti-gfx-4_09_00_01/GFX_Linux_KM/Makefile	2013-05-23 01:36:29.356676281 -0500
> +@@ -479,6 +479,9 @@
> + all:
> + 	$(MAKE) -C $(KERNELDIR) M=`pwd` $*
> +
> ++install:
> ++	$(MAKE) -C $(KERNELDIR) M=`pwd` modules_install
> ++

  Actually, instead of patching the Makefile, you could just run the 
kernel make command directly from buildroot's .mk file. I think there are 
a few module packages that do that.

> + clean:
> + 	@find . -name "*.o" -exec rm -r {} \;
> + 	@find . -name "*.ko" -exec rm -r {} \;
> diff --git a/package/ti-gfx/ti-gfx-newclkapi.patch b/package/ti-gfx/ti-gfx-newclkapi.patch
> new file mode 100644
> index 0000000..b35ac31
> --- /dev/null
> +++ b/package/ti-gfx/ti-gfx-newclkapi.patch
> @@ -0,0 +1,55 @@

  This patch is missing an explanation and a SoB.

> +Index: ti-gfx-4_09_00_01/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c
> +===================================================================
> +--- ti-gfx-4_09_00_01.orig/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c	2013-03-04 08:41:35.000000000 -0600
> ++++ ti-gfx-4_09_00_01/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c	2013-06-05 12:00:08.778605221 -0500
> +@@ -166,11 +166,27 @@
> + 	}
> +
> + 	PVR_DPF((PVR_DBG_MESSAGE, "EnableSGXClocks: Enabling SGX Clocks"));
> +-	
> ++   res=clk_prepare(psSysSpecData->psSGX_FCK);
> ++	if (res < 0)
> ++        {
> ++                PVR_DPF((PVR_DBG_ERROR, "EnableSGXClocks: Couldn't enable SGX functional clock (%d)", res));
> ++                clk_unprepare(psSysSpecData->psSGX_FCK);
> ++                return PVRSRV_ERROR_UNABLE_TO_ENABLE_CLOCK;
> ++        }
> ++
> + 	res=clk_enable(psSysSpecData->psSGX_FCK);
> + 	if (res < 0)
> +         {
> +                 PVR_DPF((PVR_DBG_ERROR, "EnableSGXClocks: Couldn't enable SGX functional clock (%d)", res));
> ++                clk_unprepare(psSysSpecData->psSGX_FCK);
> ++                return PVRSRV_ERROR_UNABLE_TO_ENABLE_CLOCK;
> ++        }
> ++
> ++	res=clk_prepare(psSysSpecData->psSGX_ICK);
> ++	if(res < 0)
> ++        {
> ++                PVR_DPF((PVR_DBG_ERROR, "EnableSGXClocks: Couldn't enable SGX functional clock (%d)", res));
> ++                clk_unprepare(psSysSpecData->psSGX_FCK);
> +                 return PVRSRV_ERROR_UNABLE_TO_ENABLE_CLOCK;
> +         }
> +
> +@@ -178,8 +194,9 @@
> +         if (res < 0)
> +         {
> +                 PVR_DPF((PVR_DBG_ERROR, "EnableSGXClocks: Couldn't enable SGX interface clock (%d)", res));
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
> +TI_GFX_SOURCE = Graphics_SDK_setuplinux_$(TI_GFX_VERSION)_minimal_demos.bin
> +TI_GFX_SITE = http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/$(TI_GFX_VERSION)/exports/
> +TI_GFX_LICENSE = TSPA

  This is not one of the well-known licenses, so should be expanded to 
"Texas Instruments Software Piracy Agreement" or whatever it stands for.

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

  Personally I prefer to do "case statements" like this in the Config.in, 
but it's a minor thing.

> +
> +define TI_GFX_EXTRACT_CMDS
> +	$(RM) -rf $(TI_GFX_DIR)

  We normally don't do that. Is it needed (i.e. does it fail if you don't 
and the source was already extracted before)?

  Also, use $(@D) instead of $(TI_GFX_DIR).

> +	chmod +x $(DL_DIR)/$(TI_GFX_SOURCE)
> +	printf "Y\nY\n qY\n\n" | $(DL_DIR)/$(TI_GFX_SOURCE) \
> +		--prefix $(TI_GFX_DIR) \
> +		--mode console
> +endef
> +
> +define TI_GFX_CONFIGURE_CMDS
> +	echo "no configure required binary only package"

  Just don't define it then.

> +endef
> +
> +TI_GFX_MAKE_CMD = cd $(TI_GFX_SRCDIR)/GFX_Linux_KM && \
> +		$(MAKE) $(LINUX_MAKE_FLAGS) \
> +			BUILD=$(BR2_PACKAGE_TI_GFX_DEBUG) \
> +			TI_PLATFORM=$(TI_GFX_PLATFORM) \
> +			OMAPES=$(TI_GFX_OMAPES) \
> +			SUPPORT_XORG=0 \
> +			KERNELDIR=$(LINUX_DIR)

  We normally only set the make flags, e.g.

TI_GFX_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
	...

and the build commands become

	$(MAKE) -C $(@D) $(TI_GFX_MAKE_OPTS) all

> +
> +define TI_GFX_BUILD_CMDS
> +	( $(TI_GFX_MAKE_CMD) clean && \

  Is the clean really needed? We normally don't.

  Also don't connect commands with && unless they really need to be 
executed in the same sub-shell.

> +	  $(TI_GFX_MAKE_CMD) all )
> +endef
> +
> +define TI_GFX_INSTALL_STAGING_CMDS
> +	

  If you have nothing to install than you shouldn't install to staging :-)

> +endef
> +
> +define TI_GFX_INSTALL_TARGET_CMDS
> +	( $(TI_GFX_MAKE_CMD) install ) || \

  Don't you need to pass TARGET_DIR anywhere?

> +		echo "Your kernel configuration must include FB_DA8XX"

  I think that should be checked by observing the kernel's .config in the 
CONFIGURE_CMDS.

  Ideally, it would be enabled automatically but I don't think we can do 
that at the moment.

> +endef
> +
> +define TI_GFX_CLEAN_CMDS
> +	( $(TI_GFX_MAKE_CMD) clean )
> +endef

  Clean is going to be deprecated so you don't need to add it. But I 
guess you're using it a lot now...

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
