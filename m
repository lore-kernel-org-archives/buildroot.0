From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Mar 2016 18:42:03 +0100
Subject: [Buildroot] [PATCH 1/2] core/pkg-kconfig: add an option to use
 olddefconfig
In-Reply-To: <1458901049-3693-1-git-send-email-romain.izard.pro@gmail.com>
References: <1458901049-3693-1-git-send-email-romain.izard.pro@gmail.com>
Message-ID: <20160326174203.GA3589@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-03-25 11:17 +0100, Romain Izard spake thusly:
> Using 'yes "" | make oldconfig' to regenerate a .config file from an
> existing defconfig does not work reliably in all cases. Specifically, it
> does not work well with tristate choice entries.
> 
> The correct way to do it is to use 'make olddefconfig', but this target
> is not supported in projects that use an old version of kconfig. As
> most projects do not use tristate entries, there is no need for them to
> upgrade.
> 
> As a result, add support in the pkg-kconfig infrastructure for both
> cases, with a configuration entry to select which mode to use.

In fact, we've already discussed this, and we concluded that we would
want an automatic behaviour.

I.e. we try to use olddefconfig, and fallback to the yes-trick, like so:

    make olddefconfig || { yes "" |make oldconfig; }

Care to adapt your patch and respin, please? Of course, your second
patch will no longer make sense after that.

In the meantime, I marked your patches as "Changes Requested" in
patchwork.

Thanks! ;-)

Regards,
Yann E. MORIN.

> Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
> ---
>  docs/manual/adding-packages-kconfig.txt |  5 +++++
>  package/pkg-kconfig.mk                  | 10 ++++++----
>  2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-kconfig.txt b/docs/manual/adding-packages-kconfig.txt
> index 3290024..50c4ecb 100644
> --- a/docs/manual/adding-packages-kconfig.txt
> +++ b/docs/manual/adding-packages-kconfig.txt
> @@ -53,6 +53,11 @@ It is mandatory to provide either, but not both:
>  * +FOO_KCONFIG_FILE+ specifies the path to a defconfig or full-config file
>    to be used to configure the package.
>  
> +* +FOO_KCONFIG_OLDDEFCONFIG+ when set specifies that the 'make' rule to
> +  call with defconfig files is 'olddefconfig'. Only some projects support
> +  it, but the default rule called 'oldconfig' can misbehave when the
> +  config file changes tristate 'choice' entries.
> +
>  * +FOO_KCONFIG_DEFCONFIG+ specifies the defconfig 'make' rule to call to
>    configure the package.
>  
> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> index 90f3f9f..71c6865 100644
> --- a/package/pkg-kconfig.mk
> +++ b/package/pkg-kconfig.mk
> @@ -60,8 +60,7 @@ $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch
>  # The specified source configuration file and any additional configuration file
>  # fragments are merged together to .config, after the package has been patched.
>  # Since the file could be a defconfig file it needs to be expanded to a
> -# full .config first. We use 'make oldconfig' because this can be safely
> -# done even when the package does not support defconfigs.
> +# full .config first.
>  $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
>  	$$(if $$($(2)_KCONFIG_DEFCONFIG), \
>  		$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
> @@ -69,8 +68,11 @@ $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
>  		cp $$($(2)_KCONFIG_FILE) $$(@))
>  	support/kconfig/merge_config.sh -m -O $$(@D) \
>  		$$(@) $$($(2)_KCONFIG_FRAGMENT_FILES)
> -	$$(Q)yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
> -		$$($(2)_KCONFIG_OPTS) oldconfig
> +	$$(if $$($(2)_KCONFIG_OLDDEFCONFIG), \
> +		$$($2_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
> +			$$($(2)_KCONFIG_OPTS) olddefconfig, \
> +		$$(Q)yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
> +			$$($(2)_KCONFIG_OPTS) oldconfig)
>  
>  # If _KCONFIG_FILE or _KCONFIG_FRAGMENT_FILES exists, this dependency is
>  # already implied, but if we only have a _KCONFIG_DEFCONFIG we have to add
> -- 
> 2.5.0
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
