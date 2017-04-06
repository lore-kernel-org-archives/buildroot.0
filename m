From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 6 Apr 2017 20:18:48 +0200
Subject: [Buildroot] [PATCH v5 08/13] support/test-pkg: get configs from
	buildroot defconfigs
In-Reply-To: <cover.1491502445.git.arnout@mind.be>
References: <cover.1491502445.git.arnout@mind.be>
Message-ID: <20170406181854.5242-8-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now we have the toolchain configs in the buildroot directory itself, it
is no longer necessary to fetch it from the toolchain URL.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/test-pkg | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
index 67f88ec380..f86d266e6a 100755
--- a/support/scripts/test-pkg
+++ b/support/scripts/test-pkg
@@ -1,7 +1,7 @@
 #!/bin/bash
 set -e
 
-TOOLCHAINS_URL='http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv'
+TOOLCHAINS_DIR=configs/autobuild
 
 main() {
     local o O opts
@@ -47,11 +47,10 @@ main() {
         dir="${HOME}/br-test-pkg"
     fi
 
-    # Extract the URLs of the toolchains; drop internal toolchains
-    # E.g.: http://server/path/to/name.config,arch,libc
-    #  -->  http://server/path/to/name.config
-    toolchains=($(curl -s "${TOOLCHAINS_URL}" \
-                  |sed -r -e 's/,.*//; /internal/d;' \
+    # Find external toolchains
+    # shellcheck disable=SC2011
+    toolchains=($(ls -1 "${TOOLCHAINS_DIR}"/*_defconfig \
+                  |xargs -r grep -l -F -x "BR2_TOOLCHAIN_EXTERNAL=y" \
                   |if [ ${random} -gt 0 ]; then \
                       sort -R |head -n ${random}
                    else
@@ -62,7 +61,7 @@ main() {
 
     nb_tc="${#toolchains[@]}"
     if [ ${nb_tc} -eq 0 ]; then
-        printf "error: no toolchain found (networking issue?)\n" >&2; exit 1
+        printf "error: no toolchain found\n" >&2; exit 1
     fi
 
     nb=0
@@ -72,7 +71,7 @@ main() {
     for toolchainconfig in "${toolchains[@]}"; do
         : $((nb++))
         # Using basename(1) on a URL works nicely
-        toolchain="$(basename "${toolchainconfig}" .config)"
+        toolchain="$(basename "${toolchainconfig}" _defconfig)"
         build_dir="${dir}/${toolchain}"
         mkdir -p "${build_dir}"
         printf "%40s [%*d/%d]: " "${toolchain}" ${#nb_tc} ${nb} ${nb_tc}
@@ -91,15 +90,11 @@ main() {
 
 build_one() {
     local dir="${1}"
-    local url="${2}"
+    local toolchainconfig="${2}"
     local cfg="${3}"
     local pkg="${4}"
 
-    if ! curl -s "${url}" >"${dir}/.config"; then
-        return 2
-    fi
-
-    cat "support/misc/minimal.config" "${cfg}" >>"${dir}/.config"
+    cat "${toolchainconfig}" "support/misc/minimal.config" "${cfg}" >>"${dir}/.config"
 
     if ! make O="${dir}" olddefconfig > "${dir}/logfile" 2>&1; then
         return 2
@@ -151,8 +146,10 @@ In case failures are noticed, you can fix the package and just re-run the
 same command again; it will re-run the test where it failed. If you did
 specify a package (with -p), the package build dir will be removed first.
 
-The list of toolchains is retrieved from the Buildroot autobuilders, available
-at ${TOOLCHAINS_URL}.
+The toolchains to try are retrieved from ${TOOLCHAINS_DIR}. This directory
+contains a defconfig file for each toolchain configuration used by the
+autobuilders. Only the external toolchains are tried, because building a
+Buildroot toolchain would take too long.
 
 Options:
 
-- 
2.11.0
