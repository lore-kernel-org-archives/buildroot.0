From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 9 Feb 2019 17:47:24 +0100
Subject: [Buildroot] [PATCHv2 2/8] support/download: reintroduce
 'source-check' target
In-Reply-To: <20190204180553.18394-3-patrickdepinguin@gmail.com>
References: <20190204180553.18394-1-patrickdepinguin@gmail.com>
 <20190204180553.18394-3-patrickdepinguin@gmail.com>
Message-ID: <2d4ae398-9060-1a6a-7567-71b0166db297@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Thomas,

 As mentioned in the developer meeting, I agree that your use case is important
enough to bring source-check back. I do still have some feedback on the
implementation.

On 04/02/2019 19:05, Thomas De Schampheleire wrote:
[snip]
> +define SOURCE_CHECK
> +	$(Q)mkdir -p $($(PKG)_DL_DIR)
> +	$(Q)$(EXTRA_ENV) $(FLOCK) $(DL_WRAPPER) \
> +		-C \

 Except for the -C, this is identical to the DOWNLOAD macro and should stay that
way. So I'd propose to add a second argument to DOWNLOAD in which you can pass -C.

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

 Hm, I wonder if the pre/post download hooks shouldn't be called as well... We
don't have any in-tree consumers of them, so it's hard to be sure.

[snip]
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

 Hm, I wonder if this is the correct semantics for source-check. It will check
if the package can be found in any of the URLs, but in practice, don't you want
to to be in the first one only? For the primary case, yhou'll pass PRIMARY_ONLY
of course; but if you use it to check if the upstream URL is still correct, then
you want it to fail if you can't get it there. Of course, you can do that by
clearing the SECONDARY. But is there ever any reason to check if the package
exists at any of the URLs?

 That said, special-casing the checkonly here again will only make the control
flow even more complicated...

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

 So, without the subsequent patches, it actually *will* have downloaded
something (and even with the subsequent patches it will have done that for
git/svn/...). So shouldn't the downloaded file be removed again? I'm not sure
though...

 Regards,
 Arnout

> +    if [ -n "${checkonly}" ]; then
> +        exit 0
> +    fi
> +
>      # tmp_output is in the same directory as the final output, so we can
>      # later move it atomically.
>      tmp_output="$(mktemp "${output}.XXXXXX")"
> 
