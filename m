From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Sep 2015 00:23:34 +0200
Subject: [Buildroot] [PATCHv3] pkg-generic: detect incorrectly used
 package
In-Reply-To: <1441058113-32621-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1441058113-32621-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150831222334.GA3705@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-08-31 23:55 +0200, Thomas Petazzoni spake thusly:
> In Buildroot, the selection of a package from a Config.in level and
> from a Makefile level are completely disconnected. This can lead to
> issues where the build of a package is triggered at the Makefile level
> due to the package being listed in another package <pkg>_DEPENDENCIES
> variable, even if that package is not enabled in the configuration.
[--SNIP--]
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 6a7d97e..e8cf488 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -143,6 +143,17 @@ $(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
>  
>  # Configure
>  $(BUILD_DIR)/%/.stamp_configured:
> +# Only trigger the check for default builds. If the user forces
> +# building a package, even if not enabled in the configuration, we
> +# want to accept it.
> +ifeq ($(MAKECMDGOALS),)
> +	@if test "$(TYPE)" = "target" -a -z "$($(KCONFIG_VAR))" ; then \
> +		echo "ERROR: A package must have added $(PKG) to its _DEPENDENCIES line but" ; \
> +		echo "forgot to add the corresponding select / depends on $(KCONFIG_VAR)." ; \
> +		echo "Please review your packages and try again." ; \
> +		exit 1 ; \

It might even be interesting to tell the user what those packages might
be, like so (totally untested):

    diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
    index 6a7d97e..03ca9cc 100644
    --- a/package/pkg-generic.mk
    +++ b/package/pkg-generic.mk
    @@ -758,6 +758,9 @@ endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
     # configuration
     ifeq ($$($$($(2)_KCONFIG_VAR)),y)
     
    +# Store reverse build-dependency information
    +$$(eval $$(foreach d,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(call UPPER,$$(d))_DEPENDENT_OF += $(1)$$(sep)))
    +
     # Ensure the calling package is the declared provider for all the virtual
     # packages it claims to be an implementation of.
     ifneq ($$($(2)_PROVIDES),)

and then, in this new error message (wording to be adapted):

    echo "Potential culprits are:"; \
    for p in $($(2)_DEPENDENT_OF); do \
        echo "  - ${p}"; \
    done

Thoughts?

I'll further review that patch tomorrow...

Regards,
Yann E. MORIN.

> +	fi
> +endif
>  	@$(call step_start,configure)
>  	@$(call MESSAGE,"Configuring")
>  	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
> @@ -664,6 +675,8 @@ $$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
>  $$($(2)_TARGET_INSTALL_HOST):           PKG=$(2)
>  $$($(2)_TARGET_BUILD):			PKG=$(2)
>  $$($(2)_TARGET_CONFIGURE):		PKG=$(2)
> +$$($(2)_TARGET_CONFIGURE):		TYPE=$(4)
> +$$($(2)_TARGET_CONFIGURE):		KCONFIG_VAR=$$($(2)_KCONFIG_VAR)
>  $$($(2)_TARGET_RSYNC):                  SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
>  $$($(2)_TARGET_RSYNC):                  PKG=$(2)
>  $$($(2)_TARGET_PATCH):			PKG=$(2)
> -- 
> 2.5.1
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
