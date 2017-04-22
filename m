From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Apr 2017 09:44:41 +0200
Subject: [Buildroot] [PATCH v5 06/34] package/kodi-jsonschemabuilder:
 new host package
In-Reply-To: <20170417195433.26672-7-bernd.kuhls@t-online.de>
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
 <20170417195433.26672-7-bernd.kuhls@t-online.de>
Message-ID: <20170422074441.GE15086@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-04-17 21:54 +0200, Bernd Kuhls spake thusly:
> Needed for upcoming kodi version bump to 17.1-Krypton which will also
> switch the kodi build system to CMake.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../kodi-jsonschemabuilder.hash                    |  1 +
>  .../kodi-jsonschemabuilder.mk                      | 23 ++++++++++++++++++++++
>  .../0001-texturepacker.patch}                      |  0
>  package/kodi/kodi.hash                             |  1 +
>  4 files changed, 25 insertions(+)
>  create mode 120000 package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.hash
>  create mode 100644 package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
>  rename package/{kodi/0002-texturepacker.patch => kodi-texturepacker/0001-texturepacker.patch} (100%)
> 
> diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.hash b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.hash
> new file mode 120000
> index 000000000..92a75949b
> --- /dev/null
> +++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.hash
> @@ -0,0 +1 @@
> +/home/bernd/buildroot/br8_ffmpeg3_kodi17_github/package/kodi/kodi.hash
> \ No newline at end of file
> diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
> new file mode 100644
> index 000000000..97ba44426
> --- /dev/null
> +++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# kodi-jsonschemabuilder
> +#
> +################################################################################
> +
> +# Not possible to directly refer to kodi variables, because of
> +# first/second expansion trickery...
> +HOST_KODI_JSONSCHEMABUILDER_VERSION = 17.1-Krypton
> +HOST_KODI_JSONSCHEMABUILDER_SITE = $(call github,xbmc,xbmc,$(HOST_KODI_JSONSCHEMABUILDER_VERSION))
> +HOST_KODI_JSONSCHEMABUILDER_LICENSE = GPLv2
> +HOST_KODI_JSONSCHEMABUILDER_LICENSE_FILES = LICENSE.GPL

Even for host-only packages we still set the non-prefixed variables for
the basic stuff like version, site and so on, and only use the prefixed
variables that are used for the build:

    KODI_JSONSCHEMABUILDER_VERSION = 17.1-Krypton
    KODI_JSONSCHEMABUILDER_SITE = $(call github,xbmc,xbmc,$(HOST_KODI_JSONSCHEMABUILDER_VERSION))
    KODI_JSONSCHEMABUILDER_LICENSE = GPLv2
    KODI_JSONSCHEMABUILDER_LICENSE_FILES = LICENSE.GPL

> +HOST_KODI_JSONSCHEMABUILDER_SUBDIR = tools/depends/native/JsonSchemaBuilder
> +
> +HOST_KODI_JSONSCHEMABUILDER_CONF_OPTS += \
> +	-DCMAKE_MODULE_PATH=$(@D)/project/cmake/modules
> +
> +HOST_KODI_JSONSCHEMABUILDER_INSTALL_CMDS = \
> +	$(INSTALL) -m 755 -D \
> +		$(@D)/tools/depends/native/JsonSchemaBuilder/JsonSchemaBuilder \
> +		$(HOST_DIR)/usr/bin/JsonSchemaBuilder

Please use a define block here, like we do virtually everywhere and like
it is documented in the manual:

    define HOST_KODI_JSONSCHEMABUILDER_INSTALL_CMDS
        $(INSTALL) -m 755 -D \
            $(@D)/tools/depends/native/JsonSchemaBuilder/JsonSchemaBuilder \
            $(HOST_DIR)/usr/bin/JsonSchemaBuilder
    endef

However, this is using the same code as Kodi itself. Can't you just add
a host variant to kodi, that installs this utility?

Regards,
Yann E. MORIN.

> +$(eval $(host-cmake-package))
> diff --git a/package/kodi/0002-texturepacker.patch b/package/kodi-texturepacker/0001-texturepacker.patch
> similarity index 100%
> rename from package/kodi/0002-texturepacker.patch
> rename to package/kodi-texturepacker/0001-texturepacker.patch
> diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
> index 5aa580ec7..b910af2d8 100644
> --- a/package/kodi/kodi.hash
> +++ b/package/kodi/kodi.hash
> @@ -1,2 +1,3 @@
>  # Locally computed
>  sha256	7d82c8aff2715c83deecdf10c566e26105bec0473af530a1356d4c747ebdfd10	kodi-16.1-Jarvis.tar.gz
> +sha256 303f3903cbb57ccc2961f09cf3746505542bcb129a464f0687d7ca8601cebbee  kodi-jsonschemabuilder-17.1-Krypton.tar.gz
> -- 
> 2.11.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
