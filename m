From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  1 Feb 2016 16:53:40 +0100
Subject: [Buildroot] [PATCH v6 12/13] support/scripts: add check-host-leaks
	script + all needed helpers
In-Reply-To: <1454342021-22960-1-git-send-email-s.martin49@gmail.com>
References: <1454342021-22960-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1454342021-22960-13-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v5->v6:
- new patch
---
 support/scripts/check-host-leaks | 63 +++++++++++++++++++++++++++++++++++
 support/scripts/shell/readelf.sh | 31 ++++++++++++++++++
 support/scripts/shell/sdk.sh     | 71 ++++++++++++++++++++++++++++++++++++++++
 support/scripts/shell/utils.sh   | 64 ++++++++++++++++++++++++++++++++++++
 4 files changed, 229 insertions(+)
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
index e0549d2..81ebbb8 100644
--- a/support/scripts/shell/readelf.sh
+++ b/support/scripts/shell/readelf.sh
@@ -21,6 +21,8 @@
 #   readelf.get_rpath
 #   readelf.needs_rpath
 #   readelf.has_rpath
+#   readelf.list_sections
+#   readelf.string_section
 #
 # This module is sensitive to the following environment variables:
 #   READELF
@@ -118,3 +120,32 @@ readelf.has_rpath() {
 
     return 1
 }
+
+# readelf.list_sections file
+#
+# Return the ELF section list of $file.
+#
+# file    : ELF file path
+#
+# environment:
+#   READELF: readelf program path
+readelf.list_sections() {
+    local file="${1}"
+    "${READELF}" --sections "${file}" |
+        sed -re '/^  \[ *[0-9]+\] (\S+).*/!d ; s//\1/' |
+        sort
+}
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
+    "${READELF}" --string-dump "${section}" "${file}" 2>/dev/null
+}
diff --git a/support/scripts/shell/sdk.sh b/support/scripts/shell/sdk.sh
index 3188516..629f917 100644
--- a/support/scripts/shell/sdk.sh
+++ b/support/scripts/shell/sdk.sh
@@ -19,9 +19,16 @@
 # This module defines the following functions:
 #   sdk.compute_relative_path
 #   sdk.compute_xrpath
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
 # Compute and return the relative path between $start and $path within $basedir.
@@ -68,3 +75,67 @@ sdk.compute_xrpath() {
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
+            elif utils.is_elf "${f}" ;then
+                if utils.is_elf_executable "${f}" ; then leak="ELF/exe"
+                elif utils.is_elf_shared_object "${f}" ; then leak="ELF/*.so"
+                else
+                    case "${f}" in
+                        *.ko) leak="ELF/*.ko" ;;
+                        *) leak="ELF/*.o" ;;
+                    esac
+                fi
+                local section
+                local sections=()
+                for section in $( READELF="${READELF}" readelf.list_sections "${f}" ) ; do
+                    if READELF="${READELF}" readelf.string_section "${f}" "${section}" |
+                            grep -qaE "${regexp}" ; then
+                        sections+=( "${section}" )
+                    fi
+                done
+                leak="${leak} [${sections[*]}]"
+            else
+                case "${f}" in
+                    *.a)
+                        if utils.is_elf_static_lib "${f}" ; then leak="ELF/*.a" ; fi
+                        ;;
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
index b49a541..15c75f0 100644
--- a/support/scripts/shell/utils.sh
+++ b/support/scripts/shell/utils.sh
@@ -18,8 +18,13 @@
 #
 # This module defines the following functions:
 #   utils.list_reduce
+#   utils.filter_elf_shared_object
 #   utils.filter_elf_executable
 #   utils.filter_elf
+#   utils.is_elf_shared_object
+#   utils.is_elf_executable
+#   utils.is_elf
+#   utils.guess_gnu_target_name
 
 source.declare_module utils
 
@@ -43,6 +48,23 @@ utils.list_reduce() {
     echo ${lout[@]}
 }
 
+# utils.filter_elf_shared_object filepath...
+#
+# Filter ELF files; if $file is an ELF file, $file is print, else it is
+# discarded.
+# This funtion can take one or several arguments, or read them from stdin.
+#
+# file : path of file to be filtered
+utils.filter_elf_shared_object() {
+    local in file
+    test ${#} -gt 0 && in='printf "%s\n" ${@}' || in='dd 2>/dev/null'
+    eval "${in}" |
+        while read file ; do
+            file "${file}" 2>/dev/null |
+                sed -r -e '/^([^:]+):.*\<ELF\>.*\<shared object\>.*/!d ; s//\1/'
+        done
+}
+
 # utils.filter_elf_executable filepath...
 #
 # Filter ELF files; if $file is an ELF file, $file is print, else it is
@@ -76,3 +98,45 @@ utils.filter_elf() {
                 sed -r -e '/^([^:]+):.*\<ELF\>.*/!d ; s//\1/'
         done
 }
+
+# utils.is_elf_shared_object file
+#
+# Return 0 if $file is an ELF file, non-0 otherwise.
+#
+# file : path of file to be tested
+utils.is_elf_shared_object() {
+    test "$(utils.filter_elf_shared_object "${1}")" != ""
+}
+
+# utils.is_elf_executable file
+#
+# Return 0 if $file is an ELF file, non-0 otherwise.
+#
+# file : path of file to be tested
+utils.is_elf_executable() {
+    test "$(utils.filter_elf_executable "${1}")" != ""
+}
+
+# utils.is_elf file
+#
+# Return 0 if $file is an ELF file, non-0 otherwise.
+#
+# file : path of file to be tested
+utils.is_elf() {
+    test "$(utils.filter_elf "${1}")" != ""
+}
+
+# utils.guess_gnu_target_name sysroot
+#
+# Guess the GNU target name from the given sysroot location.
+# This assumes the sysroot is located in:
+#   <somewhere>/<GNU_target_name>/sysroot
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
2.7.0
