From: =?windows-1252?Q?Andr=E9_Erdmann?= <dywi@mailerd.de>
Date: Sat, 25 Apr 2015 14:09:07 +0200
Subject: [Buildroot] [PATCH 1/3] support: add script to find maintainers
In-Reply-To: <6fa246aa883ffa33c0fbcf7d52e7032b9685bfaf.1427044305.git.yann.morin.1998@free.fr>
References: <cover.1427044305.git.yann.morin.1998@free.fr>
 <6fa246aa883ffa33c0fbcf7d52e7032b9685bfaf.1427044305.git.yann.morin.1998@free.fr>
Message-ID: <553B83E3.7010804@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2015/4/24 Yann E. Morin <yann.morin.1998@free.fr>:
> With the growing number of packages, as well as the many infrastructures
> we now have (package, download...), it is time we introduce the notion
> of maintainers.
> 
> This is done in two ways:
> 
>   - first, a file at the top of the repository, that associates a person
>     to areas it is interested in;
> 
>   - a script that can help find the maintainer(s) for a package or an
>     architecture.
> 
> The maintainers file is a simple person -> {files} association, and the
> script can be fed a patch on stdin or a package or architecture name as
> command line options.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  MAINTAINERS                      |  24 ++++++
>  support/scripts/check-maintainer | 157 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 181 insertions(+)
>  create mode 100644 MAINTAINERS
>  create mode 100755 support/scripts/check-maintainer
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> new file mode 100644
> index 0000000..7ae732c
> --- /dev/null
> +++ b/MAINTAINERS
> @@ -0,0 +1,24 @@
> +# vim: ft=
> +#
> +# List of maintainers for Buildroot.
> +#
> +# Format of this file:
> +#
> +# Person <mail>
> +#   pattern
> +#   pattern
> +#
> +# When a file matches a pattern, the person is considered interested.
> +#
> +# If a pattern ends with a slash, it is a directory pattern, and
> +# matches all files in that directory; otherwise, the pattern is a file
> +# pattern, and matches all files that match the glob.
> +#
> +# Empty lines are ignored; lines starting with a '#' are ignored.
> +#
> +# Please, keep this file sorted (LC_COLLATE=C), first sorted by committers
> +# and then by patterns.
> +
> +"Yann E. MORIN" <yann.morin.1998@free.fr>
> +    MAINTAINERS
> +    support/scripts/check-maintainer
> diff --git a/support/scripts/check-maintainer b/support/scripts/check-maintainer
> new file mode 100755
> index 0000000..0ca7136
> --- /dev/null
> +++ b/support/scripts/check-maintainer
> @@ -0,0 +1,157 @@
> +#!/usr/bin/env bash
> +
> +main() {
> +    local OPT OPTARGS

s/OPTARGS/OPTARG?

Not sure if it makes sense to local-scope getopts vars,
there's also OPTIND and maybe OPTERR.


> +    local -a pkgs archs files rcpt
> +    local pattern pkg arch file maintainer
> +
> +    while getopts :hp:a: OPT; do
> +        case "${OPT}" in
> +        h)  help; exit 0;;
> +        p)  pkgs+=( "${OPTARG}" );;
> +        a)  archs+=( "${OPTARG}" );;
> +        :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
> +        \?) error "unknown option '%s'\n" "${OPTARG}";;
> +        esac
> +    done

Non-option args will be ignored by this script.
If people don't read the help message first and simply run
"check-maintainer PKG" or do some scripting and end up with
"check-maintainer -p $(command_that_usually_prints_a_single_package_name_but_now_prints_two)",
then the script could hang forever waiting for a patch from stdin.

Might be better to error-exit in this case, e.g.:

    # bail out if any positional args are given
    [ ${#} -lt ${OPTIND} ] || error "bad usage: script does not accept positional args.\n"


> +
> +    if [ "${#pkgs[@]}" -eq 0 -a "${#archs[@]}" -eq 0 ]; then
> +        # When no package and no arch specified, expect a patch from stdin
> +        # and extract files from that patch
> +        files=( $( diffstat -p1 -l  \
> +                   |sort -u         \
> +                   |sed -r -e 's/\|[^|]+$//'
> +                 )
> +              )
> +    else
> +        for pkg in "${pkgs[@]}"; do
> +            files+=( $( find . -type f -name "${pkg}.mk" \
> +                        |sed -r -e 's:^\./::'
> +                      )
> +                   )
> +        done
> +        for arch in "${archs[@]}"; do
> +            files+=( "arch/Config.in.${arch}" )
> +        done
> +    fi
> +
> +    # We can't easily scan the pattern->maintainer relations into an
> +    # array, because each pattern may be associated with more than one
> +    # maintainer, and entries in bash arrays can't be another array
> +    # (i.e. arrays are only one-dimensional).
> +    # So, we scan the maintainers file once, and for each pattern we
> +    # check if there is a matching file, which in practice is the
> +    # optimum solution.
> +    # Note: filtering-out comments and empty lines in the bash 'case'
> +    # is slightly faster (~10%) than it is to 'sed' them out.
> +    while read pattern; do

"read -r" unless backslash escapes should be expanded

> +        case "${pattern}" in
> +        "#"*|"")
> +            continue
> +        ;;
> +        *@*)
> +            maintainer="${pattern}"
> +            continue
> +        ;;
> +        esac


