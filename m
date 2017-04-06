From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 6 Apr 2017 22:51:16 +0200
Subject: [Buildroot] [PATCH v5 03/13] support/test-pkg: calculate
 toolchain name only once
In-Reply-To: <20170406181854.5242-3-arnout@mind.be>
References: <cover.1491502445.git.arnout@mind.be>
 <20170406181854.5242-3-arnout@mind.be>
Message-ID: <20170406205116.GD3538@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-04-06 20:18 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> The toolchain name was calculated in main() for reporting to the user,
> and again in build_one() for creating the build directory. Calculate
> it only once, in main(), and pass the build directory as an argument
> to build_one().
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> I'm not sure why the mkdir is also moved up to main() - IMO, it fits
> better in build_one(). Yann, the original commit message was just
> "create build dir from caller", any reason _why_ you did that?

Because when I initially did the legal-info step, it was in a spearate
function, not in build_one, so it looked more logicial to create the
directory in main().

But now it is not really meaningful anymore, indeed...

Regards,
Yann E. MORIN.

> Changes v4 -> v5 by Arnout:
>   - Reword commit message
>   - Reorder patch series
> ---
>  support/scripts/test-pkg | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
> index f9f994402d..27601168b1 100755
> --- a/support/scripts/test-pkg
> +++ b/support/scripts/test-pkg
> @@ -6,7 +6,7 @@ TOOLCHAINS_URL='http://autobuild.buildroot.org/toolchains/configs/toolchain-conf
>  main() {
>      local o O opts
>      local cfg dir pkg random toolchain
> -    local ret nb nb_skip nb_fail nb_tc
> +    local ret nb nb_skip nb_fail nb_tc build_dir
>      local -a toolchains
>  
>      o='hc:d:p:r:'
> @@ -68,11 +68,14 @@ main() {
>      nb=0
>      nb_skip=0
>      nb_fail=0
> -    for toolchain in "${toolchains[@]}"; do
> +    for toolchainconfig in "${toolchains[@]}"; do
>          : $((nb++))
> -        printf "%40s [%*d/%d]: " "$(basename "${toolchain}" .config)" \
> -                                 ${#nb_tc} ${nb} ${nb_tc}
> -        build_one "${dir}" "${toolchain}" "${cfg}" "${pkg}" && ret=0 || ret=${?}
> +        # Using basename(1) on a URL works nicely
> +        toolchain="$(basename "${toolchainconfig}" .config)"
> +        build_dir="${dir}/${toolchain}"
> +        mkdir -p "${build_dir}"
> +        printf "%40s [%*d/%d]: " "${toolchain}" ${#nb_tc} ${nb} ${nb_tc}
> +        build_one "${build_dir}" "${toolchainconfig}" "${cfg}" "${pkg}" && ret=0 || ret=${?}
>          case ${ret} in
>          (0) printf "OK\n";;
>          (1) : $((nb_skip++)); printf "SKIPPED\n";;
> @@ -88,13 +91,6 @@ build_one() {
>      local url="${2}"
>      local cfg="${3}"
>      local pkg="${4}"
> -    local toolchain
> -
> -    # Using basename(1) on a URL works nicely
> -    toolchain="$(basename "${url}" .config)"
> -
> -    dir="${dir}/${toolchain}"
> -    mkdir -p "${dir}"
>  
>      if ! curl -s "${url}" >"${dir}/.config"; then
>          return 2
> -- 
> 2.11.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
