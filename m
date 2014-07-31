From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Jul 2014 22:42:01 +0200
Subject: [Buildroot] [PATCH 1 of 6 v2] infra: introduce a
 kconfig-package infrastructure
In-Reply-To: <83a2e5f2641a58449f47.1406750282@localhost>
References: <patchbomb.1406750281@localhost>
 <83a2e5f2641a58449f47.1406750282@localhost>
Message-ID: <20140731204201.GG3960@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-30 21:58 +0200, Thomas De Schampheleire spake thusly:
[--SNIP--]
> diff -r 4ee2201e6e6b -r 83a2e5f2641a package/pkg-kconfig.mk
> --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
> +++ b/package/pkg-kconfig.mk	Mon Jun 30 21:08:13 2014 +0200
> @@ -0,0 +1,82 @@
[--SNIP--]
> +# The .config file is obtained by copying it from the specified source
> +# configuration file, after the package has been patched.
> +
> +$$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) | $(1)-patch
> +	$$(INSTALL) -m 0644 $$($(2)_KCONFIG_FILE) $$($(2)_DIR)/.config
> +
> +# In order to get a usable, consistent configuration, some fixup may be needed.
> +# The exact rules are specified by the package .mk file.
> +
> +$$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/.config
> +	$$($(2)_KCONFIG_FIXUP_CMDS)
> +	$$(Q)touch $$@
> +
> +# Before running configure, the configuration file should be present and fixed
> +
> +$$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
> +
> +# Configuration editors (menuconfig, ...)
> +
> +$$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $$($(2)_DIR)/.config

Should we not depend on .stamp_kconfig_fixup_done instead of .config, so
we present to the user a .config that is already tweak to our needs?

Regards,
Yann E. MORIN.

> +	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
> +		$$($(2)_KCONFIG_OPT) $$(subst $(1)-,,$$@)
> +	rm -f $$($(2)_DIR)/.stamp_{kconfig_fixup_done,configured,built}
> +	rm -f $$($(2)_DIR)/.stamp_{target,staging}_installed
> +
> +# Target to copy back the configuration to the source configuration file
> +
> +$(1)-update-config: $$($(2)_DIR)/.stamp_kconfig_fixup_done
> +	cp -f $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
> +
> +endef # inner-kconfig-package
> +
> +################################################################################
> +# kconfig-package -- the target generator macro for kconfig packages
> +################################################################################
> +
> +kconfig-package = $(call inner-kconfig-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)))
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
