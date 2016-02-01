From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  1 Feb 2016 16:53:35 +0100
Subject: [Buildroot] [PATCH v6 07/13] support/scripts: add fix-rpath script
	+ a bunch of helpers
In-Reply-To: <1454342021-22960-1-git-send-email-s.martin49@gmail.com>
References: <1454342021-22960-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1454342021-22960-8-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit introduces a fix-rpath shell-script able to scan a tree,
detect ELF files, check their RPATH and fix it in a proper way.

Along to the fix-rpath script, it also adds a bunch of shell helper
functions grouped into modules. This will help writing scripts handling
RPATH and other things, while allowing to share and reuse these
functions between scripts.

These helpers are namespaced within the filename of the module in which
they are gathered.

This change adds 6 modules:
- source.sh: provides simple helper to easily source another module, taking
    care of not sourcing again an already-sourced one;
- log.sh: provides logging helpers;
- utils.sh: provides simple functions to filter ELF files in a list;
- readelf.sh: provides functions retrieving ELF details from a file;
- patchelf.sh: provides function updating ELF files;
- sdk.sh: provides RPATH computation functions.

These 6 modules are used by the fix-rpath script.
Follow-up patches will make some scripts leveraging these modules.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v5->v6:
- fully rewritten in shell

changes v4->v5:
- add verbose support
- rename shrink_rpath -> clear_rpath
- add sanitize_rpath function

changes v3->v4:
- fix typos and license (Baruch)

changes v2->v3:
- no change
---
 support/scripts/fix-rpath         | 101 +++++++++++++++++++++++
 support/scripts/shell/log.sh      |  57 +++++++++++++
 support/scripts/shell/patchelf.sh | 163 ++++++++++++++++++++++++++++++++++++++
 support/scripts/shell/readelf.sh  |  52 ++++++++++++
 support/scripts/shell/sdk.sh      |  70 ++++++++++++++++
 support/scripts/shell/source.sh   |  73 +++++++++++++++++
 support/scripts/shell/utils.sh    |  60 ++++++++++++++
 7 files changed, 576 insertions(+)
 create mode 100755 support/scripts/fix-rpath
 create mode 100644 support/scripts/shell/log.sh
 create mode 100644 support/scripts/shell/patchelf.sh
 create mode 100644 support/scripts/shell/readelf.sh
 create mode 100644 support/scripts/shell/sdk.sh
 create mode 100644 support/scripts/shell/source.sh
 create mode 100644 support/scripts/shell/utils.sh

diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
new file mode 100755
index 0000000..938e599
--- /dev/null
+++ b/support/scripts/fix-rpath
@@ -0,0 +1,101 @@
+#!/usr/bin/env bash
+
+# Copyright (C) 2016 Samuel Martin <s.martin49@gmail.com>
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+# General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+
+usage() {
+  cat <<EOF >&2
+Usage:  ${0} TREE_KIND TREE_ROOT
+
+Description:
+
+        This script scans a tree and sanitize ELF files' RPATH found in there.
+
+        Sanitization behaves the same whatever the kindd of the processed tree, but
+        the resulting RPATH differs.
+
+        Sanitization action:
+        - remove RPATH pointing outside of the tree
+        - for RPATH pointing in the tree:
+          - if they point to standard location (/lib, /usr/lib): remove them
+          - otherwise: make them relative using \$ORIGIN
+
+        For the target tree:
+        - scan the whole tree for sanitization
+
+        For the staging tree :
+        - scan the whole tree for sanitization
+
+        For the host tree:
+        - skip the staging tree for sanitization
+        - add \$HOST_DIR/{lib,usr/lib} to RPATH (as relative pathes)
+
+Arguments:
+
+        TREE_KIND   Kind of tree to be processed.
+                    Allowed values: host, target, staging
+
+        TREE_ROOT   Path to the root of the tree to be scaned
+
+EOF
+}
+
+source "${0%/*}/shell/source.sh"
+
+source.load_module utils
+source.load_module readelf
+source.load_module patchelf
+
+main() {
+    local tree="${1}"
+    local basedir="$( readlink -f "${2}" )"
+
+    local find_args=( "${basedir}" )
+    local sanitize_extra_args=()
+    local readelf
+
+    case "${tree}" in
+        host)
+            # do not process the sysroot (only contains target binaries)
+            find_args+=( "-name" "sysroot" "-prune" "-o" )
+
+            # do not process the external toolchain installation directory to
+            # to avoid breaking it.
+            find_args+=( "-path" "*/opt/ext-toolchain" "-prune" "-o" )
+
+            # make sure RPATH will point to ${hostdir}/lib and ${hostdir}/usr/lib
+            sanitize_extra_args+=( "keep_lib_and_usr_lib" )
+
+            readelf="${HOST_READELF}"
+            ;;
+        staging|target)
+            readelf="${TARGET_READELF}"
+            ;;
+        *)
+            usage
+            exit 1
+            ;;
+    esac
+
+    find_args+=( "-type" "f" "-print" )
+
+    while read file; do
+        READELF="${READELF}" PATCHELF="${PATCHELF}" \
+            patchelf.sanitize_rpath "${basedir}" "${file}" ${sanitize_extra_args[@]}
+    done < <( find ${find_args[@]} | utils.filter_elf )
+}
+
+main ${@}
diff --git a/support/scripts/shell/log.sh b/support/scripts/shell/log.sh
new file mode 100644
index 0000000..ffa19e8
--- /dev/null
+++ b/support/scripts/shell/log.sh
@@ -0,0 +1,57 @@
+# Copyright (C) 2016 Samuel Martin <s.martin49@gmail.com>
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+# General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+
+# Logging helpers
+#
+# This module defines the following functions:
+#   log.trace
+#   log.debug
+#   log.info
+#   log.warn
+#   log.errorN
+#   log.error
+#
+# This module sets the following variables:
+#   my_name
+#
+# This module is sensitive to the following environment variables:
+#   DEBUG
+
+source.declare_module log
+
+# Debug level:
+# - 0 or empty: only show errors
+# - 1         : show errors and warnings
+# - 2         : show errors, warnings, and info
+# - 3         : show errors, warnings, info and debug
+: ${DEBUG:=0}
+
+# Low level utility function
+log.trace()  { local msg="${1}"; shift; printf "%s: ${msg}" "${my_name}" "${@}"; }
+
+# Public logging functions
+log.debug()  { :; }
+[ ${DEBUG} -lt 3 ] || log.debug() { log.trace "${@}" >&2; }
+log.info()   { :; }
+[ ${DEBUG} -lt 2 ] || log.info()  { log.trace "${@}" >&2; }
+log.warn()   { :; }
+[ ${DEBUG} -lt 1 ] || log.warn()  { log.trace "${@}" >&2; }
+log.errorN() { local ret="${1}"; shift; log.warn "${@}"; exit ${ret}; }
+log.error()  { log.errorN 1 "${@}"; }
+
+# Program name
+my_name="${0##*/}"
+
diff --git a/support/scripts/shell/patchelf.sh b/support/scripts/shell/patchelf.sh
new file mode 100644
index 0000000..d1eb590
--- /dev/null
+++ b/support/scripts/shell/patchelf.sh
@@ -0,0 +1,163 @@
+# Copyright (C) 2016 Samuel Martin <s.martin49@gmail.com>
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+# General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+
+# Patchelf helpers
+#
+# This module defines the following functions:
+#   patchelf.set_xrpath
+#   patchelf.update_rpath
+#   patchelf.sanitize_rpath
+#
+# This module is sensitive to the following environment variables:
+#   PATCHELF
+#   READELF
+
+source.declare_module patchelf
+
+source.load_module log
+source.load_module sdk
+source.load_module utils
+source.load_module readelf
+
+: ${PATCHELF:=patchelf}
+
+# patchelf.set_xrpath file rpath...
+#
+# Set RPATH in $file.
+# Automatically join all RPATH with the correct separator, and also handle
+# XRPATH (replacing "XORIGIN" with "$ORIGIN").
+#
+# file  : ELF file path
+# rpath : RPATH element
+#
+# environment:
+#   PATCHELF: patchelf program path
+patchelf.set_xrpath() {
+    local file="${1}"
+    shift
+    local xrpath="$(sed -e 's/ +/:/g' <<<"${@}")"
+    "${PATCHELF}" --set-rpath "${xrpath//XORIGIN/\$ORIGIN}" "${file}"
+}
+
+# patchelf.update_rpath basedir binary libdirs...
+#
+# Set RPATH in $binary computing them from the paths $libdirs (and $basedir).
+# Existing RPATH in $file will be overwritten if any.
+#
+# basedir : absolute path of the tree in which the $bindir and $libdirs must be
+# binary  : ELF file absolute path
+# libdirs : list of library location (absolute paths)
+#
+# environment:
+#   PATCHELF: patchelf program path
+patchelf.update_rpath() {
+    local basedir="${1}"
+    local binary="${2}"
+    shift 2
+    local libdirs=( ${@} )
+    log.debug "  basedir: %s\n" "${basedir}"
+    log.debug "      elf: %s\n" "${binary}"
+    log.debug "  libdirs: %s\n" "${libdirs[*]}"
+    log.info  "    rpath: %s\n" \
+        "$( sdk.compute_xrpath "${basedir}" "${binary%/*}" ${libdirs[@]} |
+            sed -e 's/XORIGIN/\$ORIGIN/g' )"
+    PATCHELF="${PATCHELF}" patchelf.set_xrpath "${binary}" \
+        $( sdk.compute_xrpath "${basedir}" "${binary%/*}" ${libdirs[@]} )
+}
+
+# patchelf.sanitize_rpath basedir binary [keep_lib_usr_lib]
+#
+# Scan $binary's RPATH, remove any of them pointing outside of $basedir.
+# If $keep_lib_usr_lib in not empty, the library directories $basedir/lib and
+# $basedir/usr/lib will be added to the RPATH.
+#
+# Note:
+#     Absolute paths is needed to correctly handle symlinks and or mount-bind in
+#     the $basedir path.
+#
+# basedir          : absolute path of the tree in which the $bindir and $libdirs
+#                    must be
+# binary           : ELF file absolute path
+# keep_lib_usr_lib : add to RPATH $basedir/lib and $basedir/usr/lib
+#
+# environment:
+#   PATCHELF: patchelf program path
+#   READELF : readelf program path
+patchelf.sanitize_rpath() {
+    local basedir="$( readlink -f "${1}" )"
+    local binary="${2}"
+    local keep_lib_usr_lib="${3}"
+
+    local path abspath rpath
+    local libdirs=()
+
+    if test -n "${keep_lib_usr_lib}" ; then
+        libdirs+=( "${basedir}/lib" "${basedir}/usr/lib" )
+    fi
+
+    log.info "ELF: %s\n" "${binary}"
+
+    local rpaths="$( READELF="${READELF}" readelf.get_rpath "${binary}" )"
+
+    for rpath in ${rpaths//:/ } ; do
+        # figure out if we should keep or discard the path; there are several
+        # cases to handled:
+        # - $path starts with "$ORIGIN":
+        #     The original build-system already took care of setting a relative
+        #     RPATH, resolve it and test if it is worthwhile to keep it;
+        # - $basedir/$path exists:
+        #     The original build-system already took care of setting an absolute
+        #     RPATH (absolute in the final rootfs), resolve it and test if it is
+        #     worthwhile to keep it;
+        # - $path start with $basedir:
+        #     The original build-system added some absolute RPATH (absolute on
+        #     the build machine). While this is wrong, it can still be fixed; so
+        #     test if it is worthwhile to keep it;
+        # - $path points somewhere else:
+        #     (can be anywhere: build trees, staging tree, host location,
+        #     non-existing location, etc.)
+        #     Just discard such a path.
+        if grep -q '^$ORIGIN/' <<<"${rpath}" ; then
+            path="${binary%/*}/${rpath#*ORIGIN/}"
+        elif test -e "${basedir}/${rpath}" ; then
+            path="${basedir}/${rpath}"
+        elif grep -q "^${basedir}/" <<<"$( readlink -f "${rpath}" )" ; then
+            path="${rpath}"
+        else
+            log.debug "\tDROPPED [out-of-tree]: %s\n" "${rpath}"
+            continue
+        fi
+
+        abspath="$( readlink -f "${path}" )"
+
+        # discard path pointing to default locations handled by ld-linux
+        if grep -qE "^${basedir}/(lib|usr/lib)$" <<<"${abspath}" ; then
+            log.debug \
+                "\tDROPPED [std libdirs]: %s (%s)\n" "${rpath}" "${abspath}"
+            continue
+        fi
+
+        log.debug "\tKEPT %s (%s)\n" "${rpath}" "${abspath}"
+
+        libdirs+=( "${abspath}" )
+
+    done
+
+    libdirs=( $( utils.list_reduce ${libdirs[@]} ) )
+
+    PATCHELF="${PATCHELF}" \
+        patchelf.update_rpath "${basedir}" "${binary}" ${libdirs[@]}
+}
diff --git a/support/scripts/shell/readelf.sh b/support/scripts/shell/readelf.sh
new file mode 100644
index 0000000..82968a2
--- /dev/null
+++ b/support/scripts/shell/readelf.sh
@@ -0,0 +1,52 @@
+# Copyright (C) 2016 Samuel Martin <s.martin49@gmail.com>
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+# General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+
+# Readelf helpers
+#
+# This module defines the following functions:
+#   readelf.get_rpath
+#
+# This module is sensitive to the following environment variables:
+#   READELF
+#
+# This module sets the following environment variables:
+#   LC_ALL=C
+
+source.declare_module readelf
+
+# Override the user's locale so we are sure we can parse the output of
+# readelf(1) and file(1)
+export LC_ALL=C
+
+: ${READELF:=readelf}
+
+# readelf.get_rpath file
+#
+# Return the unsplitted RPATH/RUNPATH of $file.
+#
+# To split the returned RPATH string and store them in an array, do:
+#
+#     paths=( $(readelf.get_rpath "${file}" | sed -e 's/:/ /g') )
+#
+# file : ELF file path
+#
+# environment:
+#   READELF: readelf program path
+readelf.get_rpath() {
+    local file="${1}"
+    "${READELF}" --dynamic "${file}" |
+        sed -r -e '/.* \(R(UN)?PATH\) +Library r(un)?path: \[(.+)\]$/!d ; s//\3/'
+}
diff --git a/support/scripts/shell/sdk.sh b/support/scripts/shell/sdk.sh
new file mode 100644
index 0000000..3188516
--- /dev/null
+++ b/support/scripts/shell/sdk.sh
@@ -0,0 +1,70 @@
+# Copyright (C) 2016 Samuel Martin <s.martin49@gmail.com>
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+# General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+
+# SDK helpers
+#
+# This module defines the following functions:
+#   sdk.compute_relative_path
+#   sdk.compute_xrpath
+
+source.declare_module sdk
+
+# sdk.compute_relative_path basedir path start
+#
+# Compute and return the relative path between $start and $path within $basedir.
+#
+# basedir : absolute path of the tree in which the $path and $start must be
+# path    : destination absolute path
+# start   : origin absolute path
+sdk.compute_relative_path() {
+    local basedir="${1}"
+    local path="${2}"
+    local start="${3}"
+    # sanity checks: make sure $path and $start starts with $basedir
+    grep -q "^${basedir}" <<<"${path}" || return 1
+    grep -q "^${basedir}" <<<"${start}" || return 1
+    local i backward="${start#${basedir}}"
+    backward=( ${backward//\// } )
+    local relative=()
+    for i in ${backward[@]} ; do
+        test -n ${i} || continue
+        relative+=( ".." )
+    done
+    relative+=( ${path#${basedir}} )
+    sed -r -e 's:[ /]+:/:g' <<<"${relative[@]}"
+}
+
+# sdk.compute_xrpath basedir bindir libdirs...
+#
+# Compute and return the list of XRPATH.
+# XRPATH is RPATH with "$ORIGIN" replaced by "XORIGIN"; this trick is needed to
+# prevent mis-expansion by the shell interpreter.
+# The reverse reokacement is done right in the patchelf command.
+#
+# basedir : absolute path of the tree in which the $bindir and $libdirs must be
+# bindir  : binary directory absolute path
+# libdirs : list of library directories (absolute paths)
+sdk.compute_xrpath() {
+    local basedir="${1}"
+    local bindir="${2}"
+    shift 2
+    local libdirs=( ${@} )
+    local rpath=()
+    for libdir in ${libdirs[@]} ; do
+        rpath+=( "XORIGIN/$(sdk.compute_relative_path "${basedir}" "${libdir}" "${bindir}")" )
+    done
+    sed -e 's/ /:/g' <<<"${rpath[@]}"
+}
diff --git a/support/scripts/shell/source.sh b/support/scripts/shell/source.sh
new file mode 100644
index 0000000..1c70344
--- /dev/null
+++ b/support/scripts/shell/source.sh
@@ -0,0 +1,73 @@
+# Copyright (C) 2016 Samuel Martin <s.martin49@gmail.com>
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+# General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+
+# Source helpers
+#
+# This module defines the following functions:
+#   source.declare_module
+#   source.load_module
+#
+# This module is sensitive to the following environment variables:
+#   TOPDIR
+
+# Assuming the script sourcing this file is in support/scripts/
+: ${TOPDIR:=$( readlink -f "${0}" | sed -re 's:(/[^/]+){3}$::' )}
+
+if [ ! -f "${TOPDIR}/support/scripts/shell/source.sh" ] ; then
+    cat <<EOF >&2
+error: TOPDIR does not point to Buildroot's '\$(TOPDIR)'.
+
+       This script '${0##*/}' is most likely not installed in Buildroot's
+       '\$(TOPDIR)/support/scripts' directory.
+
+       You can fix this by:
+       - either installing '${0##*/}' in the support/scripts/ directory;
+       - or setting the TOPDIR variable in the '${0##*/}' script, before
+         sourcing anything.
+EOF
+    exit 1
+fi
+
+# source.declare_module module_name
+#
+# Declare a shell module.
+# Set the variable '_source_${module_name}'.
+# Should be called once per module, in the global scope.
+#
+# module_name : Module name (allowed char.: [_a-zA-Z0-9])
+source.declare_module() {
+    local module_name="${1}"
+    # use printf from bash to set the variable in the environment:
+    printf -v "_source_${module_name}" "%s" "${module_name}"
+}
+
+# source.load_module module_name
+#
+# Load the given shell module, making available all functions declared
+# in it, ensuring it is not reloaded if it already is.
+# Should be called in the global scope.
+# Need the TOPDIR environment variable.
+#
+# param module_name: Module name
+source.load_module() {
+    local module_name="${1}"
+    local loaded="loaded=\${_source_${module_name}}"
+    eval "${loaded}"
+    local module_file="${TOPDIR}/support/scripts/shell/${module_name}.sh"
+    test -n "${loaded}" || source "${module_file}"
+}
+
+source.declare_module source
diff --git a/support/scripts/shell/utils.sh b/support/scripts/shell/utils.sh
new file mode 100644
index 0000000..6b071fc
--- /dev/null
+++ b/support/scripts/shell/utils.sh
@@ -0,0 +1,60 @@
+# Copyright (C) 2016 Samuel Martin <s.martin49@gmail.com>
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+# General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+
+# Miscellaneous helpers
+#
+# This module defines the following functions:
+#   utils.list_reduce
+#   utils.filter_elf
+
+source.declare_module utils
+
+# utils.list_reduce input_list
+#
+# Return the $input_list list with duplicated items removed.
+# Order is preserved, wrt the first occurence of duplicated items.
+#
+# input_list : list of items
+utils.list_reduce() {
+    local -a lout # out list
+    local -A dout # associative array, used to check if an item is duplicated
+    local i
+
+    for i in ${@} ; do
+        test -z "${dout["${i}"]}" || continue
+        dout["${i}"]=y
+        lout+=( "${i}" )
+    done
+
+    echo ${lout[@]}
+}
+
+# utils.filter_elf filepath...
+#
+# Filter ELF files; if $file is an ELF file, $file is print, else it is
+# discarded.
+# This funtion can take one or several arguments, or read them from stdin.
+#
+# file : path of file to be filtered
+utils.filter_elf() {
+    local in file
+    test ${#} -gt 0 && in='printf "%s\n" ${@}' || in='dd 2>/dev/null'
+    eval "${in}" |
+        while read file ; do
+            file "${file}" 2>/dev/null |
+                sed -r -e '/^([^:]+):.*\<ELF\>.*/!d ; s//\1/'
+        done
+}
-- 
2.7.0
