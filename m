From: Samuel Martin <s.martin49@gmail.com>
Date: Wed,  9 Mar 2016 23:58:49 +0100
Subject: [Buildroot] [PATCH v7 08/18] support/scripts: add fix-rpath script
	+ a bunch of helpers
In-Reply-To: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1457564339-27294-9-git-send-email-s.martin49@gmail.com>
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
changes v6->v7 (includes changes started during BR dev. days):
- log module:
  - debug env. var. renamed: DEBUG -> SHELL_DEBUG
  - trace now prints the message level
- patchelf module:
  - get rid of XRPATH/XORIGIN stuff (Arnout)
  - set_rpath now handles ELF files with no .dynamic section
  - cleanup and minor fix in sanitize_rpath
- readelf module:
  - move {filter,is}_elf* functions from utils to readelf modules
  - add list_sections and has_section functions (needed in
    sanitize_rpath)
- sdk modules:
  - get rid of XRPATH/XORIGIN stuff (Arnout)
  - minor functions doc. fixes
- source module:
  - move "Could not load module" error message in load_module (Arnout)
- utils module:
  - move {filter,is}_elf* functions from utils to readelf modules
  - add list_has function
- fix-rpath:
  - runs with "set -e" (exit on error)
  - improve help text
  - slight refactoring because of modules changes

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
 support/scripts/fix-rpath         | 116 +++++++++++++++++++++++++
 support/scripts/shell/log.sh      |  61 +++++++++++++
 support/scripts/shell/patchelf.sh | 178 ++++++++++++++++++++++++++++++++++++++
 support/scripts/shell/readelf.sh  | 174 +++++++++++++++++++++++++++++++++++++
 support/scripts/shell/sdk.sh      |  68 +++++++++++++++
 support/scripts/shell/source.sh   |  77 +++++++++++++++++
 support/scripts/shell/utils.sh    |  60 +++++++++++++
 7 files changed, 734 insertions(+)
 create mode 100755 support/scripts/fix-rpath
 create mode 100644 support/scripts/shell/log.sh
 create mode 100644 support/scripts/shell/patchelf.sh
 create mode 100644 support/scripts/shell/readelf.sh
 create mode 100644 support/scripts/shell/sdk.sh
 create mode 100644 support/scripts/shell/source.sh
 create mode 100644 support/scripts/shell/utils.sh

diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
new file mode 100755
index 0000000..2ef89ab
--- /dev/null
+++ b/support/scripts/fix-rpath
@@ -0,0 +1,116 @@
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
+set -e
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
+Environment:
+
+        HOST_READELF    readelf program to use for host ELF files
+                        (default: readelf)
+
+        HOST_READELF    readelf program to use for host ELF files
+                        (default: readelf)
+
+        PATCHELF        patchelf program to use
+                        (default: patchelf)
+EOF
+}
+
+source "${0%/*}/shell/source.sh"
+
+source.load_module readelf
+source.load_module patchelf
+
+: ${HOST_READELF:=readelf}
+: ${TARGET_READELF:=readelf}
+: ${PATCHELF:=patchelf}
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
+    while read file ; do
+        READELF="${readelf}" PATCHELF="${PATCHELF}" \
+            patchelf.sanitize_rpath "${basedir}" "${file}" ${sanitize_extra_args[@]}
+    done < <( find ${find_args[@]} | readelf.filter_elf )
+}
+
+main ${@}
diff --git a/support/scripts/shell/log.sh b/support/scripts/shell/log.sh
new file mode 100644
index 0000000..ada2553
--- /dev/null
+++ b/support/scripts/shell/log.sh
@@ -0,0 +1,61 @@
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
+: ${SHELL_DEBUG:=0}
+
+# Low level utility function
+log.trace()  {
+    local level="${1}" msg="${2}"
+    shift 2
+    printf "[%-5s] %s: ${msg}" "${level:0:5}" "${my_name}" "${@}"
+}
+
+# Public logging functions
+log.debug()  { :; }
+[ ${SHELL_DEBUG} -lt 3 ] || log.debug() { log.trace DEBUG "${@}" >&2; }
+log.info()   { :; }
+[ ${SHELL_DEBUG} -lt 2 ] || log.info()  { log.trace INFO "${@}" >&2; }
+log.warn()   { :; }
+[ ${SHELL_DEBUG} -lt 1 ] || log.warn()  { log.trace WARN "${@}" >&2; }
+log.errorN() { local ret="${1}" ; shift ; log.trace ERROR "${@}" ; exit ${ret} ; }
+log.error()  { log.errorN 1 "${@}"; }
+
+# Program name
+my_name="${0##*/}"
+
diff --git a/support/scripts/shell/patchelf.sh b/support/scripts/shell/patchelf.sh
new file mode 100644
index 0000000..8da9c07
--- /dev/null
+++ b/support/scripts/shell/patchelf.sh
@@ -0,0 +1,178 @@
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
+#   patchelf.set_rpath
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
+# Automatically join all RPATH with the correct separator.
+#
+# file  : ELF file path
+# rpath : RPATH element
+#
+# environment:
+#   PATCHELF: patchelf program path
+patchelf.set_rpath() {
+    local file="${1}"
+    shift
+    local rpath="$(sed -e 's/ +/:/g' <<<"${@}")"
+    # Sanity check: patchelf needs the ELF file to have a .dynamic section.
+    # So, check for it and behaves in a proper way:
+    # - returns immediatly if no .dynamic section, and RPATH is empty;
+    # - bail out if no .dynamic section and RPATH is not empty.
+    if ! readelf.has_section "${file}" '.dynamic' ; then
+        if test -z "${rpath}" ; then
+            return 0
+        else
+            local fmt="Trying to set a RPATH to a ELF file with no .dynamic section\n"
+            fmt="${fmt}\tfile : %s\n"
+            fmt="${fmt}\tRPATH: %s\n"
+            log.error "${fmt}" "${file}" "${rpath}"
+        fi
+    fi
+    "${PATCHELF}" --set-rpath "${rpath}" "${file}"
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
+        "$( sdk.compute_rpath "${basedir}" "${binary%/*}" ${libdirs[@]} )"
+    patchelf.set_rpath "${binary}" \
+        "$( sdk.compute_rpath "${basedir}" "${binary%/*}" ${libdirs[@]} )"
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
+    readelf.is_elf_shared_object "${binary}" ||
+        readelf.is_elf_executable "${binary}" ||
+            return 0
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
+    local rpaths="$( readelf.get_rpath "${binary}" )"
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
+    patchelf.update_rpath "${basedir}" "${binary}" ${libdirs[@]}
+}
diff --git a/support/scripts/shell/readelf.sh b/support/scripts/shell/readelf.sh
new file mode 100644
index 0000000..541b3e1
--- /dev/null
+++ b/support/scripts/shell/readelf.sh
@@ -0,0 +1,174 @@
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
+#   readelf._filter_elf_regexp
+#   readelf.filter_elf
+#   readelf.filter_elf_executable
+#   readelf.filter_elf_shared_object
+#   readelf.is_elf_executable
+#   readelf.is_elf_shared_object
+#   readelf.get_rpath
+#   readelf.list_sections
+#   readelf.has_section
+#
+# This module is sensitive to the following environment variables:
+#   READELF
+source.declare_module readelf
+
+# When calling readelf(1) program, the user's locale will be overriden with the
+# C locale, so we are sure we can reliably parse its output.
+: ${READELF:=readelf}
+
+# readelf._filter_elf_regexp filter_cmd file...
+#
+# Filters ELF files WRT the given regular extended expression.
+# This funtion can take one or several files, or read them from stdin.
+#
+# filter_cmd : filter command (usually based on grep)
+# file       : list of files to be filtered
+#
+# environment:
+#   READELF: readelf program path
+readelf._filter_elf_regexp() {
+    local regexp="${1}"
+    shift
+    local in file
+    test ${#} -gt 0 && in='printf "%s\n" "${@}"' || in='dd 2>/dev/null'
+    eval "${in}" |
+        while read file ; do
+            LC_ALL=C ${READELF} -h "${file}" 2>/dev/null |
+                grep -qE "${regexp}" ||
+                    continue
+            printf "%s\n" "${file}"
+        done
+}
+
+# readelf.filter_elf file...
+#
+# Filters ELF files; if $file is an ELF file, $file is printed, else it is
+# discarded.
+# This funtion can take one or several arguments, or read them from stdin.
+#
+# file : path of file to be filtered
+#
+# environment:
+#   READELF: readelf program path
+readelf.filter_elf() {
+    readelf._filter_elf_regexp "Class:\s+ELF" "${@}"
+}
+
+# readelf.filter_elf_shared_object file...
+#
+# Filters ELF files; if $file is an ELF file, $file is printed, else it is
+# discarded.
+# This funtion can take one or several arguments, or read them from stdin.
+#
+# file : path of file to be filtered
+#
+# environment:
+#   READELF: readelf program path
+readelf.filter_elf_shared_object() {
+    readelf._filter_elf_regexp "Type:\s+DYN\s\(Shared\sobject\sfile\)" "${@}"
+}
+
+# readelf.filter_elf_executable file...
+#
+# Filters ELF files; if $file is an ELF file, $file is printed, else it is
+# discarded.
+# This funtion can take one or several arguments, or read them from stdin.
+#
+# file : path of file to be filtered
+#
+# environment:
+#   READELF: readelf program path
+readelf.filter_elf_executable() {
+    readelf._filter_elf_regexp "Type:\s+EXEC\s\(Executable\sfile\)" "${@}"
+}
+
+# readelf.is_elf_shared_object file
+#
+# Returns 0 if $file is an ELF file, non-0 otherwise.
+#
+# file : path of file to be tested
+#
+# environment:
+#   READELF: readelf program path
+readelf.is_elf_shared_object() {
+    test "$( readelf.filter_elf_shared_object "${1}" )" != ""
+}
+
+# readelf.is_elf_executable file
+#
+# Returns 0 if $file is an ELF file, non-0 otherwise.
+#
+# file : path of file to be tested
+#
+# environment:
+#   READELF: readelf program path
+readelf.is_elf_executable() {
+    test "$( readelf.filter_elf_executable "${1}" )" != ""
+}
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
+    LC_ALL=C "${READELF}" --dynamic "${file}" |
+        sed -r -e '/.* \(R(UN)?PATH\) +Library r(un)?path: \[(.+)\]$/!d ; s//\3/'
+}
+
+# readelf.list_sections file
+#
+# Returns the list of ELF sections in $file.
+#
+# file    : ELF file path
+#
+# environment:
+#   READELF: readelf program path
+readelf.list_sections() {
+    local file="${1}"
+    LC_ALL=C "${READELF}" --sections "${file}" |
+        sed -re '/^  \[ *[0-9]+\] (\S+).*/!d ; s//\1/' |
+        sort
+}
+
+# readelf.has_section file section
+#
+# Return 0 if $file has a section named $section
+#
+# file    : ELF file path
+# section : ELF section name
+#
+# environment:
+#   READELF: readelf program path
+readelf.has_section() {
+    log._trace_func
+    local file="${1}" section_name="${2}"
+    readelf.list_sections "${file}" | grep -q "^${section_name}$"
+}
diff --git a/support/scripts/shell/sdk.sh b/support/scripts/shell/sdk.sh
new file mode 100644
index 0000000..b2f699c
--- /dev/null
+++ b/support/scripts/shell/sdk.sh
@@ -0,0 +1,68 @@
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
+#   sdk.compute_rpath
+
+source.declare_module sdk
+
+# sdk.compute_relative_path basedir path start
+#
+# Computes and prints the relative path between $start and $path within $basedir.
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
+    local i
+    local backward="${start#${basedir}}"
+    local relative=()
+    for i in ${backward//\// } ; do
+        # don't need to check for empty items they are already discarded
+        test "${i}" != '.' || continue
+        relative+=( ".." )
+    done
+    relative+=( ${path#${basedir}} )
+    sed -r -e 's:[ /]+:/:g' <<<"${relative[@]}"
+}
+
+# sdk.compute_rpath basedir bindir libdirs...
+#
+# Computes and prints the list of RPATH.
+#
+# basedir : absolute path of the tree in which the $bindir and $libdirs must be
+# bindir  : binary directory absolute path
+# libdirs : list of library directories (absolute paths)
+sdk.compute_rpath() {
+    local basedir="${1}"
+    local bindir="${2}"
+    shift 2
+    local libdirs=( ${@} )
+    local rpath=()
+    for libdir in ${libdirs[@]} ; do
+        rpath+=( "\$ORIGIN/$(sdk.compute_relative_path "${basedir}" "${libdir}" "${bindir}")" )
+    done
+    sed -e 's/ /:/g' <<<"${rpath[@]}"
+}
diff --git a/support/scripts/shell/source.sh b/support/scripts/shell/source.sh
new file mode 100644
index 0000000..9f798b8
--- /dev/null
+++ b/support/scripts/shell/source.sh
@@ -0,0 +1,77 @@
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
+
+    if [ ! -f "${module_file}" ] ; then
+        cat <<EOF >&2
+error:  Could load module '${module_name}',
+        ${module_file} does not exists.
+
+        Maybe TOPDIR does not point to Buildroot's '\$(TOPDIR)'.
+
+        Or this script '${0##*/}' is most not installed in Buildroot's
+        '\$(TOPDIR)/support/scripts' directory.
+
+        You can fix this by:
+        - either installing '${0##*/}' in the support/scripts/ directory;
+        - or setting the TOPDIR variable in the '${0##*/}' script, before
+          sourcing anything.
+EOF
+        exit 1
+    fi
+
+    test -n "${loaded}" || source "${module_file}"
+}
+
+source.declare_module source
diff --git a/support/scripts/shell/utils.sh b/support/scripts/shell/utils.sh
new file mode 100644
index 0000000..9e9aaab
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
+#   utils.list_has
+#   utils.list_reduce
+
+source.declare_module utils
+
+# utils.list_has value list_items...
+#
+# Returns 0 if $list_items contains $value, returns 1 otherwise.
+#
+# value      : item to be checked if it is in the list
+# list_items : list of items
+utils.list_has() {
+    local key=$1
+    shift
+    for val in $@ ; do
+        if test "$val" = "$key" ; then
+            return 0
+        fi
+    done
+    return 1
+}
+
+# utils.list_reduce input_list
+#
+# Prints the $input_list list with duplicated items removed.
+# Order is preserved, WRT the first occurence of duplicated items.
+#
+# input_list : list of items
+utils.list_reduce() {
+    local -a lout # return list
+    local i
+
+    for i in ${@} ; do
+        if utils.list_has "${i}" ${lout[@]} ; then
+            continue
+        fi
+        lout+=( "${i}" )
+    done
+
+    echo ${lout[@]}
+}
-- 
2.7.2
