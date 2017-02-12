From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Feb 2017 16:00:01 +0100
Subject: [Buildroot] [git commit] support/test-pkg: report number and types
	of failures
Message-ID: <20170212150011.6866F82152@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5bf12ad141f5de02c79c04a773e7709b87070229
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/test-pkg | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
index d9ae5c5..a040ce1 100755
--- a/support/scripts/test-pkg
+++ b/support/scripts/test-pkg
@@ -6,6 +6,7 @@ TOOLCHAINS_URL='http://autobuild.buildroot.org/toolchains/configs/toolchain-conf
 main() {
     local o O opts
     local cfg dir pkg random toolchain
+    local ret nb nb_skip nb_fail
     local -a toolchains
 
     o='hc:d:p:r:'
@@ -63,9 +64,20 @@ main() {
         printf "error: no toolchain found (networking issue?)\n" >&2; exit 1
     fi
 
+    nb=0
+    nb_skip=0
+    nb_fail=0
     for toolchain in "${toolchains[@]}"; do
-        build_one "${dir}" "${toolchain}" "${cfg}" "${pkg}"
+        build_one "${dir}" "${toolchain}" "${cfg}" "${pkg}" && ret=0 || ret=${?}
+        case ${ret} in
+        (0) ;;
+        (1) : $((nb_skip++));;
+        (2) : $((nb_fail++));;
+        esac
+        : $((nb++))
     done
+
+    printf "%d builds, %d skipped, %d failed\n" ${nb} ${nb_skip} ${nb_fail}
 }
 
 build_one() {
@@ -85,7 +97,7 @@ build_one() {
 
     if ! curl -s "${url}" >"${dir}/.config"; then
         printf "FAILED\n"
-        return
+        return 2
     fi
 
     cat >>"${dir}/.config" <<-_EOF_
@@ -98,7 +110,7 @@ build_one() {
 
     if ! make O="${dir}" olddefconfig >/dev/null 2>&1; then
         printf "FAILED\n"
-        return
+        return 2
     fi
     # We want all the options from the snippet to be present as-is (set
     # or not set) in the actual .config; if one of them is not, it means
@@ -109,7 +121,7 @@ build_one() {
     comm -23 <(sort "${cfg}") <(sort "${dir}/.config") >"${dir}/missing.config"
     if [ -s "${dir}/missing.config" ]; then
         printf "SKIPPED\n"
-        return
+        return 1
     fi
     # Remove file, it's empty anyway.
     rm -f "${dir}/missing.config"
@@ -117,14 +129,14 @@ build_one() {
     if [ -n "${pkg}" ]; then
         if ! make O="${dir}" "${pkg}-dirclean" >> "${dir}/logfile" 2>&1; then
             printf "FAILED\n"
-            return
+            return 2
         fi
     fi
 
     # shellcheck disable=SC2086
     if ! make O="${dir}" ${pkg} >> "${dir}/logfile" 2>&1; then
         printf "FAILED\n"
-        return
+        return 2
     fi
 
     printf "OK\n"
