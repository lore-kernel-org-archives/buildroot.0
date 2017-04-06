From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 6 Apr 2017 20:18:49 +0200
Subject: [Buildroot] [PATCH v5 09/13] support/test-pkg: add option to use an
	alternate toolchain directory
In-Reply-To: <cover.1491502445.git.arnout@mind.be>
References: <cover.1491502445.git.arnout@mind.be>
Message-ID: <20170406181854.5242-9-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For now, testing a package requires network access. However, there are
situations where everything is already cached locally (especially the
toolchains tarballs) and network is not available (e.g. in the train,
travelling back from FOSDEM...)

Alternatively, one may also want to test against a subset of the default
toolchains (e.g. the ones known to have a specific issue), or against
additional toolchains (e.g. the ones used within the company).

Add an option to use an alternate directory containing the defconfigs
of toolchains to try.

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Loosely based on http://patchwork.ozlabs.org/patch/728395/ but with a
directory instead of URL, and completely rewritten help text.
---
 support/scripts/test-pkg | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
index f86d266e6a..d7f5cbe8cf 100755
--- a/support/scripts/test-pkg
+++ b/support/scripts/test-pkg
@@ -5,16 +5,17 @@ TOOLCHAINS_DIR=configs/autobuild
 
 main() {
     local o O opts
-    local cfg dir pkg random toolchain
+    local cfg dir pkg random toolchains_dir toolchain
     local ret nb nb_skip nb_fail nb_legal nb_tc build_dir
     local -a toolchains
 
-    o='hc:d:p:r:'
-    O='help,config-snippet:build-dir:package:,random:'
+    o='hc:d:p:r:t:'
+    O='help,config-snippet:build-dir:package:,random:,toolchains-dir:'
     opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
     eval set -- "${opts}"
 
     random=0
+    toolchains_dir="${TOOLCHAINS_DIR}"
     while [ ${#} -gt 0 ]; do
         case "${1}" in
         (-h|--help)
@@ -32,6 +33,9 @@ main() {
         (-r|--random)
             random="${2}"; shift 2
             ;;
+        (-t|--toolchains-dir)
+            toolchains_dir="${2}"; shift 2
+            ;;
         (--)
             shift; break
             ;;
@@ -49,7 +53,7 @@ main() {
 
     # Find external toolchains
     # shellcheck disable=SC2011
-    toolchains=($(ls -1 "${TOOLCHAINS_DIR}"/*_defconfig \
+    toolchains=($(ls -1 "${toolchains_dir}"/*_defconfig 2>/dev/null \
                   |xargs -r grep -l -F -x "BR2_TOOLCHAIN_EXTERNAL=y" \
                   |if [ ${random} -gt 0 ]; then \
                       sort -R |head -n ${random}
@@ -149,7 +153,11 @@ specify a package (with -p), the package build dir will be removed first.
 The toolchains to try are retrieved from ${TOOLCHAINS_DIR}. This directory
 contains a defconfig file for each toolchain configuration used by the
 autobuilders. Only the external toolchains are tried, because building a
-Buildroot toolchain would take too long.
+Buildroot toolchain would take too long. An alternative directory
+containing defconfigs of toolchains to try can be specified with the -t
+option. These defconfigs should contain only the toolchain and architecture
+settings. Again, only defconfigs which specify an external toolchain will
+be tried.
 
 Options:
 
@@ -171,6 +179,10 @@ Options:
         Limit the tests to the N randomly selected toolchains, instead of
         building with all toolchains.
 
+    -t DIR, --toolchain-dir DIR
+        Directory containing defconfigs of toolchains to try. If not specified,
+        the toolchains in ${TOOLCHAINS_DIR} will be used.
+
 Example:
 
     Testing libcec would require a config snippet that contains:
-- 
2.11.0
