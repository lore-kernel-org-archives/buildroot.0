From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 16 Mar 2017 15:23:21 +0100
Subject: [Buildroot] [RFC PATCH v2 3/9] support/scripts: add fix-rpath
	script to sanitize the rpath
In-Reply-To: <1489674207-6876-1-git-send-email-wg@grandegger.com>
References: <1489674207-6876-1-git-send-email-wg@grandegger.com>
Message-ID: <1489674207-6876-4-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

This commit introduces the script "fix-rpath" able to scan a tree,
detect ELF files, check their RPATH and fix it in a proper way.
The RPATH fixup is done by the patchelf utility using the option
"--make-rpath-relative <root-directory>".

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 support/scripts/fix-rpath | 103 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100755 support/scripts/fix-rpath

diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
new file mode 100755
index 0000000..f87dc8b
--- /dev/null
+++ b/support/scripts/fix-rpath
@@ -0,0 +1,103 @@
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
+Usage:	${0} TREE_KIND
+
+Description:
+
+    This script scans a tree and sanitize ELF files' RPATH found in there.
+
+    Sanitization behaves the same whatever the kind of the processed tree,
+    but the resulting RPATH differs. The rpath sanitization is done using
+    "patchelf --make-rpath-relazive".
+
+Arguments:
+
+    TREE_KIND	Kind of tree to be processed.
+		Allowed values: host, target
+
+Environment:
+
+    PATCHELF	patchelf program to use
+		(default: HOST_DIR/usr/bin/patchelf)
+EOF
+}
+
+: ${PATCHELF:=${HOST_DIR}/usr/bin/patchelf}
+
+main() {
+    local rootdir
+    local tree="${1}"
+    local find_args=( )
+    local sanitize_extra_args=( )
+
+    case "${tree}" in
+	host)
+	    rootdir="${HOST_DIR}"
+
+	    # do not process the sysroot (only contains target binaries)
+	    find_args+=( "-path" "${STAGING_DIR}" "-prune" "-o" )
+
+	    # do not process the external toolchain installation directory to
+	    # avoid breaking it.
+	    test "${TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR}" != "" && \
+		find_args+=( "-path" "${TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR}" "-prune" "-o" )
+
+	    # ELF files should not be in these sub-directories
+	    find_args+=( "-path" "${STAGING_DIR}/usr/share/terminfo" "-prune" "-o" )
+
+	    # do not process the patchelf binary but a copy to work-around "file in use"
+	    find_args+=( "-path" "${PATCHELF}" "-prune" "-o" )
+	    cp "${PATCHELF}" "${PATCHELF}.__to_be_patched"
+	    ;;
+
+	target)
+	    rootdir="${TARGET_DIR}"
+	    sanitize_extra_args+=( "--no-standard-lib-dirs" )
+	    ;;
+
+	*)
+	    usage
+	    exit 1
+	    ;;
+    esac
+
+    find_args+=( "-type" "f" "-print" )
+
+    while read file ; do
+	# check if it's an ELF file
+	if ${PATCHELF} --print-rpath "${file}" > /dev/null 2>&1; then
+	    # make files writable if necessary
+	    changed=$(chmod -c u+w "$file")
+	    # call patchelf to sanitize the rpath
+	    ${PATCHELF} --make-rpath-relative "${rootdir}" ${sanitize_extra_args[@]} "${file}"
+	    # restore the original permission
+	    test "${changed}" != "" && chmod u-w "$file"
+	fi
+    done < <(find ${rootdir} ${find_args[@]})
+
+    # Restore patched patchelf utility
+    test "${tree}" = "host" && mv "${PATCHELF}.__to_be_patched" "${PATCHELF}"
+
+    # ignore errors
+    return 0
+}
+
+main ${@}
-- 
1.9.1
