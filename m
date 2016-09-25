From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 25 Sep 2016 19:21:10 +0200
Subject: [Buildroot] [PATCH 01/10] core: do not hard-code inclusion of
 br2-external in Kconfig
In-Reply-To: <ada7b8d92f513d7a94c4f4d925fd1d889b7204ec.1474815151.git.yann.morin.1998@free.fr>
References: <cover.1474815151.git.yann.morin.1998@free.fr>
 <ada7b8d92f513d7a94c4f4d925fd1d889b7204ec.1474815151.git.yann.morin.1998@free.fr>
Message-ID: <1a24bc3d-bbfc-95aa-5f1f-904b695000cc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le 25/09/2016 ? 16:52, Yann E. MORIN a ?crit :
> Move the inclusion of br2-external's Config.in to the generated kconfig
> snippet.
> 
> This will ultimately allow us to use more than one br2-external tree.
> 
> Offload the "User-provided options" menu to the generated Kconfig
> snippet. We can also move the definition of the Kconfig-version of
> BR2_EXTERNAL into this snippet.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Romain Naour <romain.naour@openwide.fr>
> ---
>  Config.in                    | 11 ------
>  Makefile                     |  2 +-
>  support/scripts/br2-external | 85 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 86 insertions(+), 12 deletions(-)
>  create mode 100755 support/scripts/br2-external
> 
> diff --git a/Config.in b/Config.in
> index 8d37c93..985c412 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -14,10 +14,6 @@ config BR2_HOSTARCH
>  	string
>  	option env="HOSTARCH"
>  
> -config BR2_EXTERNAL
> -	string
> -	option env="BR2_EXTERNAL"
> -
>  config BR2_BUILD_DIR
>  	string
>  	option env="BUILD_DIR"
> @@ -759,11 +755,4 @@ source "package/Config.in.host"
>  
>  source "Config.in.legacy"
>  
> -menu "User-provided options"
> -	depends on BR2_EXTERNAL != "support/dummy-external"
> -
> -source "$BR2_EXTERNAL/Config.in"
> -
> -endmenu
> -
>  source "$BR2_BUILD_DIR/.br2-external.in"
> diff --git a/Makefile b/Makefile
> index 5e4daef..f44e509 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -883,7 +883,7 @@ endif
>  # value of BR2_EXTERNAL is changed.
>  .PHONY: $(BUILD_DIR)/.br2-external.in
>  $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
> -	@touch $@
> +	$(Q)support/scripts/br2-external -o "$(@)" $(BR2_EXTERNAL)
>  
>  # printvars prints all the variables currently defined in our
>  # Makefiles. Alternatively, if a non-empty VARS variable is passed,
> diff --git a/support/scripts/br2-external b/support/scripts/br2-external
> new file mode 100755
> index 0000000..c15c21c
> --- /dev/null
> +++ b/support/scripts/br2-external
> @@ -0,0 +1,85 @@
> +#!/bin/bash
> +set -e
> +
> +# The location of the br2-external tree, once validated.
> +declare BR2_EXT
> +
> +main() {
> +    local OPT OPTARG
> +    local br2_ext ofile
> +
> +    while getopts :ho: OPT; do
> +        case "${OPT}" in
> +        h)  help; exit 0;;
> +        o)  ofile="${OPTARG}";;
> +        :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
> +        \?) error "unknown option '%s'\n" "${OPTARG}";;
> +        esac
> +    done
> +    # Forget options; keep only positional args
> +    shift $((OPTIND-1))
> +
> +    if [ ${#} -ne 1 ]; then
> +        error "need exactly one br2-external tree to be specified\n"
> +    fi
> +    br2_ext="${1}"
> +
> +    if [ -z "${ofile}" ]; then
> +        error "no output file specified (-o)\n"
> +    fi
> +
> +    do_validate "${br2_ext}"
> +
> +    do_kconfig >"${ofile}"
> +}
> +
> +# Validates the br2-external tree passed as argument. Makes it cannonical
> +# and store it in global variable BR2_EXT.
> +do_validate() {
> +    local br2_ext="${1}"
> +
> +    if [ ! -d "${br2_ext}" ]; then
> +        error "'%s': no such file or directory\n" "${br2_ext}"
> +    fi
> +
> +    BR2_EXT="$(cd "${br2_ext}"; pwd -P )"

br2_ext can be a directory on which we may not have access, so cd will fail here.

Best regards,
Romain


> +}
> +
> +# Generate the kconfig snippet for the br2-external tree.
> +do_kconfig() {
> +    printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
> +    printf '\n'
> +    printf 'config BR2_EXTERNAL\n'
> +    printf '\tstring\n'
> +    printf '\tdefault "%s"\n' "${BR2_EXT}"
> +    printf '\n'
> +    printf 'menu "User-provided options"\n'
> +    printf '\tdepends on BR2_EXTERNAL != "support/dummy-external"\n'
> +    printf '\n'
> +    printf 'source "%s/Config.in"\n' "${BR2_EXT}"
> +    printf '\n'
> +    printf "endmenu # User-provided options\n"
> +}
> +
> +help() {
> +    cat <<-_EOF_
> +	Usage:
> +	    ${my_name} -o FILE PATH
> +
> +	${my_name} generates the kconfig snippet to include the configuration
> +	options specified in the br2-external tree passed as positional argument.
> +
> +	Options:
> +	    -o FILE
> +	        FILE in which to generate the kconfig snippet.
> +
> +	Returns:
> +	    0   If no error
> +	    !0  If any error
> +	_EOF_
> +}
> +
> +error()  { local fmt="${1}"; shift; printf "%s: ${fmt}" "${my_name}" "${@}" >&2; exit 1; }
> +
> +my_name="${0##*/}"
> +main "${@}"
> 
