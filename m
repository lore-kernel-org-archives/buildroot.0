From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Dec 2018 16:18:51 +0100
Subject: [Buildroot] [PATCH 1/2 v3] core: make symlinks relative when
 preparing the SDK
In-Reply-To: <cover.1545491919.git.yann.morin.1998@free.fr>
References: <cover.1545491919.git.yann.morin.1998@free.fr>
Message-ID: <9f4825baa7a475b4d8f262925e1ff652b31cd6fb.1545491919.git.yann.morin.1998@free.fr>
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

Finally, as a sanity check, ensure there is not relative symlink
pointing out of the base directory, because their targets would be
missing from the SDK.

We do one exception to that last rule: any symlink in a bin directory
of staging, that point s to a bin directory of the host, is simply
ignored. They are supposed to be validate on the target, and so are
supposed to point to target executables, so we are not going to execute
them anyway (we're still going to execute the foo-config scripts, but
they are not symlinks, so we're OK).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Joel Carlson <JoelsonCarl@gmail.com>
Cc: Andreas Naumann <dev@andin.de>

---
Changes v2 -> v3:
  - account for absolute symlinks in staging's bin dirs  (Andreas)
---
 Makefile                     |  1 +
 support/scripts/fix-symlinks | 71 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100755 support/scripts/fix-symlinks

diff --git a/Makefile b/Makefile
index c5b78b3274..e1b58e7bc3 100644
--- a/Makefile
+++ b/Makefile
@@ -586,6 +586,7 @@ prepare-sdk: world
 	@$(call MESSAGE,"Rendering the SDK relocatable")
 	$(TOPDIR)/support/scripts/fix-rpath host
 	$(TOPDIR)/support/scripts/fix-rpath staging
+	$(TOPDIR)/support/scripts/fix-symlinks
 	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
 	mkdir -p $(HOST_DIR)/share/buildroot
 	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
diff --git a/support/scripts/fix-symlinks b/support/scripts/fix-symlinks
new file mode 100755
index 0000000000..68c45fed6d
--- /dev/null
+++ b/support/scripts/fix-symlinks
@@ -0,0 +1,71 @@
+#!/usr/bin/env bash
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+# Transform all symlinks in ${HOST_DIR} from absolute to relative,
+# with the base of relativity anchored in ${HOST_DIR}
+#
+# Additionally, ensure that all existing symlinks point inside
+# ${HOST_DIR}. As an exception, absolute symlinks in a bin directory
+# of ${STAGING_DIR}, that point to one of the host's bin direcotry
+# are simply ignored, on the assumption that they are executables for
+# target, but we won't run them (except some foo-config script, but
+# those are not symlinks).
+#
+# Note that the relativity of the symlink is not the shortest, e.g.
+# ${HOST_DIR}/bin/foo can end up as a symlink to ../bin/bar when it
+# would be shorter to have a symlink to ./bar, or even simply to bar.
+# This is not the nicest, but works and is the easiest to do.
+#
+# Environment:
+#   HOST_DIR     host directory
+#   STAGING_DIR  staging directory
+#
+# Returns:
+#   0 when symlinks are OK (whether fixups were done or not);
+#   1 when at least one symlink is pointing outside of HOST_DIR and
+#     can't be fixed
+
+main() {
+    local link dest reldir
+    local -a links
+
+    links=( $(find "${HOST_DIR}" -type l -printf '%P\n') )
+    for link in "${links[@]}"; do
+        dest="$(readlink "${HOST_DIR}/${link}")"
+        case "${dest}" in
+          ("${HOST_DIR}"/*) # Absolute symlink below HOST_DIR, needs fixup
+            reldir="$(sed -r -e 's,([^/]+/),../,g; s,/[^/]+$,,' <<<"${link#${HOST_DIR}}")"
+            rm -f "${HOST_DIR}/${link}"
+            ln -sf "${reldir}${dest#${HOST_DIR}}" "${HOST_DIR}/${link}"
+            ;;
+          (/*) # Absolute symlink outside of HOST_DIR
+            if [[    "${link}" =~ ^${STAGING_DIR#${HOST_DIR}/}/(usr/)?s?bin/ \
+                  && "${dest}" =~ ^/(usr/)?s?bin/ ]]
+            then
+                # In one of the bin dirs of STAGING_DIR, pointing to a bin
+                # dir of the host, ignore (we won't need to run them)
+                continue
+            fi
+            # Any other symlink pointing outside of HOST_DIR, not supported
+            printf 'Absolute symlink outside of HOST_DIR "%s": "%s" -> "%s"\n' \
+                   "${HOST_DIR}" "${link}" "${dest}"
+            exit 1
+            ;;
+          (../*|*/../*|*/..) # Not absolute, but does it cross the boundary?
+            dest="$(readlink -m "${HOST_DIR}/${link}")"
+            case "${dest}" in
+              ("${HOST_DIR}"/*) ;; # Anchored, OK
+              (*)
+                printf 'Relative symlink outside of HOST_DIR "%s": "%s" -> "%s"\n' \
+                       "${HOST_DIR}" "${link}" "${dest}"
+                exit 1
+                ;;
+            esac
+            ;;
+          (*) # Not absolute, does not cross, OK
+            ;;
+        esac
+    done
+}
+
+main "${@}"
-- 
2.14.1
