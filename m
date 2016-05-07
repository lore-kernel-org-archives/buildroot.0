From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  7 May 2016 18:14:26 +0200
Subject: [Buildroot] [PATCH 01/13 v7] support/scripts: add helper to
	hardlink-or-copy
In-Reply-To: <cover.1462637351.git.yann.morin.1998@free.fr>
References: <cover.1462637351.git.yann.morin.1998@free.fr>
Message-ID: <7c92d1e222419fef1422295dd3027ec4e205fca5.1462637351.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When preparing the legal-info, the source archives are copied in the
legal-info/ output directory. When the archives are big, it can take
quite a bit of time and unnecessarily uses disk space. When the
legal-info output directory is on the same filesystem as the BR2_DL_DIR,
we can easily reduce copy time and disk usage by just using hardlins
instead of copying. However, the BR2_DL_DIR may be on a different
filesystem, so we must fallback to copying in this case

Introduce a helper script that copies a source file into a destination
directory, by first attempting to hard-link, and falling back to a
plain copy in case the hardlink fails.

In case the destination already exists, it is forcibly removed first, to
avoid clobering any existing target file (and especially any hardlink to
it), since cp -f does not remove the destination file, but clobbers it.

In some situations, it will be necessary that the destination file is
named differently than the source, so if a third argument is specified,
it is treated as the basename of the destination file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>

---
Changes v6 -> v7:
  - more explicit variables  (Arnout)
  - drop the variable with the helper path  (Arnout)
  - use shell substitution instead of $(basename ...)  (Arnout! ;- )
  - improve commit log to explain the 'rm -f'
  - split now-too-long line

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
 support/scripts/hardlink-or-copy | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100755 support/scripts/hardlink-or-copy

diff --git a/support/scripts/hardlink-or-copy b/support/scripts/hardlink-or-copy
new file mode 100755
index 0000000..b046bdf
--- /dev/null
+++ b/support/scripts/hardlink-or-copy
@@ -0,0 +1,35 @@
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
+    local src_file="${1}"
+    local dst_dir="${2}"
+    local dst_file="${3}"
+
+    if [ -n "${dst_file}" ]; then
+        dst_file="${dst_dir}/${dst_file}"
+    else
+        dst_file="${dst_dir}/${src_file##*/}"
+    fi
+
+    mkdir -p "${dst_dir}"
+    rm -f "${dst_file}"
+    ln -f "${src_file}" "${dst_file}" 2>/dev/null \
+    || cp -f "${src_file}" "${dst_file}"
+}
+
+main "${@}"
-- 
2.7.4
