From: Ralph Siemsen <ralphs@netwinder.org>
Date: Fri, 13 Sep 2013 14:15:27 -0400
Subject: [Buildroot] [PATCH v2] apply-patches.sh: detect missing patches
In-Reply-To: <CAAXf6LX7o9P1tXv3Egk8By-VbzarRYe5JRyTh5+3wYNBz9Z6aQ@mail.gmail.com>
References: <20130813160017.GA2590@harvey.netwinder.org>
 <CAAXf6LXBHm7nG__780PqUaO+v9+4j2KON7UO0dw4Ej2qC3=XGg@mail.gmail.com>
 <CAAXf6LV9HPWdzqV_F5zQ+aABtVxZGRRkhDszF2Qx8vyXMb+PhA@mail.gmail.com>
 <20130905100459.13173009@skate> <5228425A.7090502@lucaceresoli.net>
 <20130905140135.GC3136@free.fr>
 <CAAXf6LWWnb5xQUtZA8p3kgoU2et-kD6x9TzyzXykgNbxdsuv+Q@mail.gmail.com>
 <20130911120630.GA14745@harvey.netwinder.org>
 <CAAXf6LX7o9P1tXv3Egk8By-VbzarRYe5JRyTh5+3wYNBz9Z6aQ@mail.gmail.com>
Message-ID: <20130913181527.GA11933@harvey.netwinder.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The return status of the "cat <patchfile> | patch ..." pipeline
is zero (success) even if the patchfile does not exist. This is
because patch receives no input, which is not an error condition.
Therefore, explicitly check that patch file exists.

Based on feedback on buildroot mailing list, also changed the
check for unsupported file format. The build will now error out,
rather than continuing on silently.
---

Hi Thomas,
Hopefully the formatting is now correct.
-Ralph

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 7d5856c..d6e8983 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -70,13 +70,17 @@ function apply_patch {
 	*.patch*)
 	type="patch"; uncomp="cat"; ;;
 	*)
-	echo "Unsupported format file for ${patch}, skip it";
-	return 0;
+	echo "Unsupported format file for ${path}/${patch}";
+	return 1;
 	;;
     esac
     echo ""
     echo "Applying $patch using ${type}: "
-	echo $patch >> ${builddir}/.applied_patches_list
+    if [ ! -e "${path}/$patch" ] ; then
+	echo "Error: missing patch file ${path}/$patch"
+	return 1
+    fi
+    echo $patch >> ${builddir}/.applied_patches_list
     ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}"
     if [ $? != 0 ] ; then
         echo "Patch failed!  Please fix ${patch}!"
-- 
1.7.7.6
