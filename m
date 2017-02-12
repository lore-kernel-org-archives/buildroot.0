From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Feb 2017 16:00:01 +0100
Subject: [Buildroot] [git commit] support/test-pkg: simplify the config check
Message-ID: <20170212150011.51AA082152@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aeabb58dc50e0a6c5242274949e8c5b0c4c3c170
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use comm(1) to check that all our config options are properly set in the
resulting configuration, rather than our canned and fragile code.

Reported-by: Cam Hutchison <camh@xdna.net>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/test-pkg | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
index 11ec18c..a1d272a 100755
--- a/support/scripts/test-pkg
+++ b/support/scripts/test-pkg
@@ -73,7 +73,7 @@ build_one() {
     local url="${2}"
     local cfg="${3}"
     local pkg="${4}"
-    local toolchain line skip
+    local toolchain
 
     # Using basename(1) on a URL works nicely
     toolchain="$(basename "${url}" .config)"
@@ -106,14 +106,10 @@ build_one() {
     # or not set) in the actual .config; if one of them is not, it means
     # some dependency from the toolchain or arch is not available, in
     # which case this config is untestable and we skip it.
-    skip=false
-    while read line; do
-        if ! grep "^${line}\$" "${dir}/.config" >/dev/null 2>&1; then
-            printf "%s\n" "${line}"
-            skip=true
-        fi
-    done <"${cfg}" >"${dir}/missing.config"
-    if ${skip}; then
+    # We don't care about the locale to sort in, as long as both sort are
+    # done in the same locale.
+    comm -23 <(sort "${cfg}") <(sort "${dir}/.config") >"${dir}/missing.config"
+    if [ -s "${dir}/missing.config" ]; then
         printf ", SKIPPED\n"
         return
     fi
