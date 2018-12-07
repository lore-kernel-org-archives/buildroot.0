From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  7 Dec 2018 19:10:09 +0100
Subject: [Buildroot] [PATCH 1/2] core: make symlinks relative when preparing
 the SDK
In-Reply-To: <cover.1544206190.git.yann.morin.1998@free.fr>
References: <cover.1544206190.git.yann.morin.1998@free.fr>
Message-ID: <054c70a8ee5ddefc0e9592da3913cc54e24d2c35.1544206190.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The SDK is supposed to be relocatable, so symlinks must not be
absolute.

Add a new helper script, that replaces all absolute symlinks with
relative ones.

The ideal solution would use the shortest relative path for the
destination, but it is non-trivial to come up with. We just ensure
the relative path does not cross a common base directory, and compute
all the paths relative to that anchor.

This can give non-optimum relative symlinks, like:
    /base-dir/bin/foo -> ../bin/bar

when the optimum would have been:
    /base-dir/bin/foo -> bar

Finally, as a sanity check, ensure there is not relative symlinl
pointing out of the base directory, because their targets would be
missing from the SDK.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Joel Carlson <JoelsonCarl@gmail.com>
---
 Makefile                     |  1 +
 support/scripts/fix-symlinks | 53 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100755 support/scripts/fix-symlinks

diff --git a/Makefile b/Makefile
index 37df98520e..e8a1c7b366 100644
--- a/Makefile
+++ b/Makefile
@@ -586,6 +586,7 @@ prepare-sdk: world
 	@$(call MESSAGE,"Rendering the SDK relocatable")
 	$(TOPDIR)/support/scripts/fix-rpath host
 	$(TOPDIR)/support/scripts/fix-rpath staging
+	$(TOPDIR)/support/scripts/fix-symlinks "$(HOST_DIR)"
 	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
 	mkdir -p $(HOST_DIR)/share/buildroot
 	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
diff --git a/support/scripts/fix-symlinks b/support/scripts/fix-symlinks
new file mode 100755
index 0000000000..b1190300e2
--- /dev/null
+++ b/support/scripts/fix-symlinks
@@ -0,0 +1,53 @@
+#!/usr/bin/env bash
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+# Transform all symlinks in ${1} from absolute to relative,
+# with the base of relativity anchored in ${1}
+#
+# Additionally, ensure that all existing symlinks point inside the
+# base directory.
+#
+# Note that the relativity of the symlink is not the shortest, e.g.
+# ${base}/bin/foo can end up as a symlink to ../bin/bar when it would
+# be shorter to have a symlink to ./bar, or even simply to bar. This
+# is not the nicest, but works and is easy to do.
+
+main() {
+    local base="${1}"
+    local link dest reldir
+    local -a links
+
+    links=( $(find "${base}" -type l -printf '%P\n') )
+    for link in "${links[@]}"; do
+        dest="$(readlink "${base}/${link}")"
+        case "${dest}" in
+          ("${base}"/*) ;; # We need to handle that one
+          (/*)
+            printf 'Absolute symlink outside of base "%s": "%s" -> "%s"\n' \
+                   "${base}" "${link}" "${dest}"
+            exit 1
+            ;;
+          (../*|*/../*|*/..)
+            # Not absolute, but does it cross the boundary?
+            dest="$(readlink -m "${base}/${link}")"
+            case "${dest}" in
+              ("${base}"/*) ;; # Anchored, OK
+              (*)
+                printf 'Relative symlink outside of base "%s": "%s" -> "%s"\n' \
+                       "${base}" "${link}" "${dest}"
+                exit 1
+                ;;
+            esac
+            continue # Not absolute, does not cross, OK
+            ;;
+          (*)
+            continue # Not absolute, does not cross, OK
+            ;;
+        esac
+        reldir="$(sed -r -e 's,([^/]+/),../,g; s,/[^/]+$,,' <<<"${link#${base}}")"
+        rm -f "${base}/${link}"
+        ln -sf "${reldir}${dest#${base}}" "${base}/${link}"
+    done
+}
+
+main "${@}"
-- 
2.14.1
