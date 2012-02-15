From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Thu, 16 Feb 2012 00:06:14 +0100
Subject: [Buildroot] [RFC PATCH v2 4/6] apply-patches.sh: directories are
	considered as a collection of patches
In-Reply-To: <20120215165104.GI4723@ldesroches-Latitude-E6320>
References: <20120215165104.GI4723@ldesroches-Latitude-E6320>
Message-ID: <1329347174-25471-1-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

Behaviour of directories is changed: it is no more considered as an overlay,
but rather a collection of patches. Subdirectories are not supported.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 support/scripts/apply-patches.sh |   33 +++++++++++++++++++--------------
 1 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 8c38007..3b43e0b 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -27,15 +27,10 @@ if [ "`find ${builddir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; th
 	echo "Remaining reject files in ${buildir} have been removed"
 fi
     
-for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do 
-    apply="patch -g0 -p1 -E -d"
-    uncomp_parm=""
-    if [ -d "${patchdir}/$i" ] ; then
-	type="directory overlay"
-	uncomp="tar cf - --exclude=.svn --no-anchored -C"
-	uncomp_parm="."
-	apply="tar xvf - -C"
-    else case "$i" in
+function apply_patch {
+    path=$1
+    patch=$2
+    case "$patch" in
 	*.gz)
 	type="gzip"; uncomp="gunzip -dc"; ;; 
 	*.bz)
@@ -52,15 +47,25 @@ for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do
 	type="tar"; uncomp="cat"; apply="tar xvf - -C"; ;; 
 	*)
 	type="plaintext"; uncomp="cat"; ;; 
-    esac fi
+    esac
     echo ""
-    echo "Applying ${i} using ${type}: " 
-	echo ${i} >> ${builddir}/.applied_patches_list
-    ${uncomp} "${patchdir}/${i}" ${uncomp_parm} | ${apply} "${builddir}"
+    echo "Applying $patch using ${type}: "
+	echo ${path}/$patch >> ${builddir}/.applied_patches_list
+    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}"
     if [ $? != 0 ] ; then
-        echo "Patch failed!  Please fix $i!"
+        echo "Patch failed!  Please fix $patch!"
 	exit 1
     fi
+}
+
+for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do
+    if [ -d "${patchdir}/$i" ] ; then
+        for p in `ls -d "$i"` ; do
+	    apply_patch "${patchdir}/${i}" "$p" || exit 1
+	done
+    else
+        apply_patch "$patchdir" "$i" || exit 1
+    fi
 done
 
 # Check for rejects...
-- 
1.7.5.4
