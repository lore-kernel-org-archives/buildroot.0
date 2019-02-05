From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 5 Feb 2019 22:12:24 +0100
Subject: [Buildroot] [PATCHv2 2/2] utils/test-pkg: clean output dir for
 successful builds
In-Reply-To: <20190205200922.7352-2-patrickdepinguin@gmail.com>
References: <20190205200922.7352-1-patrickdepinguin@gmail.com>
 <20190205200922.7352-2-patrickdepinguin@gmail.com>
Message-ID: <CAAXf6LWdDXfy0Cu5yFT4u59T-uNTdYT4EbaEeP7HZwu-V77DGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El mar., 5 feb. 2019 a las 21:10, Thomas De Schampheleire
(<patrickdepinguin@gmail.com>) escribi?:
>
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>
> test-pkg will use gigabytes of space when testing all toolchains.
> Nevertheless, you are normally only interested in the actual build / host
> tree when there is a build failure.
>
> Do a 'make clean' for successful builds to save disk space, unless the new
> option '-k/--keep' is set.
> Note that the logfile and configuration is always retained for inspection.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  utils/test-pkg | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> v2: make the feature optional via '--keep' (feedback Arnout and Peter)
>
>
> diff --git a/utils/test-pkg b/utils/test-pkg
> index 087f9ddca9..ef865c80fe 100755
> --- a/utils/test-pkg
> +++ b/utils/test-pkg
> @@ -6,16 +6,17 @@ TOOLCHAINS_CSV='support/config-fragments/autobuild/toolchain-configs.csv'
>  main() {
>      local o O opts
>      local cfg dir pkg random toolchains_csv toolchain all number mode
> -    local ret nb nb_skip nb_fail nb_legal nb_tc build_dir
> +    local ret nb nb_skip nb_fail nb_legal nb_tc build_dir keep
>      local -a toolchains
>
> -    o='hac:d:n:p:r:t:'
> -    O='help,all,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
> +    o='hakc:d:n:p:r:t:'
> +    O='help,all,keep,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
>      opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
>      eval set -- "${opts}"
>
>      random=0
>      all=0
> +    keep=0
>      number=0
>      mode=0
>      toolchains_csv="${TOOLCHAINS_CSV}"
> @@ -27,6 +28,9 @@ main() {
>          (-a|--all)
>              all=1; shift 1
>              ;;
> +        (-k|--keep)
> +            keep=1; shift 1
> +            ;;
>          (-c|--config-snippet)
>              cfg="${2}"; shift 2
>              ;;
> @@ -161,6 +165,12 @@ build_one() {
>      if ! make O="${dir}" legal-info >> "${dir}/logfile" 2>&1; then
>          return 3
>      fi
> +
> +    # If we get here, the build was successful. Clean up the build/host
> +    # directories to save disk space, unless 'keep' was set.
> +    if [ ${keep} -ne 1 ]; then
> +        make O="${dir}" clean >> "${dir}/logfile" 2>&1
> +    fi

Grmbl, I forgot to update the help text...
