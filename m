From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 5 Jul 2016 15:25:45 +0200
Subject: [Buildroot] [PATCH 1/4] alljoyn: new package
In-Reply-To: <20939_1467184224_57737460_20939_8004_1_f44dcc70-6b83-4a10-9e0e-494a4c74c46d@OPEXCLILM5F.corporate.adroot.infra.ftgroup>
References: <20939_1467184224_57737460_20939_8004_1_f44dcc70-6b83-4a10-9e0e-494a4c74c46d@OPEXCLILM5F.corporate.adroot.infra.ftgroup>
Message-ID: <20c2a9eb-15bb-3049-bae9-329c4ef4a6c9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

Le 29/06/2016 ? 09:10, fabrice.fontaine at orange.com a ?crit :
> The AllJoyn framework defines a common way for devices and apps to
> communicate with one another regardless of brands, categories,
> transports, and OSes. Developers write applications that discover
> nearby devices, and communicate with each other directly and through
> the cloud, unleashing new possibilities in the Internet of Things.
> 
> https://allseenalliance.org
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> ---
>  package/Config.in            |  1 +
>  package/alljoyn/Config.in    | 18 +++++++++++
>  package/alljoyn/alljoyn.hash |  2 ++
>  package/alljoyn/alljoyn.mk   | 77 ++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 98 insertions(+)
>  create mode 100644 package/alljoyn/Config.in
>  create mode 100644 package/alljoyn/alljoyn.hash
>  create mode 100644 package/alljoyn/alljoyn.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index e5ddc3e..9dc58c3 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1126,6 +1126,7 @@ endmenu
>  
>  menu "Networking"
>  	source "package/agentpp/Config.in"
> +	source "package/alljoyn/Config.in"
>  	source "package/batman-adv/Config.in"
>  	source "package/c-ares/Config.in"
>  	source "package/canfestival/Config.in"
> diff --git a/package/alljoyn/Config.in b/package/alljoyn/Config.in
> new file mode 100644
> index 0000000..22a0ff8
> --- /dev/null
> +++ b/package/alljoyn/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_ALLJOYN
> +	bool "alljoyn"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_WCHAR

I see some fork() function calls in the source code, so alljoyn should depends
on BR2_USE_MMU

Also add "depends on BR2_STATIC_LIBS" here (see the last comment)

> +	select BR2_PACKAGE_LIBCAP
> +	help
> +	  The AllJoyn framework defines a common way for devices and apps to
> +	  communicate with one another regardless of brands, categories,
> +	  transports, and OSes. Developers write applications that discover
> +	  nearby devices, and communicate with each other directly and through
> +	  the cloud, unleashing new possibilities in the Internet of Things.
> +
> +	  https://allseenalliance.org
> +
> +comment "alljoyn needs a toolchain w/ C++, threads and wchar"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_USE_WCHAR

Update the comment dependency accordingly.

> diff --git a/package/alljoyn/alljoyn.hash b/package/alljoyn/alljoyn.hash
> new file mode 100644
> index 0000000..e18d66e
> --- /dev/null
> +++ b/package/alljoyn/alljoyn.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256	41bd424d376d22dc2b48cc035400bd63595d19467eeb6a7ae81429f5a43ed2e2	alljoyn-16.04.00-src.tar.gz
> diff --git a/package/alljoyn/alljoyn.mk b/package/alljoyn/alljoyn.mk
> new file mode 100644
> index 0000000..272dd18
> --- /dev/null
> +++ b/package/alljoyn/alljoyn.mk
> @@ -0,0 +1,77 @@
> +################################################################################
> +#
> +# alljoyn
> +#
> +################################################################################
> +
> +ALLJOYN_REV = 16.04
> +ALLJOYN_VERSION = $(ALLJOYN_REV).00
> +ALLJOYN_SOURCE = alljoyn-$(ALLJOYN_VERSION)-src.tar.gz
> +ALLJOYN_SITE = https://mirrors.kernel.org/allseenalliance/alljoyn/$(ALLJOYN_REV)
> +# See https://allseenalliance.org/alliance/ip-policy
> +ALLJOYN_LICENSE = ISC
> +# AllJoyn does not provide any license files with source code
> +# ALLJOYN_LICENSE_FILES = 

Thanks for the comment but I don't think you should keep this commented line.

> +
> +ALLJOYN_DEPENDENCIES = host-scons libcap
> +ALLJOYN_INSTALL_STAGING = YES
> +
> +# If BR2_PACKAGE_OPENSSL is set, use openssl otherwise use builtin crypto
> +ifeq ($(BR2_PACKAGE_OPENSSL), y)
> +ALLJOYN_DEPENDENCIES += openssl
> +ALLJOYN_CRYPTO = openssl
> +else
> +ALLJOYN_CRYPTO = builtin

We prefer to not use builtin libraries, It would be better to select openssl
package unconditionally.

> +endif
> +
> +# AllJoyn can be compiled in debug or release mode. By default, AllJoyn is built
> +# in debug mode.
> +ALLJOYN_VARIANT = release
> +
> +ALLJOYN_BINDINGS = c,cpp
> +
> +# By setting openwrt for OS and CPU, AllJoyn cross-compilation can be finely
> +# tuned through TARGET_xxx options. All TARGET_xxx variables must be defined
> +# otherwise compilation will fail.
> +# CROSS_COMPILE option should not be used as it works only for linux/ARM.
> +ALLJOYN_OS = openwrt
> +ALLJOYN_CPU = openwrt
> +
> +# AllJoyn install everything in this relative path
> +ALLJOYN_DISTDIR = /build/$(ALLJOYN_OS)/$(ALLJOYN_CPU)/$(ALLJOYN_VARIANT)/dist/
> +
> +ALLJOYN_SCONS_OPTS = \
> +	-j$(PARALLEL_JOBS) \
> +	V=1 \
> +	OS=$(ALLJOYN_OS) \
> +	CPU=$(ALLJOYN_CPU) \
> +	VARIANT=$(ALLJOYN_VARIANT) \
> +	BR=off \
> +	CRYPTO=$(ALLJOYN_CRYPTO) \
> +	BINDINGS=$(ALLJOYN_BINDINGS) \
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
> +define ALLJOYN_BUILD_CMDS
> +	cd $(@D); $(SCONS) $(ALLJOYN_SCONS_OPTS)
> +endef
> +
> +define ALLJOYN_INSTALL_STAGING_CMDS
> +	cp -a $(@D)/$(ALLJOYN_DISTDIR)/*/lib/lib* $(STAGING_DIR)/usr/lib/
> +	cp -a $(@D)/$(ALLJOYN_DISTDIR)/*/inc/* $(STAGING_DIR)/usr/include/
> +endef
> +
> +# Only install alljoyn dynamic libraries into target directory
> +define ALLJOYN_INSTALL_TARGET_CMDS
> +	cp -a $(@D)/$(ALLJOYN_DISTDIR)/*/lib/lib*.so* $(TARGET_DIR)/usr/lib/
> +endef

Since alljoyn dynamic library is always build, the package should not be
available for static only case (BR2_STATIC_LIBS)

Best regards,
Romain Naour

> +
> +$(eval $(generic-package))
> 
