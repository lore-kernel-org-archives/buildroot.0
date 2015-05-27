From: Mike Williams <mike@mikebwilliams.com>
Date: Wed, 27 May 2015 15:54:05 -0400
Subject: [Buildroot] [PATCH v6 1/1] package/swupdate: new package
In-Reply-To: <1430776270-13097-1-git-send-email-joerg.krause@embedded.rocks>
References: <1430776270-13097-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <CANPyyuNGgnXAwx97NSNpO1S+VXSvAQZsE0RnSeF1sXQtXjif=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg,

I tested v5 and it worked fine for me. However, I removed the
dependency on zlib and json-c, I don't use them.

Thanks,
Mike

On Mon, May 4, 2015 at 5:51 PM, J?rg Krause <joerg.krause@embedded.rocks> wrote:
> This patch is based on an WIP version submitted by Romain Naour, commented by
> Arnout Vandecappelle:
> https://patchwork.ozlabs.org/patch/401270/
>
> We use the latest commit of swupdate instead of the last release 2014.07 to
> obtain several bug fixes and get support for the image downloading feature and
> the JSON parser.
>
> The package build file does not detect which dependencies are available. So we
> provide a default configuration which selects the external dependencies by
> default except for lua. Lua support can be added by the user by customizing
> the configuration file (swupdate.config) add select the Lua 5.2 interpreter
> manually.
>
> Furthermore the U-Boot handler is not enabled by default, as it may cause
> runtime issues if the U-Boot environment configuration file (fw_env.config) is
> not present on the target system.
>
> The package provides a default website which can be installed to the target to
> enable firmware update within a browser.
>
> Add a patch file with two squashed fixes for building swupdate with the musl C
> library. Both fixes sent upstream.
>
> Note, swupdate does not implement a savedefconfig and nconfig target.
> Note, swupdate provides its own versions of mongoose and lsqlite3:
>   - mongoose is version 3.8 from year 2013
>   - lsqlite3 is version 0.8 from year 2011
>
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> Cc: Romain Naour <romain.naour@openwide.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Tested-by: Mike Williams <mike@mikebwilliams.com>
> ---
> Changes v5 -> v6:
>   - bump to latest commit 3a6c0ea466f9b5e97ada7a97f8cea939da3c04bc
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
>  package/Config.in                |  1 +
>  package/swupdate/Config.in       | 42 ++++++++++++++++++++
>  package/swupdate/swupdate.config | 83 ++++++++++++++++++++++++++++++++++++++++
>  package/swupdate/swupdate.mk     | 54 ++++++++++++++++++++++++++
>  4 files changed, 180 insertions(+)
>  create mode 100644 package/swupdate/Config.in
>  create mode 100644 package/swupdate/swupdate.config
>  create mode 100644 package/swupdate/swupdate.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index af4d2b7..f4462b2 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1412,6 +1412,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>         source "package/start-stop-daemon/Config.in"
>  endif
>         source "package/supervisor/Config.in"
> +       source "package/swupdate/Config.in"
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>         source "package/sysklogd/Config.in"
>  endif
> diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
> new file mode 100644
> index 0000000..520fc87
> --- /dev/null
> +++ b/package/swupdate/Config.in
> @@ -0,0 +1,42 @@
> +config BR2_PACKAGE_SWUPDATE
> +       bool "swupdate"
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # OpenSSL
> +       select BR2_PACKAGE_JSON_C
> +       select BR2_PACKAGE_LIBCONFIG
> +       select BR2_PACKAGE_LIBCURL
> +       select BR2_PACKAGE_MTD
> +       select BR2_PACKAGE_OPENSSL
> +       select BR2_PACKAGE_ZLIB
> +       help
> +         swupdate provides a reliable way to update the software on an
> +         embedded system.
> +
> +         https://sbabic.github.io/swupdate
> +
> +if BR2_PACKAGE_SWUPDATE
> +
> +config BR2_PACKAGE_SWUPDATE_CONFIG
> +       string "swupdate configuration file"
> +       default "package/swupdate/swupdate.config"
> +       help
> +         The default swupdate configuration file will enable swupdate with
> +         an image downloader and a webserver, a parser based on libconfig and
> +         a JSON parser, as well as handlers for UBI volumes, raw NAND or NOR
> +         flash, SD cards and shell scripts.
> +
> +         Most people will just use the default swupdate configuration file.
> +         However, some people may wish to use their own modified swupdate
> +         configuration file, and will specify their config file location
> +         with this option.
> +
> +         Note that if you add lua support in the configuration file you need
> +         the Lua 5.2 interpreter (BR_PACKAGE_LUA_5_2) manually.
> +
> +config BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE
> +       bool "install default website"
> +       help
> +         Install the provided website to /var/www/swupdate.
> +endif
> +
> +comment "swupate support needs toolchain w/ threads"
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/swupdate/swupdate.config b/package/swupdate/swupdate.config
> new file mode 100644
> index 0000000..dbd8a52
> --- /dev/null
> +++ b/package/swupdate/swupdate.config
> @@ -0,0 +1,83 @@
> +#
> +# Automatically generated make config: don't edit
> +# swupdate version: 2014.07.0
> +# Mon May  4 21:05:28 2015
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
> +CONFIG_HW_COMPATIBILITY_FILE=""
> +# CONFIG_LUA is not set
> +# CONFIG_FEATURE_SYSLOG is not set
> +
> +#
> +# Build Options
> +#
> +# CONFIG_STATIC is not set
> +CONFIG_CROSS_COMPILER_PREFIX=""
> +CONFIG_SYSROOT=""
> +CONFIG_EXTRA_CFLAGS=""
> +CONFIG_EXTRA_LDFLAGS=""
> +CONFIG_EXTRA_LDLIBS=""
> +
> +#
> +# Debugging Options
> +#
> +# CONFIG_DEBUG is not set
> +# CONFIG_DEBUG_PESSIMIZE is not set
> +# CONFIG_WERROR is not set
> +# CONFIG_NOCLEANUP is not set
> +CONFIG_DOWNLOAD=y
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
> +# CONFIG_MONGOOSELUA is not set
> +# CONFIG_MONGOOSESQL is not set
> +CONFIG_MONGOOSEIPV6=y
> +CONFIG_MONGOOSESSL=y
> +
> +#
> +# Archival Features
> +#
> +CONFIG_CPIO=y
> +CONFIG_GUNZIP=y
> +
> +#
> +# Parser Features
> +#
> +CONFIG_LIBCONFIG=y
> +CONFIG_JSON=y
> +# CONFIG_LUAEXTERNAL is not set
> +# CONFIG_SETEXTPARSERNAME is not set
> +CONFIG_EXTPARSERNAME=""
> +# CONFIG_SETSWDESCRIPTION is not set
> +CONFIG_SWDESCRIPTION=""
> +
> +#
> +# Image Handlers
> +#
> +CONFIG_UBIVOL=y
> +CONFIG_UBIBLACKLIST=""
> +CONFIG_UBIVIDOFFSET=0
> +CONFIG_CFI=y
> +CONFIG_RAW=y
> +# CONFIG_LUASCRIPTHANDLER is not set
> +CONFIG_SHELLSCRIPTHANDLER=y
> +# CONFIG_HANDLER_IN_LUA is not set
> +# CONFIG_UBOOT is not set
> +CONFIG_UBOOT_FWENV=""
> diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
> new file mode 100644
> index 0000000..e555f3e
> --- /dev/null
> +++ b/package/swupdate/swupdate.mk
> @@ -0,0 +1,54 @@
> +################################################################################
> +#
> +# swupdate
> +#
> +################################################################################
> +
> +SWUPDATE_VERSION = 3a6c0ea466f9b5e97ada7a97f8cea939da3c04bc
> +SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
> +SWUPDATE_LICENSE = GPLv2+, MIT, Public Domain
> +SWUPDATE_LICENSE_FILES = COPYING
> +
> +# swupdate bundles its own version of mongoose (version 3.8) and
> +# lsqlite3 (version 0.8)
> +SWUPDATE_DEPENDENCIES = json-c libconfig libcurl mtd openssl zlib
> +
> +SWUPDATE_BUILD_CONFIG = $(@D)/.config
> +
> +SWUPDATE_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_SWUPDATE_CONFIG))
> +SWUPDATE_KCONFIG_EDITORS = menuconfig xconfig gconfig
> +
> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +define SWUPDATE_PREFER_STATIC
> +       $(call KCONFIG_ENABLE_OPT,CONFIG_STATIC,$(SWUPDATE_BUILD_CONFIG))
> +endef
> +endif
> +
> +define SWUPDATE_SET_BUILD_OPTIONS
> +       $(call KCONFIG_SET_OPT,CONFIG_CROSS_COMPILER_PREFIX,"$(TARGET_CROSS)", \
> +               $(SWUPDATE_BUILD_CONFIG))
> +       $(call KCONFIG_SET_OPT,CONFIG_SYSROOT,"$(STAGING_DIR)", \
> +               $(SWUPDATE_BUILD_CONFIG))
> +       $(call KCONFIG_SET_OPT,CONFIG_EXTRA_CFLAGS,"$(TARGET_CFLAGS)", \
> +               $(SWUPDATE_BUILD_CONFIG))
> +       $(call KCONFIG_SET_OPT,CONFIG_EXTRA_LDFLAGS,"$(TARGET_LDFLAGS)", \
> +               $(SWUPDATE_BUILD_CONFIG))
> +endef
> +
> +define SWUPDATE_KCONFIG_FIXUP_CMDS
> +       $(SWUPDATE_PREFER_STATIC)
> +       $(SWUPDATE_SET_BUILD_OPTIONS)
> +endef
> +
> +define SWUPDATE_BUILD_CMDS
> +       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define SWUPDATE_INSTALL_TARGET_CMDS
> +       $(INSTALL) -D -m 0755 $(@D)/swupdate $(TARGET_DIR)/usr/bin/swupdate
> +       $(if $(BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE), \
> +               mkdir -p $(TARGET_DIR)/var/www/swupdate; \
> +               cp -dpf $(@D)/www/* $(TARGET_DIR)/var/www/swupdate)
> +endef
> +
> +$(eval $(kconfig-package))
> --
> 2.3.7
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
