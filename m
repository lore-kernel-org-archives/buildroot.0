From: Spenser Gilliland <spenser@gillilanding.com>
Date: Fri, 28 Jun 2013 13:10:49 -0500
Subject: [Buildroot] [RFC v3 1/1] ti-gfx: add new package
In-Reply-To: <20130628182606.04ccd74b@skate>
References: <1372373766-23735-1-git-send-email-spenser@gillilanding.com>
 <20130628182606.04ccd74b@skate>
Message-ID: <20130628131049.359150dc@bourban>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 28 Jun 2013 18:26:06 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
Thomas,

> > +config BR2_PACKAGE_TI_GFX_DEBUG
> > +	bool "enable debug support"
> > +	help
> > +	  Turn on debugging in kernel module and install libraries
> > built with
> > +	  debugging enabled
> 
> and also various tools.

Will fix.

> > +config BR2_PACKAGE_TI_GFX_DEMOS
> > +	bool "install demos"
> > +	help
> > +	  install the OGLES2ChameleonMan and OGLES2MagicLantern
> > demos +
> > +config BR2_PACKAGE_TI_GFX_HARD_FLOAT
> > +	bool "use hard float binaries"
> > +	help
> > +	  Install hard float binaries (required if using a hard
> > float toolchain)
> 
> I don't think this should be a sub-options of the package. I believe
> we need to add an additional eabihf ABI next to the existing oabi
> (deprecated) and eabi. But that's a larger work. But that's too much
> work to do right now, so maybe a sub-option is a good intermediate
> solution.

Yes, this is something I'd really like to see. Maybe, I can tackle
this at a later date. 

> > diff --git a/package/ti-gfx/esrev.sh b/package/ti-gfx/esrev.sh
> > new file mode 100644
> > index 0000000..4733ea9
> > --- /dev/null
> > +++ b/package/ti-gfx/esrev.sh
> > @@ -0,0 +1,59 @@
> > +#!/bin/sh
> > +
> > +# Debug script to determine proper ES revision for the current
> > board. The +# pvrsrvkm module must be insmoded before attempting to
> > get the es rev.
> 
> Is there a real reason to keep this within the Buildroot sources? The
> Config.in options are pretty clear on which ES revision to choose for
> which SoC, no?

This is included for debugging purposes.  If someone comes to the list
and asks for help this script is a good way to determine if the proper
libraries were installed.

