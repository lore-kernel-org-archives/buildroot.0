From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  6 Oct 2020 20:56:03 +0200
Subject: [Buildroot] [PATCH] support/scripts/apply-patches.sh: do not
 blindly remove *.orig files
Message-ID: <20201006185604.11311-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

apply-patches currently blindly removes *.orig / .*.orig files as GNU patch
by default writes these as backup files when patches only apply with fuzz.

This is unfortunate as package sources may contain files ending in .orig as
well, breaking the build.  Luckily GNU patch can be told to not write these
backup files using the --no-backup-if-mismatch option, so used that instead
of the .orig removal step.

--no-backup-if-mismatch is supported since GNU patch 2.3.8 (1997-06-17) and
busybox patch if built with CONFIG_DESKTOP, but E.G.  isn't supported by the
BSD patch, so add logic to detect support for the flag and only use it if
supported.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
Do we care about BSD patch / busybox patch w/ DESKTOP?  Should we just
unconditionally use the flag?

We have a similar issue with *.rej.  GNU patch can be told to not write
those with the -r - option (since GNU patch 2.6, Nov 2009), but it should
normally also exit with a non-zero exit code for such sitations, so I am not
sure the check is needed?

 support/scripts/apply-patches.sh | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 66fef262ee..be61a94529 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -40,6 +40,12 @@ if [ "$1" = "-s" ] ; then
     shift
 fi
 
+# does patch support --no-backup-if-mismatch (GNU, busybox w/DESKTOP)
+if patch --no-backup-if-mismatch </dev/null 2>/dev/null; then
+    # don't write backup files
+    PATCH_ARGS="--no-backup-if-mismatch"
+fi
+
 # Set directories from arguments, or use defaults.
 builddir=${1-.}
 patchdir=${2-../kernel-patches}
@@ -119,7 +125,7 @@ function apply_patch {
         exit 1
     fi
     echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
-    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t -N $silent
+    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E $PATCH_ARGS -d "${builddir}" -t -N $silent
     if [ $? != 0 ] ; then
         echo "Patch failed!  Please fix ${patch}!"
         exit 1
@@ -168,6 +174,3 @@ if [ "`find $builddir/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
     echo "Aborting.  Reject files found."
     exit 1
 fi
-
-# Remove backup files
-find $builddir/ '(' -name '*.orig' -o -name '.*.orig' ')' -exec rm -f {} \;
-- 
2.20.1
