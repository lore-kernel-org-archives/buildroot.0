From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Jul 2017 02:32:29 +0200
Subject: [Buildroot] [PATCH 03/13] download: put most of the infra in
 dl-wrapper
In-Reply-To: <20170704162211.13238-4-maxime.hadjinlian@gmail.com>
References: <20170704162211.13238-1-maxime.hadjinlian@gmail.com>
 <20170704162211.13238-4-maxime.hadjinlian@gmail.com>
Message-ID: <19fd8cca-af3e-4085-e6fa-57a510097ad0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[Thomas, question for you in the middle]

On 04-07-17 18:22, Maxime Hadjinlian wrote:
> The goal here is to simplify the infrastructure by putting most of the
> code in the dl-wrapper as it's easier to implement and to read.

 Yes! I like it!

> 
> Most of the function where common already, this patch finalize it by
> making the pkg-download.mk pass all the parameters needed to the
> dl-wrapper which in turns will pass everything to every backend.
> 
> The backend will then cherry-pick what it needs from theses arguments
> and act accordingly.
> 
> It eases the transition to the addition of a sub directory per package
> in the DL_DIR, and later on, a git cache.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/pkg-download.mk     | 166 ++++++++------------------------------------

 This huge diff could have been simplified a little by

1. Removing the third argument to DOWNLOAD_INNER (could actually be part of the
first patch of this series).
2. Replacing the calls to the DOWNLOAD_* helpers with calls to dl-wrapper - the
same patch can also replace the case with "-b $($(PKG)_SITE_METHOD)".
3. Replacing the entire DOWNLOAD_INNER with a single call to dl-wrapper.

 This can stay as a single big patch but it's quite tricky to review it...

>  support/download/bzr        |   2 +-
>  support/download/cp         |   2 +-
>  support/download/cvs        |   2 +-
>  support/download/dl-wrapper |  65 ++++++++++-------
>  support/download/wget       |   7 +-
>  6 files changed, 77 insertions(+), 167 deletions(-)
> 

[snip]
> +ifneq ($(call qstrip,$(BR2_PRIMARY_SITE)),)
> +DOWNLOAD_URIS += \
> +	-u $(call getschemeplusuri,$(BR2_PRIMARY_SITE))

 I was at first not so enthusiastic about this URI list and was going to suggest
passing BR2_PRIMARY_SITE into dl-wrapper instead, but the loop in dl-wrapper is
in fact quite elegant.

