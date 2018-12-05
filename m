From: Andreas Naumann <dev@andin.de>
Date: Wed, 5 Dec 2018 17:08:20 +0100
Subject: [Buildroot] [PATCH next v6 07/10] core: implement per-package
 SDK and target
In-Reply-To: <20181123145815.13008-8-thomas.petazzoni@bootlin.com>
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
 <20181123145815.13008-8-thomas.petazzoni@bootlin.com>
Message-ID: <1f520844-5501-a60b-cf66-5bae57b9f420@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am 23.11.18 um 15:58 schrieb Thomas Petazzoni:
> This commit implements the core of the move to per-package SDK and
<SNIP>
>   
> -host-finalize: $(HOST_DIR_SYMLINK)
> +host-finalize: $(PACKAGES) $(HOST_DIR) $(HOST_DIR_SYMLINK)
> +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> +	@$(call MESSAGE,"Creating global host directory")
> +	$(foreach pkg,$(sort $(PACKAGES)),\
> +		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/host/ \
> +		$(PER_PACKAGE_DIR)/$(pkg)/host/ \
> +		$(HOST_DIR)$(sep))
> +endif
>   
>   .PHONY: staging-finalize
>   staging-finalize:
>   	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
>   
>   .PHONY: target-finalize
> -target-finalize: $(PACKAGES) host-finalize
> +target-finalize: $(PACKAGES) $(TARGET_DIR) host-finalize
> +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> +	@$(call MESSAGE,"Creating global target directory")
> +	$(foreach pkg,$(sort $(PACKAGES)),\
> +		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/target/ \
> +		$(PER_PACKAGE_DIR)/$(pkg)/target/ \
> +		$(TARGET_DIR)$(sep))
> +endif
>   	@$(call MESSAGE,"Finalizing target directory")
>   	# Check files that are touched by more than one package
>   	./support/scripts/check-uniq-files -t target $(BUILD_DIR)/packages-file-list.txt

In an answer to v4 of this series I mentioned the issue I had with empty 
RPATH in some host-lib. After digging some more I found this happens 
during the prepare-sdk step (which I call in my wrapper script). Before 
this step, your suggested readelf output reports the correct pathes, 
however after, RPATH is empty. I compared this to a "standard" SDK, 
there RPATH is set to $ORIGIN/../lib or something similar.

Actually, an unrelated question arises: Why does the SDK need to build 
world, which includes all filesystem images, first? Should it not be 
sufficient to depend on $(PACKAGES) or now host-finalize only?


regards,
Andreas


