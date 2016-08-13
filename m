From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 14 Aug 2016 01:06:55 +0200
Subject: [Buildroot] [PATCH] support/apply-patches: don't bail-out on
	libtool patch while using <package>-reconfigure
Message-ID: <1471129615-12376-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since 19241598147e7555dce40b6dd44b28ef22b67ed9 <package>-reconfigure target is
broken.

$ make elementary-reconfigure
Applying buildroot-libtool-v2.4.4.patch using patch:
Error: duplicate filename 'buildroot-libtool-v2.4.4.patch'
Conflicting files are:
  already applied: buildroot/support/libtool/buildroot-libtool-v2.4.4.patch
  to be applied  : buildroot/support/libtool/buildroot-libtool-v2.4.4.patch

When a package use AUTORECONF, the libtool patch can be applied many
times as the <package>-reconfigure target is called. This is not a
problem since autoreconf will overwrite the previously patched files.

Don't bail-out on libtool patch if already present in .applied_patches_list.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/apply-patches.sh | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 7ccb39d..11b218f 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -107,13 +107,19 @@ function apply_patch {
     fi
     existing="$(grep -E "/${patch}\$" ${builddir}/.applied_patches_list || true)"
     if [ -n "${existing}" ]; then
-        echo "Error: duplicate filename '${patch}'"
-        echo "Conflicting files are:"
-        echo "  already applied: ${existing}"
-        echo "  to be applied  : ${path}/${patch}"
-        exit 1
+        # When a package use AUTORECONF, the libtool patch can be applied many
+        # times as the <package>-reconfigure target is called. This is not a
+        # problem since autoreconf will overwrite the previously patched files.
+        if [[ ${patch} != buildroot-libtool-v*.patch ]]; then
+            echo "Error: duplicate filename '${patch}'"
+            echo "Conflicting files are:"
+            echo "  already applied: ${existing}"
+            echo "  to be applied  : ${path}/${patch}"
+            exit 1
+        fi
+    else
+        echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
     fi
-    echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
     ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t -N $silent
     if [ $? != 0 ] ; then
         echo "Patch failed!  Please fix ${patch}!"
-- 
2.5.5
