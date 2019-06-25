From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Jun 2019 11:02:44 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] utils/test-pkg: clean
 output dir for successful builds
Message-ID: <20190625090301.373F388701@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c0b0018918fdc8915bbc90f2c9a962af749dabf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

test-pkg will use gigabytes of space when testing all toolchains.
Nevertheless, you are normally only interested in the actual build / host
tree when there is a build failure.

Do a 'make clean' for successful builds to save disk space, unless the new
option '-k/--keep' is set.
Note that the logfile and configuration is always retained for inspection.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 72bf48606cc5ccf5c48c631d265cbe52d8001a62)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/test-pkg | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index 8ffeea34f5..f3b34d5d0d 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -13,17 +13,18 @@ do_clean() {
 main() {
     local o O opts
     local cfg dir pkg random toolchains_csv toolchain all number mode
-    local ret nb nb_skip nb_fail nb_legal nb_tc build_dir
+    local ret nb nb_skip nb_fail nb_legal nb_tc build_dir keep
     local -a toolchains
     local pkg_br_name
 
-    o='hac:d:n:p:r:t:'
-    O='help,all,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
+    o='hakc:d:n:p:r:t:'
+    O='help,all,keep,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
     opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
     eval set -- "${opts}"
 
     random=0
     all=0
+    keep=0
     number=0
     mode=0
     toolchains_csv="${TOOLCHAINS_CSV}"
@@ -35,6 +36,9 @@ main() {
         (-a|--all)
             all=1; shift 1
             ;;
+        (-k|--keep)
+            keep=1; shift 1
+            ;;
         (-c|--config-snippet)
             cfg="${2}"; shift 2
             ;;
@@ -176,6 +180,12 @@ build_one() {
     if ! make O="${dir}" legal-info >> "${dir}/logfile" 2>&1; then
         return 3
     fi
+
+    # If we get here, the build was successful. Clean up the build/host
+    # directories to save disk space, unless 'keep' was set.
+    if [ ${keep} -ne 1 ]; then
+        make O="${dir}" clean >> "${dir}/logfile" 2>&1
+    fi
 }
 
 help() {
@@ -236,6 +246,11 @@ Options:
         try. If not specified, the toolchains in ${TOOLCHAINS_CSV} will be
         used.
 
+    -k, --keep
+        Keep the build directories even if the build succeeds.
+        Note: the logfile and configuration is always retained, even without
+        this option.
+
 Example:
 
     Testing libcec would require a config snippet that contains:
