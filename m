From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Feb 2021 22:21:01 +0100
Subject: [Buildroot] [PATCH] utils/test-pkg: add check that show-info is
 proper json
Message-ID: <20210207212101.1527766-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

JSON parser are usually rather strict when parsing their input. Both
jq and the python json module choke on non-conformant inputs.

Commit e4c284e6b9 (package/pkg-utils: escape \ in generated legal-info)
fixed the \-escaping case, but we want to ensure that we do not have
other data that would be improperly encoded.

To more easily catch issues, also run show-info and send its output
through jq, to try and validate the output.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/test-pkg | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index a317d8c17a..5e00b589b8 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -13,7 +13,7 @@ do_clean() {
 main() {
     local o O opts
     local cfg dir pkg random toolchains_csv toolchain all number mode
-    local ret nb nb_skip nb_fail nb_legal nb_tc build_dir keep
+    local ret nb nb_skip nb_fail nb_legal nb_show nb_tc build_dir keep
     local -a toolchains
     local pkg_br_name
 
@@ -122,6 +122,7 @@ main() {
     nb_skip=0
     nb_fail=0
     nb_legal=0
+    nb_show=0
     for toolchainconfig in "${toolchains[@]}"; do
         : $((nb++))
         toolchain="$(basename "${toolchainconfig}" .config)"
@@ -133,11 +134,12 @@ main() {
         (1) : $((nb_skip++)); printf "SKIPPED\n";;
         (2) : $((nb_fail++)); printf "FAILED\n";;
         (3) : $((nb_legal++)); printf "FAILED\n";;
+        (4) : $((nb_show++)); printf "FAILED\n";;
         esac
     done
 
-    printf "%d builds, %d skipped, %d build failed, %d legal-info failed\n" \
-        ${nb} ${nb_skip} ${nb_fail} ${nb_legal}
+    printf "%d builds, %d skipped, %d build failed, %d legal-info failed, %d show-info failed\n" \
+        ${nb} ${nb_skip} ${nb_fail} ${nb_legal} ${nb_show}
 
     return $((nb_fail + nb_legal))
 }
@@ -183,6 +185,20 @@ build_one() {
         return 3
     fi
 
+    # Validate that we generate proper json as show-info
+    { tput smso; printf '>>> Running show-info\n'; tput rmso; } >> "${dir}/logfile" 2> /dev/null;
+    JQ="$(which jq)"
+    if [ -z "${JQ}" ]; then
+        make O="${dir}" host-jq >> "${dir}/logfile" 2>&1
+        JQ="${dir}/host/bin/jq"
+    fi
+    if ! make O="${dir}" "${pkg:+${pkg}-}show-info" > "${dir}/info.json" 2>> "${dir}/logfile"; then
+        return 4
+    fi
+    if ! "${JQ}" . < "${dir}/info.json" >> "${dir}/logfile" 2>&1; then
+        return 4
+    fi
+
     # If we get here, the build was successful. Clean up the build/host
     # directories to save disk space, unless 'keep' was set.
     if [ ${keep} -ne 1 ]; then
-- 
2.25.1
