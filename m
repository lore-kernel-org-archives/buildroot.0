From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Jan 2020 13:15:58 +0100
Subject: [Buildroot] [PATCH 1/1] boot/uboot: cover more u-boot versions
 when fixing up libfdt include paths
In-Reply-To: <20191216151039.8168-1-patrickdepinguin@gmail.com>
References: <20191216151039.8168-1-patrickdepinguin@gmail.com>
Message-ID: <20200101121558.GJ3519@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Arnout, All,

On 2019-12-16 16:10 +0100, Thomas De Schampheleire spake thusly:
> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> 
> The original UBOOT_FIXUP_LIBFDT_INCLUDE hook only works for u-boot versions
> starting from v2017.11.
> 
> As older u-boot versions are still in common use today, e.g. in the
> ci20_defconfig, extend the hook to cover a wider range of u-boot versions.
> 
> The main code change was proposed by Arnout Vandecappelle in [1].
> Testing and comment changes were done by Thomas De Schampheleire.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2019-May/251231.html
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Applied to master, after adding a test-report of a few defconfigs to
exercise the various versions. Thanks.

Regards,
Yann E. MORIN.

> ---
>  boot/uboot/uboot.mk | 34 +++++++++++++++++++++++++++-------
>  1 file changed, 27 insertions(+), 7 deletions(-)
> 
> 
> Sent previously but without response.
> Rebased and retested on latest master. A simple test is:
> 
>     make ci20_defconfig
>     make clean uboot
> 
> before and after this patch.
> 
> 
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 0ebda6588c..a4879bb8b2 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -207,15 +207,35 @@ define UBOOT_APPLY_LOCAL_PATCHES
>  endef
>  UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_LOCAL_PATCHES
>  
> -# This is equivalent to upstream commit
> -# http://git.denx.de/?p=u-boot.git;a=commitdiff;h=e0d20dc1521e74b82dbd69be53a048847798a90a. It
> -# fixes a build failure when libfdt-devel is installed system-wide.
> -# This only works when scripts/dtc/libfdt exists (E.G. versions containing
> -# http://git.denx.de/?p=u-boot.git;a=commitdiff;h=c0e032e0090d6541549b19cc47e06ccd1f302893)
> +# Fixup inclusion of libfdt headers, which can fail in older u-boot versions
> +# when libfdt-devel is installed system-wide.
> +# The core change is equivalent to upstream commit
> +# e0d20dc1521e74b82dbd69be53a048847798a90a (first in v2018.03). However, the fixup
> +# is complicated by the fact that the underlying u-boot code changed multiple
> +# times in history:
> +# - The directory scripts/dtc/libfdt only exists since upstream commit
> +#   c0e032e0090d6541549b19cc47e06ccd1f302893 (first in v2017.11). For earlier
> +#   versions, create a dummy scripts/dtc/libfdt directory with symlinks for the
> +#   fdt-related files. This allows to use the same -I<path> option for both
> +#   cases.
> +# - The variable 'srctree' used to be called 'SRCTREE' before upstream commit
> +#   01286329b27b27eaeda045b469d41b1d9fce545a (first in v2014.04).
> +# - The original location for libfdt, 'lib/libfdt/', used to be simply
> +#   'libfdt' before upstream commit 0de71d507157c4bd4fddcd3a419140d2b986eed2
> +#   (first in v2010.06). Make the 'lib' part optional in the substitution to
> +#   handle this.
>  define UBOOT_FIXUP_LIBFDT_INCLUDE
> -	if [ -d $(@D)/scripts/dtc/libfdt ]; then \
> -		$(SED) 's%-I$$(srctree)/lib/libfdt%-I$$(srctree)/scripts/dtc/libfdt%' $(@D)/tools/Makefile; \
> +	$(Q)if [ ! -d $(@D)/scripts/dtc/libfdt ]; then \
> +		mkdir -p $(@D)/scripts/dtc/libfdt; \
> +		cd $(@D)/scripts/dtc/libfdt; \
> +		ln -s ../../../include/fdt.h .; \
> +		ln -s ../../../include/libfdt*.h .; \
> +		ln -s ../../../lib/libfdt/libfdt_internal.h .; \
>  	fi
> +	$(Q)$(SED) \
> +		's%-I\ *\$$(srctree)/lib/libfdt%-I$$(srctree)/scripts/dtc/libfdt%; \
> +		s%-I\ *\$$(SRCTREE)\(/lib\)\?/libfdt%-I$$(SRCTREE)/scripts/dtc/libfdt%' \
> +		$(@D)/tools/Makefile
>  endef
>  UBOOT_POST_PATCH_HOOKS += UBOOT_FIXUP_LIBFDT_INCLUDE
>  
> -- 
> 2.23.0
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
