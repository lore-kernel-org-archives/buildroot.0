From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Wed, 20 Jul 2011 17:03:22 +0100
Subject: [Buildroot] [PATCH 10/12] Makefile.package.in: Pass
 non-prefixed name as argument to GENTARGETS_INNER.
In-Reply-To: <1a95e4dffd7b68d2e9fbcb9d13516f086decab1c.1311141088.git.thomas.petazzoni@free-electrons.com>
References: <cover.1311141087.git.thomas.petazzoni@free-electrons.com>
 <1a95e4dffd7b68d2e9fbcb9d13516f086decab1c.1311141088.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1311177810.2189.65.camel@dublxciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2011-07-20 at 07:52 +0200, Thomas Petazzoni wrote:
> diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
> index b65caa2..1591f61 100644
> --- a/package/Makefile.autotools.in
> +++ b/package/Makefile.autotools.in
> @@ -29,66 +29,69 @@
>  # calls the generic package infrastructure to generate the necessary
>  # make targets
>  #
> -#  argument 1 is the lowercase package name
> -#  argument 2 is the uppercase package name, including an HOST_ prefix
> +#  argument 1 is the lowercase package name, including an host- prefix
>  #             for host packages
> -#  argument 3 is the uppercase package name, without the HOST_ prefix
> +#  argument 2 is the lowercase package name, without the host- prefix
>  #             for host packages
> -#  argument 4 is the package directory prefix
> -#  argument 5 is the type (target or host)
> +#  argument 3 is the uppercase package name, including an HOST_ prefix
> +#             for host packages
> +#  argument 4 is the uppercase package name, without the HOST_ prefix
> +#             for host packages
> +#  argument 5 is the package directory prefix
> +#  argument 6 is the type (target or host)
>  ################################################################################

You're brave!  I had thought of putting it in the same place but didn't
think the patch would be accepted so kept it simple.

> @@ -647,10 +650,10 @@ endef # GENTARGETS_INNER
>  define GENTARGETS
>  ifeq ($(1),host)
>  # In the case of host packages, turn the package name "pkg" into "host-pkg"
> -$(call GENTARGETS_INNER,$(1)-$(call pkgname),$(call UPPERCASE,$(1)-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgdir),host)
> +$(call GENTARGETS_INNER,$(1)-$(call pkgname),$(call pkgname),$(call UPPERCASE,$(1)-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgdir),host)
>  else
>  # In the case of target packages, keep the package name "pkg"
> -$(call GENTARGETS_INNER,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgdir),target)
> +$(call GENTARGETS_INNER,$(call pkgname),$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgdir),target)
>  endif
>  endef

These lines seem unnecessary now.  Can't most of the respective
positional variables now be derived inside the ..._INNER function?
 