> > diff --git a/package/ti-gfx/ti-gfx-newclkapi.patch
> > b/package/ti-gfx/ti-gfx-newclkapi.patch new file mode 100644
> > index 0000000..eb4c301
> > --- /dev/null
> > +++ b/package/ti-gfx/ti-gfx-newclkapi.patch
> > @@ -0,0 +1,72 @@
> > +This patch adjusts the omap3630 portion of the powervr driver to
> > use the new +clk kernel api.
> > +
> > +Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> > +----
> > +Index:
> > ti-gfx-4_09_00_01/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c
> > +===================================================================
> > +---
> > ti-gfx-4_09_00_01.orig/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c
> > 2013-06-27 14:57:02.687204341 -0500 ++++
> > ti-gfx-4_09_00_01/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c
> > 2013-06-27 15:04:44.103212764 -0500 +@@ -153,6 +153,28 @@
> > + 	psTimingInfo->ui32ActivePowManLatencyms =
> > SYS_SGX_ACTIVE_POWER_LATENCY_MS;
> > + }
> > + 
> > ++#if LINUX_VERSION_CODE < KERNEL_VERSION(3,2,0)
> > ++int clk_prepare_enable(struct clk *clk)
> > ++{
> > ++	return clk_enable(clk);
> > ++}
> > ++#elif LINUX_VERSION_CODE < KERNEL_VERSION(3,3,0)
> > ++int clk_prepare_enable(struct clk *clk)
> > ++{
> > ++	res = clk_prepare(clk);
> > ++	if (ret < 0)
> > ++		return res;
> > ++
> > ++	res = clk_enable(clk);
> > ++	if (res < 0) {
> > ++		clk_unprepare(clk);
> > ++		return res;
> > ++	}
> > ++
> > ++	return 0;
> > ++}
> > ++#endif
> > ++
> > + PVRSRV_ERROR EnableSGXClocks(SYS_DATA *psSysData)
> > + {
> > + #if !defined(NO_HARDWARE)
> > +@@ -167,14 +189,14 @@
> > + 
> > + 	PVR_DPF((PVR_DBG_MESSAGE, "EnableSGXClocks: Enabling SGX
> > Clocks"));
> > + 	
> > +-	res=clk_enable(psSysSpecData->psSGX_FCK);
> > ++	res=clk_prepare_enable(psSysSpecData->psSGX_FCK);
> > + 	if (res < 0)
> > +         {
> > +                 PVR_DPF((PVR_DBG_ERROR, "EnableSGXClocks:
> > Couldn't enable SGX functional clock (%d)", res));
> > +                 return PVRSRV_ERROR_UNABLE_TO_ENABLE_CLOCK;
> > +         }
> > + 
> > +-	res=clk_enable(psSysSpecData->psSGX_ICK);
> > ++	res=clk_prepare_enable(psSysSpecData->psSGX_ICK);
> > +         if (res < 0)
> > +         {
> > +                 PVR_DPF((PVR_DBG_ERROR, "EnableSGXClocks:
> > Couldn't enable SGX interface clock (%d)", res)); +@@ -374,14
> > +396,14 @@
> > + 	rate = clk_get_rate(psSysSpecData->psGPT11_FCK);
> > + 	PVR_TRACE(("GPTIMER11 clock is %dMHz", HZ_TO_MHZ(rate)));
> > + 
> > +-	res = clk_enable(psSysSpecData->psGPT11_FCK);
> > ++	res = clk_prepare_enable(psSysSpecData->psGPT11_FCK);
> > + 	if (res < 0)
> > + 	{
> > + 		PVR_DPF((PVR_DBG_ERROR, "EnableSystemClocks:
> > Couldn't enable GPTIMER11 functional clock (%d)", res));
> > + 		goto ExitError;
> > + 	}
> > + 
> > +-	res = clk_enable(psSysSpecData->psGPT11_ICK);
> > ++	res = clk_prepare_enable(psSysSpecData->psGPT11_ICK);
> > + 	if (res < 0)
> > + 	{
> > + 		PVR_DPF((PVR_DBG_ERROR, "EnableSystemClocks:
> > Couldn't enable GPTIMER11 interface clock (%d)", res));
> 
> You're not handling clk_disable/clk_unprepare.

Will fix.

> > diff --git a/package/ti-gfx/ti-gfx.mk b/package/ti-gfx/ti-gfx.mk
> > new file mode 100644
> > index 0000000..b7b8d94
> > --- /dev/null
> > +++ b/package/ti-gfx/ti-gfx.mk
> > @@ -0,0 +1,163 @@
> > +###############################################################################
> > +#
> > +# ti-gfx 
> > +#
> > +###############################################################################
> > +
> > +TI_GFX_VERSION = 4_09_00_01
> > +TI_GFX_IMGPV = 1.9.2188537
> 
> This one would probably need a comment, and maybe a better name, like
> TI_GFX_SO_VERSION or something like that.
> 
> > +ifeq ($(BR2_PACKAGE_TI_GFX_HARD_FLOAT),y)
> > +TI_GFX_SOURCE =
> > Graphics_SDK_setuplinux_$(TI_GFX_VERSION)_hardfp_minimal_demos.bin
> > +else +TI_GFX_SOURCE =
> > Graphics_SDK_setuplinux_$(TI_GFX_VERSION)_minimal_demos.bin +endif
> > +
> > +TI_GFX_SITE =
> > http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/$(TI_GFX_VERSION)/exports/
> > +TI_GFX_LICENSE = Technology / Software Publicly Available
> > +TI_GFX_LICENSE_FILES = TSPA.txt +TI_GFX_INSTALL_STAGING = YES
> > +
> > +TI_GFX_DEPENDENCIES = linux
> > +
> > +ifeq ($(BR2_PACKAGE_TI_GFX_ES3),y)
> > +TI_GFX_OMAPES = 3.x
> > +TI_GFX_PLATFORM = omap3
> > +endif
> > +ifeq ($(BR2_PACKAGE_TI_GFX_ES5),y)
> > +TI_GFX_OMAPES = 5.x
> > +TI_GFX_PLATFORM = omap3630 
> > +endif
> > +ifeq ($(BR2_PACKAGE_TI_GFX_ES6),y)
> > +TI_GFX_OMPAES = 6.x
> > +TI_GFX_PLATFORM = ti81xx 
> > +endif
> > +ifeq ($(BR2_PACKAGE_TI_GFX_ES8),y)
> > +TI_GFX_OMAPES = 8.x
> > +TI_GFX_PLATFORM = ti335x
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_TI_GFX_DEBUG),y)
> > +TI_GFX_DEBUG_LIB = dbg
> > +TI_GFX_DEBUG_KM = debug
> > +else
> > +TI_GFX_DEBUG_LIB = rel
> > +TI_GFX_DEBUG_KM = release
> > +endif
> > +
> > +TI_GFX_BIN_PATH = gfx_$(TI_GFX_DEBUG_LIB)_es$(TI_GFX_OMAPES)
> > +
> > +TI_GFX_KM_MAKE_OPTS = \
> > +	$(LINUX_MAKE_FLAGS) \
> > +	BUILD=$(TI_GFX_DEBUG_KM) \
> > +	TI_PLATFORM=$(TI_GFX_PLATFORM) \
> > +	OMAPES=$(TI_GFX_OMAPES) \
> > +	SUPPORT_XORG=0 \
> > +	KERNELDIR=$(LINUX_DIR)
> > +
> > +TI_GFX_DEMO_MAKE_OPTS = \
> > +	PLATFORM=LinuxARMV7 \
> > +	Common=1 \
> > +	X11BUILD=0
> > +
> > +# The only required binary is pvrsrvctl all others are optional
> > +TI_GFX_BIN = pvrsrvctl
> > +
> > +ifeq ($(BR2_PACKAGE_TI_GFX_DEBUG),y)
> > +TI_GFX_BIN += \
> > +	eglinfo ews_server ews_server_es2 ews_test_gles1
> > ews_test_gles2 \
> > +	ews_test_swrender gles1test1 gles2test1 pvr2d_test
> > services_test \
> > +	sgx_blit_test sgx_clipblit_test sgx_flip_test
> > sgx_init_test \
> > +	sgx_render_flip_test
> > +endif
> > +
> > +TI_GFX_LIB = \
> > +	libEGL.so libews.so libGLES_CM.so libGLESv2.so
> > libglslcompiler.so \
> > +	libIMGegl.so libpvr2d.so libpvrEWS_WSEGL.so
> > libpvrPVR2D_BLITWSEGL.so \
> > +	libpvrPVR2D_FLIPWSEGL.so libpvrPVR2D_FRONTWSEGL.so \
> > +	libpvrPVR2D_LINUXFBWSEGL.so libpvrPVRScopeServices.so \
> > +	libsrv_init.so libsrv_um.so libusc.so
> > +
> > +TI_GFX_DEMOS = ChameleonMan MagicLantern
> > +TI_GFX_DEMOS_LOC = GFX_Linux_SDK/OGLES2/SDKPackage/Demos
> > +TI_GFX_DEMOS_MAKE_LOC = OGLES2/Build/LinuxGeneric
> > +TI_GFX_DEMOS_BIN_LOC = OGLES2/Build/LinuxARMV7/ReleaseRaw/
> > +
> > +define TI_GFX_EXTRACT_CMDS 
> > +	$(RM) -rf $(TI_GFX_DIR)
> > +	chmod +x $(DL_DIR)/$(TI_GFX_SOURCE)
> > +	printf "Y\nY\n qY\n\n" | $(DL_DIR)/$(TI_GFX_SOURCE) \
> > +		--prefix $(@D) \
> > +		--mode console
> > +endef
> > +
> > +define TI_GFX_BUILD_KM_CMDS
> > +	$(MAKE) $(TI_GFX_KM_MAKE_OPTS) -C $(@D)/GFX_Linux_KM all
> > +endef
> 
> Any reason not to build everything, i.e "make all" at the root? This
> automatically builds the demos and so on.

The demos take a while to build.  It greatly reduces build time
if we build them only if needed.

> > +define TI_GFX_BUILD_DEMO_CMDS
> > +	$(foreach demo, $(TI_GFX_DEMOS), \
> > +		cd
> > $(@D)/$(TI_GFX_DEMOS_LOC)/$(demo)/$(TI_GFX_DEMOS_MAKE_LOC); \
> > +		$(TARGET_MAKE_ENV) $(MAKE)
> > $(TI_GFX_DEMO_MAKE_OPTS);) +endef
> 
> So you could get rid of this, I believe.
> 
> > +define TI_GFX_BUILD_CMDS
> > +	$(call TI_GFX_BUILD_KM_CMDS)
> > +	$(if $(BR2_PACKAGE_TI_GFX_DEMOS),$(call
> > TI_GFX_BUILD_DEMO_CMDS)) +endef
> 
> And simplify this one.
> 
> BTW, there's no need to do a $(call ...) here. Just use the variable.

Yes, will fix. Make is still not my native language.

> > +define TI_GFX_INSTALL_STAGING_CMDS
> > +	for incdir in EGL EWS GLES2 KHR; do \
> > +		$(INSTALL) -d $(STAGING_DIR)/usr/include/$$incdir;
> > \
> > +		$(INSTALL) -D -m 0644
> > $(@D)/include/OGLES2/$$incdir/*.h \
> > +			$(STAGING_DIR)/usr/include/$$incdir; \
> > +	done
> > +	$(INSTALL) -D -m 0755 $(@D)/$(TI_GFX_BIN_PATH)/*.so
> > $(STAGING_DIR)/usr/lib
> 
> Why not use TI_GFX_LIB here, for consistency?

Will fix.

> > +endef
> > +
> > +define TI_GFX_INSTALL_KM_CMDS
> > +	$(MAKE) $(TI_GFX_KM_MAKE_OPTS) -C $(@D)/GFX_Linux_KM
> > install +endef
> > +
> > +define TI_GFX_INSTALL_BINS_CMDS
> > +	$(foreach bin,$(TI_GFX_BIN),
> > +		$(INSTALL) -D -m 0755
> > $(@D)/$(TI_GFX_BIN_PATH)/$(bin) \
> > +			$(TARGET_DIR)/usr/bin/$(bin))
> > +endef
> > +
> > +define TI_GFX_INSTALL_LIBS_CMDS
> > +	# create symlinks and install libraries.  these libraries
> > do not have a 
> > +	# SONAME defined; therefore, they will not be
> > automatically renamed and 
> > +	# must be renamed manually.
> 
> Even if they had a SONAME, why would they be automatically renamed?

I've heard that there is an step in the buildroot rfs handling code
that does something along these lines and will automatically add
proper symlinks if the file has an objdump <lib> -p | grep
SONAME.  However, these libaries do not have an SONAME; therefore, they
are not able to be renamed automatically.

> 
> > +	$(foreach lib,$(TI_GFX_LIBS),
> > +		$(INSTALL) -D -m 0755
> > $(@D)/$(TI_GFX_BIN_PATH)/$(lib) \
> > +
> > $(TARGET_DIR)/usr/lib/$(lib).$(TI_GFX_IMGPV); \
> > +		ln -sf $(lib).$(TI_GFX_IMGPV) \
> > +			$(TARGET_DIR)/usr/lib/$(lib)$$(echo
> > $(TI_GFX_IMGPV) \
> > +				| awk -F. '{print "." $$1} ); \
> > +		ln -sf $(lib).$(TI_GFX_IMGPV) \
> > +			$(TARGET_DIR)/usr/lib/$(lib)$$(echo
> > $(TI_GFX_IMGPV) \
> > +				| awk -F. '{print "." $$1 "." $$2}
> > );)
> 
> I am not sure we need two symbolic links per library, just one would
> be enough, so something like:
> 
> 	$(foreach lib,$(TI_GFX_LIBS),
> 		$(INSTALL) -D -m 0755 $(@D)/$(TI_GFX_BIN_PAT)/$(lib) \
> 			$(TARGET_DIR)/usr/lib/$(lib).$(TI_GFX_IMGPV) ;
> \ ln -sf $(lib).$(TI_GFX_IMGPV) \
> 			$(TARGET_DIR)/usr/lib/$(lib))
> 
> and that's it.

Will fix.

> > +	# libs use the following file for configuration.
> > +	$(install) -D -m 0644 package/ti-gfx/powervr.ini
> > $(TARGET_DIR)/etc/powervr.ini
> 
> 	$(INSTALL)
> 
> > +endef
> > +
> > +define TI_GFX_INSTALL_DEMOS_CMDS
> > +	$(foreach demo,$(TI_GFX_DEMOS),
> > +		$(INSTALL) -D -m 0755 \
> > +
> > $(@D)/$(TI_GFX_DEMOS_LOC)/$$demo/$(TI_GFX_DEMOS_BIN_LOC)/OGLES2$${demo}
> > \
> > +		$(TARGET_DIR)/usr/bin/OGLES2$${demo};)
> 
> Aren't the .pod files needed for execution? I don't know, I haven't
> tested to run the demos without them.

The demos run without these .pod files without any errors.

> > +endef
> > +
> > +define TI_GFX_INSTALL_INIT_SYSV
> > +	$(INSTALL) -D -m 0755
> > package/ti-gfx/ti-gfx.sysv /etc/init.d/S80ti-gfx +endef
> 
> You should use <pkg>_INSTALL_INIT_SYSV.

What are you referring to with this comment?

Also before, anyone comments on this section yes, I've fixed the
glaringly obvious bug above related to the absolute path.

> > +define TI_GFX_INSTALL_TARGET_CMDS
> > +	$(call TI_GFX_INSTALL_KM_CMDS)
> > +	$(call TI_GFX_INSTALL_BINS_CMDS)
> > +	$(call TI_GFX_INSTALL_LIBS_CMDS)
> > +	$(if $(BR2_PACKAGE_TI_GFX_DEMOS),$(call
> > TI_GFX_INSTALL_DEMOS_CMDS))
> 
> No need to use $(call ...), just use the variable directly.

Will fix.

> > +endef
> > +
> > +$(eval $(generic-package))
> > diff --git a/package/ti-gfx/ti-gfx.sysv b/package/ti-gfx/ti-gfx.sysv
> 
> Should be named S80ti-gfx. We generally name the scripts in
> package/<foo>/ with the filename they will have on the target, so that
> if you're looking for the source of a script, you can do a "find .
> -name 'S80ti-gfx'" and find it in the Buildroot sources.

Will fix.

> > new file mode 100644
> > index 0000000..372750f
> > --- /dev/null
> > +++ b/package/ti-gfx/ti-gfx.sysv
> > @@ -0,0 +1,45 @@
> > +#!/bin/sh
> > +
> > +BITSPERPIXEL="$(fbset | grep geom | awk '{print $6}')"
> > +YRES="$(fbset | grep geom | awk '{print $3}')"
> > +
> > +if [ "$1" = "" ]; then
> > +	echo PVR-INIT: Please use start, stop, or restart.
> > +	exit 1
> > +fi
> > +
> > +if [ "$1" = "stop" -o  "$1" = "restart" ]; then
> > +	echo Stopping PVR
> > +	rmmod bufferclass_ti
> > +	rmmod omaplfb
> > +	rmmod pvrsrvkm
> > +fi
> > +
> > +if [ "$1" = "stop" ]; then
> > +	exit 0
> > +fi
> > +
> > +# Set RGBA ordering to something the drivers like
> > +if [ "$BITSPERPIXEL" = "32" ] ; then
> > +	fbset -rgba 8/16,8/8,8/0,8/24
> > +fi
> > +
> > +# Try to enable triple buffering when there's enough VRAM
> > +fbset -vyres $(expr $YRES \* 3)
> > +
> > +modprobe omaplfb
> > +modprobe bufferclass_ti
> > +
> > +pvr_maj=`grep "pvrsrvkm$" /proc/devices | cut -b1,2,3`
> > +bc_maj=`grep "bc" /proc/devices | cut -b1,2,3`
> > +
> > +if [ -e /dev/pvrsrvkm ] ; then
> > +	rm -f /dev/pvrsrvkm
> > +fi
> > +
> > +mknod /dev/pvrsrvkm c $pvr_maj 0
> > +chmod 666 /dev/pvrsrvkm
> > +
> > +if ! /usr/bin/pvrsrvctl --start --no-module; then
> > +	echo "powervr: unable to start server"
> > +fi
> 
> Why not make this look more usual, with a case for start, stop,
> restart and so on?

Will fix.

> I think we're almost good. I believe the next revision you can remove
> the "RFC" tag and use "PATCH" instead. We want to get this merged now.
> 
> Thanks for the good work!

I should have everything fixed later today.  Expect a patch
soon.  Thanks for the vote of confidence.

Spenser