> +endif
>  
> -define DOWNLOAD_CVS
> -	$(EXTRA_ENV) $(DL_WRAPPER) -b cvs \
> -		-o $(DL_DIR)/$($(PKG)_SOURCE) \
> -		$(QUIET) \
> -		-- \
> -		-u $(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
> -		-c $($(PKG)_DL_VERSION) \
> -		-N $($(PKG)_RAWNAME) \
> -		-n $($(PKG)_RAW_BASE_NAME) \
> -		$($(PKG)_DL_OPTS)
> -endef
> +ifeq ($(BR2_PRIMARY_SITE_ONLY),)
> +DOWNLOAD_URIS += \
> +	-u $($(PKG)_SITE_METHOD)+$(dir $(1))

 Although I find this solution pretty elegant, Thomas was a bit confused by it
and I understand his reasoning. So to make things explicit, and in line with how
we do things elsewhere:

ifneq ($(call qstrip,$(BR2_PRIMARY_SITE)),)
DOWNLOAD_URI_PRIMARY = -u $(call getschemeplusuri,$(BR2_PRIMARY_SITE))
endif
ifneq ($(call qstrip,$(BR2_BACKUP_SITE)),)
DOWNLOAD_URI_SECONDARY = -u $(call getschemeplusuri,$(BR2_BACKUP_SITE))
endif

and in the call itself:

	$(DOWNLOAD_URI_PRIMARY) \
	$(if $(BR2_PRIMARY_SITE_ONLY),,\
		-u $($(PKG)_SITE_METHOD)+$(dir $(1)) \
		$(DOWNLOAD_URI_SECONDARY)) \

 Thomas, do you think this is clearer?

> +ifneq ($(call qstrip,$(BR2_BACKUP_SITE)),)
> +DOWNLOAD_URIS += \
> +	-u $(call getschemeplusuri,$(BR2_BACKUP_SITE))
> +endif
> +endif
>  
> -define DOWNLOAD_SVN
> -	$(EXTRA_ENV) $(DL_WRAPPER) -b svn \
> -		-o $(DL_DIR)/$($(PKG)_SOURCE) \
> -		$(QUIET) \
> -		-- \
> -		-u $($(PKG)_SITE) \
> +define DOWNLOAD
> +	$(Q)$(if $(filter bzr cvs hg svn,$($(PKG)_SITE_METHOD)),export BR_NO_CHECK_HASH_FOR=$(notdir $(1));) \

 No need for the export, there is just one command.

 Not related to this patch, but what we do here is actually wrong: when a
package uses one of these download methods, *everything* related to that package
including patches etc. will not be checked... However, apparently we simply
don't support downloading anything extra for the VCS download methods, so it
doesn't matter.

> +	$(EXTRA_ENV) $(DL_WRAPPER) \
>  		-c $($(PKG)_DL_VERSION) \
[snip]
> diff --git a/support/download/cp b/support/download/cp
> index 52fe2de83d..9c64b7b70b 100755
> --- a/support/download/cp
> +++ b/support/download/cp
> @@ -23,7 +23,7 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
>      case "${OPT}" in
>      q)  verbose=;;
>      o)  output="${OPTARG}";;
> -    u)  source="${OPTARG}";;
> +    u)  source="${OPTARG#*//}";;
                            ^^^ *://

 This stuff would also be easier to understand if it was introduced in a
separate patch. Basically, previously it was called with
-u $(call stripurischeme,$(call qstrip,$(1)))
and now it is called with
-u '$(call qstrip,$(1))'
so we still need to strip the urischeme.


>      :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
>      \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
>      esac
> diff --git a/support/download/cvs b/support/download/cvs
> index 69d5c71f28..9caffb4b82 100755
> --- a/support/download/cvs
> +++ b/support/download/cvs
> @@ -21,7 +21,7 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
>      case "${OPT}" in
>      q)  verbose=-Q;;
>      o)  output="${OPTARG}";;
> -    u)  uri="${OPTARG}";;
> +    u)  uri="${OPTARG#*//}";;
>      c)  rev="${OPTARG}";;
>      N)  rawname="${OPTARG}";;
>      n)  basename="${OPTARG}";;
> diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> index a29411e0ae..50c14a2e16 100755
> --- a/support/download/dl-wrapper
> +++ b/support/download/dl-wrapper
> @@ -19,31 +19,34 @@
>  # We want to catch any unexpected failure, and exit immediately.
>  set -e
>  
> -export BR_BACKEND_DL_GETOPTS=":hb:o:H:rRq"
> +export BR_BACKEND_DL_GETOPTS=":hc:o:H:n:N:ru:qf:"

 Something not right here: you're not adding any options to the download
helpers, so this shouldn't change...

 Options that are only valid for the wrapper and not for the helper should not
be included here since they won't be passed down.

