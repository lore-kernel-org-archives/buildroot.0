From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Feb 2017 21:15:29 +0100
Subject: [Buildroot] [PATCH 6/6] support/test-pkg: print number of toolchain
	and progress
In-Reply-To: <cover.1486584734.git.yann.morin.1998@free.fr>
References: <cover.1486584734.git.yann.morin.1998@free.fr>
Message-ID: <aeb2ab98194fac3ad0a73727707023552624d52e.1486584734.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/scripts/test-pkg | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
index e77c804..919200d 100755
--- a/support/scripts/test-pkg
+++ b/support/scripts/test-pkg
@@ -6,7 +6,7 @@ TOOLCHAINS_URL='http://autobuild.buildroot.org/toolchains/configs/toolchain-conf
 main() {
     local o O opts
     local cfg dir pkg random url toolchain
-    local ret nb_dl nb_cfg nb_skip nb_clean nb_build
+    local ret nb nb_dl nb_cfg nb_skip nb_clean nb_build
     local -a toolchains
 
     o='hc:d:p:r:t:'
@@ -71,13 +71,18 @@ main() {
         printf "error: no toolchain found (networking issue?)\n" >&2; exit 1
     fi
 
+    printf "Found %d toolchains\n" ${#toolchains[@]}
+
+    nb=1
     nb_dl=0
     nb_cfg=0
     nb_skip=0
     nb_clean=0
     nb_build=0
     for toolchain in "${toolchains[@]}"; do
+        printf "%40s [%3d/%3d]: " "$( basename "${toolchain}" .config)" ${nb} ${#toolchains[@]}
         build_one "${dir}" "${toolchain}" "${cfg}" "${pkg}" && ret=0 || ret=${?}
+        printf "\n"
         case ${ret} in
         (0) ;;
         (1) : $((nb_dl++));;
@@ -86,6 +91,7 @@ main() {
         (4) : $((nb_clean++));;
         (5) : $((nb_build++));;
         esac
+        : $((nb++))
     done
 
     if [ ${nb_dl} -ne 0 ]; then
@@ -121,14 +127,12 @@ build_one() {
     # Using basename(1) on a URL works nicely
     toolchain="$( basename "${url}" .config )"
 
-    printf "%40s: " "${toolchain}"
-
     dir="${dir}/${toolchain}"
     mkdir -p "${dir}"
 
     printf "download config"
     if ! curl -s "${url}" >"${dir}/.config"; then
-        printf ": FAILED\n"
+        printf ": FAILED"
         return 1
     fi
 
@@ -142,7 +146,7 @@ build_one() {
 
     printf ", olddefconfig"
     if ! make O="${dir}" olddefconfig >/dev/null 2>&1; then
-        printf ": FAILED\n"
+        printf ": FAILED"
         return 2
     fi
     # We want all the options from the snippet to be present as-is (set
@@ -157,7 +161,7 @@ build_one() {
         fi
     done <"${cfg}" >"${dir}/missing.config"
     if ${skip}; then
-        printf ", SKIPPED\n"
+        printf ", SKIPPED"
         return 3
     fi
     # Remove file, it's empty anyway.
@@ -166,7 +170,7 @@ build_one() {
     if [ -n "${pkg}" ]; then
         printf ", dirclean"
         if ! make O="${dir}" "${pkg}-dirclean" >> "${dir}/logfile" 2>&1; then
-            printf ": FAILED\n"
+            printf ": FAILED"
             return 4
         fi
     fi
@@ -174,11 +178,11 @@ build_one() {
     printf ", build"
     # shellcheck disable=SC2086
     if ! make O="${dir}" ${pkg} >> "${dir}/logfile" 2>&1; then
-        printf ": FAILED\n"
+        printf ": FAILED"
         return 5
     fi
 
-    printf ": OK\n"
+    printf ": OK"
 }
 
 help() {
-- 
2.7.4
