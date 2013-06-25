From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jun 2013 22:31:25 +0200
Subject: [Buildroot] [RFC v2 1/1] ti-gfx: add new package
In-Reply-To: <1372177754-13431-1-git-send-email-spenser@gillilanding.com>
References: <1372177754-13431-1-git-send-email-spenser@gillilanding.com>
Message-ID: <20130625223125.7b8e3721@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Tue, 25 Jun 2013 11:29:14 -0500, Spenser Gilliland wrote:
> This is WIP of adding the TI Graphics SDK to Buildroot

Nice, thanks for your work on this. Having support for OpenGL on OMAP3,
OMAP4 and AM335x is definitely one of the most important part of the
GSoC.

> Current Status:
>    Kernel Drivers load without errror.
>    pvrsrvctl starts with no errors.
>    Some demos run, others do not.
>    gstreamer videotestsrc ! eglglessink does not work.
> 
> TODO:
>    Install startup files for sgx core. 
>    Create .pc files to simplify additional packaging.
>    Hard Float Binaries
>    Testing, lots of testing.

Ok.

> Additional Info:
>    I've been using the 3.9.6-x3 tag of the kernel at 
>    https://github.com/RobertCNelson/stable-kernel by use of the
>    LINUX_OVERRIDE_SRCDIR option.

Are there some reports of the ti-gfx stuff working on such recent
kernels? Have you looked at the Yocto meta-ti layer at
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/ ? If I look there,
they apparently don't have anything more recent than 3.0 or 3.1.

Also, are you still trying on the Beagle-XM, or have you switched to
the BeagleBone Black?

> 
>    You must use a soft-float toolchain (ie Code Sourcery) as the binaries
>    provided by the Graphics SDK are soft-float. (hard float is on the TODO
>    list)

Note that I've recently added the Arago toolchain as an external
toolchain in Buildroot. I don't remember if it's a -mfloat-abi=hard or
-mfloat-abi=softfp toolchain, though.

> +	select BR2_LINUX_KERNEL

We typically never "select" the kernel, but instead depend on it, and
have a comment if the kernel is not enabled. This is because we can't
enable the kernel in the back of the user: the user has to be aware
that (s)he should go in the kernel menu, and configure the
version/configuration.

> +choice
> +	prompt "Target"
> +	default BR2_PACKAGE_TI_GFX_ES3
> +	help
> +	  Select the SOC for which you would like to install drivers. Please 
> +	  use the chart at
> +	  http://processors.wiki.ti.com/index.php/OMAP35x_Graphics_SDK_Getting_Started_Guide
> +
> +config BR2_PACKAGE_TI_GFX_ES3
> +	bool "es3.x"

That's a detail, but maybe it would be worth doing:

	bool "es3.x (OMAP35xx, AM35xx)"

so that the user doesn't have to go in the help text of each option to
find the right value to use.

> +comment "requires an external eglibc/glibc based toolchain"
> +	depends on !(BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_glibc)

the toolchain is not necessarily external, it may be using the
crosstool-ng backend. So just "requires an eglibc/glibc based
toolchain" is enough.

> diff --git a/package/ti-gfx/ti-gfx-km_install_modules.patch b/package/ti-gfx/ti-gfx-km_install_modules.patch
> new file mode 100644
> index 0000000..63bfd19
> --- /dev/null
> +++ b/package/ti-gfx/ti-gfx-km_install_modules.patch

Missing description + SoB.

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

You could directly do this modules_install from the Buildroot .mk file,
but ok, why not.

> --- /dev/null
> +++ b/package/ti-gfx/ti-gfx-newclkapi.patch
> @@ -0,0 +1,62 @@

Missing description + SoB.

