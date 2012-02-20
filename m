From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Mon, 20 Feb 2012 17:01:50 +0100
Subject: [Buildroot] [PATCH 2/5] apply-patches.sh: rename targetdir to
	builddir
In-Reply-To: <1329753713-1722-1-git-send-email-ludovic.desroches@atmel.com>
References: <1329753713-1722-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <e1551f4842b2be6874a96d620dbca93f08d29fb3.1329752743.git.ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

targetdir is not the output/target directory as it can suggest.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Tested-by: Ludovic Desroches <ludovic.desroches@atmel.com>
with an armadeus_apf9328_defconfig build
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/apply-patches.sh |   22 +++++++++++-----------
 1 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index b145b46..7cd8abe 100755
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
@@ -21,10 +21,10 @@ if [ ! -d "${patchdir}" ] ; then
 fi
 
 # Check for rejects because if there are some, even if patches are well
-# applied, at the end it will complain about rejects into targetdir.
-if [ "`find ${targetdir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
-	rm -f "${targetdir}/*.rej" 2> /dev/null
-	echo "Remaining reject files in ${targetdir} have been removed"
+# applied, at the end it will complain about rejects into builddir.
+if [ "`find ${builddir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
+	rm -f "${buildir}/*.rej" 2> /dev/null
+	echo "Remaining reject files in ${buildir} have been removed"
 fi
     
 for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do 
@@ -55,8 +55,8 @@ for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do
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
@@ -64,10 +64,10 @@ for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do
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
