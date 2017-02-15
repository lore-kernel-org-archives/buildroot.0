From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 Feb 2017 22:44:31 +0100
Subject: [Buildroot] [PATCH 3/7 v4] support/test-pkg: print number of
	toolchain and progress
In-Reply-To: <cover.1487195062.git.yann.morin.1998@free.fr>
References: <cover.1487195062.git.yann.morin.1998@free.fr>
Message-ID: <c8920fb50c2c7fe3601cf0857f6795d51cc5b8d0.1487195062.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 docs/manual/adding-packages-tips.txt | 22 +++++++++++-----------
 support/scripts/test-pkg             | 24 +++++++++---------------
 2 files changed, 20 insertions(+), 26 deletions(-)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 732904f..61cf0bf 100644
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
index 9626c1a..965ddaf 100755
--- a/support/scripts/test-pkg
+++ b/support/scripts/test-pkg
@@ -6,7 +6,7 @@ TOOLCHAINS_URL='http://autobuild.buildroot.org/toolchains/configs/toolchain-conf
 main() {
     local o O opts
     local cfg dir pkg random url toolchain
-    local ret nb nb_skip nb_fail
+    local ret nb nb_skip nb_fail nb_tc
     local -a toolchains
 
     o='hc:d:p:r:t:'
@@ -70,7 +70,8 @@ main() {
                  )
                )
 
-    if [ ${#toolchains[@]} -eq 0 ]; then
+    nb_tc="${#toolchains[@]}"
+    if [ ${nb_tc} -eq 0 ]; then
         printf "error: no toolchain found (networking issue?)\n" >&2; exit 1
     fi
 
@@ -78,13 +79,15 @@ main() {
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
@@ -106,13 +109,10 @@ build_one() {
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
 
@@ -125,7 +125,6 @@ build_one() {
     cat "${cfg}" >>"${dir}/.config"
 
     if ! make O="${dir}" olddefconfig >/dev/null 2>&1; then
-        printf "FAILED\n"
         return 2
     fi
     # We want all the options from the snippet to be present as-is (set
@@ -136,7 +135,6 @@ build_one() {
     # done in the same locale.
     comm -23 <(sort "${cfg}") <(sort "${dir}/.config") >"${dir}/missing.config"
     if [ -s "${dir}/missing.config" ]; then
-        printf "SKIPPED\n"
         return 1
     fi
     # Remove file, it's empty anyway.
@@ -144,18 +142,14 @@ build_one() {
 
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
2.7.4
