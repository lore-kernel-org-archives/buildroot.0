From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 31 Jul 2014 19:08:36 +0200
Subject: [Buildroot] [PATCH v3 2/3] apply-patches.sh: Use [[...]] construct
	instead of [...] construct
In-Reply-To: <1406826517-6106-1-git-send-email-fabio.porcedda@gmail.com>
References: <1406826517-6106-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1406826517-6106-3-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The [[...]] construct it's an improved and safer construct than the
[...] construct. It's safer because it doesn't do "word splitting" so
we don't need to enclose variable expansion with double quotes, e.g:

   [ -e "$file" ] -> [[ -e $file ]]
---
 support/scripts/apply-patches.sh | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 37f2d81..a157398 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -37,11 +37,11 @@ patchpattern=${@-*}
 # use a well defined sorting order
 export LC_COLLATE=C
 
-if [ ! -d "${builddir}" ] ; then
+if [[ ! -d ${builddir} ]] ; then
     echo "Aborting.  '${builddir}' is not a directory."
     exit 1
 fi
-if [ ! -d "${patchdir}" ] ; then
+if [[ ! -d ${patchdir} ]] ; then
     echo "Aborting.  '${patchdir}' is not a directory."
     exit 1
 fi
@@ -79,13 +79,13 @@ function apply_patch {
     esac
     echo ""
     echo "Applying $patch using ${type}: "
-    if [ ! -e "${path}/$patch" ] ; then
+    if [[ ! -e ${path}/$patch ]] ; then
 	echo "Error: missing patch file ${path}/$patch"
 	exit 1
     fi
     echo $patch >> ${builddir}/.applied_patches_list
     ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t -N
-    if [ $? != 0 ] ; then
+    if [[ $? != 0 ]] ; then
         echo "Patch failed!  Please fix ${patch}!"
 	exit 1
     fi
@@ -98,13 +98,13 @@ function scan_patchdir {
 
     # If there is a series file, use it instead of using ls sort order
     # to apply patches. Skip line starting with a dash.
-    if [ -e "${path}/series" ] ; then
+    if [[ -e ${path}/series ]] ; then
         for i in `grep -Ev "^#" ${path}/series 2> /dev/null` ; do
             apply_patch "$path" "$i"
         done
     else
         for i in `cd $path; ls -d $patches 2> /dev/null` ; do
-            if [ -d "${path}/$i" ] ; then
+            if [[ -d ${path}/$i ]] ; then
                 scan_patchdir "${path}/$i"
             elif echo "$i" | grep -q -E "\.tar(\..*)?$|\.tbz2?$|\.tgz$" ; then
                 unpackedarchivedir="$builddir/.patches-$(basename $i)-unpacked"
@@ -122,7 +122,7 @@ function scan_patchdir {
 scan_patchdir "$patchdir" "$patchpattern"
 
 # Check for rejects...
-if [ "`find $builddir/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
+if [[ `find $builddir/ '(' -name '*.rej' -o -name '.*.rej' ')' -print` ]] ; then
     echo "Aborting.  Reject files found."
     exit 1
 fi
-- 
2.0.3