> @@ -972,7 +997,8 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
>   
>   # staging and target directories do NOT list these as
>   # dependencies anywhere else
> -$(BUILD_DIR) $(BASE_TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
> +$(BUILD_DIR) $(BASE_TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) \
> +	$(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST) $(PER_PACKAGE_DIR):
>   	@mkdir -p $@
>   
>   # outputmakefile generates a Makefile in the output directory, if using a
> @@ -1011,7 +1037,7 @@ printvars:
>   clean:
>   	rm -rf $(BASE_TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) $(HOST_DIR_SYMLINK) \
>   		$(BUILD_DIR) $(BASE_DIR)/staging \
> -		$(LEGAL_INFO_DIR) $(GRAPHS_DIR)
> +		$(LEGAL_INFO_DIR) $(GRAPHS_DIR) $(PER_PACKAGE_DIR)
>   
>   .PHONY: distclean
>   distclean: clean
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 9b4db845b6..b1f0cdf34a 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -98,7 +98,7 @@ GLOBAL_INSTRUMENTATION_HOOKS += check_bin_arch
>   # have a proper DT_RPATH or DT_RUNPATH tag
>   define check_host_rpath
>   	$(if $(filter install-host,$(2)),\
> -		$(if $(filter end,$(1)),support/scripts/check-host-rpath $(3) $(HOST_DIR)))
> +		$(if $(filter end,$(1)),support/scripts/check-host-rpath $(3) $(HOST_DIR) $(PER_PACKAGE_DIR)))
>   endef
>   GLOBAL_INSTRUMENTATION_HOOKS += check_host_rpath
>   
> @@ -133,6 +133,7 @@ endif
>   # Retrieve the archive
>   $(BUILD_DIR)/%/.stamp_downloaded:
>   	@$(call step_start,download)
> +	$(call prepare-per-package-directory,$($(PKG)_FINAL_DOWNLOAD_DEPENDENCIES))
>   	$(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
>   # Only show the download message if it isn't already downloaded
>   	$(Q)for p in $($(PKG)_ALL_DOWNLOADS); do \
> @@ -159,6 +160,7 @@ $(BUILD_DIR)/%/.stamp_actual_downloaded:
>   $(BUILD_DIR)/%/.stamp_extracted:
>   	@$(call step_start,extract)
>   	@$(call MESSAGE,"Extracting")
> +	$(call prepare-per-package-directory,$($(PKG)_FINAL_EXTRACT_DEPENDENCIES))
>   	$(foreach hook,$($(PKG)_PRE_EXTRACT_HOOKS),$(call $(hook))$(sep))
>   	$(Q)mkdir -p $(@D)
>   	$($(PKG)_EXTRACT_CMDS)
> @@ -219,6 +221,7 @@ $(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
>   $(BUILD_DIR)/%/.stamp_configured:
>   	@$(call step_start,configure)
>   	@$(call MESSAGE,"Configuring")
> +	$(call prepare-per-package-directory,$($(PKG)_FINAL_DEPENDENCIES))
>   	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
>   	$($(PKG)_CONFIGURE_CMDS)
>   	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index bffd79dfb0..4ca2eebc95 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -62,6 +62,27 @@ $$(error Package error: use $(2) instead of $(1). Please fix your .mk file)
>   endif
>   endef
>   
> +# This function prepares the per-package HOST_DIR and TARGET_DIR of
> +# the current package, by rsync the host and target directories of the
> +# dependencies of this package. The list of dependencies is passed as
> +# argument, so that this function can be used to prepare with
> +# different set of dependencies (download, extract, configure, etc.)
> +#
> +# $1: space-separated list of dependencies
> +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> +define prepare-per-package-directory
> +	mkdir -p $(HOST_DIR) $(TARGET_DIR)
> +	$(foreach pkg,$(1),\
> +		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/host/ \
> +		$(PER_PACKAGE_DIR)/$(pkg)/host/ \
> +		$(HOST_DIR)$(sep))
> +	$(foreach pkg,$(1),\
> +		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/target/ \
> +		$(PER_PACKAGE_DIR)/$(pkg)/target/ \
> +		$(TARGET_DIR)$(sep))
> +endef
> +endif
> +
>   #
>   # legal-info helper functions
>   #
> diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
> index 6c5767da05..787a1763b0 100755
> --- a/support/scripts/check-host-rpath
> +++ b/support/scripts/check-host-rpath
> @@ -11,6 +11,7 @@ export LC_ALL=C
>   main() {
>       local pkg="${1}"
>       local hostdir="${2}"
> +    local perpackagedir="${3}"
>       local file ret
>   
>       # Remove duplicate and trailing '/' for proper match
> @@ -20,7 +21,7 @@ main() {
>       while read file; do
>           is_elf "${file}" || continue
>           elf_needs_rpath "${file}" "${hostdir}" || continue
> -        check_elf_has_rpath "${file}" "${hostdir}" && continue
> +        check_elf_has_rpath "${file}" "${hostdir}" "${perpackagedir}" && continue
>           if [ ${ret} -eq 0 ]; then
>               ret=1
>               printf "***\n"
> @@ -57,6 +58,7 @@ elf_needs_rpath() {
>   check_elf_has_rpath() {
>       local file="${1}"
>       local hostdir="${2}"
> +    local perpackagedir="${3}"
>       local rpath dir
>   
>       while read rpath; do
> @@ -65,6 +67,7 @@ check_elf_has_rpath() {
>               dir="$( sed -r -e 's:/+:/:g; s:/$::;' <<<"${dir}" )"
>               [ "${dir}" = "${hostdir}/lib" ] && return 0
>               [ "${dir}" = "\$ORIGIN/../lib" ] && return 0
> +            [[ ${dir} =~ ${perpackagedir}/[^/]*/host/lib ]] && return 0
>           done
>       done < <( readelf -d "${file}"                                              \
>                 |sed -r -e '/.* \(R(UN)?PATH\) +Library r(un)?path: \[(.+)\]$/!d' \
> 
