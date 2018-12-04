From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Dec 2018 23:24:58 +0100
Subject: [Buildroot] [PATCH next v6 07/10] core: implement per-package
 SDK and target
In-Reply-To: <20181123145815.13008-8-thomas.petazzoni@bootlin.com>
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
 <20181123145815.13008-8-thomas.petazzoni@bootlin.com>
Message-ID: <dc8cc6eb-59ab-2913-f094-cf5ae48eec4d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Thomas,

 A few random remarks.

On 23/11/2018 15:58, Thomas Petazzoni wrote:
> This commit implements the core of the move to per-package SDK and
> target directories. The main idea is that instead of having a global
> output/host and output/target in which all packages install files, we
> switch to per-package host and target directories, that only contain
> their explicit dependencies.
> 
> There are two main benefits:
> 
>  - Packages will no longer discover dependencies that they do not
>    explicitly indicate in their <pkg>_DEPENDENCIES variable.
> 
>  - We can support top-level parallel build properly, because a package
>    only "sees" its own host directory and target directory, isolated
>    from the build of other packages that can happen in parallel.
> 
> It works as follows:
> 
>  - A new output/per-package/ directory is created, which will contain
>    one sub-directory per package, and inside it, a "host" directory
>    and a "target" directory:
> 
>    output/per-package/busybox/target
>    output/per-package/busybox/host
>    output/per-package/host-fakeroot/target
>    output/per-package/host-fakeroot/host
> 
>    This output/per-package/ directory is PER_PACKAGE_DIR.
> 
>  - The global TARGET_DIR and HOST_DIR variable now automatically point
>    to the per-package directory when PKG is defined. So whenever a
>    package references $(HOST_DIR) or $(TARGET_DIR) in its build
>    process, it effectively references the per-package host/target
>    directories. Note that STAGING_DIR is a sub-dir of HOST_DIR, so it
>    is handled as well.
> 
>  - Of course, packages have dependencies, so those dependencies must
>    be installed in the per-package host and target directories. To do
>    so, we simply rsync (using hard links to save space and time) the
>    host and target directories of the direct dependencies of the
>    package to the current package host and target directories.
> 
>    We only need to take care of direct dependencies (and not
>    recursively all dependencies), because we accumulate into those
>    per-package host and target directories the files installed by the
>    dependencies. Note that this only works because we make the
>    assumption that one package does *not* overwrite files installed by
>    another package.

 So that means that if BR2_PER_PACKAGE_DIRECTORIES=y, check-uniq-files should
give errors instead of warnings, no?

> 
>    This is done for "extract dependencies" at the beginning of the
>    extract step, and for "normal dependencies" at the beginning of the
>    configure step.
> 
> This is basically enough to make per-package SDK and target work. The
> only gotcha is that at the end of the build, output/target and
> output/host are empty, which means that:
> 
>  - The filesystem image creation code cannot work.
> 
>  - We don't have a SDK to build code outside of Buildroot.
> 
> In order to fix this, this commit extends the target-finalize step so
> that it starts by populating output/target and output/host by
> rsync-ing into them the target and host directories of all packages
> listed in the $(PACKAGES) variable. It is necessary to do this
> sequentially in the target-finalize step and not in each
> package. Doing it in package installation means that it can be done in
> parallel. In that case, there is a chance that two rsyncs are creating
> the same hardlink or directory at the same time, which makes one of
> them fail.

 Great that this is explained in the commit log.

