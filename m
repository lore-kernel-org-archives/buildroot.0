From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Apr 2018 12:23:29 +0200
Subject: [Buildroot] [v4 02/13] download: put most of the infra in
 dl-wrapper
In-Reply-To: <20180402081434.4411-2-maxime.hadjinlian@gmail.com>
References: <20180402081434.4411-1-maxime.hadjinlian@gmail.com>
 <20180402081434.4411-2-maxime.hadjinlian@gmail.com>
Message-ID: <20180402102329.GB3625@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-04-02 10:14 +0200, Maxime Hadjinlian spake thusly:
> The goal here is to simplify the infrastructure by putting most of the
> code in the dl-wrapper as it's easier to implement and to read.
> 
> Most of the functions were common already, this patch finalizes it by
> making the pkg-download.mk pass all the parameters needed to the
> dl-wrapper which in turns will pass everything to every backend.
> 
> The backend will then cherry-pick what it needs from these arguments
> and act accordingly.
> 
> It eases the transition to the addition of a sub directory per package
> in the DL_DIR, and later on, a git cache.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

But see a few comments below...

> ---
> v1 -> v2:
>     - Rename cp backend to file (Arnout)
>     - Don't use BR_BACKEND_DL_GETOPTS for dl-wrapper (Arnout)
>     - Add "urlencode" to scheme passed to the dl-wrapper to support the
>     fact that we need to urlencode the filename when using PRIMARY and
>     BACKUP mirror (some files are named toto.c?v=1.0) (Arnout)
>     - Fix uristripscheme replaced by bash'ism (Arnout)
>     - Add the check hash into the loop, exit with error only if all the
>     download+check failed. (Arnout)
> ---
>  package/pkg-download.mk     | 170 ++++++++------------------------------------
>  support/download/cvs        |   2 +-
>  support/download/dl-wrapper | 139 +++++++++++++++++++++++-------------
>  support/download/wget       |  10 ++-
>  4 files changed, 129 insertions(+), 192 deletions(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index a410dce1ee..2ee745fddd 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -42,6 +42,8 @@ DL_DIR := $(shell mkdir -p $(DL_DIR) && cd $(DL_DIR) >/dev/null && pwd)
>  #
>  # geturischeme: http
>  geturischeme = $(firstword $(subst ://, ,$(call qstrip,$(1))))
> +# getschemeplusuri: git|parameter+http://example.com
> +getschemeplusuri = $(call geturischeme,$(1))$(if $(2),\|$(2))+$(1)

The encoding is a bit weird... :-/

But it is need because we need to pass a single option:

  - the site method
  - options to the backend (e.g. urlencode)
  - the uri without the basename

However, this is needed only for primary/backup mirrors:

[--SNIP--]
> +ifneq ($(call qstrip,$(BR2_PRIMARY_SITE)),)
> +DOWNLOAD_URIS += \
> +	-u $(call getschemeplusuri,$(BR2_PRIMARY_SITE),urlencode)
> +endif
> +
> +ifeq ($(BR2_PRIMARY_SITE_ONLY),)
> +DOWNLOAD_URIS += \
> +	-u $($(PKG)_SITE_METHOD)+$(dir $(1))
> +ifneq ($(call qstrip,$(BR2_BACKUP_SITE)),)
> +DOWNLOAD_URIS += \
> +	-u $(call getschemeplusuri,$(BR2_BACKUP_SITE),urlencode)
> +endif
> +endif

However, we only pass the base URIs (i.e. without the trailing basename)
to the primary and backend. So  we can't urlencode the basename at that
point... Only the backend will be able to...

But as discussed IRL, this is because:

  - _SITE and _SOURCE are separate at the package level

  - the generic-package macro will aggregate the _SITE and _SOURCE
    together to form a complete URI

  - then , the DOWNLOAD macro will split it again

  - some backends may want to re-aggregate them, while other backends
    do not.

As a conclusion: reworking all this mess and complexity is a different
topic, which will take a while to sort out...

[--SNIP--]
> diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> index abc51f637a..58cc04b4c4 100755
> --- a/support/download/dl-wrapper
> +++ b/support/download/dl-wrapper
[--SNIP--]
> @@ -66,48 +69,85 @@ main() {
>          warn "Re-downloading '%s'...\n" "${output##*/}"
>      fi
>  
> -    # tmpd is a temporary directory in which backends may store intermediate
> -    # by-products of the download.
> -    # tmpf is the file in which the backends should put the downloaded content.
> -    # tmpd is located in $(BUILD_DIR), so as not to clutter the (precious)
> -    # $(BR2_DL_DIR)
> -    # We let the backends create tmpf, so they are able to set whatever
> -    # permission bits they want (although we're only really interested in
> -    # the executable bit.)
> -    tmpd="$(mktemp -d "${BUILD_DIR}/.${output##*/}.XXXXXX")"
> -    tmpf="${tmpd}/output"
> +    # Look through all the uris that we were given to downoad the package

*download (missing ell 'l')

[--SNIP--]
> -        if [ ${?} -ne 3 ]; then
> +        # If the backend fails, we can just remove the content of the temporary
> +        # directory to remove all the cruft it may have left behind, and tries
> +        # the next URI until it succeeds. Once out of URI to tries, we need to
> +        # cleanup and exit.
> +        if ! "${OLDPWD}/support/download/${backend}" \
> +                $([ -n "${urlencode}" ] && printf %s '-e') \
> +                -c "${cset}" \
> +                -n "${raw_base_name}" \
> +                -N "${raw_name}" \
> +                -f "${filename}" \
> +                -u "${uri}" \
> +                -o "${tmpf}" \
> +                ${quiet} ${recurse} "${@}"
> +        then
>              rm -rf "${tmpd}"
> -            exit 1
> +            # cd back to keep path coherence
> +            cd "${OLDPWD}"

cd before rm-rf. ;-)

Regards,
Yann E. MORIN.

> +            continue
>          fi
>  
> -        # the hash file exists and there was no hash to check the file against
> -        rc=1
> +        # cd back to free the temp-dir, so we can remove it later
> +        cd "${OLDPWD}"
> +
> +        # Check if the downloaded file is sane, and matches the stored hashes
> +        # for that file
> +        if support/download/check-hash ${quiet} "${hfile}" "${tmpf}" "${output##*/}"; then
> +            rc=0
> +        else
> +            if [ ${?} -ne 3 ]; then
> +                rm -rf "${tmpd}"
> +                continue
> +            fi
> +
> +            # the hash file exists and there was no hash to check the file
> +            # against
> +            rc=1
> +        fi
> +        download_and_check=1
> +        break
> +    done
> +
> +    # We tried every URI possible, none seems to work or to check against the
> +    # available hash. *ABORT MISSION*
> +    if [ "${download_and_check}" -eq 0 ]; then
> +        rm -rf "${tmpd}"
> +        exit 1
>      fi
>  
>      # tmp_output is in the same directory as the final output, so we can
> @@ -173,16 +213,13 @@ DESCRIPTION
>  
>      -h  This help text.
>  
> -    -b BACKEND
> -        Wrap the specified BACKEND. Known backends are:
> -            bzr     Bazaar
> -            cp      Local files
> -            cvs     Concurrent Versions System
> -            git     Git
> -            hg      Mercurial
> -            scp     Secure copy
> -            svn     Subversion
> -            wget    HTTP download
> +    -u URIs
> +        The URI to get the file from, the URI must respect the format given in
> +        the example.
> +        You may give as many '-u URI' as you want, the script will stop at the
> +        frist successful download.
> +
> +        Example: backend+URI; git+http://example.com or http+http://example.com
>  
>      -o FILE
>          Store the downloaded archive in FILE.
> diff --git a/support/download/wget b/support/download/wget
> index fece6663ca..c69e6071aa 100755
> --- a/support/download/wget
> +++ b/support/download/wget
> @@ -8,7 +8,9 @@ set -e
>  # Options:
>  #   -q          Be quiet.
>  #   -o FILE     Save into file FILE.
> +#   -f FILENAME The filename of the tarball to get at URL
>  #   -u URL      Download file at URL.
> +#   -e ENCODE   Tell wget to urlencode the filename passed to it
>  #
>  # Environment:
>  #   WGET     : the wget command to call
> @@ -18,7 +20,9 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
>      case "${OPT}" in
>      q)  verbose=-q;;
>      o)  output="${OPTARG}";;
> +    f)  filename="${OPTARG}";;
>      u)  url="${OPTARG}";;
> +    e)  encode="-e";;
>      :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
>      \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
>      esac
> @@ -32,4 +36,8 @@ _wget() {
>      eval ${WGET} "${@}"
>  }
>  
> -_wget ${verbose} "${@}" -O "'${output}'" "'${url}'"
> +# Replace every '?' with '%3F' in the filename; only for the PRIMARY and BACKUP
> +# mirror
> +[ -n "${encode}" ] && filename=${filename//\?/%3F}
> +
> +_wget ${verbose} "${@}" -O "'${output}'" "'${url}/${filename}'"
> -- 
> 2.16.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