A "have maintainer?" check would slightly help against a malformed
maintainers file (file pattern before the first "Person <mail>" line):

    [ -z "${maintainer}" ] || \
> +        for file in "${files[@]}"; do
> +            if filematch "${file}" "${pattern}"; then
> +                debug "  --> adding '%s'\n" "${maintainer}"
> +                rcpt+=( "${maintainer}" )
> +            fi
> +        done
> +    done <MAINTAINERS
> +

The read-loop basically reads as follows:

   foreach maintainer, pattern loop
      foreach file loop
         if filematch file, pattern then
            rank up maintainer
         end if
      end loop
   end loop

=> Maintainers with more than one pattern matching the same file get ranked up,
   try "check-maintainer -p opengl" ;) (after applying patch 3 of this series)

Is that on purpose or accepted behavior due to otherwise increased script complexity?

It'd be rather easy to fix it in bash 4 /w an associative array (*),
but I don't know of any sane solution for bash 3, if that's a requirement.

(*) as long as all patterns are listed in one block per maintainer
    (no "person <mail>" redefinition), but that's guaranteed by the file format

> +    # Quick exit path in case there's no one interested, to avoid printing
> +    # an empty line, below
> +    if [ ${#rcpt[@]} -eq 0 ]; then
> +        exit 1
> +    fi
> +
> +    # Report all interested maintainers, ranking by number of matches
> +    printf "%s\n" "${rcpt[@]}" \
> +    |sort \
> +    |uniq -c \
> +    |sort -nr \
> +    |gawk '{ gsub("^[[:space:]]+[[:digit:]]+[[:space:]]",""); print; }'
> +}
> +
> +filematch() {
> +    local file="${1}"
> +    local pattern="${2}"
> +
> +    debug "Testing '%s' against '%s'... " "${file}" "${pattern}"
> +
> +    case "${pattern}" in
> +    */) # Pattern is a directory, matches all files inthat directory
> +        if [[ "${file}" =~ ^${pattern}[^/]+$ ]]; then
> +            debug "OK\n"
> +            return 0
> +        fi
> +    ;;
> +    *)  # Any other pattern if a file match
> +        case "${file}" in
> +        ${pattern})
> +            debug "OK\n"
> +            return 0
> +        ;;
> +        esac
> +    ;;
> +    esac
> +
> +    debug "KO\n"
> +    return 1
> +}
> +
> +help() {
> +    cat <<_EOF_
> +NAME 
> +    ${my_name} - find appropriate maintainers
> +
> +SYNOPSIS
> +    ${my_name} [options]
> +    ${my_name} < file.patch
> +
> +DESCRIPTION
> +    In some projects, some persons are considered responsible for one or
> +    more specific parts of the projects; they are called "maintainers",
> +    like is done in the Linux kernel.
> +
> +    In Buildroot, however, we do not have such "maintainers"; rather,
> +    some people can declare themselves to be "interested" in specific
> +    parts of the project. We still call them "maintainers", though.
> +
> +    ${my_name} helps in finding such persons. It can be used in two ways.
> +
> +    In the first synopsis, you pass it a package name or an architecture
> +    name, and it will tell you the persons that have declared interests
> +    in those.
> +
> +    In the second synopsis, with no options, it will read a patch from
> +    stdin, and it will tell you who has declared interest in the areas
> +    touched by the patch.
> +
> +OPTIONS
> +    -h  This help text.
> +
> +    -p PKG
> +        Find the persons interested in package PKG.
> +

Noteworthy: PKG can also be a glob pattern,
            e.g. "usb_modeswitch*" (because of "find -name <PKG>.mk").

Also, "-p" and "-a" can be given more than once,
whereas "-b" introduced in patch 2 behaves differently.

> +    -a ARCH
> +        Find the persons interested in architecture ARCH.
> +
> +EXIT STATUS
> +    ${my_name} exits with 0 if it could find a maintainer, and non-zero
> +    otherwise.
> +_EOF_
> +}
> +
> +trace() { printf "${@}"; }
> +debug() { :; }
> +if [ -n "${DEBUG}" ]; then
> +    debug() { trace "${@}" >&2; }
> +fi
> +error() { trace "${@}" >&2; exit 1; }
> +
> +my_name="${0##*/}"
> +main "${@}"
> 

-- 
Andr?
 
