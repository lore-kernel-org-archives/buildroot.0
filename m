From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Jul 2013 22:30:46 +0200
Subject: [Buildroot] [PATCH v2 1/1] ti-gfx: add new package
In-Reply-To: <1373055305-8349-1-git-send-email-spenser@gillilanding.com>
References: <1373055305-8349-1-git-send-email-spenser@gillilanding.com>
Message-ID: <20130705223046.4eb04b31@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Fri,  5 Jul 2013 15:15:05 -0500, Spenser Gilliland wrote:
> v2:
>  - Take into account reviews.
>  - Simplfy init script.
>  - Fix header installation.
> v1:
>   - Added .pc files
>   - all review issues addressed
> RFC v3:
>  - all reviews addressed
>  - added demos
>  - added hard float (not runtime tested)
>  - added init script
>  - added SGX detection script (untested)
>  - tested on beaglexm using demos
> RFC v2:
>  - basic working with minor issues during
>    tests
> RFC v1:
>  - inital revision

As explained before, this should go here, but below the "---" sign, so
that it doesn't get integrated in the Buildroot history.

You could however slightly expand the commit log by mentioning which
SoCs are supported by ti-gfx, but that's less important.

> 
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> ---
>  package/Config.in                              |   1 +
>  package/opengl/libegl/libegl.mk                |   4 +
>  package/opengl/libgles/libgles.mk              |   4 +
>  package/opengl/libopenvg/libopenvg.mk          |   4 +
>  package/ti-gfx/Config.in                       |  64 +++++++++
>  package/ti-gfx/S80ti-gfx                       |  42 ++++++
>  package/ti-gfx/egl.pc                          |  10 ++
>  package/ti-gfx/esrev.sh                        |  59 ++++++++
>  package/ti-gfx/glesv2.pc                       |  10 ++
>  package/ti-gfx/powervr.ini                     |   2 +
>  package/ti-gfx/ti-gfx-km_install_modules.patch |  19 +++
>  package/ti-gfx/ti-gfx-newclkapi.patch          | 143 ++++++++++++++++++++
>  package/ti-gfx/ti-gfx.mk                       | 178 +++++++++++++++++++++++++
>  13 files changed, 540 insertions(+)
>  create mode 100644 package/ti-gfx/Config.in
>  create mode 100644 package/ti-gfx/S80ti-gfx
>  create mode 100644 package/ti-gfx/egl.pc
>  create mode 100644 package/ti-gfx/esrev.sh
>  create mode 100644 package/ti-gfx/glesv2.pc
>  create mode 100644 package/ti-gfx/powervr.ini
>  create mode 100644 package/ti-gfx/ti-gfx-km_install_modules.patch
>  create mode 100644 package/ti-gfx/ti-gfx-newclkapi.patch
>  create mode 100644 package/ti-gfx/ti-gfx.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index ebeabeb..4df48ba 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -293,6 +293,7 @@ source "package/snowball-hdmiservice/Config.in"
>  source "package/sredird/Config.in"
>  source "package/statserial/Config.in"
>  source "package/sysstat/Config.in"
> +source "package/ti-gfx/Config.in"
>  source "package/ti-utils/Config.in"
>  source "package/uboot-tools/Config.in"
>  source "package/udev/Config.in"
> diff --git a/package/opengl/libegl/libegl.mk b/package/opengl/libegl/libegl.mk
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
> diff --git a/package/opengl/libgles/libgles.mk b/package/opengl/libgles/libgles.mk
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
> diff --git a/package/opengl/libopenvg/libopenvg.mk b/package/opengl/libopenvg/libopenvg.mk
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

Are you sure ti-gfx provides an OpenVG implementation? I have looked
very quickly, but I don't see a library whose name looks like OpenVG
something.

> diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
> new file mode 100644
> index 0000000..a92156a
> --- /dev/null
> +++ b/package/ti-gfx/Config.in
> @@ -0,0 +1,64 @@
> +config BR2_PACKAGE_TI_GFX
> +	bool "ti-gfx"
> +	select BR2_PACKAGE_HAS_OPENGL_EGL
> +	select BR2_PACKAGE_HAS_OPENGL_ES
> +	depends on BR2_LINUX_KERNEL && (BR2_TOOLCHAIN_EXTERNAL_GLIBC || \
> +		BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_glibc) && BR2_arm

