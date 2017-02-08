From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Feb 2017 21:15:25 +0100
Subject: [Buildroot] [PATCH 2/6] support/test-pkg: store lines missing from
	resulting configuraiton
In-Reply-To: <cover.1486584734.git.yann.morin.1998@free.fr>
References: <cover.1486584734.git.yann.morin.1998@free.fr>
Message-ID: <bad3fa5a5e3580885fb587dc22cd933b92e82f69.1486584734.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a build is skipped, store the lines from the config snippet, that
are missing in the resulting configuration, in a file in the build
directory, for the user to inspect.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

---
Changes v2 -> v3:
  - simplify the code a bit  (Luca)
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
-- 
2.7.4
