From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 6 Jul 2016 22:25:36 +0200
Subject: [Buildroot] [PATCH v2,4/4] alljoyn-base_tcl: new package
In-Reply-To: <1467806931-9880-4-git-send-email-fabrice.fontaine@orange.com>
References: <1467806931-9880-1-git-send-email-fabrice.fontaine@orange.com>
 <1467806931-9880-4-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <99cb8f42-4ae6-e3ae-a781-f0e1d819fa33@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

Le 06/07/2016 ? 14:08, Fabrice Fontaine a ?crit :
> AllJoyn Base Services are common services used by many devices,
> providing a set of interfaces for different devices to interact and
> interoperate with one another.
> 
> Thin Client Library is designed to bring the benefits of the AllJoyn
> distributed programming environment to embedded systems.
> 
> https://allseenalliance.org

If you want to keep ajtcl package as is:

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> ---
>  package/Config.in                              |  1 +
>  package/alljoyn-base_tcl/Config.in             | 17 ++++++++++
>  package/alljoyn-base_tcl/alljoyn-base_tcl.hash |  2 ++
>  package/alljoyn-base_tcl/alljoyn-base_tcl.mk   | 45 ++++++++++++++++++++++++++
>  4 files changed, 65 insertions(+)
>  create mode 100644 package/alljoyn-base_tcl/Config.in
>  create mode 100644 package/alljoyn-base_tcl/alljoyn-base_tcl.hash
>  create mode 100644 package/alljoyn-base_tcl/alljoyn-base_tcl.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 4120b0d..e3b47ad 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1128,6 +1128,7 @@ menu "Networking"
>  	source "package/ajtcl/Config.in"
>  	source "package/alljoyn/Config.in"
>  	source "package/alljoyn-base/Config.in"
> +	source "package/alljoyn-base_tcl/Config.in"
>  	source "package/batman-adv/Config.in"
>  	source "package/c-ares/Config.in"
>  	source "package/canfestival/Config.in"
> diff --git a/package/alljoyn-base_tcl/Config.in b/package/alljoyn-base_tcl/Config.in
> new file mode 100644
> index 0000000..12ebcef
> --- /dev/null
> +++ b/package/alljoyn-base_tcl/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_ALLJOYN_BASE_TCL
> +	bool "alljoyn-base_tcl"
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # ajtcl
> +	select BR2_PACKAGE_AJTCL
> +	help
> +	  AllJoyn Base Services are common services used by many devices,
> +	  providing a set of interfaces for different devices to interact and
> +	  interoperate with one another.
> +
> +	  Thin Client Library is designed to bring the benefits of the AllJoyn
> +	  distributed programming environment to embedded systems.
> +
> +	  https://allseenalliance.org
> +
> +comment "alljoyn-base_tcl needs a toolchain w/ threads and dynamic library"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> diff --git a/package/alljoyn-base_tcl/alljoyn-base_tcl.hash b/package/alljoyn-base_tcl/alljoyn-base_tcl.hash
> new file mode 100644
> index 0000000..882839d
> --- /dev/null
> +++ b/package/alljoyn-base_tcl/alljoyn-base_tcl.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256	741f7a71929ccd6a66bf75d2b03affc62411e229b70bb89399be9b1b2ce40629	alljoyn-base_tcl-16.04.00.tar.gz
> diff --git a/package/alljoyn-base_tcl/alljoyn-base_tcl.mk b/package/alljoyn-base_tcl/alljoyn-base_tcl.mk
> new file mode 100644
> index 0000000..d6c339b
> --- /dev/null
> +++ b/package/alljoyn-base_tcl/alljoyn-base_tcl.mk
> @@ -0,0 +1,45 @@
> +################################################################################
> +#
> +# alljoyn-base_tcl
> +#
> +################################################################################
> +
> +ALLJOYN_BASE_TCL_REV = 16.04
> +ALLJOYN_BASE_TCL_VERSION = $(ALLJOYN_BASE_TCL_REV).00
> +ALLJOYN_BASE_TCL_SOURCE = alljoyn-base_tcl-$(ALLJOYN_BASE_TCL_VERSION).tar.gz
> +ALLJOYN_BASE_TCL_SITE = \
> +	https://mirrors.kernel.org/allseenalliance/alljoyn/$(ALLJOYN_BASE_TCL_REV)
> +# See https://allseenalliance.org/alliance/ip-policy
> +ALLJOYN_BASE_TCL_LICENSE = ISC
> +
> +ALLJOYN_BASE_TCL_DEPENDENCIES = host-scons ajtcl
> +ALLJOYN_BASE_TCL_INSTALL_STAGING = YES
> +
> +# AllJoyn Base Thin Core can be compiled in debug or release mode. By default,
> +# AllJoyn Base Thin Core is built in debug mode.
> +ALLJOYN_BASE_TCL_VARIANT = release
> +
> +ALLJOYN_BASE_TCL_SCONS_OPTS = \
> +	-j$(PARALLEL_JOBS) \
> +	V=1 \
> +	VARIANT=$(AJTCL_VARIANT) \
> +	CC="$(TARGET_CC)" \
> +	CXX="$(TARGET_CXX)" \
> +	AJTCL_DIST=$(STAGING_DIR) \
> +	WS=off
> +
> +define ALLJOYN_BASE_TCL_BUILD_CMDS
> +	cd $(@D); $(SCONS) $(ALLJOYN_BASE_TCL_SCONS_OPTS)
> +endef
> +
> +define ALLJOYN_BASE_TCL_INSTALL_STAGING_CMDS
> +	cp -a $(@D)/dist/lib/lib* $(STAGING_DIR)/usr/lib/
> +	cp -a $(@D)/dist/include/* $(STAGING_DIR)/usr/include/
> +endef
> +
> +# Only install AllJoyn Base Thin Core dynamic libraries into target directory
> +define ALLJOYN_BASE_TCL_INSTALL_TARGET_CMDS
> +	cp -a $(@D)/dist/lib/lib*.so* $(TARGET_DIR)/usr/lib/
> +endef
> +
> +$(eval $(generic-package))
> 
