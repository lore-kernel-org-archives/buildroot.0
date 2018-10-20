From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 20 Oct 2018 22:49:22 +0100
Subject: [Buildroot] [PATCH 4/5] core/download: add per-download timeout
In-Reply-To: <ae42dac572665985954d708489bb5474ccae3edc.1534972250.git.yann.morin.1998@free.fr>
References: <cover.1534972250.git.yann.morin.1998@free.fr>
 <ae42dac572665985954d708489bb5474ccae3edc.1534972250.git.yann.morin.1998@free.fr>
Message-ID: <8fd5c592-7164-6a9e-f634-55a4eec87443@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22/08/2018 22:10, Yann E. MORIN wrote:
> In case an remote sitre is slow, or hangs for whatever reasons, of the
> backend is somehow stuck (e.g. locally waiting on a lock that is never
> released), the whole build can be stuck forever.
> 
> But in such circumstances, it may happen that another download location
> (e.g. a mirror on the LAN) may already have the required tarball, and
> downloading from there would be faster and would succeed.
> 
> Add an optional, configurable, per-backend timeout.
> 
> Note: all the FDs of a backend will be forcibly closed by the kernel
> when the backend 15-terminates or is 9-killed; any lock held on those
> FDs would be automatically released by the kernel, thus releasing any
> concurrent download.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Hollis Blanchard <hollis_blanchard@mentor.com>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>>
> ---
> Note: with the follow-up patch, this would probably fix build issues
> like the ones on Hollis' autobuilder:
>     http://autobuild.buildroot.org/results/ddb/ddbc96b24017f2a2b06c6091dea3e19520bf2dd1/

 As discussed in real life, I've marked this patch and the following one as
rejected.

 Indeed, this patch would not fix the build issue on Hollis' autobuilder, it
would just work around it and sweep the problem under the carpet. If you
encounter this kind of problem (be it in an autobuilder or on some personal CI),
you should be made aware of it and not hide it.

 In addition, any timeout risks introducing false positives and breaking
functional situation.

 Regards,
 Arnout

> ---
>  Config.in                   | 14 ++++++++++++++
>  package/pkg-download.mk     |  1 +
>  support/download/dl-wrapper | 15 ++++++++++++---
>  3 files changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/Config.in b/Config.in
> index 6b5b2b043c..654734855a 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -312,6 +312,20 @@ endif
>  
>  endmenu
>  
> +config BR2_DL_TIMEOUT
> +	string "Download timeout"
> +	help
> +	  Timeout after which a non-completed download will be considered
> +	  failed. Suffix with 's' (or nothing), 'm', 'h', or 'd' for,
> +	  respectively, seconds, minutes, hours, or days.
> +
> +	  When a download times out, the next download location, if any, is
> +	  attempted, which means that, if the primary site (if any) is too
> +	  slow, then upstream will be used; if that is then still too slow,
> +	  then the backup mirror, if any, is used.
> +
> +	  Leave empty for no timeout (the default).
> +
>  config BR2_JLEVEL
>  	int "Number of jobs to run simultaneously (0 for auto)"
>  	default "0"
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index cd77ca5394..832346d3d5 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -92,6 +92,7 @@ endif
>  define DOWNLOAD
>  	$(Q)mkdir -p $($(PKG)_DL_DIR)
>  	$(Q)$(EXTRA_ENV) $(DL_WRAPPER) \
> +		-t '$(call qstrip,$(BR2_DL_TIMEOUT))' \
>  		-c '$($(PKG)_DL_VERSION)' \
>  		-d '$($(PKG)_DL_DIR)' \
>  		-D '$(DL_DIR)' \
> diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> index 723c89b7d5..fff27db497 100755
> --- a/support/download/dl-wrapper
> +++ b/support/download/dl-wrapper
> @@ -23,11 +23,11 @@ export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:ru:qf:e"
>  
>  main() {
>      local OPT OPTARG
> -    local backend output hfile recurse quiet rc
> +    local backend output hfile recurse quiet rc timeout timeout_cmd
>      local -a uris
>  
>      # Parse our options; anything after '--' is for the backend
> -    while getopts ":hc:d:D:o:n:N:H:rf:u:q" OPT; do
> +    while getopts ":hc:d:D:o:n:N:H:rf:u:t:q" OPT; do
>          case "${OPT}" in
>          h)  help; exit 0;;
>          c)  cset="${OPTARG}";;
> @@ -40,6 +40,7 @@ main() {
>          r)  recurse="-r";;
>          f)  filename="${OPTARG}";;
>          u)  uris+=( "${OPTARG}" );;
> +        t)  timeout="${OPTARG}";;
>          q)  quiet="-q";;
>          :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
>          \?) error "unknown option '%s'\n" "${OPTARG}";;
> @@ -53,6 +54,14 @@ main() {
>          error "no output specified, use -o\n"
>      fi
>  
> +    if [ -n "${timeout}" ]; then
> +        # Timeout after the specified delay; additionaly, leave
> +        # 30 more seconds for the backend to properly terminate
> +        # (e.g. to cleanup behind itself), after which forcibly
> +        # kill the backend.
> +        timeout_cmd="timeout --kill-after=30s ${timeout}"
> +    fi
> +
>      # Legacy handling: check if the file already exists in the global
>      # download directory. If it does, hard-link it. If it turns out it
>      # was an incorrect download, we'd still check it below anyway.
> @@ -123,7 +132,7 @@ main() {
>          # directory to remove all the cruft it may have left behind, and try
>          # the next URI until it succeeds. Once out of URI to try, we need to
>          # cleanup and exit.
> -        if ! "${OLDPWD}/support/download/${backend}" \
> +        if ! ${timeout_cmd} "${OLDPWD}/support/download/${backend}" \
>                  $([ -n "${urlencode}" ] && printf %s '-e') \
>                  -c "${cset}" \
>                  -d "${dl_dir}" \
> 
