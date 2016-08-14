From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 14 Aug 2016 23:20:06 +0200
Subject: [Buildroot] [PATCH 2/2] support/apply-patches: don't bail-out on
	libtool patch while using <package>-reconfigure
In-Reply-To: <1471209606-17689-1-git-send-email-romain.naour@gmail.com>
References: <1471209606-17689-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1471209606-17689-2-git-send-email-romain.naour@gmail.com>
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

Add a new option to apply-paches script to not bail-out on libtool patch if
already present in .applied_patches_list.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-autotools.mk         |  8 ++++----
 support/scripts/apply-patches.sh | 27 ++++++++++++++++++++-------
 2 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index f64d435..e8e5b1e 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -65,14 +65,14 @@ define LIBTOOL_PATCH_HOOK
 		ltmain_patchlevel=`sed -n '/^[ \t]*VERSION=/{s/^[ \t]*VERSION=//;p;q;}' $$i | \
 		sed -e 's/\([0-9]*\.[0-9]*\.*\)\([0-9]*\).*/\2/' -e 's/\"//'`; \
 		if test $${ltmain_version} = '1.5'; then \
-			$(APPLY_PATCHES) -d $${i%/*} -D support/libtool -p buildroot-libtool-v1.5.patch; \
+			$(APPLY_PATCHES) -F -d $${i%/*} -D support/libtool -p buildroot-libtool-v1.5.patch; \
 		elif test $${ltmain_version} = "2.2"; then\
-			$(APPLY_PATCHES) -d $${i%/*} -D support/libtool -p buildroot-libtool-v2.2.patch; \
+			$(APPLY_PATCHES) -F -d $${i%/*} -D support/libtool -p buildroot-libtool-v2.2.patch; \
 		elif test $${ltmain_version} = "2.4"; then\
 			if test $${ltmain_patchlevel:-0} -gt 2; then\
-				$(APPLY_PATCHES) -d $${i%/*} -D support/libtool -p buildroot-libtool-v2.4.4.patch; \
+				$(APPLY_PATCHES) -F -d $${i%/*} -D support/libtool -p buildroot-libtool-v2.4.4.patch; \
 			else \
-				$(APPLY_PATCHES) -d $${i%/*} -D support/libtool -p buildroot-libtool-v2.4.patch; \
+				$(APPLY_PATCHES) -F -d $${i%/*} -D support/libtool -p buildroot-libtool-v2.4.patch; \
 			fi \
 		fi \
 	done
diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 90b5806..475d8b6 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -29,6 +29,7 @@ export LC_COLLATE=C
 
 # Set directories from arguments, or use defaults.
 sourcedir="."
+noFail="no"
 patchdir="../kernel-patches"
 patchpattern="*"
 
@@ -36,11 +37,12 @@ main() {
     local OPT OPTARG
 
     # Parse our options; anything after '--' is for the backend
-    while getopts :hd:D:p:s OPT; do
+    while getopts :hd:FD:p:s OPT; do
         case "${OPT}" in
         h)  help; exit 0;;
         d)  sourcedir="${OPTARG}";;
         D)  patchdir="${OPTARG}";;
+        F)  noFail="yes";;
         p)  patchpattern="${OPTARG}";;
         s)  silent="-s";; # Option to be used by the patch tool.
         :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
@@ -119,13 +121,16 @@ function apply_patch {
     fi
     existing="$(grep -E "/${patch}\$" ${sourcedir}/.applied_patches_list || true)"
     if [ -n "${existing}" ]; then
-        echo "Error: duplicate filename '${patch}'"
-        echo "Conflicting files are:"
-        echo "  already applied: ${existing}"
-        echo "  to be applied  : ${path}/${patch}"
-        exit 1
+        if [ "${noFail}" = "no" ]; then
+            echo "Error: duplicate filename '${patch}'"
+            echo "Conflicting files are:"
+            echo "  already applied: ${existing}"
+            echo "  to be applied  : ${path}/${patch}"
+            exit 1
+        fi
+    else
+        echo "${path}/${patch}" >> ${sourcedir}/.applied_patches_list
     fi
-    echo "${path}/${patch}" >> ${sourcedir}/.applied_patches_list
     ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${sourcedir}" -t -N $silent
     if [ $? != 0 ] ; then
         echo "Patch failed!  Please fix ${patch}!"
@@ -187,6 +192,14 @@ DESCRIPTION
     -D The patch directory, optional, default '../kernel-patches'.
         The place where are the scripts you want to apply.
 
+    -F Don't fail on already applied patch check, optional, default
+        "no". This option is intended to be used for libtool patches
+        which can be applied after autoreconf is done during
+        PRE_CONFIGURE_HOOKS. When a package use AUTORECONF, the
+        libtool patch can be applied many times as the
+        <package>-reconfigure target is called. This is not a problem
+        since autoreconf will overwrite the previously patched files.
+
     -p Patch name patterns, optional, default value is '*'.
         Pattern(s) describing the patch names you want to apply.
         (*.patch, *.dpatch, *.conditional...)
-- 
2.5.5
