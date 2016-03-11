From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 18:49:15 +0100
Subject: [Buildroot] [PATCH 02/16 v5] core/pkg-utils: add macro to
	hardlink-or-copy
In-Reply-To: <cover.1457718289.git.yann.morin.1998@free.fr>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
Message-ID: <909a98f9ebb10986a85570d767ab030597a73ef5.1457718289.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This macro will try to copy a source file into a destination directory,
by first attempting to hard-link, and falling back to a plain copy.

In some situations, it will be necessary that the destination file is
named differently than the source (e.g. due to a re-numbering), so if a
third argument is specified, it is treated as the basename of the
destination file.

In future commits, this macro will be passed shell-level variables, e.g.
in a for-loop, so we can't evaluate those at make-level. Thus, we
delegate the full macro to a shell script. We still keep the make macro,
as it is easier to write, and allows to $(strip) its arguments in a
convenient fashion.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
[Ran 'make legal-info' with output dir on {the same,another} fs]
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

---
Changes v4 -> v5:
  - move the body of the macro to a shell script  (Luca)

Changes v3 -> v4:
  - forcibly remove destination file first  (Arnout, Luca)
  - typoes  (Luca)
  - drop trailing slash in destination directory name

Changes v2 -> v3;
  - use "ln" instead of "cp -l"
  - accept third argument, as the basename of the destination file
  - drop reviewed-by and tested-by tags given in v2, due to the above
    two changes

Changes RFC -> v1:
  - move to pkg-utils  (Luca)
---
 package/pkg-utils.mk          | 22 ++++++++++++++++++++++
 support/scripts/hardlink-copy | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100755 support/scripts/hardlink-copy

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index f88313a..a5155e8 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -113,6 +113,28 @@ $$(error Package error: use $(2) instead of $(1). Please fix your .mk file)
 endif
 endef
 
+################################################################################
+# hardlink-copy -- hardlink source and destination if possible, otherwise
+# do a simple copy
+#
+# argument 1 is the source *file*
+# argument 2 is the destination *directory*
+# argument 3 is the basename of the destination file (optional, defaults to
+#            the basename of the source file.
+#
+# examples:
+#   $(call hardlink-copy,/path/to/source/file,/path/to/destination/dir)
+#   $(call hardlink-copy,/path/to/source/file,/path/to/destination/dir,new-name)
+#
+# Notes:
+#  - this is NOT an atomic operation,
+#  - this is only a wrapper to a shell script, so that it can be used with
+#    shell-level variables, like in a for loop.
+################################################################################
+define hardlink-copy
+	support/scripts/hardlink-copy "$(strip $(1))" "$(strip $(2))" "$(strip $(3))"
+endef
+
 #
 # legal-info helper functions
 #
diff --git a/support/scripts/hardlink-copy b/support/scripts/hardlink-copy
new file mode 100755
index 0000000..9c1f883
--- /dev/null
+++ b/support/scripts/hardlink-copy
@@ -0,0 +1,34 @@
+#!/bin/bash
+
+# Try to hardlink a file into a directory, fallback to copy on failure.
+#
+# Hardlink-or-copy the source file in the first argument into the
+# destination directory in the second argument, using the basename in
+# the third argument as basename for the destination file. If the third
+# argument is missing, use the basename of the basename of the source
+# file as basename for the destination file.
+#
+# In either case, remove the destination prior to doing the
+# hardlink-or-copy.
+#
+# Note that this is NOT an atomic operation.
+
+set -e
+
+main() {
+    local src_f="${1}"
+    local dst_d="${2}"
+    local dst_f="${3}"
+
+    if [ -n "${dst_f}" ]; then
+        dst_f="${dst_d}/${dst_f}"
+    else
+        dst_f="${dst_d}/$( basename "${src_f}" )"
+    fi
+
+    mkdir -p "${dst_d}"
+    rm -f "${dst_f}"
+    ln -f "${src_f}" "${dst_f}" 2>/dev/null || cp -f "${src_f}" "${dst_f}"
+}
+
+main "${@}"
-- 
1.9.1
