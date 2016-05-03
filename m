From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 3 May 2016 23:20:39 +0200
Subject: [Buildroot] [PATCH v8] core/pkg-kconfig: Use olddefconfig when
	available
In-Reply-To: <1462178199-21742-1-git-send-email-romain.izard.pro@gmail.com>
References: <1462178199-21742-1-git-send-email-romain.izard.pro@gmail.com>
Message-ID: <3d1045a9-c349-6195-34a8-f69c074dfaaa@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/02/16 10:36, Romain Izard wrote:
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
> Check which targets are supported by the current project, and use the
> appropriate method to regenerate the .config file.
>
> Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  We definitely want this in 2016.05.

> ---
> Changelog:
> v1: New patch
> v2: Use oldnoconfig instead of olddefconfig
>     Fix silent mode
>     Change the pattern in both places where it is used
>     Use a macro to avoid redundancy
> v3: Do not use $(call ...)
>     Use the $(2)_KCONFIG_MAKE variable
> v4: No change
> v5: Detect available methods and use the most recent one
> v6: Remove colon from matched rule names
> v7: Shell-based conditons, does not work with backticks
> v8: Return to v6, with more comments
>
>  package/pkg-kconfig.mk | 34 ++++++++++++++++++++++++++++++----
>  1 file changed, 30 insertions(+), 4 deletions(-)
>
> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> index 4033915..f32a198 100644
> --- a/package/pkg-kconfig.mk
> +++ b/package/pkg-kconfig.mk
> @@ -60,18 +60,44 @@ $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch
>  $(2)_KCONFIG_MAKE = \
>  	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) $$($(2)_KCONFIG_OPTS)
>
> +# $(2)_KCONFIG_MAKE may already rely on shell expansion. As the $() syntax
> +# of the shell conflicts with Make's own syntax, this means that backticks
> +# are used with those shell constructs. Unfortunately, the backtick syntax
> +# does not nest, and we need to use Make instead of the shell to handle
> +# conditions.
> +
> +# A recursively expanded variable is necessary, to be sure that the shell
> +# command is called when the rule is processed during the build and not
> +# when the rule is created when parsing all packages.
> +$(2)_KCONFIG_RULES = \
> +	$$(shell $$($(2)_KCONFIG_MAKE) -pn config 2>/dev/null | \
> +		sed 's/^\([_0-9a-zA-Z]*config\):.*/\1/ p; d')
> +
> +# The correct way to regenerate a .config file is to use 'make olddefconfig'.
> +# For historical reasons, the target name is 'oldnoconfig' between Linux kernel
> +# versions 2.6.36 and 3.6, and remains as an alias in later versions.
> +# In older versions, and in some other projects that use kconfig, the target is
> +# not supported at all, and we use 'yes "" | make oldconfig' as a fallback
> +# only, as this can fail in complex cases.
> +define $(2)_REGEN_DOT_CONFIG
> +	$$(if $$(filter olddefconfig,$$($(2)_KCONFIG_RULES)),
> +		$$(Q)$$($(2)_KCONFIG_MAKE) olddefconfig,
> +		$$(if $$(filter oldnoconfig,$$($(2)_KCONFIG_RULES)),
> +			$$(Q)$$($(2)_KCONFIG_MAKE) oldnoconfig,
> +			$$(Q)(yes "" | $$($(2)_KCONFIG_MAKE) oldconfig)))
> +endef

  I have been thinking about how to do more in shell after all. It could be done 
by moving most of it to a support shell script:


define $(2)_REGEN_DOT_CONFIG
	$(Q)$$($(2)_MAKE_ENV) support/scripts/makeolddefconfig \
		$$(MAKE) -C $$($(2)_DIR) $$($(2)_KCONFIG_OPTS)
endef


and support/scripts/makeolddefconfig:

kconfig_rules=$("$@"  -pn config 2>/dev/null | sed ...)

if echo "$kconfig_rules" | grep -q olddefconfig; then
	"$@" olddefconfig
elif echo "$kconfig_rules" | grep -q oldnoconfig; then
	"$@" oldnoconfig
else
	yes "" | "$@" oldconfig
fi


  However, bottom line I don't think this improves the situation sufficiently to 
warrant even a follow-up patch. So this one is OK for me as it is.

  Regards,
  Arnout


> +
>  # The specified source configuration file and any additional configuration file
>  # fragments are merged together to .config, after the package has been patched.
>  # Since the file could be a defconfig file it needs to be expanded to a
> -# full .config first. We use 'make oldconfig' because this can be safely
> -# done even when the package does not support defconfigs.
> +# full .config first.
>  $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
>  	$$(Q)$$(if $$($(2)_KCONFIG_DEFCONFIG), \
>  		$$($(2)_KCONFIG_MAKE) $$($(2)_KCONFIG_DEFCONFIG), \
>  		cp $$($(2)_KCONFIG_FILE) $$(@))
>  	$$(Q)support/kconfig/merge_config.sh -m -O $$(@D) \
>  		$$(@) $$($(2)_KCONFIG_FRAGMENT_FILES)
> -	$$(Q)yes "" | $$($(2)_KCONFIG_MAKE) oldconfig
> +	$$($(2)_REGEN_DOT_CONFIG)
>
>  # If _KCONFIG_FILE or _KCONFIG_FRAGMENT_FILES exists, this dependency is
>  # already implied, but if we only have a _KCONFIG_DEFCONFIG we have to add
> @@ -82,7 +108,7 @@ $$($(2)_DIR)/.config: | $(1)-patch
>  # The exact rules are specified by the package .mk file.
>  define $(2)_FIXUP_DOT_CONFIG
>  	$$($(2)_KCONFIG_FIXUP_CMDS)
> -	$$(Q)yes "" | $$($(2)_KCONFIG_MAKE) oldconfig
> +	$$($(2)_REGEN_DOT_CONFIG)
>  	$$(Q)touch $$($(2)_DIR)/.stamp_kconfig_fixup_done
>  endef
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
