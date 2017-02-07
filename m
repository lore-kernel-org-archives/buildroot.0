From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  7 Feb 2017 14:53:00 +0100
Subject: [Buildroot] [PATCH 4/4] supprt/test-pkg: add option to limit the
	number of tests
In-Reply-To: <cover.1486475561.git.yann.morin.1998@free.fr>
References: <cover.1486475561.git.yann.morin.1998@free.fr>
Message-ID: <3a2dfc3a5dcf4389d2b65b91de95124385241a18.1486475561.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sometimes, it interesting to have a global overview of whether the
package builds at all or not, rather than test on all toolchains.

Add an option that allows testing on a limited set of randomly choosen
toolchains.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 support/scripts/test-pkg | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
index 604a759..0b4615d 100755
--- a/support/scripts/test-pkg
+++ b/support/scripts/test-pkg
@@ -5,15 +5,16 @@ TOOLCHAINS_BASE_URL='http://autobuild.buildroot.org/toolchains/configs'
 
 main() {
     local o O opts
-    local cfg dir pkg toolchain
+    local cfg dir pkg random toolchain
     local ret nb_dl nb_cfg nb_skip nb_clean nb_build
     local -a toolchains
 
-    o='hc:d:p:'
-    O='help,config-snippet:build-dir:package:'
+    o='hc:d:p:r:'
+    O='help,config-snippet:build-dir:package:,random::'
     opts="$( getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}"  )"
     eval set -- "${opts}"
 
+    random=0
     while [ ${#} -gt 0 ]; do
         case "${1}" in
         (-h|--help)
@@ -28,6 +29,9 @@ main() {
         (-p|--package)
             pkg="${2}"; shift 2
             ;;
+        (-r|--random)
+            random="${2}"; shift 2
+            ;;
         (--)
             shift; break
             ;;
@@ -43,7 +47,10 @@ main() {
     # Extract the names of the toolchains
     # http://server/path/to/name.config,arch,libc  -->  name
     toolchains=( $( curl -s "${TOOLCHAINS_BASE_URL}/toolchain-configs.csv" \
-                    |sed -r -e 's/,.*//; s:.*/(.*)\.config:\1:; /internal/d;'
+                    |sed -r -e 's/,.*//; s:.*/(.*)\.config:\1:; /internal/d;' \
+                    |if [ ${random} -gt 0 ]; then \
+                        sort -R |head -n ${random} |sort
+                     fi
                   )
                )
 
@@ -187,6 +194,10 @@ Options
         Test-build the package PKG, by running 'make PKG'; if not specified,
         just runs 'make'.
 
+    -r N, --random N
+        Limit the tests to the N randomly selected toolchains, instead of
+        building all.
+
 Example:
 
     Testing libcec would require a config snippet that contains:
-- 
2.7.4
