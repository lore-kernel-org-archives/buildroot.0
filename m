From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Jan 2019 21:30:04 +0100
Subject: [Buildroot] [PATCH] support/scripts/apply-patches: use "git apply"
 as a fallback when applying patches
Message-ID: <20190110203004.9812-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We currently use plain old "patch" to apply patches. While this works
fine in most situations, it doesn't work well for patches generated
with git format-patch that:

 - Contain changes to binary files

 - Or contain changes to files in directories that were symlinks to
   other directories, with the symlink being removed as part of the
   same patch.

We encountered such issues with a large stack of patches to be applied
on top of arm-trusted-firmware. Such patches apply perfectly fine with
"git apply".

Switching everybody to unconditionally use "git apply" seems a bit
risky, so instead we take a different route: if applying the patch
with "patch" fails, then we try with "git apply".

A few implementation notes:

 - The script has "set -e" so for the "patch --dry-run" command, we
   have to take special precautions to not bail out of the script on
   error.

 - Also due to "set -e", the check on the return value of "patch" is
   no longer needed, and we also don't need to check the return value
   of "git apply".

 - We need to pass "--git-dir=/dev/null", otherwise "git apply"
   travels up the directory hierarchy until it finds a .git folder. If
   it finds one, but the files being patched are not under version
   control, it skips patching those files. Obviously, the files in
   output/build/foo/ are not under version control, so this behavior
   is not desirable. Simply making "git apply" believe it is not
   running from inside a Git repository disables this check.

Cc: Kostya Porotchkin <kostap@marvell.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/apply-patches.sh | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 66fef262ee..0fd336968e 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -119,11 +119,18 @@ function apply_patch {
         exit 1
     fi
     echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
-    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t -N $silent
-    if [ $? != 0 ] ; then
-        echo "Patch failed!  Please fix ${patch}!"
-        exit 1
+
+    # We don't want this to abort the script on failure (script is run
+    # with set -e)
+    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" --dry-run -t -N -s && retval=0 || retval=$?
+    if [ $retval -eq 0 ] ; then
+	    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t -N $silent
+	    # Due to set -e, if we reach here, applying the patch was successful
+	    return
     fi
+
+    [ -z "${silent}" ] && gitopts=-v
+    (cd ${builddir}; ${uncomp} "${path}/$patch" | git --git-dir=/dev/null apply -p1 ${gitopts})
 }
 
 function scan_patchdir {
-- 
2.20.1
