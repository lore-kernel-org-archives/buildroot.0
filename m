From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2015 19:19:16 +0100
Subject: [Buildroot] [PATCHv5 1/2] pkg-generic: detect incorrectly used
 package
In-Reply-To: <1444382106-16019-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1444382106-16019-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1444382106-16019-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20151229181916.GD3445@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-10-09 11:15 +0200, Thomas Petazzoni spake thusly:
> In Buildroot, the selection of a package from a Config.in level and
> from a Makefile level are completely disconnected. This can lead to
> issues where the build of a package is triggered at the Makefile level
> due to the package being listed in another package <pkg>_DEPENDENCIES
> variable, even if that package is not enabled in the configuration.
> 
> This has for example been the case recently with python-can having
> 'python' in its <pkg>_DEPENDENCIES, while python-can could be enabled
> when Python 3.x is used, in which case the 'python' package should not
> be built.
> 
> To detect such issues more easily, this patch adds a check in the
> package infrastructure. When the build process of a package is being
> triggered, we verify that the package is enabled in the
> configuration. We do this check in the "configure" step, since this
> step is the first common step between the normal download case and the
> "local site method" / "package override" case.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
[--SNIP--]
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 76ec295..a831199 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -143,6 +143,16 @@ $(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
>  
>  # Configure
>  $(BUILD_DIR)/%/.stamp_configured:
> +# Only trigger the check for default builds. If the user forces
> +# building a package, even if not enabled in the configuration, we
> +# want to accept it.
> +ifeq ($(MAKECMDGOALS),)
> +	@if test "$($(PKG)_TYPE)" = "target" -a -z "$($($(PKG)_KCONFIG_VAR))" ; then \
> +		echo "ERROR: A package must have added $($(PKG)_NAME) to its _DEPENDENCIES line but" ; \

As I reported in the second patch of this series, the package being
build might second-or-deeper in the dependency chain.

So, if we have the existing _correct_ dependencies:
  foo -> bar
  bar -> buz
  buz -> daz

and we then add an incorrect dependency;
  alpha -> foo

then the build order guranatees that daz is built first, and the we
report that something is incorrectly selecting daz, while the reall
issue is that something is incorrectly selecting foo.

So, we'd probably need to state something like:

    ERROR: $(1) is in the dependency chain of a package that has
    added it to is _DEPENDENCIES line (directly or indirectly)
    without selecting it from Config.in.

I'm not too happy with that phrasing, because it is still obscur for a
new-comer. But we would instantly recognise the pattern and it would be
relatively easy to spot the real culprit.

Thoughts?

Regards,
Yann E. MORIN.

> +		echo "forgot to add the corresponding select / depends on $($(PKG)_KCONFIG_VAR)." ; \
> +		exit 1 ; \
> +	fi
> +endif
>  	@$(call step_start,configure)
>  	@$(call MESSAGE,"Configuring")
>  	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
> -- 
> 2.6.1
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
