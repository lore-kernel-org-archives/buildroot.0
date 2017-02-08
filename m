From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Feb 2017 21:15:26 +0100
Subject: [Buildroot] [PATCH 3/6] support/test-pkg: report number and types
	of failures
In-Reply-To: <cover.1486584734.git.yann.morin.1998@free.fr>
References: <cover.1486584734.git.yann.morin.1998@free.fr>
Message-ID: <dcd8080c616142b0f7f761e3749c92306b2f6863.1486584734.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 support/scripts/test-pkg | 42 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
index 5eeaf63..f40b51d 100755
--- a/support/scripts/test-pkg
+++ b/support/scripts/test-pkg
@@ -6,6 +6,7 @@ TOOLCHAINS_URL='http://autobuild.buildroot.org/toolchains/configs/toolchain-conf
 main() {
     local o O opts
     local cfg dir pkg toolchain
+    local ret nb_dl nb_cfg nb_skip nb_clean nb_build
     local -a toolchains
 
     o='hc:d:p:'
@@ -51,9 +52,38 @@ main() {
         printf "error: no toolchain found (networking issue?)\n" >&2; exit 1
     fi
 
+    nb_dl=0
+    nb_cfg=0
+    nb_skip=0
+    nb_clean=0
+    nb_build=0
     for toolchain in "${toolchains[@]}"; do
-        build_one "${dir}" "${toolchain}" "${cfg}" "${pkg}"
+        build_one "${dir}" "${toolchain}" "${cfg}" "${pkg}" && ret=0 || ret=${?}
+        case ${ret} in
+        (0) ;;
+        (1) : $((nb_dl++));;
+        (2) : $((nb_cfg++));;
+        (3) : $((nb_skip++));;
+        (4) : $((nb_clean++));;
+        (5) : $((nb_build++));;
+        esac
     done
+
+    if [ ${nb_dl} -ne 0 ]; then
+        printf "%d configurations could not be downloaded\n" ${nb_dl}
+    fi
+    if [ ${nb_cfg} -ne 0 ]; then
+        printf "%d configurations could not be applied\n" ${nb_cfg}
+    fi
+    if [ ${nb_skip} -ne 0 ]; then
+        printf "%d configurations were skipped\n" ${nb_skip}
+    fi
+    if [ ${nb_clean} -ne 0 ]; then
+        printf "%d configurations could not be dircleaned\n" ${nb_clean}
+    fi
+    if [ ${nb_build} -ne 0 ]; then
+        printf "%d configurations would not build\n" ${nb_build}
+    fi
 }
 
 build_one() {
@@ -74,7 +104,7 @@ build_one() {
     printf "download config"
     if ! curl -s "${url}" >"${dir}/.config"; then
         printf ": FAILED\n"
-        return
+        return 1
     fi
 
     cat >>"${dir}/.config" <<-_EOF_
@@ -88,7 +118,7 @@ build_one() {
     printf ", olddefconfig"
     if ! make O="${dir}" olddefconfig >/dev/null 2>&1; then
         printf ": FAILED\n"
-        return
+        return 2
     fi
     # We want all the options from the snippet to be present as-is (set
     # or not set) in the actual .config; if one of them is not, it means
@@ -103,7 +133,7 @@ build_one() {
     done <"${cfg}" >"${dir}/missing.config"
     if ${skip}; then
         printf ", SKIPPED\n"
-        return
+        return 3
     fi
     # Remove file, it's empty anyway.
     rm -f "${dir}/missing.config"
@@ -112,7 +142,7 @@ build_one() {
         printf ", dirclean"
         if ! make O="${dir}" "${pkg}-dirclean" >> "${dir}/logfile" 2>&1; then
             printf ": FAILED\n"
-            return
+            return 4
         fi
     fi
 
@@ -120,7 +150,7 @@ build_one() {
     # shellcheck disable=SC2086
     if ! make O="${dir}" ${pkg} >> "${dir}/logfile" 2>&1; then
         printf ": FAILED\n"
-        return
+        return 5
     fi
 
     printf ": OK\n"
-- 
2.7.4