> 
> Also, with this change to per-package directories, binaries built for
> the host may contain RPATH pointing to per-package directories. This
> commit therefore teaches the check-host-rpath script with the fact
> that RPATH pointing to a per-package directory are OK.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  Config.in                        | 18 ++++++++++++++++
>  Makefile                         | 36 +++++++++++++++++++++++++++-----
>  package/pkg-generic.mk           |  5 ++++-
>  package/pkg-utils.mk             | 21 +++++++++++++++++++
>  support/scripts/check-host-rpath |  5 ++++-
>  5 files changed, 78 insertions(+), 7 deletions(-)
> 
> diff --git a/Config.in b/Config.in
> index f965e9d6d8..2d8a07fda7 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -696,6 +696,24 @@ config BR2_REPRODUCIBLE
>  	  This is labeled as an experimental feature, as not all
>  	  packages behave properly to ensure reproducibility.
>  
> +config BR2_PER_PACKAGE_DIRECTORIES
> +	bool "Use per-package directories (experimental)"
> +	help
> +	  This option will change the build process of Buildroot
> +	  package to use per-package target and host directories.
> +
> +	  This is useful for two related purposes:
> +
> +	    - Cleanly isolate the build of each package, so that a
> +	      given package only "sees" the dependencies it has
> +	      explicitly expressed, and not other packages that may
> +	      have by chance been built before.
> +
> +	    - Enable top-level parallel build.
> +
> +	  This is labeled as an experimental feature, as not all
> +	  packages behave properly with per-package directories.
> +
>  endmenu
>  
>  comment "Security Hardening Options"
> diff --git a/Makefile b/Makefile
> index 23032988a5..35fe1b3644 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -207,7 +207,8 @@ BINARIES_DIR := $(BASE_DIR)/images
>  # The target directory is common to all packages,
>  # but there is one that is specific to each filesystem.
>  BASE_TARGET_DIR := $(BASE_DIR)/target
> -TARGET_DIR = $(if $(ROOTFS),$(ROOTFS_$(ROOTFS)_TARGET_DIR),$(BASE_TARGET_DIR))
> +PER_PACKAGE_DIR := $(BASE_DIR)/per-package

 Perhaps it would be nice to add a preparatory patch that reorders the
definitions of BASE_TARGET_DIR, TARGET_DIR, STAGING_DIR and HOST_DIR so they are
all together, and can be in a single BR2_PER_PACKAGE_DIRECTORIES condition.

> +
>  # initial definition so that 'make clean' works for most users, even without
>  # .config. HOST_DIR will be overwritten later when .config is included.
>  HOST_DIR := $(BASE_DIR)/host
> @@ -246,6 +247,12 @@ endif
>  #      make -j$((`getconf _NPROCESSORS_ONLN`+1))
>  .NOTPARALLEL:
>  
> +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> +TARGET_DIR = $(if $(ROOTFS),$(ROOTFS_$(ROOTFS)_TARGET_DIR),$(if $(PKG),$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/target,$(BASE_TARGET_DIR)))
> +else
> +TARGET_DIR = $(if $(ROOTFS),$(ROOTFS_$(ROOTFS)_TARGET_DIR),$(BASE_TARGET_DIR))
> +endif

 Was there any reason to move the definition of TARGET_DIR?

> +
>  # timezone and locale may affect build output
>  ifeq ($(BR2_REPRODUCIBLE),y)
>  export TZ = UTC
> @@ -455,7 +462,11 @@ LZCAT := $(call qstrip,$(BR2_LZCAT))
>  TAR_OPTIONS = $(call qstrip,$(BR2_TAR_OPTIONS)) -xf
>  
>  # packages compiled for the host go here
> +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> +HOST_DIR = $(if $(PKG),$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/host,$(call qstrip,$(BR2_HOST_DIR)))
> +else
>  HOST_DIR := $(call qstrip,$(BR2_HOST_DIR))
> +endif
>  
>  ifneq ($(HOST_DIR),$(BASE_DIR)/host)
>  HOST_DIR_SYMLINK = $(BASE_DIR)/host
> @@ -701,14 +712,28 @@ $(TARGETS_ROOTFS): target-finalize
>  # Avoid the rootfs name leaking down the dependency chain
>  target-finalize: ROOTFS=
>  
> -host-finalize: $(HOST_DIR_SYMLINK)
> +host-finalize: $(PACKAGES) $(HOST_DIR) $(HOST_DIR_SYMLINK)
> +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)	
> +	@$(call MESSAGE,"Creating global host directory")
> +	$(foreach pkg,$(sort $(PACKAGES)),\
> +		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/host/ \
> +		$(PER_PACKAGE_DIR)/$(pkg)/host/ \
> +		$(HOST_DIR)$(sep))

 Don't you think it's worth factoring this into a pkg-utils macro? I'm thinking:

# rsync-per-package(packages,type,destdir)
# copy every per-package host or target dir (as determined by type) for packages
# (a list of packages) into destdir.
# copying is done by making hardlinks using rsync
define rsync-per-package
	$(foreach pkg,$(sort $(1)),\
		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
		$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
		$(3)$(sep))
endef

rsync-per-package-host = $(call rsync-per-package,$(1),host,$(HOST_DIR))
rsync-per-package-target = $(call rsync-per-package,$(1),target,$(TARGET_DIR))

The latter two are maybe not needed.

> +endif
>  
>  .PHONY: staging-finalize
>  staging-finalize:
>  	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
>  
>  .PHONY: target-finalize
> -target-finalize: $(PACKAGES) host-finalize
> +target-finalize: $(PACKAGES) $(TARGET_DIR) host-finalize
> +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> +	@$(call MESSAGE,"Creating global target directory")
> +	$(foreach pkg,$(sort $(PACKAGES)),\
> +		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/target/ \
> +		$(PER_PACKAGE_DIR)/$(pkg)/target/ \
> +		$(TARGET_DIR)$(sep))
> +endif
>  	@$(call MESSAGE,"Finalizing target directory")
>  	# Check files that are touched by more than one package
>  	./support/scripts/check-uniq-files -t target $(BUILD_DIR)/packages-file-list.txt

 Side note: if we make check-uniq-files return errors, we should probably also
move it to a per package step so the autobuilders can identify the failing
package. But that can be done later.

[snip]
> diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
> index 6c5767da05..787a1763b0 100755
> --- a/support/scripts/check-host-rpath
> +++ b/support/scripts/check-host-rpath
> @@ -11,6 +11,7 @@ export LC_ALL=C
>  main() {
>      local pkg="${1}"
>      local hostdir="${2}"
> +    local perpackagedir="${3}"
>      local file ret
>  
>      # Remove duplicate and trailing '/' for proper match
> @@ -20,7 +21,7 @@ main() {
>      while read file; do
>          is_elf "${file}" || continue
>          elf_needs_rpath "${file}" "${hostdir}" || continue
> -        check_elf_has_rpath "${file}" "${hostdir}" && continue
> +        check_elf_has_rpath "${file}" "${hostdir}" "${perpackagedir}" && continue
>          if [ ${ret} -eq 0 ]; then
>              ret=1
>              printf "***\n"
> @@ -57,6 +58,7 @@ elf_needs_rpath() {

 I think there should be some explanation why elf_needs_rpath doesn't need to
check all per-package directories. Basically it's because any library that the
executable may depend on must already have been rsynced into ${host_dir} which
is the per-package host directory.

 Regards,
 Arnout


>  check_elf_has_rpath() {
>      local file="${1}"
>      local hostdir="${2}"
> +    local perpackagedir="${3}"
>      local rpath dir
>  
>      while read rpath; do
> @@ -65,6 +67,7 @@ check_elf_has_rpath() {
>              dir="$( sed -r -e 's:/+:/:g; s:/$::;' <<<"${dir}" )"
>              [ "${dir}" = "${hostdir}/lib" ] && return 0
>              [ "${dir}" = "\$ORIGIN/../lib" ] && return 0
> +            [[ ${dir} =~ ${perpackagedir}/[^/]*/host/lib ]] && return 0
>          done
>      done < <( readelf -d "${file}"                                              \
>                |sed -r -e '/.* \(R(UN)?PATH\) +Library r(un)?path: \[(.+)\]$/!d' \
> 
