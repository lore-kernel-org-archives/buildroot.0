From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 18:49:22 +0100
Subject: [Buildroot] [PATCH 09/16 v5] core/apply-patches: store full path of
	applied patches
In-Reply-To: <cover.1457718289.git.yann.morin.1998@free.fr>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
Message-ID: <4752967e7f254170efc08e77530029c90f663d85.1457718289.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we only store the filename of the applied patches.

However, we are soon to want to install those patches in the legal-info
directory, so we'll have to know where those patches come from.

Instead of duplicating the logic to find the patches (bundled,
downloaded, from a global patch dir...), just store the full path to
each of those patches so we can retrieve them more easily later on.

Also always create the list-file, even if empty, so that we need not
test for its existence before reading it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
[Tested only with patches in the Buildroot sources]
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

---
Changes v1 -> v2:
  - do not duplicate '/' in paths  (Luca)
---
 support/scripts/apply-patches.sh | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 201278d..20a1552 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -63,8 +63,12 @@ find ${builddir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print0 | \
     xargs -0 -r rm -f
 
 function apply_patch {
-    path=$1
-    patch=$2
+    path="${1%%/}"
+    patch="${2}"
+    case "${path}" in
+        /*) ;;
+        *)  path="$(pwd)/${path}";;
+    esac
     if [ "$3" ]; then
         type="series"; uncomp="cat"
     else
@@ -99,7 +103,7 @@ function apply_patch {
         echo "Error: missing patch file ${path}/$patch"
         exit 1
     fi
-    echo $patch >> ${builddir}/.applied_patches_list
+    echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
     ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t -N $silent
     if [ $? != 0 ] ; then
         echo "Patch failed!  Please fix ${patch}!"
@@ -141,6 +145,7 @@ function scan_patchdir {
     fi
 }
 
+touch ${builddir}/.applied_patches_list
 scan_patchdir "$patchdir" "$patchpattern"
 
 # Check for rejects...
-- 
1.9.1
