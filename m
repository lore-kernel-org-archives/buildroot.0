From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 6 Apr 2017 20:18:44 +0200
Subject: [Buildroot] [PATCH v5 04/13] support/test-pkg: run legal-info
In-Reply-To: <cover.1491502445.git.arnout@mind.be>
References: <cover.1491502445.git.arnout@mind.be>
Message-ID: <20170406181854.5242-4-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes v4 -> v5 by Arnout:
  - Reorder patch series
---
 docs/manual/adding-packages-tips.txt |  5 +++--
 support/scripts/test-pkg             | 15 +++++++++++++--
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index e1f6986724..d1eab2b440 100644
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
index 27601168b1..0d093e8c2f 100755
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
@@ -80,10 +81,12 @@ main() {
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
@@ -130,6 +133,14 @@ build_one() {
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
-- 
2.11.0
