From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 18 Jun 2014 23:17:55 +0200
Subject: [Buildroot] [PATCH 1/5] legal-info: extract even
 no-redistribute packages
In-Reply-To: <0a92bc2be59aa08b015e19b86ce31b8767bdbf43.1402758331.git.yann.morin.1998@free.fr>
References: <cover.1402758331.git.yann.morin.1998@free.fr>
 <0a92bc2be59aa08b015e19b86ce31b8767bdbf43.1402758331.git.yann.morin.1998@free.fr>
Message-ID: <53A20203.8040406@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Currently, if a package is marked _REDISTRIBUTE = NO, then legal-info
> will not try to extract it first.
>
> If that package also declares some _LICENSE_FILES, legal-info fails
> if it is the only action we're trying to run:
>
>      $ cat defconfig
>      BR2_INIT_NONE=y
>      BR2_PACKAGE_LIBFSLCODEC=y
>      $ make BR2_DEFCONFIG=$(pwd)/defconfig defconfig
>      $ make libfslcodec-legal-info
>      /bin/sh: /home/ymorin/dev/buildroot/O/legal-info/licenses.txt: No such file or directory
>      make[1]: *** [libfslcodec-legal-info] Error 1

Note that the present patchset does not solve _this_ error.

The error that your patchset _does_ solve is:

   $ make BR2_DL_DIR=~/src legal-info-prepare libfslcodec-legal-info
   >>>   Collecting legal info
   cat: 
/home/murray/devel/buildroot-test/output/build/libfslcodec-3.5.7-1.0.0/EULA: 
No such file or directory
   make: *** [libfslcodec-legal-info] Error 1
   $


The error that you reported due to the fact that output/legal-info has
not been created yet.

Workaround:
$ make BR2_DL_DIR=~/src legal-info-prepare libfslcodec-legal-info
                         ^^^^^^^^^^^^^^^^^^

This is not related to your patches, and it's due to the fact that
the legal-info stuff is meant to be executed only from its top-level
target:
   $ make legal-info
which in turn runs:
  - legal-info-clean, which removes the entire legal-info subdir;
  - legal-info-prepare, which creates dirs and prepares skeleton files
    and the manifest heading;
  - <pkg>-legal-info, which fills the skeleton files.

Maybe this could be fixed by making all $(1)-legal-info targets depend
on legal-info-clean and then legal-info-prepare.
If it works it would be a nice improvement, although mostly visible
when testing the legal infra. For real cases I don't see a big point in
running anything else than `make legal-info`.

>
> Fix this by always having legal-info extract the archives if one or
> more _LICENSE_FILES are specified.
>
> We do this for all types of packages: overriden, local or 'normal'

s/overriden/overridden/

> remote packages. Even though we do not save the sources for the
> overriden or local packages, we need to save their licensing info,

Ditto.

> so we need to extract them.
>
> This implies that we now need to explicitly add PKG-source as a dependency
> of legal-info for packages we want to save (ie. redistributable, non-local
> and non-overriden packages).

Said this way, it looks like we're adding a dependency. Instead we are
changing the dependence from PKG-extract to PKG-source, which is one
step less (-extract implies -source), so bottom line we are removing a
dependency.

Better explained IMO:
  This implies that we now need only PKG-source, not PKG-extract anymore,
  as a dependency of legal-info for packages we want to save (.....).

>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Fabio Porcedda <fabio.porcedda@gmail.com>
>
> ---
> Changes v4 -> v5:
>    - my usual s/pacakge/package/
>
> Changes v3 -> v4:
>    - legal-info needs to depend on PKG-source when it needs to save a
>      package's tarball
>
> Changes v2 -> v3:
>    - don't include source URL of no-redistribute, or overriden, or local
>      packages in the manifest
>
> Changes v1 -> v2:
>    - this is not fixing the autobuilders failure it was written to fix,
>      so remove the references to such build failures  (Thomas P)
>    - also extract overriden and local packages  (Fabio)
> ---
>   package/pkg-generic.mk | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index ccd7f3b..eb3ec9f 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -595,11 +595,18 @@ $(2)_MANIFEST_LICENSE_FILES = $$($(2)_LICENSE_FILES)
>   endif
>   $(2)_MANIFEST_LICENSE_FILES ?= not saved
>
> +# If the package declares _LICENSE_FILES, we need to extract it,
> +# for overriden, local or normal remote packages alike, whether

Ditto.

> +# we want to redistribute it or not.
> +ifneq ($$($(2)_LICENSE_FILES),)
> +$(1)-legal-info: $(1)-extract
> +endif
> +
>   ifeq ($$($(2)_REDISTRIBUTE),YES)
>   ifneq ($$($(2)_SITE_METHOD),local)
>   ifneq ($$($(2)_SITE_METHOD),override)
> -# Packages that have a tarball need it downloaded and extracted beforehand
> -$(1)-legal-info: $(1)-extract $(REDIST_SOURCES_DIR_$(call UPPERCASE,$(4)))
> +# We need to download the package archive if we are to save it
> +$(1)-legal-info: $(1)-source $(REDIST_SOURCES_DIR_$(call UPPERCASE,$(4)))
>   $(2)_MANIFEST_TARBALL = $$($(2)_SOURCE)
>   endif
>   endif
>

With the above fixed, and once rebased on top of master, and since I'm
OK with all of the very few code lines you touched:
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

[Quick test on top of e00c631ef4aa, will test again once rebased]
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
