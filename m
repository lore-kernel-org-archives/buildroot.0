From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Nov 2015 23:47:14 +0100
Subject: [Buildroot] [PATCH 19/21 RFC] core/apply-patches: store full path
	of applied patches
In-Reply-To: <cover.1447713615.git.yann.morin.1998@free.fr>
References: <cover.1447713615.git.yann.morin.1998@free.fr>
Message-ID: <1e0258b453e6112b476eb2cb602e38ea7ac1865d.1447713615.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we only store the filename of the applied patches.

However, we are soon to want to install those ptches in the legal-info
directory, so we'll have to know where those patches come from.

Instead of duplicating the logic to find the patches, just store the
full path to each of those patches so we can retrieve them more easily
later on.

Also always create the list-file, even if empty, so that we need not
test for its existence before reading it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/scripts/apply-patches.sh | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index af6df9e..3d538ba 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -64,6 +64,10 @@ find ${builddir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print0 | \
 function apply_patch {
     path=$1
     patch=$2
+    case "${path}" in
+        /*) ;;
+        *)  path="$(pwd)/${path}";;
+    esac
     case "$patch" in
 	*.gz)
 	type="gzip"; uncomp="gunzip -dc"; ;; 
@@ -94,7 +98,7 @@ function apply_patch {
 	echo "Error: missing patch file ${path}/$patch"
 	exit 1
     fi
-    echo $patch >> ${builddir}/.applied_patches_list
+    echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
     ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t -N $silent
     if [ $? != 0 ] ; then
         echo "Patch failed!  Please fix ${patch}!"
@@ -130,6 +134,7 @@ function scan_patchdir {
     fi
 }
 
+touch ${builddir}/.applied_patches_list
 scan_patchdir "$patchdir" "$patchpattern"
 
 # Check for rejects...
-- 
1.9.1
