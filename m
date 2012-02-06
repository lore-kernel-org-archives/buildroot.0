From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Mon,  6 Feb 2012 02:47:17 +0100
Subject: [Buildroot] [RFC PATCH 4/6] apply-patches.sh: directories are
	considered as a collection of patches
In-Reply-To: <1328492839-13657-1-git-send-email-ludovic.desroches@atmel.com>
References: <1328492839-13657-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <4497cd4c9ca71e3bba7da6b9906319f6c40862be.1328492511.git.ludovic.desroches@atmel.com>
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
 support/scripts/apply-patches.sh |   63 ++++++++++++++++++++-----------------
 1 files changed, 34 insertions(+), 29 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 2eab05d..1fc93f6 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -11,30 +11,10 @@ patchdir=${2-../kernel-patches}
 shift 2
 patchpattern=${@-*}
 
-if [ ! -d "${builddir}" ] ; then
-    echo "Aborting.  '${builddir}' is not a directory."
-    exit 1
-fi
-if [ ! -d "${patchdir}" ] ; then
-    echo "Aborting.  '${patchdir}' is not a directory."
-    exit 1
-fi
-
-# Check for rejects because if there are some, even if patches are well
-# applied, at the end it will complain about rejects into builddir.
-if [ "`find ${builddir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
-	echo "There are remaining reject files into ${builddir}, please delete them."
-fi
-    
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
@@ -51,15 +31,40 @@ for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do
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
+	echo ${1} >> ${builddir}/.applied_patches_list
+    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}"
     if [ $? != 0 ] ; then
-        echo "Patch failed!  Please fix $i!"
+        echo "Patch failed!  Please fix $patch!"
 	exit 1
     fi
+}
+
+if [ ! -d "${builddir}" ] ; then
+    echo "Aborting.  '${builddir}' is not a directory."
+    exit 1
+fi
+if [ ! -d "${patchdir}" ] ; then
+    echo "Aborting.  '${patchdir}' is not a directory."
+    exit 1
+fi
+
+# Check for rejects because if there are some, even if patches are well
+# applied, at the end it will complain about rejects into builddir.
+if [ "`find ${builddir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
+	echo "There are remaining reject files into ${builddir}, please delete them."
+fi
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
