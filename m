From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Mar 2012 00:06:26 +0100
Subject: [Buildroot] [git commit] apply-patches.sh: use series file to apply
	patches in proper order
Message-ID: <20120320233159.D9ED8953F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6c29e50c94241e5179e0075fc15dab6c073f0d6f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If a series file is present use it to determine the proper order to apply
patches instead of using ls sorting order.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Tested-by: Ludovic Desroches <ludovic.desroches@atmel.com>
add a series file with a wrong patch order into an archive containing several
patches whose correct order is the alphabetical one
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/apply-patches.sh |   32 ++++++++++++++++++++------------
 1 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 1f632aa..968e2a4 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -58,19 +58,27 @@ function scan_patchdir {
     shift 1
     patches=${@-*}
 
-    for i in `cd $path; ls -d $patches 2> /dev/null` ; do
-        if [ -d "${path}/$i" ] ; then
-            echo "${path}/$i skipped"
-        elif echo "$i" | grep -q -E "\.tar(\..*)?$|\.tbz2?$|\.tgz$" ; then
-            unpackedarchivedir="$builddir/.patches-$(basename $i)-unpacked"
-            rm -rf "$unpackedarchivedir" 2> /dev/null
-            mkdir "$unpackedarchivedir"
-            tar -C "$unpackedarchivedir" --strip-components=1 -xaf "${path}/$i"
-            scan_patchdir "$unpackedarchivedir"
-        else
+    # If there is a series file, use it instead of using ls sort order
+    # to apply patches. Skip line starting with a dash.
+    if [ -e "${path}/series" ] ; then
+        for i in `grep -Ev "^#" ${path}/series 2> /dev/null` ; do
             apply_patch "$path" "$i" || exit 1
-        fi
-    done
+        done
+    else
+        for i in `cd $path; ls -d $patches 2> /dev/null` ; do
+            if [ -d "${path}/$i" ] ; then
+                echo "${path}/$i skipped"
+            elif echo "$i" | grep -q -E "\.tar(\..*)?$|\.tbz2?$|\.tgz$" ; then
+                unpackedarchivedir="$builddir/.patches-$(basename $i)-unpacked"
+                rm -rf "$unpackedarchivedir" 2> /dev/null
+                mkdir "$unpackedarchivedir"
+                tar -C "$unpackedarchivedir" --strip-components=1 -xaf "${path}/$i"
+                scan_patchdir "$unpackedarchivedir"
+            else
+                apply_patch "$path" "$i" || exit 1
+            fi
+        done
+    fi
 }
 
 scan_patchdir $patchdir $patchpattern