> +Index: ti-gfx-4_09_00_01/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c
> +===================================================================
> +--- ti-gfx-4_09_00_01.orig/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c	2013-06-18 11:03:06.606245728 -0500
> ++++ ti-gfx-4_09_00_01/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c	2013-06-18 11:11:17.908972042 -0500
> +@@ -166,11 +166,30 @@
> + 	}
> + 
> + 	PVR_DPF((PVR_DBG_MESSAGE, "EnableSGXClocks: Enabling SGX Clocks"));
> +-	
> ++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0)
> ++	res=clk_prepare(psSysSpecData->psSGX_FCK);
> ++	if (res < 0)
> ++        {
> ++                PVR_DPF((PVR_DBG_ERROR, "EnableSGXClocks: Couldn't enable SGX functional clock (%d)", res));
> ++                clk_unprepare(psSysSpecData->psSGX_FCK);
> ++                return PVRSRV_ERROR_UNABLE_TO_ENABLE_CLOCK;
> ++        }
> ++#endif 
> + 	res=clk_enable(psSysSpecData->psSGX_FCK);


One option would have been to replace clk_enable() by
clk_prepare_enable(), that does both the prepare and enable. But that
call has been introduced in 3.3 only, so for 3.2, you would still need
to call clk_prepare().

Or maybe you can do something like:

#if LINUX_VERSION_CODE < KERNEL_VERSION(3,2,0)
int clk_prepare_enable(struct clk *clk)
{
	return clk_enable(clk);
}
#elif LINUX_VERSION_CODE < KERNEL_VERSION(3,3,0)
int clk_prepare_enable(struct clk *clk)
{
	res = clk_prepare(clk);
	if (ret < 0)
		return res;

	res = clk_enable(clk);
	if (res < 0) {
		clk_unprepare(clk);
		return res;
	}

	return 0;
}
#endif

this way, you can simply the rest of the patch by just doing
s/clk_enable/clk_prepare_enable/. Ditto for disable/unprepare, of
course.

> +@@ -247,8 +271,9 @@
> + 	PVR_DPF((PVR_DBG_MESSAGE, "DisableSGXClocks: Disabling SGX Clocks"));
> + 	
> + 	clk_disable(psSysSpecData->psSGX_FCK);
> +-
> ++	clk_unprepare(psSysSpecData->psSGX_FCK);
> + 	clk_disable(psSysSpecData->psSGX_ICK);
> ++	clk_unprepare(psSysSpecData->psSGX_ICK);

Missing kernel version conditionals here.

> +TI_GFX_BIN_PATH = gfx_$(TI_GFX_DEBUG_LIB)_es$(TI_GFX_OMAPES)
> +
> +define TI_GFX_EXTRACT_CMDS 
> +	$(RM) -rf $(TI_GFX_DIR)
> +	chmod +x $(DL_DIR)/$(TI_GFX_SOURCE)
> +	printf "Y\nY\n qY\n\n" | $(DL_DIR)/$(TI_GFX_SOURCE) \
> +		--prefix $(@D) \
> +		--mode console
> +endef
> +
> +TI_GFX_MAKE_CMD = cd $(@D)/GFX_Linux_KM && \
> +		$(MAKE) $(LINUX_MAKE_FLAGS) \
> +			BUILD=$(TI_GFX_DEBUG_KM) \
> +			TI_PLATFORM=$(TI_GFX_PLATFORM) \
> +			OMAPES=$(TI_GFX_OMAPES) \
> +			SUPPORT_XORG=0 \
> +			KERNELDIR=$(LINUX_DIR)

This is a rather unusual way of doing this. We prefer something like:

TI_GFX_MAKE_OPTS = \
	$(LINUX_MAKE_FLAGS) \
	BUILD=$(TI_GFX_DEBUG_KM) \
	TI_PLATFORM=$(TI_GFX_PLATFORM) \
	OMAPES=$(TI_GFX_OMAPES) \
	SUPPORT_XORG=0 \
	KERNELDIR=$(LINUX_DIR)

And then do:

define TI_GFX_BUILD_CMDS
	$(MAKE) $(TI_GFX_MAKE_OPTS) -C $(@D)/GFX_Linux_KM
endef

