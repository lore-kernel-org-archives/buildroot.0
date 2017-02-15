From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 Feb 2017 22:44:34 +0100
Subject: [Buildroot] [PATCH 6/7 v4] support/test-pkg: create build dir from
	caller
In-Reply-To: <cover.1487195062.git.yann.morin.1998@free.fr>
References: <cover.1487195062.git.yann.morin.1998@free.fr>
Message-ID: <c95566aac72dfc759141e65d4e84abb0dfbb54e4.1487195062.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/scripts/test-pkg | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
index d65cfe2..8435848 100755
--- a/support/scripts/test-pkg
+++ b/support/scripts/test-pkg
@@ -6,7 +6,7 @@ TOOLCHAINS_URL='http://autobuild.buildroot.org/toolchains/configs/toolchain-conf
 main() {
     local o O opts
     local cfg dir pkg random url toolchain
-    local ret nb nb_skip nb_fail nb_tc
+    local ret nb nb_skip nb_fail nb_tc build_dir
     local -a toolchains
 
     o='hc:d:p:r:t:'
@@ -85,9 +85,12 @@ main() {
     nb_fail=0
     for url in "${toolchains[@]}"; do
         : $((nb++))
-        printf "%40s [%*d/%d]: " "$(basename "${url}" .config)" \
-                                 ${#nb_tc} ${nb} ${nb_tc}
-        build_one "${dir}" "${url}" "${cfg}" "${pkg}" && ret=0 || ret=${?}
+        # Using basename(1) on a URL works nicely
+        toolchain="$(basename "${url}" .config)"
+        build_dir="${dir}/${toolchain}"
+        mkdir -p "${build_dir}"
+        printf "%40s [%*d/%d]: " "${toolchain}" ${#nb_tc} ${nb} ${nb_tc}
+        build_one "${build_dir}" "${url}" "${cfg}" "${pkg}" && ret=0 || ret=${?}
         case ${ret} in
         (0) printf "OK\n";;
         (1) : $((nb_skip++)); printf "SKIPPED\n";;
@@ -103,13 +106,6 @@ build_one() {
     local url="${2}"
     local cfg="${3}"
     local pkg="${4}"
-    local toolchain
-
-    # Using basename(1) on a URL works nicely
-    toolchain="$(basename "${url}" .config)"
-
-    dir="${dir}/${toolchain}"
-    mkdir -p "${dir}"
 
     if ! curl -s "${url}" >"${dir}/.config"; then
         return 2
-- 
2.7.4
