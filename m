From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Apr 2015 22:01:15 +0200
Subject: [Buildroot] [PATCHv2 04/21] Makefile: rename TARGETS to PACKAGES
In-Reply-To: <1428856685-4403-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150413200115.GE29025@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-12 18:37 +0200, Thomas Petazzoni spake thusly:
> For clarity, this commit renames the TARGETS variable to the more
> meaningful PACKAGES variable. Indeed, only packages (handled by one of
> the package infrastructures) should be listed in this variable, and
> not other random non-package targets.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Small comment however, see below...

> diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
> index aec57c0..fe1a7db 100644
> --- a/package/matchbox/matchbox.mk
> +++ b/package/matchbox/matchbox.mk
> @@ -1,4 +1,4 @@
>  ifeq ($(BR2_PACKAGE_MATCHBOX),y)
>  include $(sort $(wildcard package/matchbox/*/*.mk))
> -TARGETS += matchbox-lib matchbox-wm
> +PACKAGES += matchbox-lib matchbox-wm

I understand we need to manually add them to the list of packages,
because neither matchbox-lib nor matchbox-wm have an associated Kconfig
option.

Yet, I believe this should be changed so that they behave like any other
package, and that we use 'select' from the matchbox package to select
the -lib and -wm dependenct packages.

If we are really concerned that we do not want to make those
user-selectable, we could make them prompt-less packages, and so they'd
be hidden.

Of course, this is not a blocker for this patch, as you're doing a mere
renaming of an existing variable, and the fix can be done in a follow-up
patch (OK, written on my TODO-list).

Regards,
Yann E. MORIN.

>  endif
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 1d56f81..d1a1811 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -746,7 +746,7 @@ $(eval $(call check-deprecated-variable,$(2)_BUILD_OPT,$(2)_BUILD_OPTS))
>  $(eval $(call check-deprecated-variable,$(2)_GETTEXTIZE_OPT,$(2)_GETTEXTIZE_OPTS))
>  $(eval $(call check-deprecated-variable,$(2)_KCONFIG_OPT,$(2)_KCONFIG_OPTS))
>  
> -TARGETS += $(1)
> +PACKAGES += $(1)
>  
>  ifneq ($$($(2)_PERMISSIONS),)
>  PACKAGES_PERMISSIONS_TABLE += $$($(2)_PERMISSIONS)$$(sep)
> diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
> index 08ecc5a..c26e1e0 100755
> --- a/support/scripts/graph-depends
> +++ b/support/scripts/graph-depends
> @@ -116,7 +116,7 @@ def get_version(pkgs):
>      return version
>  
>  # Execute the "make show-targets" command to get the list of the main
> -# Buildroot TARGETS and return it formatted as a Python list. This
> +# Buildroot PACKAGES and return it formatted as a Python list. This
>  # list is used as the starting point for full dependency graphs
>  def get_targets():
>      sys.stderr.write("Getting targets\n")
> diff --git a/system/system.mk b/system/system.mk
> index 4a1eb4a..c95e436 100644
> --- a/system/system.mk
> +++ b/system/system.mk
> @@ -35,7 +35,7 @@ TARGET_FINALIZE_HOOKS += SYSTEM_ISSUE
>  endif
>  
>  ifneq ($(TARGET_GENERIC_ROOT_PASSWD),)
> -TARGETS += host-mkpasswd
> +PACKAGES += host-mkpasswd
>  endif
>  
>  define SET_NETWORK_LOCALHOST
> -- 
> 2.1.0
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
