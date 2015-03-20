From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Mar 2015 00:14:14 +0100
Subject: [Buildroot] [PATCH 1/5] kconfig-package: add support for config
 fragments
In-Reply-To: <1424003638-21689-1-git-send-email-bos@je-eigen-domein.nl>
References: <1424003638-21689-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20150320231414.GF3979@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Floris, All,

On 2015-02-15 13:33 +0100, Floris Bos spake thusly:
> Adds functionality to the kconfig infrastructure to merge additional
> configuration fragment files to the main configuration file of
> kconfig packages, using support/kconfig/merge_config.sh
> 
> Typical use-case is when you want your configuration to be
> kept in sync with an upstream (def)config file, but do require
> some minor local modifications.
> 
> Disables -update-config and -update-defconfig targets when
> fragment files are set.

BTW, you forgot to document that in the manual, see:
    docs/manual/adding-packages-kconfig.txt

Regards,
Yann E. MORIN.

> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> ---
>  package/pkg-kconfig.mk | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> index 04ac37d..18eee76 100644
> --- a/package/pkg-kconfig.mk
> +++ b/package/pkg-kconfig.mk
> @@ -35,6 +35,7 @@ $(call inner-generic-package,$(1),$(2),$(3),$(4))
>  $(2)_KCONFIG_EDITORS ?= menuconfig
>  $(2)_KCONFIG_OPTS ?=
>  $(2)_KCONFIG_FIXUP_CMDS ?=
> +$(2)_KCONFIG_FRAGMENT_FILES ?=
>  
>  # FOO_KCONFIG_FILE is required
>  ifndef $(2)_KCONFIG_FILE
> @@ -45,13 +46,14 @@ endif
>  # be extracted (and patched) first
>  $$($(2)_KCONFIG_FILE): | $(1)-patch
>  
> -# The .config file is obtained by copying it from the specified source
> -# configuration file, after the package has been patched.
> +# The specified source configuration file and any additional configuration file
> +# fragments are merged together to .config, after the package has been patched.
>  # Since the file could be a defconfig file it needs to be expanded to a
>  # full .config first. We use 'make oldconfig' because this can be safely
>  # done even when the package does not support defconfigs.
> -$$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE)
> -	$$(INSTALL) -m 0644 $$($(2)_KCONFIG_FILE) $$($(2)_DIR)/.config
> +$$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
> +	support/kconfig/merge_config.sh -m -O $$(@D) \
> +		$$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
>  	@yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
>  		$$($(2)_KCONFIG_OPTS) oldconfig
>  
> @@ -87,6 +89,8 @@ $(1)-savedefconfig: $$($(2)_DIR)/.stamp_kconfig_fixup_done
>  # Even though we could use 'cp --preserve-timestamps' here, the separate
>  # cp and 'touch --reference' is used for symmetry with $(1)-update-defconfig.
>  $(1)-update-config: $$($(2)_DIR)/.stamp_kconfig_fixup_done
> +	$$(if $$($(2)_KCONFIG_FRAGMENT_FILES), \
> +		$$(error Unable to perform $(1)-update-config when fragment files are set))
>  	cp -f $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
>  	touch --reference $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
>  
> @@ -95,6 +99,8 @@ $(1)-update-config: $$($(2)_DIR)/.stamp_kconfig_fixup_done
>  # $(1)-update-config, the reference for 'touch' is _not_ the file from which
>  # we copy.
>  $(1)-update-defconfig: $(1)-savedefconfig
> +	$$(if $$($(2)_KCONFIG_FRAGMENT_FILES), \
> +		$$(error Unable to perform $(1)-update-defconfig when fragment files are set))
>  	cp -f $$($(2)_DIR)/defconfig $$($(2)_KCONFIG_FILE)
>  	touch --reference $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
>  
> -- 
> 1.9.1
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
