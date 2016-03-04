From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 5 Mar 2016 00:45:34 +0100
Subject: [Buildroot] [PATCH 11/16 v4] core/legal-info: also save patches
In-Reply-To: <f1466d9d2ab2a3e2abc1f4a167e7ad38d12c2d61.1454536753.git.yann.morin.1998@free.fr>
References: <cover.1454536753.git.yann.morin.1998@free.fr>
 <f1466d9d2ab2a3e2abc1f4a167e7ad38d12c2d61.1454536753.git.yann.morin.1998@free.fr>
Message-ID: <56DA1E1E.4060501@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

I have a late remark, see below.

On 03/02/2016 23:22, Yann E. MORIN wrote:
> Currently, the legal-info infra only saves the source archive of a
> package. However, that's not enough as we may apply some patches on
> packages sources.
> 
> We do suggest users to also redistribute the Buildroot sources as part
> of their compliance distribution, so the patches bundled in Buildroot
> would indeed be included in the compliance distribution.
> 
> However, that's still not enough, since we may download some patches, or
> the user may use a global patch directory. Patches in there might not
> end up in the compliance distribution, and there are risks of
> non-conformity.
> 
> So, always include patches alongside the source archive.
> 
> To ensure reproducibility, we also generate a series file, so patches
> can be re-applied in the correct order.
> 
> We get the list of patches to include from the list of patches that were
> applied by the package infrastructure (via the apply-patches support
> script). So, we need to get packages properly extracted and patched
> before we can save their legal-info, not just in the case they define
> _LICENSE_FILES.
> 
> Update the legal-info header accordingly.
> 
> Note: this means that, when a package is not patched and defines no
> LICENSE_FILES, we will extract and patch it for nothing. There is no
> easy way to know whether we have to patch a package or not. We can only
> either duplicate the logic to detect patches (bad) or rely on the infra
> actually patching the package. Also, a vast majority of packages are
> either patched, or define _LICENSE_FILES, so it is best and easiest to
> always extract and patch them prior to legal-info.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> ---
> Changes v3 -> v4:
>   - typo  (Luca)
> 
> Changes v2 -> v3:
>   - also mention that patches have been saved  (Luca)
> 
> Changes v1 -> v2:
>   - don't recompute rawname-version needlessly  (Luca)
> ---
>  package/pkg-generic.mk           | 13 ++++++++-----
>  support/legal-info/README.header |  9 +++++----
>  2 files changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 432a153..055dbdb 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -776,12 +776,10 @@ $(2)_MANIFEST_LICENSE_FILES = $$($(2)_LICENSE_FILES)
>  endif
>  $(2)_MANIFEST_LICENSE_FILES ?= not saved
>  
> -# If the package declares _LICENSE_FILES, we need to extract it,
> -# for overriden, local or normal remote packages alike, whether
> -# we want to redistribute it or not.
> -ifneq ($$($(2)_LICENSE_FILES),)
> +# We need to extract and patch a package to be able to retrieve its
> +# license files (if any) and the list of patches applied to it (if
> +# any).
>  $(1)-legal-info: $(1)-patch
> -endif

A few lines below we have a dependency on $(1)-source. Always
depending on $(1)-patch makes it useless, so we also should do:

 ifeq ($$($(2)_REDISTRIBUTE),YES)
 ifneq ($$($(2)_SITE_METHOD),local)
 ifneq ($$($(2)_SITE_METHOD),override)
 # Packages that have a tarball need it downloaded beforehand
-$(1)-legal-info: $(1)-source $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
+$(1)-legal-info: $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
 endif
 endif

But beware this might conflict with the patch I just sent to fix the
ifeq()s on the same few lines ('legal-info: fix detection of "override"
packages'). Simple to fix anyway.

This does not invalidate your patch, it's just a piece of code that
will become redundant with your changes.

-- 
Luca
