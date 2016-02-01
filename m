From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 1 Feb 2016 22:50:25 +0100
Subject: [Buildroot] [PATCH v6 07/13] support/scripts: add fix-rpath
 script + a bunch of helpers
In-Reply-To: <1454342021-22960-8-git-send-email-s.martin49@gmail.com>
References: <1454342021-22960-1-git-send-email-s.martin49@gmail.com>
 <1454342021-22960-8-git-send-email-s.martin49@gmail.com>
Message-ID: <56AFD321.5000006@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01-02-16 16:53, Samuel Martin wrote:
> This commit introduces a fix-rpath shell-script able to scan a tree,
> detect ELF files, check their RPATH and fix it in a proper way.
> 
> Along to the fix-rpath script, it also adds a bunch of shell helper
> functions grouped into modules. This will help writing scripts handling
> RPATH and other things, while allowing to share and reuse these
> functions between scripts.
> 
> These helpers are namespaced within the filename of the module in which
> they are gathered.
> 
> This change adds 6 modules:
> - source.sh: provides simple helper to easily source another module, taking
>     care of not sourcing again an already-sourced one;
> - log.sh: provides logging helpers;
> - utils.sh: provides simple functions to filter ELF files in a list;
> - readelf.sh: provides functions retrieving ELF details from a file;
> - patchelf.sh: provides function updating ELF files;
> - sdk.sh: provides RPATH computation functions.
> 
> These 6 modules are used by the fix-rpath script.
> Follow-up patches will make some scripts leveraging these modules.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v5->v6:
> - fully rewritten in shell
> 
> changes v4->v5:
> - add verbose support
> - rename shrink_rpath -> clear_rpath
> - add sanitize_rpath function
> 
> changes v3->v4:
> - fix typos and license (Baruch)
> 
> changes v2->v3:
> - no change
> ---
>  support/scripts/fix-rpath         | 101 +++++++++++++++++++++++
>  support/scripts/shell/log.sh      |  57 +++++++++++++
>  support/scripts/shell/patchelf.sh | 163 ++++++++++++++++++++++++++++++++++++++
>  support/scripts/shell/readelf.sh  |  52 ++++++++++++
>  support/scripts/shell/sdk.sh      |  70 ++++++++++++++++
>  support/scripts/shell/source.sh   |  73 +++++++++++++++++
>  support/scripts/shell/utils.sh    |  60 ++++++++++++++
>  7 files changed, 576 insertions(+)
>  create mode 100755 support/scripts/fix-rpath
>  create mode 100644 support/scripts/shell/log.sh
>  create mode 100644 support/scripts/shell/patchelf.sh
>  create mode 100644 support/scripts/shell/readelf.sh
>  create mode 100644 support/scripts/shell/sdk.sh
>  create mode 100644 support/scripts/shell/source.sh
>  create mode 100644 support/scripts/shell/utils.sh
> 
> diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
> new file mode 100755
> index 0000000..938e599
> --- /dev/null
> +++ b/support/scripts/fix-rpath
> @@ -0,0 +1,101 @@
> +#!/usr/bin/env bash
> +
> +# Copyright (C) 2016 Samuel Martin <s.martin49@gmail.com>
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> +# General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program; if not, write to the Free Software
> +# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
> +
> +usage() {
> +  cat <<EOF >&2
> +Usage:  ${0} TREE_KIND TREE_ROOT
> +
> +Description:
> +
> +        This script scans a tree and sanitize ELF files' RPATH found in there.

 ... sanitizes the RPATH of ELF files found in there.

> +
> +        Sanitization behaves the same whatever the kindd of the processed tree, but

 Please wrap at 80 columns. But actually, I think 4 spaces is enough for
indentation, that's what you use below as well.

 kindd -> kind

 But actually I don't really understand this sentence (well, I do after reading
the rest). So I'd just remove this sentence and add...

