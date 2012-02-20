From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Mon, 20 Feb 2012 17:01:53 +0100
Subject: [Buildroot] [PATCH 5/5] apply-patches.sh: change archive management
In-Reply-To: <1329753713-1722-1-git-send-email-ludovic.desroches@atmel.com>
References: <1329753713-1722-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <e4ad26e344163a872664918179973df876d4aaf0.1329752743.git.ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

The way archives were managed was incorrect because the uncompressed archives
were sent directly to the patch command. It means that alphabetical patch
order was not respected.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Tested-by: Ludovic Desroches <ludovic.desroches@atmel.com>
with an armadeus_apf9328_defconfig build
---
 support/scripts/apply-patches.sh |   50 +++++++++++++++++++++++++-------------
 1 files changed, 33 insertions(+), 17 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 25cf8ce..51e6c48 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -26,13 +26,11 @@ if [ "`find ${builddir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; th
 	rm -f "${buildir}/*.rej" 2> /dev/null
 	echo "Remaining reject files in ${buildir} have been removed"
 fi
-    
-for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do 
-    apply="patch -g0 -p1 -E -d"
-    uncomp_parm=""
-    if [ -d "${patchdir}/$i" ] ; then
-	echo "${patchdir}/$i skipped"
-    else case "$i" in
+
+function apply_patch {
+    path=$1
+    patch=$2
+    case "$patch" in
 	*.gz)
 	type="gzip"; uncomp="gunzip -dc"; ;; 
 	*.bz)
@@ -43,22 +41,40 @@ for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do
 	type="zip"; uncomp="unzip -d"; ;; 
 	*.Z)
 	type="compress"; uncomp="uncompress -c"; ;; 
-	*.tgz)
-	type="tar gzip"; uncomp="gunzip -dc"; apply="tar xvf - -C"; ;; 
-	*.tar)
-	type="tar"; uncomp="cat"; apply="tar xvf - -C"; ;; 
 	*)
 	type="plaintext"; uncomp="cat"; ;; 
-    esac fi
+    esac
     echo ""
-    echo "Applying ${i} using ${type}: " 
-	echo ${i} >> ${builddir}/.applied_patches_list
-    ${uncomp} "${patchdir}/${i}" ${uncomp_parm} | ${apply} "${builddir}"
+    echo "Applying $patch using ${type}: "
+	echo $patch >> ${builddir}/.applied_patches_list
+    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}"
     if [ $? != 0 ] ; then
-        echo "Patch failed!  Please fix $i!"
+        echo "Patch failed!  Please fix ${patch}!"
 	exit 1
     fi
-done
+}
+
+function scan_patchdir {
+    path=$1
+    shift 1
+    patches=${@-*}
+
+    for i in `cd $path; ls -d $patches 2> /dev/null` ; do
+        if [ -d "${path}/$i" ] ; then
+            echo "${path}/$i skipped"
+        elif echo "$i" | grep -q -E "\.tar(\..*)?$|\.tbz2?$|\.tgz$" ; then
+            unpackedarchivedir="$builddir/.patches-$(basename $i)-unpacked"
+            rm -rf "$unpackedarchivedir" 2> /dev/null
+            mkdir "$unpackedarchivedir"
+            tar -C "$unpackedarchivedir" --strip-components=1 -xaf "${path}/$i"
+            scan_patchdir "$unpackedarchivedir"
+        else
+            apply_patch "$path" "$i" || exit 1
+        fi
+    done
+}
+
+scan_patchdir $patchdir $patchpattern
 
 # Check for rejects...
 if [ "`find $builddir/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
-- 
1.7.5.4
