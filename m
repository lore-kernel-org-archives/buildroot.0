From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Jan 2015 17:16:08 +0100
Subject: [Buildroot] [PATCH v7 2/4] pkg-download: silence check-hash if
 it is a silent build
In-Reply-To: <1419947920-22047-3-git-send-email-fabio.porcedda@gmail.com>
References: <1419947920-22047-1-git-send-email-fabio.porcedda@gmail.com>
 <1419947920-22047-3-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150101161608.GB4360@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2014-12-30 14:58 +0100, Fabio Porcedda spake thusly:
> If it is a silent build (make -s -> QUIET=-q) silence the "check-hash"
> script.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[tested by downloading busybox + a toolchain, then tweaking busybox' hash
to ensure a failed check was still visible]
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> 
> Notes:
>     v7:
>      - Add this patch
> 
>  package/pkg-download.mk     |  8 ++++++++
>  support/download/check-hash | 22 ++++++++++++++++++++--
>  support/download/dl-wrapper |  9 +++++----
>  3 files changed, 33 insertions(+), 6 deletions(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index ba72fc1..9c782fe 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -88,6 +88,7 @@ define DOWNLOAD_GIT
>  	$(EXTRA_ENV) $(DL_WRAPPER) -b git \
>  		-o $(DL_DIR)/$($(PKG)_SOURCE) \
>  		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
> +		$(QUIET) \
>  		-- \
>  		$($(PKG)_SITE) \
>  		$($(PKG)_DL_VERSION) \
> @@ -109,6 +110,7 @@ define DOWNLOAD_BZR
>  	$(EXTRA_ENV) $(DL_WRAPPER) -b bzr \
>  		-o $(DL_DIR)/$($(PKG)_SOURCE) \
>  		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
> +		$(QUIET) \
>  		-- \
>  		$($(PKG)_SITE) \
>  		$($(PKG)_DL_VERSION) \
> @@ -127,6 +129,7 @@ define DOWNLOAD_CVS
>  	$(EXTRA_ENV) $(DL_WRAPPER) -b cvs \
>  		-o $(DL_DIR)/$($(PKG)_SOURCE) \
>  		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
> +		$(QUIET) \
>  		-- \
>  		$(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
>  		$($(PKG)_DL_VERSION) \
> @@ -147,6 +150,7 @@ define DOWNLOAD_SVN
>  	$(EXTRA_ENV) $(DL_WRAPPER) -b svn \
>  		-o $(DL_DIR)/$($(PKG)_SOURCE) \
>  		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
> +		$(QUIET) \
>  		-- \
>  		$($(PKG)_SITE) \
>  		$($(PKG)_DL_VERSION) \
> @@ -168,6 +172,7 @@ define DOWNLOAD_SCP
>  	$(EXTRA_ENV) $(DL_WRAPPER) -b scp \
>  		-o $(DL_DIR)/$(2) \
>  		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
> +		$(QUIET) \
>  		-- \
>  		'$(call stripurischeme,$(call qstrip,$(1)))'
>  endef
> @@ -185,6 +190,7 @@ define DOWNLOAD_HG
>  	$(EXTRA_ENV) $(DL_WRAPPER) -b hg \
>  		-o $(DL_DIR)/$($(PKG)_SOURCE) \
>  		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
> +		$(QUIET) \
>  		-- \
>  		$($(PKG)_SITE) \
>  		$($(PKG)_DL_VERSION) \
> @@ -206,6 +212,7 @@ define DOWNLOAD_WGET
>  	$(EXTRA_ENV) $(DL_WRAPPER) -b wget \
>  		-o $(DL_DIR)/$(2) \
>  		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
> +		$(QUIET) \
>  		-- \
>  		'$(call qstrip,$(1))'
>  endef
> @@ -222,6 +229,7 @@ define DOWNLOAD_LOCALFILES
>  	$(EXTRA_ENV) $(DL_WRAPPER) -b cp \
>  		-o $(DL_DIR)/$(2) \
>  		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
> +		$(QUIET) \
>  		-- \
>  		$(call stripurischeme,$(call qstrip,$(1)))
>  endef
> diff --git a/support/download/check-hash b/support/download/check-hash
> index b59fd2a..82f2e65 100755
> --- a/support/download/check-hash
> +++ b/support/download/check-hash
> @@ -2,7 +2,10 @@
>  set -e
>  
>  # Helper to check a file matches its known hash
> -# Call it with:
> +#
> +# Optional arguments:
> +#   "-q": quiet flag
> +# Required arguments:
>  #   $1: the path of the file containing all the the expected hashes
>  #   $2: the full path to the temporary file that was downloaded, and
>  #       that is to be checked
> @@ -10,6 +13,19 @@ set -e
>  #       saved as, to be able to match it to the corresponding hashes
>  #       in the .hash file
>  
> +quiet=
> +while getopts "q" opt; do
> +    case $opt in
> +	q)
> +	    quiet=-q
> +	    ;;
> +	\?)
> +	    exit 1
> +	    ;;
> +    esac
> +done
> +shift $((OPTIND-1))
> +
>  h_file="${1}"
>  file="${2}"
>  base="${3}"
> @@ -43,7 +59,9 @@ check_one_hash() {
>      # Do the hashes match?
>      _hash=$( ${_h}sum "${_file}" |cut -d ' ' -f 1 )
>      if [ "${_hash}" = "${_known}" ]; then
> -        printf "%s: OK (%s: %s)\n" "${base}" "${_h}" "${_hash}"
> +	if [ -z "${quiet}" ]; then
> +            printf "%s: OK (%s: %s)\n" "${base}" "${_h}" "${_hash}"
> +	fi
>          return 0
>      fi
>  
> diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> index cced8f6..337fc48 100755
> --- a/support/download/dl-wrapper
> +++ b/support/download/dl-wrapper
> @@ -21,15 +21,16 @@ set -e
>  
>  main() {
>      local OPT OPTARG
> -    local backend output hfile
> +    local backend output hfile quiet
>  
>      # Parse our options; anything after '--' is for the backend
> -    while getopts :hb:o:H: OPT; do
> +    while getopts :hb:o:H:q OPT; do
>          case "${OPT}" in
>          h)  help; exit 0;;
>          b)  backend="${OPTARG}";;
>          o)  output="${OPTARG}";;
>          H)  hfile="${OPTARG}";;
> +        q)  quiet="-q";;
>          :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
>          \?) error "unknown option '%s'\n" "${OPTARG}";;
>          esac
> @@ -49,7 +50,7 @@ main() {
>  
>      # If the output file already exists, do not download it again
>      if [ -e "${output}" ]; then
> -        if support/download/check-hash "${hfile}" "${output}" "${output##*/}"; then
> +        if support/download/check-hash ${quiet} "${hfile}" "${output}" "${output##*/}"; then
>              exit 0
>          fi
>          rm -f "${output}"
> @@ -85,7 +86,7 @@ main() {
>  
>      # Check if the downloaded file is sane, and matches the stored hashes
>      # for that file
> -    if ! support/download/check-hash "${hfile}" "${tmpf}" "${output##*/}"; then
> +    if ! support/download/check-hash ${quiet} "${hfile}" "${tmpf}" "${output##*/}"; then
>          rm -rf "${tmpd}"
>          exit 1
>      fi
> -- 
> 2.1.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
