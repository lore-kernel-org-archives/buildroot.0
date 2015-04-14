From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Apr 2015 21:42:19 +0200
Subject: [Buildroot] [PATCHv2 10/21] Makefile: move source-check outside
 of noconfig_targets
In-Reply-To: <1428856685-4403-11-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-11-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <552D6D9B.2000301@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/04/15 18:37, Thomas Petazzoni wrote:
> make source-check is here to check whether the remote sources for the
> current selection of packages are still available. So it cannot be a
> noconfig_targets, since it depends on a configuration being
> available. The very fact that 'source-check' is basically the same as
> 'source', and one is a noconfig_target and not the other is a clear
> indication that the current implementation is wrong.

 Well, actually, source-check is a noconfig target because we don't need to read
the .config file to be able to run it. Moving it out of noconfig almost doubles
the runtime, because now both the first level and the second level make have to
parse all the makefiles.

 So the real reason to do this is not because it was wrong (just a little weird
and missing explanation), but because you need it for three patches later.

 That said, the change itself looks OK, so

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> 
> So this commit moves source-check to no longer be a noconfig_target.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Makefile | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 40ee2e2..6937dd3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -75,7 +75,7 @@ export BR2_VERSION_FULL := $(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlo
>  noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
>  	defconfig %_defconfig allyesconfig allnoconfig silentoldconfig release \
>  	randpackageconfig allyespackageconfig allnopackageconfig \
> -	source-check print-version olddefconfig
> +	print-version olddefconfig
>  
>  # Strip quotes and then whitespaces
>  qstrip = $(strip $(subst ",,$(1)))
> @@ -422,7 +422,7 @@ world: target-post-image
>  
>  .PHONY: all world toolchain dirs clean distclean source outputmakefile \
>  	legal-info legal-info-prepare legal-info-clean printvars help \
> -	target-finalize target-post-image
> +	target-finalize target-post-image source-check
>  
>  ################################################################################
>  #
> @@ -616,6 +616,10 @@ _external-deps: $(foreach p,$(PACKAGES),$(p)-all-external-deps)
>  external-deps:
>  	@$(MAKE1) -Bs $(EXTRAMAKEARGS) _external-deps | sort -u
>  
> +# check if download URLs are outdated
> +source-check:
> +	$(MAKE1) DL_MODE=SOURCE_CHECK $(EXTRAMAKEARGS) source
> +
>  legal-info-clean:
>  	@rm -fr $(LEGAL_INFO_DIR)
>  
> @@ -794,10 +798,6 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
>  		$(CONFIG_CONFIG_IN)
>  
> -# check if download URLs are outdated
> -source-check:
> -	$(MAKE1) DL_MODE=SOURCE_CHECK $(EXTRAMAKEARGS) source
> -
>  .PHONY: defconfig savedefconfig
>  
>  ################################################################################
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
