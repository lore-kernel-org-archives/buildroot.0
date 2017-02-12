From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Feb 2017 15:53:08 +0100
Subject: [Buildroot] [PATCH 4/7 v4] support/test-pkg: be less verbose
In-Reply-To: <cover.1486911180.git.yann.morin.1998@free.fr>
References: <cover.1486911180.git.yann.morin.1998@free.fr>
Message-ID: <95e64c37c1aad5a121306030a71e58afaa3ad064.1486911180.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Requested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/scripts/test-pkg | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
index a1d272a..d9ae5c5 100755
--- a/support/scripts/test-pkg
+++ b/support/scripts/test-pkg
@@ -83,9 +83,8 @@ build_one() {
     dir="${dir}/${toolchain}"
     mkdir -p "${dir}"
 
-    printf "download config"
     if ! curl -s "${url}" >"${dir}/.config"; then
-        printf ": FAILED\n"
+        printf "FAILED\n"
         return
     fi
 
@@ -97,9 +96,8 @@ build_one() {
 	_EOF_
     cat "${cfg}" >>"${dir}/.config"
 
-    printf ", olddefconfig"
     if ! make O="${dir}" olddefconfig >/dev/null 2>&1; then
-        printf ": FAILED\n"
+        printf "FAILED\n"
         return
     fi
     # We want all the options from the snippet to be present as-is (set
@@ -110,28 +108,26 @@ build_one() {
     # done in the same locale.
     comm -23 <(sort "${cfg}") <(sort "${dir}/.config") >"${dir}/missing.config"
     if [ -s "${dir}/missing.config" ]; then
-        printf ", SKIPPED\n"
+        printf "SKIPPED\n"
         return
     fi
     # Remove file, it's empty anyway.
     rm -f "${dir}/missing.config"
 
     if [ -n "${pkg}" ]; then
-        printf ", dirclean"
         if ! make O="${dir}" "${pkg}-dirclean" >> "${dir}/logfile" 2>&1; then
-            printf ": FAILED\n"
+            printf "FAILED\n"
             return
         fi
     fi
 
-    printf ", build"
     # shellcheck disable=SC2086
     if ! make O="${dir}" ${pkg} >> "${dir}/logfile" 2>&1; then
-        printf ": FAILED\n"
+        printf "FAILED\n"
         return
     fi
 
-    printf ": OK\n"
+    printf "OK\n"
 }
 
 help() {
-- 
2.7.4
