From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 20 May 2020 21:30:45 +0200
Subject: [Buildroot] [PATCH 1/1] support/scripts/apply-patches.sh: manage
 uncompression
Message-ID: <20200520193045.92597-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Extract from bug report:

"Code line 120 to line 128 is to check whether the patch containing
"rename from" and "rename to". But it directly use grep to find,
ignoring the patch may be a tar file or else. It can only work on patch
of textfile form."

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=11931

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 support/scripts/apply-patches.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 66fef262ee..80e2264497 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -113,8 +113,8 @@ function apply_patch {
         echo "  to be applied  : ${path}/${patch}"
         exit 1
     fi
-    if grep -q "^rename from" ${path}/${patch} && \
-       grep -q "^rename to" ${path}/${patch} ; then
+    if ${uncomp} "${path}/$patch" | grep -q "^rename from" && \
+       ${uncomp} "${path}/$patch" | grep -q "^rename to" ; then
         echo "Error: patch contains some renames, not supported by old patch versions"
         exit 1
     fi
-- 
2.26.2
