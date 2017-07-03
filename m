From: Romain Naour <romain.naour@smile.fr>
Date: Mon, 3 Jul 2017 18:47:01 +0200
Subject: [Buildroot] [PATCH next 3/3] bc: bump version to 1.07.1
In-Reply-To: <20170512142848.13956-3-Vincent.Riera@imgtec.com>
References: <20170512142848.13956-1-Vincent.Riera@imgtec.com>
 <20170512142848.13956-3-Vincent.Riera@imgtec.com>
Message-ID: <95d88e6f-25d4-d92f-4836-a17a5ab7e70c@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincente,

Le 12/05/2017 ? 16:28, Vicente Olivert Riera a ?crit :
> - Remove 01 and 02 patches as they are not needed anymore.

Patch 01 is upstream but not patch 02.
Why it's not needed anymore ?
Maybe add a previous patch to remove it before bumping bc ?

> - Tweak 03 patch for the new version and rename it to 0001.
> - host-flex dependency is not needed anymore.
> - Added host-bc dependency: needed to bootstrap libmath.h at build time.
> - Added host-ed dependency: used by fix-libmath_h script at build time.

bc is in Buildroot mandatory dependency, so why not using bc from the host ?
Have you tried that ?
With that you can remove the dependency on host-ed and host-bc.

> - Swith site to GNU mirror.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  ...fo.patch => 0001-use_appropiate_makeinfo.patch} |  13 +-
>  package/bc/01_array_initialize.patch               |  20 -
>  package/bc/02_notice_read_write_errors.patch       | 708 ---------------------
>  package/bc/bc.hash                                 |   2 +-
>  package/bc/bc.mk                                   |  25 +-
>  5 files changed, 30 insertions(+), 738 deletions(-)
>  rename package/bc/{03_use_appropiate_makeinfo.patch => 0001-use_appropiate_makeinfo.patch} (53%)
>  delete mode 100644 package/bc/01_array_initialize.patch
>  delete mode 100644 package/bc/02_notice_read_write_errors.patch
> 

[...]

> diff --git a/package/bc/bc.mk b/package/bc/bc.mk
> index 4596192..b5853b1 100644
> --- a/package/bc/bc.mk
> +++ b/package/bc/bc.mk
> @@ -4,17 +4,34 @@
>  #
>  ################################################################################
>  
> -BC_VERSION = 1.06.95
> -BC_SOURCE = bc-$(BC_VERSION).tar.bz2
> -BC_SITE = http://alpha.gnu.org/gnu/bc
> -BC_DEPENDENCIES = host-flex
> +BC_VERSION = 1.07.1
> +BC_SITE = $(BR2_GNU_MIRROR)/bc
> +# host-bc needed to bootstrap libmath.h at build time
> +# host-ed needed by the fix-libmath_h script at build time
> +BC_DEPENDENCIES = host-bc host-ed
>  BC_LICENSE = GPL-2.0+, LGPL-2.1+
>  BC_LICENSE_FILES = COPYING COPYING.LIB
> +# host-ed needed by the fix-libmath_h script at build time
> +HOST_BC_DEPENDENCIES = host-ed
>  
>  # Build after busybox so target ends up with bc's "dc" version
>  ifeq ($(BR2_PACKAGE_BUSYBOX),y)
>  BC_DEPENDENCIES += busybox
>  endif
>  
> +# A stripped-down version of bc (fbc) is built for bootstrapping purposes. Then
> +# the bc build system tries to run it in order to generate some header files,
> +# but that breaks cross-compilation because we cannot run in the host machine an
> +# fbc that has been built for the target architecture. We tweak the Makefiles in
> +# order to run the bc that was built for the host. As long as the host bc and
> +# the target one have the same version the result should be fine.

Is there any output format changes between bc version ?

Best regards,
Romain

 And also, note
> +# we don't need to run the host fbc (which doesn't exist by the way, because
> +# it was deleted after its use by the host-bc Makefile) and we can just run the
> +# full bc program (remember the fbc was just a tripped-down version of bc).
> +define BC_USE_HOST_FBC
> +	$(SED) "s:\./fbc -c:$(HOST_DIR)/usr/bin/bc -c:" $(@D)/bc/Makefile.in
> +endef
> +BC_POST_PATCH_HOOKS += BC_USE_HOST_FBC
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> 
