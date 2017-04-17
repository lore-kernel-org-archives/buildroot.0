From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Apr 2017 15:54:33 +0200
Subject: [Buildroot] [git commit] support/test-pkg: run legal-info
Message-ID: <20170418153601.625B482189@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37308b979af0037ea7f3c8cd0c0f1e12f1ffe52a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-tips.txt |  5 +++--
 support/scripts/test-pkg             | 15 +++++++++++++--
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index e1f6986..d1eab2b 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -93,9 +93,9 @@ $ ./support/scripts/test-pkg -c libcurl.config -p libcurl
                    br-arm-cortex-a9-musl [ 7/11]: FAILED
                    br-arm-cortex-m4-full [ 8/11]: OK
                              br-arm-full [ 9/11]: OK
-                    br-arm-full-nothread [10/11]: OK
+                    br-arm-full-nothread [10/11]: FAILED
                       br-arm-full-static [11/11]: OK
-11 builds, 2 skipped, 2 failed
+11 builds, 2 skipped, 2 build failed, 1 legal-info failed
 ----
 
 The results mean:
@@ -111,6 +111,7 @@ The results mean:
 * `FAILED`: the build failed. Inspect the +logfile+ file in the output
   build  directory to see what went wrong:
 ** the actual build failed,
+** the legal-info failed,
 ** one of the preliminary steps (downloading the config file, applying
    the configuration, running `dirclean` for the package) failed.
 
diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
index 7a0639f..f08c608 100755
--- a/support/scripts/test-pkg
+++ b/support/scripts/test-pkg
@@ -6,7 +6,7 @@ TOOLCHAINS_URL='http://autobuild.buildroot.org/toolchains/configs/toolchain-conf
 main() {
     local o O opts
     local cfg dir pkg random toolchain
-    local ret nb nb_skip nb_fail nb_tc build_dir
+    local ret nb nb_skip nb_fail nb_legal nb_tc build_dir
     local -a toolchains
 
     o='hc:d:p:r:'
@@ -68,6 +68,7 @@ main() {
     nb=0
     nb_skip=0
     nb_fail=0
+    nb_legal=0
     for toolchainconfig in "${toolchains[@]}"; do
         : $((nb++))
         # Using basename(1) on a URL works nicely
@@ -79,10 +80,12 @@ main() {
         (0) printf "OK\n";;
         (1) : $((nb_skip++)); printf "SKIPPED\n";;
         (2) : $((nb_fail++)); printf "FAILED\n";;
+        (3) : $((nb_legal++)); printf "FAILED\n";;
         esac
     done
 
-    printf "%d builds, %d skipped, %d failed\n" ${nb} ${nb_skip} ${nb_fail}
+    printf "%d builds, %d skipped, %d build failed, %d legal-info failed\n" \
+        ${nb} ${nb_skip} ${nb_fail} ${nb_legal}
 }
 
 build_one() {
@@ -131,6 +134,14 @@ build_one() {
     if ! make O="${dir}" ${pkg} >> "${dir}/logfile" 2>&1; then
         return 2
     fi
+
+    # legal-info done systematically, because some packages have different
+    # sources depending on the configuration (e.g. lua-5.2 vs. lua-5.3)
+    if [ -n "${pkg}" ]; then
+        if ! make O="${dir}" "${pkg}-legal-info" >> "${dir}/logfile" 2>&1; then
+            return 3
+        fi
+    fi
 }
 
 help() {
