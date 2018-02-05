From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 5 Feb 2018 16:34:46 +0100
Subject: [Buildroot] [PATCH v2 02/13] core/pkg-download: change all
 helpers to use common options
In-Reply-To: <20171025201003.16105-3-ps.report@gmx.net>
References: <20171025201003.16105-1-ps.report@gmx.net>
 <20171025201003.16105-3-ps.report@gmx.net>
Message-ID: <c2bebc60-8275-c873-7875-95a611e2700d@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 25/10/2017 22:09, Peter Seiderer wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Currently all download helpers accepts the local output file, the remote
> locations, the changesets and so on... as positional arguments.
> 
> This was well and nice when that's was all we needed.
> 
> But then we added an option to quiesce their verbosity, and that was
> shoehorned with a trivial getopts, still keeping all the existing
> positional arguments as... positional arguments.
> 
> Adding yet more options while keeping positional arguments will not be
> very easy, even if we do not envision any new option in the foreseeable
> future (but 640K ought to be enough for everyone, remember? ;-) ).
> 
> Change all helpers to accept a set of generic options (-q for quiet and
> -o for the output file) as well as helper-specific options (like -r for
> the repository, -c for a changeset...).
> 
> Maxime:
> Changed -R to -r for recurse (only for the git backend)
> Changed -r to -u for URI (for all backend)
> Change -R to -c for cset (for CVS and SVN backend)
> Add the export of the BR_BACKEND_DL_GETOPTS so all the backend wrapper
> can use the same option easily
> Now all the backends use the same common options.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
> Changes v1 --> v2:
>   - from https://github.com/maximeh/buildroot/commit/a1facaac906794d027a0ed5837fb617f93cad662.patch
>   - no more change to support/download/check-hash
> ---
>  package/pkg-download.mk     | 38 +++++++++++++++++++-------------------
>  support/download/bzr        | 25 ++++++++++++++-----------
>  support/download/cp         | 17 +++++++++--------
>  support/download/cvs        | 34 +++++++++++++++++++---------------
>  support/download/dl-wrapper |  7 ++++++-
>  support/download/git        | 33 +++++++++++++++++----------------
>  support/download/hg         | 25 ++++++++++++++-----------
>  support/download/scp        | 19 ++++++++++---------
>  support/download/svn        | 25 ++++++++++++++-----------
>  support/download/wget       | 17 +++++++++--------
>  10 files changed, 131 insertions(+), 109 deletions(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 2b845e77a2..4d724e7494 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -77,9 +77,9 @@ define DOWNLOAD_GIT
>  		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
>  		$(QUIET) \
>  		-- \
> -		$($(PKG)_SITE) \
> -		$($(PKG)_DL_VERSION) \
> -		$($(PKG)_RAW_BASE_NAME) \
> +		-u $($(PKG)_SITE) \
> +		-c $($(PKG)_DL_VERSION) \
> +		-n $($(PKG)_RAW_BASE_NAME) \
>  		$($(PKG)_DL_OPTS)
>  endef
>  
> @@ -88,9 +88,9 @@ define DOWNLOAD_BZR
>  		-o $(DL_DIR)/$($(PKG)_SOURCE) \
>  		$(QUIET) \
>  		-- \
> -		$($(PKG)_SITE) \
> -		$($(PKG)_DL_VERSION) \
> -		$($(PKG)_RAW_BASE_NAME) \
> +		-u $($(PKG)_SITE) \
> +		-c $($(PKG)_DL_VERSION) \
> +		-n $($(PKG)_RAW_BASE_NAME) \
>  		$($(PKG)_DL_OPTS)
>  endef
>  
> @@ -99,10 +99,10 @@ define DOWNLOAD_CVS
>  		-o $(DL_DIR)/$($(PKG)_SOURCE) \
>  		$(QUIET) \
>  		-- \
> -		$(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
> -		$($(PKG)_DL_VERSION) \
> -		$($(PKG)_RAWNAME) \
> -		$($(PKG)_RAW_BASE_NAME) \
> +		-u $(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
> +		-c $($(PKG)_DL_VERSION) \
> +		-N $($(PKG)_RAWNAME) \
> +		-n $($(PKG)_RAW_BASE_NAME) \
>  		$($(PKG)_DL_OPTS)
>  endef
>  
> @@ -111,9 +111,9 @@ define DOWNLOAD_SVN
>  		-o $(DL_DIR)/$($(PKG)_SOURCE) \
>  		$(QUIET) \
>  		-- \
> -		$($(PKG)_SITE) \
> -		$($(PKG)_DL_VERSION) \
> -		$($(PKG)_RAW_BASE_NAME) \
> +		-u $($(PKG)_SITE) \
> +		-c $($(PKG)_DL_VERSION) \
> +		-n $($(PKG)_RAW_BASE_NAME) \
>  		$($(PKG)_DL_OPTS)
>  endef
>  
> @@ -126,7 +126,7 @@ define DOWNLOAD_SCP
>  		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
>  		$(QUIET) \
>  		-- \
> -		'$(call stripurischeme,$(call qstrip,$(1)))' \
> +		-u '$(call stripurischeme,$(call qstrip,$(1)))' \
>  		$($(PKG)_DL_OPTS)
>  endef
>  
> @@ -135,9 +135,9 @@ define DOWNLOAD_HG
>  		-o $(DL_DIR)/$($(PKG)_SOURCE) \
>  		$(QUIET) \
>  		-- \
> -		$($(PKG)_SITE) \
> -		$($(PKG)_DL_VERSION) \
> -		$($(PKG)_RAW_BASE_NAME) \
> +		-u $($(PKG)_SITE) \
> +		-c $($(PKG)_DL_VERSION) \
> +		-n $($(PKG)_RAW_BASE_NAME) \
>  		$($(PKG)_DL_OPTS)
>  endef
>  
> @@ -147,7 +147,7 @@ define DOWNLOAD_WGET
>  		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
>  		$(QUIET) \
>  		-- \
> -		'$(call qstrip,$(1))' \
> +		-u '$(call qstrip,$(1))' \
>  		$($(PKG)_DL_OPTS)
>  endef
>  
> @@ -157,7 +157,7 @@ define DOWNLOAD_LOCALFILES
>  		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
>  		$(QUIET) \
>  		-- \
> -		$(call stripurischeme,$(call qstrip,$(1))) \
> +		-u $(call stripurischeme,$(call qstrip,$(1))) \
>  		$($(PKG)_DL_OPTS)
>  endef
>  
> diff --git a/support/download/bzr b/support/download/bzr
> index 75b7b415c1..5289a421cd 100755
> --- a/support/download/bzr
> +++ b/support/download/bzr
> @@ -5,28 +5,31 @@ set -e
>  
>  # Download helper for bzr, to be called from the download wrapper script
>  #
> -# Call it as:
> -#   .../bzr [-q] OUT_FILE REPO_URL REV BASENAME
> +# Options:
> +#   -q          Be quiet
> +#   -o FILE     Generate archive in FILE.
> +#   -u URI      Clone from repository at URI.
> +#   -c CSET     Use changeset (or revision) CSET.
> +#   -n NAME     Use basename NAME.
>  #
>  # Environment:
>  #   BZR      : the bzr command to call
>  
>  
>  verbose=
> -while getopts :q OPT; do
> +while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
>      case "${OPT}" in
>      q)  verbose=-q;;
> +    o)  output="${OPTARG}";;
> +    u)  uri="${OPTARG}";;
> +    c)  cset="${OPTARG}";;
> +    n)  basename="${OPTARG}";;
> +    :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
>      \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
>      esac
>  done
> -shift $((OPTIND-1))
>  
> -output="${1}"
> -repo="${2}"
> -rev="${3}"
> -basename="${4}"
> -
> -shift 4 # Get rid of our options
> +shift $((OPTIND-1)) # Get rid of our options
>  
>  # Caller needs to single-quote its arguments to prevent them from
>  # being expanded a second time (in case there are spaces in them)
> @@ -51,5 +54,5 @@ if [ ${bzr_version} -ge ${bzr_min_version} ]; then
>  fi
>  
>  _bzr export ${verbose} --root="'${basename}/'" --format=tgz \
> -    ${timestamp_opt} - "${@}" "'${repo}'" -r "'${rev}'" \
> +    ${timestamp_opt} - "${@}" "'${uri}'" -r "'${cset}'" \
>      >"${output}"
> diff --git a/support/download/cp b/support/download/cp
> index 0ee1f3ba82..52fe2de83d 100755
> --- a/support/download/cp
> +++ b/support/download/cp
> @@ -5,8 +5,10 @@ set -e
>  
>  # Download helper for cp, to be called from the download wrapper script
>  #
> -# Call it as:
> -#   .../cp [-q] OUT_FILE SRC_FILE
> +# Options:
> +#   -q          Be quiet.
> +#   -o FILE     Copy to file FILE.
> +#   -u FILE     Copy from file FILE.
>  #
>  # Environment:
>  #   LOCALFILES: the cp command to call
> @@ -17,18 +19,17 @@ set -e
>  # Make 'cp' verbose by default, so it behaves a bit like the others.
>  verbose=-v
>  
> -while getopts :q OPT; do
> +while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
>      case "${OPT}" in
>      q)  verbose=;;
> +    o)  output="${OPTARG}";;
> +    u)  source="${OPTARG}";;
> +    :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
>      \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
>      esac
>  done
> -shift $((OPTIND-1))
>  
> -output="${1}"
> -source="${2}"
> -
> -shift 2 # Get rid of our options
> +shift $((OPTIND-1)) # Get rid of our options
>  
>  # Caller needs to single-quote its arguments to prevent them from
>  # being expanded a second time (in case there are spaces in them)
> diff --git a/support/download/cvs b/support/download/cvs
> index 50050ab1c9..69d5c71f28 100755
> --- a/support/download/cvs
> +++ b/support/download/cvs
> @@ -5,28 +5,32 @@ set -e
>  
>  # Download helper for cvs, to be called from the download wrapper script
>  #
> -# Call it as:
> -#   .../cvs [-q] OUT_FILE CVS_URL REV PKG_NAME BASENAME
> +# Options:
> +#   -q          Be quiet
> +#   -o FILE     Generate archive in FILE.
> +#   -u URI      Checkout from repository at URI.
> +#   -c REV      Use revision REV.
> +#   -N RAWNAME  Use rawname (aka module name) RAWNAME.
> +#   -n NAME     Use basename NAME.
>  #
>  # Environment:
>  #   CVS      : the cvs command to call
>  
>  verbose=
> -while getopts :q OPT; do
> +while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
>      case "${OPT}" in
>      q)  verbose=-Q;;
> +    o)  output="${OPTARG}";;
> +    u)  uri="${OPTARG}";;
> +    c)  rev="${OPTARG}";;
> +    N)  rawname="${OPTARG}";;
> +    n)  basename="${OPTARG}";;
> +    :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
>      \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
>      esac
>  done
> -shift $((OPTIND-1))
>  
> -output="${1}"
> -repo="${2}"
> -rev="${3}"
> -rawname="${4}"
> -basename="${5}"
> -
> -shift 5 # Get rid of our options
> +shift $((OPTIND-1)) # Get rid of our options
>  
>  # Caller needs to single-quote its arguments to prevent them from
>  # being expanded a second time (in case there are spaces in them)
> @@ -42,14 +46,14 @@ else
>      select="-r"
>  fi
>  
> -# The absence of an initial : on ${repo} means access method undefined
> -if [[ ! "${repo}" =~ ^: ]]; then
> +# The absence of an initial : on ${uri} means access method undefined
> +if [[ ! "${uri}" =~ ^: ]]; then
>     # defaults to anonymous pserver
> -   repo=":pserver:anonymous@${repo}"
> +   uri=":pserver:anonymous@${uri}"
>  fi
>  
>  export TZ=UTC
> -_cvs ${verbose} -z3 -d"'${repo}'" \
> +_cvs ${verbose} -z3 -d"'${uri}'" \
>       co "${@}" -d "'${basename}'" ${select} "'${rev}'" -P "'${rawname}'"
>  
>  tar czf "${output}" "${basename}"
> diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> index f944b71db5..510e7ef852 100755
> --- a/support/download/dl-wrapper
> +++ b/support/download/dl-wrapper
> @@ -19,6 +19,8 @@
>  # We want to catch any unexpected failure, and exit immediately.
>  set -e
>  
> +export BR_BACKEND_DL_GETOPTS=":hc:o:n:N:H:ru:q"

A minor not here.

I don't like very much this being passed to the backends in the
environment: it makes them non-self-standing, so we cannot call them
directly for testing. I'd find it more correct that the backend scripts
source a "dl-common" file that sets BACKEND_DL_GETOPTS without exporting
it, and that could also contain other common utility code.

But hey, the backends are not currently self-standing anyway since they
do "eval ${GIT}" and the like!

[Tested with wget, git, hg, svn, bzr]
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>


-- 
Luca
