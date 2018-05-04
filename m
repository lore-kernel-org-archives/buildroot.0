From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 May 2018 21:14:21 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile: add tainting support
In-Reply-To: <1525383252-4837-1-git-send-email-angelo@amarulasolutions.com>
References: <1525383252-4837-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <4c8d463b-3c6f-5ef0-425b-170483ce4a2a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Angelo,

 Some nits that were already present in v1 but I didn't review before...

On 03-05-18 23:34, Angelo Compagnucci wrote:
> From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> 
> Packages who harms the build reproducibility can declare
> FOO_TAINTS variable.
> If a package taints the build it will be added to a list
> of tainting packages.
> The build ends with a warning if the tainting packages
> list is not empty.
> Moreover, legal info will show a warning in presence
> of a tainting package.

 Commit message wrapping is a bit weird. Wrap at 72 columns.

> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  Makefile               | 11 +++++++++++
>  package/pkg-generic.mk |  9 +++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index c024c65..1b3d987 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -758,12 +758,22 @@ endif
>  
>  	touch $(TARGET_DIR)/usr
>  
> +# Check here if there are packages declaring they harm
> +# the reproducibility of the build

 As Thomas said, reproducibility is not the only issue here.

 Also, wrap at 80 columns.

 But really the comment is not necessary IMO.

> +.PHONY: check-tainted
> +check-tainted:
> +ifneq ($(BR2_TAINTED_BY),)
> +	$(error Buildroot is tainted (by: $(BR2_TAINTED_BY)).)
                ^^^^^^^^^ Your configuration

> +endif
> +
>  .PHONY: target-post-image
>  target-post-image: $(TARGETS_ROOTFS) target-finalize
>  	@rm -f $(ROOTFS_COMMON_TAR)
>  	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
>  		$(call MESSAGE,"Executing post-image script $(s)"); \
>  		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
> +	@if [ ! -z "$(BR2_TAINTED_BY)" ]; then \

 Personally I'd prefer $(if $(BR2_TAINTED_BY), at echo ...) here. But if you keep
the shell condition:

> +		echo "WARNING: Buildroot is tainted (by: $(BR2_TAINTED_BY))"; fi

 fi should be on a separate line.

>  
>  .PHONY: source
>  source: $(foreach p,$(PACKAGES),$(p)-all-source)
> @@ -1070,6 +1080,7 @@ help:
>  	@echo '  source                 - download all sources needed for offline-build'
>  	@echo '  external-deps          - list external packages used'
>  	@echo '  legal-info             - generate info about license compliance'
> +	@echo '  check-tainted          - check if any selected package harms build reproducibility'

 Not just reproducibility. but I don't really have a suggestion to improve that
isn't very long...

>  	@echo '  printvars              - dump all the internal variables'
>  	@echo
>  	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index a303dc2..a71ed6a 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -542,6 +542,10 @@ ifndef $(2)_REDISTRIBUTE
>   endif
>  endif
>  
> +ifdef $(2)_TAINTS
> + BR2_TAINTED_BY+=$$($(2)_RAWNAME)

 We normally don't indent inside make conditions.

> +endif
> +
>  $(2)_REDISTRIBUTE		?= YES
>  
>  $(2)_REDIST_SOURCES_DIR = $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))/$$($(2)_BASENAME_RAW)
> @@ -900,6 +904,11 @@ else
>  	$(Q)$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$($(2)_BASENAME_RAW),$$($(2)_PKGDIR),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
>  endif # license files
>  
> +# Save a legal warning if tainted

 Comment is useless IMO, the code speaks for itself.

> +ifeq ($$(call qstrip,$$($(2)_TAINTS)),YES)
> +	$(Q)$$(call legal-warning-pkg,$$($(2)_RAWNAME),unknown license for additional modules or dependencies)

 Er, this explanation is very specific... I think we could also add taints if
e.g. a git (or github-helper) download doesn't specify a full sha1, because then
we're also not guaranteed to have reproducibility.

 So for the legal warning, I'd rather think of something separate.

 But actually, that can be changed if/when we actually do add taints for other
situations as well. So this bit is OK as it is for me.

 Regards,
 Arnout

> +endif
> +
>  ifeq ($$($(2)_SITE_METHOD),local)
>  # Packages without a tarball: don't save and warn
>  	@$$(call legal-warning-nosource,$$($(2)_RAWNAME),local)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
