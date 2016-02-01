From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  1 Feb 2016 16:53:39 +0100
Subject: [Buildroot] [PATCH v6 11/13] support/scripts: update
	check-host-rpath to use the shell helpers
In-Reply-To: <1454342021-22960-1-git-send-email-s.martin49@gmail.com>
References: <1454342021-22960-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1454342021-22960-12-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v5->v6:
- new patch
---
 support/scripts/check-host-rpath | 67 ++++++++++++++-------------------------
 support/scripts/shell/readelf.sh | 68 ++++++++++++++++++++++++++++++++++++++++
 support/scripts/shell/utils.sh   | 18 +++++++++++
 3 files changed, 110 insertions(+), 43 deletions(-)

diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
index 48d69da..55be97e 100755
--- a/support/scripts/check-host-rpath
+++ b/support/scripts/check-host-rpath
@@ -1,12 +1,30 @@
 #!/usr/bin/env bash
 
+# Copyright (C) 2015 Yann E. MORIN <yann.morin.1998@free.fr>
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
 # This script scans $(HOST_DIR)/{bin,sbin} for all ELF files, and checks
 # they have an RPATH to $(HOST_DIR)/usr/lib if they need libraries from
 # there.
 
-# Override the user's locale so we are sure we can parse the output of
-# readelf(1) and file(1)
-export LC_ALL=C
+source "${0%/*}/shell/source.sh"
+
+source.load_module utils
+source.load_module readelf
 
 main() {
     local pkg="${1}"
@@ -18,54 +36,17 @@ main() {
 
     ret=0
     while read file; do
-        elf_needs_rpath "${file}" "${hostdir}" || continue
-        check_elf_has_rpath "${file}" "${hostdir}" && continue
+        READELF=readelf readelf.needs_rpath "${file}" "${hostdir}" || continue
+        READELF=readelf readelf.has_rpath "${file}" "${hostdir}" && continue
         if [ ${ret} -eq 0 ]; then
             ret=1
             printf "***\n"
             printf "*** ERROR: package %s installs executables without proper RPATH:\n" "${pkg}"
         fi
         printf "***   %s\n" "${file}"
-    done < <( find "${hostdir}"/usr/{bin,sbin} -type f -exec file {} + 2>/dev/null \
-              |sed -r -e '/^([^:]+):.*\<ELF\>.*\<executable\>.*/!d'                \
-                      -e 's//\1/'                                                  \
-            )
+    done < <( find "${hostdir}"/usr/{bin,sbin} -type f -print | utils.filter_elf_executable )
 
     return ${ret}
 }
 
-elf_needs_rpath() {
-    local file="${1}"
-    local hostdir="${2}"
-    local lib
-
-    while read lib; do
-        [ -e "${hostdir}/usr/lib/${lib}" ] && return 0
-    done < <( readelf -d "${file}"                                         \
-              |sed -r -e '/^.* \(NEEDED\) .*Shared library: \[(.+)\]$/!d;' \
-                     -e 's//\1/;'                                          \
-            )
-
-    return 1
-}
-
-check_elf_has_rpath() {
-    local file="${1}"
-    local hostdir="${2}"
-    local rpath dir
-
-    while read rpath; do
-        for dir in ${rpath//:/ }; do
-            # Remove duplicate and trailing '/' for proper match
-            dir="$( sed -r -e 's:/+:/:g; s:/$::;' <<<"${dir}" )"
-            [ "${dir}" = "${hostdir}/usr/lib" ] && return 0
-        done
-    done < <( readelf -d "${file}"                                              \
-              |sed -r -e '/.* \(R(UN)?PATH\) +Library r(un)?path: \[(.+)\]$/!d' \
-                      -e 's//\3/;'                                              \
-            )
-
-    return 1
-}
-
 main "${@}"
diff --git a/support/scripts/shell/readelf.sh b/support/scripts/shell/readelf.sh
index 82968a2..e0549d2 100644
--- a/support/scripts/shell/readelf.sh
+++ b/support/scripts/shell/readelf.sh
@@ -17,7 +17,10 @@
 # Readelf helpers
 #
 # This module defines the following functions:
+#   readelf.get_neededs
 #   readelf.get_rpath
+#   readelf.needs_rpath
+#   readelf.has_rpath
 #
 # This module is sensitive to the following environment variables:
 #   READELF
@@ -33,6 +36,20 @@ export LC_ALL=C
 
 : ${READELF:=readelf}
 
+# readelf.get_neededs file
+#
+# Return the list of the NEEDED libraries of $file.
+#
+# file : ELF file path
+#
+# environment:
+#   READELF: readelf program path
+readelf.get_neededs() {
+    local file="${1}"
+    "${READELF}" --dynamic "${file}" |
+        sed -r -e '/^.* \(NEEDED\) .*Shared library: \[(.+)\]$/!d ; s//\1/'
+}
+
 # readelf.get_rpath file
 #
 # Return the unsplitted RPATH/RUNPATH of $file.
@@ -50,3 +67,54 @@ readelf.get_rpath() {
     "${READELF}" --dynamic "${file}" |
         sed -r -e '/.* \(R(UN)?PATH\) +Library r(un)?path: \[(.+)\]$/!d ; s//\3/'
 }
+
+# readelf.needs_rpath file basedir
+#
+# Return 0 if $file needs to have RPATH set, 1 otherwise.
+#
+# file    : path of file to be tested
+# basedir : path of the tree in which $basedir/lib and $basedir/usr/lib are
+#           checked for belonging to RPATH
+#
+# environment:
+#   READELF: readelf program path
+readelf.needs_rpath() {
+    local file="${1}"
+    local basedir="${2}"
+    local lib
+
+    while read lib; do
+        [ -e "${basedir}/lib/${lib}" ] && return 0
+        [ -e "${basedir}/usr/lib/${lib}" ] && return 0
+    done < <( READELF="${READELF}" readelf.get_neededs "${file}" )
+    return 1
+}
+
+# readelf.has_rpath file basedir
+#
+# Return 0 if $file has RPATH already set to $basedir/lib or $basedir/usr/lib,
+# 1 otherwise.
+#
+# file    : path of file to be tested
+# basedir : path of the tree in which $basedir/lib and $basedir/usr/lib are
+#           checked for belonging to RPATH
+#
+# environment:
+#   READELF: readelf program path
+readelf.has_rpath() {
+    local file="${1}"
+    local basedir="${2}"
+    local rpath dir
+
+    while read rpath; do
+        for dir in ${rpath//:/ }; do
+            # Remove duplicate and trailing '/' for proper match
+            dir="$( sed -r -e "s:/+:/:g; s:/$::" <<<"${dir}" )"
+            [ "${dir}" = "${basedir}/lib" ] && return 0
+            [ "${dir}" = "${basedir}/usr/lib" ] && return 0
+            grep -q '^\$ORIGIN/' <<<"${dir}" && return 0
+        done
+    done < <( READELF="${READELF}" readelf.get_rpath "${file}" )
+
+    return 1
+}
diff --git a/support/scripts/shell/utils.sh b/support/scripts/shell/utils.sh
index 6b071fc..b49a541 100644
--- a/support/scripts/shell/utils.sh
+++ b/support/scripts/shell/utils.sh
@@ -18,6 +18,7 @@
 #
 # This module defines the following functions:
 #   utils.list_reduce
+#   utils.filter_elf_executable
 #   utils.filter_elf
 
 source.declare_module utils
@@ -42,6 +43,23 @@ utils.list_reduce() {
     echo ${lout[@]}
 }
 
+# utils.filter_elf_executable filepath...
+#
+# Filter ELF files; if $file is an ELF file, $file is print, else it is
+# discarded.
+# This funtion can take one or several arguments, or read them from stdin.
+#
+# file : path of file to be filtered
+utils.filter_elf_executable() {
+    local in file
+    test ${#} -gt 0 && in='printf "%s\n" ${@}' || in='dd 2>/dev/null'
+    eval "${in}" |
+        while read file ; do
+            file "${file}" 2>/dev/null |
+                sed -r -e '/^([^:]+):.*\<ELF\>.*\<executable\>.*/!d ; s//\1/'
+        done
+}
+
 # utils.filter_elf filepath...
 #
 # Filter ELF files; if $file is an ELF file, $file is print, else it is
-- 
2.7.0
