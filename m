From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Feb 2017 15:53:11 +0100
Subject: [Buildroot] [PATCH 7/7 v4] support/test-pkg: print number of
	toolchain and progress
In-Reply-To: <cover.1486911180.git.yann.morin.1998@free.fr>
References: <cover.1486911180.git.yann.morin.1998@free.fr>
Message-ID: <05e8a8e4a66b175edcd8f6250c583051f77eeae9.1486911180.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 support/scripts/test-pkg | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
index 9626c1a..8d47415 100755
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
@@ -70,21 +70,25 @@ main() {
                  )
                )
 
-    if [ ${#toolchains[@]} -eq 0 ]; then
+    nb_tc="${#toolchains[@]}"
+    if [ ${nb_tc} -eq 0 ]; then
         printf "error: no toolchain found (networking issue?)\n" >&2; exit 1
     fi
+    printf "Found %d toolchains\n" ${nb_tc}
 
     nb=0
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
@@ -106,13 +110,10 @@ build_one() {
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
 
@@ -125,7 +126,6 @@ build_one() {
     cat "${cfg}" >>"${dir}/.config"
 
     if ! make O="${dir}" olddefconfig >/dev/null 2>&1; then
-        printf "FAILED\n"
         return 2
     fi
     # We want all the options from the snippet to be present as-is (set
@@ -136,7 +136,6 @@ build_one() {
     # done in the same locale.
     comm -23 <(sort "${cfg}") <(sort "${dir}/.config") >"${dir}/missing.config"
     if [ -s "${dir}/missing.config" ]; then
-        printf "SKIPPED\n"
         return 1
     fi
     # Remove file, it's empty anyway.
@@ -144,18 +143,14 @@ build_one() {
 
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
