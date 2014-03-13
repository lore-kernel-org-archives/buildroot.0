From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 14 Mar 2014 00:24:05 +0100
Subject: [Buildroot] [PATCH] legal-info: extract even no-redistribute
 packages
In-Reply-To: <1394663367-11778-1-git-send-email-yann.morin.1998@free.fr>
References: <1394663367-11778-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <53223E15.5000504@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

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
>
> Fix this by always having legal-info extract the archives if one or
> more _LICENSE_FILES are specified.
>
> We do this for all types of packages: overriden, local or 'normal'
> remote packages. Even though we do not save the sources for the
> overriden or local packages, we need to save their licensing info,
> so we need to extract them.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Fabio Porcedda <fabio.porcedda@gmail.com>
>
> Chamges v1 -> v2:
>    - this is not fixing the autobuilders failure it was written to fix
>      so remove the references to such build failures  (Thomas P)
>    - also extract overriden and local packages  (Fabio)
> ---
>   package/pkg-generic.mk | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 339c3eb..d201a77 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -555,15 +555,13 @@ $(2)_MANIFEST_LICENSE_FILES = $$($(2)_LICENSE_FILES)
>   endif
>   $(2)_MANIFEST_LICENSE_FILES ?= not saved
>
> -ifeq ($$($(2)_REDISTRIBUTE),YES)
> -ifneq ($$($(2)_SITE_METHOD),local)
> -ifneq ($$($(2)_SITE_METHOD),override)
> +# If the package declares _LICENSE_FILES, we need to extract it,
> +# for overriden, local or normal remote packages alike.
> +ifneq ($$($(2)_LICENSE_FILES),)
>   # Packages that have a tarball need it downloaded and extracted beforehand
>   $(1)-legal-info: $(1)-extract $(REDIST_SOURCES_DIR_$(call UPPERCASE,$(4)))
>   $(2)_MANIFEST_TARBALL = $$($(2)_SOURCE)
>   endif
> -endif
> -endif

You're right Yann.
Not only we need to extract the sources in order to copy the license
files.
We also do _not_ need the extract step in order to save the tarball:
that was useless (although not harmful -- only wasting a little time).

As far as the overridden and local packages are concerned, I've always
found them very useful during development but not for integration,
when legal-info becomes useful. So I have no strong opinion.

However, if somebody really uses them for integration and they do work,
then it's correct to extract them for legal-info. If nobody does, then
the question is irrelevant. So I'm fine with your proposed patch, and
I like the fact that it removes 5 lines and adds only 1 (comments
excluded)!

[tested before and after the patch, enabling and disabling the
_REDISTRIBUTE and _LICENSE_FILES attributes for a sample package]
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
