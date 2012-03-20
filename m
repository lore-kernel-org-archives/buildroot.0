From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Mar 2012 23:49:20 +0100
Subject: [Buildroot] [git commit] apply-patches.sh: rename targetdir to
	builddir
Message-ID: <20120320233159.A358D953F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a7773ea4127b292172cbc7dd9507167dd0d3d3f4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

targetdir is not the output/target directory as it can suggest.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Tested-by: Ludovic Desroches <ludovic.desroches@atmel.com>
with an armadeus_apf9328_defconfig build
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/apply-patches.sh |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index e418cb6..908ce22 100755
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
@@ -22,8 +22,8 @@ fi
 
 # Remove any rejects present BEFORE patching - Because if there are
 # any, even if patches are well applied, at the end it will complain
-# about rejects in targetdir.
-find ${targetdir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print0 | \
+# about rejects in builddir.
+find ${builddir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print0 | \
     xargs -0 -r rm -f
 
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
