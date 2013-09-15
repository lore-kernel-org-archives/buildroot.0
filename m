From: Ralph Siemsen <ralphs@netwinder.org>
Date: Sun, 15 Sep 2013 10:13:14 -0400
Subject: [Buildroot] [PATCH v3] apply-patches.sh: detect missing patches
In-Reply-To: <20130915133709.GA16826@harvey.netwinder.org>
References: <CAAXf6LV9HPWdzqV_F5zQ+aABtVxZGRRkhDszF2Qx8vyXMb+PhA@mail.gmail.com>
 <20130905100459.13173009@skate> <5228425A.7090502@lucaceresoli.net>
 <20130905140135.GC3136@free.fr>
 <CAAXf6LWWnb5xQUtZA8p3kgoU2et-kD6x9TzyzXykgNbxdsuv+Q@mail.gmail.com>
 <20130911120630.GA14745@harvey.netwinder.org>
 <CAAXf6LX7o9P1tXv3Egk8By-VbzarRYe5JRyTh5+3wYNBz9Z6aQ@mail.gmail.com>
 <20130913181527.GA11933@harvey.netwinder.org>
 <20130913182702.GB3301@free.fr>
 <20130915133709.GA16826@harvey.netwinder.org>
Message-ID: <20130915141314.GA18166@harvey.netwinder.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The "patch" command returns an error code only if patches fail
to apply. Therefore the pipleline "cat <patchfile> | patch ..."
does not fail, even if <patchfile> is missing. Fix this by
adding an explicit check for patch file existence.

Based on feedback from buildroot mailing list, also change the
existing check for unsupported patch format into a fatal error.
---

v1. original
v2. error on unsupported patch formats
v3. explicit exit calls

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index e9c6869..656aa71 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -73,13 +73,17 @@ function apply_patch {
 	*.patch*)
 	type="patch"; uncomp="cat"; ;;
 	*)
-	echo "Unsupported format file for ${patch}, skip it";
-	return 0;
+	echo "Unsupported format file for ${path}/${patch}";
+	exit 1;
 	;;
     esac
     echo ""
     echo "Applying $patch using ${type}: "
-	echo $patch >> ${builddir}/.applied_patches_list
+    if [ ! -e "${path}/$patch" ] ; then
+	echo "Error: missing patch file ${path}/$patch"
+	exit 1
+    fi
+    echo $patch >> ${builddir}/.applied_patches_list
     ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t
     if [ $? != 0 ] ; then
         echo "Patch failed!  Please fix ${patch}!"
@@ -96,7 +100,7 @@ function scan_patchdir {
     # to apply patches. Skip line starting with a dash.
     if [ -e "${path}/series" ] ; then
         for i in `grep -Ev "^#" ${path}/series 2> /dev/null` ; do
-            apply_patch "$path" "$i" || exit 1
+            apply_patch "$path" "$i"
         done
     else
         for i in `cd $path; ls -d $patches 2> /dev/null` ; do
@@ -109,7 +113,7 @@ function scan_patchdir {
                 tar -C "$unpackedarchivedir" -xaf "${path}/$i"
                 scan_patchdir "$unpackedarchivedir"
             else
-                apply_patch "$path" "$i" || exit 1
+                apply_patch "$path" "$i"
             fi
         done
     fi
-- 
1.8.3.1
