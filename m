From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Nov 2013 08:12:09 +0100
Subject: [Buildroot] [PATCH 1 of 6 v2] legal info: fix saving of host
	package licenses
In-Reply-To: <e07dc5f55104adb4a171.1381151708@argentina>
References: <patchbomb.1381151707@argentina>
 <e07dc5f55104adb4a171.1381151708@argentina>
Message-ID: <5281D4C9.1070306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/10/13 15:15, Thomas De Schampheleire wrote:
> Due to some tricky make behavior, the license texts of host packages that
> did not provide an explicit HOST_FOO_LICENSE_FILES definition was not saved.
> The problem is that you cannot correctly use a variable defined/updated
> inside a call'ed block as input to a foreach statement. If you try to use
> $(FOO) then only the original value of FOO is used for foreach, any update
> inside the call'ed block is ignored. However, if you use $$(FOO), the entire
> contents of FOO (typically a list of items) is passed as one item to
> foreach, thus causing just one iteration instead of several.

 The description of the problem is wrong... It has nothing to do with call,
it is due to the eval behaviour.

 Any variable referenced with a single $ inside the inner-generic-package macro
is expanded before the resulting contents are eval'ed. Therefore, it is not
possible to refer to variables defined by the inner-generic-package macro
from within a single-$ function call.

 Fortunately there is a simple solution: use $$. See below...

> 
> To fix the problem, one should only use values in foreach that have not
> changed inside the call'ed block. In the case of (HOST_)FOO_LICENSE_FILES,
> this means repeating the checks for a valid HOST_FOO_X and using FOO_X as
> fallback.
> 
> Additionally, a few empty lines have been added to the legal-info-foo block
> for clarity, as the amount of nested ifdef/ifeq statements have become very
> high.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> ---
> v2:
> - implement a solution for packages that have multiple license files.
> - fix accidental mixup of code from another patch
> 
>   package/pkg-generic.mk |  23 ++++++++++++++++++++---
>   1 files changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -499,26 +499,43 @@ endif
>   $(1)-legal-info:
>   # Packages without a source are assumed to be part of Buildroot, skip them.
>   ifneq ($(call qstrip,$$($(2)_SOURCE)),)
> +
>   ifeq ($$($(2)_SITE_METHOD),local)
>   # Packages without a tarball: don't save and warn
>   	@$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),local)
> +
>   else ifneq ($$($(2)_OVERRIDE_SRCDIR),)
>   	@$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),override)
> +
>   else
>   # Other packages
> +
>   # Save license files if defined
>   ifeq ($(call qstrip,$$($(2)_LICENSE_FILES)),)
>   	@$(call legal-license-nofiles,$$($(2)_RAWNAME))
>   	@$(call legal-warning-pkg,$$($(2)_RAWNAME),cannot save license ($(2)_LICENSE_FILES not defined))
>   else
> +# We cannot use $$($(2)_LICENSE_FILES) in the foreach below because it fails
> +# for host packages that have no explicit HOST_FOO_LICENSE_FILES set. We have
> +# to explicitly repeat the check for HOST_FOO_X and FOO_X.
> +ifeq ($($(2)_LICENSE_FILES),)
> +ifneq ($($(3)_LICENSE_FILES),)
> +# Host package with no explicit HOST_FOO_LICENSE_FILES
> +	@$(foreach F,$($(3)_LICENSE_FILES),$(call legal-license-file,$$($(2)_RAWNAME),$(F),$$($(2)_DIR)/$(F))$$(sep))
> +endif
> +else
> +# Target package, or host package with explicit HOST_FOO_LICENSE_FILES
>   	@$(foreach F,$($(2)_LICENSE_FILES),$(call legal-license-file,$$($(2)_RAWNAME),$(F),$$($(2)_DIR)/$(F))$$(sep))

 Try

	@$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$(F),$$($(2)_DIR)/$$(F))$$(sep))

 Only the $(2) is expanded immediately, the rest will be expanded when
the legal-info target is executed.

 Regards,
 Arnout

> -endif
> +endif # host/target distinction
> +endif # license files
> +
>   ifeq ($$($(2)_REDISTRIBUTE),YES)
>   # Copy the source tarball (just hardlink if possible)
>   	@cp -l $(DL_DIR)/$$($(2)_SOURCE) $(REDIST_SOURCES_DIR) 2>/dev/null || \
>   	   cp $(DL_DIR)/$$($(2)_SOURCE) $(REDIST_SOURCES_DIR)
> -endif
> -endif
> +endif # redistribute
> +
> +endif # other packages
>   	@$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_MANIFEST_TARBALL))
>   endif # ifneq ($(call qstrip,$$($(2)_SOURCE)),)
>   	$(foreach hook,$($(2)_POST_LEGAL_INFO_HOOKS),$(call $(hook))$(sep))
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
