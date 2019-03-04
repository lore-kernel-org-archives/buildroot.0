From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 4 Mar 2019 08:34:32 +0100
Subject: [Buildroot] [PATCH 1/1] utils/test-pkg: Generate package config
 if it is not specified
In-Reply-To: <1551443622-29498-1-git-send-email-email@gmail.com>
References: <1551443622-29498-1-git-send-email-email@gmail.com>
Message-ID: <dd2a36a6-e77b-6601-6d71-93e60401cbaf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/03/2019 13:33, Vadim Kochan wrote:
> From: Vadim Kochan <vadim4j@gmail.com>
> 
> It is possible to generate one-line config for the package just by
> normalize it to the form:
> 
>     BR2_PACKAGE_${pkg_replaced-to_and_uppercase}
> 
> it simplifes a bit of testing package where no additional config options
> are needed.
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  utils/test-pkg | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/test-pkg b/utils/test-pkg
> index 1995fa8..cce4679 100755
> --- a/utils/test-pkg
> +++ b/utils/test-pkg
> @@ -2,12 +2,20 @@
>  set -e
>  
>  TOOLCHAINS_CSV='support/config-fragments/autobuild/toolchain-configs.csv'
> +TEMP_CONF=""
> +
> +do_clean() {
> +    if [ ! -z "${TEMP_CONF}" ]; then
> +        rm -f "${TEMP_CONF}"

 A race-free way of cleaning up! Excellent!

> +    fi
> +}
>  
>  main() {
>      local o O opts
>      local cfg dir pkg random toolchains_dir toolchain all number mode
>      local ret nb nb_skip nb_fail nb_legal nb_tc build_dir
>      local -a toolchains
> +    local pkg_br_name
>  
>      o='hac:d:n:p:r:t:'
>      O='help,config-snippet:build-dir:package:,random:,toolchains-dir:'
> @@ -50,8 +58,15 @@ main() {
>              ;;
>          esac
>      done
> +
> +    trap do_clean INT TERM HUP EXIT
> +
>      if [ -z "${cfg}" ]; then
> -        printf "error: no config snippet specified\n" >&2; exit 1
> +        pkg_br_name="${pkg//-/_}"

 The script is already using bash, so this is OK.

 However, the UPPERCASE macro also converts . to _. Still, since we don't have
any package with . in it, it should be fine.

 Regards,
 Arnout

> +        pkg_br_name="BR2_PACKAGE_${pkg_br_name^^}"
> +        TEMP_CONF=$(mktemp /tmp/test-${pkg}-config.XXXXXX)
> +        echo "${pkg_br_name}=y" > ${TEMP_CONF}
> +        cfg="${TEMP_CONF}"
>      fi
>      if [ ! -e "${cfg}" ]; then
>          printf "error: %s: no such file\n" "${cfg}" >&2; exit 1
> 