> +        the resulting RPATH differs.
> +
> +        Sanitization action:

 Sanitization action (for all trees):

> +        - remove RPATH pointing outside of the tree
> +        - for RPATH pointing in the tree:
> +          - if they point to standard location (/lib, /usr/lib): remove them
> +          - otherwise: make them relative using \$ORIGIN
> +
> +        For the target tree:
> +        - scan the whole tree for sanitization
> +
> +        For the staging tree :
> +        - scan the whole tree for sanitization
> +
> +        For the host tree:
> +        - skip the staging tree for sanitization
> +        - add \$HOST_DIR/{lib,usr/lib} to RPATH (as relative pathes)

 pathes -> paths

> +
> +Arguments:
> +
> +        TREE_KIND   Kind of tree to be processed.
> +                    Allowed values: host, target, staging
> +
> +        TREE_ROOT   Path to the root of the tree to be scaned

 scanned

> +
> +EOF
> +}
> +
> +source "${0%/*}/shell/source.sh"
> +
> +source.load_module utils
> +source.load_module readelf
> +source.load_module patchelf

 What is this, python? :-) I think this source.sh is a bit over the top (it
doesn't really hurt to source those modules a second time), but why not.

> +
> +main() {
> +    local tree="${1}"
> +    local basedir="$( readlink -f "${2}" )"
> +
> +    local find_args=( "${basedir}" )
> +    local sanitize_extra_args=()
> +    local readelf
> +
> +    case "${tree}" in
> +        host)
> +            # do not process the sysroot (only contains target binaries)
> +            find_args+=( "-name" "sysroot" "-prune" "-o" )

 There may be some other random file that is called sysroot, so to be safe I'd
make this

    find_args+=( "-path" "${basedir}/usr/*/sysroot" "-prune" "-o" )

(untested).

> +
> +            # do not process the external toolchain installation directory to
> +            # to avoid breaking it.
> +            find_args+=( "-path" "*/opt/ext-toolchain" "-prune" "-o" )

 Again, to be safe against a opt/ext-toolchain appearing somewhere else in the
tree (admittedly, this is ridiculously unlikely), use . instead of *.

> +
> +            # make sure RPATH will point to ${hostdir}/lib and ${hostdir}/usr/lib
> +            sanitize_extra_args+=( "keep_lib_and_usr_lib" )

 Since sanitize_extra_args only contains a single argument, I don't think it's
worth making it an array. Just assign empty above and assign
keep_lib_and_usr_lib here, and pass unquoted below. But that's just MHO.

> +
> +            readelf="${HOST_READELF}"
> +            ;;
> +        staging|target)
> +            readelf="${TARGET_READELF}"
> +            ;;
> +        *)
> +            usage
> +            exit 1
> +            ;;
> +    esac
> +
> +    find_args+=( "-type" "f" "-print" )
> +
> +    while read file; do
> +        READELF="${READELF}" PATCHELF="${PATCHELF}" \

 Shouldn't that be ${readelf}? And where does ${PATCHELF} come from? If it comes
from the environment, there's no need to export it again here.

 But maybe it's cleaner to just export READELF inside the case statement, above.

> +            patchelf.sanitize_rpath "${basedir}" "${file}" ${sanitize_extra_args[@]}
> +    done < <( find ${find_args[@]} | utils.filter_elf )

 I personally don't like this reverse construct, and would write:

    find ${find_args[@]} | utils.filter_elf | \
        while read file; do
            ...

 Again, MHO.

