From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 29 Apr 2016 00:27:19 +0200
Subject: [Buildroot] [PATCH 01/13 v6] support/scripts: add helper to
	hardlink-or-copy
In-Reply-To: <cover.1461881416.git.yann.morin.1998@free.fr>
References: <cover.1461881416.git.yann.morin.1998@free.fr>
Message-ID: <0b6395f0d572eec63e4f14fd02d094b5b60f3de9.1461881416.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This helper will try to copy a source file into a destination directory,
by first attempting to hard-link, and falling back to a plain copy.

In some situations, it will be necessary that the destination file is
named differently than the source, so if a third argument is specified,
it is treated as the basename of the destination file.

Add a make variable to easily call that script.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>

---
Changes v5 -> v6:
  - rename script  (Thomas, Arnout)
  - drop the macro  (Thomas, Arnout)
  - drop Luca's reviewed-by and tested-by tags, because the macro
    disapeared
  - fix redundancy in comments in the script

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
 package/pkg-utils.mk             |  4 ++++
 support/scripts/hardlink-or-copy | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100755 support/scripts/hardlink-or-copy

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index f88313a..2692576 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -113,6 +113,10 @@ $$(error Package error: use $(2) instead of $(1). Please fix your .mk file)
 endif
 endef
 
+# hardlink-or-copy -- helper script to first try to hardlink,
+# and fallback to copy.
+HARDLINK_OR_COPY := support/scripts/hardlink-or-copy
+
 #
 # legal-info helper functions
 #
diff --git a/support/scripts/hardlink-or-copy b/support/scripts/hardlink-or-copy
new file mode 100755
index 0000000..b581c51
--- /dev/null
+++ b/support/scripts/hardlink-or-copy
@@ -0,0 +1,34 @@
+#!/bin/bash
+
+# Try to hardlink a file into a directory, fallback to copy on failure.
+#
+# Hardlink-or-copy the source file in the first argument into the
+# destination directory in the second argument, using the basename in
+# the third argument as basename for the destination file. If the third
+# argument is missing, use the basename of the source file as basename
+# for the destination file.
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
