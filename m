From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 28 Mar 2016 18:29:11 +0200
Subject: [Buildroot] [PATCH 1/9 v2] core: sort packages and eliminate
 duplicates before building
In-Reply-To: <425428e408e50325883b71897059f7c1a0c15f2d.1457721607.git.yann.morin.1998@free.fr>
References: <cover.1457721607.git.yann.morin.1998@free.fr>
 <425428e408e50325883b71897059f7c1a0c15f2d.1457721607.git.yann.morin.1998@free.fr>
Message-ID: <56F95BD7.5070003@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

Le 11/03/2016 19:41, Yann E. MORIN a ?crit :
> Currently, enabling more than one filesystem image will make
> 'show-targets' list a few host packages more than once.
> 
> This is because all filesystem images add the same set of
> host-packages to their dependencies, which are then added as-is
> to the package list.
> 
> Thus, host-fakeroot, host-makedevs and, if needed, host-mkpasswd will
> appear as many times as there are filesystem images enabled.
> 
> Fix that by sorting the package list, thus eliminating duplicates from
> that list.
> 
> Furthermore, and even though we're already sorting packages by scanning
> the .mk file in alphabetical order (because we $(sort) them), sorting
> the list itself will further guarantee the build order, thus enhancing
> reproducibility (and $(sort ...) is not dependent on the locale, it
> always sorts with the C locale).
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> 
> ---
> Changes v1 -> v2:
>   - fix typo in comment
> ---
>  Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 98c8dc7..0f16976 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -600,6 +600,12 @@ endif
>  
>  $(TARGETS_ROOTFS): target-finalize
>  
> +# Filesystems may add the same packages more than once from their
> +# dependency lists. For example, all filesystems include host-fakeroot,
> +# host-makedevs and, if required, host-mkpasswd. They would appear
> +# multiple times in the list returned by show-target.
> +PACKAGES := $(sort $(PACKAGES))
> +

Indeed, now the content of PACKAGES is listed alphabetically and duplicate are
removed.

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

>  target-finalize: $(PACKAGES)
>  	@$(call MESSAGE,"Finalizing target directory")
>  	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
> 
