From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 Jul 2017 03:05:24 +0200
Subject: [Buildroot] [PATCH v7 17/23] test-pkg: get configs from in-tree
	toolchain-configs.csv
In-Reply-To: <20170721010530.4747-1-arnout@mind.be>
References: <20170721010530.4747-1-arnout@mind.be>
Message-ID: <20170721010530.4747-18-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now we have the toolchain config fragments in the buildroot directory
itself, it is no longer necessary to fetch it from the toolchain URL.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
v7: Still use CSV file (instead of listing directory contents), but
    use the in-tree one. Don't bother adding an option to specify an
    alternative CSV file.
v6: Moved configs to support/config-fragments/autobuild
v5: first version
---
 utils/test-pkg | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index 25a25e2048..8c60649b32 100755
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
-- 
2.13.2
