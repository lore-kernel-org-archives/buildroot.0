From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 9 Jan 2016 02:57:40 +0100
Subject: [Buildroot] [PATCH] support/scripts/apply-patches.sh: fix whitespace
Message-ID: <1452304660-12393-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The apply-patches.sh script was using a mix of tabs and spaces, and
some three-space indentation. Normalize everything to four-space
indentation.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
This patch is a side-effect of an attempt I made to replace the bash
patches that we carry with downloaded patches. That required a change
to apply-patches.sh to allow patch files that don't end with .patch,
hence this preparatory patch. But that turned out to be insufficient,
because the upstream patches don't apply with -p1, they need -p0.
Adding support for that was too much for me, so I gave up on downloading
the bash patches. But at least this commit can still come out of it :-)
---
 support/scripts/apply-patches.sh | 50 ++++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index aa13e88..201278d 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -69,41 +69,41 @@ function apply_patch {
         type="series"; uncomp="cat"
     else
         case "$patch" in
-	    *.gz)
-	    type="gzip"; uncomp="gunzip -dc"; ;;
-	    *.bz)
-	    type="bzip"; uncomp="bunzip -dc"; ;;
-	    *.bz2)
-	    type="bzip2"; uncomp="bunzip2 -dc"; ;;
-	    *.xz)
-	    type="xz"; uncomp="unxz -dc"; ;;
-	    *.zip)
-	    type="zip"; uncomp="unzip -d"; ;;
-	    *.Z)
-	    type="compress"; uncomp="uncompress -c"; ;;
-	    *.diff*)
-	    type="diff"; uncomp="cat"; ;;
-	    *.patch*)
-	    type="patch"; uncomp="cat"; ;;
-	    *)
-	    echo "Unsupported file type for ${path}/${patch}, skipping";
-	    return 0
-	    ;;
+            *.gz)
+            type="gzip"; uncomp="gunzip -dc"; ;;
+            *.bz)
+            type="bzip"; uncomp="bunzip -dc"; ;;
+            *.bz2)
+            type="bzip2"; uncomp="bunzip2 -dc"; ;;
+            *.xz)
+            type="xz"; uncomp="unxz -dc"; ;;
+            *.zip)
+            type="zip"; uncomp="unzip -d"; ;;
+            *.Z)
+            type="compress"; uncomp="uncompress -c"; ;;
+            *.diff*)
+            type="diff"; uncomp="cat"; ;;
+            *.patch*)
+            type="patch"; uncomp="cat"; ;;
+            *)
+            echo "Unsupported file type for ${path}/${patch}, skipping";
+            return 0
+            ;;
         esac
     fi
     if [ -z "$silent" ] ; then
-	echo ""
-	echo "Applying $patch using ${type}: "
+        echo ""
+        echo "Applying $patch using ${type}: "
     fi
     if [ ! -e "${path}/$patch" ] ; then
-	echo "Error: missing patch file ${path}/$patch"
-	exit 1
+        echo "Error: missing patch file ${path}/$patch"
+        exit 1
     fi
     echo $patch >> ${builddir}/.applied_patches_list
     ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t -N $silent
     if [ $? != 0 ] ; then
         echo "Patch failed!  Please fix ${patch}!"
-	exit 1
+        exit 1
     fi
 }
 
-- 
2.7.0.rc3
