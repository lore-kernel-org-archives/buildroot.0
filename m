From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Mon,  6 Feb 2012 02:47:18 +0100
Subject: [Buildroot] [RFC PATCH 5/6] apply-patches.sh: add recursivity when
	scanning patchdir
In-Reply-To: <1328492839-13657-1-git-send-email-ludovic.desroches@atmel.com>
References: <1328492839-13657-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <d2e8663c748c61c4ea9e881eb4ecf74e64096a7b.1328492511.git.ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 support/scripts/apply-patches.sh |   24 +++++++++++++++---------
 1 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 1fc93f6..3a73ab9 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -42,6 +42,20 @@ function apply_patch {
     fi
 }
 
+function scan_patchdir {
+    path=$1
+    shift 1
+    patches=${@-*}
+
+    for i in `cd $path; ls -d $patches 2> /dev/null` ; do
+        if [ -d "${path}/$i" ] ; then
+	    scan_patchdir "${path}/$i"
+        else
+            apply_patch "$path" "$i" || exit 1
+        fi
+    done
+}
+
 if [ ! -d "${builddir}" ] ; then
     echo "Aborting.  '${builddir}' is not a directory."
     exit 1
@@ -57,15 +71,7 @@ if [ "`find ${builddir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; th
 	echo "There are remaining reject files into ${builddir}, please delete them."
 fi
 
-for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do
-    if [ -d "${patchdir}/$i" ] ; then
-        for p in `ls -d "$i"` ; do
-	    apply_patch "${patchdir}/${i}" "$p" || exit 1
-	done
-    else
-        apply_patch "$patchdir" "$i" || exit 1
-    fi
-done
+scan_patchdir $patchdir $patchpattern
 
 # Check for rejects...
 if [ "`find $builddir/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
-- 
1.7.5.4
