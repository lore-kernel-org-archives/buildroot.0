From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Oct 2020 23:28:27 +0100
Subject: [Buildroot] [git commit branch/2020.08.x]
 support/scripts/apply-patches.sh: manage uncompression
Message-ID: <20201028221713.5B840835C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42830fc435e0e6187d130b44a07f466fdd648904
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Extract from bug report:

"Code line 120 to line 128 is to check whether the patch containing
"rename from" and "rename to". But it directly use grep to find,
ignoring the patch may be a tar file or else. It can only work on patch
of textfile form."

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=11931

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 35c3a1e6937dc08157075027bf6219157510b2f9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/apply-patches.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 2d39d63da1..9fb488c570 100755
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
