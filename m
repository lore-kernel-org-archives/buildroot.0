From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Feb 2017 21:15:28 +0100
Subject: [Buildroot] [PATCH 5/6] support/test-pkg: add option to use an
	alternate list of toolchains
In-Reply-To: <cover.1486584734.git.yann.morin.1998@free.fr>
References: <cover.1486584734.git.yann.morin.1998@free.fr>
Message-ID: <03ebcd068e7602bfbb059ed2c6759c8ba03819e9.1486584734.git.yann.morin.1998@free.fr>
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
toolchains (e.g. the ones known to have a specific issue).

Add an option to use an alternate URL, which can be remote or a path to
a local file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/scripts/test-pkg | 47 +++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 6 deletions(-)

diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
index 59c9f23..e77c804 100755
--- a/support/scripts/test-pkg
+++ b/support/scripts/test-pkg
@@ -5,16 +5,17 @@ TOOLCHAINS_URL='http://autobuild.buildroot.org/toolchains/configs/toolchain-conf
 
 main() {
     local o O opts
-    local cfg dir pkg random toolchain
+    local cfg dir pkg random url toolchain
     local ret nb_dl nb_cfg nb_skip nb_clean nb_build
     local -a toolchains
 
-    o='hc:d:p:r:'
-    O='help,config-snippet:build-dir:package:,random:'
+    o='hc:d:p:r:t:'
+    O='help,config-snippet:build-dir:package:,random:,toolchains:'
     opts="$( getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}"  )"
     eval set -- "${opts}"
 
     random=0
+    url="${TOOLCHAINS_URL}"
     while [ ${#} -gt 0 ]; do
         case "${1}" in
         (-h|--help)
@@ -32,6 +33,9 @@ main() {
         (-r|--random)
             random="${2}"; shift 2
             ;;
+        (-t|--toolchains)
+            url="${2}"; shift 2
+            ;;
         (--)
             shift; break
             ;;
@@ -44,10 +48,16 @@ main() {
         dir="${HOME}/br-test-pkg"
     fi
 
+    # Transform local paths to URI to make curl happy and simplify
+    # our code path
+    case "${url}" in
+    (/*)    url="file://${url}";;
+    esac
+
     # Extract the URLs of the toolchains; drop internal toolchains
     # E.g.: http://server/path/to/name.config,arch,libc
     #  -->  http://server/path/to/name.config
-    toolchains=( $( curl -s "${TOOLCHAINS_URL}" \
+    toolchains=( $( curl -s "${url}" \
                     |sed -r -e 's/,.*//; /internal/d;' \
                     |if [ ${random} -gt 0 ]; then \
                         sort -R |head -n ${random}
@@ -102,6 +112,12 @@ build_one() {
     local pkg="${4}"
     local toolchain line skip
 
+    # Transform local paths to URI to make curl happy and simplify
+    # our code path
+    case "${url}" in
+    (/*)    url="file://${url}";;
+    esac
+
     # Using basename(1) on a URL works nicely
     toolchain="$( basename "${url}" .config )"
 
@@ -179,8 +195,22 @@ In case failures are noticed, you can fix the package and just re-run the
 same command again; it will re-run the test where it failed. If you did
 specify a package (with -p), the package build dir will be removed first.
 
-The list of toolchains is retrieved from the Buildroot autobuilders, available
-at ${TOOLCHAINS_URL}.
+Unless specified with -t, the list of toolchains is retrieved from the
+Buildroot autobuilders, available at:
+    ${TOOLCHAINS_URL}
+
+The list of toolchains should contain the URLs to all toolchains, one per
+line, along with the architecture and C library used, separated by commas,
+"URL,ARCH,LIBC" (only the first field, URL, is used by this script). For
+example:
+
+    https://server/path/to/toolchain-1.config,arm,glibc
+    /path/to/local-toolchain.config,i386,musl
+
+The URL for each toolchain should point to a .config file that contains
+only the toolchain and architecture settings. URLs that contain the string
+'internal' are skipped, on the assumption that the configuration would
+build an internal toolchain (which takes a lot of time).
 
 Options:
 
@@ -202,6 +232,11 @@ Options:
         Limit the tests to the N randomly selected toolchains, instead of
         building with all toolchains.
 
+    -t URL, --toolchains URL
+        Use the toolchains described at URL instead of the toolchains used
+        by the Buildroot autobuilders (see above). URL can be a path to a
+        local file.
+
 Example:
 
     Testing libcec would require a config snippet that contains:
-- 
2.7.4
