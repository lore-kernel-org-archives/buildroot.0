From: Ralph Siemsen <ralphs@netwinder.org>
Date: Wed, 11 Sep 2013 08:06:30 -0400
Subject: [Buildroot] [PATCH] apply-patches.sh: detect missing patches
In-Reply-To: <CAAXf6LWWnb5xQUtZA8p3kgoU2et-kD6x9TzyzXykgNbxdsuv+Q@mail.gmail.com>
References: <20130813160017.GA2590@harvey.netwinder.org>
 <CAAXf6LXBHm7nG__780PqUaO+v9+4j2KON7UO0dw4Ej2qC3=XGg@mail.gmail.com>
 <CAAXf6LV9HPWdzqV_F5zQ+aABtVxZGRRkhDszF2Qx8vyXMb+PhA@mail.gmail.com>
 <20130905100459.13173009@skate> <5228425A.7090502@lucaceresoli.net>
 <20130905140135.GC3136@free.fr>
 <CAAXf6LWWnb5xQUtZA8p3kgoU2et-kD6x9TzyzXykgNbxdsuv+Q@mail.gmail.com>
Message-ID: <20130911120630.GA14745@harvey.netwinder.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Sorry for delayed response.

On Thu, Sep 05, 2013 at 09:20:36PM +0200, Thomas De Schampheleire wrote:
> 
> Would you mind sending a second patch that changes the 'unknown patch
> format' case so that an error is thrown?

I've added it. Note that it is possible to fool this check, by using
for example a name like mydiff.patch.zzz. This matches "*.patch*" and
therefore is allowed, even though we don't know how to deal with ".zzz".

> Additionally, in your current patch, I would suggest changing the 'if
> test ...' into 'if [ ... ], for the sake of lining up with the style
> in the rest of the script.

Also done. Revised patch follows.

Cheers,
-Ralph

The return status of the "cat <patchfile> | patch ..." pipeline
is zero (success) even if the patchfile does not exist. This is
because patch receives no input, which is not an error condition.
Therefore, explicitly check that patch file exists.

Based on feedback on buildroot mailing list, also changed the
check for unsupported file format. The build will now error out,
rather than continuing on silently.
---
 support/scripts/apply-patches.sh |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

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
     ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t
     if [ $? != 0 ] ; then
         echo "Patch failed!  Please fix ${patch}!"
-- 
1.7.7.6
