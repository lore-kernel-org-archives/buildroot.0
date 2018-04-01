From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 1 Apr 2018 15:02:53 +0200
Subject: [Buildroot] [git commit] support/download: keep files downloaded
 without hash
Message-ID: <20180401141924.AE825813FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf9bf7d28b8a6c55e639b17c90f35ea11cae88ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the situation where the hash is missing from the hash file, the
dl-wrapper downloads the file again and again until the developer
specifies the hash to complete the download step.

To avoid this situation, the freshly-downloaded file is not removed
anymore after a successful download.

After this change, the behaviour is as follows:

- Hash file doesn't exist, or file is in BR_NO_CHECK_HASH_FOR
  => always succeeds.

- Hash file exists, but file is not present
  => file is NOT removed, build is terminated immediately (i.e.
     secondary site is not tried).

- Hash file exists, file is present, but hash mismatch
  => file is removed, secondary site is tried.
  => If all primary/secondary site downloads or hash checks fail, the
     build is terminated.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
[Arnout: extend commit log]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
