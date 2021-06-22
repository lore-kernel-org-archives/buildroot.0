From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 22 Jun 2021 22:39:09 +0200
Subject: [Buildroot] [PATCH 06/15] package/pkg-generic.mk: Introduce
 <PKG>_PER_PACKAGE_TWEAK_HOOKS
In-Reply-To: <20210621141130.48654-7-herve.codina@bootlin.com>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-7-herve.codina@bootlin.com>
Message-ID: <20210622203909.GJ44262@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Herv?, All,

On 2021-06-21 16:11 +0200, Herve Codina spake thusly:
> This hook will be used by package infrastucture or some packages to tweak
> external files (ie files not provides by the package itself) when we build
> with BR2_PER_PACKAGE_DIRECTORIES set.
> 
> This allows to have these tweaks in a specific hook instead of
> <PKG>_POST_CONFIGURE_HOOK. And so we can call these specific tweaks
> whenever we need them.

I'm a bit confused, because those new hooks are even before
_PRE_CONFIGURE_HOOKS, so smeantically, they are different from
_POST_CONFIGURE_HOOKS...

So I fail to see how this articulates with POST_CONFIGURE_HOOKS.
Looking at the next patch, about apr-utils, does not explain why the
existing apr-utils fixups need to change, with this new hooks...

Ah, yes, yes, now I see. OK, so here's a suggestion for a commit log:

    package/pkg-generic: add early pre-configure hooks

    Currently, when a package needs to modify files it inherits from its
    dependencies, because they contain paths, we can only do that in a
    pre- or post-configure hook.

    However, whatever is done as part of those hooks, will be accounted
    to the package itself, and thus will trigger file-overwrite detection.

    So, we need a way to be able to actually modify files before we
    start monitoring for them.

    We introduce a new set of hooks that an individual package can set,
    or that a package infra can set, and that are called right before
    we snapshot the state of target, and host (to which staging belongs),

> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  package/pkg-generic.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index e437050175..4069d2cf3c 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -257,6 +257,7 @@ $(BUILD_DIR)/%/.stamp_configured:
>  	@$(call pkg_size_before,$(HOST_DIR),-host)
>  	$(call fixup-libtool-files,$(NAME),$(HOST_DIR))
>  	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
> +	$(foreach hook,$($(PKG)_PER_PACKAGE_TWEAK_HOOKS),$(call $(hook))$(sep))

I am going to bikeshed on the naming of this variable (which is a good
sing that I am pretty much OK with the feature).

I think $(2)_EARLY_PRE_CONFIGURE_HOOKS is more sensible.

>  	@$(call pkg_detect_overwrite_before,$(TARGET_DIR))
>  	@$(call pkg_detect_overwrite_before,$(HOST_DIR),-host)
>  	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
> @@ -844,6 +845,7 @@ $(2)_PRE_LEGAL_INFO_HOOKS       ?=
>  $(2)_POST_LEGAL_INFO_HOOKS      ?=
>  $(2)_TARGET_FINALIZE_HOOKS      ?=
>  $(2)_ROOTFS_PRE_CMD_HOOKS       ?=
> +$(2)_PER_PACKAGE_TWEAK_HOOKS    ?=

Actually, this is totally useless: if the variable is unset, this would
set it to empty, which for 'make' is totally identical (an unset
variable can be expanded, and the expansion is the emopty string).

I know you are just adhering to existing code, and so you should indeed
keep it for the next series, but a cleanup in the infra would be welcome
too! ;-)

Regards,
Yann E. MORIN.

>  ifeq ($$($(2)_TYPE),target)
>  ifneq ($$(HOST_$(2)_KCONFIG_VAR),)
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