> +}
> +
> +main ${@}
> diff --git a/support/scripts/shell/log.sh b/support/scripts/shell/log.sh
> new file mode 100644
> index 0000000..ffa19e8
> --- /dev/null
> +++ b/support/scripts/shell/log.sh
> @@ -0,0 +1,57 @@
> +# Copyright (C) 2016 Samuel Martin <s.martin49@gmail.com>
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> +# General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program; if not, write to the Free Software
> +# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
> +
> +# Logging helpers
> +#
> +# This module defines the following functions:
> +#   log.trace
> +#   log.debug
> +#   log.info
> +#   log.warn
> +#   log.errorN
> +#   log.error
> +#
> +# This module sets the following variables:
> +#   my_name
> +#
> +# This module is sensitive to the following environment variables:
> +#   DEBUG
> +
> +source.declare_module log
> +
> +# Debug level:
> +# - 0 or empty: only show errors
> +# - 1         : show errors and warnings
> +# - 2         : show errors, warnings, and info
> +# - 3         : show errors, warnings, info and debug
> +: ${DEBUG:=0}
> +
> +# Low level utility function
> +log.trace()  { local msg="${1}"; shift; printf "%s: ${msg}" "${my_name}" "${@}"; }

 I'd do the redirect directly here in the printf, rather than below.

 Also, I see no reason to put it all on one line.

> +
> +# Public logging functions
> +log.debug()  { :; }
> +[ ${DEBUG} -lt 3 ] || log.debug() { log.trace "${@}" >&2; }
> +log.info()   { :; }
> +[ ${DEBUG} -lt 2 ] || log.info()  { log.trace "${@}" >&2; }
> +log.warn()   { :; }
> +[ ${DEBUG} -lt 1 ] || log.warn()  { log.trace "${@}" >&2; }
> +log.errorN() { local ret="${1}"; shift; log.warn "${@}"; exit ${ret}; }
> +log.error()  { log.errorN 1 "${@}"; }
> +
> +# Program name
> +my_name="${0##*/}"

 Isn't my_name always going to be log.sh? "source" doesn't propagate the
parent's arguments AFAIK.

