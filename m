From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 23:03:28 +0200
Subject: [Buildroot] [git commit] test-pkg: get configs from in-tree
	toolchain-configs.csv
Message-ID: <20170725210435.4919D8022D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7b9afa70a2fe643ffc28151b382e41218a106b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now we have the toolchain config fragments in the buildroot directory
itself, it is no longer necessary to fetch it from the toolchain URL.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/test-pkg | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index 25a25e2..8c60649 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -1,7 +1,7 @@
 #!/usr/bin/env bash
 set -e
 
-TOOLCHAINS_URL='http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv'
+TOOLCHAINS_CSV='support/config-fragments/autobuild/toolchain-configs.csv'
 
 main() {
     local o O opts
@@ -50,8 +50,7 @@ main() {
     # Extract the URLs of the toolchains; drop internal toolchains
     # E.g.: http://server/path/to/name.config,arch,libc
     #  -->  http://server/path/to/name.config
-    toolchains=($(curl -s "${TOOLCHAINS_URL}" \
-                  |sed -r -e 's/,.*//; /internal/d;' \
+    toolchains=($(sed -r -e 's/,.*//; /internal/d;' "${TOOLCHAINS_CSV}" \
                   |if [ ${random} -gt 0 ]; then \
                       sort -R |head -n ${random}
                    else
@@ -71,7 +70,6 @@ main() {
     nb_legal=0
     for toolchainconfig in "${toolchains[@]}"; do
         : $((nb++))
-        # Using basename(1) on a URL works nicely
         toolchain="$(basename "${toolchainconfig}" .config)"
         build_dir="${dir}/${toolchain}"
         printf "%40s [%*d/%d]: " "${toolchain}" ${#nb_tc} ${nb} ${nb_tc}
@@ -90,17 +88,13 @@ main() {
 
 build_one() {
     local dir="${1}"
-    local url="${2}"
+    local toolchainconfig="${2}"
     local cfg="${3}"
     local pkg="${4}"
 
     mkdir -p "${dir}"
 
-    if ! curl -s "${url}" >"${dir}/.config"; then
-        return 2
-    fi
-
-    cat "support/config-fragments/minimal.config" "${cfg}" >>"${dir}/.config"
+    cat "${toolchainconfig}" "support/config-fragments/minimal.config" "${cfg}" >>"${dir}/.config"
 
     if ! make O="${dir}" olddefconfig > "${dir}/logfile" 2>&1; then
         return 2
