From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 1 Jul 2017 10:19:20 +0200
Subject: [Buildroot] [PATCH 1/8 v3] tools: add a directory to store some
 useful user-facing tools
In-Reply-To: <318abf359fe6708061165ffe829ac1d5c5e2d2c4.1498859395.git.yann.morin.1998@free.fr>
References: <cover.1498859395.git.yann.morin.1998@free.fr>
 <318abf359fe6708061165ffe829ac1d5c5e2d2c4.1498859395.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMJ0ybuTRh+i2nkCppfeFipsHMxyOiD1y8=b+jXWxbW6Kg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Fri, Jun 30, 2017 at 11:50 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[...]
> diff --git a/tools/brmake b/tools/brmake
> new file mode 100755
> index 0000000000..36e2374207
> --- /dev/null
> +++ b/tools/brmake
> @@ -0,0 +1,62 @@
> +#!/bin/bash
> +# (C) 2016, "Yann E. MORIN" <yann.morin.1998@free.fr>
> +# License: WTFPL, https://spdx.org/licenses/WTFPL.html
> +
> +main() {
> +    local found ret start d h m mf cdir odir
> +
> +    if ! which unbuffer >/dev/null 2>&1; then
> +        printf "you need to install 'unbuffer' (from package expect or expect-dev)\n" >&2
> +        exit 1
> +    fi
> +
> +    # Crude parsing to find the directory with the .config
> +    # and catch any configurator
> +    found=false
> +    for i in "${@}"; do
> +        ${found} && { cdir="${i}"; found=false; continue; }
> +        case "${i}" in
> +        (-C|--directory)    found=true;;
> +        (-C*)               cdir="${i#-C}";;
> +        (--directory=*)     cdir="${i#--directory}";;

You also need to strip the '='.

> +        (O=*)               odir="${i#O=}";;
> +        # Other configurators are either non-interactive, or graphical
> +        # apps, so their stdout can safely be redirected.
> +        (config|menuconfig|nconfig|oldconfig)
> +            printf "you can't use brmake for '%s'\n" "${i}" >&2
> +            exit 1
> +            ;;
> +        esac
> +    done
> +    # We favour O= if specified, then -C, and fallback to cwd.
> +    dir="${odir:-${cdir:-$(pwd)}}"
> +    if [ ! -e "${dir}/.config" ]; then
> +        # No .config, don't log as we need a terminal for menuconfig
> +        exec make "${@}"
> +    fi
> +
> +    start=${SECONDS}
> +
> +    ( exec 2>&1; unbuffer make "${@}"; ) \
> +    > >( while read line; do
> +             printf "%(%Y-%m-%dT%H:%M:%S)T %s\n" -1 "${line}"
> +         done \
> +         |tee -a br.log \
> +         |grep --colour=never -E '>>>'
> +       )
> +    ret=${?}
> +
> +    d=$((SECONDS-start))
> +    printf "Done in "
> +    h=$((d/3600))
> +    d=$((d%3600))
> +    [ ${h} -eq 0 ] || { printf "%dh " ${h}; mf="02"; }
> +    m=$((d/60))
> +    d=$((d%60))
> +    [ ${m} -eq 0 ] || { printf "%${mf}dmin " ${m}; sf="02"; }
> +    printf "%${sf}ds\n" ${d}
> +
> +    return ${ret}
> +}
> +
> +main "${@}"
> diff --git a/tools/readme.txt b/tools/readme.txt
> new file mode 100644
> index 0000000000..49e08d4f31
> --- /dev/null
> +++ b/tools/readme.txt
> @@ -0,0 +1,9 @@
> +This directory contains various useful scripts and tools for working
> +with Buildroot. You need not add this directory in your PATH to use
> +any of those tools, but you may do so if you want.
> +
> +brmake
> +    a script that can be run instead of make, that prepends the date in
> +    front of each line, redirects all of the build output to a file
> +    ("'br.log' in the current directory), and just outputs the Buildroot
> +    messages (those lines starting with >>>) on stdout.
> --
> 2.11.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel
