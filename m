From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 22 Apr 2016 22:50:20 +0200
Subject: [Buildroot] [PATCH v9 08/11] support/scripts: add check-host-leaks
	script + all needed helpers
In-Reply-To: <1461358223-18312-1-git-send-email-s.martin49@gmail.com>
References: <1461358223-18312-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1461358223-18312-9-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v8->v9:
- none

changes v7->v8:
- move sdk.check_host_leaks in the check-host-leaks script itself
  (Arnout)
- drop leak classification (Arnout)
- rework readelf.is_elf_{static_library,object} (Arnout)
- add utils.assert_absolute_canonical_path
- drop utils.guess_gnu_target_name
- rework/simplify the check-host-leaks script command line

changes v6->v7:
- {filer,is}_elf* functions moved from utils to readelf module
- update sdk.check_host_leaks

changes v5->v6:
- new patch
---
 support/scripts/check-host-leaks | 126 +++++++++++++++++++++++++++++++++++++++
 support/scripts/shell/readelf.sh |  77 ++++++++++++++++++++++--
 support/scripts/shell/sdk.sh     |   7 +++
 support/scripts/shell/utils.sh   |  14 +++++
 4 files changed, 218 insertions(+), 6 deletions(-)
 create mode 100755 support/scripts/check-host-leaks

diff --git a/support/scripts/check-host-leaks b/support/scripts/check-host-leaks
new file mode 100755
index 0000000..9f363af
--- /dev/null
+++ b/support/scripts/check-host-leaks
@@ -0,0 +1,126 @@
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
+  local ret="${1:-0}"
+  cat <<EOF
+
+Usage:  ${0##*/} [options] ROOT_DIR LEAK_PATH...
+
+Description:
+
+        This script scans a tree for host paths leaked into it.
+        Prints out leaks alongside with the kind of leak.
+
+Arguments:
+
+        ROOT_DIR        Path to the root of the tree to be scanned
+
+        LEAK_PATH       Paths to check for occurence. Several paths can be
+                        passed.
+                        A LEAK_PATH must be an absolute canonical path.
+                        In the Buildroot context, the LEAK_PATH are Buildroot's
+                        TOPDIR, BASE_DIR, HOST_DIR and STAGING_DIR.
+
+Options:
+
+        --exclude=PATH
+                Excludes files from ROOT_DIR starting with PATH. Obviously, the
+                excluded paths should point to some sub-location of ROOT_DIR.
+                Can be set more than once.
+                An excluded path must be an absolute canonical path.
+
+
+EOF
+  return ${ret}
+}
+
+source "${0%/*}/shell/source.sh"
+
+source.load_module log
+source.load_module utils
+source.load_module sdk
+
+main() {
+    local root_dir
+    local class_leaks
+    local excluded=()
+    local leak_paths=()
+    while test ${#} -gt 0 ; do
+        case "${1}" in
+            --exclude=*) excluded+=( "${1#*=}" )
+                ;;
+            --exclude)   shift ; excluded+=( "${1}" )
+                ;;
+            -h|--help)
+                usage
+                exit 0
+                ;;
+            *)  if test -z "${root_dir}" ; then root_dir="${1}"
+                else leak_paths+=( "${1}" )
+                fi
+                ;;
+        esac
+        shift
+    done
+
+    excluded=( $(utils.list_reduce ${excluded[@]}) )
+    leak_paths=( $(utils.list_reduce ${leak_paths[@]}) )
+
+    # sanity checks
+    if test -z "${root_dir}" ; then
+        log.error "Not enough argument: no ROOT_DIR given.\n" ||
+            usage ${?} || exit ${?}
+    fi
+    if test ${#leak_paths[@]} -lt 1 ; then
+        log.error "Not enough argument. No LEAK_PATH given.\n" ||
+            usage ${?} || exit ${?}
+    fi
+
+    local path has_non_abspath
+    for path in ${leak_paths[@]} ; do
+        utils.assert_absolute_canonical_path "${path}" || has_non_abspath=y
+    done
+    if test -n "${has_non_abspath}" ; then
+        log.error "Some LEAK_PATH are not absolute canonical paths.\n" ||
+            usage ${?} || exit ${?}
+    fi
+    has_non_abspath=
+    for path in ${excluded[@]} ; do
+        utils.assert_absolute_canonical_path "${path}" || has_non_abspath=y
+    done
+    if test -n "${has_non_abspath}" ; then
+        log.error "Some excluded path are not absolute canonical paths.\n" ||
+            usage ${?} || exit ${?}
+    fi
+
+    local re_leaks="$(sed -re 's/^/(/ ; s/$/)/ ; s/ +/|/g' <<<"${leak_paths[*]}")"
+    local re_excl="$(sed -re 's/ +/|/g' <<<"${excluded[*]}")"
+    if test -n "${re_excl}" ; then
+      re_excl="\\:^(${re_excl}):d"
+    fi
+    pushd "${root_dir}" >/dev/null
+    local f
+    grep -raEl "${re_leaks}" . |
+        sed -re "${re_excl} ; s:^\.:${root_dir}:" |
+        while read f ; do
+            printf "%s\n" "${f}"
+        done | sort
+    popd >/dev/null
+}
+main "${@}"
diff --git a/support/scripts/shell/readelf.sh b/support/scripts/shell/readelf.sh
index 78a1a9f..b23666e 100644
--- a/support/scripts/shell/readelf.sh
+++ b/support/scripts/shell/readelf.sh
@@ -17,18 +17,22 @@
 # Readelf helpers
 #
 # This module defines the following functions:
+#   readelf._match_elf_regexp
 #   readelf._filter_elf_regexp
 #   readelf.filter_elf
 #   readelf.filter_elf_executable
 #   readelf.filter_elf_shared_object
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
@@ -39,12 +43,28 @@ source.declare_module readelf
 # C locale, so we are sure we can reliably parse its output.
 : ${READELF:=readelf}
 
-# readelf._filter_elf_regexp filter_cmd file...
+# readelf._match_elf_regexp regexp file
 #
-# Filters ELF files WRT the given regular extended expression.
+# Returns 0 if the ELF file matches the ELF type given in extended regular
+# expression, non-0 otherwise.
+#
+# regexp     : extended regular expression
+# file       : list of files to be filtered
+#
+# environment:
+#   READELF: readelf program path
+readelf._match_elf_regexp() {
+    log._trace_func
+    local regexp="${1}" file="${2}"
+    LC_ALL=C ${READELF} -h "${file}" 2>/dev/null | grep -qE "${regexp}"
+}
+
+# readelf._filter_elf_regexp regexp file...
+#
+# Filters ELF files WRT the given extended regular expression.
 # This funtion can take one or several files, or read them from stdin.
 #
-# filter_cmd : filter command (usually based on grep)
+# regexp     : extended regular expression
 # file       : list of files to be filtered
 #
 # environment:
@@ -56,9 +76,7 @@ readelf._filter_elf_regexp() {
     test ${#} -gt 0 && in='printf "%s\n" "${@}"' || in='dd 2>/dev/null'
     eval "${in}" |
         while read file ; do
-            LC_ALL=C ${READELF} -h "${file}" 2>/dev/null |
-                grep -qE "${regexp}" ||
-                    continue
+            readelf._match_elf_regexp "${regexp}" "${file}" || continue
             printf "%s\n" "${file}"
         done
 }
@@ -129,6 +147,39 @@ readelf.is_elf_executable() {
     test "$(readelf.filter_elf_executable "${1}")" != ""
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
+    test "$(readelf.filter_elf "${1}")" != ""
+}
+
+# readelf.is_elf_static_library file
+#
+# Return 0 if $file is a Linux static libraries, i.e. an ar-archive
+# containing *.o files.
+#
+# file : path of file to be tested
+readelf.is_elf_static_library() {
+    readelf._match_elf_regexp "Type:\s+REL\s\(Relocatable\sfile\)" "${@}" &&
+        readelf._match_elf_regexp "^File:\s+\S+\)$" "${@}"
+}
+
+# readelf.is_elf_object file
+#
+# Return 0 if $file is an ELF object file, i.e. a *.o (or *.ko) file.
+#
+# file : path of file to be tested
+readelf.is_elf_object() {
+    readelf._match_elf_regexp "Type:\s+REL\s\(Relocatable\sfile\)" "${@}" &&
+        ! readelf._match_elf_regexp "^File:\s+\S+\)$" "${@}"
+}
+
 # readelf.get_rpath file
 #
 # Return the unsplitted RPATH/RUNPATH of $file.
@@ -240,3 +291,17 @@ readelf.has_section() {
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
index b2f699c..6cb3bbe 100644
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
diff --git a/support/scripts/shell/utils.sh b/support/scripts/shell/utils.sh
index 9e9aaab..eac3158 100644
--- a/support/scripts/shell/utils.sh
+++ b/support/scripts/shell/utils.sh
@@ -19,6 +19,7 @@
 # This module defines the following functions:
 #   utils.list_has
 #   utils.list_reduce
+#   utils.assert_absolute_canonical_path
 
 source.declare_module utils
 
@@ -58,3 +59,16 @@ utils.list_reduce() {
 
     echo ${lout[@]}
 }
+
+# utils.assert_absolute_canonical_path path
+#
+# Returns 0 if 'path' is the absolute canonical path, returns non-0
+# otherwise.
+#
+# If the test failed, an error message will be issued to stderr.
+#
+# path : path to be tested
+utils.assert_absolute_canonical_path() {
+    test "$(readlink -f "${1}")" = "${1}" ||
+        log.error "%s is not the absolute canonical path.\n" "${1}" >&2
+}
-- 
2.8.0
