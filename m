From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 17 Mar 2020 22:31:01 +0100
Subject: [Buildroot] [PATCHv2] package/localedef: fix dependencies
In-Reply-To: <20200317211102.12842-1-yann.morin.1998@free.fr>
References: <20200317211102.12842-1-yann.morin.1998@free.fr>
Message-ID: <e7350603-70c2-ba04-73ae-e1f4b416f058@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le 17/03/2020 ? 22:11, Yann E. MORIN a ?crit?:
> localedef needs bison to satisfy a .y.c rule to generate a parser for
> plural forms, to ultimately generate data for the target. So we do not
> want to depend on the host-provided bison; we want to build our own (for
> reproducibility).
> 
> localedef is a host-only package, and dependencies are not inherited
> from the target variant, so we need to make them explicit host
> dependencies.
> 
> And move the assignment after all the download-related variables.
> 
> Reported-by: James Hilliard <james.hilliard1@gmail.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> 
> ---
> Changes v1 -> v2:
>   - do not depend on the host provided bison
> ---
>  package/localedef/localedef.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
> index 10a1929044..3e22f68039 100644
> --- a/package/localedef/localedef.mk
> +++ b/package/localedef/localedef.mk
> @@ -10,9 +10,12 @@
>  LOCALEDEF_VERSION = 2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91
>  LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
>  LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
> -LOCALEDEF_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY)

I believe this line come from the glibc package [1] that requires GNU Make >=
4.0 since version 2.28. Indeed glibc is a target package not a host package.

[1] https://git.buildroot.net/buildroot/tree/package/glibc/glibc.mk?h=2020.02#n38

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


>  HOST_LOCALEDEF_DL_SUBDIR = glibc
>  
> +HOST_LOCALEDEF_DEPENDENCIES = \
> +	$(BR2_MAKE_HOST_DEPENDENCY) \
> +	host-bison
> +
>  HOST_LOCALEDEF_CONF_ENV += ac_cv_prog_MAKE="$(BR2_MAKE)"
>  
>  # Even though we use the autotools-package infrastructure, we have to override
> 
