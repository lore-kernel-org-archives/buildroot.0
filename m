From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Jan 2019 22:17:42 +0100
Subject: [Buildroot] [PATCH 03/11] support/download: reintroduce
 'source-check' target
In-Reply-To: <20190103204026.23512-4-patrickdepinguin@gmail.com>
References: <20190103204026.23512-1-patrickdepinguin@gmail.com>
 <20190103204026.23512-4-patrickdepinguin@gmail.com>
Message-ID: <20190103211742.GC5991@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-01-03 21:40 +0100, Thomas De Schampheleire spake thusly:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Commit bf28a165d992681a85b43a886005e669b3cb579b removed the source-check
> target to allow easier refactoring of the download infrastructure.
> It was partly based on the fact that no-one really used this target.
> 
> However, it turns out that there _are_ good uses for it. In a work
> environment where many people are submitting changes to a Buildroot
> repository, one cannot always blindly trust every change. A typical case
> of human error is when bumping the version of a package but forgetting to
> upload the tarball to the internal BR2_PRIMARY_SITE or (in case of a
> repository) pushing the new changesets to the repository.
> If a user cannot directly push to the Buildroot repository but needs to
> queue their change via an automatic validation system, that validation
> system can use 'make source-check' on the relevant defconfigs to protect
> against such errors. A full download would also be possible but takes
> longer and unnecessarily uses internal network bandwidth.

But still, at some point, you will want your CI to actually test the
change, so you will need to have the stuff downloaded... So, why can't
you simply use 'make source && make' ? It would (mostly) have the actual
result you are looking for: do the check that everything is available,
and if it is, then the build can proceed. If something was missing, that
would have bailed out early.

The only thing that differs with source-check, is that the network will
actually be used (boohoo!).

However, since we added local cache for git, you would not need to fetch
much. Also, tarballs (from wget et al) were already cached locally. Of
course, that means you'd have to have BR2_DL_DIR in your envioronment,
pointing to a dl location that is persistent...

What is missing (guess it) is a local cache for Hg. I started working on
it a while ago (rght after the git cache was merged), but dropped it as
I had no way to throughly test it.

So, if you are really concerned about not exhausting your internal
network that much (I know some companies have slow links between remote
sites, so I understand [0]), what about you provide an Hg caching like
we have for git instead? ;-)

So, I am definitely not convinced by the need for source-check...

[0] But then, does it make sense that the CI and the source code are
hosted at different sites? That'd be weird...

Regards,
Yann E. MORIN.

