From: Matthew Weber <matt@thewebers.ws>
Date: Sat, 2 Apr 2016 00:01:51 -0500
Subject: [Buildroot] [PATCH 4/4 v2] core/pkg-infra: download git
 submodules if the package wants them
In-Reply-To: <8373904cdf1fee9724d6834b56efaa706a92fc31.1459541702.git.yann.morin.1998@free.fr>
References: <cover.1459541702.git.yann.morin.1998@free.fr>
 <8373904cdf1fee9724d6834b56efaa706a92fc31.1459541702.git.yann.morin.1998@free.fr>
Message-ID: <CAFt09wNKtUSyEcQzL1o+p+f5m_bPwctndV8OKrQOXBqQBmsCpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Fri, Apr 1, 2016 at 3:25 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Add a new package variable that packages can set to specify that they
> need git submodules.
>
> Only accept this option if the download method is git, as we can not get
> submodules via an http download (via wget).
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Aleksandar Simeonov <aleksandar@barix.com>

Tested-by: Matt Weber <matt@thewebers.ws>
Reviewed-by: Matt Weber <matt@thewebers.ws>

>
> ---
> Changes v1 -> v2:
>   - properly accept the -r in the download wrapper  (Aleksandar)
> ---
>  package/pkg-download.mk     | 1 +
>  package/pkg-generic.mk      | 8 ++++++++
>  support/download/dl-wrapper | 7 ++++---
>  3 files changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 1332e66..2324a07 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -76,6 +76,7 @@ export BR_NO_CHECK_HASH_FOR =
>  define DOWNLOAD_GIT
>         $(EXTRA_ENV) $(DL_WRAPPER) -b git \
>                 -o $(DL_DIR)/$($(PKG)_SOURCE) \
> +               $(if $($(PKG)_GIT_SUBMODULES),-r) \
>                 $(QUIET) \
>                 -- \
>                 $($(PKG)_SITE) \
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 3904c09..fee7eb0 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -453,6 +453,14 @@ ifndef $(2)_SITE_METHOD
>   endif
>  endif
>
> +# Do not accept to download git submodule if not using the git method
> +ifneq ($$($(2)_GIT_SUBMODULES),)
> + ifneq ($$($(2)_SITE_METHOD),git)
> +  $$(error $(2) declares having git sub-modules, but does not use the \
> +          'git' method (uses '$$($(2)_SITE_METHOD)' instead))
> + endif
> +endif
> +
>  ifeq ($$($(2)_SITE_METHOD),local)
>  ifeq ($$($(2)_OVERRIDE_SRCDIR),)
>  $(2)_OVERRIDE_SRCDIR = $$($(2)_SITE)
> diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> index ef2d872..f944b71 100755
> --- a/support/download/dl-wrapper
> +++ b/support/download/dl-wrapper
> @@ -21,15 +21,16 @@ set -e
>
>  main() {
>      local OPT OPTARG
> -    local backend output hfile quiet
> +    local backend output hfile recurse quiet
>
>      # Parse our options; anything after '--' is for the backend
> -    while getopts :hb:o:H:q OPT; do
> +    while getopts :hb:o:H:rq OPT; do
>          case "${OPT}" in
>          h)  help; exit 0;;
>          b)  backend="${OPTARG}";;
>          o)  output="${OPTARG}";;
>          H)  hfile="${OPTARG}";;
> +        r)  recurse="-r";;
>          q)  quiet="-q";;
>          :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
>          \?) error "unknown option '%s'\n" "${OPTARG}";;
> @@ -82,7 +83,7 @@ main() {
>      # If the backend fails, we can just remove the temporary directory to
>      # remove all the cruft it may have left behind. Then we just exit in
>      # error too.
> -    if ! "${OLDPWD}/support/download/${backend}" ${quiet} "${tmpf}" "${@}"; then
> +    if ! "${OLDPWD}/support/download/${backend}" ${quiet} ${recurse} "${tmpf}" "${@}"; then
>          rm -rf "${tmpd}"
>          exit 1
>      fi
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Thanks,
Matt
