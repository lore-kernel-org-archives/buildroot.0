From: Gleb Mazovetskiy <glex.spb@gmail.com>
Date: Sat, 28 Mar 2020 23:49:44 +0000
Subject: [Buildroot] [PATCH] relocate-sdk: Allow relocating to any location
Message-ID: <20200328234945.12552-1-glex.spb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Previously, the script could only relocate to the current location.

This caused issues for SDK maintainers, as the default target location
(e.g. /opt/my-sdk) would need to be created and the content copied
to it during the build process, which is error-prone.

With this change you can now pass a target location argument to
./relocate-sdk.sh (this does not move the directory).
---
 support/misc/relocate-sdk.sh | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/support/misc/relocate-sdk.sh b/support/misc/relocate-sdk.sh
index caabeaa6f6..981d272425 100755
--- a/support/misc/relocate-sdk.sh
+++ b/support/misc/relocate-sdk.sh
@@ -1,15 +1,20 @@
 #!/bin/sh
-#
-if [ "$#" -ne 0 ]; then
-    echo "Run this script to relocate the buildroot SDK at that location"
+
+if [ "$#" -gt 1 ]; then
+    echo "Usage: $0 [path]"
+    echo "Run this script to relocate the buildroot SDK to the current location"
+    echo "If [path] is given, sets the location to [path] (without moving it)"
     exit 1
 fi
 
-LOCFILE="share/buildroot/sdk-location"
-FILEPATH="$(readlink -f "$0")"
-NEWPATH="$(dirname "${FILEPATH}")"
+cd "$(dirname "$(readlink -f "$0")")"
+if [ "$#" -eq 1 ]; then
+    NEWPATH="$1"
+else
+    NEWPATH="${PWD}"
+fi
 
-cd "${NEWPATH}"
+LOCFILE="share/buildroot/sdk-location"
 if [ ! -r "${LOCFILE}" ]; then
     echo "Previous location of the buildroot SDK not found!"
     exit 1
-- 
2.20.1
