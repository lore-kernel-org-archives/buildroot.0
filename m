From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Apr 2015 02:17:26 +0200
Subject: [Buildroot] [PATCH 1/5 v2] package infra: add patch-dependencies
In-Reply-To: <a51d416e81f55374ba749baa81222bfe0c52782b.1426342904.git.yann.morin.1998@free.fr>
References: <cover.1426342904.git.yann.morin.1998@free.fr>
 <a51d416e81f55374ba749baa81222bfe0c52782b.1426342904.git.yann.morin.1998@free.fr>
Message-ID: <552C5C96.9050901@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/03/15 15:25, Yann E. MORIN wrote:
> Some packages need to vampirise files from one or more other packages.
> This is the case, for example, of the Linux kernel and its /extensions/.
> 
> Add a new type of dependencies, that are guaranteed to be extracted and
> patched before a package is patched.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/pkg-generic.mk | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index c1b379b..018f048 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -427,6 +427,7 @@ endif
>  
>  # Eliminate duplicates in dependencies
>  $(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))
> +$(2)_FINAL_PATCH_DEPENDENCIES = $$(sort $$($(2)_PATCH_DEPENDENCIES))
>  
>  $(2)_INSTALL_STAGING		?= NO
>  $(2)_INSTALL_IMAGES		?= NO
> @@ -538,6 +539,8 @@ $$($(2)_TARGET_CONFIGURE):	$$($(2)_TARGET_PATCH)
>  
>  $(1)-patch:		$$($(2)_TARGET_PATCH)
>  $$($(2)_TARGET_PATCH):	$$($(2)_TARGET_EXTRACT)
> +# Order-only dependency
> +$$($(2)_TARGET_PATCH):  | $$(patsubst %,%-patch,$$($(2)_FINAL_PATCH_DEPENDENCIES))
>  
>  $(1)-extract:			$$($(2)_TARGET_EXTRACT)
>  $$($(2)_TARGET_EXTRACT):	$$($(2)_TARGET_SOURCE)
> @@ -568,8 +571,12 @@ endif
>  $(1)-show-version:
>  			@echo $$($(2)_VERSION)
>  
> -$(1)-show-depends:
> +$(1)-show-build-depends:
>  			@echo $$($(2)_FINAL_DEPENDENCIES)
> +$(1)-show-patch-depends:
> +			@echo $$($(2)_FINAL_PATCH_DEPENDENCIES)
> +$(1)-show-depends:
> +			@echo $$(sort $$($(2)_FINAL_DEPENDENCIES) $$($(2)_FINAL_PATCH_DEPENDENCIES))

 I just noticed now: you added the patch dependencies to show-depends, but not
to -all-source, -all-external-deps and -all-legal-info. Isn't that wrong? Of
course, at the moment it makes no difference because it's only used for linux
extension packages and in that case the linux package is always selected anyway
so it'll end up in $(TARGETS) and get printed that way. But it just feels a bit
inconsistent.


 Regards,
 Arnout


>  
>  $(1)-graph-depends: graph-depends-requirements
>  			@$$(INSTALL) -d $$(O)/graphs
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
