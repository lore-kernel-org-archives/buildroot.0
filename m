From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 7 Apr 2017 13:16:21 +0200
Subject: [Buildroot] [PATCH v6 6/9] support/test-pkg: add option to use an
	alternate toolchain directory
In-Reply-To: <20170407111624.4629-1-arnout@mind.be>
References: <20170407111624.4629-1-arnout@mind.be>
Message-ID: <20170407111624.4629-7-arnout@mind.be>
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

Add an option to use an alternate directory containing the config
fragments of toolchains to try.

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v6: s/defconfig/config fragment/g
v5: First version

Loosely based on http://patchwork.ozlabs.org/patch/728395/ but with a
directory instead of URL, and completely rewritten help text.
---
 support/scripts/test-pkg | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
index 7cffab63f6..2ac7aefac7 100755
--- a/support/scripts/test-pkg
+++ b/support/scripts/test-pkg
@@ -5,16 +5,17 @@ TOOLCHAINS_DIR=support/config-fragments/autobuild
 
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
-    toolchains=($(ls -1 "${TOOLCHAINS_DIR}"/*.config \
+    toolchains=($(ls -1 "${toolchains_dir}"/*.config \
                   |xargs -r grep -l -F -x "BR2_TOOLCHAIN_EXTERNAL=y" \
                   |if [ ${random} -gt 0 ]; then \
                       sort -R |head -n ${random}
@@ -151,7 +155,11 @@ specify a package (with -p), the package build dir will be removed first.
 The toolchains to try are retrieved from ${TOOLCHAINS_DIR}. This directory
 contains a config fragment for each toolchain configuration used by the
 autobuilders. Only the external toolchains are tried, because building a
-Buildroot toolchain would take too long.
+Buildroot toolchain would take too long. An alternative directory
+containing config fragments of toolchains to try can be specified with the -t
+option. These config fragments should contain only the toolchain and
+architecture settings. Again, only config fragments which specify an external
+toolchain will be tried.
 
 Options:
 
@@ -173,6 +181,10 @@ Options:
         Limit the tests to the N randomly selected toolchains, instead of
         building with all toolchains.
 
+    -t DIR, --toolchain-dir DIR
+        Directory containing config fragments of toolchains to try. If not
+        specified, the toolchains in ${TOOLCHAINS_DIR} will be used.
+
 Example:
 
     Testing libcec would require a config snippet that contains:
-- 
2.11.0
