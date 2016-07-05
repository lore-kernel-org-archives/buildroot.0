From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 5 Jul 2016 15:36:55 +0200
Subject: [Buildroot] [PATCH 2/2] alljoyn-base: new package
In-Reply-To: <10863_1466062435_57625663_10863_288_1_15d7af9e-545f-4da3-9fe7-ec91bc1eb8ab@OPEXCLILM5F.corporate.adroot.infra.ftgroup>
References: <10863_1466062435_57625663_10863_288_1_15d7af9e-545f-4da3-9fe7-ec91bc1eb8ab@OPEXCLILM5F.corporate.adroot.infra.ftgroup>
Message-ID: <b1329e50-364a-fa0a-baeb-0ceadf7d649a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

Le 16/06/2016 ? 09:33, fabrice.fontaine at orange.com a ?crit :
> AllJoyn Base Services are common services used by many devices,
> providing a set of interfaces for different devices to interact and
> interoperate with one another.
> 
> https://allseenalliance.org
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> ---
>  package/Config.in                      |   1 +
>  package/alljoyn-base/Config.in         |  40 +++++++++++++
>  package/alljoyn-base/alljoyn-base.hash |   2 +
>  package/alljoyn-base/alljoyn-base.mk   | 102 +++++++++++++++++++++++++++++++++
>  4 files changed, 145 insertions(+)
>  create mode 100644 package/alljoyn-base/Config.in
>  create mode 100644 package/alljoyn-base/alljoyn-base.hash
>  create mode 100644 package/alljoyn-base/alljoyn-base.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index f0106da..5cde173 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1124,6 +1124,7 @@ endmenu
>  menu "Networking"
>  	source "package/agentpp/Config.in"
>  	source "package/alljoyn/Config.in"
> +	source "package/alljoyn-base/Config.in"
>  	source "package/batman-adv/Config.in"
>  	source "package/c-ares/Config.in"
>  	source "package/canfestival/Config.in"
> diff --git a/package/alljoyn-base/Config.in b/package/alljoyn-base/Config.in
> new file mode 100644
> index 0000000..94424a9
> --- /dev/null
> +++ b/package/alljoyn-base/Config.in
> @@ -0,0 +1,40 @@
> +config BR2_PACKAGE_ALLJOYN_BASE
> +	bool "alljoyn-base"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_WCHAR
> +	select BR2_PACKAGE_ALLJOYN

Following the previous review, propagate the alljoyn dependencies.

> +	select BR2_PACKAGE_LIBCAP

Is alljoyn-base requiring libcap or just alljoyn requiring libcap ?

> +	help
> +	  AllJoyn Base Services are common services used by many devices,
> +	  providing a set of interfaces for different devices to interact and
> +	  interoperate with one another.
> +
> +	  https://allseenalliance.org
> +
> +comment "alljoyn-base needs a toolchain w/ C++, threads and wchar"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_USE_WCHAR

Update comment dependencies

> +
> +if BR2_PACKAGE_ALLJOYN_BASE
> +
> +config BR2_PACKAGE_ALLJOYN_BASE_CONTROLPANEL
> +	bool "alljoyn-controlpanel"
> +	help
> +	  Enable AllJoyn Control Panel base service which allows devices to
> +	  advertise a virtual control panel to be controlled remotely.
> +
> +config BR2_PACKAGE_ALLJOYN_BASE_NOTIFICATION
> +	bool "alljoyn-notification"
> +	help
> +	  Enable AllJoyn Notification base service which allows text-based
> +	  notifications to be sent and received by devices on the AllJoyn
> +	  network. Also supports audio and images via URLs.
> +
> +config BR2_PACKAGE_ALLJOYN_BASE_ONBOARDING
> +	bool "alljoyn-onboarding"
> +	help
> +	  Enable AllJoyn Onboarding base service which provides a consistent way
> +	  to bring a new device onto the Wi-Fi network.
> +
> +endif # BR2_PACKAGE_ALLJOYN_BASE
> diff --git a/package/alljoyn-base/alljoyn-base.hash b/package/alljoyn-base/alljoyn-base.hash
> new file mode 100644
> index 0000000..dbec3a3
> --- /dev/null
> +++ b/package/alljoyn-base/alljoyn-base.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256	742f724b3a06c8fc4039591dba24871755728221ca5dc4afb78ebd9a7e3beb44	alljoyn-base-16.04.00.tar.gz
> diff --git a/package/alljoyn-base/alljoyn-base.mk b/package/alljoyn-base/alljoyn-base.mk
> new file mode 100644
> index 0000000..acfcb95
> --- /dev/null
> +++ b/package/alljoyn-base/alljoyn-base.mk
> @@ -0,0 +1,102 @@
> +################################################################################
> +#
> +# alljoyn-base
> +#
> +################################################################################
> +
> +ALLJOYN_BASE_REV = 16.04
> +ALLJOYN_BASE_VERSION = $(ALLJOYN_BASE_REV).00
> +ALLJOYN_BASE_SOURCE = alljoyn-base-$(ALLJOYN_BASE_VERSION).tar.gz
> +ALLJOYN_BASE_SITE = \
> +	https://mirrors.kernel.org/allseenalliance/alljoyn/$(ALLJOYN_BASE_REV)
> +# See https://allseenalliance.org/alliance/ip-policy
> +ALLJOYN_BASE_LICENSE = ISC
> +# AllJoyn does not provide any license files with source code
> +# ALLJOYN_BASE_LICENSE_FILES = 

Same comment as for alljoyn package.

> +
> +ALLJOYN_BASE_DEPENDENCIES = host-scons libcap alljoyn
> +ALLJOYN_BASE_INSTALL_STAGING = YES
> +
> +# If BR2_PACKAGE_OPENSSL is set, use openssl otherwise use builtin crypto
> +ifeq ($(BR2_PACKAGE_OPENSSL), y)
> +ALLJOYN_BASE_DEPENDENCIES += openssl
> +ALLJOYN_BASE_CRYPTO = openssl
> +else
> +ALLJOYN_BASE_CRYPTO = builtin
> +endif

Same comment as for alljoyn package.

> +
> +# AllJoyn can be compiled in debug or release mode. By default, AllJoyn is built
> +# in debug mode.
> +ALLJOYN_BASE_VARIANT = release
> +
> +ALLJOYN_BASE_BINDINGS = c,cpp
> +
> +# By setting openwrt for OS and CPU, AllJoyn cross-compilation can be finely
> +# tuned through TARGET_xxx options. All TARGET_xxx variables must be defined
> +# otherwise compilation will fail.
> +# CROSS_COMPILE option should not be used as it works only for linux/ARM.
> +ALLJOYN_BASE_OS = openwrt
> +ALLJOYN_BASE_CPU = openwrt
> +
> +# AllJoyn install everything in this relative path
> +ALLJOYN_BASE_DISTDIR = \
> +	/build/$(ALLJOYN_OS)/$(ALLJOYN_CPU)/$(ALLJOYN_VARIANT)/dist/
> +
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
> +endef
> +
> +# Only install alljoyn dynamic libraries into target directory
> +define ALLJOYN_BASE_INSTALL_TARGET_CMDS
> +	cp -a $(@D)/*/$(ALLJOYN_BASE_DISTDIR)/*/lib/lib*.so* \
> +		$(TARGET_DIR)/usr/lib/ 2>/dev/null || :
> +endef
> +
> +$(eval $(generic-package))
> 
