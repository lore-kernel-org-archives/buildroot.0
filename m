From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Mar 2016 22:30:51 +0200
Subject: [Buildroot] [PATCH v2 2/2] core/pkg-kconfig: Use oldnoconfig
 when possible
In-Reply-To: <1459246302-21837-3-git-send-email-romain.izard.pro@gmail.com>
References: <1459246302-21837-1-git-send-email-romain.izard.pro@gmail.com>
 <1459246302-21837-3-git-send-email-romain.izard.pro@gmail.com>
Message-ID: <56FC377B.5090006@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/29/16 12:11, Romain Izard wrote:
> Using 'yes "" | make oldconfig' to regenerate a .config file from an
> existing defconfig does not work reliably in all cases. Specifically, it
> does not work well with tristate choice entries.
>
> The correct way to do it is to use 'make olddefconfig', but this target
> is not supported in projects that use an old version of kconfig. As
> most projects do not use tristate entries, there is no need for them to
> upgrade.
>
> 'oldnoconfig' is an alias for 'olddefconfig', but it also is the only
> name for this target between Linux versions 2.6.36 and 3.6.
>
> Try to use 'oldnoconfig' by default, using 'oldconfig' as a fallback
>
> Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
> ---
> Changelog:
> v1: new patch
> v2: Use oldnoconfig instead of olddefconfig
>      Fix silent mode
>      Change the pattern in both places where it is used
>      Use a macro to avoid redundancy
>
>   package/pkg-kconfig.mk | 22 ++++++++++++++++------
>   1 file changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> index 94ec3cc..08c3e9f 100644
> --- a/package/pkg-kconfig.mk
> +++ b/package/pkg-kconfig.mk
> @@ -57,11 +57,23 @@ $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch
>   		fi; \
>   	done
>
> +# The correct way to regenerate a .config file is to use 'make olddefconfig'.
> +# For historical reasons, the target name is 'oldnoconfig' between Linux kernel
> +# versions 2.6.36 and 3.6, and remains as an alias in later versions.
> +# In older versions, and in some other projects that use kconfig, the target is
> +# not supported at all, and we use 'yes "" | make oldconfig' as a fallback
> +# only, as this can fail in complex cases.
> +define $(2)_REGEN_DOT_CONFIG
> +	$$(Q)$$($2_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
> +		$$($(2)_KCONFIG_OPTS) oldnoconfig || \

  $$($2_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) $$($(2)_KCONFIG_OPTS) is used so 
often that it would be worth putting it in a separate variable. But that's a 
separate patch.

> +		(yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
> +			$$($(2)_KCONFIG_OPTS) oldconfig)
> +endef
> +
>   # The specified source configuration file and any additional configuration file
>   # fragments are merged together to .config, after the package has been patched.
>   # Since the file could be a defconfig file it needs to be expanded to a
> -# full .config first. We use 'make oldconfig' because this can be safely
> -# done even when the package does not support defconfigs.
> +# full .config first.
>   $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
>   	$$(Q)$$(if $$($(2)_KCONFIG_DEFCONFIG), \
>   		$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
> @@ -69,8 +81,7 @@ $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
>   		cp $$($(2)_KCONFIG_FILE) $$(@))
>   	$$(Q)support/kconfig/merge_config.sh -m -O $$(@D) \
>   		$$(@) $$($(2)_KCONFIG_FRAGMENT_FILES)
> -	$$(Q)yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
> -		$$($(2)_KCONFIG_OPTS) oldconfig
> +	$$(call $(2)_REGEN_DOT_CONFIG)

  call is not needed here because there are no arguments. Just use 
$$($(2)_REGEN_DOT_CONFIG).

  Otherwise looks good to me, so after removing the call (below as well) you can 
add my Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Regards,
  Arnout

>
>   # If _KCONFIG_FILE or _KCONFIG_FRAGMENT_FILES exists, this dependency is
>   # already implied, but if we only have a _KCONFIG_DEFCONFIG we have to add
> @@ -81,8 +92,7 @@ $$($(2)_DIR)/.config: | $(1)-patch
>   # The exact rules are specified by the package .mk file.
>   define $(2)_FIXUP_DOT_CONFIG
>   	$$($(2)_KCONFIG_FIXUP_CMDS)
> -	$$(Q)yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
> -		$$($(2)_KCONFIG_OPTS) oldconfig
> +	$$(call $(2)_REGEN_DOT_CONFIG)
>   	$$(Q)touch $$($(2)_DIR)/.stamp_kconfig_fixup_done
>   endef
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
