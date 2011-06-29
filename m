From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Wed, 29 Jun 2011 11:12:42 +0200
Subject: [Buildroot] [RFC PATCH v2 1/1] kernel-patch.sh: script changed to
	support archives in a proper way
In-Reply-To: <1309338762-17200-1-git-send-email-ludovic.desroches@atmel.com>
References: <1968dad8075f5f4a269aa905e5e07d1138acd7a0.1305713224.git.ludovic.desroches@atmel.com>
 <1309338762-17200-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <8ff3fd34b12e4bb70ad95bcb8a026b1f31980d8a.1309333591.git.ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

The previous script doesn't support patching order with archives since
it didn't extract archives but simply decompressed file and piped the
result to the patch command.
This new script extracts archives in a temporary folder and then applies
patches.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 toolchain/patch-kernel.sh |  154 +++++++++++++++++++++++++++++----------------
 1 files changed, 100 insertions(+), 54 deletions(-)

diff --git a/toolchain/patch-kernel.sh b/toolchain/patch-kernel.sh
index 76cb9f7..408a9a7 100755
--- a/toolchain/patch-kernel.sh
+++ b/toolchain/patch-kernel.sh
@@ -1,66 +1,112 @@
-#! /bin/bash
-# A little script I whipped up to make it easy to
-# patch source trees and have sane error handling
-# -Erik
-#
-# (c) 2002 Erik Andersen <andersen@codepoet.org>
+#!/bin/bash
 
-# Set directories from arguments, or use defaults.
-targetdir=${1-.}
-patchdir=${2-../kernel-patches}
-shift 2
-patchpattern=${@-*}
+# function apply_patch patch_file
+# this function no more deal with directory case since it is managed
+# in an upper layer
+function apply_patch {
+apply="patch -p1 -E -d"
 
-if [ ! -d "${targetdir}" ] ; then
-    echo "Aborting.  '${targetdir}' is not a directory."
-    exit 1
+case "${1}" in
+*\.tar\.gz|*\.tgz|*\.tar\.bz|*\.tar\.bz2|*\.tbz|*\.tbz2)
+	echo "Error with ${1}";
+	echo "Archives into a directory or another archive is not supported";
+	return 1;
+	;;
+*\.gz)
+	type="gzip"; uncomp="gunzip -dc"; ;;
+*\.bz)
+	type="bzip"; uncomp="bunzip -dc"; ;;
+*\.bz2)
+	type="bzip2"; uncomp="bunzip2 -dc"; ;;
+*\.zip)
+	type="zip"; uncomp="unzip -d"; ;;
+*\.Z)
+	type="compress"; uncomp="uncompress -c"; ;;
+*\.diff*)
+	type="diff"; uncomp="cat"; ;;
+# '*' at the end is needed for patch.arm for example
+*\.patch*)
+	type="patch"; uncomp="cat"; ;;
+*)
+	echo "Unsupported format file for ${1}, skip it";
+	return 0;
+	;;
+esac
+
+echo ""
+echo "Applying ${1} using ${type}: "
+echo ${1} | cat >> ${builddir}/.applied_patches_list
+${uncomp} ${1} | ${apply} ${builddir}
+if [ $? != 0 ] ; then
+	echo "Patch failed! Please fix ${1}!"
+	return 1
 fi
+}
+
+# entry point
+builddir=${1}
+patchdir=${2}
+shift 2
+patchlist=${@}
+patchesdir="${builddir}/../$(basename $builddir)-patches"
+
+# check directories
 if [ ! -d "${patchdir}" ] ; then
-    echo "Aborting.  '${patchdir}' is not a directory."
-    exit 1
+	echo "Aborting: ${patchdir} is not a directory."
+	exit 1
 fi
-    
-for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do 
-    apply="patch -p1 -E -d"
-    uncomp_parm=""
-    if [ -d "${patchdir}/$i" ] ; then
-	type="directory overlay"
-	uncomp="tar cf - --exclude=.svn --no-anchored -C"
-	uncomp_parm="."
-	apply="tar xvf - -C"
-    else case "$i" in
-	*.gz)
-	type="gzip"; uncomp="gunzip -dc"; ;; 
-	*.bz)
-	type="bzip"; uncomp="bunzip -dc"; ;; 
-	*.bz2)
-	type="bzip2"; uncomp="bunzip2 -dc"; ;; 
-	*.zip)
-	type="zip"; uncomp="unzip -d"; ;; 
-	*.Z)
-	type="compress"; uncomp="uncompress -c"; ;; 
-	*.tgz)
-	type="tar gzip"; uncomp="gunzip -dc"; apply="tar xvf - -C"; ;; 
-	*.tar)
-	type="tar"; uncomp="cat"; apply="tar xvf - -C"; ;; 
-	*)
-	type="plaintext"; uncomp="cat"; ;; 
-    esac fi
-    echo ""
-    echo "Applying ${i} using ${type}: " 
-	echo ${i} | cat >> ${targetdir}/.applied_patches_list
-    ${uncomp} ${patchdir}/${i} ${uncomp_parm} | ${apply} ${targetdir} 
-    if [ $? != 0 ] ; then
-        echo "Patch failed!  Please fix $i!"
+if [ ! -d "${builddir}" ] ; then
+	echo "Aborting: ${builddir} is not a directory."
 	exit 1
-    fi
+fi
+
+# go to the patch directory because $patchlist is interpreted when doing
+# for i in $patchlist
+pushd ${patchdir}
+index=0
+for i in $patchlist ; do
+	patchlist_interpreted[${index}]="$i"
+	index=`expr ${index} + 1`
+	echo patchlist_interpreted[${index}]=$i
 done
+popd
 
-# Check for rejects...
-if [ "`find $targetdir/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
+for index in "${!patchlist_interpreted[@]}" ; do
+	file="${patchlist_interpreted[${index}]}"
+	patch_path="${patchdir}/${file}"
+	# three cases: directory, archive, file patch (compressed or not)
+	# directory
+	if [ -d "${patch_path}" ] ; then
+		for p in $(ls ${patch_path}) ; do
+			apply_patch "${patch_path}/${p}" || exit 1
+		done
+	# archive
+	elif echo $file | grep -q -E "tar\.bz$|tar\.bz2$|tbz$|tbz2$|tar\.gz$|tgz$" ; then
+		mkdir "${patchesdir}"
+		# extract archive
+		if echo $file | grep -q -E "tar\.bz$|tar\.bz2$|tbz$|tbz2$" ; then
+			tar_options="-xjf"
+		else
+			tar_options="-xzf"
+		fi
+		tar -C ${patchesdir} --strip-components=1 ${tar_options} ${patch_path}
+		# apply patches from the archive
+		for p in $(find ${patchesdir} | sort) ; do
+			apply_patch "${p}" || { rm -rf "${patchesdir}" ; exit 1; }
+		done
+		rm -rf "${patchesdir}"
+	# file which is not an archive
+	else
+		apply_patch "${patch_path}" || exit 1
+	fi
+done
+
+# check for rejects...
+if [ "`find ${builddir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
     echo "Aborting.  Reject files found."
     exit 1
 fi
 
-# Remove backup files
-find $targetdir/ '(' -name '*.orig' -o -name '.*.orig' ')' -exec rm -f {} \;
+# remove backup files
+find ${builddir}/ '(' -name '*.orig' -o -name '.*.orig' ')' -exec rm -f {} \;
+
-- 
1.7.0.4
