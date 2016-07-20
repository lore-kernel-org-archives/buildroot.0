From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2016 22:20:47 +0200
Subject: [Buildroot] [PATCH v3,1/3] alljoyn-base: new package
In-Reply-To: <1467884015-27464-1-git-send-email-fabrice.fontaine@orange.com>
References: <1467884015-27464-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20160720222047.282b407c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've applied your patch, after doing a number of changes, see below for
the details.

On Thu,  7 Jul 2016 11:33:33 +0200, Fabrice Fontaine wrote:

> diff --git a/package/alljoyn-base/Config.in b/package/alljoyn-base/Config.in
> new file mode 100644
> index 0000000..233b3a7
> --- /dev/null
> +++ b/package/alljoyn-base/Config.in
> @@ -0,0 +1,43 @@
> +config BR2_PACKAGE_ALLJOYN_BASE
> +	bool "alljoyn-base"
> +	depends on BR2_USE_MMU # alljoyn
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_WCHAR # alljoyn

This was missing a dependency on BR2_TOOLCHAIN_HAS_SYNC_4, which was
added later on on the alljoyn package.

> +	select BR2_PACKAGE_ALLJOYN
> +	select BR2_PACKAGE_OPENSSL

I've added here a "select" that makes sure at least one of the three
sub-options is enabled.

> +	help
> +	  AllJoyn Base Services are common services used by many
> +	  devices, providing a set of interfaces for different devices
> +	  to interact and interoperate with one another.
> +
> +	  https://allseenalliance.org
> +
> +if BR2_PACKAGE_ALLJOYN_BASE
> +
> +config BR2_PACKAGE_ALLJOYN_BASE_CONTROLPANEL
> +	bool "alljoyn-controlpanel"

	bool "controlpanel"

is sufficient, since those sub-options are indented below the
"alljoyn-base" option, so it's obvious they belong to alljoyn-base.

I've changed that for the three sub-options.

> +# By setting openwrt for OS and CPU, AllJoyn cross-compilation can be finely
> +# tuned through TARGET_xxx options. All TARGET_xxx variables must be defined
> +# otherwise compilation will fail.
> +# CROSS_COMPILE option should not be used as it works only for linux/ARM.
> +ALLJOYN_BASE_OS = openwrt
> +ALLJOYN_BASE_CPU = openwrt
> +
> +# AllJoyn install everything in this relative path
> +ALLJOYN_BASE_DISTDIR = \
> +	build/$(ALLJOYN_OS)/$(ALLJOYN_CPU)/$(ALLJOYN_VARIANT)/dist/

Final / not needed.

> +ALLJOYN_BASE_SCONS_OPTS = \
> +	-j$(PARALLEL_JOBS) \
> +	V=1 \
> +	OS=$(ALLJOYN_BASE_OS) \
> +	CPU=$(ALLJOYN_BASE_CPU) \
> +	VARIANT=$(ALLJOYN_BASE_VARIANT) \
> +	BR=off \
> +	CRYPTO=$(ALLJOYN_BASE_CRYPTO) \
> +	BINDINGS=$(ALLJOYN_BASE_BINDINGS) \
> +	ALLJOYN_DISTDIR="$(STAGING_DIR)"\
> +	TARGET_CFLAGS="$(TARGET_CFLAGS)" \
> +	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS)" \
> +	TARGET_LINKFLAGS="$(TARGET_LINKFLAGS)" \
> +	TARGET_CC="$(TARGET_CC)" \
> +	TARGET_CXX="$(TARGET_CXX)" \
> +	TARGET_LD="$(TARGET_LD)" \
> +	TARGET_LINK="$(TARGET_CXX)" \
> +	TARGET_AR="$(TARGET_AR)" \
> +	TARGET_RANLIB="$(TARGET_RANLIB)" \
> +	TARGET_PATH="$(BR_PATH)"
> +
> +ifeq ($(BR2_PACKAGE_ALLJOYN_BASE_CONTROLPANEL), y)
> +ALLJOYN_BASE_BUILD_CONTROLPANEL = \
> +	cd $(@D)/controlpanel; $(SCONS) $(ALLJOYN_BASE_SCONS_OPTS)
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ALLJOYN_BASE_NOTIFICATION), y)
> +ALLJOYN_BASE_BUILD_NOTIFICATION = \
> +	cd $(@D)/notification; $(SCONS) $(ALLJOYN_BASE_SCONS_OPTS)
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ALLJOYN_BASE_ONBOARDING), y)
> +ALLJOYN_BASE_BUILD_ONBOARDING = \
> +	cd $(@D)/onboarding; $(SCONS) $(ALLJOYN_BASE_SCONS_OPTS)
> +endif

This is a lot of a duplication a loop would have been much better.

> +
> +define ALLJOYN_BASE_BUILD_CMDS
> +	$(ALLJOYN_BASE_BUILD_CONTROLPANEL)
> +	$(ALLJOYN_BASE_BUILD_NOTIFICATION)
> +	$(ALLJOYN_BASE_BUILD_ONBOARDING)
> +endef
> +
> +# Suppress error code and error message as those directories could be missing if
> +# BR2_PACKAGE_ALLJOYN_BASE_xxx variables are all unset
> +define ALLJOYN_BASE_INSTALL_STAGING_CMDS
> +	cp -a $(@D)/*/$(ALLJOYN_BASE_DISTDIR)/*/lib/lib* \
> +		$(STAGING_DIR)/usr/lib/ 2>/dev/null || :
> +	cp -a $(@D)/*/$(ALLJOYN_BASE_DISTDIR)/*/inc/* \
> +		$(STAGING_DIR)/usr/include/ 2>/dev/null || :

And here, throwing away the error messages is definitely not good.

So, I've replaced the build and installation logic with:

ifeq ($(BR2_PACKAGE_ALLJOYN_BASE_CONTROLPANEL), y)
ALLJOYN_BASE_TARGETS += controlpanel
endif

ifeq ($(BR2_PACKAGE_ALLJOYN_BASE_NOTIFICATION), y)
ALLJOYN_BASE_TARGETS += notification
endif

ifeq ($(BR2_PACKAGE_ALLJOYN_BASE_ONBOARDING), y)
ALLJOYN_BASE_TARGETS += onboarding
endif

define ALLJOYN_BASE_BUILD_CMDS
        $(foreach target,$(ALLJOYN_BASE_TARGETS),\
                cd $(@D)/$(target); $(SCONS) $(ALLJOYN_BASE_SCONS_OPTS)
        )
endef

define ALLJOYN_BASE_INSTALL_STAGING_CMDS
        $(foreach target,$(ALLJOYN_BASE_TARGETS),\
                cp -a $(@D)/$(target)/$(ALLJOYN_BASE_DISTDIR)/*/lib/lib* \
                        $(STAGING_DIR)/usr/lib/
                cp -a $(@D)/$(target)/$(ALLJOYN_BASE_DISTDIR)/*/inc/* \
                        $(STAGING_DIR)/usr/include/
        )
endef

define ALLJOYN_BASE_INSTALL_TARGET_CMDS
        $(foreach target,$(ALLJOYN_BASE_TARGETS),\
                cp -a $(@D)/$(target)/$(ALLJOYN_BASE_DISTDIR)/*/lib/lib* \
                        $(TARGET_DIR)/usr/lib/
        )
endef

which is both shorter, clearer, and keeps the error checking around.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
