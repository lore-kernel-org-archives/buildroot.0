From: Wolfgang Grandegger <wg@grandegger.com>
Date: Fri,  3 Mar 2017 15:18:46 +0100
Subject: [Buildroot] [RFC PATCH 2/9] support/scripts: add fix-rpath script
	to sanitize the rpath
In-Reply-To: <1488550733-3956-1-git-send-email-wg@grandegger.com>
References: <1488550733-3956-1-git-send-email-wg@grandegger.com>
Message-ID: <1488550733-3956-3-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

This commit introduces a fix-rpath script able to scan a tree,
detect ELF files, check their RPATH and fix it in a proper way.
The RPATH fixup is done by the patchelf utility using the option
"--make-rpath-relative".

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 support/scripts/fix-rpath | 106 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100755 support/scripts/fix-rpath

diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
new file mode 100755
index 0000000..bde2c17
--- /dev/null
+++ b/support/scripts/fix-rpath
@@ -0,0 +1,106 @@
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
+#set -e
+#set -v
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
+        PATCHELF        patchelf program to use
+                        (default: patchelf)
+EOF
+}
+
+: ${PATCHELF:=patchelf}
+
+main() {
+    local tree="${1}"
+    local basedir="$(readlink -f "${2}")"
+
+    local find_args=( "${basedir}" )
+    local sanitize_extra_args=( )
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
+            ;;
+        staging|target)
+            # discard ${hostdir}/lib and ${hostdir}/usr/lib
+            sanitize_extra_args+=( "--no-standard-lib-dirs" )
+
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
+        # some files are not writable
+        chmod u+w $file
+        # call patchelf for each regular file; error will silently be ignored.
+        ${PATCHELF} --debug --make-rpath-relative "${basedir}" ${sanitize_extra_args[@]} "${file}" >> /dev/null 2>&1
+    done < <(find ${find_args[@]})
+
+    # ignore errors
+    return 0
+}
+
+main ${@}
-- 
1.9.1
