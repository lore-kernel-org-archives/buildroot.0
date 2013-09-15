From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Sep 2013 22:08:46 +0200
Subject: [Buildroot] [git commit] apply-patches.sh: detect missing patches
Message-ID: <20130915200938.D0F9C8E271@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d245fbb41dc148a956df59658cc0dc1262612e09
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The "patch" command returns an error code only if patches fail
to apply. Therefore the pipleline "cat <patchfile> | patch ..."
does not fail, even if <patchfile> is missing. Fix this by
adding an explicit check for patch file existence.

Based on feedback from buildroot mailing list, also change the
existing check for unsupported patch format into a fatal error.

Signed-off-by: Ralph Siemsen <ralphs@netwinder.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/apply-patches.sh |   14 +++++++++-----
 1 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index e9c6869..656aa71 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -73,13 +73,17 @@ function apply_patch {
 	*.patch*)
 	type="patch"; uncomp="cat"; ;;
 	*)
-	echo "Unsupported format file for ${patch}, skip it";
-	return 0;
+	echo "Unsupported format file for ${path}/${patch}";
+	exit 1;
 	;;
     esac
     echo ""
     echo "Applying $patch using ${type}: "
-	echo $patch >> ${builddir}/.applied_patches_list
+    if [ ! -e "${path}/$patch" ] ; then
+	echo "Error: missing patch file ${path}/$patch"
+	exit 1
+    fi
+    echo $patch >> ${builddir}/.applied_patches_list
     ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t
     if [ $? != 0 ] ; then
         echo "Patch failed!  Please fix ${patch}!"
@@ -96,7 +100,7 @@ function scan_patchdir {
     # to apply patches. Skip line starting with a dash.
     if [ -e "${path}/series" ] ; then
         for i in `grep -Ev "^#" ${path}/series 2> /dev/null` ; do
-            apply_patch "$path" "$i" || exit 1
+            apply_patch "$path" "$i"
         done
     else
         for i in `cd $path; ls -d $patches 2> /dev/null` ; do
@@ -109,7 +113,7 @@ function scan_patchdir {
                 tar -C "$unpackedarchivedir" -xaf "${path}/$i"
                 scan_patchdir "$unpackedarchivedir"
             else
-                apply_patch "$path" "$i" || exit 1
+                apply_patch "$path" "$i"
             fi
         done
     fi
