From: Samuel Martin <s.martin49@gmail.com>
Date: Wed,  9 Mar 2016 23:58:54 +0100
Subject: [Buildroot] [PATCH v7 13/18] support/scripts: update
	check-host-rpath to use the shell helpers
In-Reply-To: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1457564339-27294-14-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v6->v7:
- minor updates after shell modules shell changes

changes v5->v6:
- new patch
---
 support/scripts/check-host-rpath | 71 +++++++++++++++-------------------------
 support/scripts/shell/readelf.sh | 69 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+), 44 deletions(-)

diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
index 48d69da..0bbac30 100755
--- a/support/scripts/check-host-rpath
+++ b/support/scripts/check-host-rpath
@@ -1,12 +1,29 @@
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
+source.load_module readelf
 
 main() {
     local pkg="${1}"
@@ -18,54 +35,20 @@ main() {
 
     ret=0
     while read file; do
-        elf_needs_rpath "${file}" "${hostdir}" || continue
-        check_elf_has_rpath "${file}" "${hostdir}" && continue
+        READELF=readelf readelf.needs_rpath "${file}" "${hostdir}" || continue
+        READELF=readelf readelf.has_rpath "${file}" "${hostdir}" && continue
         if [ ${ret} -eq 0 ]; then
             ret=1
             printf "***\n"
-            printf "*** ERROR: package %s installs executables without proper RPATH:\n" "${pkg}"
+            printf \
+                "*** ERROR: package %s installs executables without proper RPATH:\n" \
+                "${pkg}"
         fi
         printf "***   %s\n" "${file}"
-    done < <( find "${hostdir}"/usr/{bin,sbin} -type f -exec file {} + 2>/dev/null \
-              |sed -r -e '/^([^:]+):.*\<ELF\>.*\<executable\>.*/!d'                \
-                      -e 's//\1/'                                                  \
-            )
+    done < <( find "${hostdir}"/usr/{bin,sbin} -type f -print |
+                  readelf.filter_elf_executable )
 
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
index 541b3e1..09b680e 100644
--- a/support/scripts/shell/readelf.sh
+++ b/support/scripts/shell/readelf.sh
@@ -24,11 +24,15 @@
 #   readelf.is_elf_executable
 #   readelf.is_elf_shared_object
 #   readelf.get_rpath
+#   readelf.get_neededs
+#   readelf.needs_rpath
+#   readelf.has_rpath
 #   readelf.list_sections
 #   readelf.has_section
 #
 # This module is sensitive to the following environment variables:
 #   READELF
+
 source.declare_module readelf
 
 # When calling readelf(1) program, the user's locale will be overriden with the
@@ -143,6 +147,71 @@ readelf.get_rpath() {
         sed -r -e '/.* \(R(UN)?PATH\) +Library r(un)?path: \[(.+)\]$/!d ; s//\3/'
 }
 
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
+    LC_ALL=C "${READELF}" --dynamic "${file}" |
+        sed -r -e '/^.* \(NEEDED\) .*Shared library: \[(.+)\]$/!d ; s//\1/'
+}
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
+    done < <( readelf.get_neededs "${file}" )
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
+    done < <( readelf.get_rpath "${file}" )
+
+    return 1
+}
+
 # readelf.list_sections file
 #
 # Returns the list of ELF sections in $file.
-- 
2.7.2
