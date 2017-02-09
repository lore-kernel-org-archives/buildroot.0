From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 23:12:36 +0100
Subject: [Buildroot] [git commit] support/test-pkg: add option to limit the
	number of tests
Message-ID: <20170209221443.807E88216D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e7885d5f76f8068fa566344ba17721d049c42de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sometimes, it interesting to have a global overview of whether the
package builds at all or not, rather than test on all toolchains.

Add an option that allows testing on a limited set of randomly choosen
toolchains.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/test-pkg | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
index 5eeaf63..b867da8 100755
--- a/support/scripts/test-pkg
+++ b/support/scripts/test-pkg
@@ -5,14 +5,15 @@ TOOLCHAINS_URL='http://autobuild.buildroot.org/toolchains/configs/toolchain-conf
 
 main() {
     local o O opts
-    local cfg dir pkg toolchain
+    local cfg dir pkg random toolchain
     local -a toolchains
 
-    o='hc:d:p:'
-    O='help,config-snippet:build-dir:package:'
+    o='hc:d:p:r:'
+    O='help,config-snippet:build-dir:package:,random:'
     opts="$( getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}"  )"
     eval set -- "${opts}"
 
+    random=0
     while [ ${#} -gt 0 ]; do
         case "${1}" in
         (-h|--help)
@@ -27,6 +28,9 @@ main() {
         (-p|--package)
             pkg="${2}"; shift 2
             ;;
+        (-r|--random)
+            random="${2}"; shift 2
+            ;;
         (--)
             shift; break
             ;;
@@ -43,7 +47,12 @@ main() {
     # E.g.: http://server/path/to/name.config,arch,libc
     #  -->  http://server/path/to/name.config
     toolchains=( $( curl -s "${TOOLCHAINS_URL}" \
-                    |sed -r -e 's/,.*//; /internal/d;'
+                    |sed -r -e 's/,.*//; /internal/d;' \
+                    |if [ ${random} -gt 0 ]; then \
+                        sort -R |head -n ${random}
+                     else
+                        cat
+                     fi |sort
                   )
                )
 
@@ -159,6 +168,10 @@ Options:
         Test-build the package PKG, by running 'make PKG'; if not specified,
         just runs 'make'.
 
+    -r N, --random N
+        Limit the tests to the N randomly selected toolchains, instead of
+        building with all toolchains.
+
 Example:
 
     Testing libcec would require a config snippet that contains:
