From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 6 Apr 2017 20:18:42 +0200
Subject: [Buildroot] [PATCH v5 02/13] support/test-pkg: print number of
	toolchains and progress
In-Reply-To: <cover.1491502445.git.arnout@mind.be>
References: <cover.1491502445.git.arnout@mind.be>
Message-ID: <20170406181854.5242-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes v4 -> v5 by Arnout:
  - toolchain -> toolchains in commit message
  - rebase
---
 docs/manual/adding-packages-tips.txt | 22 +++++++++++-----------
 support/scripts/test-pkg             | 24 +++++++++---------------
 2 files changed, 20 insertions(+), 26 deletions(-)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 09cf9d437f..e1f6986724 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -84,17 +84,17 @@ result (excerpt, results are fake):
 
 ----
 $ ./support/scripts/test-pkg -c libcurl.config -p libcurl
-                armv5-ctng-linux-gnueabi: OK
-              armv7-ctng-linux-gnueabihf: OK
-                        br-aarch64-glibc: SKIPPED
-                           br-arcle-hs38: SKIPPED
-                            br-arm-basic: FAILED
-                  br-arm-cortex-a9-glibc: OK
-                   br-arm-cortex-a9-musl: FAILED
-                   br-arm-cortex-m4-full: OK
-                             br-arm-full: OK
-                    br-arm-full-nothread: OK
-                      br-arm-full-static: OK
+                armv5-ctng-linux-gnueabi [ 1/11]: OK
+              armv7-ctng-linux-gnueabihf [ 2/11]: OK
+                        br-aarch64-glibc [ 3/11]: SKIPPED
+                           br-arcle-hs38 [ 4/11]: SKIPPED
+                            br-arm-basic [ 5/11]: FAILED
+                  br-arm-cortex-a9-glibc [ 6/11]: OK
+                   br-arm-cortex-a9-musl [ 7/11]: FAILED
+                   br-arm-cortex-m4-full [ 8/11]: OK
+                             br-arm-full [ 9/11]: OK
+                    br-arm-full-nothread [10/11]: OK
+                      br-arm-full-static [11/11]: OK
 11 builds, 2 skipped, 2 failed
 ----
 
diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
index 0e7779de49..f9f994402d 100755
--- a/support/scripts/test-pkg
+++ b/support/scripts/test-pkg
@@ -6,7 +6,7 @@ TOOLCHAINS_URL='http://autobuild.buildroot.org/toolchains/configs/toolchain-conf
 main() {
     local o O opts
     local cfg dir pkg random toolchain
-    local ret nb nb_skip nb_fail
+    local ret nb nb_skip nb_fail nb_tc
     local -a toolchains
 
     o='hc:d:p:r:'
@@ -60,7 +60,8 @@ main() {
                  )
                )
 
-    if [ ${#toolchains[@]} -eq 0 ]; then
+    nb_tc="${#toolchains[@]}"
+    if [ ${nb_tc} -eq 0 ]; then
         printf "error: no toolchain found (networking issue?)\n" >&2; exit 1
     fi
 
@@ -68,13 +69,15 @@ main() {
     nb_skip=0
     nb_fail=0
     for toolchain in "${toolchains[@]}"; do
+        : $((nb++))
+        printf "%40s [%*d/%d]: " "$(basename "${toolchain}" .config)" \
+                                 ${#nb_tc} ${nb} ${nb_tc}
         build_one "${dir}" "${toolchain}" "${cfg}" "${pkg}" && ret=0 || ret=${?}
         case ${ret} in
-        (0) ;;
-        (1) : $((nb_skip++));;
-        (2) : $((nb_fail++));;
+        (0) printf "OK\n";;
+        (1) : $((nb_skip++)); printf "SKIPPED\n";;
+        (2) : $((nb_fail++)); printf "FAILED\n";;
         esac
-        : $((nb++))
     done
 
     printf "%d builds, %d skipped, %d failed\n" ${nb} ${nb_skip} ${nb_fail}
@@ -90,13 +93,10 @@ build_one() {
     # Using basename(1) on a URL works nicely
     toolchain="$(basename "${url}" .config)"
 
-    printf "%40s: " "${toolchain}"
-
     dir="${dir}/${toolchain}"
     mkdir -p "${dir}"
 
     if ! curl -s "${url}" >"${dir}/.config"; then
-        printf "FAILED\n"
         return 2
     fi
 
@@ -109,7 +109,6 @@ build_one() {
     cat "${cfg}" >>"${dir}/.config"
 
     if ! make O="${dir}" olddefconfig > "${dir}/logfile" 2>&1; then
-        printf "FAILED\n"
         return 2
     fi
     # We want all the options from the snippet to be present as-is (set
@@ -120,7 +119,6 @@ build_one() {
     # done in the same locale.
     comm -23 <(sort "${cfg}") <(sort "${dir}/.config") >"${dir}/missing.config"
     if [ -s "${dir}/missing.config" ]; then
-        printf "SKIPPED\n"
         return 1
     fi
     # Remove file, it's empty anyway.
@@ -128,18 +126,14 @@ build_one() {
 
     if [ -n "${pkg}" ]; then
         if ! make O="${dir}" "${pkg}-dirclean" >> "${dir}/logfile" 2>&1; then
-            printf "FAILED\n"
             return 2
         fi
     fi
 
     # shellcheck disable=SC2086
     if ! make O="${dir}" ${pkg} >> "${dir}/logfile" 2>&1; then
-        printf "FAILED\n"
         return 2
     fi
-
-    printf "OK\n"
 }
 
 help() {
-- 
2.11.0