You can replace the glibc conditions by just 'depends on
BR2_TOOLCHAIN_USES_GLIBC', which has been introduced recently.

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
> +	  Turns on debugging in the kernel module, install libraries built with
> +	  debugging enabled, installs various tests and installs esrev script.
> +
> +config BR2_PACKAGE_TI_GFX_DEMOS
> +	bool "install demos"
> +	help
> +	  install the OGLES2ChameleonMan and OGLES2MagicLantern demos

s/install/Install/ for consistency reasons.

> +comment "requires an eglibc/glibc based toolchain and the linux kernel"
> +	depends on !(BR2_LINUX_KERNEL && (BR2_TOOLCHAIN_EXTERNAL_GLIBC || \
> +		BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_glibc))

BR2_TOOLCHAIN_USES_GLIBC

> diff --git a/package/ti-gfx/ti-gfx-newclkapi.patch b/package/ti-gfx/ti-gfx-newclkapi.patch
> new file mode 100644
> index 0000000..8f50c7e
> --- /dev/null
> +++ b/package/ti-gfx/ti-gfx-newclkapi.patch
> @@ -0,0 +1,143 @@
> +This patch adjusts the omap3630 portion of the powervr driver to use the new
> +clk kernel api.
> +
> +Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> +----
> +Index: ti-gfx-4_09_00_01/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c
> +===================================================================
> +--- ti-gfx-4_09_00_01.orig/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c	2013-06-28 13:44:06.352701522 -0500
> ++++ ti-gfx-4_09_00_01/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c	2013-06-28 13:45:12.364702727 -0500
> +@@ -153,6 +153,49 @@
> + 	psTimingInfo->ui32ActivePowManLatencyms = SYS_SGX_ACTIVE_POWER_LATENCY_MS;
> + }
> + 
> ++#if LINUX_VERSION_CODE < KERNEL_VERSION(3,2,0)
> ++int clk_disable_unprepare(struct clk *clk)
> ++{
> ++	return clk_disable(clk);
> ++}
> ++#elif LINUX_VERSION_CODE < KERNEL_VERSION(3,3,0)
> ++int clk_disable_unprepare(struct clk *clk)
> ++{
> ++	res = clk_disable(clk);
> ++	if (res < 0)
> ++		return res;
> ++
> ++	res = clk_unprepare(clk);
> ++	if (ret < 0)
> ++		return res;
> ++
> ++	return 0;
> ++}
> ++#endif
> ++
> ++
> ++#if LINUX_VERSION_CODE < KERNEL_VERSION(3,2,0)
> ++int clk_prepare_enable(struct clk *clk)
> ++{
> ++	return clk_enable(clk);
> ++}
> ++#elif LINUX_VERSION_CODE < KERNEL_VERSION(3,3,0)
> ++int clk_prepare_enable(struct clk *clk)
> ++{
> ++	res = clk_prepare(clk);
> ++	if (ret < 0)
> ++		return res;
> ++
> ++	res = clk_enable(clk);
> ++	if (res < 0) {
> ++		clk_unprepare(clk);
> ++		return res;
> ++	}
> ++
> ++	return 0;
> ++}
> ++#endif

Could have used a single #if block to implement clk_disable_unprepare()
and clk_prepare_enable(), but ok.

> +define TI_GFX_INSTALL_DEMOS_CMDS
> +	$(foreach demo,$(TI_GFX_DEMOS),
> +		$(INSTALL) -D -m 0755 \
> +		$(@D)/$(TI_GFX_DEMOS_LOC)/$(demo)/$(TI_GFX_DEMOS_BIN_LOC)/OGLES2$(demo) \
> +		$(TARGET_DIR)/usr/bin/OGLES2$(demo)
> +	)
> +endef
> +
> +define TI_GFX_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 0755 package/ti-gfx/S80ti-gfx \
> +		$(TARGET_DIR)/etc/init.d/S80ti-gfx
> +endef
> +
> +define TI_GFX_INSTALL_TARGET_CMDS
> +	$(TI_GFX_INSTALL_KM_CMDS)
> +	$(TI_GFX_INSTALL_BINS_CMDS)
> +	$(TI_GFX_INSTALL_LIBS_CMDS)
> +	$(if $(BR2_PACKAGE_TI_GFX_DEMOS),
> +		$(TI_GFX_INSTALL_DEMOS_CMDS)
> +	)

We generally prefer to enclose the definition of
TI_GFX_INSTALL_DEMOS_CMDS inside the BR2_PACKAGE_TI_GFX_DEMOS, but ok,
that's a minor it.

Could you quickly resend a v3 which at least fixes the commit log?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