> +
> diff --git a/support/scripts/shell/patchelf.sh b/support/scripts/shell/patchelf.sh
> new file mode 100644
> index 0000000..d1eb590
> --- /dev/null
> +++ b/support/scripts/shell/patchelf.sh
> @@ -0,0 +1,163 @@
> +# Copyright (C) 2016 Samuel Martin <s.martin49@gmail.com>
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> +# General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program; if not, write to the Free Software
> +# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
> +
> +# Patchelf helpers

 AFAICS these helper will only ever be used in the fix-rpaths script (but I
haven't read the entire series yet). Unless you can see a good use case for
using these functions in another script, I would prefer to see them defined
directly in the fix-rpaths script rather than a separate module. IMHO it's
easier to understand related code if it's in one file than if it's in separate
files.

> +#
> +# This module defines the following functions:
> +#   patchelf.set_xrpath
> +#   patchelf.update_rpath
> +#   patchelf.sanitize_rpath
> +#
> +# This module is sensitive to the following environment variables:
> +#   PATCHELF
> +#   READELF
> +
> +source.declare_module patchelf
> +
> +source.load_module log
> +source.load_module sdk
> +source.load_module utils
> +source.load_module readelf
> +
> +: ${PATCHELF:=patchelf}
> +
> +# patchelf.set_xrpath file rpath...
> +#
> +# Set RPATH in $file.
> +# Automatically join all RPATH with the correct separator, and also handle
> +# XRPATH (replacing "XORIGIN" with "$ORIGIN").
> +#
> +# file  : ELF file path
> +# rpath : RPATH element
> +#
> +# environment:
> +#   PATCHELF: patchelf program path
> +patchelf.set_xrpath() {
> +    local file="${1}"
> +    shift
> +    local xrpath="$(sed -e 's/ +/:/g' <<<"${@}")"

 In fix-rpath you put spaces inside the "$( ... )". I think this would be a good
idea here as well.

> +    "${PATCHELF}" --set-rpath "${xrpath//XORIGIN/\$ORIGIN}" "${file}"
> +}
> +
> +# patchelf.update_rpath basedir binary libdirs...
> +#
> +# Set RPATH in $binary computing them from the paths $libdirs (and $basedir).
> +# Existing RPATH in $file will be overwritten if any.

 $file -> $binary ?

> +#
> +# basedir : absolute path of the tree in which the $bindir and $libdirs must be
> +# binary  : ELF file absolute path
> +# libdirs : list of library location (absolute paths)

 location -> locations

> +#
> +# environment:
> +#   PATCHELF: patchelf program path
> +patchelf.update_rpath() {
> +    local basedir="${1}"
> +    local binary="${2}"
> +    shift 2
> +    local libdirs=( ${@} )
> +    log.debug "  basedir: %s\n" "${basedir}"
> +    log.debug "      elf: %s\n" "${binary}"
> +    log.debug "  libdirs: %s\n" "${libdirs[*]}"
> +    log.info  "    rpath: %s\n" \
> +        "$( sdk.compute_xrpath "${basedir}" "${binary%/*}" ${libdirs[@]} |
> +            sed -e 's/XORIGIN/\$ORIGIN/g' )"

 Maybe compute it once and store it in a variable?

 Alternatively, add a helper

log.tracerun() {
    log.info "%s\n" "$*"
    "$@"
}

and use it below.

> +    PATCHELF="${PATCHELF}" patchelf.set_xrpath "${binary}" \

 Again, PATCHELF is already in the environment.

> +        $( sdk.compute_xrpath "${basedir}" "${binary%/*}" ${libdirs[@]} )
> +}
> +
> +# patchelf.sanitize_rpath basedir binary [keep_lib_usr_lib]
> +#
> +# Scan $binary's RPATH, remove any of them pointing outside of $basedir.
> +# If $keep_lib_usr_lib in not empty, the library directories $basedir/lib and

 in -> is

> +# $basedir/usr/lib will be added to the RPATH.
> +#
> +# Note:
> +#     Absolute paths is needed to correctly handle symlinks and or mount-bind in

 is -> are
 and or -> and/or
 mount-bind -> bind-mount (though actually, I don't see how you're going to get
an absolute path through a bind mount)

> +#     the $basedir path.
> +#
> +# basedir          : absolute path of the tree in which the $bindir and $libdirs
> +#                    must be
> +# binary           : ELF file absolute path
> +# keep_lib_usr_lib : add to RPATH $basedir/lib and $basedir/usr/lib
> +#
> +# environment:
> +#   PATCHELF: patchelf program path
> +#   READELF : readelf program path
> +patchelf.sanitize_rpath() {
> +    local basedir="$( readlink -f "${1}" )"
> +    local binary="${2}"
> +    local keep_lib_usr_lib="${3}"
> +
> +    local path abspath rpath
> +    local libdirs=()

 I think new_rpaths is a better name here.

> +
> +    if test -n "${keep_lib_usr_lib}" ; then
> +        libdirs+=( "${basedir}/lib" "${basedir}/usr/lib" )
> +    fi
> +
> +    log.info "ELF: %s\n" "${binary}"
> +
> +    local rpaths="$( READELF="${READELF}" readelf.get_rpath "${binary}" )"

 Again, READELF is already in the environment.

> +
> +    for rpath in ${rpaths//:/ } ; do
> +        # figure out if we should keep or discard the path; there are several
> +        # cases to handled:
> +        # - $path starts with "$ORIGIN":
> +        #     The original build-system already took care of setting a relative
> +        #     RPATH, resolve it and test if it is worthwhile to keep it;
> +        # - $basedir/$path exists:
> +        #     The original build-system already took care of setting an absolute
> +        #     RPATH (absolute in the final rootfs), resolve it and test if it is
> +        #     worthwhile to keep it;
> +        # - $path start with $basedir:

 start -> starts

> +        #     The original build-system added some absolute RPATH (absolute on
> +        #     the build machine). While this is wrong, it can still be fixed; so
> +        #     test if it is worthwhile to keep it;
> +        # - $path points somewhere else:
> +        #     (can be anywhere: build trees, staging tree, host location,
> +        #     non-existing location, etc.)
> +        #     Just discard such a path.

 This is not correct for host packages. If a host package has picked up an RPATH
to e.g. ~/lib/foo through pkg-config, then that RPATH must still be kept. But
only for host packages. For host packages, you should probably just not remove
anything.

 So I think you still need to distinguish between the host and staging/target
cases here. In fact, I think the whole logic of this function is easier to
understand if it is separate for host and target/staging.

> +        if grep -q '^$ORIGIN/' <<<"${rpath}" ; then
> +            path="${binary%/*}/${rpath#*ORIGIN/}"

 Maybe ?ORIGIN instead of *ORIGIN, just in case there's another ORIGIN somewhere
in the path?

> +        elif test -e "${basedir}/${rpath}" ; then

 -e -> -d, it really must be a directory.

> +            path="${basedir}/${rpath}"
> +        elif grep -q "^${basedir}/" <<<"$( readlink -f "${rpath}" )" ; then
> +            path="${rpath}"
> +        else
> +            log.debug "\tDROPPED [out-of-tree]: %s\n" "${rpath}"
> +            continue
> +        fi
> +
> +        abspath="$( readlink -f "${path}" )"
> +
> +        # discard path pointing to default locations handled by ld-linux

 ld-linux -> ld.so

> +        if grep -qE "^${basedir}/(lib|usr/lib)$" <<<"${abspath}" ; then
> +            log.debug \
> +                "\tDROPPED [std libdirs]: %s (%s)\n" "${rpath}" "${abspath}"
> +            continue
> +        fi
> +
> +        log.debug "\tKEPT %s (%s)\n" "${rpath}" "${abspath}"
> +
> +        libdirs+=( "${abspath}" )
> +
> +    done
> +
> +    libdirs=( $( utils.list_reduce ${libdirs[@]} ) )
> +
> +    PATCHELF="${PATCHELF}" \

 Again, already in the env.

> +        patchelf.update_rpath "${basedir}" "${binary}" ${libdirs[@]}
> +}
> diff --git a/support/scripts/shell/readelf.sh b/support/scripts/shell/readelf.sh
> new file mode 100644
> index 0000000..82968a2
> --- /dev/null
> +++ b/support/scripts/shell/readelf.sh
> @@ -0,0 +1,52 @@
> +# Copyright (C) 2016 Samuel Martin <s.martin49@gmail.com>
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> +# General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program; if not, write to the Free Software
> +# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
> +
> +# Readelf helpers
> +#
> +# This module defines the following functions:
> +#   readelf.get_rpath
> +#
> +# This module is sensitive to the following environment variables:
> +#   READELF
> +#
> +# This module sets the following environment variables:
> +#   LC_ALL=C
> +
> +source.declare_module readelf
> +
> +# Override the user's locale so we are sure we can parse the output of
> +# readelf(1) and file(1)
> +export LC_ALL=C
> +
> +: ${READELF:=readelf}
> +
> +# readelf.get_rpath file
> +#
> +# Return the unsplitted RPATH/RUNPATH of $file.

 unsplitted -> unsplit.

 But it's actually not return, it's print. And to make it very explicit, write:

Print the :-separate RPATH/RUNPATH of $file.

> +#
> +# To split the returned RPATH string and store them in an array, do:
> +#
> +#     paths=( $(readelf.get_rpath "${file}" | sed -e 's/:/ /g') )
> +#
> +# file : ELF file path
> +#
> +# environment:
> +#   READELF: readelf program path
> +readelf.get_rpath() {
> +    local file="${1}"
> +    "${READELF}" --dynamic "${file}" |
> +        sed -r -e '/.* \(R(UN)?PATH\) +Library r(un)?path: \[(.+)\]$/!d ; s//\3/'
> +}

 I have to go now, so reviewed until here. The rest I can hopefully review
tomorrow...

 Regards,
 Arnout


[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
