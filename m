From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Oct 2015 15:19:16 +0200
Subject: [Buildroot] [PATCH] busybox: fix musl build issues
In-Reply-To: <1445085778-3358-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1445085778-3358-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20151018131916.GA3583@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-10-17 14:42 +0200, Thomas Petazzoni spake thusly:
> Musl doesn't implemented wmtp, and its utmp support is not sufficient
> to build the latest versions of Busybox, so let's disable wtmp and
> utmp support in Busybox for musl toolchains.
> 
> We re-use an existing define BUSYBOX_INTERNAL_SHADOW_PASSWORDS that
> was used to do some musl-related tweaks to the Busybox configuration
> around shadow password functions, and extend it to also do the
> utmp/wtmp tweaks. In the process, we rename the define to
> BUSYBOX_MUSL_TWEAKS.
> 
> Note that BUSYBOX_KCONFIG_FIXUP_CMDS continues to call
> BUSYBOX_INTERNAL_SHADOW_PASSWORDS because there is another definition
> of this macro under other conditions.

And I think the renaming by itself was still worth it. We today have a
situation where we can define the same macros twice, which is not "nice".

That two macros want to change the same options is not nice either, but
is much better.

Eventually, we should probably want to have soemthing like:

    BUSYBOX_NEEDS_INTERNAL_SHADOW = \
        $(if $(BR2_TOOLCHAIN_USES_MUSL),y) \
        $(if $(BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS),,y)

    ifneq ($(BUSYBOX_NEEDS_INTERNAL_SHADOW),)
    define BUSYBOX_INTERNAL_SHADOW_PASSWORDS
        blabla enable config stuf...
    endef
    endif

> Fixes:
> 
>   http://autobuild.buildroot.org/results/b96/b96ffad13bca5e6fbf7ce79538aacbfe27b1eff3/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/busybox/busybox.mk | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index d3a6fd8..e5427cf 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -132,12 +132,18 @@ define BUSYBOX_INTERNAL_SHADOW_PASSWORDS
>  endef
>  endif
>  
> -# We also need to use internal functions when using the musl C
> -# library, since some of them are not yet implemented by musl.
> +# We also need to use internal shadow password functions when using
> +# the musl C library, since some of them are not yet implemented by
> +# musl.
> +#
> +# Do not use utmp/wmtp support. wmtp support is not available in musl,
> +# and utmp support is not sufficient for Busybox.
>  ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> -define BUSYBOX_INTERNAL_SHADOW_PASSWORDS
> +define BUSYBOX_MUSL_TWEAKS
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_USE_BB_PWD_GRP,$(BUSYBOX_BUILD_CONFIG))
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_USE_BB_SHADOW,$(BUSYBOX_BUILD_CONFIG))
> +	$(call KCONFIG_DISABLE_OPT,CONFIG_FEATURE_UTMP,$(BUSYBOX_BUILD_CONFIG))
> +	$(call KCONFIG_DISABLE_OPT,CONFIG_FEATURE_WTMP,$(BUSYBOX_BUILD_CONFIG))
>  endef
>  endif
>  
> @@ -223,6 +229,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
>  	$(BUSYBOX_SET_INIT)
>  	$(BUSYBOX_SET_WATCHDOG)
>  	$(BUSYBOX_SET_SELINUX)
> +	$(BUSYBOX_MUSL_TWEAKS)
>  endef
>  
>  define BUSYBOX_CONFIGURE_CMDS
> -- 
> 2.6.2
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
