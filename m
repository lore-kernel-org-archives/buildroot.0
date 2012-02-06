From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Mon,  6 Feb 2012 02:47:15 +0100
Subject: [Buildroot] [RFC PATCH 2/6] apply-patches.sh: rename targetdir to
	builddir
In-Reply-To: <1328492839-13657-1-git-send-email-ludovic.desroches@atmel.com>
References: <1328492839-13657-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <e72599730dcc160fc9abdbe9f97dcfa9e230ae05.1328492511.git.ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

targetdir is not the output/target directory as it can suggest.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 support/scripts/apply-patches.sh |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 1ad7d1f..2667d04 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -6,13 +6,13 @@
 # (c) 2002 Erik Andersen <andersen@codepoet.org>
 
 # Set directories from arguments, or use defaults.
-targetdir=${1-.}
+builddir=${1-.}
 patchdir=${2-../kernel-patches}
 shift 2
 patchpattern=${@-*}
 
-if [ ! -d "${targetdir}" ] ; then
-    echo "Aborting.  '${targetdir}' is not a directory."
+if [ ! -d "${builddir}" ] ; then
+    echo "Aborting.  '${builddir}' is not a directory."
     exit 1
 fi
 if [ ! -d "${patchdir}" ] ; then
@@ -21,9 +21,9 @@ if [ ! -d "${patchdir}" ] ; then
 fi
 
 # Check for rejects because if there are some, even if patches are well
-# applied, at the end it will complain about rejects into targetdir.
-if [ "`find ${targetdir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
-	echo "There are remaining reject files into ${targetdir}, please delete them."
+# applied, at the end it will complain about rejects into builddir.
+if [ "`find ${builddir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
+	echo "There are remaining reject files into ${builddir}, please delete them."
 fi
     
 for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do 
@@ -54,8 +54,8 @@ for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do
     esac fi
     echo ""
     echo "Applying ${i} using ${type}: " 
-	echo ${i} | cat >> ${targetdir}/.applied_patches_list
-    ${uncomp} ${patchdir}/${i} ${uncomp_parm} | ${apply} ${targetdir} 
+	echo ${i} | cat >> ${builddir}/.applied_patches_list
+    ${uncomp} ${patchdir}/${i} ${uncomp_parm} | ${apply} ${builddir}
     if [ $? != 0 ] ; then
         echo "Patch failed!  Please fix $i!"
 	exit 1
@@ -63,10 +63,10 @@ for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do
 done
 
 # Check for rejects...
-if [ "`find $targetdir/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
+if [ "`find $builddir/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
     echo "Aborting.  Reject files found."
     exit 1
 fi
 
 # Remove backup files
-find $targetdir/ '(' -name '*.orig' -o -name '.*.orig' ')' -exec rm -f {} \;
+find $builddir/ '(' -name '*.orig' -o -name '.*.orig' ')' -exec rm -f {} \;
-- 
1.7.5.4
