From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Mar 2012 00:04:47 +0100
Subject: [Buildroot] [git commit] apply-patches.sh: change archive management
Message-ID: <20120320233159.CCAAE953F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4f9e82da2a7d30f7e9e39238a3a2f0bd021a7be4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The way archives were managed was incorrect because the uncompressed archives
were sent directly to the patch command. It means that alphabetical patch
order was not respected.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Tested-by: Ludovic Desroches <ludovic.desroches@atmel.com>
with an armadeus_apf9328_defconfig build
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/apply-patches.sh |   48 +++++++++++++++++++++++++------------
 1 files changed, 32 insertions(+), 16 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 3d655f1..1f632aa 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -26,12 +26,10 @@ fi
 find ${builddir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print0 | \
     xargs -0 -r rm -f
 
-for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do 
-    apply="patch -g0 -p1 -E -d"
-    uncomp_parm=""
-    if [ -d "${patchdir}/$i" ] ; then
-	echo "${patchdir}/$i skipped"
-    else case "$i" in
+function apply_patch {
+    path=$1
+    patch=$2
+    case "$patch" in
 	*.gz)
 	type="gzip"; uncomp="gunzip -dc"; ;; 
 	*.bz)
@@ -42,22 +40,40 @@ for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do
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
