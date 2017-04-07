From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 7 Apr 2017 13:16:16 +0200
Subject: [Buildroot] [PATCH v6 1/9] support/test-pkg: calculate toolchain
	name only once
In-Reply-To: <20170407111624.4629-1-arnout@mind.be>
References: <20170407111624.4629-1-arnout@mind.be>
Message-ID: <20170407111624.4629-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The toolchain name was calculated in main() for reporting to the user,
and again in build_one() for creating the build directory. Calculate
it only once, in main(), and pass the build directory as an argument
to build_one().

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changed v5 -> v6 by Arnout:
  - Don't move mkdir up to main().

Changes v4 -> v5 by Arnout:
  - Reword commit message
  - Reorder patch series
---
 support/scripts/test-pkg | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
index f9f994402d..7a0639f901 100755
--- a/support/scripts/test-pkg
+++ b/support/scripts/test-pkg
@@ -6,7 +6,7 @@ TOOLCHAINS_URL='http://autobuild.buildroot.org/toolchains/configs/toolchain-conf
 main() {
     local o O opts
     local cfg dir pkg random toolchain
-    local ret nb nb_skip nb_fail nb_tc
+    local ret nb nb_skip nb_fail nb_tc build_dir
     local -a toolchains
 
     o='hc:d:p:r:'
@@ -68,11 +68,13 @@ main() {
     nb=0
     nb_skip=0
     nb_fail=0
-    for toolchain in "${toolchains[@]}"; do
+    for toolchainconfig in "${toolchains[@]}"; do
         : $((nb++))
-        printf "%40s [%*d/%d]: " "$(basename "${toolchain}" .config)" \
-                                 ${#nb_tc} ${nb} ${nb_tc}
-        build_one "${dir}" "${toolchain}" "${cfg}" "${pkg}" && ret=0 || ret=${?}
+        # Using basename(1) on a URL works nicely
+        toolchain="$(basename "${toolchainconfig}" .config)"
+        build_dir="${dir}/${toolchain}"
+        printf "%40s [%*d/%d]: " "${toolchain}" ${#nb_tc} ${nb} ${nb_tc}
+        build_one "${build_dir}" "${toolchainconfig}" "${cfg}" "${pkg}" && ret=0 || ret=${?}
         case ${ret} in
         (0) printf "OK\n";;
         (1) : $((nb_skip++)); printf "SKIPPED\n";;
@@ -88,12 +90,7 @@ build_one() {
     local url="${2}"
     local cfg="${3}"
     local pkg="${4}"
-    local toolchain
 
-    # Using basename(1) on a URL works nicely
-    toolchain="$(basename "${url}" .config)"
-
-    dir="${dir}/${toolchain}"
     mkdir -p "${dir}"
 
     if ! curl -s "${url}" >"${dir}/.config"; then
-- 
2.11.0
