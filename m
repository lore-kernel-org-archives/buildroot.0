From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 3 Mar 2014 20:38:12 +0100
Subject: [Buildroot] [PATCH] directfb-lua: new package
In-Reply-To: <1375126587-983-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1375126587-983-1-git-send-email-ezequiel.garcia@free-electrons.com>
Message-ID: <CAB0FRsthGUWRVH-FhcFeN7Jd6m_nSsZNCa_a+Q25-R-1vCeD3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013-07-29 21:36 GMT+02:00 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>:
> This is a Lua binding to DirectFB. It is an automated binding
> generated from the DirectFB headers, so it generates an identical
> API to DirectFB's, only simpler to use.
>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>  package/Config.in                    |  1 +
>  package/directfb-lua/Config.in       | 10 ++++++++++
>  package/directfb-lua/directfb-lua.mk | 23 +++++++++++++++++++++++
>  3 files changed, 34 insertions(+)
>  create mode 100644 package/directfb-lua/Config.in
>  create mode 100644 package/directfb-lua/directfb-lua.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 6d5ff01..dcaac4c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -120,6 +120,7 @@ comment "graphic libraries"
>  source "package/cegui06/Config.in"
>  source "package/directfb/Config.in"
>  source "package/directfb-examples/Config.in"
> +source "package/directfb-lua/Config.in"

This is not the right place. directfb-lua must be inserted in the Lua
modules section, just after 'dado'.

>  source "package/divine/Config.in"
>  source "package/fbdump/Config.in"
>  source "package/fbgrab/Config.in"
> diff --git a/package/directfb-lua/Config.in b/package/directfb-lua/Config.in
> new file mode 100644
> index 0000000..7f941f9
> --- /dev/null
> +++ b/package/directfb-lua/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_DIRECTFB_LUA
> +       bool "directfb-lua"
> +       depends on BR2_PACKAGE_DIRECTFB
> +       depends on BR2_PACKAGE_LUA

The dependency with Lua is implicit in the Lua modules section.
The dependency with DirectFB must be rewritten like this :

    select BR2_PACKAGE_DIRECTFB
    depends on BR2_TOOLCHAIN_HAS_THREADS # directfb
    depends on BR2_INSTALL_LIBSTDCPP # directfb

with this comment statement at the end of the file :

comment "directfb-lua needs a toolchain w/ C++, threads"
    depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP

> +       help
> +         directfb-lua is a Lua binding to DirectFB. It is an automated binding
> +         generated from the DirectFB headers. This means it generates an API
> +         identical to the DirectFB's, only easier to use.
> +
> +         https://github.com/ezequielgarcia/directfb-lua
> diff --git a/package/directfb-lua/directfb-lua.mk b/package/directfb-lua/directfb-lua.mk
> new file mode 100644
> index 0000000..f975a55
> --- /dev/null
> +++ b/package/directfb-lua/directfb-lua.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# directfb-lua
> +#
> +################################################################################
> +
> +DIRECTFB_LUA_VERSION = v0.2.1
> +DIRECTFB_LUA_SITE = https://github.com/ezequielgarcia/directfb-lua/tarball/$(DIRECTFB_LUA_VERSION)

Now, Buildroot has a Github helper.
DIRECTFB_LUA_SITE = $(call
github,ezequielgarcia,directfb-lua,$(DIRECTFB_LUA_VERSION))

> +DIRECTFB_LUA_LICENSE = MIT
> +DIRECTFB_LUA_LICENSE_FILES = COPYING
> +DIRECTFB_LUA_DEPENDENCIES = directfb lua

Now, Buildroot has various Lua interpreters, and directfb-lua could be
build with all of them.
DIRECTFB_LUA_DEPENDENCIES = directfb luainterpreter

> +
> +define DIRECTFB_LUA_BUILD_CMDS
> +       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) gen
> +       $(TARGET_MAKE_ENV) CROSS_COMPILE="$(TARGET_CROSS)" $(MAKE) -C $(@D)
> +endef
> +
> +define DIRECTFB_LUA_INSTALL_TARGET_CMDS
> +       $(TARGET_MAKE_ENV) INSTALL_DIR="$(TARGET_DIR)/usr/lib/lua" \

At this time :
     INSTALL_DIR="$(TARGET_DIR)/usr/lib/lua/$(LUAINTERPRETER_ABIVER)"

Fran?ois

> +               $(MAKE) -C $(@D) install
> +endef
> +
> +$(eval $(generic-package))
> --
> 1.8.1.5
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
