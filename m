From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 28 May 2014 18:05:59 +0200
Subject: [Buildroot] [PATCH] package infra: remove duplicats in
 dependencies list
In-Reply-To: <1401027172-27405-1-git-send-email-yann.morin.1998@free.fr>
References: <1401027172-27405-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CAAXf6LUpMnSNoaPAtAzcSvAWobugT_ZY+SWEH3GrOWf1B1RH1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, May 25, 2014 at 4:12 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Currently, we just use what a package declares as its dependencies.
>
> But some packages may declare the same depdency more than once. For

Some typo nits:

title: duplicates
above: dependency

> example, php has two options to add SQL support: 'mysql' or 'mysqli',
> which are not exclusive. So, php.mk ahs mysql twice as a dependency.

has

>
> Although that does not cause any grievance for make, we end up generating
> dependency graphs where this duplicate dependency is visible.
>
> Add an intermediary variable which contains the $(sort)-ed list of the
> dependnecies, thus eliminating any duplicates.
>
> This has the side effect of also sorting the list, which is probably
> good for reproducibility anyway.

While I'm ok with the idea, it could cause some new build failures
initially due to missing mandatory dependencies which were hidden
behind the current order.
So I would add this to -next only so we have time to fix any problems.

>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/pkg-generic.mk | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 260f374..10dd83f 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -391,6 +391,9 @@ $(2)_DEPENDENCIES += toolchain
>  endif
>  endif
>
> +# Eliminate dupes in dependencies
> +$(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))

I would write the full word: duplicates

> +
>  $(2)_INSTALL_STAGING           ?= NO
>  $(2)_INSTALL_IMAGES            ?= NO
>  $(2)_INSTALL_TARGET            ?= YES
> @@ -476,14 +479,14 @@ $$($(2)_TARGET_INSTALL_HOST):     $$($(2)_TARGET_BUILD)
>  $(1)-build:            $$($(2)_TARGET_BUILD)
>  $$($(2)_TARGET_BUILD): $$($(2)_TARGET_CONFIGURE)
>
> -# Since $(2)_DEPENDENCIES are phony targets, they are always "newer"
> +# Since $(2)_FINAL_DEPENDENCIES are phony targets, they are always "newer"
>  # than $(2)_TARGET_CONFIGURE. This would force the configure step (and
>  # therefore the other steps as well) to be re-executed with every
> -# invocation of make.  Therefore, make $(2)_DEPENDENCIES an order-only
> +# invocation of make.  Therefore, make $(2)_FINAL_DEPENDENCIES an order-only
>  # dependency by using |.
>
>  $(1)-configure:                        $$($(2)_TARGET_CONFIGURE)
> -$$($(2)_TARGET_CONFIGURE):     | $$($(2)_DEPENDENCIES)
> +$$($(2)_TARGET_CONFIGURE):     | $$($(2)_FINAL_DEPENDENCIES)
>
>  $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dirs prepare
>  ifeq ($(filter $(1),$(DEPENDENCIES_HOST_PREREQ)),)
> @@ -505,7 +508,7 @@ $$($(2)_TARGET_PATCH):      $$($(2)_TARGET_EXTRACT)
>  $(1)-extract:                  $$($(2)_TARGET_EXTRACT)
>  $$($(2)_TARGET_EXTRACT):       $$($(2)_TARGET_SOURCE)
>
> -$(1)-depends:          $$($(2)_DEPENDENCIES)
> +$(1)-depends:          $$($(2)_FINAL_DEPENDENCIES)
>
>  $(1)-source:           $$($(2)_TARGET_SOURCE)
>  else
> @@ -515,7 +518,7 @@ else
>  #  configure
>  $$($(2)_TARGET_CONFIGURE):     $$($(2)_TARGET_RSYNC)
>
> -$(1)-depends:          $$($(2)_DEPENDENCIES)
> +$(1)-depends:          $$($(2)_FINAL_DEPENDENCIES)
>
>  $(1)-patch:            $(1)-rsync
>  $(1)-extract:          $(1)-rsync
> @@ -526,7 +529,7 @@ $(1)-source:                $$($(2)_TARGET_RSYNC_SOURCE)
>  endif
>
>  $(1)-show-depends:
> -                       @echo $$($(2)_DEPENDENCIES)
> +                       @echo $$($(2)_FINAL_DEPENDENCIES)
>
>  $(1)-graph-depends:
>                         @$(INSTALL) -d $(O)/graphs
> --

Best regards,
Thomas
