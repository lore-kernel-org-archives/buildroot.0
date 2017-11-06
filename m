From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Sun,  5 Nov 2017 19:46:50 -0500
Subject: [Buildroot] [PATCH] support/download: keep files downloaded without
 hash
Message-ID: <20171106004650.23669-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the situation where the hash is missing from the hash file, the
dl-wrapper downloads the file again and again until the developer
specifies the hash to complete the download step.

To avoid this situation, the freshly-downloaded file is not removed
anymore after a successful download.

The build continues to terminate in error and the file will not be
downloaded again during the next builds.

Next builds will terminate in error until the hash is specified.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 support/download/dl-wrapper | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index f944b71db5..b018819833 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -21,7 +21,7 @@ set -e
 
 main() {
     local OPT OPTARG
-    local backend output hfile recurse quiet
+    local backend output hfile recurse quiet rc
 
     # Parse our options; anything after '--' is for the backend
     while getopts :hb:o:H:rq OPT; do
@@ -93,9 +93,16 @@ main() {
 
     # Check if the downloaded file is sane, and matches the stored hashes
     # for that file
-    if ! support/download/check-hash ${quiet} "${hfile}" "${tmpf}" "${output##*/}"; then
-        rm -rf "${tmpd}"
-        exit 1
+    if support/download/check-hash ${quiet} "${hfile}" "${tmpf}" "${output##*/}"; then
+        rc=0
+    else
+        if [ ${?} -ne 3 ]; then
+            rm -rf "${tmpd}"
+            exit 1
+        fi
+
+        # the hash file exists and there was no hash to check the file against
+        rc=1
     fi
 
     # tmp_output is in the same directory as the final output, so we can
@@ -141,6 +148,8 @@ main() {
         rm -f "${tmp_output}"
         exit 1
     fi
+
+    return ${rc}
 }
 
 help() {
-- 
2.14.2