Also, I'm surprised you're not passing $(TARGET_CONFIGURE_OPTS) to
ensure the right compiler is used, etc.

> +define TI_GFX_BUILD_CMDS
> +	( $(TI_GFX_MAKE_CMD) all )
> +endef

Parenthesis are not needed.

> +define TI_GFX_INSTALL_STAGING_CMDS
> +	for incdir in EGL EWS GLES2 KHR; do \
> +		$(INSTALL) -d $(STAGING_DIR)/usr/include/$$incdir; \
> +		$(INSTALL) -D -m 0644 $(@D)/include/OGLES2/$$incdir/*.h $(STAGING_DIR)/usr/include/$$incdir; \
> +	done
> +	$(INSTALL) -D -m 0755 $(@D)/$(TI_GFX_BIN_PATH)/*.so $(STAGING_DIR)/usr/lib
> +endef
> +
> +TI_GFX_TARGET_BIN = \
> +	pvrsrvctl \
> +
> +ifeq ($(BR2_PACKAGE_TI_GFX_DEBUG),y)
> +TI_GFX_TARGET_BIN += \
> +	eglinfo \
> +	ews_server \
> +	ews_server_es2 \
> +	ews_test_gles1 \
> +	ews_test_gles2 \
> +	ews_test_swrender \
> +	gles1test1 \
> +	gles2test1 \
> +	pvr2d_test \
> +	services_test \
> +	sgx_blit_test \
> +	sgx_clipblit_test \
> +	sgx_flip_test \
> +	sgx_init_test \
> +	sgx_render_flip_test
> +endif
> +
> +TI_GFX_IMGPV = "1.9.2188537"
> +
> +define TI_GFX_INSTALL_TARGET_CMDS
> +	( $(TI_GFX_MAKE_CMD) install ) || \
> +		echo "Your kernel configuration must include FB_DA8XX"
> +	for file in $(TI_GFX_TARGET_BIN); do \
> +		$(INSTALL) -D -m 0755 $(@D)/$(TI_GFX_BIN_PATH)/$$file  $(TARGET_DIR)/usr/bin/$$file; \
> +	done
> +	for sofile in $$(find $(@D)/$(TI_GFX_BIN_PATH) -name "lib*Open*.so") $$(find $(@D)/$(TI_GFX_BIN_PATH) -name "lib*srv*.so") $$(find $(@D)/$(TI_GFX_BIN_PATH) -name "lib*gl*.so") $$(find $(@D)/$(TI_GFX_BIN_PATH) -name "libpvr*.so") $$(find $(@D)/$(TI_GFX_BIN_PATH) -name "lib*GL*.so") $$(find $(@D)/$(TI_GFX_BIN_PATH) -name "libusc.so"); do \

I guess this could maybe be refactored, but we can see that later once
the whole thing works.

> +		if [ "$$(readlink -n $${sofile})" = "" ] ; then \
> +			sobase=$$(basename $${sofile}); \
> +			$(INSTALL) -D -m 0755 $$sofile $(TARGET_DIR)/usr/lib/$${sobase}.$(TI_GFX_IMGPV); \
> +			ln -sf $${sobase}.$(TI_GFX_IMGPV) $(TARGET_DIR)/usr/lib/$${sobase}; \
> +			ln -sf $${sobase}.$(TI_GFX_IMGPV) $(TARGET_DIR)/usr/lib/$${sobase}$$(echo $(TI_GFX_IMGPV) | awk -F. '{print "." $$1}'); \
> +			ln -sf $${sobase}.$(TI_GFX_IMGPV) $(TARGET_DIR)/usr/lib/$${sobase}$$(echo $(TI_GFX_IMGPV) | awk -F. '{print "." $$1 "." $$2}'); \
> +		fi; \
> +	done
> +endef
> +
> +define TI_GFX_CLEAN_CMDS
> +	( $(TI_GFX_MAKE_CMD) clean )
> +endef

Parenthesis unneeded.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