> With that use case in mind, this commit reintroduces the 'source-check'
> target, but embedded in the current situation with a dl-wrapper.  The
> changes to the wrapper are minimal (not considering additional indentation).
> A new option '-C' means 'check only' and will be passed to the download
> backends. If the backend supports the option, no download will happen. If it
> does not, then the backend will actually perform a download as a means of
> checking that the source exists (a form of graceful degradation). In neither
> case, though, hash checking is performed (as the standard case is without
> download thus without file to calculate hashes on).
> 
> Subsequent commits will actually implement -C in the backends.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  Makefile                    |  7 +++
>  package/pkg-download.mk     | 19 +++++++
>  package/pkg-generic.mk      | 14 +++++-
>  support/download/dl-wrapper | 99 ++++++++++++++++++++-----------------
>  4 files changed, 94 insertions(+), 45 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index c5b78b3274..f3e22d213f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -131,6 +131,7 @@ noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconf
>  # (default target is to build), or when MAKECMDGOALS contains
>  # something else than one of the nobuild_targets.
>  nobuild_targets := source %-source \
> +	source-check %-source-check %-all-source-check \
>  	legal-info %-legal-info external-deps _external-deps \
>  	clean distclean help show-targets graph-depends \
>  	%-graph-depends %-show-depends %-show-version \
> @@ -788,6 +789,9 @@ target-post-image: $(TARGETS_ROOTFS) target-finalize staging-finalize
>  .PHONY: source
>  source: $(foreach p,$(PACKAGES),$(p)-all-source)
>  
> +.PHONY: source-check
> +source-check: $(foreach p,$(PACKAGES),$(p)-all-source-check)
> +
>  .PHONY: _external-deps external-deps
>  _external-deps: $(foreach p,$(PACKAGES),$(p)-all-external-deps)
>  external-deps:
> @@ -1070,6 +1074,8 @@ help:
>  	@echo '  <pkg>-dirclean         - Remove <pkg> build directory'
>  	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
>  	@echo '  <pkg>-rebuild          - Restart the build from the build step'
> +	@echo '  <pkg>-source-check     - Check package for valid download URLs'
> +	@echo '  <pkg>-all-source-check - Check package and its dependencies for valid download URLs'
>  	$(foreach p,$(HELP_PACKAGES), \
>  		@echo $(sep) \
>  		@echo '$($(p)_NAME):' $(sep) \
> @@ -1089,6 +1095,7 @@ help:
>  	@echo
>  	@echo 'Miscellaneous:'
>  	@echo '  source                 - download all sources needed for offline-build'
> +	@echo '  source-check           - check selected packages for valid download URLs'
>  	@echo '  external-deps          - list external packages used'
>  	@echo '  legal-info             - generate info about license compliance'
>  	@echo '  printvars              - dump all the internal variables'
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 7cd87c38ff..cc04e316e2 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -106,3 +106,22 @@ define DOWNLOAD
>  		-- \
>  		$($(PKG)_DL_OPTS)
>  endef
> +
> +define SOURCE_CHECK
> +	$(Q)mkdir -p $($(PKG)_DL_DIR)
> +	$(Q)$(EXTRA_ENV) $(FLOCK) $(DL_WRAPPER) \
> +		-C \
> +		-c '$($(PKG)_DL_VERSION)' \
> +		-d '$($(PKG)_DL_DIR)' \
> +		-D '$(DL_DIR)' \
> +		-f '$(notdir $(1))' \
> +		-H '$($(PKG)_HASH_FILE)' \
> +		-n '$($(PKG)_BASENAME_RAW)' \
> +		-N '$($(PKG)_RAWNAME)' \
> +		-o '$($(PKG)_DL_DIR)/$(notdir $(1))' \
> +		$(if $($(PKG)_GIT_SUBMODULES),-r) \
> +		$(DOWNLOAD_URIS) \
> +		$(QUIET) \
> +		-- \
> +		$($(PKG)_DL_OPTS)
> +endef
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index f5cab2b9c2..707996e384 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -780,6 +780,10 @@ $(1)-legal-source:	$$($(2)_TARGET_ACTUAL_SOURCE)
>  endif # actual sources != sources
>  endif # actual sources != ""
>  
> +$(1)-source-check: PKG=$(2)
> +$(1)-source-check:
> +	$$(foreach p,$$($(2)_ALL_DOWNLOADS),$$(call SOURCE_CHECK,$$(p))$$(sep))
> +
>  $(1)-external-deps:
>  	@for p in $$($(2)_SOURCE) $$($(2)_PATCH) $$($(2)_EXTRA_DOWNLOADS) ; do \
>  		echo `basename $$$$p` ; \
> @@ -804,6 +808,9 @@ $(1)-rsync:		$$($(2)_TARGET_RSYNC)
>  $(1)-source:
>  $(1)-legal-source:
>  
> +$(1)-source-check:
> +	test -d $$($(2)_OVERRIDE_SRCDIR)
> +
>  $(1)-external-deps:
>  	@echo "file://$$($(2)_OVERRIDE_SRCDIR)"
>  endif
> @@ -838,6 +845,9 @@ $(1)-graph-rdepends: graph-depends-requirements
>  $(1)-all-source:	$(1)-source
>  $(1)-all-source:	$$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-source)
>  
> +$(1)-all-source-check:	$(1)-source-check
> +$(1)-all-source-check:	$$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-source-check)
> +
>  $(1)-all-external-deps:	$(1)-external-deps
>  $(1)-all-external-deps:	$$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-external-deps)
>  
> @@ -1036,6 +1046,7 @@ DL_TOOLS_DEPENDENCIES += $$(call extractor-dependency,$$($(2)_SOURCE))
>  	$(1)-all-external-deps \
>  	$(1)-all-legal-info \
>  	$(1)-all-source \
> +	$(1)-all-source-check \
>  	$(1)-build \
>  	$(1)-clean-for-rebuild \
>  	$(1)-clean-for-reconfigure \
> @@ -1060,7 +1071,8 @@ DL_TOOLS_DEPENDENCIES += $$(call extractor-dependency,$$($(2)_SOURCE))
>  	$(1)-rsync \
>  	$(1)-show-depends \
>  	$(1)-show-version \
> -	$(1)-source
> +	$(1)-source \
> +	$(1)-source-check
>  
>  ifneq ($$($(2)_SOURCE),)
>  ifeq ($$($(2)_SITE),)
> diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> index 3315bd410e..1ed2e654de 100755
> --- a/support/download/dl-wrapper
> +++ b/support/download/dl-wrapper
> @@ -17,7 +17,7 @@
>  # We want to catch any unexpected failure, and exit immediately.
>  set -e
>  
> -export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:ru:qf:e"
> +export BR_BACKEND_DL_GETOPTS=":hc:Cd:o:n:N:H:ru:qf:e"
>  
>  main() {
>      local OPT OPTARG
> @@ -25,9 +25,10 @@ main() {
>      local -a uris
>  
>      # Parse our options; anything after '--' is for the backend
> -    while getopts ":c:d:D:o:n:N:H:rf:u:q" OPT; do
> +    while getopts ":c:Cd:D:o:n:N:H:rf:u:q" OPT; do
>          case "${OPT}" in
>          c)  cset="${OPTARG}";;
> +        C)  checkonly=-C;;
>          d)  dl_dir="${OPTARG}";;
>          D)  old_dl_dir="${OPTARG}";;
>          o)  output="${OPTARG}";;
> @@ -46,38 +47,40 @@ main() {
>      # Forget our options, and keep only those for the backend
>      shift $((OPTIND-1))
>  
> -    if [ -z "${output}" ]; then
> -        error "no output specified, use -o\n"
> -    fi
> +    if [ -z "${checkonly}" ]; then
> +        if [ -z "${output}" ]; then
> +            error "no output specified, use -o\n"
> +        fi
>  
> -    # Legacy handling: check if the file already exists in the global
> -    # download directory. If it does, hard-link it. If it turns out it
> -    # was an incorrect download, we'd still check it below anyway.
> -    # If we can neither link nor copy, fallback to doing a download.
> -    # NOTE! This is not atomic, is subject to TOCTTOU, but the whole
> -    # dl-wrapper runs under an flock, so we're safe.
> -    if [ ! -e "${output}" -a -e "${old_dl_dir}/${filename}" ]; then
> -        ln "${old_dl_dir}/${filename}" "${output}" || \
> -        cp "${old_dl_dir}/${filename}" "${output}" || \
> -        true
> -    fi
> +        # Legacy handling: check if the file already exists in the global
> +        # download directory. If it does, hard-link it. If it turns out it
> +        # was an incorrect download, we'd still check it below anyway.
> +        # If we can neither link nor copy, fallback to doing a download.
> +        # NOTE! This is not atomic, is subject to TOCTTOU, but the whole
> +        # dl-wrapper runs under an flock, so we're safe.
> +        if [ ! -e "${output}" -a -e "${old_dl_dir}/${filename}" ]; then
> +            ln "${old_dl_dir}/${filename}" "${output}" || \
> +            cp "${old_dl_dir}/${filename}" "${output}" || \
> +            true
> +        fi
>  
> -    # If the output file already exists and:
> -    # - there's no .hash file: do not download it again and exit promptly
> -    # - matches all its hashes: do not download it again and exit promptly
> -    # - fails at least one of its hashes: force a re-download
> -    # - there's no hash (but a .hash file): consider it a hard error
> -    if [ -e "${output}" ]; then
> -        if support/download/check-hash ${quiet} "${hfile}" "${output}" "${output##*/}"; then
> -            exit 0
> -        elif [ ${?} -ne 2 ]; then
> -            # Do not remove the file, otherwise it might get re-downloaded
> -            # from a later location (i.e. primary -> upstream -> mirror).
> -            # Do not print a message, check-hash already did.
> -            exit 1
> +        # If the output file already exists and:
> +        # - there's no .hash file: do not download it again and exit promptly
> +        # - matches all its hashes: do not download it again and exit promptly
> +        # - fails at least one of its hashes: force a re-download
> +        # - there's no hash (but a .hash file): consider it a hard error
> +        if [ -e "${output}" ]; then
> +            if support/download/check-hash ${quiet} "${hfile}" "${output}" "${output##*/}"; then
> +                exit 0
> +            elif [ ${?} -ne 2 ]; then
> +                # Do not remove the file, otherwise it might get re-downloaded
> +                # from a later location (i.e. primary -> upstream -> mirror).
> +                # Do not print a message, check-hash already did.
> +                exit 1
> +            fi
> +            rm -f "${output}"
> +            warn "Re-downloading '%s'...\n" "${output##*/}"
>          fi
> -        rm -f "${output}"
> -        warn "Re-downloading '%s'...\n" "${output##*/}"
>      fi
>  
>      # Look through all the uris that we were given to download the package
> @@ -127,7 +130,7 @@ main() {
>                  -f "${filename}" \
>                  -u "${uri}" \
>                  -o "${tmpf}" \
> -                ${quiet} ${recurse} -- "${@}"
> +                ${quiet} ${recurse} ${checkonly} -- "${@}"
>          then
>              # cd back to keep path coherence
>              cd "${OLDPWD}"
> @@ -138,19 +141,21 @@ main() {
>          # cd back to free the temp-dir, so we can remove it later
>          cd "${OLDPWD}"
>  
> -        # Check if the downloaded file is sane, and matches the stored hashes
> -        # for that file
> -        if support/download/check-hash ${quiet} "${hfile}" "${tmpf}" "${output##*/}"; then
> -            rc=0
> -        else
> -            if [ ${?} -ne 3 ]; then
> -                rm -rf "${tmpd}"
> -                continue
> +        if [ -z "${checkonly}" ]; then
> +            # Check if the downloaded file is sane, and matches the stored hashes
> +            # for that file
> +            if support/download/check-hash ${quiet} "${hfile}" "${tmpf}" "${output##*/}"; then
> +                rc=0
> +            else
> +                if [ ${?} -ne 3 ]; then
> +                    rm -rf "${tmpd}"
> +                    continue
> +                fi
> +
> +                # the hash file exists and there was no hash to check the file
> +                # against
> +                rc=1
>              fi
> -
> -            # the hash file exists and there was no hash to check the file
> -            # against
> -            rc=1
>          fi
>          download_and_check=1
>          break
> @@ -163,6 +168,12 @@ main() {
>          exit 1
>      fi
>  
> +    # If we only need to check the presence of sources, stop here.
> +    # No need to handle output files.
> +    if [ -n "${checkonly}" ]; then
> +        exit 0
> +    fi
> +
>      # tmp_output is in the same directory as the final output, so we can
>      # later move it atomically.
>      tmp_output="$(mktemp "${output}.XXXXXX")"
> -- 
> 2.18.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
