From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jul 2016 18:37:24 +0200
Subject: [Buildroot] [PATCH 2/2] docs/manual: document meson-based
 packages
In-Reply-To: <1468072147-17509-3-git-send-email-eric.le.bihan.dev@free.fr>
References: <1468072147-17509-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1468072147-17509-3-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20160717163724.GN3614@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

?ric, All,

On 2016-07-09 15:49 +0200, Eric Le Bihan spake thusly:
> Add instructions for adding a package which uses the Meson build system.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  docs/manual/adding-packages-meson.txt | 84 +++++++++++++++++++++++++++++++++++
>  docs/manual/adding-packages.txt       |  2 +
>  2 files changed, 86 insertions(+)
>  create mode 100644 docs/manual/adding-packages-meson.txt
> 
> diff --git a/docs/manual/adding-packages-meson.txt b/docs/manual/adding-packages-meson.txt
> new file mode 100644
> index 0000000..85457b7
> --- /dev/null
> +++ b/docs/manual/adding-packages-meson.txt
> @@ -0,0 +1,84 @@
> +// -*- mode:doc; -*-
> +// vim: set syntax=asciidoc:
> +
> +=== Integration of Meson-based packages
> +
> +[[meson-package-tutorial]]
> +
> +==== +meson-package+ tutorial
> +
> +http://mesonbuild.com[Meson] is an open source build system meant to be both
> +extremely fast, and, even more importantly, as user friendly as possible.
> +
> +Buildroot does not (yet) provide a dedicated package infrastructure for
> +meson-based packages.

So why not provide one? A new infra is not trivial to write, indeed, but
given your example, the meson-package does not look like it is a complex
one to write (see below).

However, considering that we have no package that use meson yet, and
that you do not plan on sending one shortly, what's the point in having
either an infra or even this documentation?

> So, we will explain how to write a +.mk+ file for such a
> +package. Let's start with an example:
> +
> +------------------------------
> +01: ################################################################################
> +02: #
> +03: # foo
> +04: #
> +05: ################################################################################
> +06:
> +07: FOO_VERSION = 1.0
> +08: FOO_SOURCE = foo-$(FOO_VERSION).tar.gz
> +09: FOO_SITE = http://www.foosoftware.org/download
> +10: FOO_LICENSE = GPLv3+
> +11: FOO_LICENSE_FILES = COPYING
> +12:
> +13: FOO_DEPENDENCIES = host-meson host-pkgconf bar
> +14:
> +15: ifeq ($(BR2_ENABLE_DEBUG),y)
> +16: FOO_MESON_MODE = debug
> +17: else
> +18: FOO_MESON_MODE = release
> +19: endif
> +20:
> +21: FOO_MESON_OPTS += \
> +22: 	--prefix=/usr \
> +23: 	--buildtype $(FOO_MESON_MODE) \
> +24: 	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf
> +25:
> +26: define FOO_CONFIGURE_CMDS
> +27: 	rm -rf $(@D)/build
> +28: 	mkdir -p $(@D)/build
> +29: 	$(TARGET_MAKE_ENV) meson.py $(FOO_MESON_OPTS) $(@D) $(@D)/build
> +30: endef
> +31:
> +32: define FOO_BUILD_CMDS
> +33: 	$(TARGET_MAKE_ENV) ninja -C $(@D)/build
> +34: endef
> +35:
> +36: define FOO_INSTALL_TARGET_CMDS
> +37: 	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) ninja -C $(@D)/build install
> +38: endef

It really looks very easy to write such an infra (totally untested, and
for taget packages only, assuming no host package wil use meson):

    define inner-meson-package

    ifndef $(2)_CONFIGURE_CMDS
    define $(2)_CONFIGURE_CMDS
        mkdir -p $$(@D)/build
        $$(TARGET_MAKE_ENV) meson.py \
            --prefix=/usr \
            --buildtype $$(if $$(BR2_ENABLE_DEBUG),debug,release) \
            --cross-file $$(HOST_DIR)/etc/meson/cross-compilation.conf \
            $$($(2)_CONF_OPTS) \
            $$(@D) \
            $$(@D)/build
    endef
    endif

    ifndef $(2)_BUILD_CMDS
    define $(2)_BUILD_CMDS
        $$(TARGET_MAKE_ENV) $$($(2)_MAKE_ENV) \
        ninja -C $$(@D)/build
    endef
    endif

    ifndef $(2)_INSTALL_STAGING_CMDS
    define $(2)_INSTALL_STAGING_CMDS
        $$(TARGET_MAKE_ENV) $$($(2)_MAKE_ENV) DESTDIR=$$(STAGING_DIR) \
        ninja -C $(@D)/build install
    endif
    endif

    ifndef $(2)_INSTALL_TARGET_CMDS
    define $(2)_INSTALL_TARGET_CMDS
        $$(TARGET_MAKE_ENV) $$($(2)_MAKE_ENV) DESTDIR=$$(TARGET_DIR) \
        ninja -C $(@D)/build install
    endif
    endif

    $(call inner-generic-package,$(1),$(2),$(3),$(4))

    endef # inner-meson-package

    meson-package = $(call inner-meson-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)

Look at the existing infras for how they handle the host variants.

Again, totally untested as I wrote it directly in this mail...

Regards,
Yann E. MORIN.

> +40: $(eval $(generic-package))
> +--------------------------------
> +
> +The Makefile starts with the definition of the standard variables for package
> +declaration (lines 7 to 11).
> +
> +As seen in line 40, it is based on the
> +xref:generic-package-tutorial[+generic-package+ infrastructure]. So, it defines
> +the variables required by this particular infrastructure, where Meson and its
> +companion tool, Ninja, are invoked:
> +
> +* +FOO_CONFIGURE_CMDS+: the build directory required by Meson is created, and
> +  Meson is invoked to generate the Ninja build file. The options required to
> +  configure the cross-compilation of the package are passed via +FOO_MESON_OPTS+.
> +
> +* +FOO_BUILD_CMDS+: Ninja is invoked to perform the build.
> +
> +* +FOO_INSTALL_TARGET_CMDS+: Ninja is invoked to install the files generated
> +  during the build step.
> +
> +In order to have Meson available for the build, +FOO_DEPENDENCIES+ needs to
> +contain +host-meson+. In the example, +host-pkgconf+ and +bar+ are also
> +declared as dependencies because the Meson build file of +foo+ uses `pkg-config`
> +to determine the compilation flags and libraries of package +bar+.
> +
> +To sum it up, to add a new meson-based package, the Makefile example can be
> +copied verbatim then edited to replace all occurences of +FOO+ with the uppercase
> +name of the new package and update the values of the standard variables.
> diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
> index 76f90c9..8b80a63 100644
> --- a/docs/manual/adding-packages.txt
> +++ b/docs/manual/adding-packages.txt
> @@ -29,6 +29,8 @@ include::adding-packages-kconfig.txt[]
>  
>  include::adding-packages-rebar.txt[]
>  
> +include::adding-packages-meson.txt[]
> +
>  include::adding-packages-kernel-module.txt[]
>  
>  include::adding-packages-asciidoc.txt[]
> -- 
> 2.4.11
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
