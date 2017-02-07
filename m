From: Luca Ceresoli <lucaceresoli77@gmail.com>
Date: Tue, 7 Feb 2017 16:42:17 +0100
Subject: [Buildroot] [PATCH 3/4] support/test-pkg: report number and
 types of failures
In-Reply-To: <fab47c91ce3fcc63573369745436d2c29b128722.1486475561.git.yann.morin.1998@free.fr>
References: <cover.1486475561.git.yann.morin.1998@free.fr>
 <fab47c91ce3fcc63573369745436d2c29b128722.1486475561.git.yann.morin.1998@free.fr>
Message-ID: <b2271a96-fa66-1296-ef64-78e4c72756b9@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 07/02/2017 14:52, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> ---
>  support/scripts/test-pkg | 42 ++++++++++++++++++++++++++++++++++++------
>  1 file changed, 36 insertions(+), 6 deletions(-)
> 
> diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
> index 67f73b3..604a759 100755
> --- a/support/scripts/test-pkg
> +++ b/support/scripts/test-pkg
> @@ -6,6 +6,7 @@ TOOLCHAINS_BASE_URL='http://autobuild.buildroot.org/toolchains/configs'
>  main() {
>      local o O opts
>      local cfg dir pkg toolchain
> +    local ret nb_dl nb_cfg nb_skip nb_clean nb_build
>      local -a toolchains
>  
>      o='hc:d:p:'
> @@ -50,9 +51,38 @@ main() {
>          printf "error: no toolchain found (networking issue?)\n" >&2; exit 1
>      fi
>  
> +    nb_dl=0
> +    nb_cfg=0
> +    nb_skip=0
> +    nb_clean=0
> +    nb_build=0
>      for toolchain in "${toolchains[@]}"; do
> -        build_one "${dir}" "${toolchain}" "${cfg}" "${pkg}"
> +        build_one "${dir}" "${toolchain}" "${cfg}" "${pkg}" && ret=0 || ret=${?}
> +        case ${ret} in
> +        (0) ;;
> +        (1) : $((nb_dl++));;
> +        (2) : $((nb_cfg++));;
> +        (3) : $((nb_skip++));;
> +        (4) : $((nb_clean++));;
> +        (5) : $((nb_build++));;
> +        esac
>      done
> +
> +    if [ ${nb_dl} -ne 0 ]; then
> +        printf "%d configurations could not be downloaded\n" ${nb_dl}
> +    fi
> +    if [ ${nb_cfg} -ne 0 ]; then
> +        printf "%d configurations could not be applied\n" ${nb_cfg}
> +    fi
> +    if [ ${nb_skip} -ne 0 ]; then
> +        printf "%d configurations were skipped\n" ${nb_skip}
> +    fi
> +    if [ ${nb_clean} -ne 0 ]; then
> +        printf "%d configurations could not be dircleaned\n" ${nb_clean}
> +    fi
> +    if [ ${nb_build} -ne 0 ]; then
> +        printf "%d configurations would not build\n" ${nb_build}
> +    fi

The script gets pretty verbose, so it would be nice if we had a way to
avoid the lines that are almost equal. Maybe an associative array, heh.
But in the end it would probably result in poor readability, so:

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
