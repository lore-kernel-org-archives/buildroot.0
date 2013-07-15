From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 15 Jul 2013 22:18:24 +0200
Subject: [Buildroot] [PATCH v5 2/3] ti-gfx: add new package
In-Reply-To: <1373639678-7357-2-git-send-email-spenser@gillilanding.com>
 (Spenser Gilliland's message of "Fri, 12 Jul 2013 09:34:37 -0500")
References: <1373639678-7357-1-git-send-email-spenser@gillilanding.com>
 <1373639678-7357-2-git-send-email-spenser@gillilanding.com>
Message-ID: <87ppuja86n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "S" == Spenser Gilliland <spenser@gillilanding.com> writes:

 S> adds accelerated GPU support for the OMAP35xx, AM35xx, AM37xx, DM37xx,
 S> AM387x, C6A814x, AM389x, C6A816x, and AM335x platforms.

Nit: I think the C6Ax devices are more commonly referred to as DMx.


 S> +++ b/package/ti-gfx/Config.in
 S> @@ -0,0 +1,69 @@
 S> +config BR2_PACKAGE_TI_GFX
 S> +	bool "ti-gfx"
 S> +	select BR2_PACKAGE_HAS_OPENGL_EGL
 S> +	select BR2_PACKAGE_HAS_OPENGL_ES
 S> +	select BR2_PACKAGE_HAS_POWERVR
 S> +	depends on BR2_LINUX_KERNEL && BR2_TOOLCHAIN_USES_GLIBC && BR2_arm
 S> +	help
 S> +	  Graphics libraries for TI boards.
 S> +
 S> +	  http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk/
 S> +
 S> +if BR2_PACKAGE_TI_GFX
 S> +
 S> +config BR2_PACKAGE_TI_GFX_DEBUG
 S> +	bool "enable debug support"
 S> +	help
 S> +	  Turns on debugging in the kernel module, install libraries built with
 S> +	  debugging enabled, installs various tests and installs esrev script.
 S> +
 S> +config BR2_PACKAGE_TI_GFX_DEMOS
 S> +	bool "install demos"
 S> +	default y
 S> +	help
 S> +	  Install the OGLES2ChameleonMan and OGLES2MagicLantern demos
 S> +
 S> +config BR2_PACKAGE_TI_GFX_EGLIMAGE
 S> +	bool "install eglimage version of libraries"
 S> +	help
 S> +	  Installs OpenGL libaries which support the eglimage api.
 S> +
 S> +config BR2_PACKAGE_TI_GFX_HARD_FLOAT
 S> +	bool "use hard float binaries"
 S> +	help
 S> +	  Install hard float binaries (required if using a hard float toolchain)
 S> +
 S> +choice
 S> +	prompt "Target"
 S> +	default BR2_PACKAGE_TI_GFX_ES3
 S> +	help
 S> +	  Select the SOC for which you would like to install drivers. Please 

Trailing space (here and elsewhere).


 S> diff --git a/package/ti-gfx/S80ti-gfx b/package/ti-gfx/S80ti-gfx
 S> new file mode 100644
 S> index 0000000..ee2250e
 S> --- /dev/null
 S> +++ b/package/ti-gfx/S80ti-gfx
 S> @@ -0,0 +1,54 @@
 S> +#!/bin/sh
 S> +
 S> +start() {
 S> +	echo "ti-gfx: starting pvr driver"
 S> +
 S> +	BITSPERPIXEL="$(fbset | awk '/geom/ {print $6}')"
 S> +	YRES="$(fbset | awk '/geom/ {print $3}')"
 S> +	# Set RGBA ordering to something the drivers like
 S> +	if [ "$BITSPERPIXEL" = "32" ] ; then
 S> +		fbset -rgba 8/16,8/8,8/0,8/24
 S> +	fi
 S> +	# Try to enable triple buffering when there's enough VRAM
 S> +	fbset -vyres $(( YRES*3 ))
 S> +
 S> +	modprobe omaplfb
 S> +	modprobe bufferclass_ti

Aren't you missing a modprobe of the pvr module itself?

 S> +
 S> +	pvr_maj=$(awk '$2=="pvrsrvkm" { print $1; }' /proc/devices)
 S> +	if [ -e /dev/pvrsrvkm ] ; then
 S> +		rm -f /dev/pvrsrvkm
 S> +	fi

There's not really any reason to do the check as you are using rm -f

 S> +
 S> +	mknod /dev/pvrsrvkm c $pvr_maj 0
 S> +	chmod 666 /dev/pvrsrvkm

666 seems like a security issue. As things run as root by default,
perhaps we should just use 600?

 S> +
 S> +	if ! /usr/bin/pvrsrvctl --start --no-module; then
 S> +		echo "ti-gfx: unable to start server"
 S> +	fi
 S> +}	

Trailing spaces.

 S> +
 S> +stop() {
 S> +	echo "ti-gfx: stopping pvr driver"
 S> +
 S> +	rmmod bufferclass_ti
 S> +	rmmod omaplfb
 S> +	rmmod pvrsrvkm
 S> +}
 S> +
 S> +case "$1" in 

And here as well.

 S> diff --git a/package/ti-gfx/esrev.sh b/package/ti-gfx/esrev.sh
 S> new file mode 100644
 S> index 0000000..bd8b64e
 S> --- /dev/null
 S> +++ b/package/ti-gfx/esrev.sh
 S> @@ -0,0 +1,59 @@
 S> +#!/bin/sh
 S> +
 S> +# Debug script to determine proper ES revision for the current board. The 

Trailing spaces.

 S> +++ b/package/ti-gfx/ti-gfx.mk
 S> @@ -0,0 +1,195 @@
 S> +###############################################################################
 S> +#
 S> +# ti-gfx 

Trailing spaces

 S> +#
 S> +###############################################################################
 S> +
 S> +TI_GFX_VERSION = 4_09_00_01
 S> +TI_GFX_SO_VERSION = 1.9.2188537
 S> +
 S> +ifeq ($(BR2_PACKAGE_TI_GFX_HARD_FLOAT),y)
 S> +TI_GFX_SOURCE = Graphics_SDK_setuplinux_$(TI_GFX_VERSION)_hardfp_minimal_demos.bin
 S> +else
 S> +TI_GFX_SOURCE = Graphics_SDK_setuplinux_$(TI_GFX_VERSION)_minimal_demos.bin
 S> +endif
 S> +
 S> +TI_GFX_SITE = http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/$(TI_GFX_VERSION)/exports/
 S> +TI_GFX_LICENSE = Technology / Software Publicly Available
 S> +TI_GFX_LICENSE_FILES = TSPA.txt
 S> +TI_GFX_INSTALL_STAGING = YES
 S> +
 S> +TI_GFX_DEPENDENCIES = linux
 S> +
 S> +ifeq ($(BR2_PACKAGE_TI_GFX_ES3),y)
 S> +TI_GFX_OMAPES = 3.x
 S> +TI_GFX_PLATFORM = omap3
 S> +endif
 S> +ifeq ($(BR2_PACKAGE_TI_GFX_ES5),y)
 S> +TI_GFX_OMAPES = 5.x
 S> +TI_GFX_PLATFORM = omap3630 

Trailing spaces.

 S> +endif
 S> +ifeq ($(BR2_PACKAGE_TI_GFX_ES6),y)
 S> +TI_GFX_OMPAES = 6.x
 S> +TI_GFX_PLATFORM = ti81xx 

Trailing spaces.

 S> +endif
 S> +ifeq ($(BR2_PACKAGE_TI_GFX_ES8),y)
 S> +TI_GFX_OMAPES = 8.x
 S> +TI_GFX_PLATFORM = ti335x
 S> +endif
 S> +
 S> +ifeq ($(BR2_PACKAGE_TI_GFX_DEBUG),y)
 S> +TI_GFX_DEBUG_LIB = dbg
 S> +TI_GFX_DEBUG_KM = debug
 S> +else
 S> +TI_GFX_DEBUG_LIB = rel
 S> +TI_GFX_DEBUG_KM = release
 S> +endif
 S> +
 S> +TI_GFX_BIN_PATH = gfx_$(TI_GFX_DEBUG_LIB)_es$(TI_GFX_OMAPES)
 S> +
 S> +TI_GFX_KM_MAKE_OPTS = \
 S> +	$(LINUX_MAKE_FLAGS) \
 S> +	BUILD=$(TI_GFX_DEBUG_KM) \
 S> +	TI_PLATFORM=$(TI_GFX_PLATFORM) \
 S> +	OMAPES=$(TI_GFX_OMAPES) \
 S> +	SUPPORT_XORG=0 \
 S> +	KERNELDIR=$(LINUX_DIR)
 S> +
 S> +TI_GFX_DEMO_MAKE_OPTS = \
 S> +	PLATFORM=LinuxARMV7 \
 S> +	X11BUILD=0 \
 S> +	PLAT_CC="$(TARGET_CC)" \
 S> +	PLAT_CPP="$(TARGET_CXX)" \
 S> +	PLAT_AR="$(TARGET_AR)"
 S> +
 S> +# The only required binary is pvrsrvctl all others are optional
 S> +TI_GFX_BIN = pvrsrvctl
 S> +
 S> +ifeq ($(BR2_PACKAGE_TI_GFX_DEBUG),y)
 S> +TI_GFX_BIN += \
 S> +	eglinfo ews_server ews_server_es2 ews_test_gles1 ews_test_gles2 \
 S> +	ews_test_swrender gles1test1 gles2test1 pvr2d_test services_test \
 S> +	sgx_blit_test sgx_clipblit_test sgx_flip_test sgx_init_test \
 S> +	sgx_render_flip_test xeglinfo xgles1test1 xgles2test1 xmultiegltest
 S> +endif
 S> +
 S> +TI_GFX_LIBS = \
 S> +	libews libpvr2d libpvrEWS_WSEGL libpvrPVR2D_BLITWSEGL libpvrPVR2D_DRIWSEGL \
 S> +	libpvrPVR2D_FLIPWSEGL libpvrPVR2D_FRONTWSEGL libpvrPVR2D_LINUXFBWSEGL \
 S> +	libPVRScopeServices libsrv_init libsrv_um libusc pvr_drv
 S> +
 S> +TI_GFX_EGLIMAGE_LIBS = \
 S> +	libEGL libGLES_CM libGLESv2 libglslcompiler libIMGegl
 S> +
 S> +TI_GFX_DEMOS = ChameleonMan MagicLantern
 S> +TI_GFX_DEMOS_LOC = GFX_Linux_SDK/OGLES2/SDKPackage/Demos
 S> +TI_GFX_DEMOS_MAKE_LOC = OGLES2/Build/LinuxGeneric
 S> +TI_GFX_DEMOS_BIN_LOC = OGLES2/Build/LinuxARMV7/ReleaseRaw/
 S> +
 S> +TI_GFX_HDR_DIRS = OGLES2/EGL OGLES2/EWS OGLES2/GLES2 OGLES2/KHR \
 S> +	OGLES/GLES bufferclass_ti/ pvr2d/ wsegl/
 S> +
 S> +define TI_GFX_EXTRACT_CMDS 

Trailing spaces.

 S> +	$(RM) -rf $(TI_GFX_DIR)
 S> +	chmod +x $(DL_DIR)/$(TI_GFX_SOURCE)
 S> +	printf "Y\nY\n qY\n\n" | $(DL_DIR)/$(TI_GFX_SOURCE) \
 S> +		--prefix $(@D) \
 S> +		--mode console
 S> +endef
 S> +
 S> +define TI_GFX_BUILD_KM_CMDS
 S> +	$(MAKE) $(TI_GFX_KM_MAKE_OPTS) -C $(@D)/GFX_Linux_KM all
 S> +endef
 S> +
 S> +define TI_GFX_BUILD_DEMO_CMDS
 S> +	$(foreach demo, $(TI_GFX_DEMOS), \
 S> +		$(TARGET_MAKE_ENV) $(MAKE1) -C \
 S> +			$(@D)/$(TI_GFX_DEMOS_LOC)/$(demo)/$(TI_GFX_DEMOS_MAKE_LOC) \
 S> +			$(TI_GFX_DEMO_MAKE_OPTS) all
 S> +	)
 S> +endef

This should be inside a ifeq ($(BR2_PACKAGE_TI_GFX_DEMOS),y) conditional.


 S> +
 S> +define TI_GFX_BUILD_CMDS
 S> +	$(TI_GFX_BUILD_KM_CMDS)
 S> +	$(TI_GFX_BUILD_DEMO_CMDS)
 S> +endef
 S> +
 S> +# Install libs
 S> +# argument 1 is the location to install to (e.g. STAGING_DIR, TARGET_DIR)
 S> +define TI_GFX_INSTALL_LIBS
 S> +	$(foreach lib,$(TI_GFX_LIBS),
 S> +		$(INSTALL) -D -m 0644 $(@D)/$(TI_GFX_BIN_PATH)/$(lib).so \
 S> +			$(1)/usr/lib/$(lib).so.$(TI_GFX_SO_VERSION); \
 S> +		ln -sf $(lib).so.$(TI_GFX_SO_VERSION) \
 S> +			$(1)/usr/lib/$(lib).so
 S> +	)
 S> +	$(foreach lib,$(TI_GFX_EGLIMAGE_LIBS),
 S> +		$(if $(BR2_PACKAGE_TI_GFX_EGLIMAGE),
 S> +			$(INSTALL) -D -m 0644 $(@D)/$(TI_GFX_BIN_PATH)/$(lib)_eglimage.so \
 S> +				$(1)/usr/lib/$(lib).so.$(TI_GFX_SO_VERSION);
 S> +		,
 S> +			$(INSTALL) -D -m 0644 $(@D)/$(TI_GFX_BIN_PATH)/$(lib).so \ 

Trailing spaces.

 S> +				$(1)/usr/lib/$(lib).so.$(TI_GFX_SO_VERSION);
 S> +		)
 S> +		ln -sf $(lib).so.$(TI_GFX_SO_VERSION) \
 S> +			$(1)/usr/lib/$(lib).so
 S> +	)
 S> +endef
 S> +
 S> +define TI_GFX_INSTALL_STAGING_CMDS
 S> +	$(foreach incdir,$(TI_GFX_HDR_DIRS),
 S> +		$(INSTALL) -d $(STAGING_DIR)/usr/include/$(notdir $(incdir)); \
 S> +		$(INSTALL) -D -m 0644 $(@D)/include/$(incdir)/*.h \
 S> +			$(STAGING_DIR)/usr/include/$(notdir $(incdir))/
 S> +	)
 S> +	$(call TI_GFX_INSTALL_LIBS,$(STAGING_DIR))
 S> +	

Trailing spaces.

 S> +	$(INSTALL) -D -m 0644 package/ti-gfx/egl.pc $(STAGING_DIR)/usr/lib/pkgconfig/
 S> +	$(INSTALL) -D -m 0644 package/ti-gfx/glesv2.pc $(STAGING_DIR)/usr/lib/pkgconfig/
 S> +endef
 S> +
 S> +define TI_GFX_INSTALL_KM_CMDS
 S> +	$(MAKE) $(TI_GFX_KM_MAKE_OPTS) -C $(@D)/GFX_Linux_KM install
 S> +endef
 S> +
 S> +define TI_GFX_INSTALL_BINS_CMDS
 S> +	$(foreach bin,$(TI_GFX_BIN),
 S> +		$(INSTALL) -D -m 0755 $(@D)/$(TI_GFX_BIN_PATH)/$(bin) \
 S> +			$(TARGET_DIR)/usr/bin/$(bin)
 S> +	)
 S> +	$(if $(BR2_PACKAGE_TI_GFX_DEBUG),
 S> +		$(INSTALL) -D -m 0755 package/ti-gfx/esrev.sh \
 S> +			$(TARGET_DIR)/usr/bin/esrev

You could perhaps argue that a script like esrev fiddling around with
devmem should rather be installed into usr/sbin.

-- 
Bye, Peter Korsgaard
