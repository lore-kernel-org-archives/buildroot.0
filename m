From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 25 Mar 2015 00:22:38 +0100
Subject: [Buildroot] [PATCH 1/5 v2] package infra: add patch-dependencies
In-Reply-To: <a51d416e81f55374ba749baa81222bfe0c52782b.1426342904.git.yann.morin.1998@free.fr>
References: <cover.1426342904.git.yann.morin.1998@free.fr>
 <a51d416e81f55374ba749baa81222bfe0c52782b.1426342904.git.yann.morin.1998@free.fr>
Message-ID: <5511F1BE.2080700@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All

Rather than dropping reviewed and tested tag without a word, I prefer to write
what I understand.
I tested the series up to patch 3/5 with xenomai extension.

Le 14/03/2015 15:25, Yann E. MORIN a ?crit :
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

After patch 3/5 applied and if xenomai extension is selected, we have "xenomai"
in LINUX_FINAL_PATCH_DEPENDENCIES.

>  
>  $(2)_INSTALL_STAGING		?= NO
>  $(2)_INSTALL_IMAGES		?= NO
> @@ -538,6 +539,8 @@ $$($(2)_TARGET_CONFIGURE):	$$($(2)_TARGET_PATCH)
>  
>  $(1)-patch:		$$($(2)_TARGET_PATCH)
>  $$($(2)_TARGET_PATCH):	$$($(2)_TARGET_EXTRACT)
> +# Order-only dependency
> +$$($(2)_TARGET_PATCH):  | $$(patsubst %,%-patch,$$($(2)_FINAL_PATCH_DEPENDENCIES))

Here LINUX_TARGET_PATCH is appended with xenomai-patch, so linux-patch can start
as soon as xenomai-patch is done.
'|' is used to not restart the build for each make invocation.

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

Here LINUX_FINAL_PATCH_DEPENDENCIES is taken into account for linux-show-depends

Before and after the patch 3/5 the result is the same for linux-show-depends:
make O=test/xenomai/ linux-show-depends
host-kmod host-lzop toolchain xenomai

After the patch 3/5, we can see that xenomai is no longer part of build
dependencies.
make O=test/xenomai/ linux-show-build-depends
host-kmod host-lzop toolchain

But it's now a patch dependencies:
make O=test/xenomai/ linux-show-patch-depends
xenomai


>  
>  $(1)-graph-depends: graph-depends-requirements
>  			@$$(INSTALL) -d $$(O)/graphs
> 

So,
    Reviewed-by: Romain Naour <romain.naour@openwide.fr>
    Tested-by: Romain Naour <romain.naour@openwide.fr>

Best regards,
Romain
