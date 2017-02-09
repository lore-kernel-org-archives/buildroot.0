From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 22:57:13 +0100
Subject: [Buildroot] [git commit] support/test-pkg: store lines missing from
	resulting configuraiton
Message-ID: <20170209215802.3553482196@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5c58ceec2aad7415bfb8d4cee1d98779535b615
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When a build is skipped, store the lines from the config snippet, that
are missing in the resulting configuration, in a file in the build
directory, for the user to inspect.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/test-pkg | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
index 008b32c..5eeaf63 100755
--- a/support/scripts/test-pkg
+++ b/support/scripts/test-pkg
@@ -61,7 +61,7 @@ build_one() {
     local url="${2}"
     local cfg="${3}"
     local pkg="${4}"
-    local toolchain line
+    local toolchain line skip
 
     # Using basename(1) on a URL works nicely
     toolchain="$( basename "${url}" .config )"
@@ -94,12 +94,19 @@ build_one() {
     # or not set) in the actual .config; if one of them is not, it means
     # some dependency from the toolchain or arch is not available, in
     # which case this config is untestable and we skip it.
+    skip=false
     while read line; do
         if ! grep "^${line}\$" "${dir}/.config" >/dev/null 2>&1; then
-            printf ", SKIPPED\n"
-            return
+            printf "%s\n" "${line}"
+            skip=true
         fi
-    done <"${cfg}"
+    done <"${cfg}" >"${dir}/missing.config"
+    if ${skip}; then
+        printf ", SKIPPED\n"
+        return
+    fi
+    # Remove file, it's empty anyway.
+    rm -f "${dir}/missing.config"
 
     if [ -n "${pkg}" ]; then
         printf ", dirclean"
