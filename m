From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 7 Jul 2016 18:59:52 +0200
Subject: [Buildroot] [PATCH v3,2/3] alljoyn-tcl: new package
In-Reply-To: <1467884015-27464-2-git-send-email-fabrice.fontaine@orange.com>
References: <1467884015-27464-1-git-send-email-fabrice.fontaine@orange.com>
 <1467884015-27464-2-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <2705c709-8a4c-b5eb-f6ce-c70396270f6b@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

Le 07/07/2016 ? 11:33, Fabrice Fontaine a ?crit :
> The AllJoyn framework defines a common way for devices and apps to
> communicate with one another regardless of brands, categories,
> transports, and OSes. Developers write applications that discover
> nearby devices, and communicate with each other directly and through
> the cloud, unleashing new possibilities in the Internet of Things.
> 
> AllJoyn Thin Core Library (AJTCL) is designed to bring the benefits
> of the AllJoyn distributed programming environment to embedded
> systems.
> 
> https://allseenalliance.org

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> ---
> Changes v2 -> v3 (after review of Romain Naour):
>  - Rename ajtcl into alljoyn-tcl for consistency
>  - Rewrap Config.in help text
> 
> Changes v1 -> v2 (after review of Romain Naour):
>  - Add dependencies on !BR2_STATIC_LIBS
>  - Remove unneeded comments on ALLJOYN_LICENSE_FILES
> 
>  package/Config.in                    |  1 +
>  package/alljoyn-tcl/Config.in        | 20 +++++++++++++++++
>  package/alljoyn-tcl/alljoyn-tcl.hash |  2 ++
>  package/alljoyn-tcl/alljoyn-tcl.mk   | 43 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 66 insertions(+)
>  create mode 100644 package/alljoyn-tcl/Config.in
>  create mode 100644 package/alljoyn-tcl/alljoyn-tcl.hash
>  create mode 100644 package/alljoyn-tcl/alljoyn-tcl.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 99a8836..5715bff 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1130,6 +1130,7 @@ menu "Networking"
>  	source "package/agentpp/Config.in"
>  	source "package/alljoyn/Config.in"
>  	source "package/alljoyn-base/Config.in"
> +	source "package/alljoyn-tcl/Config.in"
>  	source "package/batman-adv/Config.in"
>  	source "package/c-ares/Config.in"
>  	source "package/canfestival/Config.in"
> diff --git a/package/alljoyn-tcl/Config.in b/package/alljoyn-tcl/Config.in
> new file mode 100644
> index 0000000..fe54af0
> --- /dev/null
> +++ b/package/alljoyn-tcl/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_ALLJOYN_TCL
> +	bool "alljoyn-tcl"
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	help
> +	  The AllJoyn framework defines a common way for devices and
> +	  apps to communicate with one another regardless of brands,
> +	  categories, transports, and OSes. Developers write
> +	  applications that discover nearby devices, and communicate
> +	  with each other directly and through the cloud, unleashing
> +	  new possibilities in the Internet of Things.
> +
> +	  AllJoyn Thin Core Library (AJTCL) is designed to bring the
> +	  benefits of the AllJoyn distributed programming environment
> +	  to embedded systems.
> +
> +	  https://allseenalliance.org
> +
> +comment "alljoyn-tcl needs a toolchain w/ threads and dynamic library"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> diff --git a/package/alljoyn-tcl/alljoyn-tcl.hash b/package/alljoyn-tcl/alljoyn-tcl.hash
> new file mode 100644
> index 0000000..a1cdf16
> --- /dev/null
> +++ b/package/alljoyn-tcl/alljoyn-tcl.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256	ce6a05a67ff405ba6274e85fe750d98f40cbe7ab2c968218c7741a10bd86e21a	ajtcl-16.04.00-src.tar.gz
> diff --git a/package/alljoyn-tcl/alljoyn-tcl.mk b/package/alljoyn-tcl/alljoyn-tcl.mk
> new file mode 100644
> index 0000000..a5c7e4e
> --- /dev/null
> +++ b/package/alljoyn-tcl/alljoyn-tcl.mk
> @@ -0,0 +1,43 @@
> +################################################################################
> +#
> +# alljoyn-tcl
> +#
> +################################################################################
> +
> +ALLJOYN_TCL_REV = 16.04
> +ALLJOYN_TCL_VERSION = $(ALLJOYN_TCL_REV).00
> +ALLJOYN_TCL_SOURCE = ajtcl-$(ALLJOYN_TCL_VERSION)-src.tar.gz
> +ALLJOYN_TCL_SITE = \
> +	https://mirrors.kernel.org/allseenalliance/alljoyn/$(ALLJOYN_TCL_REV)
> +# See https://allseenalliance.org/alliance/ip-policy
> +ALLJOYN_TCL_LICENSE = ISC
> +
> +ALLJOYN_TCL_DEPENDENCIES = host-scons
> +ALLJOYN_TCL_INSTALL_STAGING = YES
> +
> +# AllJoyn Thin Core can be compiled in debug or release mode. By default,
> +# AllJoyn Thin Core is built in debug mode.
> +ALLJOYN_TCL_VARIANT = release
> +
> +ALLJOYN_TCL_SCONS_OPTS = \
> +	-j$(PARALLEL_JOBS) \
> +	V=1 \
> +	VARIANT=$(ALLJOYN_TCL_VARIANT) \
> +	CC="$(TARGET_CC)" \
> +	CXX="$(TARGET_CXX)"
> +
> +define ALLJOYN_TCL_BUILD_CMDS
> +	cd $(@D); $(SCONS) $(ALLJOYN_TCL_SCONS_OPTS)
> +endef
> +
> +define ALLJOYN_TCL_INSTALL_STAGING_CMDS
> +	cp -a $(@D)/dist/lib/lib* $(STAGING_DIR)/usr/lib/
> +	cp -a $(@D)/dist/include/* $(STAGING_DIR)/usr/include/
> +endef
> +
> +# Only install AllJoyn Thin Core dynamic libraries into target directory
> +define ALLJOYN_TCL_INSTALL_TARGET_CMDS
> +	cp -a $(@D)/dist/lib/lib*.so* $(TARGET_DIR)/usr/lib/
> +endef
> +
> +$(eval $(generic-package))
> 
