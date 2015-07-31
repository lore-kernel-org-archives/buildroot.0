From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 31 Jul 2015 23:58:29 +0200
Subject: [Buildroot] [PATCH v8 1/1] package/swupdate: new package
In-Reply-To: <1438375543-28208-1-git-send-email-joerg.krause@embedded.rocks>
References: <1438375543-28208-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <55BBEF85.4000207@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

Le 31/07/2015 22:45, J?rg Krause a ?crit :
> swupdate provides a reliable way to update the software on an embedded system.
> 
> Note that swupdates has a reworked Kbuild/Kconfig system. It has now support
> for the 'option' and 'env' symbols as well for the 'savedefconfig' target.
> This makes dependency handling much easier. We're now able to pass which
> dependencies are available through the environment, as suggested by Arnout
> Vandecappelle [1].
> 
> In previous version of this patch we had a configuration setting where all
> package dependencies except Lua were selected by default. This has changed with
> v7 as we are now able to pass dependencies to the swupdate build system through
> the environment. For useful operation swupdate requires a parser which depends
> by default on libconfig, but can be replaced by a json-c or Lua parser.
> 
> To provide a reasonable firmware update system we enable the embedded webserver
> based on mongoose (also see notes about mongoose below), a parser as stated
> above and a handler for raw NAND or NOR flash.
> 
> The user can modify this configuration by selecting the appropriate dependencies
> before running `make swupdate-menuconfig`. The help text contains information
> about which packages may be of interest for the user.
> 
> The embedded web server requires a website for proper operation. We install the
> included website by default, however the user may choose to install a custom
> website on the post-build scripts.
> 
> Note, swupdate includes some old versions of mongoose and lsqlite3:
>   - mongoose is version 3.8 from year 2013
>   - lsqlite3 is version 0.8 from year 2011
> 
> Currently, swupdate does not provide a way to replace these with external
> packages.
> 
> This patch is based on a WIP version submitted by Romain Naour, commented by
> Arnout Vandecappelle [2].
> 
> [1]
> http://lists.busybox.net/pipermail/buildroot/2015-March/122981.html
> 
> [2]
> https://patchwork.ozlabs.org/patch/401270/
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> Cc: Romain Naour <romain.naour@openwide.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Tested-by: Mike Williams <mike@mikebwilliams.com>
> ---
> Changes v7 -> v8:
> [Romain Naour:
>   - bump to release 2015.07

I enabled CONFIG_UBOOT with a minimal config and I get a link error (-lz not found)
I think it's one of the new commit in 201507 "Build error if U-Boot is required
without gunzip" cf495e23ad117f4cae9c429e80714fe9c18f2d6a.

So CONFIG_UBOUT mustn't be available when HAVE_ZLIB=n.

Since this issue doesn't affect the minimal config provided by Buildroot:

Reviewed-by: Romain Naour <romain.naour@openwide.fr>

Best regards,
Romain

>   - add target (MMU) and toolchain (THREAD) dependencies]
>   - rewrite commit log
> 
> Changes v6 -> v7:
>   - bump to latest commit
>   - use the updated Kbuild/Kconfig infrastructure of swupdate to pass the
>     dependencies through the environment (suggested by Arnout)
>   - only select libconfig (if not json-c or Lua 5.2 is selected) as dependency
>   - provide a new configuration file for getting a reasonable swupdate
>     configuration
>   - select BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE by default to get a working
>     default swupdate setup
>   - rewrite help text
>   - rewrite commit log
> 
> Changes v5 -> v6:
>   - bump to latest commit package/swupdate/0001-Fix-musl-build.patch
>   - remove upstream applied musl patch
> 
> Changes v4 -> v5:
>   - bump to latest commit 524e3d729267fd430f539eb65e8a710abd89d0f4
>   - enable new feature JSON parser in .config and add dependency for json-c
>   - remove upstream applied patch "Add missing header for off_t"
>   - add musl patch
>   - point to the homepage in help text (Yann)
>   - add MIT and Public Domain to LICENSE (Yann), maybe not necessary (Thomas)
>   - clarify used versions of bundled mongoose and lsqlite3
> 
> Changes v3 -> v4:
>   - bump to latest commit c68f02320858f89f2d441ff2057d49489fb6f586
>   - remove lua dependency (Mike, Arnout)
>   - remove U-Boot handler in swupdate.config (Arnout)
>   - align help text
>   - sent patch upstream
> 
> Changes v2 -> v3:
>   - bump to latest commit d7753be4fd8bdf2ba4ba56ee869550663b2cca80
>   - enable all dependencies (Arnout)
>   - rewrite help text for configuration file
>   - add option to install default website
> 
> Changes v1 -> v2:
>   - bump to latest commit d9f58b5a3263b1b00c6d011cd8cdd65e69890b46
>   - update Sob email address
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/Config.in                |   1 +
>  package/swupdate/Config.in       |  56 +++++++++++++++++++++
>  package/swupdate/swupdate.config |  61 ++++++++++++++++++++++
>  package/swupdate/swupdate.mk     | 106 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 224 insertions(+)
>  create mode 100644 package/swupdate/Config.in
>  create mode 100644 package/swupdate/swupdate.config
>  create mode 100644 package/swupdate/swupdate.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 43c58ca..210dddb 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1464,6 +1464,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	source "package/start-stop-daemon/Config.in"
>  endif
>  	source "package/supervisor/Config.in"
> +	source "package/swupdate/Config.in"
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	source "package/sysklogd/Config.in"
>  endif
> diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
> new file mode 100644
> index 0000000..4625393
> --- /dev/null
> +++ b/package/swupdate/Config.in
> @@ -0,0 +1,56 @@
> +config BR2_PACKAGE_SWUPDATE
> +	bool "swupdate"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU # fork()
> +	# swupdate requires a parser and uses libconfig as default
> +	select BR2_PACKAGE_LIBCONFIG if !BR2_PACKAGE_JSON_C && !BR2_PACKAGE_LUA_5_2
> +	help
> +	  swupdate provides a reliable way to update the software on an
> +	  embedded system.
> +
> +	  swupdate is highly configurable to fit the targets requirements and
> +	  to minimize the footprint. The provided default configuration file
> +	  BR2_PACKAGE_SWUPDATE_CONFIG will enable swupdate with an embedded
> +	  webserver, a parser and a handler for raw NAND or NOR flash.
> +
> +	  The default configuration file builds a reasonable firmware update
> +	  system with minimal external dependencies in my mind. If you like to
> +	  use your own modified configuration, you have to select the
> +	  necessary packages manually:
> +
> +	  * Select BR2_PACKAGE_LUA_5_2 if you want to have Lua support.
> +	  * Select BR2_LIBCURL if you want to use the download feature.
> +	  * Select BR2_PACKAGE_OPENSSL is you want to add encryptions support
> +	    to the webserver.
> +	  * Select BR2_PACKAGE_MTD if you want to use swupdate with UBI
> +	    partitions.
> +	  * Select BR2_PACKAGE_ZLIB if you want to deal with zip compressed
> +	    archives.
> +
> +	  https://sbabic.github.io/swupdate
> +
> +if BR2_PACKAGE_SWUPDATE
> +
> +config BR2_PACKAGE_SWUPDATE_CONFIG
> +	string "swupdate configuration file"
> +	default "package/swupdate/swupdate.config"
> +	help
> +	  Path to the swupdate configuration file.
> +
> +	  I you wish to use your own modified swupdate configuration file
> +	  specify the config file location with this option.
> +
> +config BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE
> +	bool "install default website"
> +	default y
> +	help
> +	  Install the provided website to /var/www/swupdate.
> +
> +	  This is necessary if you want to run swupdate with the embedded
> +	  webserver and do not provide an own website to be installed to
> +	  /var/www/swupdate.
> +endif
> +
> +comment "swupdate needs a toolchain w/ threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/swupdate/swupdate.config b/package/swupdate/swupdate.config
> new file mode 100644
> index 0000000..bac7a58
> --- /dev/null
> +++ b/package/swupdate/swupdate.config
> @@ -0,0 +1,61 @@
> +#
> +# Automatically generated file; DO NOT EDIT.
> +# Swupdate Configuration
> +#
> +CONFIG_HAVE_DOT_CONFIG=y
> +
> +#
> +# Swupdate Settings
> +#
> +
> +#
> +# General Configuration
> +#
> +CONFIG_SCRIPTS=y
> +# CONFIG_HW_COMPATIBILITY is not set
> +# CONFIG_FEATURE_SYSLOG is not set
> +
> +#
> +# Build Options
> +#
> +# CONFIG_STATIC is not set
> +CONFIG_CROSS_COMPILE=""
> +CONFIG_SYSROOT=""
> +CONFIG_EXTRA_CFLAGS=""
> +CONFIG_EXTRA_LDFLAGS=""
> +CONFIG_EXTRA_LDLIBS=""
> +
> +#
> +# Debugging Options
> +#
> +# CONFIG_DEBUG is not set
> +# CONFIG_WERROR is not set
> +# CONFIG_NOCLEANUP is not set
> +CONFIG_WEBSERVER=y
> +
> +#
> +# Webserver Features
> +#
> +CONFIG_MONGOOSE=y
> +
> +#
> +# Mongoose Feature
> +#
> +CONFIG_MONGOOSEIPV6=y
> +
> +#
> +# Archival Features
> +#
> +CONFIG_CPIO=y
> +
> +#
> +# Parser Features
> +#
> +# CONFIG_SETSWDESCRIPTION is not set
> +
> +#
> +# Image Handlers
> +#
> +CONFIG_RAW=y
> +# CONFIG_SHELLSCRIPTHANDLER is not set
> +# CONFIG_UBOOT is not set
> diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
> new file mode 100644
> index 0000000..86bbf14
> --- /dev/null
> +++ b/package/swupdate/swupdate.mk
> @@ -0,0 +1,106 @@
> +################################################################################
> +#
> +# swupdate
> +#
> +################################################################################
> +
> +SWUPDATE_VERSION = 2015.07
> +SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
> +SWUPDATE_LICENSE = GPLv2+, MIT, Public Domain
> +SWUPDATE_LICENSE_FILES = COPYING
> +
> +# swupdate bundles its own version of mongoose (version 3.8) and
> +# lsqlite3 (version 0.8)
> +
> +ifeq ($(BR2_PACKAGE_JSON_C),y)
> +SWUPDATE_DEPENDENCIES += json-c
> +SWUPDATE_MAKE_ENV += HAVE_JSON_C=y
> +else
> +SWUPDATE_MAKE_ENV += HAVE_JSON_C=n
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBCONFIG),y)
> +SWUPDATE_DEPENDENCIES += libconfig
> +SWUPDATE_MAKE_ENV += HAVE_LIBCONFIG=y
> +else
> +SWUPDATE_MAKE_ENV += HAVE_LIBCONFIG=n
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBCURL),y)
> +SWUPDATE_DEPENDENCIES += libcurl
> +SWUPDATE_MAKE_ENV += HAVE_LIBCURL=y
> +else
> +SWUPDATE_MAKE_ENV += HAVE_LIBCURL=n
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LUA_5_2),y)
> +SWUPDATE_DEPENDENCIES += lua
> +SWUPDATE_MAKE_ENV += HAVE_LUA=y
> +else
> +SWUPDATE_MAKE_ENV += HAVE_LUA=n
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MTD),y)
> +SWUPDATE_DEPENDENCIES += mtd
> +SWUPDATE_MAKE_ENV += HAVE_LIBMTD=y
> +SWUPDATE_MAKE_ENV += HAVE_LIBUBI=y
> +else
> +SWUPDATE_MAKE_ENV += HAVE_LIBMTD=n
> +SWUPDATE_MAKE_ENV += HAVE_LIBUBI=n
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +SWUPDATE_DEPENDENCIES += openssl
> +SWUPDATE_MAKE_ENV += HAVE_LIBSSL=y
> +SWUPDATE_MAKE_ENV += HAVE_LIBCRYPTO=y
> +else
> +SWUPDATE_MAKE_ENV += HAVE_LIBSSL=n
> +SWUPDATE_MAKE_ENV += HAVE_LIBCRYPTO=n
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +SWUPDATE_DEPENDENCIES += zlib
> +SWUPDATE_MAKE_ENV += HAVE_ZLIB=y
> +else
> +SWUPDATE_MAKE_ENV += HAVE_ZLIB=n
> +endif
> +
> +SWUPDATE_BUILD_CONFIG = $(@D)/.config
> +
> +SWUPDATE_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_SWUPDATE_CONFIG))
> +SWUPDATE_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
> +
> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +define SWUPDATE_PREFER_STATIC
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_STATIC,$(SWUPDATE_BUILD_CONFIG))
> +endef
> +endif
> +
> +define SWUPDATE_SET_BUILD_OPTIONS
> +	$(call KCONFIG_SET_OPT,CONFIG_CROSS_COMPILE,"$(TARGET_CROSS)", \
> +		$(SWUPDATE_BUILD_CONFIG))
> +	$(call KCONFIG_SET_OPT,CONFIG_SYSROOT,"$(STAGING_DIR)", \
> +		$(SWUPDATE_BUILD_CONFIG))
> +	$(call KCONFIG_SET_OPT,CONFIG_EXTRA_CFLAGS,"$(TARGET_CFLAGS)", \
> +		$(SWUPDATE_BUILD_CONFIG))
> +	$(call KCONFIG_SET_OPT,CONFIG_EXTRA_LDFLAGS,"$(TARGET_LDFLAGS)", \
> +		$(SWUPDATE_BUILD_CONFIG))
> +endef
> +
> +define SWUPDATE_KCONFIG_FIXUP_CMDS
> +	$(SWUPDATE_PREFER_STATIC)
> +	$(SWUPDATE_SET_BUILD_OPTIONS)
> +endef
> +
> +define SWUPDATE_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define SWUPDATE_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/swupdate $(TARGET_DIR)/usr/bin/swupdate
> +	$(if $(BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE), \
> +		mkdir -p $(TARGET_DIR)/var/www/swupdate; \
> +		cp -dpf $(@D)/www/* $(TARGET_DIR)/var/www/swupdate)
> +endef
> +
> +$(eval $(kconfig-package))
> 