>  
>  main() {
>      local OPT OPTARG
>      local backend output hfile recurse quiet
> +    local -a uris
>  
>      # Parse our options; anything after '--' is for the backend
> -    while getopts :hb:o:H:rq OPT; do
> +    while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
>          case "${OPT}" in
>          h)  help; exit 0;;
> -        b)  backend="${OPTARG}";;
> +        c)  cset="${OPTARG}";;
>          o)  output="${OPTARG}";;
> +        n)  raw_base_name="${OPTARG}";;
> +        N)  base_name="${OPTARG}";;
>          H)  hfile="${OPTARG}";;
>          r)  recurse="-r";;
> +        f)  filename="${OPTARG}";;
> +        u)  uris+=( "${OPTARG}" );;
>          q)  quiet="-q";;
>          :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
>          \?) error "unknown option '%s'\n" "${OPTARG}";;
>          esac
>      done
> +
>      # Forget our options, and keep only those for the backend
>      shift $((OPTIND-1))
>  
> -    if [ -z "${backend}" ]; then
> -        error "no backend specified, use -b\n"
> -    fi
>      if [ -z "${output}" ]; then
>          error "no output specified, use -o\n"
>      fi
> @@ -82,16 +85,29 @@ main() {
>      # Doing the 'cd' here rather than in all backends is easier.
>      cd "${tmpd}"
>  
> -    # If the backend fails, we can just remove the temporary directory to
> -    # remove all the cruft it may have left behind. Then we just exit in
> -    # error too.
> -    if ! "${OLDPWD}/support/download/${backend}" \
> -            ${quiet} ${recurse} \
> -            -o "${tmpf}" "${@}"
> -    then
> -        rm -rf "${tmpd}"
> -        exit 1
> -    fi
> +    # Look through all the uris that we were given to downoad the package
> +    # source
> +    for uri in "${uris[@]}"; do
> +        backend=${uri%+*}
> +        case "${backend}" in
> +            git|svn|cvs|bzr|file|scp|hg) ;;

 The backend for "file" is called "cp", so probably the easiest is to rename
that one to "file".

> +            *) backend="wget" ;;
> +        esac
> +        uri=${uri#*+}
> +
> +        # If the backend fails, we can just remove the temporary directory to
> +        # remove all the cruft it may have left behind. Then we just exit in

 No, we don't exit any more.

> +        # error too.
> +        if "${OLDPWD}/support/download/${backend}" \
> +                -c "${cset}" -n "${raw_base_name}" \
> +                -N "${raw_name}" -f "${filename}" -u "${uri}" -o "${tmpf}" \
> +                ${quiet} ${recurse} "${@}"
> +        then
> +            break

 Wrong, see below.

> +        else
> +            rm -rf "${tmpd:?}/*"

 There should be a continue here, see below.

> +        fi

 We have to do the hash check within the loop - if it fails, we should continue
with the next URI. We should break if the hash check is successful. And we
should keep track somewhere if any download+check was successful, so we can give
the appropriate exit code.

> +    done
>  
>      # cd back to free the temp-dir, so we can remove it later
>      cd "${OLDPWD}"
> @@ -164,16 +180,13 @@ DESCRIPTION
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
> index fece6663ca..3e6a6b446c 100755
> --- a/support/download/wget
> +++ b/support/download/wget
> @@ -8,6 +8,7 @@ set -e
>  # Options:
>  #   -q          Be quiet.
>  #   -o FILE     Save into file FILE.
> +#   -f FILENAME The filename of the tarball to get at URL
>  #   -u URL      Download file at URL.
>  #
>  # Environment:
> @@ -18,6 +19,7 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
>      case "${OPT}" in
>      q)  verbose=-q;;
>      o)  output="${OPTARG}";;
> +    f)  filename="${OPTARG}";;
>      u)  url="${OPTARG}";;
>      :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
>      \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
> @@ -32,4 +34,7 @@ _wget() {
>      eval ${WGET} "${@}"
>  }
>  
> -_wget ${verbose} "${@}" -O "'${output}'" "'${url}'"
> +# Replace every '?' with '%3F' in the URI
> +url=${url//\?/%3F}

 We *don't* do that for the normal download, only for the primary/secondary.
Indeed, doing this will fail the download of musl-compat-headers. Not sure how
to solve it elegantly.

 Oh, hang on, this is completely wrong: you need to do this substitution in the
filename, not in the url. The url normally doesn't have any ?, and if it does it
should be kept. The subsitution is there to make sure something like
musl-compat-headers, which has a filename like "queue.h?rev=1.70", can still be
downloaded from primary/secondary. But again, you have to distinguish between
the primary/secondary case and the normal case.

 Regards,
 Arnout

> +
> +_wget ${verbose} "${@}" -O "'${output}'" "'${url}/${filename}'"
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
