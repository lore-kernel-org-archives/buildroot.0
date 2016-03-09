From: Samuel Martin <s.martin49@gmail.com>
Date: Wed,  9 Mar 2016 23:58:57 +0100
Subject: [Buildroot] [PATCH v7 16/18] support/scripts: add check-host-leaks
	script + all needed helpers
In-Reply-To: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1457564339-27294-17-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v6->v7:
- {filer,is}_elf* functions moved from utils to readelf module
- update sdk.check_host_leaks

changes v5->v6:
- new patch
---
 support/scripts/check-host-leaks | 63 +++++++++++++++++++++++++++++
 support/scripts/shell/readelf.sh | 85 ++++++++++++++++++++++++++++++++++++++++
 support/scripts/shell/sdk.sh     | 70 +++++++++++++++++++++++++++++++++
 support/scripts/shell/utils.sh   | 16 ++++++++
 4 files changed, 234 insertions(+)
 create mode 100755 support/scripts/check-host-leaks

diff --git a/support/scripts/check-host-leaks b/support/scripts/check-host-leaks
new file mode 100755
index 0000000..42da272
--- /dev/null
+++ b/support/scripts/check-host-leaks
@@ -0,0 +1,63 @@
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
+Usage:  ${0} TREE_DIR TOPDIR BASE_DIR HOST_DIR STAGING_DIR
+
+Description:
+
+        This script scans a tree for host paths leaks into it.
+        Print out leaks along side to their kind.
+
+Arguments:
+
+        TREE_DIR        Path to the root of the tree to be scaned
+
+        TOPDIR          Buildroot's TOPDIR
+
+        BASE_DIR        Buildroot's build output base location
+
+        HOST_DIR        Buildroot's host directory
+
+        STAGING_DIR     Buildroot's staging directory
+
+EOF
+}
+
+source "${0%/*}/shell/source.sh"
+
+READELF=readelf
+
+source.load_module utils
+source.load_module sdk
+
+main() {
+    if test ${#} -ne 5 ; then
+        usage
+        exit 1
+    fi
+    local to_scan="${1}"
+    local topdir="${2}" basedir="${3}" hostdir="${4}" stagingdir="${5}"
+    local gnu_target_name=$( utils.guess_gnu_target_name "${stagingdir}" )
+    local tree path
+    sdk.check_host_leaks "${gnu_target_name}" "${to_scan}" \
+        "${topdir}" "${basedir}" "${hostdir}"
+}
+
+main "${@}"
diff --git a/support/scripts/shell/readelf.sh b/support/scripts/shell/readelf.sh
index 09b680e..e07276f 100644
--- a/support/scripts/shell/readelf.sh
+++ b/support/scripts/shell/readelf.sh
@@ -21,14 +21,19 @@
 #   readelf.filter_elf
 #   readelf.filter_elf_executable
 #   readelf.filter_elf_shared_object
+#   readelf.filter_elf_static_library
+#   readelf.filter_elf_object
 #   readelf.is_elf_executable
 #   readelf.is_elf_shared_object
+#   readelf.is_elf_static_library
+#   readelf.is_elf_object
 #   readelf.get_rpath
 #   readelf.get_neededs
 #   readelf.needs_rpath
 #   readelf.has_rpath
 #   readelf.list_sections
 #   readelf.has_section
+#   readelf.string_section
 #
 # This module is sensitive to the following environment variables:
 #   READELF
@@ -105,6 +110,40 @@ readelf.filter_elf_executable() {
     readelf._filter_elf_regexp "Type:\s+EXEC\s\(Executable\sfile\)" "${@}"
 }
 
+# readelf.filter_elf_static_library file...
+#
+# Filters ELF files; if $file is an ELF file, $file is printed, else it is
+# discarded.
+# This funtion can take one or several arguments, or read them from stdin.
+#
+# file : path of file to be filtered
+#
+# environment:
+#   READELF: readelf program path
+readelf.filter_elf_static_library() {
+    readelf._filter_elf_regexp "Type:\s+REL\s\(Relocatable\sfile\)" "${@}" |
+    readelf._filter_elf_regexp "^File:\s+\S+\)$"
+}
+
+# readelf.filter_elf_object file...
+#
+# Filters ELF files; if $file is an ELF file, $file is printed, else it is
+# discarded.
+# This funtion can take one or several arguments, or read them from stdin.
+#
+# file : path of file to be filtered
+#
+# environment:
+#   READELF: readelf program path
+readelf.filter_elf_object() {
+    readelf._filter_elf_regexp "Type:\s+REL\s\(Relocatable\sfile\)" "${@}" |
+    while read file ; do
+        LC_ALL=C ${READELF} -h "${file}" 2>/dev/null |
+            grep -qE "^File:\s+\S+\)$" ||
+        printf "%s\n" "${file}"
+   done
+}
+
 # readelf.is_elf_shared_object file
 #
 # Returns 0 if $file is an ELF file, non-0 otherwise.
@@ -129,6 +168,38 @@ readelf.is_elf_executable() {
     test "$( readelf.filter_elf_executable "${1}" )" != ""
 }
 
+# readelf.is_elf file
+#
+# Returns 0 if $file is an ELF file, non-0 otherwise.
+#
+# file : path of file to be tested
+#
+# environment:
+#   READELF: readelf program path
+readelf.is_elf() {
+    test "$( readelf.filter_elf "${1}" )" != ""
+}
+
+# readelf.is_elf_static_library file
+#
+# Return 0 if $file is a Linux static libraries, i.e. an ar-archive
+# containing *.o files.
+#
+# file : path of file to be tested
+readelf.is_elf_static_library() {
+    test "$( readelf.filter_elf_static_library "${1}" )" != ""
+}
+
+# readelf.is_elf_object file
+#
+# Return 0 if $file is a Linux static libraries, i.e. an ar-archive
+# containing *.o files.
+#
+# file : path of file to be tested
+readelf.is_elf_object() {
+    test "$( readelf.filter_elf_object "${1}" )" != ""
+}
+
 # readelf.get_rpath file
 #
 # Return the unsplitted RPATH/RUNPATH of $file.
@@ -241,3 +312,17 @@ readelf.has_section() {
     local file="${1}" section_name="${2}"
     readelf.list_sections "${file}" | grep -q "^${section_name}$"
 }
+
+# readelf.string_section file section
+#
+# Return the given $section of $file.
+#
+# file    : ELF file path
+# section : ELF section name
+#
+# environment:
+#   READELF: readelf program path
+readelf.string_section() {
+    local file="${1}" section="${2}"
+    LC_ALL=C "${READELF}" --string-dump "${section}" "${file}" 2>/dev/null
+}
diff --git a/support/scripts/shell/sdk.sh b/support/scripts/shell/sdk.sh
index b2f699c..ea96ebf 100644
--- a/support/scripts/shell/sdk.sh
+++ b/support/scripts/shell/sdk.sh
@@ -19,9 +19,16 @@
 # This module defines the following functions:
 #   sdk.compute_relative_path
 #   sdk.compute_rpath
+#   sdk.check_host_leaks
+#
+# This module is sensitive to the following environment variables:
+#   READELF
 
 source.declare_module sdk
 
+source.load_module utils
+source.load_module readelf
+
 # sdk.compute_relative_path basedir path start
 #
 # Computes and prints the relative path between $start and $path within $basedir.
@@ -66,3 +73,66 @@ sdk.compute_rpath() {
     done
     sed -e 's/ /:/g' <<<"${rpath[@]}"
 }
+
+# sdk.check_host_leaks gnu_target_name root pattern_basedir...
+#
+# Scan the $root tree for the given $pattern_basedir pattern leaks.
+# The $gnu_target_name is used to skip the sysroot location when
+# scanning the host tree.
+# Categorize the type of leaks.
+# Print the leaks categories and and the matching file path.
+#
+# gnu_target_name : GNU target name (e.g. arm-buildroot-linux-gnueabihf)
+# root            : path to the root of the tree to be scanned
+# pattern_basedir : list of patterns to be searched
+sdk.check_host_leaks() {
+    local target="${1}" root="${2}"
+    local patterns=()
+    local pattern
+    shift 2
+    for pattern in ${@} ; do
+        patterns+=( "${pattern}" "$( readlink -f "${pattern}" )" )
+    done
+    patterns=( $( utils.list_reduce ${patterns[@]} ) )
+
+    local regexp="$( sed -re 's/^/(/ ; s/$/)/ ; s/ +/|/g' <<<"${patterns[*]}" )"
+    ( cd "${root}"
+        local f leak
+        while read f ; do
+            leak=
+            if test -h "${f}" ; then leak="symlink"
+            elif readelf.is_elf "${f}" ;then
+                if readelf.is_elf_executable "${f}" ; then leak="ELF/exe"
+                elif readelf.is_elf_shared_object "${f}" ; then leak="ELF/*.so"
+                elif readelf.is_elf_static_library "${f}" ; then leak="ELF/*.a"
+                elif readelf.is_elf_object "${f}" ; then
+                    case "${f}" in
+                        *.ko) leak="ELF/*.ko" ;;
+                        *) leak="ELF/*.o" ;;
+                    esac
+                else leak="ELF/?"
+                fi
+                local section
+                local sections=()
+                for section in $( readelf.list_sections "${f}" ) ; do
+                    if readelf.string_section "${f}" "${section}" |
+                            grep -qaE "${regexp}" ; then
+                        sections+=( "${section}" )
+                    fi
+                done
+                leak="${leak} [${sections[*]}]"
+            else
+                case "${f}" in
+                    *.la) leak="*.la" ;;
+                    *.pc) leak="*.pc" ;;
+                    *.py) leak="*.py" ;;
+                    *.pyc) leak="*.pyc" ;;
+                esac
+            fi
+            if test -z "${leak}" ; then
+                leak="? [$( file -z "${f}" | sed -e 's/.*: //' )]"
+            fi
+            printf "%-70s : %-120s\n" "${leak}" "${f}"
+        done < <( grep -raEl "${regexp}" . | sed -re "/${target}\/sysroot\//d ; s:^\.:${root}:" )
+    ) | sort
+}
diff --git a/support/scripts/shell/utils.sh b/support/scripts/shell/utils.sh
index 9e9aaab..8e0a443 100644
--- a/support/scripts/shell/utils.sh
+++ b/support/scripts/shell/utils.sh
@@ -19,6 +19,7 @@
 # This module defines the following functions:
 #   utils.list_has
 #   utils.list_reduce
+#   utils.guess_gnu_target_name
 
 source.declare_module utils
 
@@ -58,3 +59,18 @@ utils.list_reduce() {
 
     echo ${lout[@]}
 }
+
+# utils.guess_gnu_target_name sysroot
+#
+# Guess the GNU target name from the given sysroot location.
+# This assumes the sysroot is located in:
+#   <somewhere>/<gnu_target_name>/sysroot
+#
+# sysroot : path to the sysroot
+utils.guess_gnu_target_name() {
+    local sysroot="${1}"
+    sysroot="$( readlink -f "${sysroot}" )"
+    local gnu_target_name="${sysroot%/sysroot*}"
+    gnu_target_name="${gnu_target_name##*/}"
+    printf "%s" "${gnu_target_name}"
+}
-- 
2.7.2
