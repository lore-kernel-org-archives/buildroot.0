From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 6 Feb 2017 21:44:06 +0100
Subject: [Buildroot] [PATCH] support/scripts: add script to test a
	package
In-Reply-To: <1486404173-31700-1-git-send-email-yann.morin.1998@free.fr>
References: <1486404173-31700-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CAAXf6LVfFMFd4fSVrn6EEkzszWPs4XmmEtBWAUX8kJeZskZc-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 6, 2017 at 7:02 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> This script helps in testing that a pacakge builds fine on a wide range

package

> of architectures and toolchains: BE/LE, 32/64-bit, musl/glibc/uclibc...
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> [yann.morin.1998 at free.fr:
>  - completely rewrite the script from Thomas, with help from Luca
> ]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  support/scripts/test-pkg | 158 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 158 insertions(+)
>  create mode 100755 support/scripts/test-pkg
>
> diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
> new file mode 100755
> index 0000000..40b373e
> --- /dev/null
> +++ b/support/scripts/test-pkg
> @@ -0,0 +1,158 @@
> +#!/bin/bash
> +set -e
> +
> +TOOLCHAINS_BASE_URL='http://autobuild.buildroot.org/toolchains/configs'
> +
> +main() {
> +    local o O opts
> +    local cfg dir pkg toolchain out
> +    local -a toolchains
> +
> +    o='hc:d:p:'
> +    O='help,config-snippet:build-dir:package:'
> +    opts="$( getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}"  )"
> +    eval set -- "${opts}"
> +
> +    while [ ${#} -gt 0 ]; do
> +        case "${1}" in
> +        (-h|--help)
> +            help; exit 0
> +            ;;
> +        (-c|--config-snippet)
> +            cfg="${2}"; shift 2
> +            ;;
> +        (-d|--build-dir)
> +            dir="${2}"; shift 2
> +            ;;
> +        (-p|--package)
> +            pkg="${2}"; shift 2
> +            ;;
> +        (--)
> +            shift; break
> +            ;;
> +        esac
> +    done
> +    if [ -z "${cfg}" ]; then
> +        printf "error: no config snippet specified\n" 2>&1; exit 1
> +    fi
> +    if [ -z "${dir}" ]; then
> +        dir="${HOME}/br-test-pkg"
> +    fi
> +
> +    # Extract the toolchains names
> +    toolchains=( $( curl -s "${TOOLCHAINS_BASE_URL}/toolchain-configs.csv" \
> +                    |sed -r -e 's/,.*//; s:.*/(.*)\.config:\1:; /internal/d;'
> +                  )
> +               )

I always find it useful that such text transformation code carries a
short comment giving example input and output.

> +
> +    if [ ${#toolchains[@]} -eq 0 ]; then
> +        printf "error: no toolchain found (networking issue?)\n" 2>&1; exit 1

What is the purpose of 2>&1 ? Don't you mean >&2 , i.e. send the print
command to stderr ?
Same for other error prints in this file.

> +    fi
> +
> +    for toolchain in "${toolchains[@]}"; do
> +        build_one "${dir}" "${toolchain}" "${cfg}" "${pkg}"
> +    done
> +}
> +
> +build_one() {
> +    local dir="${1}"
> +    local tc="${2}"

Pretty cryptic, 'tc' for 'toolchain, IMO.

> +    local cfg="${3}"
> +    local pkg="${4}"
> +    local line
> +
> +    printf "%40s: " "${tc}"
> +
> +    dir="${dir}/${tc}"
> +    mkdir -p "${dir}"
> +
> +    printf "download config"
> +    if ! curl -s "${TOOLCHAINS_BASE_URL}/${toolchain}.config" >"${dir}/.config"; then

Here you use 'toolchain' iso 'tc', which is the loop variable used
before calling this function. This works 'by luck', but is not the
intended design.

> +        printf ": FAILED\n"
> +        return
> +    fi
> +
> +    cat >>"${dir}/.config" <<-_EOF_
> +       BR2_INIT_NONE=y
> +       BR2_SYSTEM_BIN_SH_NONE=y
> +       # BR2_PACKAGE_BUSYBOX is not set
> +       # BR2_TARGET_ROOTFS_TAR is not set
> +       _EOF_
> +    cat "${cfg}" >>"${dir}/.config"
> +
> +    printf ", olddefconfig"
> +    if ! make O="${dir}" olddefconfig >/dev/null 2>&1; then
> +        printf ": FAILED\n"
> +        return
> +    fi
> +    while read line; do
> +        if ! grep "^${line}\$" "${dir}/.config" >/dev/null 2>&1; then
> +            printf ", SKIPPED\n"
> +            return
> +        fi
> +    done <"${cfg}"

I think a brief comment of what is happening before each block would be useful.
What is happening here? You try to set the config provided by the user
and then check if it worked? If that understanding is correct,
couldn't the 'SKIPPED' message not be more verbose in explaining _why_
it was skipped? A short explanation, and the line/config option that
caused this skip.

> +
> +    printf ", source"
> +    if ! make O=${dir} source >> ${dir}/logfile 2>&1; then
> +        printf ": FAILED\n"
> +        return
> +    fi
> +
> +    if [ -n "${pkg}" ]; then
> +        printf ", dirclean"
> +        if ! make O=${dir} "${pkg}-dirclean" >> ${dir}/logfile 2>&1; then
> +            printf ": FAILED\n"
> +            return
> +        fi
> +    fi
> +
> +    printf ", build"
> +    if ! make O=${dir} ${pkg} >> ${dir}/logfile 2>&1; then
> +        printf ": FAILED\n"
> +        return
> +    fi
> +
> +    printf ": OK\n"
> +}
> +
> +help() {
> +    cat <<_EOF_
> +${my_name}: test that a package builds with various toolchains and archs

I would start discussing about 'archs' vs 'arches' so perhaps we
should just use 'architectures'.

> +
> +${my_name} will test-build a package (as specified in a .config snippet)
> +against various toolchains on different architectures.
> +
> +The list of toolchains is retrieved from Buidlroot autobuilders.
> +
> +In case failures are noticed, you have the opportunity to fix the issue
> +and relaunch the test.

I find it a bit odd to 'get the opportunity to fix', isn't this
obvious that if it failed you need to fix and retest?

> +
> +Options
> +
> +    -h, --help
> +        Print this help.
> +
> +    -c CFG, --config-snippet CFG
> +        Use the CFG file as the source for the config snippet. This file
> +        should contain all the config options required to build a package.
> +
> +    -d DIR, --build-dir DIR
> +        Do the builds in directory DIR, one sub-dir per toolchain.
> +
> +    -p PKG, --package PKG
> +        Test-build the package PKG.
> +
> +Example:
> +
> +    Testing libcec would require a config snippet that contains:
> +        BR2_PACKAGE_LIBCEC=y
> +
> +    Testing libcurl with openSSL support would require a snippet such as:
> +        BR2_PACKAGE_OPENSSL=y
> +        BR2_PACKAGE_LIBCURL=y
> +
> +_EOF_
> +}
> +
> +my_name="${0##*/}"
> +main "${@}"
> --
> 2.7.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
