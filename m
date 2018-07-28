From: Kuldeep Singh Dhaka <kuldeepdhaka9@gmail.com>
Date: Sat, 28 Jul 2018 12:01:18 +0530
Subject: [Buildroot] [PATCH] apply-patches.sh: Use series.host for host
 package (if exists) instead of series
Message-ID: <20180728063118.657-1-kuldeep@madresistor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allow apply differential patching depending upon the package being compiled for (target or host)
Backward compatible: If series.host do not exists, it simply apply series (original behaviour)

Signed-off-by: Kuldeep Singh Dhaka <kuldeep@madresistor.com>
---
 support/scripts/apply-patches.sh | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 66fef262ee..81e8cec036 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -46,6 +46,8 @@ patchdir=${2-../kernel-patches}
 shift 2
 patchpattern=${@-*}
 
+case "$(basename ${builddir})" in host-*) hostpkg=y;; esac;
+
 # use a well defined sorting order
 export LC_COLLATE=C
 
@@ -131,15 +133,22 @@ function scan_patchdir {
     shift 1
     patches=${@-*}
 
+    # If there is a series.host file and the package is host, use it instead of series.
+    if [ -e "${path}/series.host" -a "${hostpkg}" ] ; then
+        series="${path}/series.host"
+    elif [ -e "${path}/series" ]; then
+        series="${path}/series"
+    fi
+
     # If there is a series file, use it instead of using ls sort order
     # to apply patches. Skip line starting with a dash.
-    if [ -e "${path}/series" ] ; then
+    if [ -n "${series}" ] ; then
         # The format of a series file accepts a second field that is
         # used to specify the number of directory components to strip
         # when applying the patch, in the form -pN (N an integer >= 0)
         # We assume this field to always be -p1 whether it is present
         # or missing.
-        series_patches="`grep -Ev "^#" ${path}/series | cut -d ' ' -f1 2> /dev/null`"
+        series_patches="`grep -Ev "^#" ${series} | cut -d ' ' -f1 2> /dev/null`"
         for i in $series_patches; do
             apply_patch "$path" "$i" series
         done
-- 
2.18.0
