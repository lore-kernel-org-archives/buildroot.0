From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Wed, 14 Mar 2012 16:33:57 +0100
Subject: [Buildroot] [PATCH 6/6] apply-patches.sh: use series file to apply
	patches in proper order
In-Reply-To: <1331739237-29872-1-git-send-email-ludovic.desroches@atmel.com>
References: <20120314120310.13e0ea3a@skate>
 <1331739237-29872-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <1331739237-29872-7-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

If a series file is present use it to determine the proper order to apply
patches instead of using ls sorting order.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Tested-by: Ludovic Desroches <ludovic.desroches@atmel.com>
add a series file with a wrong patch order into an archive containing several
patches whose correct order is the alphabetical one
---
 support/scripts/apply-patches.sh |   32 ++++++++++++++++++++------------
 1 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 51e6c48..1229213 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -59,19 +59,27 @@ function scan_patchdir {
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
-- 
1.7.5.4
