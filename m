From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Oct 2017 18:43:23 +0100
Subject: [Buildroot] [PATCH 4/5] test-pkg: test a subset of toolchains
 by default, add -a and -n options
In-Reply-To: <20171029171440.8095-5-thomas.petazzoni@free-electrons.com>
References: <20171029171440.8095-1-thomas.petazzoni@free-electrons.com>
 <20171029171440.8095-5-thomas.petazzoni@free-electrons.com>
Message-ID: <20171029174323.GH2899@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-10-29 18:14 +0100, Thomas Petazzoni spake thusly:
> During the latest Buildroot Developers meeting, we discussed that
> test-pkg would perhaps be more widely used if it tested a smaller
> subset of toolchains. Indeed, it currently tests 47 toolchains, which
> takes very long to build. Several of the toolchain configurations are
> quite similar, and it is perhaps not necessary for contributors to
> test them all before submitting a package.
> 
> Therefore, this commit changes the test-pkg script to only test a
> subset of the toolchain configurations by default. The N first
> configurations of the CSV files are tested, where N is hard-coded in
> the script. The CSV file has therefore been re-organized to have the
> first N toolchains be the most important ones.
> 
> A -a/--all option is added to test with all toolchains, while a
> -n/--number option is added to test with the first N toolchains, N
> being passed on the command line.
> 
> Note that the list of toolchains (built in the "toolchains" shell
> variable) is no longer sorted. Indeed, when the first N toolchains are
> tested, we want them to be tested in the same order as they are listed
> in the CSV file, as we are careful to order them in an interesting
> order. We only sort when all toolchains are tested.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  utils/test-pkg | 56 +++++++++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 49 insertions(+), 7 deletions(-)
> 
> diff --git a/utils/test-pkg b/utils/test-pkg
> index 1b7046eac4..54e5ad8bbb 100755
> --- a/utils/test-pkg
> +++ b/utils/test-pkg
> @@ -5,16 +5,19 @@ TOOLCHAINS_CSV='support/config-fragments/autobuild/toolchain-configs.csv'
>  
>  main() {
>      local o O opts
> -    local cfg dir pkg random toolchains_dir toolchain
> +    local cfg dir pkg random toolchains_dir toolchain all number mode
>      local ret nb nb_skip nb_fail nb_legal nb_tc build_dir
>      local -a toolchains
>  
> -    o='hc:d:p:r:t:'
> +    o='han:c:d:p:r:t:'

Except for 'h' which is in a leading position, all other options where
in alphabetical order.

>      O='help,config-snippet:build-dir:package:,random:,toolchains-dir:'
>      opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
>      eval set -- "${opts}"
>  
>      random=0
> +    all=0
> +    number=0
> +    mode=0
>      toolchains_csv="${TOOLCHAINS_CSV}"
>      while [ ${#} -gt 0 ]; do
>          case "${1}" in
> @@ -33,6 +36,12 @@ main() {
>          (-r|--random)
>              random="${2}"; shift 2
>              ;;
> +	(-a|--all)

This script uses leading spaces, not TABs.

And keep options in aphabetical order. ;-)

> +            all=1; shift 1
> +            ;;
> +	(-n|--number)

Ditto.

Regards,
Yann E. MORIN.

> +            number="${2}"; shift 2
> +            ;;
>          (-t|--toolchains-csv)
>              toolchains_csv="${2}"; shift 2
>              ;;
> @@ -51,15 +60,37 @@ main() {
>          dir="${HOME}/br-test-pkg"
>      fi
>  
> +    if [ ${random} -gt 0 ]; then
> +        mode=$((mode+1))
> +    fi
> +
> +    if [ ${number} -gt 0 ]; then
> +        mode=$((mode+1))
> +    fi
> +
> +    if [ ${all} -eq 1 ]; then
> +        mode=$((mode+1))
> +    fi
> +
> +    # Default mode is to test the N first toolchains, which have been
> +    # chosen to be a good selection of toolchains.
> +    if [ ${mode} -eq 0 ] ; then
> +        number=7
> +    elif [ ${mode} -gt 1 ] ; then
> +        printf "error: --all, --number and --random are mutually exclusive\n" >&2; exit 1
> +    fi
> +
>      # Extract the URLs of the toolchains; drop internal toolchains
>      # E.g.: http://server/path/to/name.config,arch,libc
>      #  -->  http://server/path/to/name.config
>      toolchains=($(sed -r -e 's/,.*//; /internal/d; /^#/d; /^$/d;' "${toolchains_csv}" \
>                    |if [ ${random} -gt 0 ]; then \
>                        sort -R |head -n ${random}
> -                   else
> -                      cat
> -                   fi |sort
> +                  elif [ ${number} -gt 0 ]; then \
> +                      head -n ${number}
> +                  else
> +                      sort
> +                  fi
>                   )
>                 )
>  
> @@ -156,6 +187,10 @@ toolchain config fragment and the required host architecture, separated by a
>  comma. The config fragments should contain only the toolchain and architecture
>  settings.
>  
> +By default, a useful subset of toolchains is tested. If needed, all
> +toolchains can be tested (-a), an arbitrary number of toolchains (-n
> +in order, -r for random).
> +
>  Options:
>  
>      -h, --help
> @@ -172,9 +207,16 @@ Options:
>          Test-build the package PKG, by running 'make PKG'; if not specified,
>          just runs 'make'.
>  
> +    -a, --all
> +        Test all toolchains, instead of the default subset defined by
> +        Buildroot developers.
> +
> +    -n N, --number N
> +        Test N toolchains, in the order defined in the toolchain CSV
> +        file.
> +
>      -r N, --random N
> -        Limit the tests to the N randomly selected toolchains, instead of
> -        building with all toolchains.
> +        Limit the tests to the N randomly selected toolchains.
>  
>      -t CSVFILE, --toolchains-csv CSVFILE
>          CSV file containing the paths to config fragments of toolchains to
> -- 
> 2.13.6
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
